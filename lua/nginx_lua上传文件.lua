local JSON              = require "common.json"
local kolib             = require "common.kolib"
local errcode           = require "common.errcode"
local upload            = require "resty.upload"


local filePath = "/home/www/uploadfile/"
filePath =  filePath..os.date("%Y%m%d", os.time()).."/"
os.execute("mkdir ".. filePath)


--获取文件扩展名
local havegetExt = false
local fileExt=""
local file_name=""
function getExtension(str)
    fileExt = str:match(".+%.(%w+)$")
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


local garg  = ngx.req.get_uri_args()
for k,v in pairs(garg) do
    ngx.say(k,v)
end

local chunk_size = 1024*1024*1024
local form = upload:new(chunk_size)
local file = nil
while true do
    local typ, res, err = form:read()

    if not typ then
         kolib.response_err(errcode.other_fault, "failed to read: "..err)
    end

    if typ == "header" then
        for k,v in pairs(res) do
            ngx.say(k,v)
        end
        get_fileExt(res[2])
        if fileExt ~= "" and havegetExt==false then
            havegetExt = true
            file_name = my_get_file_name()
            file ,err= io.open(file_name, "a+")
            if not file then
                kolib.response_err(errcode.other_fault, "failed to open file "..file_name..err)
            end       
        end
     elseif typ == "body" then
         ngx.say("---------body")
        if file then
            --file:write(res)
        end

    elseif typ == "part_end" then
     ngx.say("---------part_end")
        if file then
        file:close()
        file = nil
        end

    elseif typ == "eof" then
         ngx.say("---------eof")
        break
    else
    end
end
local info = {}
info.filePath = file_name
kolib.response_success_jsonp(info, nil)