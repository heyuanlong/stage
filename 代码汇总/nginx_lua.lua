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









