[#]: subject: "Big News! Gentoo Linux is Now Providing Binary Packages for Quick Software Installation"
[#]: via: "https://news.itsfoss.com/gentoo-binary-packages/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16528-1.html"

Gentoo Linux 现在提供用于快速软件安装的二进制包
======

![][0]

> Gentoo 为硬件速度慢的用户准备了一份年终大礼。

如果你不觉得这有什么大不了，那就说明你不了解 Gentoo。

Debian 有 deb 软件包，Fedora 有 RPM 软件包。甚至 Arch Linux 也提供了通过 Pacman 命令安装的二进制包。基本上，这些发行版从源代码构建这些包并将其提供给你。你可以使用发行版的包管理系统来获取这些二进制文件并将它们安装在你的系统上。

但进入 Gentoo 领域，情况就完全不同了。想要安装任何软件吗？ 你必须从源代码编译它。

是的，你没看错。这就是围绕编译和 Gentoo 产生了如此多的表情包的原因。

![A blend of Gentoo and dad joke][1]

从源代码编译软件的问题意味着它将需要更多的计算能力。当你编译软件时，你的 CPU 将非常繁忙。

![][2]

当然，编译一个软件需要一些时间。

![Image source: r/linuxmemes][3]

### 现在你可以在 Gentoo 中“安装”软件包而不是编译它们

Gentoo 的包管理器 Portage 多年来一直支持二进制包。只是没有预编译二进制包的集中仓库。

现在这种情况正在改变，因为 Gentoo 现在提供二进制包供下载和直接安装。

对于大多数架构，它将仅限于核心系统和每周更新。然而，对于 [amd64 和 arm64][4]，有一个为 LibreOffice、Docker、Plasma、GNOME 等流行软件提供二进制文件的巨大仓库。

这对于使用低端硬件或不希望一直手动编译的 Gentoo 用户来说非常方便。

我知道你对在 Gentoo 中使用二进制包有很多疑问。查看 [Gentoo 的官方公告][5]，其中包含详细内容。

![][6]

### 基于源代码的安装不会消失

先别生气，我的 Gentoo 伙计！你仍然可以享受从源代码编译的乐趣。这个选项不会消失。你仍然可以像以前一样享受编译的乐趣。二进制软件包是可选的。它们不会强迫你使用。

编译每一个包有其好处。软件针对其运行的系统进行了优化。这就是 Gentoo 用户所夸耀的性能提升。

![][7]

由于系统资源有限，低端计算机需要更长的编译时间，但它也可以通过为机器构建每个软件来获得性能优化。如果你问我的话，这有点像第 22 条军规的情况。

### 你用 Gentoo 吗？

我坚信这不仅会为现有的 Gentoo 用户群带来便利，而且还将有助于扩大其用户群。毕竟，一个发行版用户在安装 Arch 之后会做什么呢？

我在这里的新闻报道中使用了很多表情包，因为现在是快乐的季节 ☃️

也许你可以利用寒假安装（但不编译）Gentoo 😜

享受节日和假期！

*（题图：DA/389d8213-29fd-4149-b591-45e6cc9b0bb0）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gentoo-binary-packages/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/12/gentoo-ifi-it-moves-compile-it.png
[2]: https://news.itsfoss.com/content/images/2023/12/gentoo-compile-meme.png
[3]: https://news.itsfoss.com/content/images/2023/12/gentoo-compile-time-meme.webp
[4]: https://itsfoss.com/arm-aarch64-x86_64/
[5]: https://www.gentoo.org/news/2023/12/29/Gentoo-binary.html
[6]: https://www.gentoo.org/assets/img/logo/icon-192.png
[7]: https://news.itsfoss.com/content/images/2023/12/gentoo-faster-meme.png
[0]: https://img.linux.net.cn/data/attachment/album/202401/03/142406n5k61kq3xddmu8mk.jpg