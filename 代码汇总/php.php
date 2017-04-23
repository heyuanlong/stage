<?php

//时间戳转换字符串
date("Y-m-d H:i:s",time() )


//判断是否Wie手机号码
function isMobile($mobile) {
    if (!is_numeric($mobile)) {
        return false;
    }
    return preg_match('#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#', $mobile) ? true : false;
}

//判断是否只有大小写字母
function isAlphabet($str) {
    return preg_match('/^[a-zA-Z]+$/', $str) ? true : false;
}

//验证邮件
function isEmail($str) {
    return preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$str) ? true:false;
}
//验证URL
function isURL($str) {
    return preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$str) ? true:false;
}
function isURL($str) {
    if (!filter_var($url, FILTER_VALIDATE_URL, FILTER_FLAG_QUERY_REQUIRED) === false) {
    	return true;
	} else {
	    return false;
	}
}

function isIpv6($str){
	if (!filter_var($str, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6) === false) {
    	return true;
	} else {
	    return false;
	}
}

/*
移除 ASCII 值大于 127 的字符
$str = "<h1>Hello WorldÆØÅ!</h1>";
$newstr = filter_var($str, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
echo $newstr;
*/








>