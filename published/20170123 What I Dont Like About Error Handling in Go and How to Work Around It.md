我对 Go 的错误处理有哪些不满，以及我是如何处理的
======================

写 Go 的人往往对它的错误处理模式有一定的看法。按不同的语言经验，人们可能有不同的习惯处理方法。这就是为什么我决定要写这篇文章，尽管有点固执己见，但我认为听取我的经验是有用的。我想要讲的主要问题是，很难去强制执行良好的错误处理实践，错误经常没有堆栈追踪，并且错误处理本身太冗长。不过，我已经看到了一些潜在的解决方案，或许能帮助解决一些问题。

### 与其他语言的快速比较

[在 Go 中，所有的错误都是值][1]。因为这点，相当多的函数最后会返回一个 `error`, 看起来像这样：

```
func (s *SomeStruct) Function() (string, error)
```

因此这导致调用代码通常会使用 `if` 语句来检查它们：

```
bytes, err := someStruct.Function()
if err != nil {
  // Process error
}
```

另外一种方法，是在其他语言中，如 Java、C#、Javascript、Objective C、Python 等使用的 `try-catch` 模式。如下你可以看到与先前的 Go 示例类似的 Java 代码，声明 `throws` 而不是返回 `error`： 

```
public String function() throws Exception
```

它使用的是 `try-catch` 而不是 `if err != nil`：

```
try {
  String result = someObject.function()
  // continue logic
}
catch (Exception e) {
  // process exception
}
```

当然，还有其他的不同。例如，`error` 不会使你的程序崩溃，然而 `Exception` 会。还有其他的一些，在本篇中会专门提到这些。

### 实现集中式错误处理

退一步，让我们看看为什么要在一个集中的地方处理错误，以及如何做到。

大多数人或许会熟悉的一个例子是 web 服务 - 如果出现了一些未预料的的服务端错误，我们会生成一个 5xx 错误。在 Go 中，你或许会这么实现：

```
func init() {
    http.HandleFunc("/users", viewUsers)
    http.HandleFunc("/companies", viewCompanies)
}

func viewUsers(w http.ResponseWriter, r *http.Request) {
    user // some code
    if err := userTemplate.Execute(w, user); err != nil {
        http.Error(w, err.Error(), 500)
    }
}

func viewCompanies(w http.ResponseWriter, r *http.Request) {
    companies = // some code
    if err := companiesTemplate.Execute(w, companies); err != nil {
        http.Error(w, err.Error(), 500)
    }
}
```

这并不是一个好的解决方案，因为我们不得不重复地在所有的处理函数中处理错误。为了能更好地维护，最好能在一处地方处理错误。幸运的是，[在 Go 语言的官方博客中，Andrew Gerrand 提供了一个替代方法][2]，可以完美地实现。我们可以创建一个处理错误的 Type：

```
type appHandler func(http.ResponseWriter, *http.Request) error

func (fn appHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    if err := fn(w, r); err != nil {
        http.Error(w, err.Error(), 500)
    }
}
```

这可以作为一个封装器来修饰我们的处理函数：

```
func init() {
    http.Handle("/users", appHandler(viewUsers))
    http.Handle("/companies", appHandler(viewCompanies))
}
```

接着我们需要做的是修改处理函数的签名来使它们返回 `errors`。这个方法很好，因为我们做到了 [DRY][3] 原则，并且没有重复使用不必要的代码 - 现在我们可以在单独一个地方返回默认错误了。

### 错误上下文

在先前的例子中，我们可能会收到许多潜在的错误，它们中的任何一个都可能在调用堆栈的许多环节中生成。这时候事情就变得棘手了。

为了演示这点，我们可以扩展我们的处理函数。它可能看上去像这样，因为模板执行并不是唯一一处会发生错误的地方：

```
func viewUsers(w http.ResponseWriter, r *http.Request) error {
    user, err := findUser(r.formValue("id")) 
    if err != nil {
      return err;
    }
    return userTemplate.Execute(w, user);
}
```

调用链可能会相当深，在整个过程中，各种错误可能在不同的地方实例化。[Russ Cox][4]的这篇文章解释了如何避免遇到太多这类问题的最佳实践：

> “在 Go 中错误报告的部分约定是函数包含相关的上下文，包括正在尝试的操作（比如函数名和它的参数）。”

这个给出的例子是对 OS 包的一个调用：

