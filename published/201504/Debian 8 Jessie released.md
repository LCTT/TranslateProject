Debian 8 "Jessie" 发布
=====================================================

**2015年4月25日** ，在经历了近24个月的持续开发之后，Debian 项目自豪地宣布最新的稳定版本8的发布（代号 “**Jessie**” ），归功于[Debian安全团队][1]和[Debian长期支持][2]团队的工作，该版本将在接下来的5年内获得支持。

![Debian](http://i1-news.softpedia-static.com/images/news2/Debian-GNU-Linux-8-Jessie-Has-Been-Officially-Released-Download-Now-479331-2.jpg)

“**Jessie**” 与新的默认 init 系统 `systemd` 一同到来。`systemd` 套件提供了许多激动人心的特性，如更快的启动速度、系统服务的 cgroups 支持、以及独立出部分服务的可能性。不过，`sysvinit` init系统在 “**Jessie**” 中依然可用。

在 “**Wheezy**” 中引入的 UEFI 支持（*“Unified Extensible Firmware Interface”*，统一的可扩展固件接口）同样在 “**Jessie**” 中得到了大幅改进。其中包含了许多已知固件 bug 的临时性解决方案，支持32位系统上的UEFI，也支持64位内核运行在32位 UEFI 固件上（后者仅被包含在我们的 `amd64/i386` “multi-arch” 安装介质中）。

自上个版本发布以来，Debian 项目的成员同样对我们的支持服务做出了重要改进。其中之一是[可浏览所有 Debian 的源码][3]，该服务目前放在 [sources.debian.net][4]。当然，在超过20000个源码包里想要找到正确的文件确实令人望而生畏。因此，我们同样十分高兴地上线 [Debian 代码搜索][5]，它放在 [codesearch.debian.net][6]。这两项服务都由一个完全重写并且更加反应敏捷的[包追踪系统][7]提供。

该版本包含大量的软件包更新，如：

* Apache 2.4.10
* Asterisk 11.13.1
* GIMP 2.8.14
* 一个GNOME桌面环境 3.14 的升级版本
* GCC 编译器 4.9.2
* Icedove 31.6.0 (一个 Mozilla Thunderbird 的再发布版本)
* Iceweasel 31.6.0esr (一个 Mozilla Firefox 的再发布版本)
* KDE Plasma Workspaces 和 KDE Applications 4.11.13
* LibreOffice 4.3.3
* Linux 3.16.7-ctk9
* MariaDB 10.0.16 和 MySQL 5.5.42
* Nagios 3.5.1
* OpenJDK 7u75
* Perl 5.20.2
* PHP 5.6.7
* PostgreSQL 9.4.1
* Python 2.7.9 和 3.4.2
* Samba 4.1.17
* Tomcat 7.0.56 和 8.0.14
* Xen Hypervisor 4.4.1
* Xfce 4.10桌面环境
* 超过43000个其它可供使用的软件包，从将近20100个源码包编译而来

与如此之多的软件包选择和照例的广泛架构支持，Debian 再次向它的目标：成为通用操作系统迈出正确的一步。Debian 适用于各种不同情形：从桌面系统到上网本；从开发服务器到集群系统；以及数据库，web，或存储服务器。同时，在此基础之上的质量保证工作，如对 Debian 上所有包的自动安装和升级测试，让 “**Jessie**” 可以满足用户拥有一个稳定的 Debian 版本的高期望值。

总共支持十种架构：32位PC/Intel IA-32(`i386`)，64位PC/Intel EM64T / x86-64 (`amd64`)，Motorola/IBM PowerPC (旧硬件的`powerpc`和新的64位`ppc64el`(little-endian))，MIPS (`mips` 大端和 `mipsel`小端)，IBM S/390 (64位 `s390x`)以及 ARM 新老32位硬件的`armel`和`armhf`，加上给新64位 *“AArch64”* 架构的`arm64`。

### 想尝试一下？ ###

如果你仅仅是想在不安装的情况下体验 Debian 8 “**Jessie**”，你可以使用一个特殊的镜像，即 live 镜像，可以用在 CD，U 盘以及网络启动设置上。最先只有 `amd64` 和 `i386` 架构提供这些镜像。Live 镜像同样可以用来安装 Debian。更多信息请访问 [Debian Live 主页][8]。

但是如果你想安装 Debian 到你的计算机的话，有不少安装媒介可供你选择，如蓝光碟，DVD，CD 以及 U 盘，或者从网络安装。有几种桌面环境：GNOME，KDE Plasma 桌面及 Plasma 应用，Xfce 以及 LXDE，它们可以从CD镜像中安装，也可以从 CD/DVD 的启动菜单里选择想要的桌面环境。另外，同样提供了多架构 CD 和 DVD，可以从单一磁盘选择安装不同架构的系统。或者你还可以创建可启动 U 盘安装媒介（参看[安装指南][9]获得更多细节）。对云用户，Debian 还提供了[预构建 OpenStack 镜像][10]可供使用。

安装镜像现在同样可以通过 [bittorrent][11]（推荐下载方式），[jigdo][12] 或 [HTTP][13] 下载，查看[Debian 光盘][14]获得更进一步的信息。“**Jessie**” 不久将提供实体 DVD，CD-ROM，以及无数[供应商][15]的蓝光碟。

### 升级 Debian ###

如果从前一个版本 Debian 7（代号 “**Wheezy**” ）升级到 Debian 8，大部分配置情况 apt-get 包管理工具都能够自动解决。Debian 系统一如既往地能够就地无痛升级，无需强制停机。强烈推荐阅读[发行注记][16]和[安装指南][17]来了解可能存在的问题，并了解安装和升级建议。发行注记会在发布后的几周内进一步改进，并翻译成其他语言。

## 关于 Debian ##

Debian 是一个自由操作系统，由成千上万来自全世界的志愿者通过互联网协作开发。Debian 项目的关键力量是它的志愿者基础，它对 Debian 社群契约和自由软件的贡献，以及对提供最好的操作系统可能的承诺。Debian 8是其前进方向上又一重要一步。

## 联系信息 ##

获取更多信息，请访问 Debian 主页 [https://www.debian.org/][18] 或发送电子邮件至<press@debian.org>。

--------------------------------------------------------------------------------

via: https://www.debian.org/News/2015/20150426

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://security-team.debian.org/
[2]:https://wiki.debian.org/LTS
[3]:https://www.debian.org/News/weekly/2013/14/#sources
[4]:https://sources.debian.net/
[5]:https://www.debian.org/News/weekly/2014/17/#DCS
[6]:https://codesearch.debian.net/
[7]:https://tracker.debian.org/
[8]:http://live.debian.net/
[9]:https://www.debian.org/releases/jessie/installmanual
[10]:http://cdimage.debian.org/cdimage/openstack/current/
[11]:https://www.debian.org/CD/torrent-cd/
[12]:https://www.debian.org/CD/jigdo-cd/#which
[13]:https://www.debian.org/CD/http-ftp/
[14]:https://www.debian.org/CD/
[15]:https://www.debian.org/CD/vendors
[16]:https://www.debian.org/releases/jessie/releasenotes
[17]:https://www.debian.org/releases/jessie/installmanual
[18]:https://www.debian.org/
