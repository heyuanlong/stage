module("common.kolib", package.seeall)


function response_err_jsonp(err, msg, callback)
    local esp       = {}
    esp["status"]   = 1
    esp["code"]     = err
    esp["msg"]      = msg
    local rsp       = JSON:encode(esp)
    if not callback or callback == ngx.null then
        ngx.header.content_type = "application/json;charset=utf8"
        ngx.say(rsp)
    else
        ngx.header.content_type = "application/javascript;charset=utf8"
        ngx.say(callback,"(", rsp,");")
    end
    ngx.exit(ngx.HTTP_OK)
    return
end


{
    ngx.req.read_body()
    local garg  = ngx.req.get_uri_args()
    local parg = ngx.req.get_post_args()
    local args = {}
    for k,v in pairs(garg) do
        --ngx.log(ngx.ERR, "GET KEY [", k, "] = VALUE [", v, "]")
        args[k] = v
    end
    for k,v in pairs(parg) do
        --ngx.log(ngx.ERR, "POST KEY [", k, "] = VALUE [", v, "]")
        args[k] = v
    end
}


--ngx.location.capture
{
	local res = ngx.location.capture("/wc3/user_login_log.do", {
	    args = { 
	        userid      = req["userid"], 
	        mac         = req["mac"],
	        deviceid    = req["deviceid"],
	        pid         = req["pid"],
	        version     = req["version"],
	        channel     = req["channel"],
	        versionName = req["versionName"],
	        api         = ngx.var.uri
	    }
	})
	if res.status == ngx.HTTP_OK then
	    ngx.log(ngx.ERR, "user_login_log : ", res.body)
	end

	res = ngx.location.capture(
	     '/foo/bar',
	     { method = ngx.HTTP_POST, body = 'hello, world' }
	 )

	 res1, res2, res3 = ngx.location.capture_multi{
	     { "/foo", { args = "a=3&b=4" } },
	     { "/bar" },
	     { "/baz", { method = ngx.HTTP_POST, body = "hello" } },
	 }

	 if res1.status == ngx.HTTP_OK then
	     ...
	 end

	 if res2.body == "BLAH" then
	     ...
	 end
}


local host = ngx.var.host
local IP = ngx.var.remote_addr
ngx.exit(ngx.HTTP_OK)
ngx.log(ngx.ERR, "baseGameInsert:".."argument have error")



local res, err, errno, sqlstate = mysql:query(sql)
.....
info["gameID"]   =  res.insert_id;



local garg  = req.get_uri_args()

ngx.req.read_body()
local args = ngx.req.get_post_args()
上面两个函数会默认对值进行urldecode。而ngx.var.arg_value 则不会进行urldecode



local http              = require "resty.http"
local hc                = http:new()
local hurl  = "http://t.matchvs.com/s?gameID="..req["gameID"].."&src="..kolib.urlencode(rsp).."&sign="..str
local ok, code, headers, status, body  = hc:request {
                url     = hurl,
                proxy   = "http://10.10.20.81:80",
                scheme  = 'http',
                method  = "GET", 
            }
ngx.log(ngx.ERR,"---"..hurl.."----")
if not ok then
        respJson, err   = kolib.get_err_response(
                                errcode.other_fault, 
                                "生成短链失败!")
        operateConn.releaseConn(nil, nil, mysql.operate)
        kolib.saygoodbye(callback, respJson)
end
local data = JSON:decode(body)


重定向
ngx.redirect("http://www.google.com",302)


nginx_lua缓存
{
	lua_shared_dict mapIndex 1m;
	local mapIndexDICT = ngx.shared.mapIndex
	local mapIndex, err = mapIndexDICT:incr("mapIndex", 1)
	if mapIndex == nil or mapIndex > 9999 then
	    ngx.shared.mapIndex:set("mapIndex", 1)
	    mapIndex = 1
	end

	local dogs = ngx.shared.dogs;
	ngx.say(dogs:get("Tom"))

	local log_dict = ngx.shared.log_dict
	local upstream_time = tonumber(ngx.var.upstream_response_time)

	local sum = log_dict:get("upstream_time-sum") or 0
	sum = sum + upstream_time
	log_dict:set("upstream_time-sum", sum)

	local newval, err = log_dict:incr("upstream_time-nb", 1)
	if not newval and err == "not found" then
	 log_dict:add("upstream_time-nb", 0)
	 log_dict:incr("upstream_time-nb", 1)
	end


The resulting object dict has the following methods:
get
get_stale
set
safe_set
add
safe_add
replace
delete
incr
flush_all
flush_expired
get_keys
}



