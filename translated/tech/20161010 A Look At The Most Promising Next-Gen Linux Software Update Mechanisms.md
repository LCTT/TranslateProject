简览最有前景的下代 Linux 软件更新机制
====

 ![OPERATING SYSTEMS -- ](http://phoronix.com/assets/categories/operatingsystems.jpg)

随着像 APT 和 Yum 等传统包管理解决方案仅仅老去，并且不适用于类 Unix IoT 等新领域，新一代的基于原子 Linux 软件升级方案应运而生。Konsulko 团队的 Matt Porter 将在本周的 2016 年欧洲嵌入式 Linux 峰会（LCTT 译注：于 2016 年 10 月 11-13 日在德国柏林召开）为大家对比这些新技术的不同点。

目前已有多个 Linux 软件商使用增量原子更新方式来传输更可靠的发行版更新，可以实现小体积的二进制文件续传，假如出现意外状况也运行回退。这些新的发行版升级机制包含了 SWUpdate、Mender、OSTree 和 swupd。但有趣的是，幻灯片之中并没有提及 Ubuntu 的 Snappy。

SWUpdate 一种单/双镜像的模块化升级框架，支持镜像签名、可以使用 Kconfig 来进行配置、能够处理本地或者远程升级等。[SWUpdate](https://github.com/sbabic/swupdate) 简直就是为嵌入式系统设计的。

而 [Mender](https://github.com/mendersoftware/mender) 则是以无线传输进行升级位目标的升级方案。它是用 Go 编程语言编写的双镜像升级框架。

[OSTree](https://github.com/ostreedev/ostree) 是此次增量原子升级方案演示中最有名气，它类似于 Git。Fedora 和 RedHat 都有它的身影，甚至 Gnome 的 Flatpak 容器系统有是用了 OSTree。

Swupd 是最后展示的一个升级系统，是 Intel 的带头部队——Clear Linux 发行版所使用的升级方案。它自身托管在 [GitHub](https://github.com/clearlinux/swupd-client)，而它的客户端和服务端则由 Clear Linux 托管。Swupd 与 OSTree 相似，但它不必重启就可以启用更新。

而本次在柏林召开的欧洲嵌入式 Linux 峰会中没有提及的升级机制，你也可以访问 [these PDF slides](http://events.linuxfoundation.org/sites/events/files/slides/Comparison%20of%20Linux%20Software%20Update%20Technologies.pdf) 来了解它们。

--------------------------------------------------------------------------------

via: http://phoronix.com/scan.php?page=news_item&px=ELC2016-Software-Updates

作者：[Michael Larabel][a]

译者：[GHLandy](https://github.com/GHLandy)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.michaellarabel.com/
