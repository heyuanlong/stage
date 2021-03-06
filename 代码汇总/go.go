命令行传入的参数在os.Args变量中保存。

func 函数名(参数列表)(返回值列表) {
	// 函数体
}


GOPATH和PATH环境变量一样，也可以接受多个路径，并且路径和路径之间用冒号分割。
编译方式1{
	直接生产可执行文件
	cd bin
	go build main（注意如果GOPATH有多个路径的话，只会编译第一个路径的包）
	会把可执行文件生成到当前目录下
	只会生成可执行文件
}
编译方式2{
	直接go install main  （注意如果GOPATH有多个路径的话，只会编译第一个路径的包）
	会生成所以依赖的包，并把可可执行文件放到bin目录里
}

设置了GOPATH，所以可以在任意目录下执行以下命令：
go test simplemath



GDB调试，直接 gdb 可执行文件


var v1 int
var v2 string
var v3 [10]int // 数组
var v4 []int // 数组切片
var v5 struct {
	f int
}
var v6 *int // 指针
var v7 map[string]int // map，key为string类型，value为int类型
var v8 func(a int) int

var (
v1 int
v2 string
)

匿名变量
_, _, nickName := GetName()

const zero = 0.0 // 无类型浮点常量
const (
size int64 = 1024
eof = -1 // 无类型整型常量
)
const u, v float32 = 0, 3 // u = 0.0, v = 3.0，常量的多重赋值


常量定义的右值也可以是一个在编译期运算的常量表达式，比如
const mask = 1 << 3
由于常量的赋值是一个编译期行为，所以右值不能出现任何需要运行期才能得出结果的表达
式。


iota比较特殊，可以被认为是一个可被编译器修改的常量，在每一个const关键字出现时被
重置为0，然后在下一个const出现之前，每出现一次iota，其所代表的数字会自动增1。
const ( // iota被重设为0
c0 = iota + 1 // c0 == 0
c1
c2
)
const (
a = 1 << iota // a == 1 (iota在每个const开头被重设为0)
b = 1 << iota // b == 2
c = 1 << iota // c == 4
)


Go语言内置以下这些基础类型：
 布尔类型：bool。
 整型：int8、byte、int16、int、uint、uintptr等。
 浮点类型：float32、float64。
 复数类型：complex64、complex128。
 字符串：string。
 字符类型：rune。
 错误类型：error。
此外，Go语言也支持以下这些复合类型：
 指针（pointer）
 数组（array）
 切片（slice）
 字典（map）
 通道（chan）
 结构体（struct）
 接口（interface）


布尔类型不能接受其他类型的赋值，不支持自动或强制的类型转换。
Go语言定义了两个类型float32和float64，其中float32等价于C语言的float类型，float64等价于C语言的double类型。
因为浮点数不是一种精确的表达方式，所以像整型那样直接用==来判断两个浮点数是否相等
是不可行的，这可能会导致不稳定的结果。

str := "Hello world" // 字符串赋值
ch := str[0] // 取字符串的第一个字符


Go编译器支持UTF-8的源代码文件格式。这意味着源代码中的字符串可以包含非ANSI的字
符，比如“Hello world. 你好，世界！”可以出现在Go代码中。但需要注意的是，如果你的Go代
码需要包含非ANSI字符，保存源文件时请注意编码格式必须选择UTF-8。特别是在Windows下一
般编辑器都默认存为本地编码，比如中国地区可能是GBK编码而不是UTF-8，如果没注意这点在
编译和运行时就会出现一些意料之外的情况。


str := "Hello,世界"
n := len(str)
for i := 0; i < n; i++ {
ch := str[i] // 依据下标取字符串中的字符，类型为byte
fmt.Println(i, ch)
}

str := "Hello,世界"
for i, ch := range str {
fmt.Println(i, ch)//ch的类型为rune
}



在Go语言中支持两个字符类型，一个是byte（实际上是uint8的别名），代表UTF-8字符串的单个字节的值；另一个是rune，代表单个Unicode字符。



Go语言标准库提供了用于快迅解析命令行参数的flag包。
var infile *string = flag.String("i", "infile", "File contains values for sorting")
var outfile *string = flag.String("o", "outfile", "File to receive sorted values")
var algorithm *string = flag.String("a", "qsort", "Sort algorithm")

