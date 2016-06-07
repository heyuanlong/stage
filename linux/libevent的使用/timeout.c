#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#ifdef _EVENT_HAVE_SYS_TIME_H
#include <sys/time.h>
#endif
#include <stdio.h>
#include <event2/event.h>
#include <event2/event_struct.h>
#include <event2/util.h>

struct timeval lasttime;
int eip;
static void timeout_cb(evutil_socket_t fd,short event,void *arg)
{
	struct timeval newtime,difference;
	struct event *timeoutev=arg;
	double elapsed;

	evutil_gettimeofday(&newtime, NULL);
    evutil_timersub(&newtime, &lasttime, &difference);
    elapsed = difference.tv_sec +
        (difference.tv_usec / 1.0e6);

    printf("timeout_cb called at %d': %.3f seconds elapsed.\n",
        (int)newtime.tv_sec, elapsed);
    lasttime = newtime;
//  /* 启动此测试程序时,不加-p参数,使用以下代码也可实现相同功能 */
//    struct timeval tv;
//    evutil_timerclear(&tv);
//    tv.tv_sec = 1;
//    event_add(timeout, &tv);    //再次添加定时事件
}    

int main(int argc, char const *argv[])
{
	struct event timeoutev;
	struct timeval tv;
	struct event_base *base;
	int flags;

	 if (argc == 2 && !strcmp(argv[1], "-p")) {
        eip = 1;
        flags = EV_PERSIST;        //使得事件具有持久性(否则事件只会调度一次)
    } else {
        eip = 0;
        flags = 0;
    }

    base = event_base_new();///事件总管
    event_assign(&timeoutev,base,-1,flags,timeout_cb,(void*)&timeoutev);//事件绑定回调函数
    evutil_timerclear(&tv);
    tv.tv_sec = 1;
    event_add(&timeoutev,&tv);//加入事件总管
    evutil_gettimeofday(&lasttime,NULL);

    event_base_dispatch(base);

	return 0;
}