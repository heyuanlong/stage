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
