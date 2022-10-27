[#]: subject: (A brief history of FreeDOS)
[#]: via: (https://opensource.com/article/21/6/history-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (zxy-wyx)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13601-1.html)

FreeDOS 简史
======

> 经历了近 30 年的发展, FreeDOS 已经成为了世界先进的 DOS。

![](https://img.linux.net.cn/data/attachment/album/202107/21/104903zzxiyc4i4gkpxiph.jpg)

> 一个大师正在给他的一个弟子讲 [编程之道][2]。 “编程之道包含在所有的软件中 —— 不管它多么微不足道，” 大师说道。
> 
> “编程之道在手持计算器里面吗？” 弟子问道。
>
> “是的，” 大师回答道。
>
> “编程之道在电子游戏里面吗？” 弟子继续问道。
>
> “即便是电子游戏中，” 大师说。 
>
> “那编程之道在个人电脑的 DOS 里面吗？”
> 
> 大师咳嗽了一下，稍稍改变了一下姿势，说道，“今天的课就到这里吧。” 
>
> ——《编程之道》，Geoffrey James，InfoBooks，1987

过去，计算仅限于昂贵的大型机和“大铁疙瘩”计算机系统，如 PDP 11。但是微处理器的出现在 20 世纪 70 年代带来了一场计算革命。你终于可以在家里有一台电脑了——“个人电脑”时代已经到了！

我记得看到的最早的个人电脑包括 Commodore、TRS-80 和 Apple。个人电脑成了一个热门话题，所以 IBM 决定进入这个市场。在经历了一个快速开发周期之后，IBM 于 1981 年 8 月发布了 IBM 5150 个人电脑（最初的“IBM PC”）。

从零开始创建一台计算机并非易事，因此 IBM 以用“现成”的硬件来构建 PC 而闻名，并从外部开发商那里获得了其他组件的授权。其中之一是微软授权的操作系统。反过来，微软从西雅图计算机产品公司获得了 86-DOS ，进行了各种更新，并将新版本作为 IBM PC-DOS 与 IBM PC 一起首次亮相。

### 早期的 DOS

运行在最多只有 640 千字节内存中的 DOS，除了管理硬件和允许用户启动应用程序之外，真的做不了什么。因此，PC-DOS 1.0 命令行非常贫乏，只包含了一些设置日期和时间、管理文件、控制终端和格式化软盘的命令。DOS 还包括一个 BASIC 语言解释器，这是那个时代所有个人计算机的一个标准功能。

直到 PC-DOS 2.0，DOS 才变得更加有趣，为命令行添加了新的命令，并包含了其他有用的工具。但对我来说，直到 1991 年的 MS-DOS 5.0 才有了“现代感”。微软在这个版本中对 DOS 进行了大修，更新了许多命令，并用一个新的全屏编辑器取代了老旧的 Edlin 编辑器，使之更方便用户使用。DOS 5 还包括我喜欢的其他特性，比如基于微软 QuickBASIC 编译器的新 BASIC 解释器，简称 QBASIC. 如果你曾经在 DOS 上玩过 Gorillas 游戏，那可能就是在 MS-DOS 5.0 中运行的。

尽管进行了这些升级，但我对 DOS 命令行并不完全满意。DOS 从来没有偏离原来的设计，有其局限性。DOS 为用户提供了一些工具，可以从命令行执行一些事情 —— 否则，你就得使用 DOS 命令行来启动应用程序。微软认为用户大部分时间都会花在几个关键的应用程序上，比如文字处理器或电子表格。

但是开发人员想要一个功能更强的 DOS，此时一个细分行业正在萌芽，以提供小巧优雅的工具和程序。有些是全屏应用程序，但也有许多是增强 DOS 命令环境的命令行实用程序。当我学会一点 C 语言编程时，我开始编写自己的实用程序，扩展或替换 DOS 命令行。尽管 MS-DOS 的基础相当有限，但我发现第三方实用程序加上我自己的工具创建了一个功能强大的 DOS 命令行。

### FreeDOS

1994 年初，我开始在科技杂志上看到很多对微软高管的采访，他们说下一个版本的 Windows 将完全取代 DOS。我以前使用过 Windows，但如果你还记得那个时代，你就知道 Windows 3.1 并不是一个很好的平台。Windows 3.1 很笨重，有很多毛病，如果一个应用程序崩溃，它可能会使整个 Windows 系统瘫痪。我也不喜欢 Windows 的图形用户界面。我更喜欢在命令行做我的工作，而不是用鼠标。

我考虑过 Windows，并决定，“如果 Windows 3.2 或 Windows 4.0 会像 Windows 3.1 一样，我就不会去使用它。” 但我有什么选择？此时，我已经尝试过 Linux，并认为 [Linux 很棒][3]，但是 Linux 没有任何应用程序。我的文字处理器、电子表格和其他程序都在 DOS 上。我需要 DOS。

然后我有了个主意！我想，“如果开发人员能够在互联网上共同编写一个完整的 Unix 操作系统，那么我们当然可以对 DOS 做同样的事情。”毕竟，与 Unix 相比，DOS 是一个相当简单的操作系统。DOS 一次运行一个任务（单任务），并且有一个更简单的内存模型。编写我们自己的 DOS 应该不难。

因此，在 1994 年 6 月 29 日，我在一个名为 Usenet 的留言板网络上向 “comp.os.msdos.apps” [发布了一个公告][4]：

> PD-DOS 项目公告：
>
> 几个月前，我发表了关于启动公共领域版本的 DOS 的文章。 当时大家对此的普遍支持，许多人都同意这样的说法：“开始编写吧！”所以，我就……
>
> 宣布首次生产 PD-DOS 的努力。我已经写了一个“清单”，描述了这样一个项目的目标和工作大纲，以及一个“任务列表”，它准确地显示了需要编写什么。我会把这些贴在这里，供大家讨论。

\* 关于这个名字的说明 —— 我希望这个新的 DOS 成为每个人都可以使用的东西，我天真地认为，当每个人都可以使用它时，它就是“公共领域”。我很快就意识到了这种差别，所以我们把 “PD-DOS” 改名为 “Free-DOS”，然后去掉连字符变成 “FreeDOS”。

一些开发人员联系我，提供他们为替换或增强 DOS 命令行而创建的实用程序，类似于我自己的努力。就在项目宣布几个月后，我们汇集了我们的实用程序，并创建了一个实用的系统，我们在 1994 年 9 月发布了一个 “Alpha 1” 版本。在那些日子里，发展是相当迅速的，我们在 1994 年 12 月发布了 “Alpha 2”，1995 年 1 月发布了 “Alpha 3”，1995 年 6 月发布了“Alpha 4”。

### 一个现代的 DOS

从那以后，我们一直致力于使 FreeDOS 成为 “现代” DOS。而这种现代化大部分都集中在创建一个丰富的命令行环境上。是的，DOS 仍然需要支持应用程序，但是我们相信 FreeDOS 也需要一个强大的命令行环境。这就是为什么 FreeDOS 包含了许多有用的工具，包括浏览目录、管理文件、播放音乐、连接网络的命令，……以及类似 Unix 的实用程序集合，如 `less`、`du`、`head`、`tail`、`sed` 和 `tr`。 

虽然 FreeDOS 的开发已经放缓，但它并没有停止。开发人员继续为 FreeDOS 编写新程序，并向 FreeDOS 添加新功能。我对 FreeDOS 1.3 RC4 的几个重要补充感到特别兴奋，FreeDOS 1.3 RC4 是即将发布的 FreeDOS 1.3 的最新候选版本。最近的一些更新如下：

  * Mateusz Viste 创建了一个新的电子书阅读器，名为 Ancient Machine Book（AMB），我们利用它作为 FreeDOS 1.3 RC4 中的新帮助系统。
  * Rask Ingemann Lambertsen、Andrew Jenner、TK Chia 和其他人正在更新 GCC 的 IA-16 版本，包括一个新的libi86 库，它提供了与 Borland TurboC++ 编译器的 C 库的某种程度的兼容性。
  * Jason Hood 更新了一个可卸载的 CD-ROM 重定向器，以替代微软的 MSCDEX，最多支持 10 个驱动器。
  * SuperIlu 创建了 DOjS，这是一个 Javascript 开发画布，具有集成的编辑器、图形和声音输出，以及鼠标、键盘和操纵杆输入。 
  * Japheth 创建了一个 DOS32PAE 扩展程序，它能够通过 PAE 分页使用大量的内存。

尽管 FreeDOS 有了新的发展，我们仍然忠于我们的 DOS 根基。在我们继续朝着 FreeDOS 1.3 “最终”版本努力时，我们带着几个核心假设，包括：

  * **兼容性是关键** —— 如果 FreeDOS 不能运行经典 DOS 应用程序，它就不是真正的 “DOS”。虽然我们提供了许多优秀的开源工具、应用程序和游戏，但你也可以运行你的传统的 DOS 应用程序。
  * **继续在旧 PC 上运行（XT、286、386 等）** —— FreeDOS 1.3 将保持 16 位英特尔架构，但在可能的情况下将支持扩展驱动程序支持的新硬件。为此，我们继续专注于单用户命令行环境。
  * **FreeDOS 是开源软件** —— 我一直说，如果人们不能访问、学习和修改源代码，FreeDOS 就不是“自由的 DOS”。FreeDOS 1.3 将包括尽可能多地包括使用公认的开源许可证的软件。但 DOS 实际上早于 GNU 通用公共许可证（1989）和开放源码定义（1998），因此一些 DOS 软件可能会使用它自己的“免费源代码”许可证，而不是标准的“开源”许可。当我们考虑将软件包纳入 FreeDOS 时，我们将继续评估任何许可证，以确保它们是合适的“开放源码”，即使它们没有得到正式承认。

我们欢迎你的帮助，使 FreeDOS 强大！请加入我们的电子邮件列表，我们欢迎所有新来者和贡献者。我们通过电子邮件列表进行交流，不过这个列表的信件量非常小，所以不太可能撑爆你的收件箱。

访问 FreeDOS 网站 [www.freedos.org][5]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/history-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[zxy-wyx](https://github.com/zxy-wyx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://www.mit.edu/~xela/tao.html
[3]: https://opensource.com/article/17/5/how-i-got-started-linux-jim-hall-freedos
[4]: https://groups.google.com/g/comp.os.msdos.apps/c/oQmT4ETcSzU/m/O1HR8PE2u-EJ
[5]: https://www.freedos.org/
