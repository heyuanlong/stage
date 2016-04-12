<textarea id="demo">sss</textarea>
alert($("#demo").val());//弹出textarea的值

var rel = $(this).attr("rel");
var txt = $(this).text();

$("#dropdown6 .input_select6").val(txt);
$("#dropdown6 .input_select6").attr("rel",rel);
