[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12350-1.html)
[#]: subject: (How to dump the GOSSAFUNC graph for a method)
[#]: via: (https://dave.cheney.net/2020/06/19/how-to-dump-the-gossafunc-graph-for-a-method)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

在 Go 中如何转储一个方法的 GOSSAFUNC 图
======

![](https://img.linux.net.cn/data/attachment/album/202006/26/083943vymvmc67p7s3oman.jpg)

Go 编译器的 SSA 后端包含一种工具，可以生成编译阶段的 HTML 调试输出。这篇文章介绍了如何为函数*和*方法打印 SSA 输出。

让我们从一个包含函数、值方法和指针方法的示例程序开始：

```
package main

import (
    "fmt"
)

type Numbers struct {
    vals []int
}

func (n *Numbers) Add(v int) {
    n.vals = append(n.vals, v)
}

func (n Numbers) Average() float64 {
    sum := 0.0
    for _, num := range n.vals {
        sum += float64(num)
    }
    return sum / float64(len(n.vals))
}


func main() {
    var numbers Numbers
    numbers.Add(200)
    numbers.Add(43)
    numbers.Add(-6)
    fmt.Println(numbers.Average())
}
```

通过 `GOSSAFUNC` 环境变量控制 SSA 调试输出。此变量含有要转储的函数的名称。这*不是*函数的完全限定名。对于上面的 `func main`，函数名称为 `main` *而不是* `main.main`。

```
% env GOSSAFUNC=main go build
runtime
dumped SSA to ../../go/src/runtime/ssa.html
t
dumped SSA to ./ssa.html
```

在这个例子中，`GOSSAFUNC=main` 同时匹配了 `main.main` 和一个名为 `runtime.main` 的函数。[^1]这有点不走运，但是实际上可能没什么大不了的，因为如果你要对代码进行性能调整，它就不会出现在 `func main` 中的巨大的意大利面块中。

你的代码更有可能在*方法*中，你可能已经看到这篇文章，并寻找能够转储方法的 SSA 输出。

要为指针方法 `func (n *Numbers) Add` 打印 SSA 调试，等效函数名为 `(*Numbers).Add`：[^2]

```
% env "GOSSAFUNC=(*Numbers).Add" go build
t
dumped SSA to ./ssa.html
```

要为值方法 `func (n Numbers) Average` 打印 SSA 调试，等效函数名为 `(*Numbers).Average`，*即使这是一个值方法*：

```
% env "GOSSAFUNC=(*Numbers).Average" go build
t
dumped SSA to ./ssa.html
```

[^1]: 如果你没有从源码构建 Go，那么 `runtime` 软件包的路径可能是只读的，并且可能会收到错误消息。请不要使用 `sudo` 来解决此问题。
[^2]: 请注意 shell 引用


--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/06/19/how-to-dump-the-gossafunc-graph-for-a-method

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972

