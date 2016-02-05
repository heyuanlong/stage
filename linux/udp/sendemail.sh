#!/bin/bash
HOSTNAME="localhost"  #数据库信息
PORT="3306"
USERNAME="root"
PASSWORD="sd-9898w"
CHARACTER="--default-character-set=utf8 $*"

DBNAME="ko_open"  #数据库名称
TABLENAME="mail_validation" #数据库中表的名称

#查询
select_sql="select * from ${TABLENAME} where status=0"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${CHARACTER}  ${DBNAME} -e "${select_sql}" > sendemail_temp.txt

i=0
j=0
send_fail_num=0
send_success_num=0

sendto=""
content=""


while read line
do
    i=$[ $i+1 ]
    if [ $i -eq 1 ] 
    then
	continue
    fi
    for word in $line 
    do
	    j=$[ $j+1 ]
	    if [ $j -eq 1 ] 
	    then
		continue
	    fi
	    if [ $j -eq 2 ] 
	    then
		sendto=${word}
		continue
	    fi

	    if [ $word = "0" ] 
	    then
		continue
	    fi
	    content=${content}" "${word}

    done

    #发送
/usr/local/bin/sendEmail -xu monitor@kobox.tv -f monitor@kobox.tv -t $sendto   -s smtp.exmail.qq.com -o message-content-type=html -o message-charset=utf8 -a $attach -xp uyO8b6R -u $dt"tonji"  -m $content
    
    if [ $? -eq 0 ];
    then
	send_success_num=$[ send_success_num+1 ]
    else
	send_fail_num=$[ $send_fail_num+1 ]
    fi
    
    #echo $sendto
    #echo -e "\n"
    #echo $content

    #echo -e "\n\n"
    j=0
    content=""
done < sendemail_temp.txt


update_sql="update  ${TABLENAME} set status=1 where status=0"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${CHARACTER}  ${DBNAME} -e "${update_sql}"

#echo "fail nums:" $send_fail_num
#echo "success nums:" $send_success_num



