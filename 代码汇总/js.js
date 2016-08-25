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
js判断undefined类型
if (typeof(reValue) == "undefined") { 
   alert("undefined"); 
}  


表单提交前的处理
<input type=submit name="submit1" value="登陆" onclick="return check(this.form)">  


JS中NaN值用isNaN()函数判断


生成天数的下落列表
function getdays(){
		monthsarray = [31,30,31,30,31,30,31,31,30,31,30,31];
		month = $("#month").val();
		month = parseInt(month)
		
		var obj = document.getElementById('day');
		obj.options.length = 0;	
		obj.options.add(new Option("00","00")); 
		for(i=1;i<=monthsarray[month-1];++i){
			var j = ""+i
			if(j.length == 1)
				j="0"+j
			obj.options.add(new Option(j,j));
		}
}

分隔字符串
productmsg = $("#product").val();
var strs= new Array(); //定义一数组 
strs=productmsg.split("_"); //字符分割         	
Login_subsidy.productid =  strs[0];
Login_subsidy.type =   strs[1];


js设置frame的页面
window.parent.document.getElementById("browserframe").src="../blank.jsp";



使用JavaScript的XMLHttpRequest发送POST、GET请求以及接收返回值
	var xhr = new XMLHttpRequest();
	url = encodeURIComponent(url);
	xhr.open("post", "/jump?url="+url, true);  
	xhr.onreadystatechange  = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
		    document.getElementById("response").innerHTML = xhr.responseText;
		}
	}
	data = escape(data);
	xhr.send('data='+data);


