Linux下如何过滤、分割以及合并 pcap 文件
=============

如果你是一个测试[入侵侦测系统][1]或一些网络访问控制策略的网络管理员，那么你经常需要抓取数据包并在离线状态下分析这些文件。当需要保存捕获的数据包时，我们一般会存储为 libpcap 的数据包格式 pcap，这是一种被许多开源的嗅探工具以及捕包程序广泛使用的格式。如果 pcap 文件被用于入侵测试或离线分析的话，那么在将他们[注入][2]网络之前通常要先对 pcap 文件进行一些操作。

![](https://farm8.staticflickr.com/7570/15425147404_a69f416673_c.jpg)

在这篇文章中，我将介绍一些操作 pcap 文件的工具，以及如何使用它们 。

### Editcap 与 Mergecap###

Wireshark，是最受欢迎的 GUI 嗅探工具，实际上它带了一套非常有用的命令行工具集。其中包括 editcap 与 mergecap。editcap 是一个万能的 pcap 编辑器，它可以过滤并且能以多种方式来分割 pcap 文件。mergecap 可以将多个 pcap 文件合并为一个。 这篇文章就是基于这些 Wireshark 命令行工具的。

如果你已经安装过 Wireshark 了，那么这些工具已经在你的系统中了。如果还没装的话，那么我们接下来就安装 Wireshark 命令行工具。 需要注意的是，在基于 Debian 的发行版上我们可以不用安装 Wireshark GUI 而仅安装命令行工具，但是在 Red Hat 及 基于它的发行版中则需要安装整个 Wireshark 包。

**Debian, Ubuntu 或 Linux Mint**

	$ sudo apt-get install wireshark-common

**Fedora, CentOS 或 RHEL**

	$ sudo yum install wireshark

当安装好工具后， 就可以开始使用 editca 与 mergecap 了。

### pcap 文件过滤###

通过 editcap， 我们能以很多不同的规则来过滤 pcap 文件中的内容，并且将过滤结果保存到新文件中。

首先，以“起止时间”来过滤 pcap 文件。 " - A  < start-time >  和 " - B  < end-time >  选项可以过滤出在这个时间段到达的数据包（如，从 2:30 ～ 2:35）。时间的格式为 “ YYYY-MM-DD HH:MM:SS"。

	$ editcap -A '2014-12-10 10:11:01' -B '2014-12-10 10:21:01' input.pcap output.pcap 

也可以从某个文件中提取指定的 N 个包。下面的命令行从 input.pcap 文件中提取100个包（从 401 到 500）并将它们保存到 output.pcap 中：

    $ editcap input.pcap output.pcap 401-500

使用 "-D < dup-window >" （dup-window可以看成是对比的窗口大小，仅与此范围内的包进行对比）选项可以提取出重复包。每个包都依次与它之前的 < dup-window > -1 个包对比长度与MD5值，如果有匹配的则丢弃。

    $ editcap -D 10 input.pcap output.pcap

> 遍历了 37568 个包, 在 10 窗口内重复的包仅有一个，并丢弃。

也可以将 < dup-window > 定义成时间间隔。使用"-w < dup-time-window >"选项，对比< dup-time-window > 时间内到达的包。

    $ editcap -w 0.5 input.pcap output.pcap 

> 检索了 50000 个包, 以0.5s作为重复窗口，未找到重复包。

###分割 pcap 文件###

当需要将一个大的 pcap 文件分割成多个小文件时，editcap 也能起很大的作用。

将一个 pcap 文件分割成数据包数目相同的多个文件

    $ editcap -c <packets-per-file> <input-pcap-file> <output-prefix> 

输出的每个文件有相同的包数量，以 < output-prefix >-NNNN的形式命名。

以时间间隔分割 pcap 文件

    $ editcap -i <seconds-per-file> <input-pcap-file> <output-prefix> 

###合并 pcap 文件###

如果想要将多个文件合并成一个，用 mergecap 就很方便。

当合并多个文件时，mergecap 默认将内部的数据包以时间先后来排序。

    $ mergecap -w output.pcap input.pcap input2.pcap [input3.pcap . . .]

如果要忽略时间戳，仅仅想以命令行中的顺序来合并文件，那么使用 -a 选项即可。

例如，下列命令会将 input.pcap 文件的内容写入到 output.pcap, 并且将 input2.pcap 的内容追加在后面。

    $ mergecap -a -w output.pcap input.pcap input2.pcap 

###总结###

在这篇指导中，我演示了多个 editcap、 mergecap 操作 pcap 文件的例子。除此之外，还有其它的相关工具，如 [reordercap][3]用于将数据包重新排序，[text2pcap][4] 用于将 pcap 文件转换为文本格式， [pcap-diff][5]用于比较 pcap 文件的异同，等等。当进行网络入侵测试及解决网络问题时，这些工具与[包注入工具][6]非常实用，所以最好了解他们。

你是否使用过 pcap 工具？ 如果用过的话，你用它来做过什么呢？

--------------------------------------------------------------------------------

via: http://xmodulo.com/filter-split-merge-pcap-linux.html

作者：[Dan Nanni][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-compile-and-install-snort-from-source-code-on-ubuntu.html
[2]:http://xmodulo.com/how-to-capture-and-replay-network-traffic-on-linux.html
[3]:https://www.wireshark.org/docs/man-pages/reordercap.html
[4]:https://www.wireshark.org/docs/man-pages/text2pcap.html
[5]:https://github.com/isginf/pcap-diff
[6]:http://xmodulo.com/how-to-capture-and-replay-network-traffic-on-linux.html
