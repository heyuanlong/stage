只要将jemalloc的库被系统找到即可：
echo /usr/local/jemalloc/lib >> /etc/ld.so.conf 
ldconfig