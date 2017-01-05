在每个命令之间用&&隔开。
&&表示：若前一个命令执行成功，才会执行下一个。

在每个命令之间用||隔开。
||表示：若前一个命令执行成功，就不会执行下一条了。

每个命令之后最好加上逗号。

testing=`date`
testing=$(date)
shell会运行反引号命令，并将其输出赋给变量testing
shell会运行$()的命令，并将其输出赋给变量testing

内联输入重定向
cat<<marker
data
marker


执行数学运算：在方括号$[operation]里
var1=100
var2=50
var3=45
var4=$[$var1 * ($var2 - $var3)]

处理浮点数：
var1=10.33
var2=10.33
var3=1000
var5=`bc<<EOF
a1=($var1*$var2)
a1+$var3
EOF`
echo $var5


退出脚本含有退出状态码(取256的模)
exit 5
查看退出状态码
echo $?

nowDay=`date +%Y%m%d`

放在``里的命令不会影响$?的值{
	dateaaa
	if [ $? -eq 0 ]; then
	        echo "ok"
	        echo $?
	else
	        echo "error"
	        echo $?
	fi

	va1=`date`
	echo $va1
	echo $?
	va2=`dateaaa`
	echo $va2
	echo $?

	date
	echo $?
	dateaa
	echo $?
}


if结构{
	if [ command ];then
	   符合该条件执行的语句
	elif [ command ];then
	   符合该条件执行的语句
	else
	   符合该条件执行的语句
	fi

	test命令可以判断3类条件（注意，左括号和右括号侧边都得有个空格）
	1.数值比较
	2.字符串比较
	3.文件比较
	if [ $var -gt 5 ]
	then
		echo ""
	fi

	var1="afdsf"
	var2="afdsf"
	if [ $var1 \> $var2]
	then
		echo ""
	fi

	if [ -d $HOME ]
	then
		echo ""
	fi


	复合条件测试
	[ condition1 ] || [ condition2 ]
	[ condition1 ] && [ condition2 ]
	if [ $var1 \> $var2] &&　[ -d $HOME ]
	then
		echo ""
	fi


	if-then的高级特性
	1.用于数学表达式的双圆括号
	2.用于高级字符串处理的双方括号
	var1=10
	if (( $var1 ** 2 > 90))
	then
		((var2 = $var1**2))
		echo $var2
	fi


	if [[ $USER == r* ]]
	then
		echo ""
	fi
	
	pid=`ps aux | grep  /data/scripts/rank2/MainHistoryRank.py | awk '{if($11=="python"){print $2}}'`
	if [[ ${pid} != "" ]];then
		kill -9 ${pid}
	fi

	mysql=""
	if [ -f "/usr/bin/mysql" ];then
		mysql="/usr/bin/mysql"
	else
		mysql="/usr/bin/mysql/bin/mysql"
	fi

	双括号命令允许将高级数学表达式放入比较中
	双中括号提供了对字符串的高级特性

}

case结构{
	echo "Please input \"yes\" or \"no\""
	read var
	case "$var" in
	[yY][eE][sS] ) echo "Your input is YES" ;;
	[nN][oO] ) echo "Your input is no" ;;
	* ) echo "Input Error!" ;;
	esac
}

