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



local IP = ngx.var.remote_addr
ngx.exit(ngx.HTTP_OK)
ngx.log(ngx.ERR, "baseGameInsert:".."argument have error")



local res, err, errno, sqlstate = mysql:query(sql)
.....
info["gameID"]   =  res.insert_id;



local garg  = req.get_uri_args()
local parg = req.get_post_args()
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

}



--lua-cjson
local cjson = require "cjson"
local json = cjson.encode({
    foo = "bar",
    some_object = {},
    some_array = cjson.empty_array
})



ngx.header.content_type = "application/json;charset=utf8"
ngx.header.content_type = "application/javascript;charset=utf8"

Output API functions (e.g., ngx.say and ngx.send_headers)
Control API functions (e.g., ngx.exit and ngx.exec)
Subrequest API functions (e.g., ngx.location.capture and ngx.location.capture_multi)
Cosocket API functions (e.g., ngx.socket.tcp and ngx.req.socket)



模块基本架构
local say = ngx.say
local _M = {}
function _M.foo(a)
     say(a)
end
return _M


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

















