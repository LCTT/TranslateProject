[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12609-1.html)
[#]: subject: (Linux Jargon Buster: What is a Linux Distribution? Why is it Called a ‘Distribution’?)
[#]: via: (https://itsfoss.com/what-is-linux-distribution/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 黑话解释：什么是 Linux 发行版？为什么它被称为“发行版”？
======

> 在这一章的 Linux 黑话解释中，我们来讨论一些基本的东西。

![][8]

让我们来讨论一下什么是 Linux 发行版，为什么它被称为<ruby>发行版<rt>distribution</rt></ruby>（或简称 distro），以及，它与 Linux 内核有什么不同。你还会了解到为什么有些人坚称 Linux 为 GNU/Linux。

### 什么是 Linux 发行版？

Linux 发行版是一个由 Linux 内核、[GNU 工具][1]、附加软件和软件包管理器组成的操作系统，它也可能包括[显示服务器][9]和[桌面环境][2]，以用作常规的桌面操作系统。

这个术语之所以是 “Linux 发行版”，是因为像 Debian、Ubuntu 这样的机构“发行”了 Linux 内核以及所有必要的软件及实用程序（如网络管理器、软件包管理器、桌面环境等），使其可以作为一个操作系统使用。

你的发行版还负责提供更新来维护其内核和其他实用程序。

所以，“Linux” 是内核，而 “Linux 发行版”是操作系统。这就是为什么它们有时也被称为基于 Linux 的操作系统的原因。

如果不是很理解以上所有的内容，不要担心。下面我将详细解释一下。

### “Linux 只是一个内核，不是一个操作系统。”这是什么意思？

你可能看到到过这句话，这说的没错。内核是一个操作系统的核心，它接近于具体硬件。你使用应用程序和 shell 与它交互。

![Linux 内核结构][3]

为了理解这一点，我就用我在《[什么是 Linux 的详细指南][4]》中曾用过的那个比喻。把操作系统看成车辆，把内核看成引擎。你不能直接驱动引擎。同样，你也不能直接使用内核。

![操作系统类比][5]

一个 Linux 发行版可以看作是一个汽车制造商（比如丰田或福特）为你提供的现成的汽车，就像 Ubuntu 或 Fedora 发行版的发行商为你提供的一个基于 Linux 的现成操作系统一样。

### 什么是 GNU/Linux？

让我们再来看看这张图片。1991 年的时候，[Linus Torvalds][6] 创造的只是其中的最内圈，即 Linux 内核。

![Linux 内核结构][3]

要使用 Linux，即使是以最原始的形式，甚至没有 GUI，你也需要一个 shell。最常见的是 Bash shell。

然后，你需要在 shell 中运行一些命令来完成一些工作。你能记起一些基本的 Linux 命令吗？比如 `cat`、`cp`、`mv`、`grep`、`find`、`diff`、`gzip` 等等。

严格来说，这些所谓的“Linux 命令”并不是只属于 Linux。它们中的很多都来源于 UNIX 操作系统。

在 Linux 诞生之前，Richard Stallman 就已经在 1983 年创建了<ruby>自由软件项目<rt>free software project</rt></ruby>中的第一个项目：GNU（GNU 是“GNU is Not Unix” 的递归缩写）。[GNU 项目][7]实现了许多流行的 Unix 实用程序，如 `cat`、`grep`、`awk`、shell（`bash`），同时还开发了自己的编译器（GCC）和编辑器（Emacs）。

在 80 年代，UNIX 是专有软件，而且超级昂贵。这就是为什么 Linus Torvalds 开发了一个类似 UNIX 的新内核的原因。为了与 Linux 内核进行交互，Linus Torvalds 使用了 GNU 工具，这些工具在其 GPL 开源许可证下是免费的。

有了这些 GNU 工具，它的行为也像 UNIX 一样。这就是为什么 Linux 也被称为类 UNIX 操作系统的原因。

你无法想象没有 shell 和所有这些命令的 Linux。由于 Linux 与 GNU 工具集成得很深，几乎是完全依赖于 GNU 工具，所以纯粹主义者要求 GNU 应该得到应有的认可，这就是为什么他们坚称它为 GNU Linux（写成 GNU/Linux）。

### 总结

那么，该用哪个术语？Linux、GNU/Linux、Linux 发行版，基于 Linux 的操作系统还是类 UNIX 操作系统？这取决于你的上下文。我已经为你提供了足够的细节，让你对这些相关的术语有更好的理解。

我希望你喜欢这个 Linux 黑话解释系列，并能学习到新的东西。欢迎你的反馈和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-linux-distribution/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/manual/blurbs.html
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Linux_Kernel_structure.png?resize=800%2C350&ssl=1
[4]: https://itsfoss.com/what-is-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/operating_system_analogy.png?resize=800%2C350&ssl=1
[6]: https://itsfoss.com/linus-torvalds-facts/
[7]: https://www.gnu.org/gnu/thegnuproject.en.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/what-is-linux-distribution.png?resize=800%2C450&ssl=1
[9]: https://linux.cn/article-12589-1.html