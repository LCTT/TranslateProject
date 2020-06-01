[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12184-1.html)
[#]: subject: (Mid-stack inlining in Go)
[#]: via: (https://dave.cheney.net/2020/05/02/mid-stack-inlining-in-go)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Go 中对栈中函数进行内联
======

![](https://img.linux.net.cn/data/attachment/album/202005/04/230304avxkxlyoozbiw1bn.jpg)

[上一篇文章][1]中我论述了<ruby>叶子内联<rt>leaf inlining</rt></ruby>是怎样让 Go 编译器减少函数调用的开销的，以及延伸出了跨函数边界的优化的机会。本文中，我要论述内联的限制以及叶子内联与<ruby>栈中内联<rt>mid-stack inlining</rt></ruby>的对比。

### 内联的限制

把函数内联到它的调用处消除了调用的开销，为编译器进行其他的优化提供了更好的机会，那么问题来了，既然内联这么好，内联得越多开销就越少，*为什么不尽可能多地内联呢？*

内联可能会以增加程序大小换来更快的执行时间。限制内联的最主要原因是，创建许多函数的内联副本会增加编译时间，并导致生成更大的二进制文件的边际效应。即使把内联带来的进一步的优化机会考虑在内，太激进的内联也可能会增加生成的二进制文件的大小和编译时间。

内联收益最大的是[小函数][2]，相对于调用它们的开销来说，这些函数做很少的工作。随着函数大小的增长，函数内部做的工作与函数调用的开销相比省下的时间越来越少。函数越大通常越复杂，因此优化其内联形式相对于原地优化的好处会减少。

### 内联预算

在编译过程中，每个函数的内联能力是用*内联预算*计算的 [^1]。开销的计算过程可以巧妙地内化，像一元和二元等简单操作，在<ruby>抽象语法数<rt>Abstract Syntax Tree</rt></ruby>（AST）中通常是每个节点一个单位，更复杂的操作如 `make` 可能单位更多。考虑下面的例子：

```go
package main

func small() string {
    s := "hello, " + "world!"
    return s
}

func large() string {
    s := "a"
    s += "b"
    s += "c"
    s += "d"
    s += "e"
    s += "f"
    s += "g"
    s += "h"
    s += "i"
    s += "j"
    s += "k"
    s += "l"
    s += "m"
    s += "n"
    s += "o"
    s += "p"
    s += "q"
    s += "r"
    s += "s"
    s += "t"
    s += "u"
    s += "v"
    s += "w"
    s += "x"
    s += "y"
    s += "z"
    return s
}

func main() {
    small()
    large()
}
```

使用 `-gcflags=-m=2` 参数编译这个函数能让我们看到编译器分配给每个函数的开销：

```bash
% go build -gcflags=-m=2 inl.go
# command-line-arguments
./inl.go:3:6: can inline small with cost 7 as: func() string { s := "hello, world!"; return s }
./inl.go:8:6: cannot inline large: function too complex: cost 82 exceeds budget 80
./inl.go:38:6: can inline main with cost 68 as: func() { small(); large() }
./inl.go:39:7: inlining call to small func() string { s := "hello, world!"; return s }
```

编译器根据函数 `func small()` 的开销（7）决定可以对它内联，而 `func large()` 的开销太大，编译器决定不进行内联。`func main()` 被标记为适合内联的，分配了 68 的开销；其中 `small` 占用 7，调用 `small` 函数占用 57，剩余的（4）是它自己的开销。

可以用 `-gcflag=-l` 参数控制内联预算的等级。下面是可使用的值：

  * `-gcflags=-l=0` 默认的内联等级。
  * `-gcflags=-l`（或 `-gcflags=-l=1`）取消内联。
  * `-gcflags=-l=2` 和 `-gcflags=-l=3` 现在已经不使用了。和 `-gcflags=-l=0` 相比没有区别。
  * `-gcflags=-l=4` 减少非叶子函数和通过接口调用的函数的开销。[^2]

#### 不确定语句的优化

一些函数虽然内联的开销很小，但由于太复杂它们仍不适合进行内联。这就是函数的不确定性，因为一些操作的语义在内联后很难去推导，如 `recover`、`break`。其他的操作，如 `select` 和 `go` 涉及运行时的协调，因此内联后引入的额外的开销不能抵消内联带来的收益。

不确定的语句也包括 `for` 和 `range`，这些语句不一定开销很大，但目前为止还没有对它们进行优化。

### 栈中函数优化

在过去，Go 编译器只对叶子函数进行内联 —— 只有那些不调用其他函数的函数才有资格。在上一段不确定的语句的探讨内容中，一次函数调用就会让这个函数失去内联的资格。

进入栈中进行内联，就像它的名字一样，能内联在函数调用栈中间的函数，不需要先让它下面的所有的函数都被标记为有资格内联的。栈中内联是 David Lazar 在 Go 1.9 中引入的，并在随后的版本中做了改进。[这篇文稿][5]深入探究了保留栈追踪行为和被深度内联后的代码路径里的 `runtime.Callers` 的难点。

在前面的例子中我们看到了栈中函数内联。内联后，`func main()` 包含了 `func small()` 的函数体和对 `func large()` 的一次调用，因此它被判定为非叶子函数。在过去，这会阻止它被继续内联，虽然它的联合开销小于内联预算。

栈中内联的最主要的应用案例就是减少贯穿函数调用栈的开销。考虑下面的例子：

```go
package main

import (
    "fmt"
    "strconv"
)

type Rectangle struct {}

//go:noinline
func (r *Rectangle) Height() int {
    h, _ := strconv.ParseInt("7", 10, 0)
    return int(h)
}

func (r *Rectangle) Width() int {
    return 6
}

func (r *Rectangle) Area() int { return r.Height() * r.Width() }

func main() {
    var r Rectangle
    fmt.Println(r.Area())
}
```

在这个例子中， `r.Area()` 是个简单的函数，调用了两个函数。`r.Width()` 可以被内联，`r.Height()` 这里用 `//go:noinline` 指令标注了，不能被内联。[^3]

```bash
% go build -gcflags='-m=2' square.go                                                                                                          
# command-line-arguments
./square.go:12:6: cannot inline (*Rectangle).Height: marked go:noinline                                                                               
./square.go:17:6: can inline (*Rectangle).Width with cost 2 as: method(*Rectangle) func() int { return 6 }
./square.go:21:6: can inline (*Rectangle).Area with cost 67 as: method(*Rectangle) func() int { return r.Height() * r.Width() }                       
./square.go:21:61: inlining call to (*Rectangle).Width method(*Rectangle) func() int { return 6 }                                                     
./square.go:23:6: cannot inline main: function too complex: cost 150 exceeds budget 80                        
./square.go:25:20: inlining call to (*Rectangle).Area method(*Rectangle) func() int { return r.Height() * r.Width() }
./square.go:25:20: inlining call to (*Rectangle).Width method(*Rectangle) func() int { return 6 }
```

由于 `r.Area()` 中的乘法与调用它的开销相比并不大，因此内联它的表达式是纯收益，即使它的调用的下游 `r.Height()` 仍是没有内联资格的。

#### 快速路径内联

关于栈中内联的效果最令人吃惊的例子是 2019 年 [Carlo Alberto Ferraris][7] 通过允许把 `sync.Mutex.Lock()` 的快速路径（非竞争的情况）内联到它的调用方来[提升它的性能][7]。在这个修改之前，`sync.Mutex.Lock()` 是个很大的函数，包含很多难以理解的条件，使得它没有资格被内联。即使锁可用时，调用者也要付出调用 `sync.Mutex.Lock()` 的代价。

Carlo 把 `sync.Mutex.Lock()` 分成了两个函数（他自己称为<ruby>外联<rt>outlining</rt></ruby>）。外部的 `sync.Mutex.Lock()` 方法现在调用 `sync/atomic.CompareAndSwapInt32()` 且如果 CAS（<ruby>比较并交换<rt>Compare and Swap</rt></ruby>）成功了之后立即返回给调用者。如果 CAS 失败，函数会走到 `sync.Mutex.lockSlow()` 慢速路径，需要对锁进行注册，暂停 goroutine。[^4]

```bash
% go build -gcflags='-m=2 -l=0' sync 2>&1 | grep '(*Mutex).Lock'
../go/src/sync/mutex.go:72:6: can inline (*Mutex).Lock with cost 69 as: method(*Mutex) func() { if "sync/atomic".CompareAndSwapInt32(&m.state, 0, mutexLocked) { if race.Enabled {  }; return  }; m.lockSlow() }
```

通过把函数分割成一个简单的不能再被分割的外部函数，和（如果没走到外部函数就走到的）一个处理慢速路径的复杂的内部函数，Carlo 组合了栈中函数内联和[编译器对基础操作的支持][9]，减少了非竞争锁 14% 的开销。之后他在 `sync.RWMutex.Unlock()` 重复这个技巧，节省了另外 9% 的开销。

[^1]: 不同发布版本中，在考虑该函数是否适合内联时，Go 编译器对同一函数的预算是不同的。
[^2]: 时刻记着编译器的作者警告过[“更高的内联等级（比 -l 更高）可能导致错误或不被支持”][11]。 Caveat emptor。
[^3]: 编译器有足够的能力来内联像 `strconv.ParseInt` 的复杂函数。作为一个实验，你可以尝试去掉 `//go:noinline` 注释，使用 `-gcflags=-m=2` 编译后观察。
[^4]: `race.Enable` 表达式是通过传递给 `go` 工具的 `-race` 参数控制的一个常量。对于普通编译，它的值是 `false`，此时编译器可以完全省略代码路径。

### 相关文章：

  1. [Go 中的内联优化][15]
  2. [goroutine 的栈为什么会无限增长？][16]
  3. [栈追踪和 errors 包][17]
  4. [零值是什么，为什么它很有用？][18]

--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/05/02/mid-stack-inlining-in-go

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12176-1.html
[2]: https://medium.com/@joshsaintjacque/small-functions-considered-awesome-c95b3fd1812f
[3]: tmp.FyRthF1bbF#easy-footnote-bottom-1-4076 (The budget the Go compiler applies to each function when considering if it is eligible for inlining changes release to release.)
[4]: tmp.FyRthF1bbF#easy-footnote-bottom-2-4076 (Keep in mind that the compiler authors warn that “<a href="https://github.com/golang/go/blob/be08e10b3bc07f3a4e7b27f44d53d582e15fd6c7/src/cmd/compile/internal/gc/inl.go#L11">Additional levels of inlining (beyond -l) may be buggy and are not supported”</a>. Caveat emptor.)
[5]: https://docs.google.com/presentation/d/1Wcblp3jpfeKwA0Y4FOmj63PW52M_qmNqlQkNaLj0P5o/edit#slide=id.p
[6]: tmp.FyRthF1bbF#easy-footnote-bottom-3-4076 (The compiler is powerful enough that it can inline complex functions like <code>strconv.ParseInt</code>. As a experiment, try removing the <code>//go:noinline</code> annotation and observe the result with <code>-gcflags=-m=2</code>.)
[7]: https://go-review.googlesource.com/c/go/+/148959
[8]: tmp.FyRthF1bbF#easy-footnote-bottom-4-4076 (The expression <code>race.Enable</code> is a constant controlled by the <code>-race</code> flag passed to the <code>go</code> tool. It is <code>false</code> for normal builds which allows the compiler to elide those code paths entirely.)
[9]: https://dave.cheney.net/2019/08/20/go-compiler-intrinsics
[10]: tmp.FyRthF1bbF#easy-footnote-1-4076
[11]: https://github.com/golang/go/blob/be08e10b3bc07f3a4e7b27f44d53d582e15fd6c7/src/cmd/compile/internal/gc/inl.go#L11
[12]: tmp.FyRthF1bbF#easy-footnote-2-4076
[13]: tmp.FyRthF1bbF#easy-footnote-3-4076
[14]: tmp.FyRthF1bbF#easy-footnote-4-4076
[15]: https://dave.cheney.net/2020/04/25/inlining-optimisations-in-go (Inlining optimisations in Go)
[16]: https://dave.cheney.net/2013/06/02/why-is-a-goroutines-stack-infinite (Why is a Goroutine’s stack infinite ?)
[17]: https://dave.cheney.net/2016/06/12/stack-traces-and-the-errors-package (Stack traces and the errors package)
[18]: https://dave.cheney.net/2013/01/19/what-is-the-zero-value-and-why-is-it-useful (What is the zero value, and why is it useful?)
