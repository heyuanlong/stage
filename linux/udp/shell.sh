#!/bin/sh
if [ "$1" = "bs" ]; then
	echo "build udpserver.cpp"
	g++ udpserver.cpp -o us
	echo "build success"
fi

if [ "$1" = "bc" ]; then
	echo "build udpclient.cpp"
	g++ udpclient.cpp -o uc -g
	echo "build success"
fi

if [ "$1" = "us" ]; then
	echo "execute us"
	./us
fi
if [ "$1" = "uc" ]; then
	echo "execute uc"
	./uc 127.0.0.1 1234
fi