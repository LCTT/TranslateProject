最小的操作系统picore Raspberry Pi，5.3，内嵌Linux内核3.14.4
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Smallest-OS-for-Raspberry-Pi-piCore-5-3-Returns-with-Linux-Kernel-3-14-4-443246-2.jpg)
**微小的核心团队已经宣布，picore 5.3，Tiny Core Linux Raspberry Pi的接口，刚刚收到一个新的版本，现在可供下载。* *
Tiny Core的核心开发者实际上是负责其他大量建立了具有相同基础的版本。这里有许多适合开发者的变体。有核心版（库系统只提供一个为有经验的用户的命令行界面），tinycore（关于有线网络连接的新手推荐选项），和CorePlus（安装映像，非激活的）。

Tiny Core团队并不是第一次发布这样的Linux版本，但有些改进是必要的，除了引用新的Linux内核之外，并非所有都是大的改变。

根据更新的内核，Linux已经更新到版本3.14.4，Raspberry Pi的固件更新了它的最新版本（释放），e2fsprogs已经更新到版本1.42.10，  HDMI sound 现在是在192 kbit / s的工作速率，CMA和fiq-fsm现在默认启用，现在，sudo使用时，取消连接meta-extensions.。

这次更新了Raspberry Pi以前的版本没有移除SD卡的可能，而且开发者已经发布了一些如何去操作的说明。

“下载picore-5.3rc4-boot.tar.gz解压到一个临时文件夹，覆盖/mnt/mmcblk0p1的内容后，安装它。它将自定义启动选项。如果你仍然想在老系统中的config.txt定制cmdline.txt，请再做一次。”

“如果使用无线远程连接是不需要重启的，否则你将失去由于不兼容的内核模块的连接！下一个下载内核模块TCZ从repo匹配新内核版本并重新启动。你必须保证有一个已经更新的系统在工作。请注意，这有可能是尚未在repo里的内核模块的扩展，“相关阅读笔记发布在官方论坛。

在官网声明中可以发现一个已经更新改变的完整列表。你现在可以从Softpedia下载picore 5.3。

Raspberry Pi依赖与一个700 MHz的时速的ARM处理器，512 MB的RAM，SD卡插槽，和5V微USB连接器，电源。它还具有RCA和HDMI端口。

Tiny Core Linux Raspberry Pi的端口是一个独立的系统架构，这是通过罗伯特Shingledecker与社会团体强力支持小团队而发展起来的。

如果你不熟悉的Tiny Core家族的Linux分布，你需要知道，这是在开源社区扩展的一个模块化的系统，它通常使用最新Linux内核vmlinuz 3.0和一个5MB core.gz的文件。


### Tiny Core Linux piCore 5.3: 免费下载 ###

- [Tiny Core Linux piCore 5.3 (zip) 多版本][3][二进制] [14 MB]

--------------------------------------------------------------------------------


引用: http://news.softpedia.com/news/Smallest-OS-for-Raspberry-Pi-piCore-5-3-Returns-with-Linux-Kernel-3-14-4-443246.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://forum.tinycorelinux.net/index.php/topic,17061.0.html
[2]:http://linux.softpedia.com/get/Linux-Distributions/Tiny-Core-Linux-piCore-103260.shtml
[3]:http://tinycorelinux.net/5.x/armv6/releases/5.3/
