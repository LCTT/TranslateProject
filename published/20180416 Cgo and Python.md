如何在 Go 中嵌入 Python
==================

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_hero.png?auto=format&w=1900&dpr=1)

如果你看一下 [新的 Datadog Agent][8]，你可能会注意到大部分代码库是用 Go 编写的，尽管我们用来收集指标的检查仍然是用 Python 编写的。这大概是因为 Datadog Agent 是一个 [嵌入了][9] CPython 解释器的普通 Go 二进制文件，可以在任何时候按需执行 Python 代码。这个过程通过抽象层来透明化，使得你可以编写惯用的 Go 代码而底层运行的是 Python。

[视频](https://youtu.be/yrEi5ezq2-c)

在 Go 应用程序中嵌入 Python 的原因有很多：

* 它在过渡期间很有用；可以逐步将现有 Python 项目的部分迁移到新语言，而不会在此过程中丢失任何功能。
* 你可以复用现有的 Python 软件或库，而无需用新语言重新实现。
* 你可以通过加载去执行常规 Python 脚本来动态扩展你软件，甚至在运行时也可以。

理由还可以列很多，但对于 Datadog Agent 来说，最后一点至关重要：我们希望做到无需重新编译 Agent，或者说编译任何内容就能够执行自定义检查或更改现有检查。

嵌入 CPython 非常简单，而且文档齐全。解释器本身是用 C 编写的，并且提供了一个 C API 以编程方式来执行底层操作，例如创建对象、导入模块和调用函数。

在本文中，我们将展示一些代码示例，我们将会在与 Python 交互的同时继续保持 Go 代码的惯用语，但在我们继续之前，我们需要解决一个间隙：嵌入 API 是 C 语言，但我们的主要应用程序是 Go，这怎么可能工作？

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_1.png?auto=format&fit=max&w=847)

### 介绍 cgo

有 [很多好的理由][10] 说服你为什么不要在堆栈中引入 cgo，但嵌入 CPython 是你必须这样做的原因。[cgo][11] 不是语言，也不是编译器。它是 <ruby>[外部函数接口][12]<rt>Foreign Function Interface</rt></ruby>（FFI），一种让我们可以在 Go 中使用来调用不同语言（特别是 C）编写的函数和服务的机制。

当我们提起 “cgo” 时，我们实际上指的是 Go 工具链在底层使用的一组工具、库、函数和类型，因此我们可以通过执行 `go build` 来获取我们的 Go 二进制文件。下面是使用 cgo 的示例程序：

```
package main

// #include <float.h>
import "C"
import "fmt"

func main() {
    fmt.Println("Max float value of float is", C.FLT_MAX)
}

```

在这种包含头文件情况下，`import "C"` 指令上方的注释块称为“<ruby>序言<rt>preamble</rt></ruby>”，可以包含实际的 C 代码。导入后，我们可以通过“C”伪包来“跳转”到外部代码，访问常量 `FLT_MAX`。你可以通过调用 `go build` 来构建，它就像普通的 Go 一样。

如果你想查看 cgo 在这背后到底做了什么，可以运行 `go build -x`。你将看到 “cgo” 工具将被调用以生成一些 C 和 Go 模块，然后将调用 C 和 Go 编译器来构建目标模块，最后链接器将所有内容放在一起。

你可以在 [Go 博客][13] 上阅读更多有关 cgo 的信息，该文章包含更多的例子以及一些有用的链接来做进一步了解细节。

现在我们已经了解了 cgo 可以为我们做什么，让我们看看如何使用这种机制运行一些 Python 代码。

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_2.png?auto=format&fit=max&w=847)

### 嵌入 CPython：一个入门指南

从技术上讲，嵌入 CPython 的 Go 程序并没有你想象的那么复杂。事实上，我们只需在运行 Python 代码之前初始化解释器，并在完成后关闭它。请注意，我们在所有示例中使用 Python 2.x，但我们只需做很少的调整就可以应用于 Python 3.x。让我们看一个例子：

```
package main

// #cgo pkg-config: python-2.7
// #include <Python.h>
import "C"
import "fmt"

func main() {
    C.Py_Initialize()
    fmt.Println(C.GoString(C.Py_GetVersion()))
    C.Py_Finalize()
}

```

