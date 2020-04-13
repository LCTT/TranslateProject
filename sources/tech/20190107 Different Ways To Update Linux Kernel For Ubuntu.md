[#]: collector: "lujun9972"
[#]: translator: "mr-ping"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Different Ways To Update Linux Kernel For Ubuntu"
[#]: via: "https://www.ostechnix.com/different-ways-to-update-linux-kernel-for-ubuntu/"
[#]: author: "SK https://www.ostechnix.com/author/sk/"


升级Ubuntu Linux核心的几种不同方法
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/ubuntu-linux-kernel-720x340.png)

这个指南里介绍了7种为Ubuntu升级Linux核心的不同方法。这7种方法里，有5种需要重启系统来使新核心生效，其他两种则不用。升级之前，**强烈建议您将重要数据进行备份!** 这里提到的所有方法只在Ubuntu中测试过。我们并不确定这些方法是不是也能适用于其他Ubuntu的特色发行版（如：Xubuntu）和衍生发行版（如：Linux Mint）。

### 第一部分： 需要重启的核心升级

以下方法需要您重启系统以便新的核心生效。所有方法都建议在个人系统或测试系统中进行。重要的事儿再说一遍，请备份好您Ubuntu中的重要数据、配置文件和其他重要的东西。

### 方法１　－　使用dpkg升级Linux核心(手动方式)

这个方法里会帮助你手动从**[kernel.ubuntu.com][1]**网站下载可用的最新Linux核心。如果你打算安装最新版（而不是稳定版或者正式发布版），那这种方法对你会很有用。从以上链接下载Linux核心版本。编写这个指南的时候，最新的可用版本是**5.0-rc1**，最新的稳定版是**v4.20**.

![][3]

基于你的选择，点击相应的Linux核心版本链接，找到你对应的架构（‘Build for XXX’）的那部分。然后下载符合以下格式的两个文件(其中 X.Y.Z 是最高版本号)：

  1. linux-image-*X.Y.Z*-generic-*.deb
  2. linux-modules-X.Y.Z*-generic-*.deb

在终端中修改文件所在的目录，然后执行命令，手动安装核心：

```
$ sudo dpkg --install *.deb
```

重启系统，使用新核心：

```
$ sudo reboot
```

检查是否如你所愿：

```
$ uname -r
```

对于分步的说明，请查看以下名为“Install Linux Kernel 4.15 LTS On DEB based systems”的文章。

+ [Install Linux Kernel 4.15 In RPM And DEB Based Systems](https://www.ostechnix.com/install-linux-kernel-4-15-rpm-deb-based-systems/)

以上的指南是针对的是4.15版本，不过安装最新版本的所有的步骤都是一样的。

**优势：** 不必联网（你可以从任何系统中下载Linux核心来使用）

**缺点：** 手动更新，需要重启系统。

#### 方法2 - 用apt-get来升级Linux核心（推荐方法）

这是在类Ubuntu系统中升级Linux核心的推荐方法。不同于上一个方法，这种方法会从Ubuntu官方仓库下载、安装核心版本而不是从 **kernel.ubuntu.com**网站。

要升级包括核心的整个系统，只需要执行：

```
$ sudo apt-get update

$ sudo apt-get upgrade
```

如果只希望升级核心，运行：

```
$ sudo apt-get upgrade linux-image-generic
```

**优势：** 简单。推荐方法。

**缺点：** 需要联网，需要重启。

从官方库中升级核心是最接近开箱即用的方法，并且不会出什么问题。如果是生产环境的系统，这是最为推荐的升级Linux核心的方法。

方法1和方法2都需要用户去介入到升级Linux核心的过程中。而下边的方法（3、 4、 5）则几乎是全自动的。

#### 方法3 - 使用Ukuu升级Linux核心

**Ukuu**是一个用于从**kernel.ubuntu.com**下载Linux核心，并且将其自动安装到Ubuntu桌面系统和服务器系统中的Gtk图形化界面和命令行工具。Ukku并不是单单简化了手动下载、安装新核心的过程，同时也会帮助你移除旧的和不再需要的核心。更多细节可以参照以下指南。

+ [Ukuu – An Easy Way To Install And Upgrade Linux Kernel In Ubuntu-based Systems](https://www.ostechnix.com/ukuu-an-easy-way-to-install-and-upgrade-linux-kernel-in-ubuntu-based-systems/)

**优势：** 易于安装使用。自动安装主线核心。

**缺点：** 需要联网，需要重启。

#### 方法4 - 使用UKTools升级Linux核心

跟Ukuu差不多，**UKTools**也会从**kernel.ubuntu.com**网站获取最新的核心并且自动安装到Ubuntu以及类似于Linux Mint的延伸发行版中。

+ [UKTools – Upgrade Latest Linux Kernel In Ubuntu And Derivatives](https://www.ostechnix.com/uktools-upgrade-latest-linux-kernel-in-ubuntu-and-derivatives/)

**优势：** 简单，自动

**缺点：** 需要联网，需要重启。

#### 方法5 - 使用Linux核心工具集(Linux Kernel Utilities)安装Linux核心

**Linux Kernel Utilities**是目前另一个用于升级类Ubuntu系统Linux核心的程序。实质上，它是一个由一系列Bash脚本构成的合集，用于编译并且可以选择性地为Debian（译者注：Ubuntu的上游发行版）及其衍生发行版升级核心。它包含三个工具集，一个用于手动编译、安装来自于 [**http://www.kernel.org**][4] 网站的源码核心，另一个用于安装来自**<https://kernel.ubuntu.com>**网站的事先编译好的核心，第三个脚本用于移除旧核心。更多细节请浏览以下链接。

+ [Linux Kernel Utilities – Scripts To Compile And Update Latest Linux Kernel For Debian And Derivatives](https://www.ostechnix.com/linux-kernel-utilities-scripts-compile-update-latest-linux-kernel-debian-derivatives/)

**优势：** 简单，自动

**缺点：** 需要联网，需要重启。

### 第二部分 – Kernel Updates without reboot

我之前说过，上边所有的方法都需要你去重启服务器（译者注：也可以是桌面版）来启用新核心。如果是个人系统或者测试系统，可以这么办。但对于无法停机的生产环境系统该怎么办呢？一点问题没有，这时候**实时补丁(livepatching)**就派上用场了。

**实时补丁**(或者叫热补丁)允许你在不需要重启的情况下安装Linux升级或补丁来保证你的服务器处于最新的安全等级之下。这对web主机、游戏服务器这类需要不间断在线的服务器来说是很有价值的。事实上，任何情况下，服务器都应该保持在不间断运行的状态下。由于Linux供应商只会在出于修复安全漏洞的目的下维护补丁，所以如果安全性是你的点，这种方式再适合不过了。

以下两种方法可以在不需要重启的情况下为生产环境和执行关键任务的Ubuntu服务器更新Linux核心。

#### 方法6 – 使用Canonical实时补丁服务（Canonical Livepatch Service）来更新Linux核心

![][5]

[**Canonical Livepatch Service**][6] 可以在不需要重启Ubuntu系统的情况下执行核心升级、补丁和安全的热修复等操作，在减少服务器宕机的情况下保障其安全。Canonical Livepatch Service  可以在安装过程当中或安装之后尽心设置. 如果你使用的是Ubuntu桌面版，软件更新器会自动检查核心补丁的更新，并且通知你。在基于控制台的系统中，则需要你主动运行apt-get update命令来进行升级。由于需要你手动运行“apt-get upgrade”命令它才会安装核心的安全补丁，所以算是半自动的。

Livepatch对三个及以下系统免费，如果多于三个，你需要升级成名为**Ubuntu Advantage**的企业支持方案套件。这个套件包括**Kernel Livepatching**及以下服务：

  * Extended Security Maintenance – Ubuntu生命周期后的重要安全更新
  * Landscape – 针对大规模使用Ubuntu的系统管理工具
  * Knowledge Base – 由Ubuntu专家撰写的私人文章和教程
  * 电话和网站支持

**价格**

Ubuntu Advantage包含三种付费计划， 必备（Essential）, 标准（Standard）和　高级（Advanced）.最基础的计划（Essential 计划）从 **单物理节点 225 美元/年**和**单VPS 75美元/年**开始计价。看上去应该不支持针对Ubuntu服务器版和桌面版的按月订阅。你可以在 [**此处**][7]浏览所有计划的细节信息。

**优势:** 简单。半自动化。无需重启。支持三个免费系统。

**缺点:** ４个以上主机的话非常昂贵. 没有补丁回滚。

**开启 Canonical Livepatch Service**

如果你想在安装后设置实时补丁服务，依照以下方法逐步执行：

从 [**https://auth.livepatch.canonical.com/**][8]　获取一个秘钥.

```
$ sudo snap install canonical-livepatch

$ sudo canonical-livepatch enable your-key
```

#### 方法７－　使用KernelCare升级Linux内核

![][9]

[**KernelCare**][10] 是所有实时补丁方案中最新的一个. 它是 [CloudLinux][11]推出的产品. KernelCare 可以运行在Ubuntu和其他的Linux特殊发行版中. 它每四个小时检查一遍补丁的发布，并在无需确认的情况下安装它们. 如果更新后存在问题，可以将补丁进行回滚。

**价格**

费用，每台服务器：**4 美元/月** , **45 美元/年**.

跟Ubuntu Livepatch相比，kernelCare看起来非常便宜、实惠。好的方面在于**也可以按月订阅**。另一个前者不具备的功能是支持如Red Hat, CentOS, Debian, Oracle Linux, Amazon Linux 以及 OpenVZ, Proxmox 这种虚拟平台等等的其他Linux发行版。

你可以在 [**此处**][12] 了解KernelCare的所有特性和简介，以及所有的付费计划的细节。

**优势:**　简单。全自动化。范围更广的操作系统覆盖。补丁回滚。无需重启。对非盈利组织提供免费许可。价格低廉。

**缺点:** 除了30天试用外无免费计划。

**开启 KernelCare Service**

此处 [**https://cloudlinux.com/kernelcare-free-trial5**][14]　获取30天免费试用秘钥。

执行以下命令开启KernelCare并注册秘钥。

```
$ sudo wget -qq -O - https://repo.cloudlinux.com/kernelcare/kernelcare_install.sh | bash

$ sudo /usr/bin/kcarectl --register KEY
```

如果你的目标是价格实惠，并且通过可靠的社区服务来保障你的Linux服务器核心的更新，那KernelCare是个不错的选择。


*由来自Cloud Linux的技术撰稿人和内容作者**Paul A. Jacobs**撰写。*

**推荐阅读:**

到此，希望这边文章能对你有所帮助。如果你觉得还有其他的工具和方法需要列在这里，可以在留言区给我们留言。我会根据反馈检查和更新这篇指南的。

接下来会有更多好东西给大家呈现，敬请期待。

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/different-ways-to-update-linux-kernel-for-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[mr-ping](https://github.com/mr-ping)
校对：[校对者ID](https://github.com/校对者ID)

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
