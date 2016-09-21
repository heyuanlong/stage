命令行传入的参数在os.Args变量中保存。

func 函数名(参数列表)(返回值列表) {
	// 函数体
}


GOPATH和PATH环境变量一样，也可以接受多个路径，并且路径和路径之间用冒号分割。
编译方式1{
	直接生产可执行文件
	cd bin
	go build main（注意如果GOPATH有多个路径的话，只会编译第一个路径的包）
}
编译方式2{
	直接go install ***  （注意如果GOPATH有多个路径的话，只会编译第一个路径的包）
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