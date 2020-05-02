[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12176-1.html)
[#]: subject: (Inlining optimisations in Go)
[#]: via: (https://dave.cheney.net/2020/04/25/inlining-optimisations-in-go)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Go 中的内联优化
======

> 本文讨论 Go 编译器是如何实现内联的，以及这种优化方法如何影响你的 Go 代码。

![](https://img.linux.net.cn/data/attachment/album/202005/02/222202e3v3pppkhnndpbpn.jpg)

*请注意：*本文重点讨论 *gc*，这是来自 [golang.org](https://github.com/golang/go) 的事实标准的 Go 编译器。讨论到的概念可以广泛适用于其它 Go 编译器，如 gccgo 和 llgo，但它们在实现方式和功效上可能有所差异。

### 内联是什么？

<ruby>内联<rt>inlining</rt></ruby>就是把简短的函数在调用它的地方展开。在计算机发展历程的早期，这个优化是由程序员手动实现的。现在，内联已经成为编译过程中自动实现的基本优化过程的其中一步。

### 为什么内联很重要？

有两个原因。第一个是它消除了函数调用本身的开销。第二个是它使得编译器能更高效地执行其他的优化策略。

#### 函数调用的开销

在任何语言中，调用一个函数 [^1] 都会有消耗。把参数编组进寄存器或放入栈中（取决于 ABI），在返回结果时的逆反过程都会有开销。引入一次函数调用会导致程序计数器从指令流的一点跳到另一点，这可能导致管道滞后。函数内部通常有<ruby>前置处理<rt>preamble</rt></ruby>，需要为函数执行准备新的栈帧，还有与前置相似的<ruby>后续处理<rt>epilogue</rt></ruby>，需要在返回给调用方之前释放栈帧空间。

在 Go 中函数调用会消耗额外的资源来支持栈的动态增长。在进入函数时，goroutine 可用的栈空间与函数需要的空间大小进行比较。如果可用空间不同，前置处理就会跳到<ruby>运行时<rt>runtime</rt></ruby>的逻辑中，通过把数据复制到一块新的、更大的空间的来增长栈空间。当这个复制完成后，运行时就会跳回到原来的函数入口，再执行栈空间检查，现在通过了检查，函数调用继续执行。这种方式下，goroutine 开始时可以申请很小的栈空间，在有需要时再申请更大的空间。[^2]

这个检查消耗很小，只有几个指令，而且由于 goroutine 的栈是成几何级数增长的，因此这个检查很少失败。这样，现代处理器的分支预测单元可以通过假定检查肯定会成功来隐藏栈空间检查的消耗。当处理器预测错了栈空间检查，不得不放弃它在推测性执行所做的操作时，与为了增加 goroutine 的栈空间运行时所需的操作消耗的资源相比，管道滞后的代价更小。

虽然现代处理器可以用预测性执行技术优化每次函数调用中的泛型和 Go 特定的元素的开销，但那些开销不能被完全消除，因此在每次函数调用执行必要的工作过程中都会有性能消耗。一次函数调用本身的开销是固定的，与更大的函数相比，调用小函数的代价更大，因为在每次调用过程中它们做的有用的工作更少。

因此，消除这些开销的方法必须是要消除函数调用本身，Go 的编译器就是这么做的，在某些条件下通过用函数的内容来替换函数调用来实现。这个过程被称为*内联*，因为它在函数调用处把函数体展开了。

#### 改进的优化机会

Cliff Click 博士把内联描述为现代编译器做的优化措施，像常量传播（LCTT 译注：此处作者笔误，原文为 constant proportion，修正为 constant propagation）和死代码消除一样，都是编译器的基本优化方法。实际上，内联可以让编译器看得更深，使编译器可以观察调用的特定函数的上下文内容，可以看到能继续简化或彻底消除的逻辑。由于可以递归地执行内联，因此不仅可以在每个独立的函数上下文处进行这种优化决策，也可以在整个函数调用链中进行。

### 实践中的内联

下面这个例子可以演示内联的影响：

```go
package main

import "testing"

//go:noinline
func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}

var Result int

func BenchmarkMax(b *testing.B) {
    var r int
    for i := 0; i < b.N; i++ {
        r = max(-1, i)
    }
    Result = r
}
```

运行这个基准，会得到如下结果：[^3]

```bash
% go test -bench=. 
BenchmarkMax-4   530687617         2.24 ns/op
```

在我的 2015 MacBook Air 上 `max(-1, i)` 的耗时约为 2.24 纳秒。现在去掉 `//go:noinline` 编译指令，再看下结果：

```bash
% go test -bench=. 
BenchmarkMax-4   1000000000         0.514 ns/op
```

从 2.24 纳秒降到了 0.51 纳秒，或者从 `benchstat` 的结果可以看出，有 78% 的提升。

```bash
% benchstat {old,new}.txt
name   old time/op  new time/op  delta
Max-4  2.21ns ± 1%  0.49ns ± 6%  -77.96%  (p=0.000 n=18+19)
```

这个提升是从哪儿来的呢？

首先，移除掉函数调用以及与之关联的前置处理 [^4] 是主要因素。把 `max` 函数的函数体在调用处展开，减少了处理器执行的指令数量并且消除了一些分支。

现在由于编译器优化了 `BenchmarkMax`，因此它可以看到 `max` 函数的内容，进而可以做更多的提升。当 `max` 被内联后，`BenchmarkMax` 呈现给编译器的样子，看起来是这样的：

```go
func BenchmarkMax(b *testing.B) {
    var r int
    for i := 0; i < b.N; i++ {
        if -1 > i {
            r = -1
        } else {
            r = i
        }
    }
    Result = r
}
```

再运行一次基准，我们看一下手动内联的版本和编译器内联的版本的表现：

```bash
% benchstat {old,new}.txt
name   old time/op  new time/op  delta
Max-4  2.21ns ± 1%  0.48ns ± 3%  -78.14%  (p=0.000 n=18+18)
```

现在编译器能看到在 `BenchmarkMax` 里内联 `max` 的结果，可以执行以前不能执行的优化措施。例如，编译器注意到 `i` 初始值为 `0`，仅做自增操作，因此所有与 `i` 的比较都可以假定 `i` 不是负值。这样条件表达式 `-1 > i` 永远不是 `true`。[^5]

证明了 `-1 > i` 永远不为 true 后，编译器可以把代码简化为：

```go
func BenchmarkMax(b *testing.B) {
    var r int
    for i := 0; i < b.N; i++ {
        if false {
            r = -1
        } else {
            r = i
        }
    }
    Result = r
}
```

并且因为分支里是个常量，编译器可以通过下面的方式移除不会走到的分支：

```go
func BenchmarkMax(b *testing.B) {
    var r int
    for i := 0; i < b.N; i++ {
        r = i
    }
    Result = r
}
```

这样，通过内联和由内联解锁的优化过程，编译器把表达式 `r = max(-1, i))` 简化为 `r = i`。

### 内联的限制

本文中我论述的内联称作<ruby>叶子内联<rt>leaf inlining</rt></ruby>：把函数调用栈中最底层的函数在调用它的函数处展开的行为。内联是个递归的过程，当把函数内联到调用它的函数 A 处后，编译器会把内联后的结果代码再内联到 A 的调用方，这样持续内联下去。例如，下面的代码：

```go
func BenchmarkMaxMaxMax(b *testing.B) {
    var r int
    for i := 0; i < b.N; i++ {
        r = max(max(-1, i), max(0, i))
    }
    Result = r
}
```

与之前的例子中的代码运行速度一样快，因为编译器可以对上面的代码重复地进行内联，也把代码简化到 `r = i` 表达式。

下一篇文章中，我会论述当 Go 编译器想要内联函数调用栈中间的某个函数时选用的另一种内联策略。最后我会论述编译器为了内联代码准备好要达到的极限，这个极限 Go 现在的能力还达不到。

[^1]: 在 Go 中，一个方法就是一个有预先定义的形参和接受者的函数。假设这个方法不是通过接口调用的，调用一个无消耗的函数所消耗的代价与引入一个方法是相同的。
[^2]: 在 Go 1.14 以前，栈检查的前置处理也被垃圾回收器用于 STW，通过把所有活跃的 goroutine 栈空间设为 0，来强制它们切换为下一次函数调用时的运行时状态。这个机制[最近被替换][8]为一种新机制，新机制下运行时可以不用等 goroutine 进行函数调用就可以暂停 goroutine。
[^3]: 我用 `//go:noinline` 编译指令来阻止编译器内联 `max`。这是因为我想把内联 `max` 的影响与其他影响隔离开，而不是用 `-gcflags='-l -N'` 选项在全局范围内禁止优化。关于 `//go:` 注释在[这篇文章][10]中详细论述。
[^4]: 你可以自己通过比较 `go test -bench=. -gcflags=-S` 有无 `//go:noinline` 注释时的不同结果来验证一下。
[^5]: 你可以用 `-gcflags=-d=ssa/prove/debug=on` 选项来自己验证一下。

#### 相关文章：

1. [使 Go 变快的 5 件事](https://dave.cheney.net/2014/06/07/five-things-that-make-go-fast)
2. [为什么 Goroutine 的栈空间会无限增长？](https://dave.cheney.net/2013/06/02/why-is-a-goroutines-stack-infinite)
3. [Go 中怎么写基准测试](https://dave.cheney.net/2013/06/30/how-to-write-benchmarks-in-go)
4. [Go 中隐藏的编译指令](https://dave.cheney.net/2018/01/08/gos-hidden-pragmas)

--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/04/25/inlining-optimisations-in-go

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://github.com/golang/go
[2]: tmp.gBQ2tEtMHc#easy-footnote-bottom-1-4053 (In Go, a method is just a function with a predefined formal parameter, the receiver. The relative costs of calling a free function vs a invoking a method, assuming that method is not called through an interface, are the same.)
[3]: tmp.gBQ2tEtMHc#easy-footnote-bottom-2-4053 (Up until Go 1.14 the stack check preamble was also used by the garbage collector to stop the world by setting all active goroutine’s stacks to zero, forcing them to trap into the runtime the next time they made a function call. This system was <a href="https://github.com/golang/proposal/blob/master/design/24543-non-cooperative-preemption.md">recently replaced</a> with a mechanism which allowed the runtime to pause an goroutine without waiting for it to make a function call.)
[4]: tmp.gBQ2tEtMHc#easy-footnote-bottom-3-4053 (I’m using the <code>//go:noinline</code> pragma to prevent the compiler from inlining <code>max</code>. This is because I want to isolate the effects of inlining on <code>max</code> rather than disabling optimisations globally with <code>-gcflags='-l -N'</code>. I go into detail about the <code>//go:</code> comments in <a href="https://dave.cheney.net/2018/01/08/gos-hidden-pragmas">this presentation</a>.)
[5]: tmp.gBQ2tEtMHc#easy-footnote-bottom-4-4053 (You can check this for yourself by comparing the output of <code>go test -bench=. -gcflags=-S</code> with and without the <code>//go:noinline</code> annotation.)
[6]: tmp.gBQ2tEtMHc#easy-footnote-bottom-5-4053 (You can check this yourself with the <code>-gcflags=-d=ssa/prove/debug=on</code> flag.)
[7]: tmp.gBQ2tEtMHc#easy-footnote-1-4053
[8]: https://github.com/golang/proposal/blob/master/design/24543-non-cooperative-preemption.md
[9]: tmp.gBQ2tEtMHc#easy-footnote-2-4053
[10]: https://dave.cheney.net/2018/01/08/gos-hidden-pragmas
[11]: tmp.gBQ2tEtMHc#easy-footnote-3-4053
[12]: tmp.gBQ2tEtMHc#easy-footnote-4-4053
[13]: tmp.gBQ2tEtMHc#easy-footnote-5-4053
[14]: https://dave.cheney.net/2014/06/07/five-things-that-make-go-fast (Five things that make Go fast)
[15]: https://dave.cheney.net/2013/06/02/why-is-a-goroutines-stack-infinite (Why is a Goroutine’s stack infinite ?)
[16]: https://dave.cheney.net/2013/06/30/how-to-write-benchmarks-in-go (How to write benchmarks in Go)
[17]: https://dave.cheney.net/2018/01/08/gos-hidden-pragmas (Go’s hidden #pragmas)
