#ifndef __CLIENT__
#define __CLIENT__

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

int ClientConnectServer(char const *ip,int port);
int Restart();
void SetSignal();
void Sig_Pipe();
void SetSocketNonblock(int fd);

#endif
