学习 Golang 的 4 个技巧
======
到达 Golang 大陆：一个高级开发者的日记。  
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr)

2014 年夏天...  

> IBM：“我们需要你弄清楚这个 Docker。”
> Me：“没问题。”
> IBM：“那就开始吧。”
> Me：“好的。”（内心声音）：”Docker 是用 Go 编写的。是吗？“（Googles）“哦，一门编程语言。我在我的岗位上已经学习了很多了。这不会太难。”


我的大学新生编程课是使用 VAX 汇编程序教授的。在数据结构课上，我们在图书馆计算机中心的旧电脑上使用 Pascal 加载的软盘。在一门更上一级的课程中，我有一个教授喜欢用 ADA 去展示所有的例子。我在我们的 Sun 工作站上通过各种的 UNIX 的实用源代码学到了一点 C。在 IBM，我们使用 C 和一些 x86 汇编程序来获取 OS/2 源代码，我们大量使用 C++ 的面向对象功能与 Apple 合作。不久后我学到了 shell 脚本，并开始使用 csh，但是在 90 年代中期发现 Linux 后就转到了 Bash。在 90 年代后期将其移植到 Linux 时，我正在研究 IBM 的自定义 JVM 代码中的即时（JIT）编译器，因此我开始学习 m4（可以说是宏编程器而不是编程语言）。  

快进 20 年... 我从未因为学习一门新的编程语言而焦灼。但是 [Go][1] 感觉有些不同。我打算在 GitHub 上游公开贡献，让任何有兴趣的人都可以看到！作为一个 40 多岁高级开发者的 Go 新手，我不想成为一个笑话。我们都知道程序员的骄傲是不想受伤，不论你的经验水平如何。  

我早期的调查显示，Go 似乎比某些语言更倾向于 “惯用语”。它不仅仅是编译代码; 我需要能够用 “Go 的方式” 写代码。  

现在在我的私人 Go 日志上，四年有上百个 pull requests，我不是致力于成为一个专家，但是我觉得贡献和编写代码比我在 2014 年的时候更舒服了。所以，你该怎么教一个老人新的技能或者至少一门编程语言？以下是我自己在前往 Golang 大陆的四个步骤。  

### 1. 不要跳过基础

虽然你可以通过复制代码来进行你早期的学习（还有谁有时间阅读手册！？），Go 有一个非常易读的 [语言规范][2]，它写的很清楚，即便你在语言或者编译理论方面没有硕士学位。鉴于 Go 在 **参数:类型** 的顺序做的独特决定，在使用有趣的语言功能，例如 通道和 goroutines 时，搞定这些新概念是非常重要的是事情。阅读文档 [高效 Go 编程][3]，这是 Golang 创作者的另一个重要资源，它将为你提供有效和正确使用语言的准备。

### 2. 从最好的中学习

有许多宝贵的资源可供挖掘，并将你的 Go 知识提升到下一个等级。最近在 [GopherCon][4] 上的所有谈话都可以在网上找到，就像 [GopherCon US 在 2018][5] 中的详尽列表一样。谈话的专业知识和技术水平各不相同，但是你可以通过谈话轻松地找到一些你不了解的事情。[Francesc Campoy][6] 创建了一个名叫 [JustForFunc][7] 的 Go 编程视频系列，其中有越来越多的剧集来拓宽你的 Go 知识和理解。快速搜索 “Golang" 可以为那些想要了解更多信息的人们展示许多其他视频和在线资源。   

想要看代码？在 GitHub 上许多受欢迎的云原生项目都是用 Go 写的：[Docker/Moby][8]，[Kubernetes][9]，[Istio][10]，[containerd][11]，[CoreDNS][12]，以及许多其他的。语言纯粹者可能会评价一些项目的惯用语优于其他的，但是这些都是在了解大型代码在高度活跃的项目中开始使用 Go 的大好起点。  

### 3. 使用优秀的语言工具

你将要快速了解有关 [gofmt][13] 的宝贵之处。Go 最漂亮的一个地方就在于没有关于每个项目代码格式的争论 —— **gofmt** 内置在语言的运行库中，并且根据一系列稳固、易于理解的语言规则对 Go 代码进行格式化。我不理解任何基于 Golang 不坚持使用 **gofmt** 检查 pull requests 作为持续集成一部分的项目。  

除了直接构建在 runtime/SDK 有价值的工具之外，我强烈建议使用一个对 Golang 的特性有良好支持的编辑器或者 IDE。由于我经常在命令行中进行工作，我依赖于 Vim 加上强大的 [vim-go][14] 插件。我也喜欢微软提供的 [VS Code][15]，特别是它的 [Go language][16] 插件。  

想要一个调试器？[Delve][17] 项目在不断的改进和成熟，而且是在 Go 二进制文件上进行 [gdb][18] 式调试的强有力的竞争者。  

### 4. 写一些代码

你要是不开始尝试使用 Go 写代码，你永远不知道它有什么好的地方。找一个有 “需要帮助” 问题标签的项目，然后开始贡献代码。如果你已经使用了一个用 Go 编写的开源项目，找出它是否有一些用初学者方式解决的 Bugs，然后开始你的第一个 pull request。与生活中的大多数事情一样，唯一真正的改进方法就是通过实践，所以开始吧。   

事实证明，你似乎可以教一个老高级开发者至少一门新的技能或者编程语言。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/learning-golang

作者：[Phill Estes][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[校对者ID](https://github.com/校对者ID)

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