file, err := os.Open(infile)
if err != nil {
	fmt.Println("Failed to open the input file ", infile)
	return
}

br := bufio.NewReader(file)
values = make([]int, 0)
for {
	line, isPrefix, err1 := br.ReadLine()
	if err1 != nil {
		if err1 != io.EOF {
			err = err1
		}
		break
	}
	if isPrefix {
		fmt.Println("A too long line, seems unexpected.")
		return
	}
	str := string(line) // 转换字符数组为字符串
	value, err1 := strconv.Atoi(str)
	if err1 != nil {
		err = err1
		return
	}
	values = append(values, value)
}


http.Redirect(w, r, "/view?id="+filename,http.StatusFound)
func viewHandler(w http.ResponseWriter, r *http.Request) {
	imageId = r.FormValue("id")
	imagePath = UPLOAD_DIR + "/" + imageId
	if exists := isExists(imagePath);!exists {
		http.NotFound(w, r)
		return
	}
	w.Header().Set("Content-Type", "image")
	http.ServeFile(w, r, imagePath)
}
func isExists(path string) bool {
	_, err := os.Stat(path)
	if err == nil {
		return true
	}
	return os.IsExist(err)
}


fileInfoArr, err := ioutil.ReadDir("./uploads") 读取uploads目录下的文件



Md5Inst:=md5.New()
Md5Inst.Write([]byte(TestString))
Result:=Md5Inst.Sum([]byte(""))
fmt.Printf("%x\n\n",Result)

Sha1Inst:=sha1.New()
Sha1Inst.Write([]byte(TestString))
Result=Sha1Inst.Sum([]byte(""))
fmt.Printf("%x\n\n",Result)

package main
import (
"io"
"fmt"
"os"
"crypto/md5"
"crypto/sha1"
)
func main() {
	TestFile := "123.txt"
	infile, inerr := os.Open(TestFile)
	if inerr == nil {
		md5h := md5.New()
		io.Copy(md5h, infile)
		fmt.Printf("%x %s\n",md5h.Sum([]byte("")), TestFile)
		sha1h := sha1.New()
		io.Copy(sha1h, infile)
		fmt.Printf("%x %s\n",sha1h.Sum([]byte("")), TestFile)
	} else {
		fmt.Println(inerr)
		os.Exit(1)
	}
}





一个文件服务器
package main
import (
	"net/http"
)
func main() {
	h := http.FileServer(http.Dir("."))
	http.ListenAndServe(":8003", h)
}


软件开发行业最流行的两种命名法分别为骆驼命名法（类似于DoSomething和doSomething）
和下划线法（对应为do_something），而Go语言明确宣告了拥护骆驼命名法而排斥下划线法。骆
驼命名法在Java和C#中得到官方的支持和推荐，而下划线命名法则主要用在C语言的世界里，比
如Linux内核和驱动开发上。在开始Go语言编程时，还是忘记下划线法吧，避免写出不伦不类的
名字。


不带任何参数直接运行go fmt的话，可以直接格式化当前目录下的所有*.go文件



假如你希望这个包的路径带有一个命名空间，比如在使用时希望以这样的方式导入：
import "myns/simplemath"


godoc -http=:8010    				直接看go的离线文档
godoc -http=:8010 -goroot="."   	直接看自己的项目代码，这酷了。。。。。。


类型查询
func MyPrintf(args ...interface{}) {
	for _, arg := range args {
		switch arg.(type) {
			case int:。。。
			case string:。。。
			default:
			。。。
		}
	}
}

接口查询
var file1 Writer = ...
if file5, ok := file1.(two.IStream); ok {
	...
}


对结构的反射操作
tt12 := T{203, "mh203"}
s := reflect.ValueOf(&tt12).Elem()
typeOfT := s.Type()
for i := 0; i < s.NumField(); i++ {
	f := s.Field(i)
	fmt.Printf("%s %s = %v\n", typeOfT.Field(i).Name, f.Type(), f.Interface())
}
/*
123123A int = 203
B string = mh203
*/



