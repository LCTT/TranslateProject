[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10644-1.html)
[#]: subject: (How to boot up a new Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/how-boot-new-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

树莓派使用入门：如何启动一个新的树莓派
======
> 在本系列文章的第三篇中，我们将教你开始使用树莓派，学习如何安装一个 Linux 操作系统。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y)

如果你按顺序看我们本系列的文章，那么你已经 [选择][1] 和 [购买][2] 了你的树莓派和外围设备，现在，你将要去使用它。在第三篇文章中，我们来看一下你需要做些什么才能让它启动起来。

与你的笔记本、台式机、智能手机、或平板电脑不一样的是，树莓派上并没有内置存储。而是需要使用一个 Micro SD 卡去存储操作系统和文件。这么做的最大好处就是携带你的文件比较方便（甚至都不用带着树莓派）。不利之处是存储卡丢失和损坏的风险可能很高，这将导致你的文件丢失。因此，只要保护好你的 Micro SD 卡就没什么问题了。

你应该也知道，SD 卡的读写速度比起机械硬件或固态硬盘要慢很多，因此，你的树莓派的启动、读取、和写入的速度将不如其它设备。

### 如何安装 Raspbian

你拿到新树莓派的第一件事情就是将它的操作系统安装到一个 Micro SD 卡上。尽管树莓派上可用的操作系统很多（基于 Linux 的或非基于 Linux 的都有），但本系列课程将专注于 [Raspbian][3]，它是树莓派的官方 Linux 版本。

![](https://opensource.com/sites/default/files/uploads/raspbian.png)

安装 Raspbian 的最简单的方式是使用 [NOOBS][4]，它是 “New Out Of Box Software” 的缩写。树莓派官方提供了非常详细的 [NOOBS 文档][5]，因此，我就不在这里重复这些安装指令了。

NOOBS 可以让你选择安装以下的这些操作系统：

+ [Raspbian][6]
+ [LibreELEC][7]
+ [OSMC][8]
+ [Recalbox][9]
+ [Lakka][10]
+ [RISC OS][11]
+ [Screenly OSE][12]
+ [Windows 10 IoT Core][13]
+ [TLXOS][14]

再强调一次，我们在本系列的课程中使用的是 Raspbian，因此，拿起你的 Micro SD 卡，然后按照 NOOBS 文档去安装 Raspbian 吧。在本系列的第四篇文章中，我们将带你去看看，如何使用 Linux，包括你需要掌握的一些主要的命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/how-boot-new-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10611-1.html
[2]: https://linux.cn/article-10615-1.html
[3]: https://www.raspbian.org/RaspbianFAQ
[4]: https://www.raspberrypi.org/downloads/noobs/
[5]: https://www.raspberrypi.org/documentation/installation/noobs.md
[6]: https://www.raspbian.org/RaspbianFAQ
[7]: https://libreelec.tv/
[8]: https://osmc.tv/
[9]: https://www.recalbox.com/
[10]: http://www.lakka.tv/
[11]: https://www.riscosopen.org/wiki/documentation/show/Welcome%20to%20RISC%20OS%20Pi
[12]: https://www.screenly.io/ose/
[13]: https://developer.microsoft.com/en-us/windows/iot
[14]: https://thinlinx.com/
