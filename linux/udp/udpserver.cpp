#include "udp.h"

#define PORT 1234
#define MAXDATASIZE 500

int main(int argc, char const *argv[])
{
	int sockfd;
	int num;
	char buf[MAXDATASIZE];
	char bufstr[100];
	if ((sockfd = socket(AF_INET,SOCK_DGRAM,0)) == -1 )
	{
		perror("create socket failed");
		exit(1);/* code */
	}
		//设置为异步
	setNotbolck(sockfd);

	//设置服务端的地址和端口，以及绑定
	struct sockaddr_in addr;
	bzero(&addr,sizeof(addr));
	addr.sin_family=AF_INET;
	addr.sin_port=htons(1234);
	addr.sin_addr.s_addr = htonl(INADDR_ANY);
	socklen_t addrlen = sizeof(addr);
	if (bind(sockfd,(struct sockaddr*)&addr,sizeof(struct sockaddr)) == -1)
	{
		/* code */perror("bing error");
		close(sockfd);
		exit(1);

	}

	//客户端地址
	struct sockaddr_in clientaddr;
	socklen_t clientaddrlen = sizeof(clientaddr);



	while(1)
	{

		//接收
		num = udpRecv( sockfd, buf, MAXDATASIZE-1,0,(struct sockaddr *)&clientaddr,&clientaddrlen);
		if (num < 0)
		{
			perror("recvfrom() error\n");  
     		exit(1);  /* code */
		}
		buf[num]  = '\0';

		if(num > 0){
			//发送
			sprintf(bufstr,"you have send to server once len : %d",num);
			int snum = udpSend(sockfd,bufstr,strlen(bufstr),0,(struct sockaddr *)&clientaddr,clientaddrlen);
			if (snum == -1 )
				{
					perror("err:");
				}

			//打印
				if(num > 0)
			printf("You got a message () from client len:%d.\nIt's ip is%s, port is %d.\n\n",num,inet_ntoa( ((struct sockaddr_in *)&clientaddr)->sin_addr),ntohs(  ((struct sockaddr_in *)&clientaddr)->sin_port));   
	      
		}
	}
	return 0;
}