```
err := os.Remove("/tmp/nonexist")
fmt.Println(err)
```

它会输出：

```
remove /tmp/nonexist: no such file or directory
```

总结一下，执行后，输出的是被调用的函数、给定的参数、特定的出错信息。当在其他语言中创建一个 `Exception` 消息时，你也可以遵循这个实践。如果我们在 `viewUsers` 处理中坚持这点，那么几乎总是能明确错误的原因。

问题来自于那些不遵循这个最佳实践的人，并且你经常会在第三方的 Go 库中看到这些消息：

```
Oh no I broke
```

这没什么帮助 - 你无法了解上下文，这使得调试很困难。更糟糕的是，当这些错误被忽略或返回时，这些错误会被备份到堆栈中，直到它们被处理为止：

```
if err != nil {
  return err
}
```

这意味着错误何时发生并没有被传递出来。

应该注意的是，所有这些错误都可以在 `Exception` 驱动的模型中发生 - 糟糕的错误信息、隐藏异常等。那么为什么我认为该模型更有用？

即便我们在处理一个糟糕的异常消息，_我们仍然能够了解它发生在调用堆栈中什么地方_。因为堆栈跟踪，这引发了一些我对 Go 不了解的部分 - 你知道 Go 的 `panic` 包含了堆栈追踪，但是 `error` 没有。我推测可能是 `panic` 会使你的程序崩溃，因此需要一个堆栈追踪，而处理错误并不会，因为它会假定你在它发生的地方做一些事。

所以让我们回到之前的例子 - 一个有糟糕错误信息的第三方库，它只是输出了调用链。你认为调试会更容易吗？

```
panic: Oh no I broke
[signal 0xb code=0x1 addr=0x0 pc=0xfc90f]

goroutine 1103 [running]:
panic(0x4bed00, 0xc82000c0b0)
/usr/local/go/src/runtime/panic.go:481 +0x3e6
github.com/Org/app/core.(_app).captureRequest(0xc820163340, 0x0, 0x55bd50, 0x0, 0x0)
/home/ubuntu/.go_workspace/src/github.com/Org/App/core/main.go:313 +0x12cf
github.com/Org/app/core.(_app).processRequest(0xc820163340, 0xc82064e1c0, 0xc82002aab8, 0x1)
/home/ubuntu/.go_workspace/src/github.com/Org/App/core/main.go:203 +0xb6
github.com/Org/app/core.NewProxy.func2(0xc82064e1c0, 0xc820bb2000, 0xc820bb2000, 0x1)
/home/ubuntu/.go_workspace/src/github.com/Org/App/core/proxy.go:51 +0x2a
github.com/Org/app/core/vendor/github.com/rusenask/goproxy.FuncReqHandler.Handle(0xc820da36e0, 0xc82064e1c0, 0xc820bb2000, 0xc5001, 0xc820b4a0a0)
/home/ubuntu/.go_workspace/src/github.com/Org/app/core/vendor/github.com/rusenask/goproxy/actions.go:19 +0x30
```

我认为这可能是 Go 的设计中被忽略的东西 - 不是所有语言都不会忽视的。

如果我们使用 Java 作为一个随意的例子，其中人们犯的一个最愚蠢的错误是不记录堆栈追踪：

```
LOGGER.error(ex.getMessage()) // 不记录堆栈追踪
LOGGER.error(ex.getMessage(), ex) // 记录堆栈追踪
```

但是 Go 似乎在设计中就没有这个信息。

在获取上下文信息方面 - Russ 还提到了社区正在讨论一些潜在的接口用于剥离上下文错误。关于这点，了解更多或许会很有趣。

### 堆栈追踪问题解决方案

幸运的是，在做了一些查找后，我发现了这个出色的 [Go 错误][5]库来帮助解决这个问题，来给错误添加堆栈跟踪：

```
if errors.Is(err, crashy.Crashed) {
  fmt.Println(err.(*errors.Error).ErrorStack())
}
```

不过，我认为这个功能如果能成为语言的<ruby>第一类公民<rt>first class citizenship</rt></ruby>将是一个改进，这样你就不必做一些类型修改了。此外，如果我们像先前的例子那样使用第三方库，它可能没有使用 `crashy` - 我们仍有相同的问题。

### 我们对错误应该做什么？

我们还必须考虑发生错误时应该发生什么。[这一定有用，它们不会让你的程序崩溃][6]，通常也会立即处理它们：

