#!/usr/bin/python
# -*- coding:UTF-8 -*-
#下载redis-2.10.5.tar.gz
#python setup.py install 

import redis

REDIS_HOST		='localhost'
REDIS_PORT		= 6379
REDIS_AUTH 		= 'FDFDfdi4k25e@sf'

class KORedis():
	def __init__(self):
		self.redis_connection = None

	def __del__(self):
		pass
	def init(self):
		try:
			self.redis_connection = redis.Redis(host=REDIS_HOST,port=REDIS_PORT,db=0,password=REDIS_AUTH);
		except Exception, e:
			print "init redis connect fail"
			raise e
	def reConnect(self):
		try:
			self.redis_connection = redis.Redis(host=REDIS_HOST,port=REDIS_PORT,db=0,password=REDIS_AUTH);
		except Exception, e:
			print "redis reConnect:",e
			raise e

	def set(self,key,value):
		try:
			self.redis_connection.set(key,value)
		except Exception, e:
			self.reConnect()
			self.redis_connection.set(key,value)

	def get(self,key):
		try:
			return self.redis_connection.get(key)
		except Exception, e:
			self.reConnect()
			return self.redis_connection.get(key)


r = KORedis();
r.init()
r.set("test",454545)

print r.get("test")