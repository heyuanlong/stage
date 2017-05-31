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

<%
java_session 
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

    public void setGameid(int gameid){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = attr.getRequest();
        request.getSession(true).setAttribute("gameID", gameid);
    }
    
    public int getGameid() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = attr.getRequest();
        Object ob = request.getSession(true).getAttribute("gameID");
        if(ob == null){
            return 0;
        }
        else {
            return (int)ob;
        }
    }

%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.matchvs.portal.vo.Developer"%>
<%@page import="com.matchvs.portal.vo.*"%>

将当前jsp页面设置为错误处理页面
<%@ page isErrorPage="true"%>
设置处理jsp页面错误处理的页面
<%@ page errorPage="error/ErrorPage.jsp"%>
把另一个文件直接包含到代码里
<%@ include file="page"%>


<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1    
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
    String contextPath = request.getContextPath();
%>
<link href="<%=contextPath%>/css/styles.css" type="text/css" rel="stylesheet" charset="utf-8" />
<script src="<%=contextPath%>/js/SetValue.js"  type="text/javascript"></script>


动作标识
编译完再包含进来
<jsp:include page="header.html" flush="true"/><!--动态包含--> 
把请求转发到其他的web资源
<jsp:forward page="login.jsp" /><!--动态包含--> 

<%
String value = request.getParameter("key");

//在进行请求转发时，需要把一些数据传递到转发后的页面进行处理。这时，就需要使用request对象的setAttribute()方法将数据保存到request范围内的变量中。
request.setAttribute(String name ,Object object);
//<jsp:forward page="test1/forward.jsp" />
request.getAttribute(String name);
//<%= request.getAttribute("testname").toString() %>


重定向
response.sendRedirect(String path);

禁用缓存
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1    
response.setHeader("Pragma","no-cache"); //HTTP 1.0    
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server   

自动跳转
response.setHeader("refresh" ,"5");
定时跳转
response.setHeader("refresh" ,"5;URL=login.jsp");


//使用request对象的getSession()获取session，如果session不存在则创建一个
HttpSession session = request.getSession();
//将数据存储到session中
session.setAttribute("data", "孤傲苍狼");
//获取session的Id
String sessionId = session.getId();
String value = session.getAttribute("data").toString();
session.removeAttribute("data");
session.setMaxInactiveInterval(100);



//application 对象用于保存所有应用程序中的公有数据。它在服务器启动时自动创建。
String value = application.getAttribute("name");
application.setAttribute("name","value");
application.removeAttribute("name");

%>

//out对象最基本的应用就是向客户端浏览器输出信息
<% out.println("aaaaa") %>
<%="aaaaa"%>


<%
//jsp还提供了pageContext ， config，page，exception对象。
//Servlet是JavaWeb三大组件之一（Servlet、Filter、Listener）

//servlet是运行在web服务器端的java应用程序，它使用java语言编写，具有java语言的优点。与java程序的区别是，servlet对象主要封装了对HTTP请求的处理。



右键项目名称-》Java EE Tools-》Generate Deployment descriptor stub
即可生成web.xml文件。

String value=sre.getServletRequest().getParameter("key");//获取request中的参数
String value=sce.getServletContext().getInitParameter("属性名");


 这就是HttpSessionBindingListener和HttpSessionListener之间的最大区别
 HttpSessionListener只需要设置到web.xml中就可以监听整个应用中的所有session。
 HttpSessionBindingListener必须实例化后放入某一个session中，才可以进行监听。

<listener>  
  <listener-class>com.test3.SecondListener</listener-class>  
</listener>  


@WebServlet(urlPatterns = {"/simple"}, asyncSupported = true, 
loadOnStartup = -1, name = "SimpleServlet", displayName = "ss", 
initParams = {@WebInitParam(name = "username", value = "tom")} 
) 

@WebFilter(urlPatterns={"/*"}, filterName="my3Filter", asyncSupported=true)  
@WebInitParam(name="a", value="valuea")  



insert      executeUpdate
select      executeQuery
update      executeUpdate
delete      executeUpdate


HttpServletRequest request
HttpServletResponse response
request.getRequestDispatcher("book_list.jsp").forward(request, response);//请求转发到..
response.sendRedirect("FindServlet")//重定向到FindServlet

%>
