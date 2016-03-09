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

关于rsync
sudo apt-get install rsync
yum install rsync
rpm -ivh rsync
源码包：tar xvf rsync ****
cd rsync***
make & make install
传输：rsync -avzp /data/* root@123.59.43.36:P/var/
rsync -avzp root@123.59.43.26:/var/* /data/

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
