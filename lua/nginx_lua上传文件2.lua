local JSON              = require "common.json"
local kolib             = require "common.kolib"
local openConn          = require "open.connection"
local errcode           = require "common.errcode"
local upload            = require "resty.upload"


local fileMaxSize = 1024 * 100  --字节
local fileSize = 0
local filePath = "/data/matchvs.com/files/upload/"
filePath =  filePath..os.date("%Y%mAvatar", os.time()).."/"
os.execute("mkdir ".. filePath)


local chunk_size = 1024 * 1024
local form = upload:new(chunk_size)
local file = nil

--获取文件扩展名
local havegetExt = false
local fileExt=""
local file_name=""
local conns = {}


function getExtension(str)
    local ex = {png=1,
                jpg=1,
                jpeg=1,
                bmp=1}
    fileExt = str:match(".+%.(%w+)$")
    if ex[fileExt] == nil then
        kolib.releaseConn(conns)
        kolib.response_err(errcode.other_fault, "just upload png,jpg,jpeg,bmp")
    end
    return fileExt
end
function get_fileExt(res) 
    local filename = ngx.re.match(res,'(.+)filename="(.+)"(.*)') 
    if filename then  
        return getExtension(filename[2])
    end 
end 
function my_get_file_name()
    local index = ngx.shared.dictIndex
    local fileIndex, err = index:incr("fileIndex", 1)
    if fileIndex == nil or fileIndex > 9999 then
        ngx.shared.dictIndex:set("fileIndex", 1)
        fileIndex = 1
    end   
    return filePath..ngx.time() ..fileIndex.."."..fileExt
end


function signCheck(sign, param, matchKey, matchSecret)
    local str = kolib.makeSignCommon(param, "&", matchKey, matchSecret)
    if str == sign then
        return true,str
    else
        return false,str
    end
end


local garg  = ngx.req.get_uri_args()
local params            = {"userID","sign"}
local ok, err           = kolib.check_req(params, garg)
if not ok then
    kolib.response_err(errcode.wrong_param, err)
end

local headers = ngx.req.get_headers()  
local paramsheader            = {"content_length"}
local ok, err           = kolib.check_req(paramsheader, headers)
if not ok then
    kolib.response_err(errcode.wrong_param, "headers not content_length")
end
if tonumber(headers.content_length) > fileMaxSize then
    kolib.response_err(errcode.wrong_param, "content_length > 100kb")
end



local red, err = openConn.getRedis(nil)
if not red then
    kolib.response_err(errcode.other_fault, "get redis failed,"..err)
end

conns.red = red


local conn,err          = openConn.getMysql(nil)
if not conn then
    kolib.releaseConn(conns)
    kolib.response_err(errcode.other_fault, "Connect to MySQL server (pay) failed! "..err)
end

conns.open               = conn

---------------------------------------------get redis start

local key               = "ko.user." .. garg["userID"]
local res, err          = conns.red:hmget(key, "user_token")
if not res then
    kolib.releaseConn(conns)
    kolib.response_err(errcode.other_fault, "Connect to redis server failed! "..err)
    return
end

if res == ngx.null then
    kolib.releaseConn(conns)
    kolib.response_err( errcode.errcode_no_this_user, "no this user! ")
    return
end
if  res[1] == ngx.null or res[1]== nil then
    kolib.releaseConn(conns)
    kolib.response_err( errcode.errcode_no_this_user, "no this user! ")
    return
end

local token_str  = res[1]


---------------------------------------------get redis end



---------------------------------------------check sign  start
local param = {
    userID = garg["userID"],
}


local res, str = signCheck(garg["sign"], param, token_str, token_str)
if not res then
    kolib.releaseConn(conns)
    ngx.log(ngx.ERR, "签名失败:userID:"..garg["userID"]..":token:"..token_str..",sign:"..str)
    kolib.response_err(errcode.other_fault, "签名失败:" .. kolib.table_dump(req))
    
end
---------------------------------------------check sign end





while true do
    local typ, res, err = form:read()

    if not typ then
        kolib.releaseConn(conns)
        kolib.response_err(errcode.other_fault, "failed to read: "..err)
    end

    if typ == "header" then
        get_fileExt(res[2])
        if fileExt ~= "" and havegetExt==false then
            havegetExt = true
            file_name = my_get_file_name()
            file ,err= io.open(file_name, "a+")
            if not file then
                kolib.releaseConn(conns)
                kolib.response_err(errcode.other_fault, "failed to open file "..file_name..err)
            end       
        end
    elseif typ == "body" then         
        if file then
            fileSize = fileSize + string.len(res)
            if fileSize > tonumber(headers.content_length) then
                kolib.releaseConn(conns)
                os.execute("rm -f ".. file_name) 
                kolib.response_err(errcode.other_fault, "文件尺寸大于content_length")
            end
            file:write(res)
        end
    elseif typ == "part_end" then    
        if file then
            file:close()
            file = nil
        end
    elseif typ == "eof" then         
        break
    else

    end
end

local info = {}
info.filePath = file_name
kolib.response_success_jsonp(info, nil)