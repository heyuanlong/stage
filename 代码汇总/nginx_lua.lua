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
ngx.log(ngx.ERR, "user_login_log : ", res.body)



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
lua_shared_dict mapIndex 1m;
local mapIndexDICT = ngx.shared.mapIndex
local mapIndex, err = mapIndexDICT:incr("mapIndex", 1)
if mapIndex == nil or mapIndex > 9999 then
    ngx.shared.mapIndex:set("mapIndex", 1)
    mapIndex = 1
end









