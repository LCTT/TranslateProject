[#]: subject: "What you need to know about fuzz testing and Go"
[#]: via: "https://opensource.com/article/22/1/native-go-fuzz-testing"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14367-1.html"

你需要了解的 Go 中的模糊测试
======

> Go 团队接受了新增对模糊测试的支持的提议。

![](https://img.linux.net.cn/data/attachment/album/202203/18/103123drbhbozibvt0vtib.jpg)

[Go][2] 的应用越来越广泛。现在它是云原生软件、容器软件、命令行工具和数据库等等的首选语言。Go 很早之前就已经有了内建的 [对测试的支持][3]。这使得写测试代码和运行都相当简单。

### 什么是模糊测试？

<ruby>模糊测试<rt>fuzz testing</rt></ruby>（fuzzing）是指向你的软件输入非预期的数据。理想情况下，这种测试会让你的应用程序崩溃或有非预期的表现。抛开最终的结果，从程序对非预期的输入数据的处理结果中你可以得到很多信息，这样你就可以增加一些合适的错误处理。

任何一个软件都有对不同来源的输入或数据的接收说明，软件会对这些数据进行处理并返回适当的结果。软件开发后，测试工程师团队对其进行测试，找出软件中的错误，给出测试报告，并（由开发者）修复。通常测试的目的是验证软件的行为是否符合预期。测试又可以细分为不同的类型，如功能测试、集成测试、性能测试等等。每种测试方法关注软件功能的某一个方面，以便发现错误或者提升可靠性或性能。

模糊测试在这一测试过程上更进一步，尝试向软件程序输入一些“无效”或“随机”的数据。这种输入是故意的，期望得到的结果就是程序崩溃或输出异常，这样就可以暴露程序中的错误以便由开发者来修复它们。与其他测试类似，很少需要手动进行模糊测试，业界有大量的模糊测试工具可以将这个过程自动化。

### Go 中的软件测试

举个例子，假如你想测试 `add.go` 中的 `Add()` 函数，你可以在 `add_test.go` 中导入 `testing` 包并把测试体写在以 `TestXXX()`  开头的函数内。

考虑如下代码：

```
func Add(num1, num2 int) int {
}
```

在 `add_test.go` 文件中，你可能有如下测试代码：

```
import "testing"

func TestAdd(t *testing.T) {
}
```

运行测试：

```
$ go test
```

### 新增对模糊测试的支持

Go 团队已经接受了 [新增对模糊测试的支持的提议][4]，以进一步推动这项工作。这涉及到新增一个 `testing.F` 类型，在 `_test.go` 文件中新增 `FuzzXXX()` 函数，在 Go 工具中会新增一个 `-fuzz` 选项来执行这些测试。

在 `add_test.go` 文件中：

```
func FuzzAdd(f *testing.F) {
}
```

执行以下代码：

```
$ go test -fuzz
```

在本文编写时，这个 [功能还是试验性的][5]，但是应该会在 1.18 发布版本中包含。（LCTT 译注：[Go 1.18][14] 刚刚发布，已经包含了对模糊测试的支持）目前很多功能如 `-keepfuzzing`、`-race` 等也还没有支持。Go 团队最近发布了一篇 [模糊测试教程][6]，值得读一下。

### 安装 gotip 来获取最新的功能

如果你极度渴望在正式发布之前尝试这些功能，你可以使用 `gotip` 来测试即将正式发布的 Go 功能并反馈给他们。你可以使用下面的命令来安装 `gotip`。安装之后，你可以用 `gotip` 程序代替以前的 `go` 程序来编译和运行程序。

```
$ go install golang.org/dl/gotip@latest
$ gotip download

$ gotip version
go version devel go1.18-f009910 Thu Jan 6 16:22:21 2022 +0000 linux/amd64
```

### 社区对于模糊测试的观点

软件社区中经常会讨论模糊测试，不同的人对模糊测试有不同的看法。有些人认为这是一种有用的技术，可以找到错误，尤其是在安全方面。然而考虑到模糊测试所需要的资源（CPU、内存），有人就认为这是一种浪费，而他们更愿意用其他的测试方法。即使在 Go 团队内部，意见也不统一。我们可以看到 Go 的联合创始人 Rob Pike 对模糊测试的使用和在 Go 中的实现是持轻微的怀疑态度的。

> ..._虽然模糊测试有助于发现某类错误，但是它会占用大量的 CPU 和存储资源，并且效益成本比率也不明确。我担心为了写模糊测试浪费精力，或者 git 仓库中充斥大量无用的测试数据_
>
> ~[Rob Pike][7]

然而，Go 安全团队的另一个成员，Filo Sottile，似乎对 Go 新增支持模糊测试很乐观，举了很多例子来支持，也希望模糊测试能成为开发过程中的一部分。

> _我想说模糊测试可以发现极端情况下的错误。这是我们作为安全团队对其感兴趣的原因：在极端情况下发现的错误可以避免在生产环境中成为弱点。_
>
> _我们希望模糊测试能成为开发的一部分 —— 不只是构建或安全方面 —— 而是整个开发过程：它能提升相关代码的质量..._
>
> ~[Filo Sottile][8]

### 现实中的模糊测试

对我而言，模糊测试在发现错误以及让系统变得更安全和更有弹性方面似乎非常有效。举个例子，Linux 内核也会使用名为 [syzkaller][9] 的工具进行模糊测试，这个工具已经发现了 [大量][10] 错误。

[AFL][11] 也是比较流行的模糊测试工具，用来测试 C/C++ 写的程序。

之前也有对 Go 程序进行模糊测试的观点，其中之一就是 Filo 在 GitHub 评论中提到的 [go-fuzz][12]。

> _go-fuzz 的记录提供了相当惊人的证据，证明模糊处理能很好地找到人类没有发现的错误。根据我的经验，我们只需要消耗一点点 CPU 的时间就可以得到极端情况下非常高效的测试结果。_

### 为什么在 Go 中新增对模糊测试的原生支持

如果我们的需求是对 Go 程序进行模糊测试，之前的工具像 `go-fuzz` 就可以完成，那么为什么要在这种语言中增加原生支持呢？[Go 模糊测试设计草案][13] 中说明了这样做的一些根本原因。设计的思路是让开发过程更简单，因为前面说的工具增加了开发者的工作量，还有功能缺失。如果你没有接触过模糊测试，那么我建议你读一下设计草案文档。

> 开发者可以使用诸如 `go-fuzz` 或 `fzgo`（基于 `go-fuzz`）来解决某些需求。然而，已有的每种解决方案都需要在典型的 Go 测试上做更多的事，而且还缺少关键的功能。相比于其他的 Go 测试（如基准测试和单元测试），模糊测试不应该比它们复杂，功能也不应该比它们少。已有的解决方案增加了额外的开销，比如自定义命令行工具。

### 模糊测试工具

在大家期望 Go 语言新增功能的列表中，模糊测试是其中很受欢迎的一项。虽然现在还是试验性的，但在将要到来的发布版本中会变得更强大。这给了我们足够的时间去尝试它以及探索它的使用场景。我们不应该把它视为一种开销，如果使用得当它会是一种发现错误非常高效的测试工具。使用 Go 的团队应该推动它的使用，开发者可以写简单的模糊测试，测试团队去慢慢扩展以此来使用它全部的能力。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/native-go-fuzz-testing

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD "Person using a laptop"
[2]: https://go.dev/
[3]: https://pkg.go.dev/testing
[4]: https://github.com/golang/go/issues/44551
[5]: https://go.dev/blog/fuzz-beta
[6]: https://go.dev/doc/tutorial/fuzz
[7]: https://github.com/golang/go/issues/44551#issuecomment-784584785
[8]: https://github.com/golang/go/issues/44551#issuecomment-784655571
[9]: https://github.com/google/syzkaller
[10]: https://github.com/google/syzkaller/blob/master/docs/linux/found_bugs.md
[11]: https://github.com/google/AFL
[12]: https://github.com/dvyukov/go-fuzz
[13]: https://go.googlesource.com/proposal/+/master/design/draft-fuzzing.md
[14]: https://go.dev/blog/go1.18