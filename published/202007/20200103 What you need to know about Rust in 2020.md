[#]: collector: (lujun9972)
[#]: translator: (JonnieWayy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12469-1.html)
[#]: subject: (What you need to know about Rust in 2020)
[#]: via: (https://opensource.com/article/20/1/rust-resources)
[#]: author: (Ryan Levick https://opensource.com/users/ryanlevick)

2020 年关于 Rust 你所需要知道的
======

> 尽管许多程序员长期以来一直将 Rust 用于业余爱好项目，但正如许多有关 Rust 的热门文章所解释的那样，该语言在 2019 年吸引了主要技术公司的支持。  

![](https://img.linux.net.cn/data/attachment/album/202007/31/001101fkh88966ktvvee99.jpg)

一段时间以来， [Rust][2] 在诸如 Hacker News 之类的网站上引起了程序员大量的关注。尽管许多人一直喜欢在业余爱好项目中[使用该语言][3]，但直到 2019 年它才开始在业界流行，直到那会儿情况才真正开始有所转变。

在过去的一年中，包括[微软][4]、 [Facebook][5] 和 [Intel][6] 在内的许多大公司都出来支持 Rust，许多[较小的公司][7]也注意到了这一点。2016 年，作为欧洲最大的 Rust 大会 [RustFest][8] 的第一任主持人，除了 Mozilla，我没见到任何一个人在工作中使用 Rust。三年后，似乎我在 RustFest 2019 所交流的每个人都在不同的公司的日常工作中使用 Rust，无论是作为游戏开发人员、银行的后端工程师、开发者工具的创造者或是其他的一些岗位。  

在 2019 年， Opensource.com 也通过报道 Rust 日益增长的受欢迎程度而发挥了作用。万一你错过了它们，这里是过去一年里 Opensource.com 上关于 Rust 的热门文章。  

### 《使用 rust-vmm 构建未来的虚拟化堆栈》

Amazon 的 [Firecracker][9] 是支持 AWS Lambda 和 Fargate 的虚拟化技术，它是完全使用 Rust 编写的。这项技术的作者之一 Andreea Florescu 在 《[使用 rust-vmm 构建未来的虚拟化堆栈][10]》中对 Firecracker 及其相关技术进行了深入探讨。

Firecracker 最初是 Google [CrosVM][11] 的一个分支，但是很快由于两个项目的不同需求而分化。尽管如此，在这个项目与其他用 Rust 所编写的虚拟机管理器（VMM）之间仍有许多得到了很好共享的通用片段。考虑到这一点，[rust-vmm][12] 项目起初是以一种让 Amazon 和 Google、Intel 和 Red Hat 以及其余开源社区去相互共享通用 Rust “crates” （即程序包）的方式开始的。其中包括 KVM 接口（Linux 虚拟化 API）、Virtio 设备支持以及内核加载程序。  

看到软件行业的一些巨头围绕用 Rust 编写的通用技术栈协同工作，实在是很神奇。鉴于这种和其他[使用 Rust 编写的技术堆栈][13]之间的伙伴关系，到了 2020 年，看到更多这样的情况我不会感到惊讶。

### 《为何选择 Rust 作为你的下一门编程语言》

采用一门新语言，尤其是在有着建立已久技术栈的大公司，并非易事。我很高兴写了《[为何选择 Rust 作为你的下一门编程语言][14]》，书中讲述了微软是如何在许多其他有趣的编程语言没有被考虑的情况下考虑采用 Rust 的。  

选择编程语言涉及许多不同的标准——从技术上到组织上，甚至是情感上。其中一些标准比其他的更容易衡量。比方说，了解技术变更的成本（例如适应构建系统和构建新工具链）要比理解组织或情感问题（例如高效或快乐的开发人员将如何使用这种新语言）容易得多。此外，易于衡量的标准通常与成本相关，而难以衡量的标准通常以收益为导向。这通常会导致成本在决策过程中变得越来越重要，即使这不一定就是说成本要比收益更重要——只是成本更容易衡量。这使得公司不太可能采用新的语言。  

然而，Rust 最大的好处之一是很容易衡量其编写安全且高性能系统软件的能力。鉴于微软 70% 的安全漏洞是由于内存安全问题导致的，而 Rust 正是旨在防止这些问题的，而且这些问题每年都使公司付出了几十亿美元的代价，所以很容易衡量并理解采用这门语言的好处。  

是否会在微软全面采用 Rust 尚待观察，但是仅凭着相对于现有技术具有明显且可衡量的好处这一事实，Rust 的未来一片光明。

### 2020 年的 Rust

尽管要达到 C++ 等语言的流行度还有很长的路要走。Rust 实际上已经开始在业界引起关注。我希望更多公司在 2020 年开始采用 Rust。Rust 社区现在必须着眼于欢迎开发人员和公司加入社区，同时确保将推动该语言发展到现在的一切都保留下来。

Rust 不仅仅是一个编译器和一组库，而是一群想要使系统编程变得容易、安全而且有趣的人。即将到来的这一年，对于 Rust 从业余爱好语言到软件行业所使用的主要语言之一的转型至关重要。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/rust-resources

作者：[Ryan Levick][a]
选题：[lujun9972][b]
译者：[JonnieWayy](https://github.com/JonnieWayy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ryanlevick
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: http://rust-lang.org/
[3]: https://insights.stackoverflow.com/survey/2019#technology-_-most-loved-dreaded-and-wanted-languages
[4]: https://youtu.be/o01QmYVluSw
[5]: https://youtu.be/kylqq8pEgRs
[6]: https://youtu.be/l9hM0h6IQDo
[7]: https://oxide.computer/blog/introducing-the-oxide-computer-company/
[8]: https://rustfest.eu
[9]: https://firecracker-microvm.github.io/
[10]: https://opensource.com/article/19/3/rust-virtual-machine
[11]: https://chromium.googlesource.com/chromiumos/platform/crosvm/
[12]: https://github.com/rust-vmm
[13]: https://bytecodealliance.org/
[14]: https://opensource.com/article/19/10/choose-rust-programming-language
