Pony 编程语言简介
======

> Pony，一种“Rust 遇上 Erlang”的语言，让开发快捷、安全、高效、高并发的程序更简单。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keys.jpg?itok=O4qaYCHK)

在 [Wallaroo Labs][1]，我是工程副总裁，我们正在构建一个用 [Pony][3] 编程语言编写的 [高性能分布式流处理器][2]。大多数人没有听说过 Pony，但它一直是 Wallaroo 的最佳选择，它也可能成为你的下一个项目的最佳选择。

> “一门编程语言只是另一种工具。与语法无关，与表达性无关，与范式或模型无关，仅与解决难题有关。” —Sylvan Clebsch，Pony 的创建者

我是 Pony 项目的贡献者，但在这里我要谈谈为什么 Pony 对于像 Wallaroo 这样的应用是个好选择，并分享我使用 Pony 的方式。如果你对我们为什么使用 Pony 来编写 Wallaroo 甚感兴趣，我们有一篇关于它的 [博文][4]。

### Pony 是什么？

你可以把 Pony 想象成某种“Rust 遇上 Erlang”的东西。Pony 有着最引人注目的特性，它们是：

  * 类型安全
  * 存储安全
  * 异常安全
  * 无数据竞争
  * 无死锁

此外，它可以被编译为高效的本地代码，它是在开放的情况下开发的，在两句版 BSD 许可证下发布。

以上说的功能不少，但在这里我将重点关注那些对我们公司来说采用 Pony 至关重要的功能。

### 为什么使用 Pony？

使用大多数我们现有的工具编写快速、安全、高效、高并发的程序并非易事。“快速、高效、高并发”是可实现的目标，但加入“安全”之后，就困难了许多。对于 Wallaroo，我们希望同时实现四个目标，而 Pony 让实现它们更加简单。

#### 高并发

Pony 让并发变得简单。部分是通过提供一个固执的并发方式实现的。在 Pony 语言中，所有的并发都是通过 [Actor 模型][5] 进行的。

Actor 模型以在 Erlang 和 Akka 中的实现最为著名。Actor 模型出现于上世纪 70 年代，细节因实现方式而异。不变的是，所有计算都由通过异步消息进行通信的 actor 来执行。

你可以用这种方式来看待 Actor 模型：面向对象中的对象是状态 + 同步方法，而 actor 是状态 + 异步方法。

当一个 actor 收到一个消息时，它执行相应的方法。该方法可以在只有该 actor 可访问的状态下运行。Actor 模型允许我们以并发安全的方式使用可变状态。每个 actor 都是单线程的。一个 actor 中的两个方法绝不会并发运行。这意味着，在给定的 actor 中，数据更新不会引起数据竞争或通常与线程和可变状态相关的其他问题。

#### 快速高效

Pony actor 通过一个高效的工作窃取调度程序来调度。每个可用的 CPU 都有一个单独 Pony 调度程序。这种每个核心一个线程的并发模型是 Pony 尝试与 CPU 协同工作以尽可能高效运行的一部分。Pony 运行时尝试尽可能利用 CPU 缓存。代码越少干扰缓存，运行得越好。Pony 意在帮你的代码与 CPU 缓存友好相处。

Pony 的运行时还会有每个 actor 的堆，因此在垃圾收集期间，没有 “停止一切” 的垃圾收集步骤。这意味着你的程序总是至少能做一点工作。因此 Pony 程序最终具有非常一致的性能和可预测的延迟。

#### 安全

Pony 类型系统引入了一个新概念：引用能力，它使得数据安全成为类型系统的一部分。Pony 语言中每种变量的类型都包含了有关如何在 actor 之间分享数据的信息。Pony 编译器用这些信息来确认，在编译时，你的代码是无数据竞争和无死锁的。

如果这听起来有点像 Rust，那是因为本来就是这样的。Pony 的引用功能和 Rust 的借用检查器都提供数据安全性；它们只是以不同的方式来接近这个目标，并有不同的权衡。

### Pony 适合你吗？

决定是否要在一个非业余爱好的项目上使用一门新的编程语言是困难的。与其他方法想比，你必须权衡工具的适当性和不成熟度。那么，Pony 和你搭不搭呢？

如果你有一个困难的并发问题需要解决，那么 Pony 可能是一个好选择。解决并发应用问题是 Pony 之所以存在的理由。如果你能用一个单线程的 Python 脚本就完成所需操作，那你大概不需要它。如果你有一个困难的并发问题，你应该考虑 Pony 及其强大的无数据竞争、并发感知类型系统。

你将获得一个这样的编译器，它将阻止你引入许多与并发相关的错误，并在运行时为你提供出色的性能特征。

### 开始使用 Pony

如果你准备好开始使用 Pony，你需要先在 Pony 的网站上访问 [学习部分][6]。在这里你会找到安装 Pony 编译器的步骤和学习这门语言的资源。

如果你愿意为你正在使用的这个语言做出贡献，我们会在 GitHub 上为你提供一些 [初学者友好的问题][7]。

同时，我迫不及待地想在 [我们的 IRC 频道][8] 和 [Pony 邮件列表][9] 上与你交谈。

要了解更多有关 Pony 的消息，请参阅 Sean Allen 2018 年 7 月 16 日至 19 日在俄勒冈州波特兰举行的 [第 20 届 OSCON 会议][11] 上的演讲： [Pony，我如何学会停止担心并拥抱未经证实的技术][10]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/pony

作者：[Sean T Allen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[beamrolling](https://github.com/beamrolling)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seantallen
[1]:http://www.wallaroolabs.com/
[2]:https://github.com/wallaroolabs/wallaroo
[3]:https://www.ponylang.org/
[4]:https://blog.wallaroolabs.com/2017/10/why-we-used-pony-to-write-wallaroo/
[5]:https://en.wikipedia.org/wiki/Actor_model
[6]:https://www.ponylang.org/learn/
[7]:https://github.com/ponylang/ponyc/issues?q=is%3Aissue+is%3Aopen+label%3A%22complexity%3A+beginner+friendly%22
[8]:https://webchat.freenode.net/?channels=%23ponylang
[9]:https://pony.groups.io/g/user
[10]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/speaker/213590
[11]:https://conferences.oreilly.com/oscon/oscon-or