```
err := method()
if err != nil {
  // some logic that I must do now in the event of an error!
}
```

如果我们想要调用大量方法，它们会产生错误，然后在一个地方处理所有错误，这时会发生什么？看上去像这样：

```
err := doSomething()
if err != nil {
  // handle the error here
}

func doSomething() error {
  err := someMethod()
  if err != nil {
    return err
  }
  err = someOther()
  if err != nil {
    return err
  }
  someOtherMethod()
}
```

这感觉有点冗余，在其他语言中你可以将多条语句作为一个整体处理。

```
try {
  someMethod()
  someOther()
  someOtherMethod()
}
catch (Exception e) {
  // process exception
}
```

或者只要在方法签名中传递错误：

```
public void doSomething() throws SomeErrorToPropogate {
  someMethod()
  someOther()
  someOtherMethod()
}
```

我个人认为这两个例子实现了一件事情，只是 `Exception` 模式更少冗余，更加弹性。如果有什么的话，我觉得 `if err！= nil` 感觉像样板。也许有一种方法可以清理？

### 将失败的多条语句做为一个整体处理错误

首先，我做了更多的阅读，并[在 Rob Pike 写的 Go 博客中][7]发现了一个比较务实的解决方案。

他定义了一个封装了错误的方法的结构体：

```
type errWriter struct {
    w   io.Writer
    err error
}

func (ew *errWriter) write(buf []byte) {
    if ew.err != nil {
        return
    }
    _, ew.err = ew.w.Write(buf)
}
```

让我们这么做：

```
ew := &errWriter{w: fd}
ew.write(p0[a:b])
ew.write(p1[c:d])
ew.write(p2[e:f])
// and so on
if ew.err != nil {
    return ew.err
}
```

这也是一个很好的方案，但是我感觉缺少了点什么 - 因为我们不能重复使用这个模式。如果我们想要一个含有字符串参数的方法，我们就不得不改变函数签名。或者如果我们不想执行写操作会怎样？我们可以尝试使它更通用：

```
type errWrapper struct {
    err error
}
```

```
func (ew *errWrapper) do(f func() error) {
    if ew.err != nil {
        return
    }
    ew.err = f();
}
```

但是我们有一个相同的问题，如果我们想要调用含有不同参数的函数，它就无法编译了。然而你可以简单地封装这些函数调用：

```
w := &errWrapper{}

w.do(func() error {
    return someFunction(1, 2);
})

w.do(func() error {
    return otherFunction("foo");
})

err := w.err

if err != nil {
// process error here
}
```

这可以用，但是并没有太大帮助，因为它最终比标准的 `if err != nil` 检查带来了更多的冗余。如果有人能提供其他解决方案，我会很有兴趣听。或许这个语言本身需要一些方法来以不那么臃肿的方式传递或者组合错误 - 但是感觉似乎是特意设计成不那么做。

### 总结

看完这些之后，你可能会认为我在对 `error` 挑刺儿，由此推论我反对 Go。事实并非如此，我只是将它与我使用 `try catch` 模型的经验进行比较。它是一个用于系统编程很好的语言，并且已经出现了一些优秀的工具。仅举几例，有 [Kubernetes][8]、[Docker][9]、[Terraform][10]、[Hoverfly][11] 等。还有小型、高性能、本地二进制的优点。但是，`error` 难以适应。 我希望我的推论是有道理的，而且一些方案和解决方法可能会有帮助。

--------------------------------------------------------------------------------

作者简介：

Andrew 是 OpenCredo 的顾问，于 2015 年加入公司。Andrew 在多个行业工作多年，开发基于 Web 的企业应用程序。

--------------------------------------------------------------------------------


via: https://opencredo.com/why-i-dont-like-error-handling-in-go

作者：[Andrew Morgan][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opencredo.com/author/andrew/
[1]:https://blog.golang.org/errors-are-values
[2]:https://blog.golang.org/error-handling-and-go
[3]:https://en.wikipedia.org/wiki/Don't_repeat_yourself
[4]:https://research.swtch.com/go2017
[5]:https://github.com/go-errors/errors
[6]:https://davidnix.io/post/error-handling-in-go/
[7]:https://blog.golang.org/errors-are-values
[8]:https://kubernetes.io/
[9]:https://www.docker.com/
[10]:https://www.terraform.io/
[11]:http://hoverfly.io/en/latest/
