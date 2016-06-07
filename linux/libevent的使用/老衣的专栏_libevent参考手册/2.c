不同的操作系统为select提供了不同的替代功能，包括poll、epoll、kqueue、evports和/dev/poll。这些函数的性能都比select高，而且除了poll之外，添加、删除套接字和通知套接字已经准备好IO的性能都是O（1）。
不幸的是，这些接口都不是标准的。Linux有epoll、BSD（包括Darwin）有kqueue、Solaris有evports和/dev/poll……，然而没有哪个操作系统有其他系统所拥有的调用。所以，如果想编写可移植的高性能异步应用，就需要一个封装所有这些接口的抽象，提供这些调用中性能最高的一个供使用。
这就是Libevent API最底层所做的事情。Libevent为各种select替代提供了一致的接口，使用所运行在的计算机上的最高效版本。
下面是另一个版本的异步ROT13服务器。这次用Libevent 2代替了select。注意fd_sets已经被抛弃：替代的是，将事件与结构体event_base关联或者断开关联，这可能是用select、poll、epoll或者kqueue实现的。
Example: A low-level ROT13 server with Libevent
/* For sockaddr_in */
#include <netinet/in.h>
/* For socket functions */
#include <sys/socket.h>
/* For fcntl */
#include <fcntl.h>
 
#include <event2/event.h>
 
#include <assert.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
 
#define MAX_LINE 16384
 
void do_read(evutil_socket_t fd, short events, void *arg);
void do_write(evutil_socket_t fd, short events, void *arg);
 
char
rot13_char(char c)
{
    /* We don't want to use isalpha here; setting the locale would change
     * which characters are considered alphabetical. */
    if ((c >= 'a' && c <= 'm') || (c >= 'A' && c <= 'M'))
        return c + 13;
    else if ((c >= 'n' && c <= 'z') || (c >= 'N' && c <= 'Z'))
        return c - 13;
    else
        return c;
}
 
struct fd_state {
    char buffer[MAX_LINE];
    size_t buffer_used;
 
    size_t n_written;
    size_t write_upto;
 
    struct event *read_event;
    struct event *write_event;
};
 
struct fd_state *
alloc_fd_state(struct event_base *base, evutil_socket_t fd)
{
    struct fd_state *state = malloc(sizeof(struct fd_state));
    if (!state)
        return NULL;
    state->read_event = event_new(base, fd, EV_READ|EV_PERSIST, do_read, state);
    if (!state->read_event) {
        free(state);
        return NULL;
    }
    state->write_event =
        event_new(base, fd, EV_WRITE|EV_PERSIST, do_write, state);
 
    if (!state->write_event) {
        event_free(state->read_event);
        free(state);
        return NULL;
    }
 
    state->buffer_used = state->n_written = state->write_upto = 0;
 
    assert(state->write_event);
    return state;
}
 
void
free_fd_state(struct fd_state *state)
{
    event_free(state->read_event);
    event_free(state->write_event);
    free(state);
}
 
void
do_read(evutil_socket_t fd, short events, void *arg)
{
    struct fd_state *state = arg;
    char buf[1024];
    int i;
    ssize_t result;
    while (1) {
        assert(state->write_event);
        result = recv(fd, buf, sizeof(buf), 0);
        if (result <= 0)
            break;
 
        for (i=0; i < result; ++i)  {
            if (state->buffer_used < sizeof(state->buffer))
                state->buffer[state->buffer_used++] = rot13_char(buf[i]);
            if (buf[i] == '/n') {
                assert(state->write_event);
                event_add(state->write_event, NULL);
                state->write_upto = state->buffer_used;
            }
        }
    }
 
    if (result == 0) {
        free_fd_state(state);
    } else if (result < 0) {
        if (errno == EAGAIN) // XXXX use evutil macro
            return;
        perror("recv");
        free_fd_state(state);
    }
}
 
