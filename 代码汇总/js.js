跳转页面
window.location.href="url";
跳转到新页面
window.open("url");

Js方法：
 escape(String) 函数可对字符串进行编码；
 unescape(String) 函数可对字符串进行解码；

json字符串转到json对象
var str = '{"os":"osx","engine":"H5","sdkname":"test","editby":"onizukaspm"}';
var obj =  eval('(' + str + ')'); //由JSON字符串转换为JSON对象
alert(obj);
alert(obj.os);


获取和设置select的值
Doc_log.os =  $("#os").val();
$("#os").val(data.os);


document.getElementById('cba').onclick = function(){};//改变点击触发的方法
$("#real_name").attr("readonly","readonly");//设置一些为只读模式；
$("#Profile_picture").attr('src',"<%=operatorIDFront%>");
$("#upload_photo_form").css('display',"none");//隐藏添加图片


js函数不介意传递进来多少个参数，也不在乎穿进来参数是什么数据类型,不足的伪undefined

表单提交前的处理
<input type=submit name="submit1" value="登陆" onclick="return check(this.form)">  


JS中NaN值用isNaN()函数判断