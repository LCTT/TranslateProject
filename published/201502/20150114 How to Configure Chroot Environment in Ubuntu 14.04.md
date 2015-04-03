如何在 Ubuntu 14.04 里面配置 chroot 环境
================================================================================
你可能会有很多理由想要把一个应用、一个用户或者一个环境与你的 linux 系统隔离开来。不同的操作系统有不同的实现方式，而在 linux 中，一个典型的方式就是 chroot 环境。

在这份教程中，我会一步一步指导你怎么使用 chroot 命令去配置一个与真实系统分离出来的独立环境。这个功能主要可以用于测试项目，以下这些步骤都在 **Ubuntu 14.04** 虚拟专用服务器(VPS)上执行。

学会快速搭建一个简单的 chroot 环境是一项非常实用的技能，绝大多数系统管理员都能从中受益。

### Chroot 环境 ###

一个 chroot 环境就是通过系统调用，将一个本地目录临时变成根目录。一般所说的系统根目录就是挂载点"/"，然而使用 chroot 命令后，你可以使用其它目录作为根目录。

原则上，任何运行在 chroot 环境内的应用都不能访问系统中其他信息（LCTT译注：使用 chroot 把一个目录变成根目录，在里面运行的应用只能访问本目录内的文件，无法访问到目录外的文件。然而，运行在 chroot 环境的应用可以通过 sysfs 文件系统访问到环境外的信息，所以，这里有个“原则上”的修饰语）。

### Chroot 环境的用处 ###

> - 测试一个不稳定的应用服务不会影响到整个主机系统。
> 
> -  就算使用 root 权限做了些不当的操作，把 chroot 环境搞得一塌糊涂，也不会影响到主机系统。
> 
> -  可以在你的系统中运行另外一个操作系统。

举个例子，你可以在 chroot 环境中编译、安装、测试软件，而不去动真实的系统。你也可以**在64位环境下使用 chroot 创建一个32位环境，然后运行一个32位的程序**（LCTT泽注：如果你的真实环境是32位的，那就不能 chroot 一个64位的环境了）。

但是为了安全考虑，chroot 环境为非特权用户设立了非常严格的限制，而不是提供完整的安全策略。如果你需要的是有完善的安全策略的隔离方案，可以考虑下 LXC、Docker、vservers等等。

### Debootstrap 和 Schroot ###

使用 chroot 环境需要安装 **debootstrap** 和 **schroot**，这两个软件都在 Ubuntu 的镜像源中。其中 schroot 用于创建 chroot 环境。

**Debootstrap** 可以让你通过镜像源安装任何 Debian（或基于 Debian 的）系统，装好的系统会包含最基本的命令。

**Schroot** 命令允许用户使用相同的机制去创建 chroot 环境，但在访问 chroot 环境时会做些权限检查，并且会允许用户做些额外的自动设置，比如挂载一些文件系统。

在 Ubuntu 14.04 LTS 上，我们可以通过两步来实现这个功能：

### 1. 安装软件包 ###

第一步，在Ubuntu 14.04 LTS 主机系统上安装 debootstrap 和 schroot：

    $ sudo apt-get install debootstrap 
    $ sudo apt-get install schroot

### 2. 配置 Schroot ###

现在我们有工具在手，需要指定一个目录作为我们的 chroot 环境。这里创建一个目录先：

    sudo mkdir /linoxide

编辑 schroot 的配置文件：

    sudo nano /etc/schroot/schroot.conf

再提醒一下，我们现在是在 Ubuntu 14.04 LTS 系统上。如果我们想测试一个软件包能不能在 Ubuntu 13.10（代号是“Saucy Salamander”） 上运行，就可以在配置文件中添加下面的内容：

    [saucy]
    description=Ubuntu Saucy
    location=/linoxide
    priority=3
    users=arun
    root-groups=root

![](http://blog.linoxide.com/wp-content/uploads/2014/12/schroot-config.png)

根据你的系统要求，调整上面的配置信息。

### 3. 使用 debootstrap 安装32位 Ubuntu 系统 ###

Debootstrap 命令会在你的 **chroot 环境**里面下载安装一个最小系统。只要你能访问镜像源，你就可以安装任何基于 Debian 的系统版本。

前面我们已经创建了 **/linoxide** 目录用于放置 chroot 环境，现在我们可以在这个目录里面运行 debootstrap 了：

    cd /linoxide
    sudo debootstrap --variant=buildd --arch amd64 saucy /linoxide/ http://archive.ubuntu.com/ubuntu/
    sudo chroot /linoxide /debootstrap/debootstrap --second-stage

你可以将 --arch 的参数换成 i386 或其他架构，只要存在这种架构的镜像源。你也可以把镜像源 http://archive.ubuntu.com/ubuntu/ 换成离你最近的镜像源，具体可参考 [Ubuntu 官方镜像主页][1]。

**注意：如果你是在64位系统中创建32位系统，你需要在上面第3行命令中加入 --foreign 选项，就像下面的命令：**

    sudo debootstrap --variant=buildd --foreign --arch i386 saucy /linoxide/ http://archive.ubuntu.com/ubuntu/

下载需要一段时间，看你网络带宽性能。最小系统大概有500M。

### 4. 完成 chroot 环境 ###

安装完系统后，我们需要做一些收尾工作，确保系统运行正常。首先，保证主机的 fstab 程序能意识到 chroot 环境的存在：

    sudo nano /etc/fstab

在文件最后面添加下面的配置：

    proc /linoxide/proc proc defaults 0 0
    sysfs /linoxide/sys sysfs defaults 0 0

保存并关闭文件。

挂载一些文件系统到 chroot 环境：

    $ sudo mount proc /linoxide/proc -t proc
    $ sudo mount sysfs /linoxide/sys -t sysfs

复制 /etc/hosts 文件到 chroot 环境，这样 chroot 环境就可以使用网络了：

    $ sudo cp /etc/hosts /linoxide/etc/hosts

最后使用 schroot -l 命令列出系统上所有的 chroot 环境：

    $ schroot -l

使用下面的命令进入 chroot 环境：

    $ sudo chroot /linoxide/ /bin/bash

测试安装的版本：

    # lsb_release -a
    # uname -a

为了在 chroot 环境中使用图形界面，你需要设置 DISPLAY 环境变量：

    $ DISPLAY=:0.0 ./apps

目前为止，我已经成功地在 Ubuntu 14.04 LTS 上安装了 Ubuntu 13.10。

退出 chroot 环境：

    # exit

清理一下，卸载文件系统：

    $ sudo umount /test/proc
    $ sudo umount /test/sys

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-chroot-environment-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://launchpad.net/ubuntu/+archivemirrors
