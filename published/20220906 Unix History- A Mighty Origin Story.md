[#]: subject: "Unix History: A Mighty Origin Story"
[#]: via: "https://www.debugpoint.com/unix-history/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15024-1.html"

Unix 历史：一个伟大作品的诞生
======

> 关于 Unix 及其起源的简短回忆。

![The beginning][1]

### Unix 的起源

如今，几乎整个世界都运行在 Linux 之上。数以十亿计的移动电话和服务器运行在 Linux 之上。但在 Linux 之前，是 Unix，没有 Unix 就没有现在的 Linux。

Unix 的起源可以追溯到人类登陆月球的时候。在 1965 年，三个著名的机构共同开展了一个操作系统研发项目，准备开发一个能够服务多个用户，并共享数据和资源的操作系统。

![Scanned copy of actual Unix code][2]

这三个机构是著名的 <ruby>贝尔电话实验室<rt>Bell Telephone Laboratories</rt></ruby>、<ruby>通用电气公司<rt>General Electric Company</rt></ruby>（GE）以及<ruby>麻省理工学院<rt>Massachusetts Institute of Technology</rt></ruby>（MIT）。这个合作项目被称为 “Multics” —— 即“<ruby>多路传输信息和计算业务<rt>Multiplex Information and Computing Service</rt></ruby>”的缩写。

不幸的是，该项目并没有见到成功的曙光，由于系统设计复杂且没有什么成果，贝尔实验室停止了该项目。

曾参与该项目开发的贝尔实验室的 <ruby>肯·汤普森<rt>Ken Thompson</rt></ruby>，也投入到了新的工作中。在 <ruby>数字设备公司<rt>Digital Equipment Corporation</rt></ruby>（DEC）的一台古老的 PDP-7 计算机上，他重新开始设计了一个新操作系统。不久后，<ruby>丹尼斯·里奇<rt>Dennis Ritchie</rt></ruby> 也加入了，二人一起设计了分层文件系统、设备文件、命令行解释器以及进程。这就是 Unix 的诞生过程，它的名字是由 Multics 项目的另一名成员 <ruby>布莱恩·克尼汉<rt>Brian Kernighan</rt></ruby> 给命名的。（LCTT 校注：[前不久](https://linux.cn/article-14964-1.html)，80 高龄的布莱恩还为他共同创造的 AWK 添加了新的特性。）

接着在 1971 年，Unix 被移植到了稍微先进一些的 PDP-11 计算机上，它仅有 512 KB 的磁盘。当时，Unix 只支持 16 KB 内存，可以为用户程序分配 8 KB 的内存。  

然而，Unix 大多数代码是用汇编语言编写的，十分依赖于硬件。因此它并不具备移植性。

![Ken Thompson (sitting) and Dennis Ritchie at PDP-11 (credit and learn more about this image1)][3]

### C 语言的创建

如此一来，要使 Unix 具有可移植性，使之与 <ruby>机器无关<rt>machine-independent</rt></ruby>，唯一的方法是使用高级语言编写它，这样编译和相应的目标代码就可以进行机器指令的转换了。

解决该问题的伟大思想诞生于一瞬间。肯·汤普森从零开始创建了一种名为 “B” 的高级语言。然后，他做了大量的工作，将 Unix 的汇编代码转换成这种新创建的语言。然而，“B” 语言也存在一些局限性，丹尼斯·里奇在此基础上创建了著名的 “C” 语言，这使得 Unix 真正成为一个可移植的操作系统。

著名的 “C” 语言至今还在使用。

到上世纪 80 年代中期，Unix 已经变得十分成功，从微型计算机到大型机，它可以在成千上万种硬件上运行。

![The text book of C which we all read][4]

### MINIX 和 Linux 的诞生

1987 年，计算机科学教授 <ruby>安德鲁·斯图尔特·特南鲍姆<rt>Andrew S. Tanenbaum</rt></ruby> 开发了一个名为 NINIX 的类 Unix 系统，在其著作《<ruby>操作系统设计与实现<rt>Operating Systems: Design and Implementation</rt></ruby>》中用以解释操作系统的概念，并随该书一起免费分发了这个操作系统（16 位的版本）。那些学习计算机科学专业（包括我）或相关专业的人都知道，这是一本解释操作系统基础知识的“神级”教科书。

1991 年，<ruby>李纳斯·托沃兹<rt>Linus Torvalds</rt></ruby> 在赫尔辛基大学学习期间开始了一项 [爱好项目][5]。他的项目是基于 MINIX 和 GNU C 编译器的。他启动这个项目是为了能够在他的配有新款 80386 处理器的新 PC 上运行程序。他编写的整个操作系统包含了 MINIX 所缺乏的特性，最终成为了 Linux 内核。

![Famous operating systems book by Tanenbaum][6]

### BSD 和 macOS

上世纪 80 年代，当 Unix 初具规模时，贝尔实验室基于 Unix 的最初源代码（在 PDP-7 和 PDP-11 上运行的版本）开发了 BSD（<ruby>伯克利标准发行版<rt>Berkeley Standard Distribution</rt></ruby>）。BSD 是由加州大学伯克利分校的 <ruby>计算机系统研究小组<rt>Computer Systems Research Group</rt></ruby>（CSRG）分发的。在其形成之后，BSD 被许多工作站供应商（传统桌面系统），如 <ruby>昇阳微系统<rt>Sun Microsystems</rt></ruby> ，改编为专有的 Unix 变体。

该版本最终分叉创建了一些开源的变体，例如 OpenBSD、FreeBSD 等。这些自由版本为 <ruby>史蒂夫·乔布斯<rt>Steve Jobs</rt></ruby> 创立的 NeXT 创建 NeXTSTEP 开辟了道路。而 NeXTSTEP 最终成为苹果公司 macOS 的基础。

### 总结

Unix 是少数具有独到思想并致力于解决问题的人取得的非凡成就。如果考虑到在创建操作系统当时可用的计算能力和内存量，这个操作系统简直就是一件艺术品。

几十年来，所有这些一步步的进步，最终使我们走到了今天。无论有多少内核、操作系统和以编程语言形式出现的抽象概念，就其本质而言，它们都始于一个单一的来源。

我一直认为程序或代码是人类的思想，是你的逻辑、想法，只是写在 “IF-ELSE” 语句中，以实现一些现实世界的结果。

参考资料：

* [https://www.bell-labs.com/usr/dmr/www/picture.html][7]1
* [https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ][8]
* [https://en.wikipedia.org/wiki/Andrew_S._Tanenbaum][9]
* [https://en.wikipedia.org/wiki/History_of_Linux][10]
* [https://en.wikipedia.org/wiki/History_of_Unix][11]
* [https://computerhistory.org/blog/the-earliest-unix-code-an-anniversary-source-code-release/][12]

> “所有的革命，在它们发生之前，都是历史的必然。” —— 大卫·米切尔 《云图》

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/unix-history/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

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
