怎样在废旧的硬件上安装 Xen 虚拟机监视器
================================================================================
Xen 是一个直接运行在硬件上的虚拟机监视器，这意味着你必须准备一个裸机来安装和运行 Xen。而 KVM 则和 Xen 有一些不同 —— 你可以把它添加到任何已经正在运行 Linux 的机器上。本教程描述了如何在废旧的硬件上安装和配置 Xen 虚拟机监视器。

整个安装过程使用 Debian Jessie（Debian 的测试发行版）作为宿主机操作系统（也称作 [Dom0][1]）。Jessie 并不是唯一的选择 —— Xen 的支持是内建在 Linux 内核中的，[许多 Linux 发行版][2] 都包含支持 Xen 的内核。

### 找点废旧的硬件 ###

首先，找一个可以格式化的合适的工作站，比如一台旧的笔记本或者台式机。旧的硬件可能不适合玩游戏，但是足够安装一个宿主机和一些客户机了。一个满足下面这些要求的 PC 机就可以了。

- 一个双核 CPU（64 位）
- 4GB 内存
- 80GB 硬盘
- 能够从 CD，DVD 或者 USB 引导启动
- 一块网卡

注意 **CPU 必须是 64 位的，因为 Debian 已经不再支持 32 位的 Xen 安装包**。如果你没有空余的硬件，你可以花点钱买一台旧机器。2010 年值 $1000 的旗舰级笔记本现在只需要 $100。从 eBay 买台二手笔记本并升级下内存也可以满足需求。

### 刻录一个引导 CD/USB ###

下载 Debian Jessie 的 ISO 镜像。从 [Debian 官网][3] 下载网络安装镜像就可以了。

    $ wget http://cdimage.debian.org/cdimage/jessie_di_beta_2/amd64/iso-cd/debian-jessie-DI-b2-amd64-netinst.iso 

接下来，记下你的 [CD/DVD][4] 或者 [USB设备][5] 所识别的设备名 （例如 /dev/sdc）。

使用 dd 命令将 ISO 镜像刻录至 CD 或者 USB 中。将下面的 /dev/sdc 替换为你上面识别出的设备名。

    $ sudo dd if=debian-jessie-DI-b2-amd64-netinst.iso of=/dev/sdc 

### 开始安装 ###

安装前，使用刻录的 CD/USB 启动 Debian 的安装界面。

最好是使用有线网络，而不是 WIFI。如果因为固件或者驱动的原因导致 WIFI 不能连接，你将无法完成下面的步骤。

