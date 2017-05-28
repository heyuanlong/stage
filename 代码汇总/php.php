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

include 和 require 处理错误的方式不同，
    require 生成一个致命错误（E_COMPILE_ERROR），在错误发生后脚本会停止执行。
    include 生成一个警告（E_WARNING），在错误发生后脚本会继续执行。
include 有返回值，而 require 没有。


if (!@include_once 'config.inc.php') {
    //抑制错误提示，并判断文件不存在
}

file_exists() 函数检查文件或目录是否存在。如果指定的文件或目录存在则返回 true，否则返回 false。

header() 用于发送原生的 HTTP 头
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: no-cache");
header("Pragma: no-cache");
header('Location: http://www.example.com/'); exit; //页面跳转
>