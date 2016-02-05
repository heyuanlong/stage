#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <errno.h>
#include <string.h>
#include <sys/epoll.h>
#include <stdlib.h>
#include <signal.h>
#include <fcntl.h>


// Many  file  systems  and  disks  were  considered to be fast enough that the implementation of O_NONBLOCK was deemed unnecessary.  So,O_NONBLOCK may not be available on files and/or disks.

/*
 ssize_t sendto(int sockfd, const void *buf, size_t len, int flags,
                      const struct sockaddr *dest_addr, socklen_t addrlen);

ssize_t recvfrom(int sockfd, void *buf, size_t len, int flags,
                        struct sockaddr *src_addr, socklen_t *addrlen);

*/

//发送完数据就返回
int setNotbolck(int sockfd);
int udpSend(int sockfd,const char *ip,const int port,const void *buf,const int len,int flags);
int udpSend(int sockfd,const void *buf,const int len,int flags,const struct sockaddr * addr,socklen_t addrlen);

//收到一个包的数据就应该返回
//服务端的recv的socket要先bind。
//而客户端的是不用的。
int udpRecv(int sockfd, void *buf, int len,int flags);
int udpRecv(int sockfd,void *buf, int len,int flags,struct sockaddr* pt_addr,socklen_t* pt_addrlen);



/*
设置void 为void
*/
int setNotbolck(int sockfd)
{
	return fcntl(sockfd,F_SETFL,fcntl(sockfd,F_GETFL,0) | O_NONBLOCK);
}
int udpSend(int sockfd,const char *ip,const int port,const void *buf,const int len,int flags)
{
	struct sockaddr_in addr;
	bzero(&addr,sizeof(addr));
	addr.sin_family=AF_INET;
	addr.sin_port=htons(port);
	if (ip == NULL)
		addr.sin_addr.s_addr = htonl(INADDR_ANY);
	else
		addr.sin_addr.s_addr=inet_addr(ip);
	socklen_t addrlen = sizeof(addr);

	const void * ptr = buf;
	int nlen = len;
	int nsend = 0;

	while(nlen > 0)
	{	//EAGAIN or EWOULDBLOCK
		nsend=sendto(sockfd,ptr,nlen,flags,(struct sockaddr*)&addr,addrlen);
		if (nsend < 0)
		{
			if (errno == EINTR)//被中断了
				nsend = 0;//这里可以改为continue
			else if(errno == EAGAIN || errno == EWOULDBLOCK)  //如果是异步的
				break;
			else
				return -1;
		}
		else if(nsend == 0)
			break;

		nlen -=nsend;
		ptr += nsend;
	}
	return len - nlen;
}
int udpSend(int sockfd,const void *buf,const int len,int flags,const struct sockaddr * addr,socklen_t addrlen)
{

	const void * ptr = buf;
	int nlen = len;
	int nsend = 0;

	while(nlen > 0)
	{	//EAGAIN or EWOULDBLOCK
		nsend=sendto(sockfd,ptr,nlen,flags,addr,addrlen);
		if (nsend < 0)
		{
			if (errno == EINTR)//被中断了
				nsend = 0;//这里可以改为continue
			else if(errno == EAGAIN || errno == EWOULDBLOCK)  //如果是异步的
				break;
			else
				return -1;
		}
		else if(nsend == 0)
			break;

		nlen -=nsend;
		ptr += nsend;
	}
	return len - nlen;
}

int udpRecv(int sockfd, void *buf, int len,int flags)
{

	int nrecv = 0;
	

	while( len > 0 )
	{
		nrecv = recvfrom(sockfd,buf,len,flags,NULL,NULL);
		if(nrecv < 0)
		{
			if (errno == EINTR)//被中断
				continue;
			else if(errno == EAGAIN || errno == EWOULDBLOCK)  //如果是异步的
				return 0;
			else
				return -1;
		}
		else if(nrecv == 0)
			return 0;
		else
			return nrecv;
	}

}

int udpRecv(int sockfd,void *buf, int len,int flags,struct sockaddr* pt_addr,socklen_t* pt_addrlen)
{
	int nrecv = 0;
	
	while( len > 0 )
	{
		nrecv = recvfrom(sockfd,buf,len,flags,pt_addr,pt_addrlen);
		if(nrecv < 0)
		{
			if (errno == EINTR)//被中断
				continue;
			else if(errno == EAGAIN || errno == EWOULDBLOCK)  //如果是异步的
				return 0;
			else
				return -1;
		}
		else if(nrecv == 0)
			return 0;
		else
			return nrecv;
	}
}




