for结构{
	for((i=1;i<=10;i++)) 
	do 
		echo $(expr $i \* 4) 
	done

	for i in $(seq 10)
	do 
		echo $(expr $i \* 4) 
	done

	for i in `ls`
	for i in ${arr[@]}
	for i in $* ; do



	for File in /home/*/test
	do
	    echo $File
	done

	for i in 2 8 50 ;do#如果不换行就要用分号
		echo $i
	done

	修改默认的分隔符
	IFS.OLD=$IFS
	IFS=$'\N:;'
}

while结构{
	while expression
	do
	command
	command
	```
	done

	int=1
	while(( $int<=5 ))
	do
	 echo $int
	let "int++"
	done
}

until 循环格式为：until 循环执行一系列命令直至条件为 true 时停止。
until command
do
   Statement(s) to be executed until command is true
done


break 命令可以带一个参数，一个不带参数的break 循环只能退出最内层的循环，而break N可以退出N 层循环。
continue 命令也可以带一个参数，一个不带参数的continue 命令只去掉本次循环的剩余代码，而continue N 将会把N 层循环剩余的代码都去掉，但是循环的次数不变。

#!/bin/bash
for var1 in 1 2 3
do
   for var2 in 0 5
   do
      if [ $var1 -eq 2 -a $var2 -eq 0 ]
      then
         break 2
      else
         echo "$var1 $var2"
      fi
   done
done

#!/bin/bash
while
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "You do not select a number between 1 to 5!"
            continue
            echo "Game is over!"
        ;;
    esac
done



case $1 in
re )
    command1
    command2
    command3
    ;;
make )
    command3
    ;;
*)
    command1
    ;;
esac

处理脚本参数{
	1.运行带参数的程序
	$0表示程序名，$1表示第一个参数，$2表示第二个参数，一次类推，直到第九个参数$9
	注意：如果有多个参数，每个参数必须有个空格，如果一个参数里面带空格，必须用单引号或双引号括起来。
}


echo string
功能：
\c：不换行
\f：进纸
\t：跳格
\n：换行
[Linux系统功能]
-n：禁止echo命令输出后换行
-e：使转义符生效

read varible1 varible2 …

exec
可以用来替代当前shell
格式：exec command


创建函数有两种方式
function fun1{

}
fun1(){
	
}


fun1(){
        echo "test func"
        echo $#
        echo $@
        echo $0
        echo $1
        echo $2
}
fun1 9 7 5 4

给你个全的，你在Linux环境下多试下就明白了：
$0 这个程式的执行名字
$n 这个程式的第n个参数值，n=1..9
$* 这个程式的所有参数,此选项参数可超过9个。
$# 这个程式的参数个数
$$ 这个程式的PID(脚本运行的当前进程ID号)
$! 执行上一个背景指令的PID(后台运行的最后一个进程的进程ID号)
$? 执行上一个指令的返回值 (显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误)
$- 显示shell使用的当前选项，与set命令功能相同
$@ 跟$*类似，但是可以当作数组用



数组{
	array_name=(value0 value1 value2 value3)

	array_name[0]=value0
	array_name[1]=value1
	array_name[n]=valuen
	可以不使用连续的下标，而且下标的范围没有限制。

	${数组名[下标]}

	for item in "${array_name[@]}"; do
                echo -n "$item"
    done

	# 取得数组元素的个数
	length=${#array_name[@]}
	 # 或者
	length=${#array_name[*]}
	 # 取得数组单个元素的长度
	lengthn=${#array_name[n]}
}


var="
sdfsdfs
dfsdfsf
sdfsdfsf
123123
22222222
"
while IFS='' read -r line; do
        echo $line
done < "$var"

while read  line; do
        echo $line
done << EOF
sdfsd
sdfsf
1213
12312
EOF


if (($# < 2)); then fi
(($# < 1)) && return
(( ${#css_include[@]} > 0 )) && return || css_include=('main.css' 'blog.css')
[[ $1 == rebuild ]] && rebuild_all_entries && rebuild_tags
[[ $1 == delete ]] && rm "$2" &> /dev/null && rebuild_tags
 rm .*.html ./*.html ./*.css ./*.rss &> /dev/null

#列出文件
list_posts() {
    ls ./*.html &> /dev/null
    (($? != 0)) && echo "No posts yet. Use 'bb.sh post' to create one" && return

    lines=""
    n=1
    while IFS='' read -r i; do
        echo $i
    done < <(ls ./*.html)
}

#列出文件
v=a
for i in ${a}*.html; do
     echo $i
done

if [[ -f ../style.css ]] && [[ ! -f main.css ]]; then
    ln -s "../style.css" "main.css" 
elif [[ ! -f main.css ]]; then
    echo 'body' > main.css
fi


数学计算
((iTrayLeft = iLeft + 2))


Linux Shell 脚本中字符串的连接方法
$value1=home
$value2=${value1}"="
s=$s`DrawCurBox 1`

for ((j = 0, i = (${offsetBox[$iBoxCurType]} + $iTestRotate) * 8; j < 8; j++, i++))
do
	boxTest[$j]=${boxCur[$j]}
	boxCur[$j]=${box[$i]}
done



#游戏主程序在这儿开始.
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	Usage
elif [[ "$1" == "--version" ]]; then
	echo "$APP_NAME $APP_VERSION"
elif [[ "$1" == "--show" ]]; then
	#当发现具有参数--show时，运行显示函数
	RunAsDisplayer
else
	bash $0 --show&	#以参数--show将本程序再运行一遍
	RunAsKeyReceiver $!	#以上一行产生的进程的进程号作为参数
fi


当脚本执行的某条命令要花费不少时间时，下一行可以叫上睡眠命令
sleep 10










