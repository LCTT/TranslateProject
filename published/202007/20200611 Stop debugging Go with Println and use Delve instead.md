[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12400-1.html)
[#]: subject: (Stop debugging Go with Println and use Delve instead)
[#]: via: (https://opensource.com/article/20/6/debug-go-delve)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

使用 Delve 代替 Println 来调试 Go 程序
======

> Delve 是能让调试变成轻而易举的事的万能工具包。

![](https://img.linux.net.cn/data/attachment/album/202007/09/234357pavw88sbxab0makj.jpg)

你上次尝试去学习一种新的编程语言时什么时候？你有没有持之以恒，你是那些在新事物发布的第一时间就勇敢地去尝试的一员吗？不管怎样，学习一种新的语言也许非常有用，也会有很多乐趣。

你尝试着写简单的 “Hello, world!”，然后写一些示例代码并执行，继续做一些小的修改，之后继续前进。我敢保证我们都有过这个经历，不论我们使用哪种技术。假如你尝试用一段时间一种语言，并且你希望能够精通它，那么有一些事物能在你的进取之路上帮助你。

其中之一就是调试器。有些人喜欢在代码中用简单的 “print” 语句进行调试，这种方式很适合代码量少的简单程序；然而，如果你处理的是有多个开发者和几千行代码的大型项目，你应该使用调试器。

最近我开始学习 Go 编程语言了，在本文中，我们将探讨一种名为 Delve 的调试器。Delve 是专门用来调试 Go 程序的工具，我们会借助一些 Go 示例代码来了解下它的一些功能。不要担心这里展示的 Go 示例代码；即使你之前没有写过 Go 代码也能看懂。Go 的目标之一是简单，因此代码是始终如一的，理解和解释起来都很容易。

### Delve 介绍

Delve 是托管在 [GitHub][2] 上的一个开源项目。

它自己的文档中写道：

> Delve 是 Go 编程语言的调试器。该项目的目标是为 Go 提供一个简单、全功能的调试工具。Delve 应该是易于调用和易于使用的。当你使用调试器时，事情可能不会按你的思路运行。如果你这样想，那么你不适合用 Delve。

让我们来近距离看一下。

我的测试系统是运行着 Fedora Linux 的笔记本电脑，Go 编译器版本如下：

```
$ cat /etc/fedora-release
Fedora release 30 (Thirty)
$
$ go version
go version go1.12.17 linux/amd64
$
```

### Golang 安装

如果你没有安装 Go，你可以运行下面的命令，很轻松地就可以从配置的仓库中获取。

```
$ dnf install golang.x86_64
```

或者，你可以在[安装页面][3]找到适合你的操作系统的其他安装版本。

在开始之前，请先确认已经设置好了 Go 工具依赖的下列各个路径。如果这些路径没有设置，有些示例可能不能正常运行。你可以在 SHELL 的 RC 文件中轻松设置这些环境变量，我的机器上是在 `$HOME/bashrc` 文件中设置的。

```
$ go env | grep GOPATH
GOPATH="/home/user/go"
$
$ go env | grep GOBIN
GOBIN="/home/user/go/gobin"
$
```

### Delve 安装

你可以像下面那样，通过运行一个简单的 `go get` 命令来安装 Delve。`go get` 是 Golang 从外部源下载和安装需要的包的方式。如果你安装过程中遇到了问题，可以查看 [Delve 安装教程][4]。

```
$ go get -u github.com/go-delve/delve/cmd/dlv
$
```

运行上面的命令，就会把 Delve 下载到你的 `$GOPATH` 的位置，如果你没有把 `$GOPATH` 设置成其他值，那么默认情况下 `$GOPATH` 和 `$HOME/go` 是同一个路径。

你可以进入 `go/` 目录，你可以在 `bin/` 目录下看到 `dlv`。

```
$ ls -l $HOME/go
total 8
drwxrwxr-x. 2 user user 4096 May 25 19:11 bin
drwxrwxr-x. 4 user user 4096 May 25 19:21 src
$
$ ls -l ~/go/bin/
total 19596
-rwxrwxr-x. 1 user user 20062654 May 25 19:17 dlv
$
```

因为你把 Delve 安装到了 `$GOPATH`，所以你可以像运行普通的 shell 命令一样运行它，即每次运行时你不必先进入它所在的目录。你可以通过 `version` 选项来验证 `dlv` 是否正确安装。示例中安装的版本是 1.4.1。

```
$ which dlv
~/go/bin/dlv
$
$ dlv version
Delve Debugger
Version: 1.4.1
Build: $Id: bda606147ff48b58bde39e20b9e11378eaa4db46 $
$
```

现在，我们一起在 Go 程序中使用 Delve 来理解下它的功能以及如何使用它们。我们先来写一个 `hello.go`，简单地打印一条 `Hello, world!` 信息。

记着，我把这些示例程序放到了 `$GOBIN` 目录下。

```
$ pwd
/home/user/go/gobin
$
$ cat hello.go
package main

import "fmt"

func main() {
        fmt.Println("Hello, world!")
}
$
```

运行 `build` 命令来编译一个 Go 程序，它的输入是 `.go` 后缀的文件。如果程序没有语法错误，Go 编译器把它编译成一个二进制可执行文件。这个文件可以被直接运行，运行后我们会在屏幕上看到 `Hello, world!` 信息。

```
$ go build hello.go
$
$ ls -l hello
-rwxrwxr-x. 1 user user 1997284 May 26 12:13 hello
$
$ ./hello
Hello, world!
$
```

### 在 Delve 中加载程序

把一个程序加载进 Delve 调试器有两种方式。

#### 在源码编译成二进制文件之前使用 debug 参数

第一种方式是在需要时对源码使用 `debug` 命令。Delve 会为你编译出一个名为 `__debug_bin` 的二进制文件，并把它加载进调试器。

在这个例子中，你可以进入 `hello.go` 所在的目录，然后运行 `dlv debug` 命令。如果目录中有多个源文件且每个文件都有自己的主函数，Delve 则可能抛出错误，它期望的是单个程序或从单个项目构建成单个二进制文件。如果出现了这种错误，那么你就应该用下面展示的第二种方式。

```
$ ls -l
total 4
-rw-rw-r--. 1 user user 74 Jun  4 11:48 hello.go
$
$ dlv debug
Type 'help' for list of commands.
(dlv)
```

现在打开另一个终端，列出目录下的文件。你可以看到一个多出来的 `__debug_bin` 二进制文件，这个文件是由源码编译生成的，并会加载进调试器。你现在可以回到 `dlv` 提示框继续使用 Delve。

```
$ ls -l
total 2036
-rwxrwxr-x. 1 user user 2077085 Jun  4 11:48 __debug_bin
-rw-rw-r--. 1 user user      74 Jun  4 11:48 hello.go
$
```

#### 使用 exec 参数

如果你已经有提前编译好的 Go 程序或者已经用 `go build` 命令编译完成了，不想再用 Delve 编译出 `__debug_bin` 二进制文件，那么第二种把程序加载进 Delve 的方法在这些情况下会很有用。在上述情况下，你可以使用 `exec` 命令来把整个目录加载进 Delve 调试器。

```
$ ls -l
total 4
-rw-rw-r--. 1 user user 74 Jun  4 11:48 hello.go
$
$ go build hello.go
$
$ ls -l
total 1956
-rwxrwxr-x. 1 user user 1997284 Jun  4 11:54 hello
-rw-rw-r--. 1 user user      74 Jun  4 11:48 hello.go
$
$ dlv exec ./hello
Type 'help' for list of commands.
(dlv)
```

### 查看 delve 帮助信息

在 `dlv` 提示符中，你可以运行 `help` 来查看 Delve 提供的多种帮助选项。命令列表相当长，这里我们只列举一些重要的功能。下面是 Delve 的功能概览。

```
(dlv) help
The following commands are available:

Running the program:

Manipulating breakpoints:

Viewing program variables and memory:

Listing and switching between threads and goroutines:

Viewing the call stack and selecting frames:

Other commands:

Type help followed by a command for full documentation.
(dlv)
```

#### 设置断点

现在我们已经把 hello.go 程序加载进了 Delve 调试器，我们在主函数处设置断点，稍后来确认它。在 Go 中，主程序从 `main.main` 处开始执行，因此你需要给这个名字提供个 `break` 命令。之后，我们可以用 `breakpoints` 命令来检查断点是否正确设置了。

不要忘了你还可以用命令简写，因此你可以用 `b main.main` 来代替 `break main.main`，两者效果相同，`bp` 和 `breakpoints` 同理。你可以通过运行 `help` 命令查看帮助信息来找到你想要的命令简写。

```
(dlv) break main.main
Breakpoint 1 set at 0x4a228f for main.main() ./hello.go:5
(dlv) breakpoints
Breakpoint runtime-fatal-throw at 0x42c410 for runtime.fatalthrow() /usr/lib/golang/src/runtime/panic.go:663 (0)
Breakpoint unrecovered-panic at 0x42c480 for runtime.fatalpanic() /usr/lib/golang/src/runtime/panic.go:690 (0)
        print runtime.curg._panic.arg
Breakpoint 1 at 0x4a228f for main.main() ./hello.go:5 (0)
(dlv)
```

#### 程序继续执行

现在，我们用 `continue` 来继续运行程序。它会运行到断点处中止，在我们的例子中，会运行到主函数的 `main.main` 处中止。从这里开始，我们可以用 `next` 命令来逐行执行程序。请注意，当我们运行到 `fmt.Println("Hello, world!")` 处时，即使我们还在调试器里，我们也能看到打印到屏幕的 `Hello, world!`。

```
(dlv) continue
> main.main() ./hello.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a228f)
     1: package main
     2:
     3: import "fmt"
     4:
=>   5:      func main() {
     6:         fmt.Println("Hello, world!")
     7: }
(dlv) next
> main.main() ./hello.go:6 (PC: 0x4a229d)
     1: package main
     2:
     3: import "fmt"
     4:
     5: func main() {
=>   6:              fmt.Println("Hello, world!")
     7: }
(dlv) next
Hello, world!
> main.main() ./hello.go:7 (PC: 0x4a22ff)
     2:
     3: import "fmt"
     4:
     5: func main() {
     6:         fmt.Println("Hello, world!")
=>   7:      }
(dlv)
```

#### 退出 Delve

你随时可以运行 `quit` 命令来退出调试器，退出之后你会回到 shell 提示符。相当简单，对吗？

```
(dlv) quit
$
```

### Delve 的其他功能

我们用其他的 Go 程序来探索下 Delve 的其他功能。这次，我们从 [golang 教程][5] 中找了一个程序。如果你要学习 Go 语言，那么 Golang 教程应该是你的第一站。

下面的程序，`functions.go` 中简单展示了 Go 程序中是怎样定义和调用函数的。这里，我们有一个简单的把两数相加并返回和值的  `add()` 函数。你可以像下面那样构建程序并运行它。

```
$ cat functions.go
package main

import "fmt"

func add(x int, y int) int {
        return x + y
}

func main() {
        fmt.Println(add(42, 13))
}
$
```

你可以像下面那样构建和运行程序。

```
$ go build functions.go  && ./functions
55
$
```

#### 进入函数

跟前面展示的一样，我们用前面提到的一个选项来把二进制文件加载进 Delve 调试器，再一次在 `main.main` 处设置断点，继续运行程序直到断点处。然后执行 `next` 直到 `fmt.Println(add(42, 13))` 处；这里我们调用了 `add()` 函数。我们可以像下面展示的那样，用 Delve 的 `step` 命令从 `main` 函数进入 `add()` 函数。

```
$ dlv debug
Type 'help' for list of commands.
(dlv) break main.main
Breakpoint 1 set at 0x4a22b3 for main.main() ./functions.go:9
(dlv) c
> main.main() ./functions.go:9 (hits goroutine(1):1 total:1) (PC: 0x4a22b3)
     4:
     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
=>   9:      func main() {
    10:         fmt.Println(add(42, 13))
    11: }
(dlv) next
> main.main() ./functions.go:10 (PC: 0x4a22c1)
     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
=>  10:              fmt.Println(add(42, 13))
    11: }
(dlv) step
> main.add() ./functions.go:5 (PC: 0x4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=>   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv)
```

#### 使用`文件名:行号`来设置断点

上面的例子中，我们经过 `main` 函数进入了 `add()` 函数，但是你也可以在你想加断点的地方直接使用“文件名:行号”的组合。下面是在 `add()` 函数开始处加断点的另一种方式。

```
(dlv) break functions.go:5
Breakpoint 1 set at 0x4a2280 for main.add() ./functions.go:5
(dlv) continue
> main.add() ./functions.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=>   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv)
```

#### 查看当前的栈信息

现在我们运行到了 `add()` 函数，我们可以在 Delve 中用 `stack` 命令查看当前栈的内容。这里在 `0` 位置展示了栈顶的函数 `add()` ，紧接着在 `1` 位置展示了调用 `add()` 函数的 `main.main`。在 `main.main` 下面的函数属于 Go 运行时，是用来处理加载和执行该程序的。

```
(dlv) stack
0  0x00000000004a2280 in main.add
   at ./functions.go:5
1  0x00000000004a22d7 in main.main
   at ./functions.go:10
2  0x000000000042dd1f in runtime.main
   at /usr/lib/golang/src/runtime/proc.go:200
3  0x0000000000458171 in runtime.goexit
   at /usr/lib/golang/src/runtime/asm_amd64.s:1337
(dlv)
```

#### 在帧之间跳转

在 Delve 中我们可以用 `frame` 命令实现帧之间的跳转。在下面的例子中，我们用 `frame` 实现了从 `add()` 帧跳到 `main.main` 帧，以此类推。

```
(dlv) frame 0
> main.add() ./functions.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a2280)
Frame 0: ./functions.go:5 (PC: 4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=>   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv) frame 1
> main.add() ./functions.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a2280)
Frame 1: ./functions.go:10 (PC: 4a22d7)
     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
=>  10:              fmt.Println(add(42, 13))
    11: }
(dlv)
```

#### 打印函数参数

一个函数通常会接收多个参数。在 `add()` 函数中，它的入参是两个整型。Delve 有个便捷的 `args`  命令，它能打印出命令行传给函数的参数。

```
(dlv) args
x = 42
y = 13
~r2 = 824633786832
(dlv)
```

#### 查看反汇编码

由于我们是调试编译出的二进制文件，因此如果我们能查看编译器生成的汇编语言指令将会非常有用。Delve 提供了一个 `disassemble` 命令来查看这些指令。在下面的例子中，我们用它来查看 `add()` 函数的汇编指令。

```
(dlv) step
> main.add() ./functions.go:5 (PC: 0x4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=>   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv) disassemble
TEXT main.add(SB) /home/user/go/gobin/functions.go
=>   functions.go:5  0x4a2280   48c744241800000000   mov qword ptr [rsp+0x18], 0x0
        functions.go:6  0x4a2289   488b442408           mov rax, qword ptr [rsp+0x8]
        functions.go:6  0x4a228e   4803442410           add rax, qword ptr [rsp+0x10]
        functions.go:6  0x4a2293   4889442418           mov qword ptr [rsp+0x18], rax
        functions.go:6  0x4a2298   c3                   ret
(dlv)
```

#### 单步退出函数

另一个功能是 `stepout`，这个功能可以让我们跳回到函数被调用的地方。在我们的例子中，如果我们想回到 `main.main` 函数，我们只需要简单地运行 `stepout` 命令，它就会把我们带回去。在我们调试大型代码库时，这个功能会是一个非常便捷的工具。

```
(dlv) stepout
> main.main() ./functions.go:10 (PC: 0x4a22d7)
Values returned:
        ~r2: 55

     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
=>  10:              fmt.Println(add(42, 13))
    11: }
(dlv)
```

#### 打印变量信息

我们一起通过 [Go 教程][6] 的另一个示例程序来看下 Delve 是怎么处理 Go 中的变量的。下面的示例程序定义和初始化了一些不同类型的变量。你可以构建和运行程序。

```
$ cat variables.go
package main

import "fmt"

var i, j int = 1, 2

func main() {
        var c, python, java = true, false, "no!"
        fmt.Println(i, j, c, python, java)
}
$

$ go build variables.go &&; ./variables
1 2 true false no!
$
```

像前面说过的那样，用 `delve debug` 在调试器中加载程序。你可以在 Delve 中用 `print` 命令通过变量名来展示他们当前的值。

```
(dlv) print c
true
(dlv) print java
"no!"
(dlv)
```

或者，你还可以用 `locals` 命令来打印函数内所有的局部变量。

```
(dlv) locals
python = false
c = true
java = "no!"
(dlv)
```

如果你不知道变量的类型，你可以用 `whatis` 命令来通过变量名来打印它的类型。

```
(dlv) whatis python
bool
(dlv) whatis c
bool
(dlv) whatis java
string
(dlv)
```

### 总结

现在我们只是了解了 Delve 所有功能的皮毛。你可以自己去查看帮助内容，尝试下其它的命令。你还可以把 Delve 绑定到运行中的 Go 程序上（守护进程！），如果你安装了 Go 源码库，你甚至可以用 Delve 导出 Golang 库内部的信息。勇敢去探索吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/debug-go-delve

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug_software_issue_tracking_computer_screen.jpg?itok=6qfIHR5y (Bug tracking magnifying glass on computer screen)
[2]: https://github.com/go-delve/delve
[3]: https://golang.org/doc/install
[4]: https://github.com/go-delve/delve/blob/master/Documentation/installation/linux/install.md
[5]: https://tour.golang.org/basics/4
[6]: https://tour.golang.org/basics/9
