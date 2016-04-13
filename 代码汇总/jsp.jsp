<%
/**
 * 获取String类型的request参数
 * @param request
 * @param key
 * @param defaultValue
 * @return
 */
public static final String getStringParameter(HttpServletRequest request, String key, String defaultValue){
    String value = request.getParameter(key);
    if(StringUtil.isEmpty(value)){
        value = defaultValue;
    }
    return value;
}
/**
         * String转换为int
         * @param number
         * @param defaultValue
         * @return
         */
        public static final int parseInt(String number, int defaultValue){
            int value;
            try{
                value = Integer.parseInt(number);
            }catch(Exception e){
                value = defaultValue;
            }
            return value;
        }
/**
 * 获取int类型的request参数
 * @param request
 * @param key
 * @param defaultValue
 * @return
 */
public static final int getIntParameter(HttpServletRequest request, String key, int defaultValue){
    return NumberUtil.parseInt(request.getParameter(key), defaultValue);
}


<%=errorMsg.length()>0?"block":"none" %>

web.xml配置首先页面
<welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
</welcome-file-list>



jsp页面禁止缓存设置
    1.客户端缓存要在<head>中加入类似如下内容： 
    <META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
    <META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
    或  
    <meta http-equiv="pragma" content="no-cache"> 
    <meta http-equiv="cache-control" content="no-cache"> 
    <meta http-equiv="expires" content="0">      

    2.在服务器的动态网页中禁止缓存，要加入类似如下脚本 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 

    3.设置有限时间的缓存 
    int minutes = 10; 
    Date d = new Date(); 
    String modDate = d.toGMTString(); 
    String expDate = null; 
    expDate = (new Date(d.getTime() + minutes * 60000)).toGMTString(); 
    response.setHeader("Last-Modified", modDate); 
    response.setHeader("Expires", expDate); 
    response.setHeader("Cache-Control", "public"); //   HTTP/1.1 
    response.setHeader("Pragma", "Pragma"); //   HTTP/1.0 
    建议：jsp cache最好做在过滤器上,把需要缓冲的页面集中在同一个目录下,每次更改只须更改web.xml就可以完成缓冲设置,这样比较方便.
               

    4.最后如果以上方法都不行的话，就在你的正常的URL后面加上一个尾巴
    在JS中就选择
    var timestamp = (new Date()).valueOf();  
    URL+"&timestamp="+timestamp;

    在Java代码中就选择
    long timestamp=new Date().getTime();
    URL+"&timestamp="+timestamp;
    这样的话，你的URL始终都在变化，自然浏览器就得老老实实的进行更新了，它也无缓冲可拿了。