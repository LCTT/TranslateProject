[#]: subject: "How to Install Deepin Desktop in Arch Linux [Complete Guide]"
[#]: via: "https://www.debugpoint.com/deepin-arch-linux-install-20/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14867-1.html"

如何在 Arch Linux 中安装深度桌面（DDE）
======

![](https://img.linux.net.cn/data/attachment/album/202207/26/170414x01pmevoo8o8b6ob.jpg)

> 在本指南中，我们将解释在 Arch Linux 中安装漂亮的深度桌面（DDE）所需的步骤。

指南的第一部分解释了安装 Arch 基本系统的步骤。第二部分是在 Arch Linux 的基础上安装完整的深度桌面。

### 什么是深度桌面（DDE）？

[深度操作系统][1] 是一个基于 Debian 稳定分支的、功能丰富且漂亮的桌面环境。深度桌面环境（DDE）是深度操作系统自主开发的桌面环境。它由它自己的 dde-kwin 窗口管理器驱动。深度桌面带有漂亮的停靠区和许多预装的深度原生的应用程序。

这个令人眼花缭乱的桌面环境 [可在 Arch 仓库中找到][2]；这篇文章介绍了如何在 Arch Linux 中安装深度桌面。

本指南安装深度桌面环境 20.1。然而，其他版本的步骤也应该是类似的。

### 第一部分：安装 Arch Linux

如果你已经安装了 Arch Linux，你可以跳过这一步，直接进入安装深度桌面部分。

要快速安装基本的 Arch Linux，请按照以下步骤进行。你也可以访问 [本指南][3] 了解以双启动或在虚拟机上安装 Arch Linux 的完整教程。

#### 下载 Arch Linux

从下面的链接下载 Arch Linux 的 .iso 文件。这里有磁力链和 BT 链接。一旦你下载好了，就把 ISO 写入 U 盘。然后从该驱动器启动。

> **[下载 Arch Linux][4]**

如果你打算通过 [GNOME Boxes][5]、[virt-manager][6] 将其安装为虚拟机镜像 —— 那么你不需要将其写入 U 盘。

#### 启动和配置分区

从 Arch Linux ISO 启动后，你必须运行一系列的命令来安装基本系统。

首先，运行下面的命令，找出设备的标识符。

```
fdisk -l
```

![fdisk -l 之前的分区][7]

然后用此设备标识符，运行下面的命令，开始对你的磁盘进行分区。请确保根据你的系统而修改下面的 `/dev/sda` 参数。

```
cfdisk /dev/sda
```

在下一个提示中选择 `label type = dos`。

选择可用空间，并从底部选择 “NEW” 选项。在这个例子中，我将创建三个分区，如下所示：

```
/dev/sda1 - 1G - for /boot
/dev/sda2 - 5G - for root
/dev/sda3 - 1G - for swap
```

![cfdisk][8]

在下一个屏幕中，提供启动分区（`/boot`）的大小（在这个例子中，我给出了 1GB）。选择它作为主分区。

对 5GB 大小的主根分区（`/`）重复同样的步骤。

![改变交换分区的类型][9]

用同样的步骤创建一个大小为 1G 的交换分区（你可以根据你的需要改变大小）。创建交换分区后，确保在底部选择类型，并将其标记为 “Linux Swap/Solaris” 选项的交换分区。

![cfdisk 的最终分区列表][10]

完成后，用底部的 “Write” 选项将变化写到磁盘上。确保你在写之前做一个备份，因为这是你系统中的一个永久性的改变。

在你继续之前，运行下面的命令来检查。在这个例子中，你可以看到，列出了三个分区。

```
fdisk -l
```

![fdisk 中的最终分区列表][11]

依次运行下面的命令，在上面新创建的分区中格式化并创建一个 ext4 文件系统。确保你根据你的需要改变 `/dev/sda1` 和 `/dev/sda2` 参数。

```
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
```

完成后，挂载系统并创建必要的目录。

```
mount /dev/sda2 /mnt
mkdir /mnt/boot /mnt/var /mnt/home
mount /dev/sda1 /mnt/boot
```

同样，确保你根据你的系统改变 `/dev/sda1`、`/dev/sda2` 和 `/dev/sda3` 参数。

![准备文件系统][12]

#### 安装基本系统

我希望你已经连接到互联网了。如果没有，请尝试使用 USB 网卡或有线网络连接，Arch 安装程序会自动配置和检测。如果你没有可用的有线连接，请按照本指南使用 Arch Linux 安装程序配置无线 Wi-Fi 网络。

依次运行下面的命令，将基本系统安装到挂载的分区中。下载的大小约为 400MB。

```
pacman -Syy
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd net-tools grub
```

![安装基本系统][13]

一旦完成，生成一个文件系统表，没有这个表你就无法启动系统。

```
genfstab -U /mnt >> /mnt/etc/fstab
```

#### 配置基本系统

依次按照下面的命令来配置基本系统。这包括设置你的地区和语言，添加一个登录用户，以及设置互联网。

```
arch-chroot /mnt
nano /etc/locale.gen
```

去掉开头的 `#`，取消对你选择的语言环境的注释。在本指南中，我选择了 `en_US.UTF-8 UTF-8`。按 `CTRL+O`、回车和 `CTRL+X` 退出 nano。

![改变语言环境][14]

使用以下方法生成语言环境数据。

```
locale-gen
```

使用下面的命令设置语言。

```
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
```

设置本地时区。

```
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
```

同样，你可以根据你的需要来选择它们。你可以通过以下命令列出本地时区。

```
ls /usr/share/zoneinfo
ls /usr/share/zoneinfo/America
```

依次使用下面的命令设置硬件时钟、创建主机名并启用互联网的 DHCP。你可以根据你的想法把 `debugpoint-pc` 改为任何主机名。

```
hwclock --systohc --utc
echo debugpoint-pc > /etc/hostname
systemctl enable dhcpcd
```

下一步是设置 `root` 用户的密码、创建一个管理员用户，并将该用户添加到 `sudoers` 文件中。

按照下面的命令依次进行。确保根据你的需要将用户名`debugpoint` 改为其他名称。

```
passwd rootuseradd -m -g users -G wheel -s /bin/bash debugpointpasswd debugpoint
```

![创建用户][15]

打开 `sudoers` 文件，添加以下几行。

```
nano /etc/sudoers
```

添加下面几行。由于你已经创建了 `root` 用户，该条目应该已经有了。

```
root ALL=(ALL) ALL
debugpoint ALL=(ALL) ALL
```

![更新 sudoers 文件][16]

安装 GRUB，建立初始的 Ramdisk 环境，并使用下面的命令卸载系统。

```
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
exit
```

![配置 GRUB][17]

然后重新启动你的系统。

```
umount /mnt/boot
umount /mnt
reboot
```

现在你已经成功地安装了 Arch Linux 基本系统。现在是安装完整的深度桌面的时候了。

### 第二部分：在 Arch Linux 中安装深度桌面

重新启动后，从 GRUB 中选择 Arch Linux。在 Arch Linux 的提示符下，开始依次运行以下命令。这些命令安装 Xorg 服务器、Lightdm 显示管理器和深度桌面组件。

对于所有的命令，使用默认的包版本，即在询问时按回车。

安装 Xorg 和显示管理器。大约安装大小为 80 MB。

```
sudo pacman -S --need xorg lightdm
```

安装额外的组件和应用程序（约 550 MB）。

```
sudo pacman -S --need deepin deepin-extra
```

安装完成后，通过修改 Lightdm 配置文件启用深度欢迎页。按照下面的命令。

```
nano /etc/lightdm/lightdm.conf
```

并添加下面这一行。保存该文件（`CTRL+O`、`CTRL+X`）。

```
greeter-session=lightdm-deepin-greeter
```

![在 Lightdm 登录页中添加深度欢迎欢迎页][18]

现在是时候把显示管理器和网络管理器作为服务启用了。这样，下次登录时，它们就可以由 systemd 自动运行。

```
systemctl enable lightdm
systemctl enable NetworkManager
```

![启用 Lightdm 和网络][19]

使用 `reboot` 命令重新启动系统。

```
reboot
```

如果一切顺利，你应该看到深度桌面的登录提示。使用你刚刚在上面的步骤中创建的凭证登录。你应该会看到最新的深度桌面环境。

![Arch Linux 中的深度 20.1 登录屏幕][20]

![Arch Linux中的深度桌面 20.1][21]

### 总结

我希望这个指南能帮助你在 Arch Linux 中安装深度桌面。虽然它不是我的日常环境，我觉得深度的桌面在本质上有些慢。可能是因为有太多的颜色渲染和动画，而且尽管它是建立在 Qt 上的，但没有为深度桌面进行适当的优化。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/deepin-arch-linux-install-20/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2020/09/deepin-20-review/
[2]: https://archlinux.org/groups/x86_64/deepin/
[3]: https://www.debugpoint.com/2020/11/install-arch-linux/
[4]: https://www.archlinux.org/download/
[5]: https://www.debugpoint.com/2020/05/install-use-gnome-boxes/
[6]: https://www.debugpoint.com/2020/11/virt-manager/
[7]: https://www.debugpoint.com/wp-content/uploads/2020/12/fdisk-l-before.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2020/12/cfdisk-1024x159.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2020/12/Swap-parition-type-change.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2020/12/final-partition-list-in-cfdisk-1024x178.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2020/12/final-partition-list-in-fdisk.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2020/12/prepare-file-system.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2020/12/Install-base-system-1024x205.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2020/12/change-locale.jpg
[15]: https://www.debugpoint.com/wp-content/uploads/2020/12/create-user.jpg
[16]: https://www.debugpoint.com/wp-content/uploads/2020/12/update-sudoers-file.jpg
[17]: https://www.debugpoint.com/wp-content/uploads/2020/12/configure-grub-1024x639.jpg
[18]: https://www.debugpoint.com/wp-content/uploads/2021/01/add-deepin-greeter-in-lightdm-login.jpg
[19]: https://www.debugpoint.com/wp-content/uploads/2020/12/Enable-lightdm-and-network-Install-Xfce-Desktop-in-Arch-Linux.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2021/01/Deepin-20.1-Login-screen-in-Arch-Linux-1024x771.jpg
[21]: https://www.debugpoint.com/wp-content/uploads/2021/01/Deepin-Desktop-20.1-in-Arch-Linux-1024x770.jpg