![](https://farm8.staticflickr.com/7516/15772286696_c31e4c7754_z.jpg)

### 硬盘分区 ###

这里的设置使用了四个分区。自动安装时通常会创建一个包含逻辑分区的扩展分区。像下面这样给硬盘分四个区。

- sda1 挂载至 /boot，200MB
- sda2 做为 /, 20GB, Ubuntu 占用 4GB
- sda3 做为 swap, 6GB (4GB x 1.5 = 6)
- sda4 保留用作 LVM, 不挂载，大小为剩余的硬盘大小

### 安装基本的系统 ###

这里尽可能的让系统的安装更简单快速一些。一个基本的工作用系统可以稍后再添加。Debian 的 APT（Advanced Package Tool）使得添加软件非常的简单。在机器上安装 Debian 可能会有一些很浪费时间的问题。可能显卡驱动与内核不监控或者可能老旧的 CD-ROM 驱动器只能间歇性的工作。

当选择安装软件时，选择安装一个 SSH 服务器，不要安装桌面环境如 Gnome。

![](https://farm9.staticflickr.com/8541/15176520633_5d31beda9c_z.jpg)

安装一个图形桌面需要安装成百上千的包 —— 这些额外的工作可以稍后再进行。如果你遇到问题了，等待图形桌面的安装会浪费很多时间。同时，没有桌面组件，系统的启动可以更快一些 —— 只需要几十秒而不是几分钟。整个安装过程会需要重启几次，因此这样做可以节省不少时间。

一个 SSH 服务器可以让你从另一台电脑来配置这台工作站。这可以避免一些旧硬件的问题 —— 可能旧机器的键盘少了几个键，LCD 屏幕有坏点或者触摸板没有反应等等。

### 添加 LVM (Logical Volume Manager) ###

以 root 身份安装 LVM 工具。

    # apt-get update
    # apt-get install lvm2

选择一个分区创建物理卷。

    # pvcreate /dev/sda4

创建卷组。

    # vgcreate vg0 /dev/sda4

你并不需要创建逻辑卷。如果你想测试 LVM 是否正常，可以创建一个逻辑卷然后删掉它。

    # lvcreate -nmytempvol -L10G vg0
    # lvremove /dev/vg0/mytempvol 

检查 LVM 状态。

    # pvs (查看物理卷的信息)
    # vgs (查看卷组的信息)
    # lvs (查看逻辑卷的信息)

### 添加一个 Linux 网桥 ###

这里我们要添加一个桥接网卡，这样 Xen 客户机就可以通过网桥连接网络。

安装桥接的工具。

    # apt-get install bridge-utils

查看在哪块网卡配置桥接。

    # ip addr 

![](https://farm8.staticflickr.com/7512/15610553338_2f9cf1d3a2_z.jpg)

在这个例子中，我们有一块网卡名称为 eth0。我们准备修改配置文件（/etc/network/interfaces）将 eth0 作为桥接设备。

在进行更改之前，备份网络配置文件以保证原来的工作配置是安全的。

    # cd /etc/network/
    # cp interfaces interfaces.backup
    # vi /etc/network/interfaces 

文件的内容类似下面这样。

    auto lo
    iface lo inet loopback
     
    allow-hotplug eth0
    iface eth0 inet dhcp

修改成这样。

    auto lo
    iface lo inet loopback
     
    auto eth0
    iface eth0 inet manual
     
    auto xenbr0
    iface xenbr0 inet dhcp
    bridge_ports eth0

激活网卡配置的修改：

    # systemctl restart networking 

### 验证网络设置 ###

验证桥接设备 xenbr0 创建成功。

    # ip addr show xenbr0 

同时检查 eth0 被成功加入网桥。

    # brctl show 

![](https://farm6.staticflickr.com/5609/15795960355_673c71ab5c_z.jpg)

你现在安装好了 Jessie 系统。不过此时 Xen 还没有安装。下面我们开始安装 Xen。

### 安装 Xen 虚拟机监视器 ###

安装 Xen 和 QEMU 包，并升级 GRUB 引导程序。

    # apt-get install xen-linux-system 

重启。

当 GRUB 界面出现时，你可以看到列出的额外的启动选项。

![](https://farm8.staticflickr.com/7535/15794086091_bf1bce6b4b_z.jpg)

第一个选项会在 5 秒钟内自动启动（在 /etc/default/grub 的 GRUB_TIMEOUT 这行设置），因此这点时间可来不及喝咖啡。

按下方向键选择  "Debian GNU/Linux, with Xen hypervisor" 这个选项，然后按回车。这时屏幕会出现很多行信息，接着是正常的登录界面。

### 检查 Xen 工作是否正常 ###

Xen 虚拟机监视器带有一个管理 Xen 的命令行程序叫做 xl，可以用来创建和管理 Xen 虚拟机。使用 xl 命令来检查 Xen 是否成功安装了。

以 root 用户登录，执行:

    # xl info

将会显示很多关于 Xen 主机的信息。

![](https://farm9.staticflickr.com/8404/15610553388_db3b134a9d_z.jpg)

查看已有 Xen 虚拟机的列表：

    # xl list 

![](https://farm9.staticflickr.com/8393/15610135189_ffd8bd24e8_z.jpg)

这里显示了一个主机的列表。因为没有创建任何的 Xen 客户机，唯一的条目是 Domain-0，即你安装的 Debian 系统。

### 修改启动顺序 ###

当你到这一步之后，Xen 的安装已经完成了。这里还有一件事需要修改 —— 默认的启动选项不会加载 Xen。GRUB 选择启动菜单的第一个选项 （Debian GNU/Linux），而不是第三个（Debian GNU/Linux, with Xen hypervisor）。

启动菜单的默认选项是在 grub 配置文件 /boot/grub/grub.cfg 中定义的。修改选项时，不要直接修改这个文件，而是编辑 /etc/default/grub 这个文件。有一个叫做 grub-mkconfig 的工具可以读取这个配置文件和 /etc/grub.d/ 中的所有莫爸妈，并写入到 grub.cfg 文件中。

编辑 Debian 的 grub-mkconfig 的配置文件

    # vi /etc/default/grub 

修改这一行:

    GRUB_DEFAULT=0

改为

    GRUB_DEFAULT='Debian GNU/Linux, with Xen hypervisor'

然后更新 grub 的配置文件。

    # grub-mkconfig -o /boot/grub/grub.cfg 

最后重启。几秒钟后，grub 启动菜单出现了。检查看第三个选项 "Debian GNU/Linux, with Xen hypervisor" 是否是自动选中的选项。

### 最后 ###

如果你使用这台主机作为你的工作站，可以安装一个图形桌面。Debian 包括好几种[桌面环境][6]。如果你想要一个包含所有东西的图形桌面，那么安装 Gnome 吧。如果它的图形效果并不是你的菜，试试 Awesome 吧。

注意 Debian 的默认 Gnome 环境有大量的额外应用程序包括办公套件 LibreOffice，Iceweasel 浏览器和 Rhythmbox 音乐播放器。安装命令 "apt-get install gnome" 会安装 1,000 多个包并需要将近 2GB 的硬盘空间。运行这个重量级的桌面环境需要占用 1GB 的内存。

（LCTT 译注：本文没有涉及如何安装 guest 虚拟机，请关注后继文章）

--------------------------------------------------------------------------------

via: http://xmodulo.com/install-xen-hypervisor.html

作者：[Nick Hardiman][a]
译者：[Liao](https://github.com/liaoishere)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nick
[1]:http://wiki.xen.org/wiki/Dom0
[2]:http://wiki.xen.org/wiki/Dom0_Kernels_for_Xen
[3]:https://www.debian.org/devel/debian-installer/
[4]:http://ask.xmodulo.com/detect-dvd-writer-device-name-writing-speed-command-line-linux.html
[5]:http://ask.xmodulo.com/find-device-name-usb-drive-linux.html
[6]:https://wiki.debian.org/DesktopEnvironment