void
do_write(evutil_socket_t fd, short events, void *arg)
{
    struct fd_state *state = arg;
 
    while (state->n_written < state->write_upto) {
        ssize_t result = send(fd, state->buffer + state->n_written,
                              state->write_upto - state->n_written, 0);
        if (result < 0) {
            if (errno == EAGAIN) // XXX use evutil macro
                return;
            free_fd_state(state);
            return;
        }
        assert(result != 0);
 
        state->n_written += result;
    }
 
    if (state->n_written == state->buffer_used)
        state->n_written = state->write_upto = state->buffer_used = 1;
 
    event_del(state->write_event);
}
 
void
do_accept(evutil_socket_t listener, short event, void *arg)
{
    struct event_base *base = arg;
    struct sockaddr_storage ss;
    socklen_t slen = sizeof(ss);
    int fd = accept(listener, (struct sockaddr*)&ss, &slen);
    if (fd < 0) { // XXXX eagain??
        perror("accept");
    } else if (fd > FD_SETSIZE) {
        close(fd); // XXX replace all closes with EVUTIL_CLOSESOCKET */
    } else {
        struct fd_state *state;
        evutil_make_socket_nonblocking(fd);
        state = alloc_fd_state(base, fd);
        assert(state); /*XXX err*/
        assert(state->write_event);
        event_add(state->read_event, NULL);
    }
}
 
