
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

static int n_calls = 0;

void cb_func(evutil_socket_t fd, short what, void *arg)
{
    struct event **pev = arg;
    struct event *me = *pev;

    printf("cb_func called %d times so far.\n", ++n_calls);

    if (n_calls > 3){
        n_calls=0;
        printf("3333333");
       event_del(me);
       struct timeval one_sec = { 1, 0 };
       event_add(me, &one_sec);
   }
}

void run(struct event_base *base)
{
    struct timeval one_sec = { 1, 0 };
    struct event *ev;
    /* We're going to set up a repeating timer to get called called 100
       times. */
    
    ev = event_new(base, -1, EV_PERSIST, cb_func, (void*)(&ev));
    
    event_add(ev, &one_sec);
    event_base_dispatch(base);
}

int main(int argc, char const *argv[])
{
    struct event_base *base;
    base = event_base_new();

    run(base);
    return 0;
}