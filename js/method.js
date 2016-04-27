function getNowFormatDate() 
{
    var now = new Date();
   
    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日
   
    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分
    var sec = now.getSeconds();			//秒
   
    var clock = year + "-";
   
    if(month < 10)
        clock += "0";
   
    clock += month + "-";
   
    if(day < 10)
        clock += "0";
       
    clock += day + " ";
   
    if(hh < 10)
        clock += "0";
       
    clock += hh + ":";
    if (mm < 10) clock += '0'; 
    clock += mm+ ":";

    if (sec < 10) clock += '0'; 
    clock += sec; 

    return(clock); 
}

//2016-04-10   days
function addDate(curdate,days){
	 dd = new Array;
	 dd = curdate.split("-");

	 var ye = parseInt(dd[0]);
	 
	 var mo = 0;
	 if(dd[1].charAt(0) == '0')
		  mo = parseInt(dd[1].substr(1));
	 else 
		  mo = parseInt(dd[1]);
	 mo = mo - 1;
	 
	 var da = 0;
	 if(dd[2].charAt(0) == '0')
		  da = parseInt(dd[2].substr(1));
	 else 
		  da = parseInt(dd[2]);
	 
	 var curDate = new Date(ye,mo,da,0,0,0);
	 var newDate=new Date(curDate.getTime() + days * 24 *3600 * 1000);


	 var year = newDate.getFullYear();       //年
	 var month = newDate.getMonth() + 1 ;     //月
	 var day = newDate.getDate();            //日
	 var clock = year + "-";	   
	    if(month < 10){
	        clock += "0";	
	    }  
	    clock += month + "-";   
	    if(day < 10){
	        clock += "0";
	    }       
	    clock += day;
	return clock;
}
	
function getFileExtension(name){
	if (!isEmpty(name)) {
        var sep = Math.max(name.lastIndexOf("\\"), name.lastIndexOf("/"));
        var dot = name.lastIndexOf(".");
        if (dot >= 0 && sep < dot) {
            return name.substring(dot + 1);
        }
    }
    return "";
}