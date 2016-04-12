笔记来自 ：https://github.com/andycai/luaprimer


使用 local 创建一个局部变量，与全局变量不同，局部变量只在被声明的那个代码块内有效

代码块(block)
do
    local a2 = 2*a
    x2 = (-b - d)/a2
end  

Lua 基本数据类型共有八个：nil、boolean、number、string、function、userdata、thread、table。

Nil Lua中特殊的类型，他只有一个值：nil,一个全局变量没有被赋值以前默认值为nil；给全局变量负nil可以删除该变量。

Booleans 两个取值false和true。但要注意Lua中所有的值都可以作为条件。在控制结构的条件中除了false和nil为假，其他值都为真。所以Lua认为0和空串都是真。

Numbers 即实数，Lua 中的所有数都用双精度浮点数表示。

Strings 字符串类型，指字符的序列，Lua中字符串是不可以修改的，你可以创建一个新的变量存放你要的字符串。

Table 是很强大的数据结构，也是 Lua 中唯一的数据结构。可以看作是数组或者字典。

Function 函数是第一类值（和其他变量相同），意味着函数可以存储在变量中，可以作为函数的参数，也可以作为函数的返回值。

Userdata userdata可以将C数据存放在Lua变量中，userdata在Lua中除了赋值和相等比较外没有预定义的操作。userdata用来描述应用程序或者使用C实现的库创建的新类型。例如：用标准I/O库来描述文件。

Thread 线程会在其它章节来介绍。


可以用 type 函数取得表达式的数据类型：
print(type(undefined_var))
print(type(true))
print(type(3.14))
print(type('Hello World'))
print(type(type))
print(type({}))


算术运算符：+ - * / ^ (加减乘除幂)
关系运算符：< > <= >= == ~=
逻辑运算符：and or not
连接运算符：..

表的构造：
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
polyline = {color="blue", thickness=2, npoints=4,
              {x=0,   y=0},
              {x=-10, y=0},
              {x=-10, y=1},
              {x=0,   y=1}
}

多重赋值和多返回值
year, month, day = 2011, 3, 12
print(year, month, day)
reutrn year, month, day -- 多返回值
a, b = f()


if:
	name = "peach"
	if name == "apple" then
	    -- body
	elseif name == "banana" then
	    -- body
	else
	    -- body
	end

for:
	-- 初始值, 终止值, 步长
	for i=1, 10, 2 do
	    print i
	end

	-- 数组
	for k, v in ipairs(table) do
	    print(k, v)
	end

	-- 字典
	for k, v in pairs(table) do
	    print(k, v)
	end

while:
	while i<10 do
	    print i
	    i = i + 1
	end

repeat-until:
	repeat
	    print i
	    i = i + 1
	until i < 10

Lua语法要求break和return只能出现在block的结尾一句（也就是说：作为chunk的最后一句，或者在end之前，或者else前，或者until前）：

lua设置全局变量本质就是在全局表中添加字段，所以 lua_getglobal 函数本质是从全局表中读取字段。没错，lua_getglobal 本身就是一个宏：

#define lua_getglobal(L,s)  lua_getfield(L, LUA_GLOBALSINDEX, s)
宏 LUA_GLOBALSINDEX 指明的就是全局表的索引。


lua 中真正存储全局变量的地方不是在 _G 里面，而是在setfenv（i,table）的table中，所有当前的全局变量都在这里面找，只不过在程序开始时lua会默认先设置一个变量 _G= 这个里面的table而已。所以在新设置环境后，如果还想找到之前的全局变量，通常需要附加上为新的table设置元表{_index=_G}
local mt={__index=_G}
local t={}
setmetatable(t,mt)
setfenv(1,t)
print(a)
print(_G.a)


(3) 创建模块
	其实 Lua 的模块是由变量、函数等已知元素组成的 table，因此创建一个模块很简单，就是创建一个 table，然后把需要导出的常量、函数放入其中，最后返回这个 table 就行。格式如下：

	-- 定义一个名为 module 的模块
	module = {}

	-- 定义一个常量
	module.constant = "this is a constant"

	-- 定义一个函数
	function module.func1()
	    io.write("this is a public function!\n")
	end

	local function func2()
	    print("this is a private function!")
	end

	function module.func3()
	    func2()
	end

	return module
	由上可知，模块的结构就是一个 table 的结构，因此可以像操作调用 table 里的元素那样来操作调用模块里的常量或函数。不过上面的 func2 声明为程序块的局部变量，即表示一个私有函数，因此是不能从外部访问模块里的这个私有函数，必须通过模块里的共有函数来调用。

	最后，把上面的模块代码保存为跟模块名一样的 lua 文件里（例如上面是 module.lua），那么一个自定义的模块就创建成功。


