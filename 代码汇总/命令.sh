防火墙
service iptables status
service iptables stop
service iptables start
service iptables off
service iptables on

修改防火墙
第一步：vi /etc/sysconfig/iptables
service iptables restart
/etc/rc.d/init.d/iptables save


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


*/5 * * * * . /etc/profile;ntpdate asia.pool.ntp.org;clock -w




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
rsync -avzp -e 'ssh -i "/data/golang/xxxxxxx.pem"' /home/centos/test/ root@xxx.xxx.xx.69:/home/bak/

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
find ./ -name "*.php" | xargs grep "yisuofs"

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
tcpdump -vv -i lo -nn -X tcp port 9069 
tcpdump -xx tcp port 9041
tcpdump tcp port 23
tcpdump udp port 123

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
lsblk
mkfs -t ext4 /dev/sda  格式化硬盘
umount /dev/vdb		 	卸载
mkdir /data 
mount -t ext4 /dev/sda /xdata   挂载
磁盘被手动挂载之后都必须把挂载信息写入/etc/fstab 这个文件中，否则下次开机启动时仍然需要重新挂载。
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


-------------------chkconfig-----------------------------------------------
把程序加入开机启动，或者加入系统服务。
1.把脚本或者程序或者软连接 放在cd /etc/init.d/目录下
2.chkconfig --add nginx
3.chkconfig --level 35 nginx on


----------------------修改进程能打开的最大文件描述符---------------------------------------------
vim /etc/security/limits.conf
sysctl -a | grep file-max
sysctl -a 查看所有内核参数
sysctl -w fs.file-max=98366

--------------------rz命令和sz命令安装----------------------------------------------------------
yum install lrzsz -y
rz
sz filename

------------------------------------------------------------

lsof -p pid --列出进程所打开的文件。

------------------------------------------------------------
nginx upstream 采用ip_hash均衡算法可以避免session不共享问题。
./nginx -t  用来检测配置文件是否有格式错误。

当一个表数据达到上千万条，并且读取频繁，可以把表拆分为索引表和内容表。
redis 当设置了超时时间的数据被修改后，设置的超时时间会失效。
redis RDB每次持久化的过程都是把redis内存数据完整地写入到磁盘，并不是写入修改的数据。
redis AOF把每个写入命令追加到文件里。

------------------------------------------------------------

adduser tmp_3452
passwd tmp_3452
userdel tmp_3452

sdfksdudhee567

vim /etc/sudoers



curl -X POST 'localhost:9200/accounts/person' -d '
{
  "user": "李四",
  "title": "工程师",
  "desc": "系统管理"
}'

curl -H 'Host: app.xlx9.com' -H 'Accept: */*' -H 'User-Agent: FanweApp/6.0 (iPhone; iOS 11.3.1; Scale/2.00)' -H 'Accept-Language: zh-Hans-CN;q=1' --data "act=pay&ctl=pay&i_type=1&sdk_version_name=2.5.0" --compressed 'http://app.xlx9.com/mapi/index.php'




---

npm install -g @vue/cli
npm install -g @vue/cli-init


vue init webpack my-project
npm install
npm run dev
npm run build

//-----------------------------------------------------

systemctl start firewalld 
systemctl status firewalld
systemctl stop firewalld


//-----------------------------------------------------
firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --add-port=3306/tcp --permanent
firewall-cmd --add-port=6379/tcp --permanent
firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="10.0.2.3/32" port protocol="tcp" port="3306" accept"

firewall-cmd --list-all
重新载入 firewall-cmd --reload



//-----------------------------------------------------

Ctrl + A	该快捷键将移动光标到所在行首。
Ctrl + E	移动光标到行尾。
Ctrl + U	该快捷键会擦除从当前光标位置到行首的全部内容。
Ctrl + K	它擦除的是从当前光标位置到行尾的全部内容。
Ctrl + Y	这将粘贴使用 Ctrl+W，Ctrl+U 和 Ctrl+K 快捷键擦除的文本。 

//-----------------vim------------------------------------
:s/from/to/g    将当前行中的所有from都替换成to。
:%s/from/to/g   对所有行的内容进行替换。

