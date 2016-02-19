#include "server.h"

#define EPOLL_SIZE 1024


int main(int argc, char const *argv[])
{
	setsignal();//捕捉SIGPIPE,并忽略它。  服务端禁止出现PIPE错误
	SetSocketNonblock(STDIN_FILENO);///非阻塞读取终端数据，如何读？
	int port = atoi(argv[1]);
	//int port=6669;
	int serversocket = InitServerSocket(port);
    int online=0;
	int epoll_fd = epoll_create(1);
	if (-1 == epoll_fd){
		perror("epoll init");
		exit(1);
	}

	struct epoll_event EventTemp,EventReady[EPOLL_SIZE-1];
	struct epoll_event ServerEpollEvent;

	ServerEpollEvent.events = EPOLLIN | EPOLLET;
	ServerEpollEvent.data.fd = serversocket;
	if (epoll_ctl(epoll_fd,EPOLL_CTL_ADD,serversocket,&ServerEpollEvent) == -1){
		close(epoll_fd);
		perror("epoll_ctl");
		exit(1);
	}
	++online;

	int EventReadyNums;
	int acceptclient;
	while(1){
		EventReadyNums = epoll_wait(epoll_fd,EventReady,EPOLL_SIZE,-1);
		for (int i = 0; i < EventReadyNums; ++i){
			if ( !(EventReady[i].events & EPOLLIN) && !(EventReady[i].events & EPOLLOUT))continue;

			if (EventReady[i].data.fd == serversocket){//accept
				acceptclient = accept(serversocket,NULL,NULL);
				if (-1 == acceptclient){
					close(epoll_fd);
					perror("accept");
					exit(1);
				}
				SetSocketNonblock(acceptclient);//设置为非阻塞

				EventTemp.events=EPOLLIN | EPOLLOUT;//  | EPOLLET为什么这里得非边缘触发才可以不断发生EPOLLOUT？？？？？？？？？？？？？
				EventTemp.data.fd=acceptclient;
				if(++online == EPOLL_SIZE)
					write(STDOUT_FILENO,"more than EPOLL_SIZE\n",strlen("more than  EPOLL_SIZE\n")); 
				if(epoll_ctl(epoll_fd,EPOLL_CTL_ADD,acceptclient,&EventTemp) == -1){
					close(epoll_fd);
					perror("accept");
					exit(1);
				}
				printf("%d\n", acceptclient);
				write(STDOUT_FILENO,"a new client online\n",strlen("a new client online\n"));
			}
			else{
				if(EventReady[i].events & EPOLLIN){
					const int BUFSIZE = 10240;
					char readbuf[BUFSIZE];
					memset(readbuf,0,BUFSIZE);

					int num = ReadDate(EventReady[i].data.fd,readbuf,BUFSIZE);
					if ( 0 == num)
					{
						close(EventReady[i].data.fd);
						epoll_ctl(epoll_fd,EPOLL_CTL_DEL,EventReady[i].data.fd,NULL);
						write(STDOUT_FILENO,"a client exit\n",strlen("a client exit\n")); 
					}
					else if( -1 == num)
					{
						close(EventReady[i].data.fd);
						epoll_ctl(epoll_fd,EPOLL_CTL_DEL,EventReady[i].data.fd,NULL);
						write(STDOUT_FILENO,"a client errno\n",strlen("a client errno\n")); 
					}


					
				}
				else if(EventReady[i].events & EPOLLOUT){//应该设置发给那个客户端！！！
					const int SENDBUFSIZE = 10240;
					char sendbuf[SENDBUFSIZE];
					memset(sendbuf,0,SENDBUFSIZE);
					ssize_t len = read(STDIN_FILENO,sendbuf,10240);//从终端读取，
					/*if( strncmp(sendbuf,"exit",4) == 0 ){
						close(EventReady[i].data.fd);
						sleep(20);
					}*/
					ssize_t sendnum = 0;				
					char  *temp =sendbuf;
					while(len > 0){
						sendnum = send(EventReady[i].data.fd,temp,len,0);//服务端中断后，第一次发送时sendnum不等于0，第二次发送时就会出现sigpipe错误。
						temp +=sendnum;
						len -=sendnum;		
					}
					
				}
				

			}
		}
	}

	close(epoll_fd);
	close(serversocket);
	return 0;
}
int InitServerSocket(int port)
{
	const int LISTEN_NUM = 128;
	int serversocket=socket(AF_INET,SOCK_STREAM,0);
	if (-1 == serversocket){
		perror("server socket");
		exit(10);
	}
	struct sockaddr_in saddr;
	bzero(&saddr,sizeof(saddr));

	saddr.sin_family=AF_INET;
	saddr.sin_port=htons(port);
	saddr.sin_addr.s_addr=htonl(INADDR_ANY);

    int val=1;//设为可重用
    int ss=setsockopt(serversocket,SOL_SOCKET,SO_REUSEADDR,(const void*)&val,sizeof(int));
    if(-1 == ss){
    	close(serversocket);
		perror("setsockopt");
		exit(1);
    }

	if ( bind(serversocket,(struct sockaddr*)&saddr,sizeof(struct sockaddr)) == -1){
		close(serversocket);
		perror("server bind");
		exit(1);
	}
    
    if(listen(serversocket,LISTEN_NUM) == -1){
 		close(serversocket);
		perror("server bind");
		exit(1);  	
    }
    SetSocketNonblock(serversocket);
    return serversocket;
}

void SetSocketNonblock(int fd)
{
	int s;
	s = fcntl(fd,F_SETFL,fcntl(fd,F_GETFL,0) | O_NONBLOCK);
	if(-1 ==s ){
		perror("set fd nonblock");
		exit(1);
	}
}

int ReadDate(int fd,char *buf,int num)
{
	ssize_t nread;
	int havenum=0;

	while(1){
		if ( (nread = recv(fd,buf,num,0)) < 0 )
		{
			if (errno == EWOULDBLOCK || errno == EAGAIN)//被中断或没有读到数据
			    return havenum;//刚开始这里使用continue，是不行的
			else //
				return -1;
		}
		else if(nread == 0)
			return havenum;
		else//接收到数据
		{
			write(STDOUT_FILENO,buf,nread);
			havenum +=nread;
		}
	}

}


void setsignal()
{

    struct sigaction actionpipe;
    actionpipe.sa_handler=SIG_IGN;
    sigemptyset(&actionpipe.sa_mask);
    actionpipe.sa_flags=0;
    sigaction(SIGPIPE,&actionpipe,0);

}