--lua-cjson
local cjson = require "cjson"
local json = cjson.encode({
    foo = "bar",
    some_object = {},
    some_array = cjson.empty_array
})


local headers = ngx.req.get_headers()  
local paramsheader            = {"content_length"}
local ok, err           = kolib.check_req(paramsheader, headers)
if not ok then
    kolib.response_err(errcode.wrong_param, "not content_length")
end
ngx.header.content_type = "application/json;charset=utf8"
ngx.header.content_type = "application/javascript;charset=utf8"

Output API functions (e.g., ngx.say and ngx.send_headers)
Control API functions (e.g., ngx.exit and ngx.exec)
Subrequest API functions (e.g., ngx.location.capture and ngx.location.capture_multi)
Cosocket API functions (e.g., ngx.socket.tcp and ngx.req.socket)




ngx.var.VARIABLE和ngx.var.arg_value有何区别？



ngx.OK (0)
ngx.ERROR (-1)
ngx.AGAIN (-2)
ngx.DONE (-4)
ngx.DECLINED (-5) 
ngx.exit accepts NGX_OK, NGX_ERROR, and NGX_DECLINED as input).


HTTP status constants
value = ngx.HTTP_OK (200)
value = ngx.HTTP_SEE_OTHER (303)
value = ngx.HTTP_NOT_MODIFIED (304)
value = ngx.HTTP_MOVED_PERMANENTLY (301)
value = ngx.HTTP_MOVED_TEMPORARILY (302)



ngx.STDERR
ngx.EMERG
ngx.ALERT
ngx.CRIT
ngx.ERR
ngx.WARN
ngx.NOTICE
ngx.INFO
ngx.DEBUG
These constants are usually used by the ngx.log method.



ngx.header.HEADER
{
	 -- equivalent to ngx.header["Content-Type"] = 'text/plain'
 	ngx.header.content_type = 'text/plain';
 	ngx.header['Set-Cookie'] = {'a=32; path=/', 'b=4; path=/'}


获取头部信息
local h = ngx.resp.get_headers()
 for k, v in pairs(h) do
     ...
 end
}
ngx.say("Host: ", ngx.req.get_headers()["Host"])







ngx.req.set_uri_args({a = 3})
ngx.req.set_uri("/foo", true)

ngx.exec("/foo", { a = 3, b = "hello world" })

return ngx.redirect("/foo", 301)
return ngx.redirect("http://www.google.com")
return ngx.redirect('/foo?a=3&b=4')

ok, err = ngx.print(...)
ok, err = ngx.say(...)
Just as ngx.print but also emit a trailing newline.
ngx.log(log_level, ...)
ngx.exit(status)


ngx.sleep(seconds)

newstr = ngx.escape_uri(str)    正编
newstr = ngx.unescape_uri(str)	反编




str = ngx.encode_args(table)
For example,
ngx.encode_args({foo = 3, ["b r"] = "hello world"})
--foo=3&b%20r=hello%20world
ngx.encode_args({baz = {32, "hello"}})
--baz=32&baz=hello

ngx.decode_args



newstr = ngx.encode_base64(str, no_padding?)
newstr = ngx.decode_base64(str)

intval = ngx.crc32_short(str)
intval = ngx.crc32_long(str)
digest = ngx.hmac_sha1(secret_key, str)
digest = ngx.md5(str)
digest = ngx.md5_bin(str)
digest = ngx.sha1_bin(str)
quoted_value = ngx.quote_sql_str(raw_value)  ---------数据库语句


str = ngx.today() --Returns current date (in the format yyyy-mm-dd)
secs = ngx.time() --时间戳
secs = ngx.now()  --返回含有毫秒的时间戳
str = ngx.localtime() --Returns the current time stamp (in the format yyyy-mm-dd hh:mm:ss)
sr = ngx.utctime()    --Returns the current time stamp (in the format yyyy-mm-dd hh:mm:ss) 


