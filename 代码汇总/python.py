安装pyhon
1，下载最新年源码包
2，安装
3，执行python，发现还是自带的低版本
4，因为自带的yum是基于自带的python
5，修改自带python的名字，然后vi /usr/bin/yum的第一行（#! /usr/bin/python2.6）
6，在/usr/bin下给最新的python创建链接
