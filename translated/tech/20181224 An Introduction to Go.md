[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An Introduction to Go)
[#]: via: (https://blog.jak-linux.org/2018/12/24/introduction-to-go/)
[#]: author: (Julian Andres Klode https://blog.jak-linux.org/)

Go 简介
======

（以下内容是我的硕士论文的摘录，几乎整个 2.1 章节，向具有 CS 背景的人快速介绍 Go）

Go 是一门用于并发编程的命令式编程语言，它主要由创造者 Google 进行开发，最初主要由 Robert Griesemer、Rob Pike 和 Ken Thompson开发。这门语言的设计起始于 2017 年，并在 2019 年推出最初版本；而第一个稳定版本是 2012 年发布的 1.0。

Go 有 C 风格语法（没有预处理器），垃圾回收机制，而且类似它在贝尔实验室里被开发出来的前辈们，Newsqueak (Rob Pike)、Alef (Phil Winterbottom) 和 Inferno (Pike, Ritchie, et al.)，使用所谓的 goroutines 和 channels（一种基于 Hoare 的“通信顺序进程”理论的协程）提供内建的并发支持。

Go 程序以包的形式组织。包本质是一个包含 Go 文件的文件夹。包内的所有文件共享相同的命名空间，而包内的符号有两种可见行：以大写字母开头的符号对于其他包是可见，而其他符号则是该包私有的：

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

  1. 基本类型：`int`、`int64`、`int8`、`uint`、`float32`、`float64` 等。

  2. `struct`

  3. `interface` \- 一类方法

  4. `map[K, V]` \- 从键类型到值类型的映射

  5. `[number]Type` \- 一些元素类型组成的数组

  6. `[]Type` \- 某种类型的切片（指向具有长度和功能的数组）

  7. `chan Type` \- 一个线程安全的队列

  8. 指针 `*T` 指向其他类型

  9. 函数

  10. 具名类型 - 可能具有关联方法的其他类型的别名（译者注：这里的别名并非指 Go 1.9 中的新特性“类型别名”）：

      ```
      type T struct { foo int }
      type T *T
      type T OtherNamedType
      ```

      具名类型完全不同于他们的底层类型，所以你不能让他们互相赋值，但一些运输符，例如 `+`，能够处理同一底层数值类型的具名类型对象们（所以你可以在上面的示例中把两个 `T` 加起来）。

Maps、slices 和 channels 是类似于引用的类型——他们实际上是包含指针的结构。包括数组（具有固定长度并可被拷贝）在内的其他类型则是值（拷贝）传递。

#### 类型转换

类型转换类似于 C 或其他语言中的转换。它们写成这样子：

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

无类型值可以分为以下几类：`UntypedBool`、`UntypedInt`、`UntypedRune`、`UntypedFloat`、`UntypedComplex`、`UntypedString` 以及 `UntypedNil`（Go 称它们为基础类型，other basic kinds are available for the concrete types like `uint8`）。一个无类型值可以赋值给一个从基础类型中派生的具名类型；例如：

```
type someType int

const untyped = 2 // UntypedInt
const bar someType = untyped // OK: untyped 可以被赋值给 someType
const typed int = 2 // int
const bar2 someType = typed // error: int 不能被赋值给 someType
```

### 接口和对象

正如上面所说的，接口是一组方法的集合。Go 本身不是一种面向对象的语言，但它支持将方法关联到命名类型上：当声明一个函数时，可以提供一个接收者。接收者是函数的一个额外参数，可以在函数之前传递并参与函数查找，就像这样：

```
type SomeType struct { ... }

func (s *SomeType) MyMethod() {
}

func main() {
 var s SomeType
 s.MyMethod()
}
```

如果对象实现了所有方法，那么它就实现了接口；例如，`*SomeType`（注意指针）实现了下面的接口 `MyMethoder`，因此 `*SomeType` 类型的值就能作为 `MyMethoder` 类型的值使用。最基本的接口类型是 `interface{}`，它是一个带空方法集的接口——任何对象都满足该接口。

```
type MyMethoder interface {
 MyMethod()
}
```

合法的接收者类型是有些限制的；例如，命名类型可以是指针类型（例如，`type MyIntPointer *int`），但这种类型不是合法的接收者类型。

### 控制流

Go 提供了三个主要的控制了语句：`if`、`switch` 和 `for`。这些语句同其他 C 风格语言内的语句非常类似，但有一些不同：

  * 条件语句没有括号，所以条件语句是 `if a == b {}` 而不是 `if (a == b) {}`。大括号是必须的。

  * 所有的语句都可以有初始化，比如这个
    
    `if result, err := someFunction(); err == nil { // use result }`
    
  * `switch` 语句在 cases 里可以使用任何表达式

  * `switch` 语句可以处理空的表达式（等于 true）

  * 默认情况下，Go 不会从一个 case 进入下一个 case（不需要 `break`），在程序块的末尾使用 `fallthrough` 则会进入下一个 case。

  * 循环语句 `for` 不止能循环值域：`for key, val := range map { do something }`

### Goroutines

The keyword `go` spawns a new goroutine, a concurrently executed function. It can be used with any function call, even a function literal:

```
func main() {
 ...
 go func() {
 ...
 }()

 go some_function(some_argument)
}
```

### Channels

Goroutines are often combined with channels to provide an extended form of Communicating Sequential Processes . A channel is a concurrent-safe queue, and can be buffered or unbuffered:

```
var unbuffered = make(chan int) // sending blocks until value has been read
var buffered = make(chan int, 5) // may have up to 5 unread values queued
```

The `<-` operator is used to communicate with a single channel.

```
valueReadFromChannel := <- channel
otherChannel <- valueToSend
```

The `select` statement allows communication with multiple channels:

```
select {
 case incoming := <- inboundChannel:
 // A new message for me
 case outgoingChannel <- outgoing:
 // Could send a message, yay!
}
```

### `defer` 声明

Go provides a `defer` statement that allows a function call to be scheduled for execution when the function exits. It can be used for resource clean-up, for example:

```
func myFunc(someFile io.ReadCloser) {
 defer someFile.close()
 /bin /boot /dev /etc /home /lib /lib64 /lost+found /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var Do stuff with file */
}
```

It is of course possible to use function literals as the function to call, and any variables can be used as usual when writing the call.

### 错误处理

Go does not provide exceptions or structured error handling. Instead, it handles errors by returning them in a second or later return value:

```
func Read(p []byte) (n int, err error)

// Built-in type:
type error interface {
 Error() string
}
```

Errors have to be checked in the code, or can be assigned to `_`:

```
n0, _ := Read(Buffer) // ignore error
n, err := Read(buffer)
if err != nil {
 return err
}
```

There are two functions to quickly unwind and recover the call stack, though: `panic()` and `recover()`. When `panic()` is called, the call stack is unwound, and any deferred functions are run as usual. When a deferred function invokes `recover()`, the unwinding stops, and the value given to `panic()` is returned. If we are unwinding normally and not due to a panic, `recover()` simply returns `nil`. In the example below, a function is deferred and any `error` value that is given to `panic()` will be recovered and stored in an error return value. Libraries sometimes use that approach to make highly recursive code like parsers more readable, while still maintaining the usual error return value for public functions.

```
func Function() (err error) {
 defer func() {
 s := recover()
 switch s := s.(type) { // type switch
 case error:
 err = s // s has type error now
 default:
 panic(s)
 }
 }
}
```

### Arrays 和 slices

As mentioned before, an array is a value type and a slice is a pointer into an array, created either by slicing an existing array or by using `make()` to create a slice, which will create an anonymous array to hold the elements.

```
slice1 := make([]int, 2, 5) // 5 elements allocated, 2 initialized to 0
slice2 := array[:] // sliced entire array
slice3 := array[1:] // slice of array without first element
```

There are some more possible combinations for the slicing operator than mentioned above, but this should give a good first impression.

A slice can be used as a dynamically growing array, using the `append()` function.

```
slice = append(slice, value1, value2)
slice = append(slice, arrayOrSlice...)
```

Slices are also used internally to represent variable parameters in variable length functions.

### Maps

Maps are simple key-value stores and support indexing and assigning. They are not thread-safe.

```
someValue := someMap[someKey]
someValue, ok := someMap[someKey] // ok is false if key not in someMap
someMap[someKey] = someValue
```
--------------------------------------------------------------------------------

via: https://blog.jak-linux.org/2018/12/24/introduction-to-go/

作者：[Julian Andres Klode][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.jak-linux.org/
[b]: https://github.com/lujun9972