captures, err = ngx.re.match(subject, regex, options?, ctx?, res_table?) 
from, to, err = ngx.re.find(subject, regex, options?, ctx?, nth?)
iterator, err = ngx.re.gmatch(subject, regex, options?)
newstr, n, err = ngx.re.sub(subject, regex, replace, options?)
newstr, n, err = ngx.re.gsub(subject, regex, replace, options?)



local sql = "insert into matchvs_pair.pair(matchID, vsID, gameID,createTime, state) values("..req.matchID..","
            ..req.vsID..","..req.gameID..",now(),1)"
local res, err, errno, sqlstate = conns.open:query(sql)
if not res then
    if errno == 1062 then
        kolib.releaseConn(conns)
        kolib.response_err(errcode.other_fault, "该vsID已经插入过")
    end
    ngx.log(ngx.ERR, "插入匹配信息失败,gameID:"..req.gameID..",matchID:"..req.matchID..",vsID:"..req.vsID..",sql:"..sql)
    kolib.releaseConn(conns)
    kolib.response_err(errcode.other_fault, "插入匹配信息失败." ..err..",errno:"..errno)
end


Nginx提供了很多内置的变量,如:
ngx.var.***
$arg_PARAMETER 这个变量包含在查询字符串时GET请求PARAMETER的值。
$args 这个变量等于请求行中的参数。
$binary_remote_addr 二进制码形式的客户端地址。
$body_bytes_sent 传送页面的字节数
$content_length 请求头中的Content-length字段。
$content_type 请求头中的Content-Type字段。
$cookie_COOKIE cookie COOKIE的值。
$document_root 当前请求在root指令中指定的值。
$document_uri 与$uri相同。
$host 请求中的主机头字段，如果请求中的主机头不可用，则为服务器处理请求的服务器名称。
$is_args 如果$args设置，值为"?"，否则为""。
$limit_rate 这个变量可以限制连接速率。
$nginx_version 当前运行的nginx版本号。
$query_string 与$args相同。
$remote_addr 客户端的IP地址。
$remote_port 客户端的端口。
$remote_user 已经经过Auth Basic Module验证的用户名。
$request_filename 当前连接请求的文件路径，由root或alias指令与URI请求生成。
$request_body 这个变量（0.7.58+）包含请求的主要信息。在使用proxy_pass或fastcgi_pass指令的location中比较有意义。
$request_body_file 客户端请求主体信息的临时文件名。
$request_completion 未知。
$request_method 这个变量是客户端请求的动作，通常为GET或POST。包括0.8.20及之前的版本中，这个变量总为main request中的动作，如果当前请求是一个子请求，并不使用这个当前请求的动作。
$request_uri 这个变量等于包含一些客户端请求参数的原始URI，它无法修改，请查看$uri更改或重写URI。
$scheme 所用的协议，比如http或者是https，比如rewrite ^(.+)$ $scheme://example.com$1 redirect;
$server_addr 服务器地址，在完成一次系统调用后可以确定这个值，如果要绕开系统调用，则必须在listen中指定地址并且使用bind参数。
$server_name 服务器名称。
$server_port 请求到达服务器的端口号。
$server_protocol 请求使用的协议，通常是HTTP/1.0或HTTP/1.1。
$uri 请求中的当前URI(不带请求参数，参数位于$args)，可以不同于浏览器传递的$request_uri的值，它可以通过内部重定向，或者使用index指令进行修改。


ngx.var ： nginx变量，如果要赋值如ngx.var.b = 2，此变量必须提前声明；另外对于nginx location中使用正则捕获的捕获组可以使用ngx.var[捕获组数字]获取；
ngx.req.get_headers：获取请求头，默认只获取前100，如果想要获取所以可以调用ngx.req.get_headers(0)；获取带中划线的请求头时请使用如headers.user_agent这种方式；如果一个请求头有多个值，则返回的是table；
ngx.req.get_uri_args：获取url请求参数，其用法和get_headers类似；
ngx.req.get_post_args：获取post请求内容体，其用法和get_headers类似，但是必须提前调用








