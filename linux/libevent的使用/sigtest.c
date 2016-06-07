/*
 * Compile with:
 *  gcc libe_signal_test.c -o libe_signal_test -I/usr/local/include -L/usr/local/lib -levent
 */
#include <signal.h>
#include <stdio.h>
#include <event.h>
#include <event2/event.h>
#ifdef _EVENT___func__
#define __func__ _EVENT___func__
#endif

//int called = 0;

static void signal_cb(evutil_socket_t fd,short event,void *arg)
{
	struct event *signalev = (struct event *)arg;
	sleep(5);
	printf("%s: got signal %d\n",__func__,EVENT_SIGNAL(signalev) );

}

int main(int argc, char const *argv[])
{
	struct event signalev;
	struct event_base *base;
	base=event_base_new();
	event_assign(&signalev,base,SIGUSR1,EV_SIGNAL | EV_PERSIST,signal_cb,(void*)&signalev);
	event_add(&signalev,NULL);
	event_base_dispatch(base);

	event_base_free(base);
	printf("end of main\n");


	return 0;
}

/*

启动进程：

[lgh@localhost test]$ ./libe_signal_test &

[1] 2998

用kill -10 2998命令给进程发送信号SIGUSR1，进程的的执行结果如下：

[lgh@localhost test]$ kill -10 2998

[lgh@localhost test]$ kill -10 2998

signal_cb: got signal 10

 [lgh@localhost test]$ kill -10 2998

signal_cb: got signal 10

[lgh@localhost test]$ signal_cb: got signal 10

给进程发送了3次SIGUSR1信号，信号回调函数执行了三次（其中最后一行隔了几秒才打印出来）。这说明libevent对linux中的不可靠信号也是支持排队的。
*/