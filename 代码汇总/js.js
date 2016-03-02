跳转页面
window.location.href="url";

Js方法：
 escape(String) 函数可对字符串进行编码；
 unescape(String) 函数可对字符串进行解码；

json字符串转到json对象
var str = '{"os":"osx","engine":"H5","sdkname":"test","editby":"onizukaspm"}';
var obj =  eval('(' + str + ')'); //由JSON字符串转换为JSON对象
alert(obj);
alert(obj.os);
