防火墙
service iptables status
service iptables stop
service iptables start
service iptables off
service iptables on

修改防火墙
第一步：vi /etc/sysconfig/iptables
第二步：service iptables restart
第三步: /etc/rc.d/init.d/iptables save


iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 186.123.23.23 -p tcp --dport 80 -j ACCEPT


关于重定向
2>&1 错误输出重定向到标准输出
2>1  错误输出重定向到名为1的文件

4<&0 指的是将文件描述符4指定为标准输入

环境变量（临时修改）
1。添加PATH export PATH="$PATH:/var/bin"
2.删除环境变量 unset JAVA_HOME
3.添加环境变量 export zzz=/var/bin
4.查看 export

rm -rf dir

echo $HOME
echo $PATH

关于crontab / crond
用户可以使用crontab工具来定制自己的任务，所有用户定义的crontab文件都被保存在/var/spool/cron目录中，其文件名与用户名一致
加入计划任务
echo "*/1 * * * * date>/data/a.txt">>/var/spool/cron/root
crontab -e 编辑计划任务
crontab -l 列出任务
service crond restart 重启crond


nohup ./beegoblog > blog.log 2>&1 &

永久修改环境变量
1，vi /etc/profile  (对所有用户)  不要忘记了 export
2，vi /etc/bashrc (对所有用户)
3，vi ~/.bash-profile (当前用户)
4, vi ~/.bashrc (当前用户)
source /etc/profile
{
	例子：
	GOROOT=/usr/local/go
	PATH=$PATH:$GOROOT/bin
	GOARCH=amd64
	GOOS=linux
	GOPATH=/data/gowork
	export GOROOT PATH GOARCH GOOS GOPATH
}


关于SSH
登录其他主机  ssh root@123.59.43.35
避免每次都输入密码：
1，ssh-kengen 命令生成private/public密钥对
2，ssh-copy-id -i /root/.ssh/idrsa user@remotehost
用ssh-copy-id命令吧公钥复制到远程主机
3，ssh user@remotehost 直接登录

