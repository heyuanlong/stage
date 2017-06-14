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
for i=11,31 do
   print (i)
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
print(os.date("%Y-%m-%d %H:%M:%S", os.time()))

gameID = 4564565
userID = 121
local param = {
    gameID = gameID,
    userID = userID,
    }
for k,v in pairs(param) do                         --遍历table
    print (k..":"..v)
end


local IP = ngx.var.remote_addr
local nums= 0
local str = IP
for i=1,#str do
    nums = nums + string.byte(str,i)
end

math.randomseed(nums)
math.random()  返回区间[0,1) 内的实数
math.random(n)  返回区间[1,n]
math.random(n,m)  返回区间[n,m]




模块基本架构
{
1.
    module("common.koconf", package.seeall)
    function _M.getEnv()
         return 3
    end
    _M.Env=4
    return _M

2.
    module("common.koconf", package.seeall)
    Env=3
    function getEnv()
        return 3
    end

3.
    _M={}
    function _M.getEnv()
        return 88888883
    end
    _M.Env=4
    return _M


}



--table.insert(table, pos, value)
--table.insert()函数在table的数组部分指定位置(pos)插入值为value的一个元素. pos参数可选, 默认为数组部分末尾

--table.concat(table, sep,  start, end)
--table.concat()函数列出参数中指定table的数组部分从start位置到end位置的所有元素,
--元素间以指定的分隔符(sep)隔开

if reqinfo["headimgurl"] then
    sqlavatar = "avatar='"..reqinfo["headimgurl"].."'"
    table.insert(sqlt, sqlavatar)
end
if reqinfo["sex"] then
    sqlsex = "sex="..reqinfo["sex"]..""
    table.insert(sqlt, sqlsex)
end
local sql = "update user set "..table.concat(sqlt,",").." where userID="..req["userid"] 




local ret = io.popen("gcc temp.c -o temp 2>&1") 
ngx.say(ret:read("*all")) --读取管道返回数据
ret:close() 

os.execute("mkdir ".. filePath)



http://blog.csdn.net/booirror/article/details/39831869

filePath  = "/data/matchvs.com/files/upload/201609Avatar/1472701065144.png"
dir, dirsub,file = filePath:match'(.*/)(.*/)(.*)'
print (dir)
print (dirsub)
print (file)
--   /data/matchvs.com/files/upload/
--   201609Avatar/
--   1472701065144.png
filePathaa  = "600600"
dir, dirsub = filePathaa:match'(%d+)*(%d+)'
print (dir)
print (dirsub)
--600
--600


生成随机字符串
local str = {}
local tlow="qwertyuiopasdfghjklzxcvbnm"
local tup ="QWERTYUIOPASDFGHJKLZXCVBNM"
local tnum="0123456789"
local tother="_"
local templete = tlow..tup..tnum..tother
local len = string.len(templete)  
for i=1,5,1 do
    local index = math.random(1,len)
    str[i] = string.sub(templete,index,index)
end


function post (url, data)
    local handle = io.popen("curl '" .. url .. "' -d '" .. data .. "'")
    local result = handle:read("*all")
    --ngx.say("curl '" .. url .. "' -d '" .. data .. "'")
    handle:close()
    return result
end




语法
pcall( f , arg1,···)
返回值
函数执行状态 (boolean)
    没有错误返回 true
    有错误返回 false
    发生错误返回错误信息，否则返回函数调用返回值
pcall 示例
    function square(a)
      return a * "a"
    end
    local status, retval = pcall(square,10);
    print ("Status: ", status)        -- 打印 "false" 
    print ("Return Value: ", retval)  -- 打印 "input:2: attempt to perform arithmetic on a string value"


xpcall
xpcall (f, msgh [, arg1, ···])
返回值
函数执行状态 (boolean)
    没有错误返回 true
    有错误返回 false
    发生错误返回错误信息，否则返回函数调用返回值
xpcall 类似 pcall xpcall接受两个参数：调用函数、错误处理函数

比如使用 debug.traceback 获取栈信息
status, err, ret = xpcall(square, debug.traceback, 10)



next (table [, index])
功能：允许程序遍历表中的每一个字段，返回下一索引和该索引的值。
参数：table：要遍历的表
　　　index：要返回的索引的前一索中的号，当index为nil[]时，将返回第一个索引的值，当索引号为最后一个索引或表为空时将返回nil
注：可以用next(t)来检测表是否为空(此函数只能用于以数字索引的表与ipairs相类似)



pairs 和 ipairs区别
http://blog.csdn.net/witch_soya/article/details/7556595



Lua认为false和nil为"假"，其他任何值都是"真"。注意，跟其他语言不同的是，Lua认为0和空字符串为"真"。
print (3 and 1 )				--1
print (false and 0) 			--false
print (true and 3 or 1)			--3
print (false and 3 or 1)		--1
print (3 and false or 0)		--0
print (3 and false or false )	--false
print (3 and true)				--true
print (0 and true or 1)			--true



local num = 65134
local str = string.char(num / 256) .. string.char(num % 256)
print("#str:"..#str)
local s = str:byte(1) * 256 + str:byte(2)				--65134
local s = string.byte(str) * 256 + string.byte(str,2)	--65134


string.sub(s, 2, -2)返回去除第一个和最后一个字符后的子串.
string.char(number)	 返回字符
string.byte(string)	 返回数字


前向声明
local  f,g
function g()
	f()
end
function f()
	g()
end

