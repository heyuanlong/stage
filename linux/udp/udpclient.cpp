#include "udp.h" 


int main(int argc, char const *argv[])
{
	
	char ip[20];
	strcpy(ip,argv[1]);
	int port=atoi(argv[2]);

	int clientsocket = socket(AF_INET,SOCK_DGRAM,0);
	if (-1 == clientsocket){
		perror("client socket");
		exit(1);
	}

	//设置为异步
	setNotbolck(clientsocket);


	//读取文件
	char buf[10000000];
	int fd = open("test.txt",O_RDONLY | O_NONBLOCK);
	int filelen=0;
 	filelen = read(fd,buf+filelen,sizeof(buf) - filelen);
	buf[filelen] = '\0';


	//设置发送的数据长度
	buf[100]='\0';//buf过长，sendto既然会失败，返回-1.  最大65507字节
	int len  = strlen(buf);

	//发送
	for (int i = 0; i < 5; ++i)
	{
			int snum = udpSend(clientsocket,ip,port,buf,len,0);
			printf("buf len:%d   send len:%d :\n",filelen,snum);
			if (snum == -1 )
			{
				perror("err:");
			}
	}


	//接收
	sleep(1);
	char bufstr[10000];
	int rnum = udpRecv(clientsocket,bufstr,sizeof(bufstr)-1,0);
	if (rnum == -1 )
			{
				perror("err:");
			}
	bufstr[rnum] = '\0';
	printf("%s\n", bufstr);


	return 0;
}