调用c函数
package main
import "fmt"
/*
#include <stdlib.h>
*/
import "C"
func Random() int {
	return int(C.random())
}
func Seed(i int) {
	C.srandom(C.uint(i))
}
func main() {
	Seed(100)
	fmt.Println("Random:", Random())
}



输入输出。有bufio、fmt、io、log和flag等，其中flag用于处理命令行参数。
文本处理。有encoding、bytes、strings、strconv、text、mime、unicode、regexp、index和path等。其中path用于处理路径字符串。
网络。有：net、http和expvar等。
系统。有os、syscall、sync、time和unsafe等。
数据结构与算法。有math、sort、container、crypto、hash、archive、compress和image等。因为image包里提供的图像编解码都是算法，所以也归入此类。
运行时。有：runtime、reflect和go等。


new(File) 和&File{} 是等价的。


// Mutex 数据类型有两个方法，Lock 和Unlock。
type Mutex s t r u c t { /* Mutex 字段*/ }
func (m *Mutex) Lock() { /* Lock 实现*/ }
func (m *Mutex) Unlock() { /* Unlock 实现*/ }
现在用两种不同的风格创建了两个数据类型。
• type NewMutex Mutex;
• type PrintableMutex struct {Mutex }.
现在NewMutux 等同于Mutex，但是它没有任何Mutex 的方法。换句话说，它的方法
是空的。
但是PrintableMutex 已经从Mutex 继承了方法集合。如同[10] 所说：
*PrintableMutex 的方法集合包含了Lock 和Unlock 方法，被绑定到其
匿名字段Mutex。




mystring := "hello this is string"
byteslice := []byte(mystring)
转换到byte slice，每个byte 保存字符串对应字节的整数值。注意Go 的字符串
是UTF-8 编码的，一些字符可能是1、2、3 或者4 个字节结尾。
runeslice := []rune(mystring)
转换到rune slice，每个rune 保存Unicode 编码的指针。字符串中的每个字符
对应一个整数。

从字节或者整形的slice 到string。
b := []byte {'h','e','l','l','o'} // 复合声明
s := s t r i n g (b)
i := []rune {257,1024,65}
r := s t r i n g (i)


别名也不能随意转换。

作为强类型语言，隐式的类型转换是不被允许的，记住一条原则：让所有的东西都是显式的。

由于 Go 语言不存在隐式类型转换，因此所有的转换都必须显式说明，就像调用一个函数一样（类型在这里的作用可以看作是一种函数）：
valueOfTypeB = typeB(valueOfTypeA)
类型 B 的值 = 类型 B(类型 A 的值)



你应该尽可能地使用 float64，因为 math 包中所有有关数学运算的函数都会要求接收这个类型。

你可以通过增加前缀 0 来表示 8 进制数（如：077），增加前缀 0x 来表示 16 进制数（如：0xFF），以及使用 e 来表示 10 的连乘（如： 1e3 = 1000，或者 6.022e23 = 6.022 x 1e23）。

"math/rand"
a := rand.Int()

实际上，类型别名得到的新类型并非和原类型完全相同，新类型不会拥有原类型所附带的方法。
严格来说，这并不是 Go 语言的一个类型，字符只是整数的特殊用例。byte 类型是 uint8 的别名

其实 rune 也是Go 当中的一个类型，并且是 int32 的别名。
在书写 Unicode 字符时，需要在 16 进制数之前加上前缀 \u 或者 \U 。
因为 Unicode 至少占用 2 个字节，所以我们使用 int16 或者 int 类型来表示。如果需要使用到 4 字
节，则会加上 \U 前缀；前缀 \u 则总是紧跟着长度为 4 的 16 进制数，前缀 \U 紧跟着长度为 8 的
16 进制数。




如果想增加切片的容量，我们必须创建一个新的更大的切片并把原分片的内容都拷贝过来，或者使用append

Go 语言中的字符串是不可变的，也就是说 str[index] 这样的表达式是不可以被放在等号左侧的。
需要{
	s := "hello"
	c := []byte(s)
	c[0] = ’c’
	s2 := string(c) // s2 == "cello"
}

想要在数组或切片中搜索一个元素，该数组或切片必须先被排序（因为标准库的搜索算法使用的是二分法）。



