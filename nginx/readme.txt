nginx默认request的header的那么中包含’_’时，会自动忽略掉。 
解决方法是：在nginx里的nginx.conf配置文件中的http部分中添加如下配置： 
underscores_in_headers on; （默认 underscores_in_headers 为off）