netstat -s | egrep "listen" 去看队列的溢出统计数据

cat /proc/sys/net/ipv4/tcp_abort_on_overflow  tcp_abort_on_overflow 为0表示如果三次握手第三步的时候全连接队列满了那么server扔掉client 发过来的ack（在server端认为连接还没建立起来）

网络连接有两个队列：syns queue(半连接队列）；accept queue（全连接队列）
第三步握手的时候server收到client的ack，如果这时全连接队列没满，那么从半连接队列拿出这个连接的信息放入到全连接队列中，否则按tcp_abort_on_overflow指示的执行。

ss -lnt
看到的第二列Send-Q 值是50，表示第三列的listen端口上的全连接队列最大为50，第一列Recv-Q为全连接队列当前使用了多少。

cat /proc/sys/net/ipv4/tcp_max_syn_backlog

netstat -t 看到的Recv-Q有大量数据堆积，那么一般是CPU处理不过来导致的

(干货) https://mp.weixin.qq.com/s/yH3PzGEFopbpA-jw4MythQ