将切片 b 的元素追加到切片 a 之后：a = append(a, b...)
复制切片 a 的元素到新的切片 b 上：b = make([]T, len(a));  copy(b, a)
删除位于索引 i 的元素：a = append(a[:i], a[i+1:]...)
切除切片 a 中从索引 i 至 j 位置的元素：a = append(a[:i], a[j:]...)
为切片 a 扩展 j 个元素长度：a = append(a, make([]T, j)...)
在索引 i 的位置插入元素 x：a = append(a[:i], append([]T{x}, a[i:]...)...)
在索引 i 的位置插入长度为 j 的新切片：a = append(a[:i], append(make([]T, j), a[i:]...)...)
在索引 i 的位置插入切片 b 的所有元素：a = append(a[:i], append(b, a[i:]...)...)
取出位于切片 a 最末尾的元素 x：x, a = a[len(a)-1], a[:len(a)-1]
将元素 x 追加到切片 a：a = append(a, x)


切片和垃圾回收,经典案例
https://github.com/Unknwon/the-way-to-go_ZH_CN/blob/master/eBook/07.6.md#768-切片和垃圾回收



在接口上调用方法时，必须有和方法定义时相同的接收者类型或者是可以从具体类型 P 直接可以辨识的：
指针方法可以通过指针调用
值方法可以通过值调用
接收者是值的方法可以通过指针调用，因为指针会首先被解引用
接收者是指针的方法不可以通过值调用，因为存储在接口中的值没有地址



io 包里的 Readers 和 Writers 都是不带缓冲的，bufio 包里提供了对应的带缓冲的操作

将整个文件的内容读到一个字符串里：可以使用 io/ioutil 包里的 ioutil.ReadFile() 方法，该方法第一个返回值的类型是 []byte
buf, err := ioutil.ReadFile(inputFile)
if err != nil {
	fmt.Fprintf(os.Stderr, "File Error: %s\n", err)
	// panic(err.Error())
	}
fmt.Printf("%s\n", string(buf))



在很多情况下，文件的内容是不按行划分的，或者干脆就是一个二进制文件。在这种情况下，ReadString()就无法使用了，我们可以使用 bufio.Reader 的 Read()，它只接收一个参数：
buf := make([]byte, 1024)
...
n, err := inputReader.Read(buf)
if (n == 0) { break}


在缓冲写入的最后千万不要忘了使用 Flush()，否则最后的输出不会被写入。



JSON
JSON 对象只支持字符串类型的 key；要编码一个 Go map 类型，map 必须是 map[string]T（T是 json 包中支持的任何类型）
Channel，复杂类型和函数类型不能被编码
不支持循环数据结构；它将引起序列化进入一个无限循环
指针可以被编码，实际上是对指针指向的值进行编码（或者指针是 nil）


给已经关闭的通道发送或者再次关闭都会导致运行时的 panic。
if v, ok := <-ch; ok {
  process(v)
}
使用 for-range 语句来读取通道是更好的办法，因为这会自动检测通道是否关闭：
for input := range ch {
  	process(input)
}


defer仅在函数返回时才会执行，在循环的结尾或其他一些有限范围的代码内不会执行。
- 切片、映射和通道，使用make
- 数组、结构体和所有的值类型，使用new 
永远不要使用一个指针指向一个接口类型，因为它已经是一个指针。


var values = [5]int{10, 11, 12, 13, 14}
for ix := range values { // ix是索引值
	fmt.Println(ix)
	var ix int 
	ix = 10
	fmt.Println(ix)
}
上面这段代码没毛病，因为第一行和下面的块不在同一个域里。


经典案例 	https://github.com/Unknwon/the-way-to-go_ZH_CN/blob/master/eBook/16.9.md
	
	
在接口调用上：
Methods Receivers 		Values
(t T)					T and *T
(t *T) 					*T
(因为编译器并不是总能自动获得一个值的地址，go语言实战5.4.3有描述)


go build -race  //用竞争检测标志来编译程序，当运行程序时，会打印数据竞争的信息。

go的atomic包含一些原子操作函数，用来保证数据的原子性加减，读取。（go语言实战6.4.1有案例）