上面的例子做的正是下面 Python 代码要做的事：

```
import sys
print(sys.version)
```

你可以看到我们在序言加入了一个 `#cgo` 指令；这些指令被会被传递到工具链，让你改变构建工作流程。在这种情况下，我们告诉 cgo 调用 `pkg-config` 来收集构建和链接名为 `python-2.7` 的库所需的标志，并将这些标志传递给 C 编译器。如果你的系统中安装了 CPython 开发库和 pkg-config，你只需要运行 `go build` 来编译上面的示例。

回到代码，我们使用 `Py_Initialize()` 和 `Py_Finalize()` 来初始化和关闭解释器，并使用 `Py_GetVersion` C 函数来获取嵌入式解释器版本信息的字符串。

如果你想知道，所有我们需要放在一起调用 C 语言 Python API的 cgo 代码都是模板代码。这就是为什么 Datadog Agent 依赖 [go-python][14] 来完成所有的嵌入操作；该库为 C API 提供了一个 Go 友好的轻量级包，并隐藏了 cgo 细节。这是另一个基本的嵌入式示例，这次使用 go-python：

```
package main

import (
    python "github.com/sbinet/go-python"
)

func main() {
    python.Initialize()
    python.PyRun_SimpleString("print 'hello, world!'")
    python.Finalize()
}

```

这看起来更接近普通 Go 代码，不再暴露 cgo，我们可以在访问 Python API 时来回使用 Go 字符串。嵌入式看起来功能强大且对开发人员友好，是时候充分利用解释器了：让我们尝试从磁盘加载 Python 模块。

在 Python 方面我们不需要任何复杂的东西，无处不在的“hello world” 就可以达到目的：

```
# foo.py
def hello():
    """
    Print hello world for fun and profit.
    """
    print "hello, world!"
```

Go 代码稍微复杂一些，但仍然可读：

```
// main.go
package main

import "github.com/sbinet/go-python"

func main() {
    python.Initialize()
    defer python.Finalize()

    fooModule := python.PyImport_ImportModule("foo")
    if fooModule == nil {
        panic("Error importing module")
    }

    helloFunc := fooModule.GetAttrString("hello")
    if helloFunc == nil {
        panic("Error importing function")
    }

    // The Python function takes no params but when using the C api
    // we're required to send (empty) *args and **kwargs anyways.
    helloFunc.Call(python.PyTuple_New(0), python.PyDict_New())
}

```

构建时，我们需要将 `PYTHONPATH` 环境变量设置为当前工作目录，以便导入语句能够找到 `foo.py` 模块。在 shell 中，该命令如下所示：

```
$ go build main.go && PYTHONPATH=. ./main
hello, world!
```

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_3.png?auto=format&fit=max&w=847)

### 可怕的全局解释器锁

为了嵌入 Python 必须引入 cgo ，这是一种权衡：构建速度会变慢，垃圾收集器不会帮助我们管理外部系统使用的内存，交叉编译也很难。对于一个特定的项目来说，这些问题是否是可以争论的，但我认为有一些不容商量的问题：Go 并发模型。如果我们不能从 goroutine 中运行 Python，那么使用 Go 就没有意义了。

在处理并发、Python 和 cgo 之前，我们还需要知道一些事情：它就是<ruby>全局解释器锁<rt>Global Interpreter Lock</rt></ruby>，即 GIL。GIL 是语言解释器（CPython 就是其中之一）中广泛采用的一种机制，可防止多个线程同时运行。这意味着 CPython 执行的任何 Python 程序都无法在同一进程中并行运行。并发仍然是可能的，锁是速度、安全性和实现简易性之间的一个很好的权衡，那么，当涉及到嵌入时，为什么这会造成问题呢？

当一个常规的、非嵌入式的 Python 程序启动时，不涉及 GIL 以避免锁定操作中的无用开销；在某些 Python 代码首次请求生成线程时 GIL 就启动了。对于每个线程，解释器创建一个数据结构来存储当前的相关状态信息并锁定 GIL。当线程完成时，状态被恢复，GIL 被解锁，准备被其他线程使用。

当我们从 Go 程序运行 Python 时，上述情况都不会自动发生。如果没有 GIL，我们的 Go 程序可以创建多个 Python 线程，这可能会导致竞争条件，从而导致致命的运行时错误，并且很可能出现分段错误导致整个 Go 应用程序崩溃。

