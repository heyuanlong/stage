
加载配置
static {
    InputStream in = Client.class.getClassLoader().getResourceAsStream("api.cfg.properties");
    Properties properties = new Properties();
    try {
    properties.load(in);
    UC_API = properties.getProperty("UC_API");
    UC_IP = properties.getProperty("UC_IP");
  } catch (Exception e) {
    e.printStackTrace();
  }
}


import org.json.*;
JSONObject jsobjcet = new JSONObject();
