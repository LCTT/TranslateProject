最小的树莓派系统 picore5.3，载着3.14.4内核归来
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Smallest-OS-for-Raspberry-Pi-piCore-5-3-Returns-with-Linux-Kernel-3-14-4-443246-2.jpg)
**Tiny Core团队已经宣布，picore 5.3（一个Tiny Core Linux 在树莓派上的移植），刚刚发布了一个新的版本，现在可供下载。**

Tiny Core的核心开发者实际上同时负责其他大量的同一基础的版本。开发者已经推出了一些变体。有Core版（为有经验的用户提供了命令行界面的基本系统），TinyCore（推荐给有网线连接的新手），和CorePlus（安装映像，不是Live版的）。

Tiny Core团队并不是第一次发布这样的Linux版本，但其中有些改进是必要的，虽然除了引入新的Linux内核之外的改变都不大。

根据变更日志所述，Linux已经更新到版本3.14.4，树莓派的固件也更新到了它的最新版本（三月版），e2fsprogs已经更新到版本1.42.10，  HDMI sound 现在已经支持192 kbit /s速率，CMA和fiq-fsm现在默认启用，现在，卸载meta-extensions时使用sudo。

更新树莓派不用移去SD卡了，而且开发者已经发布了一些如何去操作的说明。

“下载picore-5.3rc4-boot.tar.gz，解压到一个临时文件夹，然后挂载/mnt/mmcblk0p1并覆盖其内容。它将覆盖引导自定义选项，如果你修改过原来系统中的config.txt和cmdline.txt，需要再修改一次。”

“如果使用无线远程连接请不要重启，否则你将由于不兼容的内核模块而丢失无线连接！从库里面下载一个匹配内核的模块tcz's后再重启。你必须保证有一个已经更新的系统可以工作。请注意，有可能是库里面仍然没有可用的内核模块扩展，“请阅读官方论坛发布的备注。

完整的更新日志可以官网[声明][1]中看到。你现在可以从Softpedia下载[picore 5.3][2]。

树莓派带有一个700 MHz的ARM处理器、512 MB的RAM、SD卡插槽和5V MicroUSB供电接口。它还具有RCA和HDMI端口。

Tiny Core Linux 的树莓派移植是Robert Shingledecker架构的一个独立系统，现在被一个具有强大社区的小团体所支持。

如果你不熟悉的Tiny Core家族的Linux发行版，你只需要知道，这是一个有开源社区开发扩展的一个模块化系统，它通常使用最新Linux内核vmlinuz 3.0，大约5MB core.gz内核。


### Tiny Core Linux piCore 5.3: 免费下载 ###

- [Tiny Core Linux piCore 5.3 (zip) 多版本][3] [二进制] [14 MB]

--------------------------------------------------------------------------------


引用: http://news.softpedia.com/news/Smallest-OS-for-Raspberry-Pi-piCore-5-3-Returns-with-Linux-Kernel-3-14-4-443246.shtml

译者：[jiajia9linuxer](https://github.com/jiajia9linuxer) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://forum.tinycorelinux.net/index.php/topic,17061.0.html
[2]:http://linux.softpedia.com/get/Linux-Distributions/Tiny-Core-Linux-piCore-103260.shtml
[3]:http://tinycorelinux.net/5.x/armv6/releases/5.3/
