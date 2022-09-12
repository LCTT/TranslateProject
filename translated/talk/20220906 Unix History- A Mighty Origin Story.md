[#]: subject: "Unix History: A Mighty Origin Story"
[#]: via: "https://www.debugpoint.com/unix-history/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Unix 历史：一个伟大作品的诞生
======
关于 Unix 及其起源的简短回忆。

![The beginning][1]

### Unix 的起源

现在，几乎整个互联网世界都运行在 Linux 之上。数十万的移动电话和服务器运行在 Linux 之上。但在 Linux 之前，是 Unix，没有 Unix 就没有现在的 Linux。

Unix 的起源可以追溯到人类登陆月球的时候。在 1965 年，三个著名的机构共同开展操作系统的研发工作，准备开发一个能够服务多个用户，并共享数据和资源的商业操作系统。

![Scanned copy of actual Unix code][2]

这三个机构是著名的贝尔电话实验室、通用电气公司以及麻省理工学院。该项目称为 "Multics" —— “多路传输信息和计算业务”(Multiplex Information and Computing Service)的缩写。

但是该项目并没有取得太大的成功。不幸的是，由于系统设计复杂且产出甚微，贝尔实验室退出了该项目。

贝尔实验室的肯·汤普森（Ken Thompson）也参与了该项目。在数字设备公司的一台古老的 PDP-7 的机器上，他重新开始一个新操作系统的设计。不久后，丹尼斯·里奇 (Dennis Ritchie) 加入了，二人一起设计了分层文件系统、设备文件、命令行解释器以及进程。这就是 Unix 的诞生过程，由 Multics 项目的另一名成员布莱恩·威尔森·克尼汉 (Brian Kernighan) 命名。

在 1971 年，Unix 被移植到了较为先进的 PDP-11 电脑上，该电脑的磁盘仅有 512 KB。当时，Unix 为用户程序提供 16 KB 和 8 KB 大小的内存分配空间。  

然而，Unix 大多数代码为汇编语言，十分依赖于硬件。因此它的移植性较差。

![Ken Thompson (sitting) and Dennis Ritchie at PDP-11 (credit and learn more about this image1)][3]

### C 语言的诞生

如此一来，唯一提高 Unix 的移植性以及机器无关 (machine-independent) 的方法是，使用高级语言编写它，这样编译和相应的目标代码可以专注于机器指令的转换。

解决该问题的伟大思想诞生于一瞬间。肯·汤普森（Ken Thompson）从零开始创建了一种高级语言，称为 "B"。然而 "B" 语言有其局限性，丹尼斯·里奇 (Dennis Ritchie) 在此基础上创建了著名的 “C 语言”，这使 Unix 真正成为一个可移植的操作系统。

著名的 “C 语言” 至今还在使用。

到上世纪 80 年代中期，Unix 变得十分成功，以至于它可以在数千种硬件上运行，从微型计算机到具有各种硬件的大型机。

![The text book of C which we all read][4]

### MINIX 和 Linux 的诞生

1987 年，计算机科学教授安德鲁·斯图尔特·特南鲍姆 （Andrew S. Tanenbaum) 开发了名为 NINIX 的类 Unix 系统，在其著作《操作系统设计与实现》中用以解释操作系统理念，并且源码在该书的附录中作为示例。任何学习计算机科学专业（包括我）或相关专业的人都知道，这是解释操作系统基础知识的“神级”教科书。

1991 年，李纳斯·托沃兹 (Linus Torvalds) 在赫尔辛基大学学习期间开展了一项 [爱好项目][5]。他的工作基于 MINIX 和 GNU C 编译器。为了能够在配有新款 80386 处理器的 PC 上运行程序，他开展了该项目。然而，他用 MINIX 所缺乏的特性编写了整个操作系统，最终成为了 Linux 内核。

![Famous operating systems book by Tanenbaum][6]

### BSD 和 macOS

上世纪 80 年代，当 Unix 初具规模时，贝尔实验室基于 Unix 的最初源代码（在 PDP-7 和 PDP-11 上运行的版本）开发了 BSD（伯克利标准发行版）。BSD 由加州大学伯克利分校的计算机系统研究小组 (CSRG) 分发。在其形成之后，BSD 已被许多工作站供应商（Legacy 桌面）如 Sun Microsystems ，改编为专有的 Unix 变体。

该版本最终分叉以创建开源变体，例如 OpenBSD、FreeBSD 等。这些免费版本为由史蒂夫·乔布斯 (Steve Jobs) 创立的 NeXT 创建 NeXTSTEP 开辟了道路。NeXTSTEP 最终成为苹果公司 macOS 的基础。

### 总结

Unix 是少数具有独到想法并致力于解决问题的人取得的非凡成就。如果考虑到在创建操作系统时可用的计算能力和内存量，该操作系统就是一件艺术品。

几十年来，所有这些小的进步，最终使我们走到了今天。无论有多少内核、操作系统和以编程语言形式出现的抽象，其核心从来只有一个。

我一直认为程序/代码是人类的想法。 这是你的逻辑，想法只是写在 "IF-ELSE" 语句中，以实现一些现实世界的结果。

参考：

* [https://www.bell-labs.com/usr/dmr/www/picture.html][7]1
* [https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ][8]
* [https://en.wikipedia.org/wiki/Andrew_S._Tanenbaum][9]
* [https://en.wikipedia.org/wiki/History_of_Linux][10]
* [https://en.wikipedia.org/wiki/History_of_Unix][11]
* [https://computerhistory.org/blog/the-earliest-unix-code-an-anniversary-source-code-release/][12]

*“所有的革命，在它们发生之前，都是历史的必然。” —— 大卫·米切尔 《云图》*

![Join our Telegram channel and stay informed on the move.][13]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/unix-history/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/09/The-beginning-1024x576.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/Scanned-copy-of-actual-Unix-code-1024x646.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/Ken-Thompson-sitting-and-Dennis-Ritchie-at-PDP-11.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/The-text-book-of-C-which-we-all-read.jpg
[5]: https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ
[6]: https://www.debugpoint.com/wp-content/uploads/2022/09/Famous-operating-systems-book-by-Tanenbaum.jpg
[7]: https://www.bell-labs.com/usr/dmr/www/picture.html
[8]: https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ
[9]: https://en.wikipedia.org/wiki/Andrew_S._Tanenbaum
[10]: https://en.wikipedia.org/wiki/History_of_Linux
[11]: https://en.wikipedia.org/wiki/History_of_Unix
[12]: https://computerhistory.org/blog/the-earliest-unix-code-an-anniversary-source-code-release/
[13]: https://t.me/debugpoint
