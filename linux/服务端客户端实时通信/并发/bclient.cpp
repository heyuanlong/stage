#include "client.h"
#include <pthread.h>

int gfd;
char gip[16];
int gport;


void*  thread(void* arg)
{
	//ClientConnectServer(gip,gport);
	int clientsocket = socket(AF_INET,SOCK_STREAM,0);
	if (-1 == clientsocket){
		perror("client socket");
		exit(1);
	}
	int val=1;//设为可重用
    int ss=setsockopt(clientsocket,SOL_SOCKET,SO_REUSEADDR,(const void*)&val,sizeof(int));
    if(-1 == ss){
    	close(clientsocket);
		perror("setsockopt");
		exit(1);
    }

	struct sockaddr_in caddr;
	bzero(&caddr,sizeof(caddr));
	caddr.sin_family=AF_INET;
	caddr.sin_port=htons(gport);
	caddr.sin_addr.s_addr=inet_addr(gip);

	//int clientsocket = gfd;
	char buf[10240]={0};
	char readbuf[10240]={0};
	ssize_t nread;
    
	while(1) {
		int clientsocket = socket(AF_INET,SOCK_STREAM,0);
		if (-1 == clientsocket){
			perror("client socket");
			exit(1);
		}

		struct sockaddr_in caddr;
		bzero(&caddr,sizeof(caddr));
		caddr.sin_family=AF_INET;
		caddr.sin_port=htons(gport);
		caddr.sin_addr.s_addr=inet_addr(gip);

		if ( connect(clientsocket,(struct sockaddr*)&caddr,sizeof(struct sockaddr)) == -1 ){
			write(STDOUT_FILENO,"connect to server.........\n",strlen("connect to server.........\n"));
			//perror("connect");
			close(clientsocket);
			continue;
			//exit(1);
		}
		write(clientsocket,"go\n",sizeof("go\n"));

		nread = recv(clientsocket,readbuf,10240,0);
		if (nread > 0){
			write(STDOUT_FILENO,readbuf,nread);
			close(clientsocket);
		}	
	}
	close(clientsocket);
	return NULL;
}



int main(int argc, char const *argv[])
{
	SetSignal();
	strcpy(gip,argv[1]);
	gport=atoi(argv[2]);

	pthread_t id;
	int ret;
	void *tret;
	for (int i = 0; i < 10; ++i)
	{
		ret=pthread_create(&id,NULL,thread,NULL);
		if(ret!=0){
			printf ("Create pthread error!n");
			exit (1);
		}
	}

	if (pthread_join(id,&tret)!=0){
         printf("Join thread 2 error!\n");
         exit(1);
     }
	return 0;
}

void SetSignal()
{
	sigset_t newmask,oldmask;
	sigemptyset(&newmask);
	sigaddset(&newmask,SIGPIPE);//屏蔽信号
	if(sigprocmask(SIG_BLOCK,&newmask,&oldmask) < 0)
		perror("sigprocmask SIG_BLOCK");
}
