[#]: subject: "3 essential Linux cheat sheets for productivity"
[#]: via: "https://opensource.com/article/21/4/linux-cheat-sheets"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "YungeG"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13662-1.html"

3 个提高生产力的必备 Linux 速查表
======

> 下载 `sed`、`grep` 和 `parted` 的速查表来整合新的流程到你的工作中。

![](https://img.linux.net.cn/data/attachment/album/202108/09/121350vvha4adg77b77j7c.jpg)

Linux 因其命令闻名，部分原因是 Linux 执行的几乎所有操作都可以从终端调用；另一部分原因是 Linux 是一个高度模块化的操作系统，它的工具被设计用于产生十分确定的结果，在非常了解一些命令后，你可以将这些命令进行奇妙的组合，产生有用的输出。Linux 的学习过程一半是学习命令，另一半是学习如何将这些命令连成有意思的组合。

然而有这么多 Linux 命令需要学习，迈出第一步似乎令人望而生畏。应该先学习哪一个命令？有那些命令需要熟练掌握，又有哪些命令只需要浅尝辄止？认真考虑过这些问题后，我个人不相信有一个通用的答案。对所有人来说，“基本”命令很可能是相同的：

  * `ls`
  * `cd`
  * `mv`

有这些命令你就可以浏览自己的 Linux 文件系统。

但是，除了基本命令，不同行业的“默认”命令有所不同。系统管理员需要 [系统自我检查和监测][2] 的工具；艺术家需要 [媒体转换][3] 和 [图形处理][4] 工具；家庭用户可能想要 [PDF 处理][5]、[日历][6]、[文档转换][7] 工具。这份列表无穷无尽。

然而一些 Linux 命令由于极其重要能够脱颖而出 —— 或者因为这些命令是每个人不时需要的常用的底层工具，或者因为这些命令是每个人在大多数时间都会觉得有用的万能工具。

这里有三个需要添加到你的列表中的命令。

### Sed

**用途：** `sed` 是一个任何 Linux 用户都可以从学习中获益的优良通用工具。从表面上看，它只是一个基于终端的“查找和替换”，能够简单快速地纠正多个文档。`sed` 命令为我节省了打开单个文件、寻找和替换一个单词、保存文件、关闭文件所需要的数个小时（也可能是数天）时间，仅此一条命令就证明了我在学习 Linux 终端的投入是合理的。一旦充分了解 `sed`，你很有可能发现一个使生活更加轻松的潜在编辑技巧世界。

**长处：** 命令的长处在于重复。如果你只有一个要编辑的文件，很容易在传统的 [文本编辑器][8]打开并进行“查找和替换”。然而，如果要替换 5 或 50 个文件，恰当地使用 `sed` 命令（可能结合 [GNU Parallel][9] 进行加速）可以帮你节省数个小时。

**不足：** 你需要权衡直接更改期望所花的时间和构建正确的 `sed` 命令可能需要的时间。使用常见的 `sed 's/foo/bar/g'` 语法所做的简单编辑通常值得上输入这些命令所花的时间；但是利用保持空间和任何 `ed` 形式子命令的复杂 `sed` 命令可能需要高度集中的注意力和多次的试错。事实证明，使用 `sed` 进行编辑通常是更好的方式。

**秘技：** 下载我们的 [sed 速查表][10] 获取命令的单字母子命令和语法概述的快速参考。

### Grep

**用途：** `grep` 一词来源于其公认的笨拙描述：全局正则表达式打印。换言之，在文件中（或者其他形式的输入中）找到的任何匹配模式，`grep` 都会打印到终端。这使得 `grep` 成为一个强大的搜索工具，尤其擅长处理大量的文本。

你可以使用 `grep` 查找 URL：

```
$ grep --only-matching \
  http\:\/\/.* example.txt
```

你可以使用 `grep` 查找一个特定的配置项：

```
$ grep --line-number \
  foo= example.ini
2:foo=true
```

当然，你还可以将 `grep` 和其他命令组合：

```
$ grep foo= example.ini | cut -d= -f2
true
```

**长处：** `grep` 是一个简单的搜索命令，如果你阅读了上面的例子，就已经基本有所了解。为了增强灵活性，你可以使用命令的扩展正则表达式语法。

**不足：** `grep` 的问题也是它的长处：它只有搜索功能。一旦你找到想要的内容，可能会面临一个更大的问题 —— 如何处理找到的内容。有时进行的处理可能简单如重定向输出到一个文件，作为过滤后的结果列表。但是，更复杂的使用场景可能需要对结果做进一步处理，或者使用许多类似 [awk][11]、[curl][12]（凑巧的是，我们也有 [curl 速查表][13]）的命令，或者使用现代计算机上你所拥有的数千个其他选项中的任何一个命令。

**秘技：** 下载我们的 [grep 速查表][14] 获取更多命令选项和正则表达式语法的快速参考。

### Parted

**用途：** GNU `parted` 不是一个常用命令，但它是最强大的硬盘操作工具之一。关于硬盘驱动器的沮丧事实是 —— 数年来你一直忽略它们，直到需要设置一个新的硬盘时，才会想起自己对于格式化驱动器的最好方式一无所知，而此时熟悉 `parted` 会十分有用。GNU `parted` 能够创建磁盘卷标，新建、备份、恢复分区。此外，你可以通过命令获取驱动器及其布局的许多信息，并为文件系统初始化驱动器。

**长处：** 我偏爱 `parted` 而不是 `fdisk` 等类似工具的原因在于它组合了简单的交互模式和完全的非交互选项。不管你如何使用 `parted`，它的命令符合相同的语法，其编写良好的帮助菜单包含了丰富的信息。更棒的是，命令本身是 _智能_ 的 —— 给一个驱动器分区时，你可以用扇区和百分比指明分区的大小，`parted` 会尽可能计算出更精细的位置存放分区表。

**不足：** 在很长一段时间内我不清楚驱动器的工作原理，因此切换到 Linux 后，我花费了很长时间学习 GNU `parted`。GNU `parted` 和大多数终端磁盘工具假定你已经知晓什么是一个分区、驱动器由扇区组成、初始时驱动器缺少文件系统，需要磁盘卷标和分区表等等知识。硬盘驱动器的基础而不是命令本身的学习曲线十分陡峭，而 GNU `parted` 并没有做太多的努力来弥补潜在的认知差距。可以说，带你完成磁盘驱动器的基础知识学习不是命令的职责，因为有类似的 [图形应用][15]，但是一个聚焦于工作流程的选项对于 GNU `parted` 可能是一个有用的附加功能。

**秘技：** 下载我们的 [parted 速查表][16] 获取大量子命令和选项的快速参考。

### 了解更多

这是一些我最喜欢的命令列表，但是其中的命令自然取决于我如何使用自己的计算机。我编写很多命令解释器脚本，因此频繁地使用 `grep` 查找配置选项，通过 `sed` 编辑文本。我还会用到 `parted`，因为处理多媒体项目时，通常涉及很多硬盘驱动器。你可能已经开发了，或者很快就要使用最喜欢的（至少是 _频繁使用的_）命令开发自己的工作流程。

整合新的流程到日常工作时，我会创建或者下载一个速查表（就像上面的链接），然后进行练习。我们都有自己的学习方式，找出最适合你的方式，学习一个新的必需命令。你对最常使用的命令了解越多，你就越能充分地使用它们。


--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-cheat-sheets

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[YungeG](https://github.com/YungeG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC "Hand putting a Linux file folder into a drawer"
[2]: https://opensource.com/life/16/2/open-source-tools-system-monitoring
[3]: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[4]: https://opensource.com/article/17/8/imagemagick
[5]: https://opensource.com/article/20/8/reduce-pdf
[6]: https://opensource.com/article/19/4/calendar-git
[7]: https://opensource.com/article/20/5/pandoc-cheat-sheet
[8]: https://opensource.com/article/21/2/open-source-text-editors
[9]: https://opensource.com/article/18/5/gnu-parallel
[10]: https://opensource.com/downloads/sed-cheat-sheet
[11]: https://opensource.com/article/20/9/awk-ebook
[12]: https://www.redhat.com/sysadmin/social-media-curl
[13]: https://opensource.com/article/20/5/curl-cheat-sheet
[14]: https://opensource.com/downloads/grep-cheat-sheet
[15]: https://opensource.com/article/18/11/partition-format-drive-linux#gui
[16]: https://opensource.com/downloads/parted-cheat-sheet
