#ifndef __SERVER__
#define __SERVER__

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <errno.h>
#include <string.h>
#include <sys/epoll.h>
#include <fcntl.h>
#include <stdlib.h>
#include <signal.h>


int InitServerSocket(int port);
void SetSocketNonblock(int fd);
int ReadDate(int fd,char *buf,int num);
void setsignal();

#endif
