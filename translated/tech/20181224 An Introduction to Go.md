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

  10. 命名类型 - 可能具有关联方法的其他类型的别名：

      ```
      type T struct { foo int }
      type T *T
      type T OtherNamedType
      ```

      Named types are mostly distinct from their underlying types, so you cannot assign them to each other, but some operators like `+` do work on objects of named types with an underlying numerical type (so you could add two `T` in the example above).


Maps, slices, and channels are reference-like types - they essentially are structs containing pointers. Other types are passed by value (copied), including arrays (which have a fixed length and are copied).

#### 类型转换

Conversions are the similar to casts in C and other languages. They are written like this:

```
TypeName(value)
```

#### 常量

Go has “untyped” literals and constants.

```
1 // untyped integer literal
const foo = 1 // untyped integer constant
const foo int = 1 // int constant
```

Untyped values are classified into the following categories: `UntypedBool`, `UntypedInt`, `UntypedRune`, `UntypedFloat`, `UntypedComplex`, `UntypedString`, and `UntypedNil` (Go calls them basic kinds, other basic kinds are available for the concrete types like `uint8`). An untyped value can be assigned to a named type derived from a base type; for example:

```
type someType int

const untyped = 2 // UntypedInt
const bar someType = untyped // OK: untyped can be assigned to someType
const typed int = 2 // int
const bar2 someType = typed // error: int cannot be assigned to someType
```

### 接口和对象

As mentioned before, interfaces are a set of methods. Go is not an object-oriented language per se, but it has some support for associating methods with named types: When declaring a function, a receiver can be provided - a receiver is an additional function argument that is passed before the function and involved in the function lookup, like this:

```
type SomeType struct { ... }

func (s *SomeType) MyMethod() {
}

func main() {
 var s SomeType
 s.MyMethod()
}
```

An object implements an interface if it implements all methods; for example, the following interface `MyMethoder` is implemented by `*SomeType` (note the pointer), and values of `*SomeType` can thus be used as values of `MyMethoder`. The most basic interface is `interface{}`, that is an interface with an empty method set - any object satisfies that interface.

```
type MyMethoder interface {
 MyMethod()
}
```

There are some restrictions on valid receiver types; for example, while a named type could be a pointer (for example, `type MyIntPointer *int`), such a type is not a valid receiver type.

### 控制流

Go provides three primary statements for control flow: `if`, `switch`, and `for`. The statements are fairly similar to their equivalent in other C-like languages, with some exceptions:

  * There are no parentheses around conditions, so it is `if a == b {}`, not `if (a == b) {}`. The braces are mandatory.

  * All of them can have initialisers, like this

`if result, err := someFunction(); err == nil { // use result }`

  * The `switch` statement can use arbitrary expressions in cases

  * The `switch` statement can switch over nothing (equals switching over true)

  * Cases do not fall through by default (no `break` needed), use `fallthrough` at the end of a block to fall through.

  * The `for` loop can loop over ranges: `for key, val := range map { do something }`




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