关于 rsync （双方都得有rsync）
sudo apt-get install rsync
yum install rsync
rpm -ivh rsync
源码包：tar xvf rsync ****
cd rsync***
make & make install
传输：rsync -avzp /data/* root@123.59.43.36:/var/
rsync -avzp root@123.59.43.26:/var/* /data/

通过下列命令改变它的端口：
rsync --port 8730 otherhost::
或者
rsync -e 'ssh -p 2002' otherhost:

rsync -avzp /data/matchvs.com/cms/htdocs/CMS.MatchVS/webroot/jsp/* /data/matchvs.com/cms/htdocs/superCMS.MatchVS/webroot/jsp/


rsync -e 'ssh -p 3879' client heyuanlong@115.231.9.76:/home/heyuanlong/mygomatchvs/

yum 安装mysql
1,安装mysql服务端
yum install mysql-server
yum install mysql-devel
2,install mysql客户端
yum install mysql
3,启动mysql服务
service mysqld start /etc/init.d/mysqld start
停止            stop
重启            restart
4，创建root管理员
mysqladmin -uroot password 123456
5，登录
mysql -uroot -p123456

ldconfig 是动态链接库管理命令
ldd 是用来查看程序运行所需要的共享库

tail -f file.log
ln -s oldfile newfile

关于SCP
scp的命令使用和rsync一样
区别：scp一个复制   rsync一个同步


hexdump -C file.txt 输出十六进制和对应字符
hexdump -C -n 10 file.txt 输出前10个字节



dos2unix命令用来将DOS格式文本转换成unix格式的.
DOS下文本以\r\n为断行标志，十六进制为0D0A 而unix是\n为0A
dos2unix file.txt
还有unix2dos命令与dos2unix相反

chmod +x job.sh

SendEmail 用命令或shell发送邮件（看自己的博客）

less -N file.txt{
    q 退出
    空格  entry 下一行  pagedown 下一页
    g： 第一页  G：最后一页
    数字+entry  ：跳到n行
}

查找文件里的内容
find ./ -name "*.*" | xargs grep "\"ip\""

du -sh PATH 总大小
du -h PATH 目录里所有文件的详细大小
df 查看磁盘的使用情况


linux查询进程占用哪些端口
netstat -anp
netstat -pan | grep 9031


打包命令
tar -zcvf nginx.conf.221.tar.gz conf/*

查看这个目录的总大小
du -h matchvs.com --max-depth=0


解压
1、*.tar 用 tar –xvf 解压 
2、*.gz 用 gzip -d或者gunzip 解压 
3、*.tar.gz和*.tgz 用 tar –xzf 解压 
4、*.bz2 用 bzip2 -d或者用bunzip2 解压 
5、*.tar.bz2用tar –xjf 解压 
6、*.Z 用 uncompress 解压 
7、*.tar.Z 用tar –xZf 解压 
8、*.rar 用 unrar e解压 
9、*.zip 用 unzip 解压[喝小酒的网摘]http://blog.hehehehehe.cn/a/17148.htm




chown [选项]... [拥有者][:[组]] 文件...
chown mail:mail log2012.log
-R 处理指定目录以及其子目录下的所有文件
chown -R -v root:mail test6

rm -rf  mulu  ---会把这个目录名也删除
mkdir -p  目录路劲     ---可以递归创建目录


tee指令会从标准输入设备读取数据，将其内容输出到标准输出设备，同时保存成文件。
pwd | tee -a who.out


查看内存情况
top  [-u user | -U user] -p pid [,pid ...]


查看机子类型：
uname -a
lsb_release -a
cat /etc/redhat-release





查看tcp连接的所有连接的状态
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
查看time_wait状态的数量
netstat -n | grep TIME_WAIT | wc -l


-------------------tcpdump-------------------------
tcpdump tcp port 23
tcpdump udp port 123
tcpdump -xx tcp port 9041
tcpdump -vv -i lo -nn -X tcp port 9069
- 源端口
# tcpdump -i eth1 src port 25
- 目的端口
# tcpdump -i eth1 dst port 25
http://blog.csdn.net/nanyun2010/article/details/23445223


----------------------nc----------------------------
-l 使用监听模式.
-u 使用UDP协议.

在192.168.1.2上： nc -l 1234
在192.168.1.3上： nc 192.168.1.2 1234

在192.168.1.2上： nc -l -u 1234
在192.168.1.3上： nc -u 192.168.1.2 1234

------------y----------ab 网络压测----------------------------
安装  yum install httpd-tools

ab -c 50 -n 5000 https://www.baidu.com/
-c 50 表示并发用户数为 50
-n 5000 表示请求总数为 5000

-----------------------wireshark-抓包------------------------------------
http://blog.csdn.net/ffggnfgf/article/details/51056018

-----------------------查看端口被哪个pid占用-------------------------------------
lsof -Pnl +M -i4    | grep 9005

-------------------------磁盘相关-----------------------------------

fdisk -l
df -h
mount -l  				查看
mkfs -t ext3 /dev/vdb  格式化硬盘
umount /dev/vdb		 	卸载
mkdir /apps 
mount -t ext3 /dev/vdb /apps   挂载
---------------------------vim---------------------------------
在 vi 或 vim 的命令状态下
:%!xxd              ——将当前文本转换为16进制格式。
:%!xxd -r          ——将当前文件转换回文本格式。

vim -b txt.txt 能看到^M （-b Binary mode）
要将a.txt里的^M去掉并写入b.txt，则使用如下指令
sed -i 's/\r//g' filename
或者
dos2unix filename 
或者
cat a.txt | tr -d "^M" > b.txt

替换
:s/from/to/g 		将当前行中的所有from都替换成to
:%s/from/to/g 		对所有行的内容进行替换

---------------------------iptables 端口转发---------------------------------
http://www.cnblogs.com/apexchu/p/4255551.html

----------------------ps--------------------------------------

ps -ef|grep MainDayRank|grep -v grep |awk '{print $2}' | xargs kill
ls | xargs cat

linux下查看一个进程的启动时间和运行时间
使用 ps命令 ：#ps -A -opid,stime,etime,args

 ps ax  -o pid,ppid,tty,stat,args,wchan

------------------把命令加入开机启动------------------------------------------
把命令追加进 /etc/rc.d/rc.local即可

echo 'xxxx' >> /etc/rc.d/rc.local
----------------------ps--------------------------------------



   //这样可以设置全部时间

-------------------------------------------------------------------

ffmpeg -i dxx.mp4 -ss 00:00:20 -to 00:01:18  dxx_11.mp4
ffmpeg -i bd1.mkv -ss 01:02:13 -to 01:05:37  bd1_11.mp4
ffmpeg -i g.mp4 -y -ab 32 -ar 22050 -qscale 10 -s 640*480 -r 15 g.flv   mp4转flv





ffmpeg -i 2ddd.mp4 -y -ab 32 -ar 22050 -qscale 10 -s 640*480 -r 15 db_jj.flv
ffmpeg -i db_jj.flv -f avi -vcodec mpeg4 o.mp4


合并视频文件
FFmpeg concat 分离器
这种方法成功率很高，也是最好的，但是需要 FFmpeg 1.1 以上版本。先创建一个文本文件filelist.txt：
file 'input1.mkv'
file 'input2.mkv'
file 'input3.mkv'
然后：
ffmpeg -f concat -i filelist.txt -c copy dddddd.mp4


-------------------------------------------------------------------
lsof(list open files)是一个列出当前系统打开文件的工具。通过lsof工具能够查看这个列表对系统检测及排错，常见的用法：
查看文件系统阻塞  lsof /boot
查看端口号被哪个进程占用   lsof  -i : 3306
查看用户打开哪些文件   lsof –u username
查看进程打开哪些文件   lsof –p  4838
查看远程已打开的网络链接  lsof –i @192.168.34.128


-------------------------------------------------------------------

SHOW TABLE STATUS; 查看各个表的信息及其状态。

----------------------pstack---------------------------------------------
pstack命令用来显示进程的栈跟踪。 pstack 命令必须由相应进程的属主或root账号运行。可以使用pstack来确定进程挂起的位置。此命令只有一个参数，那就是pid


------------------------------------------------------------------



































---



