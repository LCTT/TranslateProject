[#]: subject: "5 Less Popular Features that Make Ubuntu 22.04 LTS an Epic Release"
[#]: via: "https://www.debugpoint.com/2022/04/ubuntu-22-04-release-unique-feature/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使 Ubuntu 22.04 LTS 成为史诗版本的 5 个不太流行的功能
======
一份关于 Ubuntu 22.04 LTS 的次要特点的列表，这些特点使它成为迄今为止最好的 LTS 版本之一。

Canonical 的最新 LTS 版本 [Ubuntu 代号为 “Jammy Jellyfish”][1] 受到了全球用户的好评。有数百个新的微小功能，也有一些不太流行的功能，没有引起人们的注意。因此，这里有五个独特的 Ubuntu 22.04 版本功能，我们认为这些功能使它成为一个史诗般的版本。

![Ubuntu 22.04 LTS Desktop \(GNOME\)][2]

### Ubuntu 22.04 发布 – 五个独特的功能

#### 为数据驱动的方案进行了优化

数据分析和处理是当今每个企业的核心。而要做到这一点，你需要巨大的计算能力。Ubuntu 22.04 LTS 带来了开箱即用的 [NVIDIA 虚拟 GPU（vGPU）][3] 驱动支持。这意味着你可以利用 NVIDIA 虚拟 GPU 软件，使你能够在从物理 GPU 服务器共享的虚拟机中使用 GPU 计算能力。

不仅如此，如果你的业务依赖于 SQL Server，Ubuntu LTS for Azure 带来了 Ubuntu 中的 SQL Server，它由 “Micro$oft” 支持，提供优化的性能和可扩展性。

#### 改进的活动目录集成

此外，许多企业在多个工作站中为整个企业用户部署 Ubuntu。而且，部署工作站策略以监测和控制用户访问和各种关键业务控制非常重要。

活动目录实现了基于策略的工作站管理（在 Ubuntu 20.04 中引入），在这个版本中得到了进一步改善。除此之外，这个版本还带来了 [ADsys][4] 客户端，它有助于通过命令行远程管理组策略、权限升级和远程脚本执行。活动目录现在也支持从这个版本开始与高级组策略对象的安装程序集成。

#### 实时内核支持

此外，在 Ubuntu 22.04 LTS 发布期间，Canonical 宣布的一个有趣的消息是提供“实时”内核选项，现在是测试版。对于电信和其他行业来说，一个低延迟的操作系统对于时间敏感的工作是必需的。因此，考虑到这一点和渗透到这些领域的愿景，Ubuntu 22.04 LTS 带来了一个应用了 PREEMPT_RT 补丁的实时内核构建。它可用于 x86_64 和 AArch64 架构。

然而，[补丁][5]还没有在主线内核中出现，希望它能很快能出现。

#### 最新的应用、软件包和驱动程序

除了上述变化之外，这个版本还带来了大量的软件包和工具链的升级。例如，这个版本带来了基于用途的多种 Linux 内核类型，如 Ubuntu 桌面可以选择使用 [Kernel 5.17][6]，而硬件启用的内核仍然是 5.15。

不仅如此，Ubuntu Server 的特点是长期支持 [Kernel 5.15][8]，而 Ubuntu Cloud 镜像可以选择使用与云供应商合作的更优化的内核。

此外，如果你是 NVIDIA 用户，值得一提的是，ARM64 上的 NVIDIA 驱动的 Linux 限制模块现在已经可用（在 x86_64 中已经可用）。你可以使用 [ubuntu-drivers][9] 程序来安装和配置 NVIDIA 驱动。

由于核心模块和子系统的存在，一个完整的操作系统可以完美无缺地工作。因此，考虑到这一点，Ubuntu 22.04 LTS 对它们都进行了仔细的升级，以迎合这个很好的版本。以下是简介。

  * GCC 11.2.0
  * binutils 2.38
  * glibc 2.35


  * Python 3.10.4
  * Perl 5.34.0
  * LLVM 14
  * golang 1.18
  * rustc 1.58
  * OpenJDK 11（可选使用 OpenJDK 18）
  * Ruby 3.0
  * PHP 8.1.2Apache 2.4.52
  * PostgreSQL 14.2
  * Django 3.2.12
  * MySQL 8.0
  * 更新的 NFS 以及 Samba Server
  * Systemd 249.11
  * OpenSSL 3.0


  * qemu 6.2.0
  * libvirt 8.0.0
  * virt-manager 4.0.0



#### 性能提升

但这还不是全部。由于一些长期等待的更新，你应该体验到更快的 Ubuntu 22.04 Jammy Jellyfish 体验，这些体验最终会在这个版本中出现。

首先，GNOME 桌面的[三重缓冲代码]长期悬而未决。当先前的帧缓冲落后时，三重缓冲会自动启用，它在 Intel 和树莓派驱动中产生了更快的桌面性能。不仅如此，代码还监控最后一帧，以便系统不会遇到过量缓冲的情况。

其次，改进的电源管理，在运行时对 AMD 和 NVIDIA 的 GPU 起作用，将帮助笔记本电脑用户。

此外，Wayland 现在是大多数系统的默认显示服务器，除了 NVIDIA GPU 硬件默认为 X11。Wayland 为你提供了更快的跨应用的桌面体验，包括网络浏览器。

最后，定制的 GNOME 42 及其[独特功能][11]（例如平衡和省电电源配置文件）为重度笔记本电脑用户提供了更多优势。 此外，带有浅色/深色外观的新强调色和选定 GNOME 模块的 GTK4/libadwaita 端口只是这个史诗般的 Ubuntu 22.04 LTS 版本的一个插件。

### 结论

总而言之，我相信这是 Canonical 发布的最好的 LTS 版本之一，就上述所有内容的变化和许多其他方面而言。

我们希望它受到好评并在未来几天保持稳定。

* * *

我们带来最新的技术、软件新闻和重要的东西。通过 [Telegram][12]、[Twitter][13]、[YouTube][14] 和 [Facebook][15] 保持联系，不错过任何更新！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/ubuntu-22-04-release-unique-feature/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-22.04-LTS-Desktop-GNOME-1024x580.jpg
[3]: https://docs.nvidia.com/grid/latest/grid-vgpu-release-notes-ubuntu/index.html
[4]: https://github.com/ubuntu/adsys
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/
[6]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[8]: https://www.debugpoint.com/2021/11/linux-kernel-5-15/
[9]: https://launchpad.net/ubuntu/+source/ubuntu-drivers-common
[10]: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
[11]: https://www.debugpoint.com/2022/03/gnome-42-release/
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint
