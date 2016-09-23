#!/usr/bin/python
# -*- coding: UTF-8 -*-

安装pyhon
1，下载最新年源码包
2，安装
3，执行python，发现还是自带的低版本
4，因为自带的yum是基于自带的python
5，修改自带python的名字，然后vi /usr/bin/yum的第一行（#! /usr/bin/python2.6）
6，在/usr/bin下给最新的python创建链接


dic = {'a':[5,8,6], 'bc':[8,5,4], 'c':[1,5,6], 'asd':[3,7,6], 'aa':[2,3,9], 'd':[2,3,8],'asdd':[3,7,5],}
list= sorted(dic.iteritems(), key=lambda d:d[1])
list= sorted(dic.iteritems(), key=lambda d:d[1],reverse=True)
print list
for i in range(len(list)):
	pass
	
import random
print random.randint(12, 14)

import time
localtime = time.localtime(time.time())
print "时间戳:", time.time()
time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time() + 5))


数据库
import MySQLdb
sql_connect=MySQLdb.connect(host=MYSQL_HOST,port=MYSQL_PORT,user=MYSQL_USER,passwd=MYSQL_PASSWORD) 
cursor = sql_connect.cursor() 
sql_str = "select gameid,userid,scoreA,scoreB,scoreC from ko_battle.battle_score_log where inputTime>'2016-05-27 14:20:34'"
cursor.execute(sql_str)
results = cursor.fetchall()
for row in results:
	print row[0],row[1],row[2],row[3],row[4]

	
定时任务	
import time, os, sched 
schedule = sched.scheduler(time.time, time.sleep) 
def perform_command(cmd, inc): 
    schedule.enter(inc, 0, perform_command, (cmd, inc))
    work()    
def timming_exe(cmd, inc = 1): 
    schedule.enter(inc, 0, perform_command, (cmd, inc)) 
    schedule.run() 
timming_exe("", 3)



g_last_date_time="2016-05-27 00:00:00"
date_str = g_last_date_time[0:11]
date_str = date_str.replace("-","")
time_str = g_last_date_time[11:]

	
数字转字符串
str(gameid)





try:
	cursor.execute(sql_str)
except Exception, e:
	print Exception,":",e, time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time())) 
	if 'MySQL server has gone away' in str(e):
		reconnect()
		print "reconnect"	        	
	else:
		raise e()

from test4 import test4 
t = test4()
print t.get()


dic.has_key(gameid)
dict.keys()
keys_list =  dict.keys()
print  keys_list
print keys_list.__contains__("gag")
keys_list.remove("gag")



ttt = time.time()
tl = time.localtime(ttt)
print tl
time.struct_time(tm_year=2016, tm_mon=9, tm_mday=21, tm_hour=13, tm_min=58, tm_sec=43, tm_wday=2, tm_yday=265, tm_isdst=0)

class ClassName(object):
	static_a = "222"
	static_b = {"a":"ddddddd"}

	def __init__(self):
		self.aa="sdfsdfsfd"
		self.cc = "ccc"
	def get(self,x):
		del self.cc
		self.cc ="fffffffffff"
		self.aa= "ddddddddddddddddddddddddd"
		return self.aa,self.cc,x

c = ClassName()
print c.get("ggggggggg")


for i in range(len(list)):
	print list[i]

if "char" in "aacharaa":
	print "char in aacharaa"


字符串转数字
import string
num = string.atoi(str)


if True:
    print "True"
else:
  print "False"

if 判断条件1:
    执行语句1……
elif 判断条件2:
    执行语句2……
elif 判断条件3:
    执行语句3……
else:
    执行语句4……

Python有五个标准的数据类型：
	Numbers（数字）
	String（字符串）
	List（列表）
	Tuple（元组）
	Dictionary（字典）


for letter in 'Python':     # 第一个实例
   print '当前字母 :', letter

fruits = ['banana', 'apple',  'mango']
for fruit in fruits:        # 第二个实例
   print '当前字母 :', fruit

fruits = ['banana', 'apple',  'mango']
for index in range(len(fruits)):
   print '当前水果 :', fruits[index]

for num in range(10,20):  # 迭代 10 到 20 之间的数字
	print num



列表(List)是Python中最基本的数据结构。序列中的每个元素都分配一个数字 - 它的位置，或索引，第一个索引是0，第二个索引是1，依此类推。
list1 = ['physics', 'chemistry', 1997, 2000];
list2 = [1, 2, 3, 4, 5 ];

Python的元组与列表类似，不同之处在于元组的元素不能修改。元组使用小括号，列表使用方括号。
tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5 );

字典(Dictionary)
字典是另一种可变容器模型，且可存储任意类型对象。
字典的每个键值(key=>value)对用冒号(:)分割，每个对之间用逗号(,)分割，整个字典包括在花括号({})中 ,格式如下所示：
dict = {'Alice': '2341', 'Beth': '9102', 'Cecil': '3258'}
dict2 = { 'abc': 123, 98.6: 37 };



try:
<语句>        #运行别的代码
except <名字>：
<语句>        #如果在try部份引发了'name'异常
except <名字>，<数据>:
<语句>        #如果引发了'name'异常，获得附加的数据
else:
<语句>        #如果没有异常发生
try:
    fh = open("testfile", "w")
    fh.write("这是一个测试文件，用于测试异常!!")
except IOError:
    print "Error: 没有找到文件或读取文件失败"
else:
    print "内容写入文件成功"
    fh.close()


使用except而不带任何异常类型
你可以不带任何异常类型使用except，如下实例：
try:
    正常的操作
   ......................
except:
    发生异常，执行这块代码
   ......................
else:
    如果没有异常执行这块代码  



使用except而带多种异常类型
你也可以使用相同的except语句来处理多个异常信息，如下所示：
try:
    正常的操作
   ......................
except(Exception1[, Exception2[,...ExceptionN]]]):
   发生以上多个异常中的一个，执行这块代码
   ......................
else:
    如果没有异常执行这块代码


try-finally 语句无论是否发生异常都将执行最后的代码。


返回一年的第几周
datetime.date.today().isocalendar()[1]