void
run(void)
{
    evutil_socket_t listener;
    struct sockaddr_in sin;
    struct event_base *base;
    struct event *listener_event;
 
    base = event_base_new();
    if (!base)
        return; /*XXXerr*/
 
    sin.sin_family = AF_INET;
    sin.sin_addr.s_addr = 0;
    sin.sin_port = htons(40713);
 
    listener = socket(AF_INET, SOCK_STREAM, 0);
    evutil_make_socket_nonblocking(listener);
 
#ifndef WIN32
    {
        int one = 1;
        setsockopt(listener, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
    }
#endif
 
    if (bind(listener, (struct sockaddr*)&sin, sizeof(sin)) < 0) {
        perror("bind");
        return;
    }
 
    if (listen(listener, 16)<0) {
        perror("listen");
        return;
    }
 
    listener_event = event_new(base, listener, EV_READ|EV_PERSIST, do_accept, (void*)base);
    /*XXX check it */
    event_add(listener_event, NULL);
 
    event_base_dispatch(base);
}
 
int
main(int c, char **v)
{
    setvbuf(stdout, NULL, _IONBF, 0);
 
    run();
    return 0;
}
 
（代码需要注意的其他地方：使用evutil_socket_t代替int来代表套接字；调用evutil_make_socket_nonblocking来将套接字设置为异步的，而不是调用fcntl（O_NONBLOCK）。这使得代码兼容于Win32网络API）
使用是否便捷？（还有Windows呢？）

你可能注意到代码效率更高了，但是也更复杂了。使用fork的时候，（1）不需要为每个连接管理缓冲区：仅对每个进程使用一个单独的在栈上分配的缓冲区。（2）不需要显式跟踪每个套接字是否在读取或者写入：这隐藏在代码中了。（3）也不需要跟踪每个操作是否完成的结构体：只需要循环和栈变量。
此外，如果对Windows网络有很深的体验，你将认识到用于上述示例的时候，Libevent并不能取得优化的性能。在Windows上进行快速异步IO的方法不是使用select接口：而是使用IOCP。与其他快速网络API不同的是，IOCP不是在套接字已经准备好某种操作时通知程序，然后程序可以进行相应的操作。替代的是，程序告知Windows网络栈启动某网络操作，IOCP在操作完成时通知程序。
幸运的是，Libevent 2 的“bufferevent”接口解决了所有这些问题：它提供了让Libevent在Windows和Unix上都能够有效实现的接口，让程序编写更简单。
这是最后一个版本的ROT13，使用bufferevent API：
Example: A simpler ROT13 server with Libevent
/* For sockaddr_in */
#include <netinet/in.h>
/* For socket functions */
#include <sys/socket.h>
/* For fcntl */
#include <fcntl.h>
 
#include <event2/event.h>
#include <event2/buffer.h>
#include <event2/bufferevent.h>
 
#include <assert.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
 
#define MAX_LINE 16384
 
void do_read(evutil_socket_t fd, short events, void *arg);
void do_write(evutil_socket_t fd, short events, void *arg);
 
char
rot13_char(char c)
{
    /* We don't want to use isalpha here; setting the locale would change
     * which characters are considered alphabetical. */
    if ((c >= 'a' && c <= 'm') || (c >= 'A' && c <= 'M'))
        return c + 13;
    else if ((c >= 'n' && c <= 'z') || (c >= 'N' && c <= 'Z'))
        return c - 13;
    else
        return c;
}
 
void
readcb(struct bufferevent *bev, void *ctx)
{
    struct evbuffer *input, *output;
    char *line;
    size_t n;
    int i;
    input = bufferevent_get_input(bev);
    output = bufferevent_get_output(bev);
 
    while ((line = evbuffer_readln(input, &n, EVBUFFER_EOL_LF))) {
        for (i = 0; i < n; ++i)
            line[i] = rot13_char(line[i]);
        evbuffer_add(output, line, n);
        evbuffer_add(output, "/n", 1);
        free(line);
    }
 
    if (evbuffer_get_length(input) >= MAX_LINE) {
        /* Too long; just process what there is and go on so that the buffer
         * doesn't grow infinitely long. */
        char buf[1024];
        while (evbuffer_get_length(input)) {
            int n = evbuffer_remove(input, buf, sizeof(buf));
            for (i = 0; i < n; ++i)
                buf[i] = rot13_char(buf[i]);
            evbuffer_add(output, buf, n);
        }
        evbuffer_add(output, "/n", 1);
    }
}
 
void
errorcb(struct bufferevent *bev, short error, void *ctx)
{
    if (error & BEV_EVENT_EOF) {
        /* connection has been closed, do any clean up here */
        /* ... */
    } else if (error & BEV_EVENT_ERROR) {
        /* check errno to see what error occurred */
        /* ... */
    } else if (error & BEV_EVENT_TIMEOUT) {
        /* must be a timeout event handle, handle it */
        /* ... */
    }
    bufferevent_free(bev);
}
 
void
do_accept(evutil_socket_t listener, short event, void *arg)
{
    struct event_base *base = arg;
    struct sockaddr_storage ss;
    socklen_t slen = sizeof(ss);
    int fd = accept(listener, (struct sockaddr*)&ss, &slen);
    if (fd < 0) {
        perror("accept");
    } else if (fd > FD_SETSIZE) {
        close(fd);
    } else {
        struct bufferevent *bev;
        evutil_make_socket_nonblocking(fd);
        bev = bufferevent_socket_new(base, fd, BEV_OPT_CLOSE_ON_FREE);
        bufferevent_setcb(bev, readcb, NULL, errorcb, NULL);
        bufferevent_setwatermark(bev, EV_READ, 0, MAX_LINE);
        bufferevent_enable(bev, EV_READ|EV_WRITE);
    }
}
 
void
run(void)
{
    evutil_socket_t listener;
    struct sockaddr_in sin;
    struct event_base *base;
    struct event *listener_event;
 
    base = event_base_new();
    if (!base)
        return; /*XXXerr*/
 
    sin.sin_family = AF_INET;
    sin.sin_addr.s_addr = 0;
    sin.sin_port = htons(40713);
 
    listener = socket(AF_INET, SOCK_STREAM, 0);
    evutil_make_socket_nonblocking(listener);
 
#ifndef WIN32
    {
        int one = 1;
        setsockopt(listener, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
    }
#endif
 
    if (bind(listener, (struct sockaddr*)&sin, sizeof(sin)) < 0) {
        perror("bind");
        return;
    }
 
    if (listen(listener, 16)<0) {
        perror("listen");
        return;
    }
 
    listener_event = event_new(base, listener, EV_READ|EV_PERSIST, do_accept, (void*)base);
    /*XXX check it */
    event_add(listener_event, NULL);
 
    event_base_dispatch(base);
}
 
int
main(int c, char **v)
{
    setvbuf(stdout, NULL, _IONBF, 0);
 
    run();
    return 0;
}