解决方案是在我们从 Go 运行多线程代码时显式调用 GIL；代码并不复杂，因为 C API 提供了我们需要的所有工具。为了更好地暴露这个问题，我们需要写一些受 CPU 限制的 Python 代码。让我们将这些函数添加到前面示例中的 `foo.py` 模块中：

```
# foo.py
import sys

def print_odds(limit=10):
    """
    Print odds numbers < limit
    """
    for i in range(limit):
        if i%2:
            sys.stderr.write("{}\n".format(i))

def print_even(limit=10):
    """
    Print even numbers < limit
    """
    for i in range(limit):
        if i%2 == 0:
            sys.stderr.write("{}\n".format(i))

```

我们将尝试从 Go 并发打印奇数和偶数，使用两个不同的 goroutine（因此涉及线程）：

```
package main

import (
    "sync"

    "github.com/sbinet/go-python"
)

func main() {
    // The following will also create the GIL explicitly
    // by calling PyEval_InitThreads(), without waiting
    // for the interpreter to do that
    python.Initialize()

    var wg sync.WaitGroup
    wg.Add(2)

    fooModule := python.PyImport_ImportModule("foo")
    odds := fooModule.GetAttrString("print_odds")
    even := fooModule.GetAttrString("print_even")

    // Initialize() has locked the the GIL but at this point we don't need it
    // anymore. We save the current state and release the lock
    // so that goroutines can acquire it
    state := python.PyEval_SaveThread()

    go func() {
        _gstate := python.PyGILState_Ensure()
        odds.Call(python.PyTuple_New(0), python.PyDict_New())
        python.PyGILState_Release(_gstate)

        wg.Done()
    }()

    go func() {
        _gstate := python.PyGILState_Ensure()
        even.Call(python.PyTuple_New(0), python.PyDict_New())
        python.PyGILState_Release(_gstate)

        wg.Done()
    }()

    wg.Wait()

    // At this point we know we won't need Python anymore in this
    // program, we can restore the state and lock the GIL to perform
    // the final operations before exiting.
    python.PyEval_RestoreThread(state)
    python.Finalize()
}

```

在阅读示例时，你可能会注意到一个模式，该模式将成为我们运行嵌入式 Python 代码的习惯写法：

1.  保存状态并锁定 GIL。
2.  执行 Python。
3.  恢复状态并解锁 GIL。

代码应该很简单，但我们想指出一个微妙的细节：请注意，尽管借用了 GIL 执行，有时我们通过调用 `PyEval_SaveThread()` 和 `PyEval_RestoreThread()` 来操作 GIL，有时（查看 goroutines 里面）我们对 `PyGILState_Ensure()` 和 `PyGILState_Release()` 来做同样的事情。

我们说过当从 Python 操作多线程时，解释器负责创建存储当前状态所需的数据结构，但是当同样的事情发生在 C API 时，我们来负责处理。

当我们用 go-python 初始化解释器时，我们是在 Python 上下文中操作的。因此，当调用 `PyEval_InitThreads()` 时，它会初始化数据结构并锁定 GIL。我们可以使用 `PyEval_SaveThread()` 和 `PyEval_RestoreThread()` 对已经存在的状态进行操作。

在 goroutines 中，我们从 Go 上下文操作，我们需要显式创建状态并在完成后将其删除，这就是 `PyGILState_Ensure()` 和 `PyGILState_Release()` 为我们所做的。

