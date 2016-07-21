防火墙
service iptables status
service iptables stop
service iptables start
service iptables off
service iptables on

修改防火墙
vi /etc/sysconfig/iptables
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

永久修改环境变量
1，vi /etc/profile  (对所有用户)
2，vi /etc/bashrc (对所有用户)
3， vi ~/.bash-profile (当前用户)
4, vi ~/.bashrc (当前用户)

关于SSH
登录其他主机  ssh root@123.59.43.35
避免每次都输入密码：
1，ssh-kengen 命令生成private/public密钥对
2，ssh-copy-id -i /root/.ssh/idrsa user@remotehost
用ssh-copy-id命令吧公钥复制到远程主机
3，ssh user@remotehost 直接登录

关于rsync（双方都得有rsync）
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

ldconfig是动态链接库管理命令
ldd是用来查看程序运行所需要的共享库

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
netstat -nlap


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