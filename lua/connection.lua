module("open.connection", package.seeall)

local VERSION                               = 20150720 -- version history at end of file
local AUTHOR_NOTE                           = "open team"

local redis                                 = require "resty.redis"
local JSON                                  = require "json"
local MYSQL                                 = require "resty.mysql"




local redis_server_ip                       =   "127.0.0.1"
local redis_server_port                     =   6379

local mysql_server_ip                       =   "127.0.0.1"
local mysql_server_port                     =   3306
local mysql_user_name                       =   "root"
local mysql_user_pass                       =   "CQMYG14dss"
local mysql_max_packet_size                 =   1024 * 1024

local redis_type                            =   1
local mysql_type                            =   2

function        getRedis(userID, gameID)
    local red               = redis:new()
    local ok, err           = red:connect(redis_server_ip, redis_server_port)
    if not ok then
        return nil, err
    end
    red:set_timeout(1000)
    return red,nil
end

function        getMysql(userID, gameID)
    local mysql             = MYSQL:new()
    local ok, err, errno, sqlstate = mysql:connect{
        host = mysql_server_ip,
        port = mysql_server_port,
        database = "ko_open",
        user = mysql_user_name,
        password = mysql_user_pass,
        max_packet_size = mysql_max_packet_size,
        charset=utf8 }
    if not ok then
        return nil, err, errno, sqlstate
    end
     mysql:set_timeout(1000)
    return mysql,nil,nil,sqlstate
end


function       releaseConn(userID, gameID, redisConn, mysqlConn)
    if redisConn then
        local ok, err           = redisConn:set_keepalive(10000, 100)
        if not ok then
            return ok, redis_type, err
        end
    end
    if mysqlConn then
        local ok, err           = mysqlConn:set_keepalive(10000, 100)
        if not ok then
            return ok, mysql_type, err
        end
    end 
    return true, nil, nil
end