![](https://datadog-prod.imgix.net/img/blog/engineering/cgo-and-python/cgo_python_divider_4.png?auto=format&fit=max&w=847)

### 释放 Gopher

在这一点上，我们知道如何处理在嵌入式解释器中执行 Python 的多线程 Go 代码，但在 GIL 之后，另一个挑战即将来临：Go 调度程序。

当一个 goroutine 启动时，它被安排在可用的 `GOMAXPROCS` 线程之一上执行，[参见此处][15] 可了解有关该主题的更多详细信息。如果一个 goroutine 碰巧执行了系统调用或调用 C 代码，当前线程会将线程队列中等待运行的其他 goroutine 移交给另一个线程，以便它们有更好的机会运行； 当前 goroutine 被暂停，等待系统调用或 C 函数返回。当这种情况发生时，线程会尝试恢复暂停的 goroutine，但如果这不可能，它会要求 Go 运行时找到另一个线程来完成 goroutine 并进入睡眠状态。 goroutine 最后被安排给另一个线程，它就完成了。

考虑到这一点，让我们看看当一个 goroutine 被移动到一个新线程时，运行一些 Python 代码的 goroutine 会发生什么：

1.  我们的 goroutine 启动，执行 C 调用并暂停。GIL 被锁定。
2.  当 C 调用返回时，当前线程尝试恢复 goroutine，但失败了。
3.  当前线程告诉 Go 运行时寻找另一个线程来恢复我们的 goroutine。
4.  Go 调度器找到一个可用线程并恢复 goroutine。
5.  goroutine 快完成了，并在返回之前尝试解锁 GIL。
6.  当前状态中存储的线程 ID 来自原线程，与当前线程的 ID 不同。
7.  崩溃！

所幸，我们可以通过从 goroutine 中调用运行时包中的 `LockOSThread` 函数来强制 Go runtime 始终保持我们的 goroutine 在同一线程上运行：

```
go func() {
    runtime.LockOSThread()

    _gstate := python.PyGILState_Ensure()
    odds.Call(python.PyTuple_New(0), python.PyDict_New())
    python.PyGILState_Release(_gstate)
    wg.Done()
}()
```

这会干扰调度器并可能引入一些开销，但这是我们愿意付出的代价。

### 结论

为了嵌入 Python，Datadog Agent 必须接受一些权衡：

*   cgo 引入的开销。
*   手动处理 GIL 的任务。
*   在执行期间将 goroutine 绑定到同一线程的限制。

为了能方便在 Go 中运行 Python 检查，我们很乐意接受其中的每一项。但通过意识到这些权衡，我们能够最大限度地减少它们的影响，除了为支持 Python 而引入的其他限制，我们没有对策来控制潜在问题：

*   构建是自动化和可配置的，因此开发人员仍然需要拥有与 `go build` 非常相似的东西。
*   Agent 的轻量级版本，可以使用 Go 构建标签，完全剥离 Python 支持。
*   这样的版本仅依赖于在 Agent 本身硬编码的核心检查（主要是系统和网络检查），但没有 cgo 并且可以交叉编译。

我们将在未来重新评估我们的选择，并决定是否仍然值得保留 cgo；我们甚至可以重新考虑整个 Python 是否仍然值得，等待 [Go 插件包][16] 成熟到足以支持我们的用例。但就目前而言，嵌入式 Python 运行良好，从旧代理过渡到新代理再简单不过了。

你是一个喜欢混合不同编程语言的多语言者吗？你喜欢了解语言的内部工作原理以提高你的代码性能吗？

--------------------------------------------------------------------------------

via: https://www.datadoghq.com/blog/engineering/cgo-and-python/

作者：[Massimiliano Pippi][a]
译者：[Zioyi](https://github.com/Zioyi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/masci
[1]:http://twitter.com/share?url=https://www.datadoghq.com/blog/engineering/cgo-and-python/
[2]:http://www.reddit.com/submit?url=https://www.datadoghq.com/blog/engineering/cgo-and-python/
[3]:https://www.linkedin.com/shareArticle?mini=true&url=https://www.datadoghq.com/blog/engineering/cgo-and-python/
[4]:https://www.datadoghq.com/blog/category/under-the-hood
[5]:https://www.datadoghq.com/blog/tag/agent
[6]:https://www.datadoghq.com/blog/tag/golang
[7]:https://www.datadoghq.com/blog/tag/python
[8]:https://github.com/DataDog/datadog-agent/
[9]:https://docs.python.org/2/extending/embedding.html
[10]:https://dave.cheney.net/2016/01/18/cgo-is-not-go
[11]:https://golang.org/cmd/cgo/
[12]:https://en.wikipedia.org/wiki/Foreign_function_interface
[13]:https://blog.golang.org/c-go-cgo
[14]:https://github.com/sbinet/go-python
[15]:https://morsmachine.dk/go-scheduler
[16]:https://golang.org/pkg/plugin/
[17]:https://www.datadoghq.com/careers/