:= 结构不能在函数外使用。
byte // uint8 的别名
rune // int32 的别名 ,表示一个 Unicode 码点
	
i := 42           // int
f := 3.142        // float64
g := 0.867 + 0.5i // complex128
	
for 是 Go 中的 “while”
switch的case可以是普通的表达式


没有条件的 switch，没有条件的 switch 同 switch true 一样。这种形式能将一长串 if-then-else 写得更加清晰。


切片的零值是 nil。
nil 切片的长度和容量为 0 且没有底层数组。
映射的零值为 nil 。nil 映射既没有键，也不能添加键。

a := make([]int, 5)  // len(a)=5
b := make([]int, 0, 5) // len(b)=0, cap(b)=5


函数也是值。它们可以像其它值一样传递。
func compute(fn func(float64, float64) float64) float64 {
	return fn(3, 4)
}
func main() {
	hypot := func(x, y float64) float64 {
		return math.Sqrt(x*x + y*y)
	}
	fmt.Println(hypot(5, 12))
}


而以指针为接收者的方法被调用时，接收者既能为值又能为指针
而以值为接收者的方法被调用时，接收者既能为值又能为指针


底层值为 nil 的接口值
即便接口内的具体值为 nil，方法仍然会被 nil 接收者调用。
在一些语言中，这会触发一个空指针异常，但在 Go 中通常会写一些方法来优雅地处理它（如本例中的 M 方法）。

空接口可保存任何类型的值。（因为每个类型都至少实现了零个方法。）



类型断言： 提供了访问接口值底层具体值的方式。
t := i.(T)   //出错则恐慌
t, ok := i.(T) //出错则ok=false

类型选择： 是一种按顺序从几个类型断言中选择分支的结构。
switch v := i.(type) {
case T:
    // v 的类型为 T
case S:
    // v 的类型为 S
default:
    // 没有匹配，v 与 i 的类型相同
}


v, ok := <-ch  //如果ch已经关闭并且没有数据了，ok才等于false
for i := range ch  // 会不断从信道接收值，直到它被关闭并且没有数据了

select 语句使一个 Go 程可以等待多个通信操作。
当 select 中的其它分支都没有准备好时，default 分支就会执行。

fmt.Errorf("session: unknown provide %q (forgotten import?)", provideName)


// Log implement the log.Logger
type Log struct {
	*log.Logger
}
// NewSessionLog set io.Writer to create a Logger for session.
func NewSessionLog(out io.Writer) *Log {
	sl := new(Log)
	sl.Logger = log.New(out, "[SESSION]", 1e9)
	return sl
}


可以用 copy 和 append 组合可以避免创建中间的临时切片，同样是完成添加元素的操作：
a = append(a, 0) // 切片扩展1个空间
copy(a[i+1:], a[i:]) // a[i:]向后移动1个位置
a[i] = x // 设置新添加的元素

用 copy 和 append 组合也可以实现在中间位置插入多个元素(也就是插入一个切片):
a = append(a, x...) // 为x切片扩展足够的空间
copy(a[i+len(x):], a[i:]) // a[i:]向后移动len(x)个位置
copy(a[i:], x) // 复制新添加的切片

复制切片的方式：newB := append([]byte{}, b...)

假设切片里存放的是指针对象，那么
下面删除末尾的元素后，被删除的元素依然被切片底层数组引用，从而导致不能及时被自动垃圾回收器回收，应该设置为nil
当然，如果切片存在的周期很短的话，可以不用刻意处理这个问题。因为如果切片本身已经可以被GC回收的话，切片对应的每个元素自然也就是可以被回收的了。

我们不能直接对一个未加锁状态的 sync.Mutex 进行解锁，这会导致运行时异常。


// Ctrl+C 退出
sig := make(chan os.Signal, 1)
signal.Notify(sig, syscall.SIGINT, syscall.SIGTERM)
fmt.Printf("quit (%v)\n", <-sig)


golang gorm update的时候如何主键id为默认值0的话，会更新整个表。注意咯
golang解析json时把所有的int,float,double等数字，向interface{}解析时都当成float64
decoder := json.NewDecoder(bytes.NewBuffer([]byte(msg)));decoder.UseNumber();decoder.Decode(&info);//这样可以解析出json.Number








.