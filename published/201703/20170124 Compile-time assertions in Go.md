Go 语言编译期断言
============================================================


这篇文章是关于一个鲜为人知的让 Go 在编译期断言的方法。你可能不会使用它，但是了解一下也很有趣。

作为一个热身，来看一个在 Go 中熟知的编译期断言：接口满意度检查。

在这段代码（[playground][1]）中，`var _ =` 行确保类型 `W` 是一个 `stringWriter`，其由 [`io.WriteString`][2] 检查。

```
package main

import "io"

type W struct{}

func (w W) Write(b []byte) (int, error)       { return len(b), nil }
func (w W) WriteString(s string) (int, error) { return len(s), nil }

type stringWriter interface {
	WriteString(string) (int, error)
}

var _ stringWriter = W{}

func main() {
	var w W
	io.WriteString(w, "very long string")
}
```

如果你注释掉了 `W` 的 `WriteString` 方法，代码将无法编译：

```
main.go:14: cannot use W literal (type W) as type stringWriter in assignment:
	W does not implement stringWriter (missing WriteString method)
```

这是很有用的。对于大多数同时满足 `io.Writer` 和 `stringWriter` 的类型，如果你删除 `WriteString` 方法，一切都会像以前一样继续工作，但性能较差。

你可以使用编译期断言保护你的代码，而不是试图使用[`testing.T.AllocsPerRun'][3]为性能回归编写一个脆弱的测试。

这是[一个实际的 io 包中的技术例子][4]。

* * *

好的，让我们低调一点！

接口满意检查是很棒的。但是如果你想检查一个简单的布尔表达式，如 `1 + 1 == 2` ？

考虑这个代码（[playground] [5]）：

```
package main

import "crypto/md5"

type Hash [16]byte

func init() {
	if len(Hash{}) < md5.Size {
		panic("Hash is too small")
	}
}

func main() {
	// ...
}
```

`Hash` 可能是某种抽象的哈希结果。`init` 函数确保它将与 [crypto/md5][6] 一起工作。如果你改变 `Hash` 为（比如说）`[8]byte`，它会在进程启动时发生崩溃。但是，这是一个运行时检查。如果我们想要早点发现怎么办？

如下。（没有 playground 链接，因为这在 playground 上不起作用。）

```
package main

import "C"

import "crypto/md5"

type Hash [16]byte

func hashIsTooSmall()

func init() {
	if len(Hash{}) < md5.Size {
		hashIsTooSmall()
	}
}

func main() {
	// ...
}
```

现在如果你改变 `Hash` 为 `[8]byte`，它将在编译过程中失败。（实际上，它在链接过程中失败。足够接近我们的目标了。）

```
$ go build .
# demo
main.hashIsTooSmall: call to external function
main.init.1: relocation target main.hashIsTooSmall not defined
main.init.1: undefined: "main.hashIsTooSmall"
```

这里发生了什么？

`hashIsTooSmall` 是[一个没有函数体的声明][7]。编译器假定别人将提供一个实现，也许是一个汇编程序。

当编译器可以证明 `len（Hash {}）< md5.Size` 时，它消除了 if 语句中的代码。结果，没有人使用函数 `hashIsTooSmall`，所以链接器会消除它。没有其他损害。一旦断言失败，if 语句中的代码将被保留。不会消除 `hashIsTooSmall`。链接器然后注意到没有人提供了函数的实现然后链接失败，并出现错误，这是我们的目标。

最后一个奇怪的点：为什么是 `import "C"`？ go 工具知道在正常的 Go 代码中，所有函数都必须有主体，并指示编译器强制执行。通过切换到 cgo，我们删除该检查。（如果你在上面的代码中运行 `go build -x`，而没有添加 `import "C"` 这行，你会看到编译器是用 `-complete` 标志调用的。）另一种方法是添加 `import "C"` 来[向包中添加一个名为 `foo.s` 的空文件][8]。

我仅见过一次这种技术的使用，是在[编译器测试套件][9]中。还有其他[可以发挥想象力的使用][10]，但我还没见到过。

可能就是这样吧。 :)


--------------------------------------------------------------------------------

via: http://commaok.xyz/post/compile-time-assertions

作者：[Josh Bleecher Snyder][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/commaok
[1]:https://play.golang.org/p/MJ6zF1oNsX
[2]:https://golang.org/pkg/io/#WriteString
[3]:https://golang.org/pkg/testing/#AllocsPerRun
[4]:https://github.com/golang/go/blob/go1.8rc2/src/io/multi.go#L72
[5]:https://play.golang.org/p/mjIMWsWu4V
[6]:https://golang.org/pkg/crypto/md5/
[7]:https://golang.org/ref/spec#Function_declarations
[8]:https://github.com/golang/go/blob/go1.8rc2/src/os/signal/sig.s
[9]:https://github.com/golang/go/blob/go1.8rc2/test/fixedbugs/issue9608.dir/issue9608.go
[10]:https://github.com/golang/go/blob/go1.8rc2/src/runtime/hashmap.go#L261
