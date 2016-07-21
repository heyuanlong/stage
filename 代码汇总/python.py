安装pyhon
1，下载最新年源码包
2，安装
3，执行python，发现还是自带的低版本
4，因为自带的yum是基于自带的python
5，修改自带python的名字，然后vi /usr/bin/yum的第一行（#! /usr/bin/python2.6）
6，在/usr/bin下给最新的python创建链接


dic = {'a':[5,8,6], 'bc':[8,5,4], 'c':[1,5,6], 'asd':[3,7,6], 'aa':[2,3,9], 'd':[2,3,8],'asdd':[3,7,5],}
dict= sorted(dic.iteritems(), key=lambda d:d[1])
print dict

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

for i in range(len(sorted_list)):
	pass



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


























