[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10521-1.html)
[#]: subject: (An Introduction to Go)
[#]: via: (https://blog.jak-linux.org/2018/12/24/introduction-to-go/)
[#]: author: (Julian Andres Klode https://blog.jak-linux.org/)

Go 编程语言的简单介绍
======

（以下内容是我的硕士论文的摘录，几乎是整个 2.1 章节，向具有 CS 背景的人快速介绍 Go）

Go 是一门用于并发编程的命令式编程语言，它主要由创造者 Google 进行开发，最初主要由 Robert Griesemer、Rob Pike 和 Ken Thompson 开发。这门语言的设计起始于 2007 年，并在 2009 年推出最初版本；而第一个稳定版本是 2012 年发布的 1.0 版本。[^1]

Go 有 C 风格的语法（没有预处理器）、垃圾回收机制，而且类似它在贝尔实验室里被开发出来的前辈们：Newsqueak（Rob Pike）、Alef（Phil Winterbottom）和 Inferno（Pike、Ritchie 等人），使用所谓的 <ruby>Go 协程<rt>goroutines</rt></ruby>和<ruby>信道<rt>channels</rt></ruby>（一种基于 Hoare 的“通信顺序进程”理论的协程）提供内建的并发支持。[^2]

Go 程序以包的形式组织。包本质是一个包含 Go 文件的文件夹。包内的所有文件共享相同的命名空间，而包内的符号有两种可见性：以大写字母开头的符号对于其他包是可见，而其他符号则是该包私有的：

```
func PublicFunction() {
    fmt.Println("Hello world")
}

func privateFunction() {
    fmt.Println("Hello package")
}
```

### 类型

Go 有一个相当简单的类型系统：没有子类型（但有类型转换），没有泛型，没有多态函数，只有一些基本的类型：

  1. 基本类型：`int`、`int64`、`int8`、`uint`、`float32`、`float64` 等
  2. `struct`
  3. `interface`：一组方法的集合
  4. `map[K, V]`：一个从键类型到值类型的映射
  5. `[number]Type`：一些 Type 类型的元素组成的数组
  6. `[]Type`：某种类型的切片（具有长度和功能的数组的指针）
  7. `chan Type`：一个线程安全的队列
  8. 指针 `*T` 指向其他类型
  9. 函数
  10. 具名类型：可能具有关联方法的其他类型的别名（LCTT 译注：这里的别名并非指 Go 1.9 中的新特性“类型别名”）：

      ```
      type T struct { foo int }
      type T *T
      type T OtherNamedType
      ```

      具名类型完全不同于它们的底层类型，所以你不能让它们互相赋值，但一些操作符，例如 `+`，能够处理同一底层数值类型的具名类型对象们（所以你可以在上面的示例中把两个 `T` 加起来）。

映射、切片和信道是类似于引用的类型——它们实际上是包含指针的结构。包括数组（具有固定长度并可被拷贝）在内的其他类型则是值传递（拷贝）。

#### 类型转换

类型转换类似于 C 或其他语言中的类型转换。它们写成这样子：

```
TypeName(value)
```

#### 常量

Go 有“无类型”字面量和常量。

```
1 // 无类型整数字面量
const foo = 1 // 无类型整数常量
const foo int = 1 // int 类型常量
```

无类型值可以分为以下几类：`UntypedBool`、`UntypedInt`、`UntypedRune`、`UntypedFloat`、`UntypedComplex`、`UntypedString` 以及 `UntypedNil`（Go 称它们为基础类型，其他基础种类可用于具体类型，如 `uint8`）。一个无类型值可以赋值给一个从基础类型中派生的具名类型；例如：

```
type someType int

const untyped = 2 // UntypedInt
const bar someType = untyped // OK: untyped 可以被赋值给 someType
const typed int = 2 // int
const bar2 someType = typed // error: int 不能被赋值给 someType
```

### 接口和对象

正如上面所说的，接口是一组方法的集合。Go 本身不是一种面向对象的语言，但它支持将方法关联到具名类型上：当声明一个函数时，可以提供一个接收者。接收者是函数的一个额外参数，可以在函数之前传递并参与函数查找，就像这样：

```
type SomeType struct { ... }
type SomeType struct { ... }

func (s *SomeType) MyMethod() {
}

func main() {
    var s SomeType
    s.MyMethod()
}
```

如果对象实现了所有方法，那么它就实现了接口；例如，`*SomeType`（注意指针）实现了下面的接口 `MyMethoder`，因此 `*SomeType` 类型的值就能作为 `MyMethoder` 类型的值使用。最基本的接口类型是 `interface{}`，它是一个带空方法集的接口 —— 任何对象都满足该接口。

```
type MyMethoder interface {
    MyMethod()
}
```

合法的接收者类型是有些限制的；例如，具名类型可以是指针类型（例如，`type MyIntPointer *int`），但这种类型不是合法的接收者类型。

### 控制流

Go 提供了三个主要的控制了语句：`if`、`switch` 和 `for`。这些语句同其他 C 风格语言内的语句非常类似，但有一些不同：

  * 条件语句没有括号，所以条件语句是 `if a == b {}` 而不是 `if (a == b) {}`。大括号是必须的。
  * 所有的语句都可以有初始化，比如这个 `if result, err := someFunction(); err == nil { // use result }`
  * `switch` 语句在分支里可以使用任何表达式
  * `switch` 语句可以处理空的表达式（等于 `true`）
  * 默认情况下，Go 不会从一个分支进入下一个分支（不需要 `break` 语句），在程序块的末尾使用 `fallthrough` 则会进入下一个分支。
  * 循环语句 `for` 不仅能循环值域：`for key, val := range map { do something }`

### Go 协程

关键词 `go` 会产生一个新的 <ruby>Go 协程<rt>goroutine</rt></ruby>，这是一个可以并行执行的函数。它可以用于任何函数调用，甚至一个匿名函数：

```
func main() {
    ...
    go func() {
        ...
    }()

    go some_function(some_argument)
}
```

### 信道

Go 协程通常和<rub>信道<rt>channels</rt></ruby>结合，用来提供一种通信顺序进程的扩展。信道是一个并发安全的队列，而且可以选择是否缓冲数据：

```
var unbuffered = make(chan int) // 直到数据被读取时完成数据块发送
var buffered = make(chan int, 5) // 最多有 5 个未读取的数据块
```

运算符 `<-` 用于和单个信道进行通信。

```
valueReadFromChannel := <- channel
otherChannel <- valueToSend
```

语句 `select` 允许多个信道进行通信：

```
select {
    case incoming := <- inboundChannel:
    // 一条新消息
    case outgoingChannel <- outgoing:
    // 可以发送消息
}
```

### defer 声明

Go 提供语句 `defer` 允许函数退出时调用执行预定的函数。它可以用于进行资源释放操作，例如：

```
func myFunc(someFile io.ReadCloser) {
    defer someFile.close()
    /* 文件相关操作 */
}
```

当然，它允许使用匿名函数作为被调函数，而且编写被调函数时可以像平常一样使用任何变量。

### 错误处理

Go 没有提供异常类或者结构化的错误处理。然而，它通过第二个及后续的返回值来返回错误从而处理错误：

```
func Read(p []byte) (n int, err error)

// 内建类型：
type error interface {
    Error() string
}
```

必须在代码中检查错误或者赋值给 `_`：

```
n0, _ := Read(Buffer) // 忽略错误
n, err := Read(buffer)
if err != nil {
    return err
}
```

有两个函数可以快速跳出和恢复调用栈：`panic()` 和 `recover()`。当 `panic()` 被调用时，调用栈开始弹出，同时每个 `defer` 函数都会正常运行。当一个 `defer` 函数调用 `recover()`时，调用栈停止弹出，同时返回函数 `panic()` 给出的值。如果我们让调用栈正常弹出而不是由于调用 `panic()` 函数，`recover()` 将只返回 `nil`。在下面的例子中，`defer` 函数将捕获 `panic()` 抛出的任何 `error` 类型的值并储存在错误返回值中。第三方库中有时会使用这个方法增强递归代码的可读性，如解析器，同时保持公有函数仍使用普通错误返回值。

```
func Function() (err error) {
    defer func() {
        s := recover()
        switch s := s.(type) {  // type switch
            case error:
                err = s         // s has type error now
            default:
                panic(s)
        }
    }
}
```

### 数组和切片

正如前边说的，数组是值类型，而切片是指向数组的指针。切片可以由现有的数组切片产生，也可以使用 `make()` 创建切片，这会创建一个匿名数组以保存元素。

```
slice1 := make([]int, 2, 5) // 分配 5 个元素，其中 2 个初始化为0
slice2 := array[:] // 整个数组的切片
slice3 := array[1:] // 除了首元素的切片
```

除了上述例子，还有更多可行的切片运算组合，但需要明了直观。

使用 `append()` 函数，切片可以作为一个变长数组使用。

```
slice = append(slice, value1, value2)
slice = append(slice, arrayOrSlice...)
```

切片也可以用于函数的变长参数。

### 映射

<ruby>映射<rt>maps<rt></ruby>是简单的键值对储存容器，并支持索引和分配。但它们不是线程安全的。

```
someValue := someMap[someKey]
someValue, ok := someMap[someKey] // 如果键值不在 someMap 中，变量 ok 会赋值为 `false`
someMap[someKey] = someValue
```

[^1]: Frequently Asked Questions (FAQ) - The Go Programming Language https://golang.org/doc/faq#history [return]
[^2]: HOARE, Charles Antony Richard. Communicating sequential processes. Communications of the ACM, 1978, 21. Jg., Nr. 8, S. 666-677. [return]

--------------------------------------------------------------------------------

via: https://blog.jak-linux.org/2018/12/24/introduction-to-go/

作者：[Julian Andres Klode][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.jak-linux.org/
[b]: https://github.com/lujun9972
