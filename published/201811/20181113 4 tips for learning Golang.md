学习 Golang 的 4 个技巧
======

> 到达 Golang 大陆：一位资深开发者之旅。  

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr)

2014 年夏天……

> IBM：“我们需要你弄清楚这个 Docker。”

> 我：“没问题。”

> IBM：“那就开始吧。”

> 我：“好的。”（内心声音）：”Docker 是用 Go 编写的。是吗？“（Google 一下）“哦，一门编程语言。我在我的岗位上已经学习了很多了。这不会太难。”

我的大学新生编程课是使用 VAX 汇编程序教授的。在数据结构课上，我们使用 Pascal —— 在图书馆计算机中心的旧电脑上使用软盘加载。在一门更高一级的课程中，我的教授教授喜欢用 ADA 去展示所有的例子。在我们的 Sun 工作站上，我通过各种 UNIX 的实用源代码学到了一点 C。在 IBM，OS/2 源代码中我们使用了 C 和一些 x86 汇编程序；在一个与 Apple 合作的项目中我们大量使用 C++ 的面向对象功能。不久后我学到了 shell 脚本，开始是 csh，但是在 90 年代中期发现 Linux 后就转到了 Bash。在 90 年代后期，我在将 IBM 的定制的 JVM 代码中的即时（JIT）编译器移植到 Linux 时，我不得不开始学习 m4（与其说是编程语言，不如说是一种宏处理器）。  

一晃 20 年……我从未因为学习一门新的编程语言而焦灼。但是 [Go][1] 让我感觉有些不同。我打算公开贡献，上传到 GitHub，让任何有兴趣的人都可以看到！作为一个 40 多岁的资深开发者的 Go 新手，我不想成为一个笑话。我们都知道程序员的骄傲，不想丢人，不论你的经验水平如何。

我早期的调研显示，Go 似乎比某些语言更 “地道”。它不仅仅是让代码可以编译；也需要让代码可以 “Go Go Go”。

现在，我的个人的 Go 之旅四年间有了几百个拉取请求（PR），我不是致力于成为一个专家，但是现在我觉得贡献和编写代码比我在 2014 年的时候更舒服了。所以，你该怎么教一个老人新的技能或者一门编程语言呢？以下是我自己在前往 Golang 大陆之旅的四个步骤。  

### 1、不要跳过基础

虽然你可以通过复制代码来进行你早期的学习（谁还有时间阅读手册！？），Go 有一个非常易读的 [语言规范][2]，它写的很易于理解，即便你在语言或者编译理论方面没有取得硕士学位。鉴于 Go 的 **参数：类型** 顺序的特有习惯，以及一些有趣的语言功能，例如通道和 go 协程，搞定这些新概念是非常重要的是事情。阅读这个附属的文档 [高效 Go 编程][3]，这是 Golang 创造者提供的另一个重要资源，它将为你提供有效和正确使用语言的准备。

### 2、从最好的中学习

有许多宝贵的资源可供挖掘，可以将你的 Go 知识提升到下一个等级。最近在 [GopherCon][4] 上的所有讲演都可以在网上找到，如这个 [GopherCon US 2018][5] 的详尽列表。这些讲演的专业知识和技术水平各不相同，但是你可以通过它们轻松地找到一些你所不了解的事情。[Francesc Campoy][6] 创建了一个名叫 [JustForFunc][7] 的 Go 编程视频系列，其不断增多的剧集可以用来拓宽你的 Go 知识和理解。直接搜索 “Golang" 可以为那些想要了解更多信息的人们展示许多其它视频和在线资源。   

想要看代码？在 GitHub 上许多受欢迎的云原生项目都是用 Go 写的：[Docker/Moby][8]、[Kubernetes][9]、[Istio][10]、[containerd][11]、[CoreDNS][12]，以及许多其它的。语言纯粹主义者可能会认为一些项目比另外一些更地道，但这些都是很好的起点，可以看到在高度活跃的项目的大型代码库中使用 Go 的程度。 

### 3、使用优秀的语言工具

你会很快了解到 [gofmt][13] 的宝贵之处。Go 最漂亮的一个地方就在于没有关于每个项目代码格式的争论 —— **gofmt** 内置在语言的运行环境中，并且根据一系列可靠的、易于理解的语言规则对 Go 代码进行格式化。我不知道有哪个基于 Golang 的项目会在持续集成中不坚持使用 **gofmt** 检查拉取请求。

除了直接构建于运行环境和 SDK 中的一系列有价值的工具之外，我强烈建议使用一个对 Golang 的特性有良好支持的编辑器或者 IDE。由于我经常在命令行中进行工作，我依赖于 Vim 加上强大的 [vim-go][14] 插件。我也喜欢微软提供的 [VS Code][15]，特别是它的 [Go 语言][16] 插件。

想要一个调试器？[Delve][17] 项目在不断的改进和成熟，它是在 Go 二进制文件上进行 [gdb][18] 式调试的强有力的竞争者。  

### 4、写一些代码

你要是不开始尝试使用 Go 写代码，你永远不知道它有什么好的地方。找一个有 “需要帮助” 问题标签的项目，然后开始贡献代码。如果你已经使用了一个用 Go 编写的开源项目，找出它是否有一些可以用初学者方式解决的 Bug，然后开始你的第一个拉取请求。与生活中的大多数事情一样，实践出真知，所以开始吧。   

事实证明，你可以教会一个资深的老开发者一门新的技能甚至编程语言。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/learning-golang

作者：[Phill Estes][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/estesp
[b]: https://github.com/lujun9972
[1]: https://golang.org/
[2]: https://golang.org/ref/spec
[3]: https://golang.org/doc/effective_go.html
[4]: https://www.gophercon.com/
[5]: https://tqdev.com/2018-gophercon-2018-videos-online
[6]: https://twitter.com/francesc
[7]: https://www.youtube.com/channel/UC_BzFbxG2za3bp5NRRRXJSw
[8]: https://github.com/moby/moby
[9]: https://github.com/kubernetes/kubernetes
[10]: https://github.com/istio/istio
[11]: https://github.com/containerd/containerd
[12]: https://github.com/coredns/coredns
[13]: https://blog.golang.org/go-fmt-your-code
[14]: https://github.com/fatih/vim-go
[15]: https://code.visualstudio.com/
[16]: https://code.visualstudio.com/docs/languages/go
[17]: https://github.com/derekparker/delve
[18]: https://www.gnu.org/software/gdb/