//-----------------------------------------------------

./geth --rpc --rpcapi admin,miner,eth,web3,personal,net --rpcaddr 0.0.0.0 --rpcport 11911 --datadir=/ssd/blockchain/data


nohup ./bitcoind -conf=/xdata/btc/btc.conf  >> /xdata/btc/btc.log 2>&1 &
btc.conf{
server=1
rpcuser=test
rpcpassword=123456
rpcallowip=127.0.0.1
rpcallowip=127.0.0.1
rpcport=8832
datadir=/xdata/btc/data
txindex=1
}
./bitcoin-cli -conf=/xdata/btc/btc.conf help
./bitcoin-cli -conf=/xdata/btc/btc.conf getbalance
./bitcoin-cli -conf=/xdata/btc/btc.conf getnetworkinfo
./bitcoin-cli -conf=/xdata/btc/btc.conf getbalance encryptwallet "xxxxxxxxxment"
./bitcoin-cli -conf=/xdata/btc/btc.conf encryptwallet "of2018payment"



nohup ./omnicored -conf=/btc/usdt/conf/bitcoin.conf &
bitcoin.conf{
server=1
rpcuser=ofAdmin
rpcpassword=of2018
rpcallowip=172.xx.xx.xx
rpcport=8332
port=8334
txindex=1
datadir=/btc/usdt/data/
logtimestamps=1
omnidebug=tally
omnidebug=packets
omnidebug=pending
}
./omnicore-cli -rpcuser=ofAdmin -rpcpassword=of2018 getinfo
./omnicore-cli -rpcuser=ofAdmin -rpcpassword=of2018 encryptwallet "xxxxxxxxment"
./omnicore-cli -rpcuser=ofAdmin -rpcpassword=of2018 getbalance
./omnicore-cli -conf=/btc/usdt/conf/bitcoin.conf getbalance


./bitcoind -conf=/btc/bch/bch.conf -datadir=/btc/bch/data/ -reindex -reindex-chainstate
//-----------------------------------------------------

常用screen参数
screen -S yourname -> 新建一个叫yourname的session
screen -ls -> 列出当前所有的session
screen -r yourname -> 回到yourname这个session
screen -d yourname -> 远程detach某个session
screen -d -r yourname -> 结束当前session并回到yourname这个session
//-----------------------------------------------------

配置dns
cat /etc/resolv.conf
//-----------------------------------------------------

磁盘被手动挂载之后都必须把挂载信息写入/etc/fstab这个文件中，否则下次开机启动时仍然需要重新挂载。
cat /etc/fstab 查看当前系统已经存在的挂载信息
blkid 命令查看磁盘 UUID
088d4826-247a-4e0f-bb50-0b24f0cae5df
//-----------------------------------------------------
nginx 简单验证方式
server
{
	....
	....
	auth_basic "请验证登录信息";
	auth_basic_user_file /usr/local/nginx/mysqlpasswd;
	....
	....
}
yum install -y httpd-tools
htpasswd  -c /usr/local/nginx/conf/pass_file/pmadmintt pmadmintt
htpasswd  -c /usr/local/nginx/conf/pass_file/testwedang wendang

//----------------------lnmp-------------------------------
show status  mysql服务器状态变量
show variables mysql服务器 动态 运行时的系统变量

/etc/init.d/nginx
/etc/init.d/mysql
/etc/init.d/php-fpm

ps aux | grep php-fpm | grep -v grep |  awk {'print $2'} | xargs kill -9
/usr/local/php/sbin/php-fpm --fpm-config /usr/local/php/etc/php-fpm.conf

//-----------------------------------------------------
整站下载命令
wget -r -p -np -k http://xxx.com/xxx
-r, –recursive（递归） specify recursive download.（指定递归下载）
-k, –convert-links（转换链接） make links in downloaded HTML point to local files.（将下载的HTML页面中的链接转换为相对链接即本地链接）
-p, –page-requisites（页面必需元素） get all images, etc. needed to display HTML page.（下载所有的图片等页面显示所需的内容）
-np, –no-parent（不追溯至父级） don’t ascend to the parent directory.
//-----------------------------------------------------












