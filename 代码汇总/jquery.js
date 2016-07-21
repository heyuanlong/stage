<textarea id="demo">sss</textarea>
alert($("#demo").val());//弹出textarea的值

var rel = $(this).attr("rel");
var txt = $(this).text();

$("#dropdown6 .input_select6").val(txt);
$("#dropdown6 .input_select6").attr("rel",rel);


//加载完对指定的标签执行方法
$(function(){
	$(".sessi").each(function(){	
		var cistatusw = $(this).text();
		if(cistatusw.indexOf("收费场") != -1){
			$(this).css("color","red");
		}else{
			$(".changcistatus").css("color","#666666");
		}	
	});
});	

//加载完对指定的标签绑定方法
$(function() {
	$("#dropdow ul li a").click(
			function() {
				var txt = $(this).text();
				$(".input_select").val(txt);
				var id0 = $(this).attr("rel");
				$("#dropdow ul").hide();
				for (var i = 1; i <= <%=counts %>; i++) {						
						$("#game_" + i).css("background", "#fff");
				}

				$(this).css("background","#f7f7f7 url(../images/images_dl/tu_1.png) no-repeat 158px 4px");
				$(this).css("background-size","13px");
				alert("您选择了" + txt + "，值为：" + id0);
	});
});


<span id="s_goodsID"></span>
$("#s_goodsID").text(goodsid);	