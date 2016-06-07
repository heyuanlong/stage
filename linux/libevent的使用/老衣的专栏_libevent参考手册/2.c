��ͬ�Ĳ���ϵͳΪselect�ṩ�˲�ͬ��������ܣ�����poll��epoll��kqueue��evports��/dev/poll����Щ���������ܶ���select�ߣ����ҳ���poll֮�⣬��ӡ�ɾ���׽��ֺ�֪ͨ�׽����Ѿ�׼����IO�����ܶ���O��1����
���ҵ��ǣ���Щ�ӿڶ����Ǳ�׼�ġ�Linux��epoll��BSD������Darwin����kqueue��Solaris��evports��/dev/poll������Ȼ��û���ĸ�����ϵͳ������ϵͳ��ӵ�еĵ��á����ԣ�������д����ֲ�ĸ������첽Ӧ�ã�����Ҫһ����װ������Щ�ӿڵĳ����ṩ��Щ������������ߵ�һ����ʹ�á�
�����Libevent API��ײ����������顣LibeventΪ����select����ṩ��һ�µĽӿڣ�ʹ���������ڵļ�����ϵ����Ч�汾��
��������һ���汾���첽ROT13�������������Libevent 2������select��ע��fd_sets�Ѿ���������������ǣ����¼���ṹ��event_base�������߶Ͽ����������������select��poll��epoll����kqueueʵ�ֵġ�
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
 
��������Ҫע��������ط���ʹ��evutil_socket_t����int�������׽��֣�����evutil_make_socket_nonblocking�����׽�������Ϊ�첽�ģ������ǵ���fcntl��O_NONBLOCK������ʹ�ô��������Win32����API��
ʹ���Ƿ��ݣ�������Windows�أ���

�����ע�⵽����Ч�ʸ����ˣ�����Ҳ�������ˡ�ʹ��fork��ʱ�򣬣�1������ҪΪÿ�����ӹ�������������ÿ������ʹ��һ����������ջ�Ϸ���Ļ���������2������Ҫ��ʽ����ÿ���׽����Ƿ��ڶ�ȡ����д�룺�������ڴ������ˡ���3��Ҳ����Ҫ����ÿ�������Ƿ���ɵĽṹ�壺ֻ��Ҫѭ����ջ������
���⣬�����Windows�����к�������飬�㽫��ʶ����������ʾ����ʱ��Libevent������ȡ���Ż������ܡ���Windows�Ͻ��п����첽IO�ķ�������ʹ��select�ӿڣ�����ʹ��IOCP����������������API��ͬ���ǣ�IOCP�������׽����Ѿ�׼����ĳ�ֲ���ʱ֪ͨ����Ȼ�������Խ�����Ӧ�Ĳ�����������ǣ������֪Windows����ջ����ĳ���������IOCP�ڲ������ʱ֪ͨ����
���˵��ǣ�Libevent 2 �ġ�bufferevent���ӿڽ����������Щ���⣺���ṩ����Libevent��Windows��Unix�϶��ܹ���Чʵ�ֵĽӿڣ��ó����д���򵥡�
�������һ���汾��ROT13��ʹ��bufferevent API��
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