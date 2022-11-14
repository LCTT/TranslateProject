[#]: subject: "13 Independent Linux Distros That are Built From Scratch"
[#]: via: "https://itsfoss.com/independent-linux-distros/"
[#]: author: "sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lkxed"
[#]: translator: "MuggleWei"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

13 个从头开始构建的独立 Linux 发行版
======
时至今日，世界上已经有成百上千种不同的 Linux 发行版。

它们中的大多数都可以被划归为三个大类 : Debian，Red Hat (Fedora) 以及 Arch Linux。

使用基于 Debian/Ubuntu ，Red Hat/SUSE 或者 Arch 的 Linux 发行版自然有它们的优势。它们很受大众欢迎，因此它们的包管理器能够提供大量的软件包。

然而，有一些用户更倾向于使用从头开始构建，独立于 DEB/RPM 这类包管理系统的发行版本。

在这篇文章当中，我们将列出一些优秀的独立 Linux 发行版。

**注意 :** 显然，下面的列表显然不会包括一些广受欢迎，通常作为创建新的发现版基础的发行版，如 Debian，Ubuntu 和 Fedora 等。此外，列表顺序不分先后，没有特定的排名。

### 1. NixOS

![Image Credits: Distrowatch][1]

NixOS 最初发布于 2003 年，NixOS 建立在 Nix 包管理器之上。它每年发布两个版本，通常是在 5 月和 11 月。

NixOS 显然不是一个直接面向新用户或普通用户的发行版。然而，其独特的[包管理][2]方法吸引了各种用户。

此外，它仍然支持 32 位系统。

##### 其他特性 :

* 构建隔离的包
* 可靠的升级，并且具有回滚功能
* 可重现的系统配置

[NixOS][3]

**相关链接**: [面向专家用户的高级 Linux 发行版][4]

### 2. Gentoo Linux

![Image Credits: Distrowatch][5]

Geetoo Linux 是一个主要针对系统专家的独立 Linux 发行版。它是为那些希望自由定制、微调和优化操作系统以满足其要求的用户而构建。  

Gentoo 使用[Portage 包管理器][6]来创建和安装软件包，通常还允许你针对你的硬件来优化它们。 Chrome 的开源版本 **Chromium OS** 便是使用 Gentoo 作为其核心的。

不要忘记，Gentoo 是[仍然支持 32 位架构的发行版][7]之一。

##### 其他特性 :

* 增量更新
* 基于源码的软件管理方法
* 支持 GURU (Gentoo 用户仓库)的 Overlay 仓库的概念，允许用户添加 Gentoo 尚未提供的软件包

[Gentoo Linux][8]

### 3. Void Linux

![Image Credits: Distrowatch][9]

Void Linux 是一个[滚动发布的发行版][10]，使用 X Binary Package System(XBPS) 来安装和删除软件。它由前 NetBSD 开发者 **Juan Romero Pardines** 创建。

它使用 runit 而不是 systemd 作为其初始化系统。此外，它还让你可以选择使用多个 [桌面环境][11]。

##### 其他特性 :

* 最低的系统要求
* 官方库也提供非自由软件包
* 支持树莓派
* 集成 OpenBSD 的 LibreSSL
* 支持 musl C 库
* 支持 32 位系统

[Void Linux][12]

**Related:** [Not a Systemd Fan? Here are 13+ Systemd-Free Linux Distributions][13]
**相关链接 :** [不是 Systemd 的粉丝 ? 这里有 13 个无 Systemd 的 Linux 发行版][13]

### 4. Solus Linux

![solus budgie 2022][14]

Solus 的前身是 EvolveOS，它从头开始构建并提供了一些令人兴奋的特性。Solus 的旗舰版本使用自己的 homegrown budgie 作为桌面环境。

与本篇文章介绍的其他系统相比，Solus 对于新手较为友好。它设法成为[最好的 Linux 发行版][15]之一。

它使用 eopkg 作为其包管理系统，支持版滚动发布模型。按照开发人员的说法，开发 Solus 的目标是个人电脑。

##### 其他特性 :

* 支持 Budgie、Gnome、MATE 和 KDE Plasma
* 各种开箱即用的软件，从而减少设置工作

[Solus Linux][16]

### 5. Mageia

![Image Credits: Distrowatch][17]

Mageia 始于 2010 年，它是 Mandriva Linux 的一个分支。它的目标是成为稳定且安全的桌面和服务器操作系统。

Mageia 是一个社区驱动的项目，由非营利组织和贡献者支持。每年会发布一个大版本。

##### 其他特性 :

* 支持 32 位系统
* 支持 KDE Plasma，Gnome 和 XFCE
* 最低的系统要求

[Mageia][18]

**相关链接 :** **[仍然支持 32 位系统的 Linux 发行版][19]**

### 6. Clear Linux

![Image Credits: Distrowatch][20]

Clear Linux 是一个由 Intel 发布的发行版，主要设计考虑是性能和云服务的使用。

有趣的是，Clear Linux 升级时是作为一个整体而非去升级单个的软件包。所以，即使你不小心弄乱了系统设置，它也可以正确的启动，执行恢复出厂设置，并让用户重新设置。

它不太适合个人用户使用。但可以作为一个独特的选择而尝试一下。

##### 其他特性 :

* 针对 Intel 平台的高度调优
* 用户和系统文件之间严格分离
* 持续的漏洞扫描

[Clear Linux OS][21]

### 7. PCLinuxOS

![Image Credits: Distrowatch][22]

PCLinuxOS 是一个 x86_64 的 Linux 发行版，使用 APT-RPM 包管理。你可以使用 KDE Plasma，Mate 以及 XFCE 桌面，它同时还提供了更多特性的社区版本的桌面。

本地安装的 PCLinuxOS 利用了 APT 包管理系统要感谢 [Synaptic 包管理器][23]。你可以从它的仓库中找到 rpm 包。

##### 其他特性 :

* mylivecd 脚本允许用户去生成一个当前已安装的硬件驱动的'快照'(所有的配置，应用，文档等)并且将它压缩为 ISO CD/DVD/USB 映像
* 附加支持超过 85 种语言

[PCLinuxOS][24]

### 8. 4MLinux

![4m linux 2022][25]

[4MLinux][26] 是一个通用的 Linux 发行版，重点聚焦于下面四个 **“ M ”**

* Maintenance (系统救援 Live CD)
* Multimedia (支持大量的图形，音频和视频格式)
* Miniserver (支持 DNS，FTP，HTTP，MySQL，NFS，Proxy，SMTP，SSH，and Telnet)
* Mystery (包含了经典 Linux 游戏的集合)

它具有最低的系统要求，可作为桌面和服务器版本使用.

##### 其他特性

* 支持大量的图形，音频和视频格式
* 是小型并且通用的 Linux 发行版

[4MLinux][27]

### 9. Tiny Core Linux

![Image Credits: Distrowatch][28]

Tiny Core Linux 专注于使用 BusyBox 和 FLTK 提供一个基础的系统。它不是一个复杂的桌面。所有，并不能保证它可以运行于任何系统。

它代表了启动到非常小的 X 桌面所需的核心功能，通常带有有线互联网访问权限。

用户可以很好的控制一切，但对于新 Linux 用户来说，它并不是一个轻松的开箱即用的系统。

##### 其他特性

* 旨在从启动时创建的内存副本中运行
* 默认情况下，其操作就像像云 / 互联网客户端一样
* 用户可以使用 appbrowser 来游览库以及下载应用

[Tiny Core Linux][29]

### 10. Linux From Scratch

![Image Credit: Reddit][30]

[Reddit][31]

Linux From Scratch 并不是一个系统，而是通过手动构建所有组件来安装 Linux 的一种方法。一旦完成，它提供了一个紧凑、灵活和安全的系统，并且可以很好的理解一个基于 Linux 的操作系统内部是如何工作的。

如果你希望去深入理解 Linux 是如何工作的并且探寻其具体细节，那么 Linux From Scratch 是你一定要去尝试，不能错过的一个项目。

##### 其他特性

* 完全从头开始，定制化的构建 Linux 系统
* 极度的灵活性
* 由于从源码开始编译，提供了额外的安全性

[Linux From Scratch][32]

### 11. Slackware

![Image Credits: Distrowatch][33]

Slackware 是现今还在维护的最老的发行版。最初创建于 1993 年，以 Softlanding Linux 系统为基础，随后，许多的 Linux 发行版都是基于 Slackware。

Slackware 目标是称为最类似于 UNIX 的 Linux 发行版，同时保持简单和稳定。

##### 其他特性

* 支持 32 位和 64 位系统
* 大量的在线文档
* 从奔腾处理器到最新的机器，它都可以运行

[Slackware][34]

### 12. Alpine Linux

![alpine linux xfce 2022][35]

Alpine Linux 是一个社区开发的操作系统，专为路由器、防火墙、VPN、VoIP 盒子和服务器而设计。它是 LEAF 项目的一个分支。

Alpine Linux 使用 apk-tools 包管理器，最初由 shell 脚本编写，而后使用 c 语言重构。它是最小的 Linux 发行版之一，仍然支持 32 位系统，并且是一个可以完全从电脑 RAM 运行的操作系统。

##### 其他特性 :

* 提供大小仅为 5MB 的最小容器映像
* 对于主库，提供 2 年的支持 ; 对于社区库，在下一个稳定版本发布前提供支持
* 使用 musl libc 制作，Busybox 使用资源效率高的容器

[Alpine Linux][36]

### 13. KaOS

![Image Credits: Distrowatch][37]

KaOS 是一个受到 Arch 启发，从头开始构建的 Linux 发行版。它使用[pacman 包管理器][38]。它是按照"*一个桌面环境(KDE Plasma)，一个工具包(QT)，一个架构(X86_64)*"的理念构建的。

它的软件库比较有限，但依然为普通用户提供了许多工具。

##### 其他特性 :

* 最新的 Plasma 桌面
* 紧密集成的滚动和透明的现代桌面发行版

[KaOS][39]

#### 总结

如果你需要一些独特的体验，那么这些独立 Linux 发行版应该能很好的满足你。

然而，如果你想要用其来替换如 Ubuntu 这样主流的 Linux 发行版作为你的桌面系统...你也许需要三思而后行，上面大多数的发行版(并不代表所有)都不是一个日常使用的桌面系统的理想的选项。

但是话又说回来，如果你对 Linux 发行版充满了经验，那么毫无疑问，你会享受这项冒险的任务的。

*如果你想尝试这些独立发行版的其中一种，哪一个会是你的优先选择呢 ? 请在评论中与我们分享.*

--------------------------------------------------------------------------------

via: https://itsfoss.com/independent-linux-distros/

作者：[sreenath][a]
选题：[lkxed][b]
译者：[MuggleWei](https://github.com/MuggleWei)
校对：[校对者 ID](https://github.com/ 校对者 ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/10/nixos-2022.png
[2]: https://itsfoss.com/package-manager/
[3]: https://nixos.org/
[4]: https://itsfoss.com/advanced-linux-distros/
[5]: https://itsfoss.com/wp-content/uploads/2022/08/gentoo-linux-plasma.jpg
[6]: https://wiki.gentoo.org/wiki/Portage
[7]: https://itsfoss.com/32-bit-linux-distributions/
[8]: https://www.gentoo.org/
[9]: https://itsfoss.com/wp-content/uploads/2022/08/void-linux.jpg
[10]: https://itsfoss.com/rolling-release/
[11]: https://itsfoss.com/best-linux-desktop-environments/
[12]: https://voidlinux.org/
[13]: https://itsfoss.com/systemd-free-distros/
[14]: https://itsfoss.com/wp-content/uploads/2022/10/solus-budgie-2022.jpg
[15]: https://itsfoss.com/best-linux-distributions/
[16]: https://getsol.us/home/
[17]: https://itsfoss.com/wp-content/uploads/2022/08/mageia-1.jpg
[18]: https://www.mageia.org/en/
[19]: https://itsfoss.com/32-bit-linux-distributions/
[20]: https://itsfoss.com/wp-content/uploads/2022/08/clear-linux-desktop.png
[21]: https://clearlinux.org/
[22]: https://itsfoss.com/wp-content/uploads/2022/08/pclinuxos.png
[23]: https://itsfoss.com/synaptic-package-manager/
[24]: https://www.pclinuxos.com/
[25]: https://itsfoss.com/wp-content/uploads/2022/10/4m-linux-2022.jpg
[26]: https://itsfoss.com/4mlinux-review/
[27]: http://4mlinux.com/
[28]: https://itsfoss.com/wp-content/uploads/2022/03/tinycore.jpg
[29]: http://www.tinycorelinux.net/
[30]: https://itsfoss.com/wp-content/uploads/2022/08/enable-aur-e1659974408774.png
[31]: https://www.reddit.com/r/linuxmasterrace/comments/udi7ts/decided_to_try_lfs_in_a_vm_started_about_a_week/
[32]: https://www.linuxfromscratch.org/
[33]: https://itsfoss.com/wp-content/uploads/2022/10/slackware-scaled.jpg
[34]: http://www.slackware.com/
[35]: https://itsfoss.com/wp-content/uploads/2022/10/alpine-linux-xfce-2022.png
[36]: https://www.alpinelinux.org/
[37]: https://itsfoss.com/wp-content/uploads/2022/08/kaos-desktop.png
[38]: https://itsfoss.com/pacman-command/
[39]: https://kaosx.us/
