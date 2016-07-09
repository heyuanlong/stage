lua中的变量如果没有特殊说明，全是全局变量，那怕是在语句块或函数里，变量前加local关键字的是局部变量

local esp   = {}
local rsp
local errcode_wrong_param  =   12

local index = math.random(1,len)
str[i] = string.sub(templete,index,index)


 if string.len(body) > 2 then
    --重新生成昵称           
 elseif 3 > 2 then
     break 
 else
	 break
end

while (1)
do
--
end


for i=10,1,-1 
do 
   print(i) 
end


string.gsub(s, pattern, replace [, n])
string.gsub("Hello banana", "banana", "Lua user")

string.sub(s, i [, j])
> = string.sub("Hello Lua user", 7, 9)   -- from character 7 until and including 9
Lua

lua字符串处理了   http://www.cnblogs.com/minggoddess/archive/2011/11/22/2259075.html


-------------------------------------------------------
-- 参数:待分割的字符串,分割字符
-- 返回:子串表.(含有空串)
function lua_string_split(str, split_char)
    local sub_str_tab = {};
    while (true) do
        local pos = string.find(str, split_char);
        if (not pos) then
            sub_str_tab[#sub_str_tab + 1] = str;
            break;
        end
        local sub_str = string.sub(str, 1, pos - 1);
        sub_str_tab[#sub_str_tab + 1] = sub_str;
        str = string.sub(str, pos + 1, #str);
    end

    return sub_str_tab;
end


local substr = string.sub(body,2,string.len(body) - 1) --字符串
substr = string.gsub(substr, '"', '')                  --替换
local substrss = lua_string_split(substr,',')          --分隔为table
for k,v in pairs(substrss) do						   --遍历table
    nickname = string.gsub(nickname, v, '*')
end

--------随机生成器--------
local math = require("math")

Mrandom = { pseed = 0.5}
Mrandom.__index = Mrandom
function Mrandom:new(param)
    local self={}
    setmetatable(self,Mrandom)

    if param < 0 then
        param = param * -1
    end
    if param > 1 then
        param = 1 / param
    end
    if param == 0 then
        param = 0.5
    end
    self.pseed = param
    return self
end

function Mrandom:set(x)
    self.pseed = x
end

function Mrandom:get()
    return self.pseed
end

function Mrandom:getrandom(mix,max)

    --seed = math.pow(seed,2)
    local seed = self:get()
    seed = math.asin(seed)
    seed = seed *10000
    f = math.floor(seed)
    seed = seed-f
    self:set(seed)

    local ran = math.acos(seed)
    fran = math.floor(ran)
    ran  = ran - fran

    return math.modf(ran * (max - mix + 1) + mix)
end

obj = Mrandom:new(2)
local i=1
for i=1,10
do
    print(i..": "..obj:getrandom(1,100))
end
---------------
function fwrite(fmt,...)
    io.write( string.format(fmt,...) )
end
fwrite("test:%s,test:%d","test",999)


local T2009_EndTime = { year=2013, month=2, day=17, hour=23, min=59, sec=59 }
print (os.time(T2009_EndTime))


gameID = 4564565
userID = 121
local param = {
    gameID = gameID,
    userID = userID,
    }
for k,v in pairs(param) do                         --遍历table
    print (k..":"..v)
end





---------nginx-lua

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

---------nginx-lua


