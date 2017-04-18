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



>