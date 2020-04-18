[#]: collector: "lujun9972"
[#]: translator: "mr-ping"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12125-1.html"
[#]: subject: "Different Ways To Update Linux Kernel For Ubuntu"
[#]: via: "https://www.ostechnix.com/different-ways-to-update-linux-kernel-for-ubuntu/"
[#]: author: "SK https://www.ostechnix.com/author/sk/"

升级 Ubuntu Linux 内核的几种不同方法
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/ubuntu-linux-kernel-720x340.png)

这个指南里介绍了 7 种为 Ubuntu 升级 Linux 内核的不同方法。这 7 种方法里，有 5 种需要重启系统来使新内核生效，其他两种则不用。升级之前，**强烈建议你将重要数据进行备份!** 这里提到的所有方法只在 Ubuntu 中测试过。我们并不确定这些方法是不是也能适用于其他 Ubuntu 的特色发行版（如： Xubuntu）和衍生发行版（如：Linux Mint）。

### 第一部分：需要重启的内核升级

以下方法需要你重启系统以便新的内核生效。以下所有方法都建议在个人系统或测试系统中进行。重要的事儿再说一遍，请备份好你 Ubuntu 中的重要数据、配置文件和其他重要的东西。

#### 方法 １ － 使用 dpkg 升级 Linux 内核（手动方式）

这个方法可以帮助你从 [kernel.ubuntu.com][1] 网站手动下载可用的最新 Linux 内核。如果你打算安装最新版（而不是稳定版或者正式发布版），那这种方法对你会很有用。从以上链接下载 Linux 内核版本。编写这个指南的时候，最新的可用版本是 **5.0-rc1**，最新的稳定版是 **v4.20**。

![][3]

点击你所选择的 Linux 内核版本链接，找到你对应的架构（“Build for XXX”）的那部分。然后下载符合以下格式的两个文件（其中 X.Y.Z 是最高版本号）：

  1. linux-image-*X.Y.Z*-generic-*.deb
  2. linux-modules-X.Y.Z*-generic-*.deb

在终端中改变到文件所在的目录，然后执行此命令手动安装内核：

```
$ sudo dpkg --install *.deb
```

重启系统，使用新内核：

```
$ sudo reboot
```

检查是否如你所愿：

```
$ uname -r
```

对于分步的说明，请查看下列链接中对应的部分。

+ [在基于 RPM 和 DEB 的系统中安装 Linux 内核 4.15](https://www.ostechnix.com/install-linux-kernel-4-15-rpm-deb-based-systems/)

以上的指南是针对的是 4.15 版本，不过安装最新版本的所有的步骤都是一样的。

**优势：** 不必联网（你可以从任何系统中下载 Linux 内核来使用）

**缺点：** 手动更新，需要重启系统。

#### 方法 2 - 用 apt-get 来升级 Linux 内核（推荐方法）

这是在类 Ubuntu 系统中升级 Linux 内核的推荐方法。不同于上一个方法，这种方法会从 Ubuntu 官方仓库下载、安装内核版本，而不是从 **kernel.ubuntu.com**网站。

要升级包括内核的整个系统，只需要执行：

```
$ sudo apt-get update
$ sudo apt-get upgrade
```

如果只希望升级内核，运行：

```
$ sudo apt-get upgrade linux-image-generic
```

**优势：** 简单。推荐方法。

**缺点：** 需要联网，需要重启。

从官方库中升级内核是最接近开箱即用的方法，并且不会出什么问题。如果是生产环境的系统，这是最为推荐的升级 Linux 内核的方法。

方法 1 和方法 2 都需要用户去介入到升级 Linux 内核的过程中。而下边的方法（3、 4、 5）则几乎是全自动的。

#### 方法 3 - 使用 Ukuu 升级 Linux 内核

**Ukuu**是一个 Gtk GUI 和命令行工具，它可以从 kernel.ubuntu.com 下载最新的 Linux 主线内核，并自动安装到你的 Ubuntu 桌面版和服务器版中。Ukku 不仅简化了手动下载和安装新内核的过程，同时也会帮助你安全地移除旧的和不再需要的内核。更多细节可以参照以下指南。

+ [Ukuu：在 Ubuntu 系统中安装和升级 Linux 内核的简单方法](https://www.ostechnix.com/ukuu-an-easy-way-to-install-and-upgrade-linux-kernel-in-ubuntu-based-systems/)

**优势：** 易于安装使用。自动安装主线内核。

**缺点：** 需要联网，需要重启。

#### 方法 4 - 使用 UKTools 升级 Linux 内核

跟 Ukuu 差不多，**UKTools** 也会从 kernel.ubuntu.com 网站获取最新的稳定内核并且自动安装到 Ubuntu 以及类似于 Linux Mint 的延伸发行版中。关于UKTools的更多详情，请参见下面的链接。

+ [UKTools：升级Ubuntu及其衍生产品中的最新Linux内核](https://www.ostechnix.com/uktools-upgrade-latest-linux-kernel-in-ubuntu-and-derivatives/)

**优势：** 简单，自动。

**缺点：** 需要联网，需要重启。

#### 方法 5 - 使用 Linux 内核实用程序更新 Linux 内核

**Linux 内核实用程序**是目前另一个用于升级类 Ubuntu 系统 Linux 内核的程序。实质上，它是一个由一系列 Bash 脚本构成的合集，用于编译并且可以选择性地为 Debian（LCTT 译注：Ubuntu 的上游发行版）及其衍生发行版升级内核。它包含三个实用程序，一个用于手动编译、安装来自于 [http://www.kernel.org][4] 网站的源码内核，另一个用于安装来自 <https://kernel.ubuntu.com> 网站的预编译的内核，第三个脚本用于移除旧内核。更多细节请浏览以下链接。

+ [Linux 内核实用程序：编译和更新最新的 Linux 内核的脚本，适用于 Debian 及其衍生产品](https://www.ostechnix.com/linux-kernel-utilities-scripts-compile-update-latest-linux-kernel-debian-derivatives/)

**优势：** 简单，自动。

**缺点：** 需要联网，需要重启。

### 第二部分：无需重启的内核升级

我之前说过，上边所有的方法都需要你重启服务器（LCTT 译注：也可以是桌面版）来启用新内核。如果是个人系统或者测试系统，可以这么办。但对于无法停机的生产环境系统该怎么办呢？一点问题没有，这时候<ruby>实时补丁<rt>livepatching</rt></ruby>就派上用场了。

**实时补丁**（或者叫热补丁）允许你在不重启的情况下安装 Linux 更新或补丁，使你的服务器处于最新的安全级别。这对 web 主机、游戏服务器这类需要不间断在线的服务器来说是很有价值的。事实上，任何情况下，服务器都应该保持在不间断运行的状态下。由于 Linux 供应商只会在出于修复安全漏洞的目的下维护补丁，所以如果安全性是你最关注的问题时，这种方式再适合不过了。

以下两种方法不需要重启，对于生产环境和执行关键任务的 Ubuntu 服务器的 Linux 内核更新非常有用。

#### 方法 6 – 使用 Canonical 实时补丁服务来更新 Linux 内核

![][5]

[Canonical 实时补丁服务][6]可以在不需要重启 Ubuntu 系统的情况下自动应用内核更新、补丁和安全补丁。它可以减少Ubuntu系统的停机时间，并保证系统的安全。Canonical 实时补丁服务可以在安装过程当中或安装之后进行设置。如果你使用的是 Ubuntu 桌面版，软件更新器会自动检查内核补丁的更新，并通知你。在基于控制台的系统中，则需要你定期运行 `apt-get update` 命令来进行升级。由于需要你手动运行 `apt-get upgrade` 命令它才会安装内核的安全补丁，所以算是半自动的。

实时补丁对三个及以下系统免费，如果多于三个，你需要升级成名为 **Ubuntu Advantage** 的企业支持方案套件。这个套件包括 **Kernel 实时补丁**及以下服务：

  * 扩展安全维护 – Ubuntu 生命周期后的重要安全更新
  * Landscape – 针对大规模使用 Ubuntu 的系统管理工具
  * 知识库 – 由 Ubuntu 专家撰写的私人文章和教程
  * 电话和网站支持

**价格**

Ubuntu Advantage 包含三种付费计划，即基本计划、标准计划和高级计划。最基础的计划（基本计划）从 **单物理节点 225 美元/年**和**单VPS 75美元/年**开始计价。对于 Ubuntu 服务器版和桌面版看上去没有按月订阅。你可以在[此处][7]浏览所有计划的细节信息。

**优势：** 简单。半自动化。无需重启。支持三个免费系统。

**缺点：** ４ 个以上主机的话非常昂贵。没有补丁回滚。

##### 开启 Canonical 实时补丁

如果你想在安装后设置实时补丁服务，依照以下方法逐步执行：

从 [https://auth.livepatch.canonical.com/][8]　获取一个密钥。

```
$ sudo snap install canonical-livepatch
$ sudo canonical-livepatch enable your-key
```

#### 方法 ７ －　使用 KernelCare 升级 Linux 内核

![][9]

[KernelCare][10] 是最新的实时补丁方案。它是 [CloudLinux][11] 推出的产品。KernelCare 可以运行在 Ubuntu 和其他的 Linux 发行版中。它每四个小时检查一遍补丁的发布，并在无需确认的情况下安装它们。如果更新后存在问题，可以将补丁进行回滚。

**价格**

费用，每台服务器：**4 美元/月**，**45 美元/年**。

跟 Ubuntu 实时补丁相比，KernelCare 看起来非常便宜、实惠。好的方面在于**也可以按月订阅**。另一个前者不具备的功能是支持其他 Linux 发行版，如 Red Hat、CentOS、Debian、Oracle Linux、Amazon Linux 以及 OpenVZ、Proxmox 等虚拟化平台。

你可以在[此处][12]了解 KernelCare 的所有特性和简介，以及所有的付费计划的细节。

**优势：** 简单。全自动化。覆盖范围更广的操作系统。补丁回滚。无需重启。对非营利组织提供免费许可。价格低廉。

**缺点：** 不是免费的（除了30天的试用期）。

##### 开启 KernelCare 服务

在 [https://cloudlinux.com/kernelcare-free-trial5][14]　获取一个 30 天免费试用密钥。

执行以下命令开启 KernelCare 并注册秘钥。

```
$ sudo wget -qq -O - https://repo.cloudlinux.com/kernelcare/kernelcare_install.sh | bash
$ sudo /usr/bin/kcarectl --register KEY
```

如果你正在寻找一种经济实惠且可靠的商业服务来保持 Linux 服务器上的 Linux 内核更新，那么 KernelCare 是个不错的选择。

*由来自 Cloud Linux 的技术撰稿人和内容作者 Paul A. Jacobs 提供。*

到此，希望这边文章能对你有所帮助。如果你觉得还有其他的工具和方法需要列在这里，可以在留言区给我们留言。我会根据反馈检查和更新这篇指南的。

接下来会有更多好东西给大家呈现，敬请期待。

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/different-ways-to-update-linux-kernel-for-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: http://kernel.ubuntu.com/~kernel-ppa/mainline/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2019/01/Ubuntu-mainline-kernel.png
[4]: http://www.kernel.org
[5]: http://www.ostechnix.com/wp-content/uploads/2019/01/Livepatch.png
[6]: https://www.ubuntu.com/livepatch
[7]: https://www.ubuntu.com/support/plans-and-pricing
[8]: https://auth.livepatch.canonical.com/
[9]: http://www.ostechnix.com/wp-content/uploads/2019/01/KernelCare.png
[10]: https://www.kernelcare.com/
[11]: https://www.cloudlinux.com/
[12]: https://www.kernelcare.com/update-kernel-linux/
[13]: https://www.kernelcare.com/pricing/
[14]: https://cloudlinux.com/kernelcare-free-trial5