(4)加载模块
	Lua 提供一个名为 require 的函数来加载模块，使用也很简单，它只有一个参数，这个参数就是要指定加载的模块名，例如：
	require("<模块名>")
	-- 或者是
	-- require "<模块名>"
	然后会返回一个由模块常量或函数组成的 table，并且还会定义一个包含该 table 的全局变量。
	或者给加载的模块定义一个别名变量，方便调用：

	local m = require("module")
	print(m.constant)
	m.func3()
	require 的意义就是导入一堆可用的名称，这些名称（非local的）都包含在一个table中，这个table再被包含在当前的全局表（“通常的那个_G”）中，这样访问一个模块中的变量就可以使用_G.table.**了，初学者可能会认为模块里的名称在导入后直接就是在 _G 中了。

	m=require module 
	的 m 取决于这个导入的文件的返回值，没有返回值时true，所以在标准的情况下模块的结尾应该 return 这个模块的名字，这样 m 就是这个模块的table了。


(5) 加载机制
	对于自定义的模块，模块文件不是放在哪个文件目录都行，函数 require 有它自己的文件路径加载策略，它会尝试从 Lua 文件或 C 程序库中加载模块。

	require 用于搜索 Lua 文件的路径是存放在全局变量 package.path 中，当 Lua 启动后，会以环境变量 LUA_PATH 的值来初始这个环境变量。如果没有找到该环境变量，则使用一个编译时定义的默认路径来初始化。

	当然，如果没有 LUA_PATH 这个环境变量，也可以自定义设置，在当前用户根目录下打开 .profile 文件（没有则创建，打开 .bashrc 文件也可以），例如把 "~/lua/" 路径加入 LUA_PATH 环境变量里：

	#LUA_PATH
	export LUA_PATH="~/lua/?.lua;;"
	文件路径以 ";" 号分隔，最后的 2 个 ";;" 表示新加的路径后面加上原来的默认路径。

	接着，更新环境变量参数，使之立即生效：

	source ~/.profile
	这时假设 package.path 的值是：

	/Users/dengjoe/lua/?.lua;./?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua
	那么调用 require("module") 时就会尝试打开以下文件目录去搜索目标

	/Users/dengjoe/lua/module.lua;
	./module.lua
	/usr/local/share/lua/5.1/module.lua
	/usr/local/share/lua/5.1/module/init.lua
	/usr/local/lib/lua/5.1/module.lua
	/usr/local/lib/lua/5.1/module/init.lua
	如果找过目标文件，则会调用 package.loadfile 来加载模块。否则，就会去找 C 程序库。搜索的文件路径是从全局变量 package.cpath 获取，而这个变量则是通过环境变量 LUA_CPATH 来初始。搜索的策略跟上面的一样，只不过现在换成搜索的是 so 或 dll 类型的文件。如果找得到，那么 require 就会通过 package.loadlib 来加载它。


函数的本质
	第六章 More About Functions 中说到我们平时在 Lua 中写的函数声明
	function foo (x) return 2*x end
	其实是一种语法糖，本质上我们可以把它写成如下代码：

	foo = function (x) return 2*x end
	于是也就可以说
	Lua 中的所有函数都是匿名函数，之前所谓「具名函数」只是保存了某个匿名函数的变量罢了。
	Lua 中的函数声明其实只是一个语句而已。

Lua 给我的感觉是：各种内置函数和标准库的存在感都是比较强的。如果执行这句：
local name
for name in pairs(_G)
do
	print(name)
end
就会把各种环境中已存在名称的打印出来：

改变函数的环境
	a = 3
	setfenv(1, { g = _G })
	g.print(a)             -- 输出 nil
	g.print(g.a)           -- 输出 3


沙盒
Lua 5.2 的 _ENV 变量
	-- Lua 5.1
	function foobar()
	  setfenv(1, {})
	  -- code here
	end

	-- Lua 5.2
	function foobar()
	  local _ENV = {}
	  -- code here
	end



面向对象
	如何将独立的 takeDamage 塞进 player 中咧？答案是直接定义进去：
	player = { health = 200 }
	function player.takeDamage(self, amount)
	  self.health = self.health - amount
	end
	player.takeDamage(player, 20)  --> 调用
	这样就相当于在 player 表中添加了一个叫做 takeDamage 的字段，和下面的代码是一样的：

	player = {
	  health = 200,
	  takeDamage = function(self, amount)  --> Lua 中的函数是 first-class value
	    self.health = self.health - amount
	  end
	}
	player.takeDamage(player, 20)  --> 调用
	调用时的 player.takeDamage(player, 20) 稍显不和谐（据说用术语叫做 DRY），于是就要出动「冒号操作符」这个专门为此而生的语法糖了：

	player:takeDamage(20)              --> 等同于 player.takeDamage(player, 20)
	function player:takeDamage(amount) --> 等同于 function player.takeDamage(self, amount)




从对象升华到类
	类的意义在于提取一类对象的共同点从而实现量产（我瞎扯的 >_<）。同样木有 Class 概念的 Javascript 使用 prototype 实现面向对象，Lua 则通过 Metatable 实现与 prototype 类似的功能。

	Player = {}

	function Player:create(o)    --> 参数 o 可以暂时不管
	  o = o or { health = 200 }  --> Lua 的 or 与一般的 || 不同，如果非 nil 则返回该非 nil 值
	  setmetatable(o, self)
	  self.__index = self
	  return o
	end

	function Player:takeDamage(amount)
	  self.health = self.health - amount
	end

	playerA = Player:create()  --> 参数 o 为 nil
	playerB = Player:create()

	playerA:takeDamage(20)
	playerB:takeDamage(40)
	顾名思义 Metatable 也是一个 Table，可以通过在其中存放一些函数（称作 metamethod）从而修改一些默认的求值行为（如何显示为字符串、如何相加、如何连接、如何进行索引）。Metatable 的 __index 域设置了「如何进行索引」的方法。例如调用 foo.bar 时，如果在 foo 中没有找到名为 bar 的域时，则会调用 Metatable：__index(foo, bar)。于是：

	playerA:takeDamage(20)
	因为在 playerA 中并不存在 takeDamge 函数，于是求助于 Metatable：

	getmetatable(playerA).__index.takeDamage(playerA, 20)
	带入 Metatable 后：

	Player.__index.takeDamage(playerA, 20)
	因为 Player 的 __index 在 create 时被指定为 self，所以最终变为：

	Player.takeDamage(playerA, 20)
	于是 takeDamage 的 self 得到了正确的对象 playerA。


继承
	Player = {}
	function Player:create(o)    --> 参数 o 可以暂时不管
	  o = o or { health = 200 }  --> Lua 的 or 与一般的 || 不同，如果非 nil 则返回该非 nil 值
	  setmetatable(o, self)
	  self.__index = self
	  return o
	end
	function Player:takeDamage(amount)
	  self.health = self.health - amount
	end

	RMBPlayer = Player:create()
	function RMBPlayer:broadcast(message)  --> 为子类添加新的方法
	  print(message)
	end
	function RMBPlayer:takeDamage(amount)  --> 子类重载父类方法
	  self.health = self.health - amount / (self.money / 100)
	  print (self.health )
	end

	vip = RMBPlayer:create ({ money = 200 ,health = 200}) --> 子类添加新成员（单个 Table 作为参数可以省略括号）

	vip:takeDamage(20)
	vip:broadcast("F*ck")


标准库
	https://github.com/andycai/luaprimer/blob/master/04.md


协程 Coroutine
	函数执行的中断与再开

	单从上面这个例子，我们似乎可以得出结论：协程果然就是某种坑爹的函数调用方式啊。然而，协程的真正魅力来自于 resume 和 yield 这对好基友之间的羁绊。

	函数 coroutine.resume(co[, val1, ...])

	开始或恢复执行协程 co。

	如果是开始执行，val1 及之后的值都作为参数传递给协程体函数；如果是恢复执行，val1 及之后的值都作为 yield 的返回值传递。

	第一个返回值（还记得 Lua 可以返回多个值吗？）为表示执行成功与否的布尔值。如果成功，之后的返回值是 yield 的参数；如果失败，第二个返回值为失败的原因（Lua 的很多函数都采用这种错误处理方式）。

	当然，如果是协程体函数执行完毕 return 而不是 yield，那么 resume 第一个返回值后跟着的就是其返回值。

	函数 coroutine.yield(...)

	中断协程的执行，使得开启该协程的 coroutine.resume 返回。再度调用 coroutine.resume 时，会从该 yield 处恢复执行。

	当然，yield 的所有参数都会作为 resume 第一个返回值后的返回值返回。

	local i=1
	function greet()
		while true
		do
	    print ("hello world"..i)
		i = i + 1

		coroutine.yield()
		end
	end

	co = coroutine.create(greet) -- 创建 coroutine


	print(coroutine.status(co))

	while true
	do
		coroutine.resume(co)
		print(coroutine.status(co))
		print ("-------------------")
		if(i > 10) then
			break;
		end
	end
	--------------------------------------------------
	co = coroutine.create(function()
	    for i = 1, 3 do
	        print("before coroutine yield", i)
	        coroutine.yield()
	        print("after coroutine yield", i)
	    end
	end)
	coroutine.resume(co)
	coroutine.resume(co)
	----------------------------------------------
		co = coroutine.create(function(a, b, c)
	    coroutine.yield(a, b, c)
		end)
		print(coroutine.resume(co, 1, 2, 3))
>lua -e "io.stdout:setvbuf 'no'" "test.lua" 
true	1	2	3
>Exit code: 0

以 coroutine.wrap 的方式创建协程
	跟 coroutine.create 一样，函数 coroutine.wrap 也是创建一个协程，但是它并不返回一个类型为 thread 的对象，而是返回一个函数。每当调用这个返回函数，都会执行协程主函数运行。所有传入这个函数的参数等同于传入 coroutine.resume 的参数。 coroutine.wrap 会返回所有应该由除第一个（错误代码的那个布尔量） 之外的由 coroutine.resume 返回的值。 和 coroutine.resume 不同之处在于， coroutine.wrap 不会返回错误代码，无法检测出运行时的错误，也无法检查 wrap 所创建的协程的状态

	function wrap(param)
	    print("Before yield", param)
	    obtain = coroutine.yield()
	    print("After yield", obtain)
	    return 3
	end
	resumer = coroutine.wrap(wrap) 
	print(resumer(1))
	print(resumer(2))




