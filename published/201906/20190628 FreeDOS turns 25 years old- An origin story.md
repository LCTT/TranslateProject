[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11033-1.html)
[#]: subject: (FreeDOS turns 25 years old: An origin story)
[#]: via: (https://opensource.com/article/19/6/freedos-anniversary)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

25 岁的 FreeDOS：起源故事
======

> 操作系统的历史是开发人员共同造物的开源软件模型的很好例子。

![FreeDOS fish logo and command prompt on computer](https://img.linux.net.cn/data/attachment/album/201906/29/154802szbavz4a0fa8a27f.jpg)

6 月 29 日是 [FreeDOS][2] 25 周年的日子。不管对于哪个开源软件项目来说，这都是一个重要的里程碑，我为过去这 1/4 个世纪来我们在这方面所做的工作感到自豪。我也为我们如何构建 FreeDOS 感到自豪，因为它是开源软件模型如何工作的一个很好的例子。

在它的那个时代，MS-DOS 是一个功能强大的操作系统。自从我的父母用新的 IBM 机器取代了老化的 Apple II 计算机以来，我已经使用 DOS 多年了。MS-DOS 提供了一个灵活的命令行，我非常喜欢它，它可以方便地操作我的文件。多年来，我学会了如何在 C 中编写自己的实用程序，以进一步扩展其命令行功能。

大约在 1994 年，微软宣布其下一代的 Windows 将取消 MS-DOS。但我喜欢 DOS，即使我已经开始迁移到 Linux，我仍然会启动到 MS-DOS 来运行一些 Linux 尚未拥有的应用程序。

我想，如果我们想留下 DOS，我们需要自己编写一个。FreeDOS 就是这样诞生的。

1994 年 6 月 29 日，我向 Usenet 上的 comp.os.msdos.apps 新闻组发表了关于我的想法的一个小小公告：

> PD-DOS 项目公告：
> 
> 几个月前，我发布了有关启动公共域（PD）版本 DOS 的文章。当时对此的普遍支持很强烈，很多人都赞同：“开始编写吧！”所以，我…
>
> 宣布开发 PD-DOS 的首次尝试。我写了一个“清单”来描述这样的一个项目的目标和工作大纲，以及一个“任务列表”，它准确地显示了需要编码开发的内容。我会在这里发布，然后讨论。
>

虽然我宣布该项目为 PD-DOS（“公共领域”的意思，缩写是为了模仿 IBM 的“PC-DOS”），但我们很快将名称改为 Free-DOS，再后来又改为 FreeDOS。

我马上开始开发它。首先，我分享了我编写的用于扩展 DOS 命令行功能的实用程序。它们中的许多程序都重现了 MS-DOS 功能，包括 `CLS`、`DATE`、`DEL`、`FIND`、`HELP` 和 `MORE`。有些是我从 Unix 借来的新功能，比如 `TEE` 和 `TRCH`（Unix 的 `tr` 的简单实现）。我贡献了十几个 FreeDOS 工具。

通过分享我的实用程序，我给了其他开发人员一个起点。通过在 [GNU 通用公共许可证][3]（GNU GPL）下共享我的源代码，我隐含地允许其他人添加新功能并修复错误。

看到 FreeDOS 开始成型的其他开发人员联系了我并希望提供帮助。Tim Norman 是第一个人，Tim 自愿编写命令行 shell（`COMMAND.COM`，后来命名为 `FreeCOM`）。其他人贡献了复制或扩展了 DOS 命令行的实用程序。

我们尽快发布了第一个 alpha 版本。在宣布了 FreeDOS 后不到三个月，我们就有了一个集合了我们所编写的功能的 Alpha 1 发行版。当我们发布 Alpha 5 时，FreeDOS 已经拥有了 60 多个实用程序。FreeDOS 包含了 MS-DOS 中从未想过的功能，包括通过 PPP 拨号驱动程序实现的互联网连接，以及使用主 VGA 监视器和辅助单色监视器的双显示器支持。

新的开发人员加入了该项目，我们很欢迎他们。到 1998 年 10 月，感谢 Pat Villani，FreeDOS 有了一个可以工作的内核。FreeDOS 还提供了许多新功能，不仅带来了与 MS-DOS 的同等性，而且超越了 MS-DOS，包括 ANSI 支持和类似 Unix lpr 的打印后台处理程序。

你可能熟悉其他的里程碑版本。我们继续向 1.0 版本迈进，终于在 2006 年 9 月发布了 FreeDOS 1.0，在 2012 年 1 月发布了 FreeDOS 1.1，在 2016 年 12 月发布了 FreeDOS 1.2。而 MS-DOS 很久以前就停止了开发，因此我们在 1.0 发布之后不需要经常更新了。

如今，FreeDOS 已经是一个非常现代的 DOS。我们已经超越了“经典 DOS”，现在 FreeDOS 拥有许多开发工具，如编译器、汇编器和调试器。除了普通的 DOS Edit 编辑器之外，我们还有许多编辑器，包括 Fed、Pico、TDE 以及 Emacs 和 Vi 的一个版本。FreeDOS 支持网络，甚至还提供简单的图形 Web 浏览器（Dillo）。我们有大量的新工具，包括许多可以让 Linux 用户感到熟悉的实用工具。

正因为开发人员的共同创造，FreeDOS 才走到如今。本着开源软件的精神，我们通过修复错误和添加新功能为彼此的工作做出了贡献。我们将用户视为共同开发者；我们总能找到方法来吸引贡献者，无论是编写代码还是编写文档。我们基于优点达成共识。如果这听起来很熟悉，那是因为这些是开源软件的核心价值：透明度、协作、尽早发布、经常发布、精英管理和社区。这就是[开源方式][4]！

我鼓励你下载 FreeDOS 1.2 并尝试一下。

### 更多资源

  * [FreeDOS 官方网站][2]
  * [FreeDOS wiki][5]
  * [下载 FreeDOS 1.2][6]
  * [FreeDOS 的免费电子书][7]
  * [FreeDOS 的简单介绍][8]
  * [FreeDOS 起源与革命][9]
  * [4 个 FreeDOS 的有趣事实][10]
  * [如何使用 FreeDOS 升级你的系统 BIOS][11]
  * [庆祝 FreeDOS 24 岁生日：有用的命令速查表][12]
  * [如何在 Linux 中运行 DOS 程序][13]
  * [让 DOS 活到现在并通过开源来起步][14]
  * [在树莓派上运行 DOS][15]


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/freedos-anniversary

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph (FreeDOS fish logo and command prompt on computer)
[2]: https://www.freedos.org/
[3]: https://www.gnu.org/licenses/licenses.en.html
[4]: https://opensource.com/open-source-way
[5]: http://wiki.freedos.org/
[6]: https://www.freedos.org/download/
[7]: https://www.freedos.org/ebook/
[8]:https://linux.cn/article-9983-1.html
[9]: https://opensource.com/article/17/10/freedos
[10]: https://opensource.com/article/17/6/freedos-still-cool-today
[11]: https://opensource.com/article/17/6/upgrade-bios-freedos
[12]: https://opensource.com/article/18/6/freedos-commands-cheat-sheet
[13]: https://linux.cn/article-9014-1.html
[14]: https://opensource.com/life/16/9/interview-jim-hall-freedos
[15]: https://linux.cn/article-9544-1.html
