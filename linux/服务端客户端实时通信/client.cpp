#include "client.h"


int gfd;
char gip[16];
int gport;

int main(int argc, char const *argv[])
{
	SetSignal();
	strcpy(gip,argv[1]);
	gport=atoi(argv[2]);
	SetSocketNonblock(STDIN_FILENO);//非阻塞

	ClientConnectServer(gip,gport);
	int clientsocket = gfd;
	char buf[10240]={0};
	char readbuf[10240]={0};
	ssize_t nread;
    
	while(1) {
		ssize_t len = read(STDIN_FILENO,buf,10240);//从终端读取，	
		if( strncmp(buf,"exit",4) == 0 )break;

		ssize_t sendnum = 0;
		char  *temp =buf;
		while(len > 0){
			sendnum = write(clientsocket,temp,len);//服务端中断后，第一次发送时sendnum不等于0，第二次发送时就会出现sigpipe错误。
			    printf("have seng:%d\n",sendnum );

			if ( -1 == sendnum){
				if (errno == EPIPE){
			    	Sig_Pipe();
			    }
				//printf("错误编号：%d\n", errno);
			}
			    
			temp +=sendnum;
			len -=sendnum;		
		}

		nread = recv(clientsocket,readbuf,10240,0);
		if (nread > 0){
			write(STDOUT_FILENO,readbuf,nread);
		}

	}
 
	close(clientsocket);
	return 0;
}

int ClientConnectServer(char const *ip,int port)
{
	int clientsocket = socket(AF_INET,SOCK_STREAM,0);
	if (-1 == clientsocket){
		perror("client socket");
		exit(1);
	}
	

	struct sockaddr_in caddr;
	bzero(&caddr,sizeof(caddr));
	caddr.sin_family=AF_INET;
	caddr.sin_port=htons(port);
	caddr.sin_addr.s_addr=inet_addr(ip);

	while(1){
		if ( connect(clientsocket,(struct sockaddr*)&caddr,sizeof(struct sockaddr)) == -1 ){
			write(STDOUT_FILENO,"connect to server.........\n",strlen("connect to server.........\n"));
			sleep(1);
		}
		else 
			break;//连接成功
	}
	printf("connect fd %d\n", clientsocket);

	SetSocketNonblock(clientsocket);//为什么放在connect之前就会出错？？？？？？？？？？？
	gfd=clientsocket;
	write(STDOUT_FILENO,"already connect to the server\n",strlen("already connect to the server\n"));


/*
printf("下面是重复connect\n");
int clientsocket11 = socket(AF_INET,SOCK_STREAM,0);;
	while(1){
		if ( connect(clientsocket11,(struct sockaddr*)&caddr,sizeof(struct sockaddr)) == -1 ){
			if (errno == EISCONN)
			{
				printf("connect fd --------%d\n", clientsocket);
				break;
			}
			
			write(STDOUT_FILENO,"connect to server....999.....\n",strlen("connect to server....999.....\n"));
			sleep(1);
		}
		else {
			printf("connect fd -888888888888-%d\n", clientsocket);
			break;//连接成功

			}	
	}
	*/	
	return clientsocket;

}


void SetSignal()
{

	sigset_t newmask,oldmask;
	sigemptyset(&newmask);
	sigaddset(&newmask,SIGPIPE);//屏蔽信号
	if(sigprocmask(SIG_BLOCK,&newmask,&oldmask) < 0)
		perror("sigprocmask SIG_BLOCK");

/*	struct sigaction forpipe;
	forpipe.sa_handler=SIG_IGN;
	sigemptyset(&forpipe.sa_mask);//
	forpipe.sa_flags=0;
	sigaction(SIGPIPE,&forpipe,0);	*/

/*	
	if (signal(SIGPIPE, Sig_Pipe) == SIG_ERR)//设置信号处理函数
		perror("can't catch SIGPIPE");*/
}
void Sig_Pipe()
{
	//printf("I have get SIGPIPE\n");
	printf("连接中断\n");
	int r,re;
	//if (sig == SIGPIPE){
		char recvbuf[10]={0};
		r = recv(gfd,recvbuf,10,0);//这里出错吗？？

		if ( 0 == r){//为什么是0 而不是 -1 ？？？？？？？
			close(gfd);
			//re=Restart();
			re=1;
			if ( 0 == re){
				exit(1);
			}
			else{
				ClientConnectServer(gip,gport);
			}
		}
	//}
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




int Restart()
{
	write(STDOUT_FILENO,"restart? y or n\n",strlen("restart? y or n\n"));
	char c;
	while(1){
		read(STDIN_FILENO,&c,1);
		if(c == 'y'){
			return 1;
		}
		else if (c == 'n'){
			return 0;
		}
		write(STDOUT_FILENO,"input y or n\n",strlen("input y or n\n"));
	}

}