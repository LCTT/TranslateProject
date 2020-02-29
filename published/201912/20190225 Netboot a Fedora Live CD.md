[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11708-1.html)
[#]: subject: (Netboot a Fedora Live CD)
[#]: via: (https://fedoramagazine.org/netboot-a-fedora-live-cd/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

网络启动一个 Fedora Live CD
======

![](https://fedoramagazine.org/wp-content/uploads/2019/02/netboot-livecd-816x345.jpg)

[Live CD][1] 对于很多任务是很有用的，例如:

* 将操作系统安装到一个硬盘驱动器
* 修复一个启动加载程序或执行其它救援模式操作
* 为 Web 浏览提供一个相适应的最小环境
* …以及[更多的东西][2]。

作为使用 DVD 和 USB 驱动器来存储你的 Live CD 镜像是一个替代方案，你可以上传它们到一个不太可能丢失或损坏的 [iSCSI][3] 服务器中。这个指南向你展示如何加载你的 Live CD 镜像到一个 ISCSI 服务器上，并使用 [iPXE][4] 启动加载程序来访问它们。

### 下载一个 Live CD 镜像

```
$ MY_RLSE=27
$ MY_LIVE=$(wget -q -O - https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/$MY_RLSE/Workstation/x86_64/iso | perl -ne '/(Fedora[^ ]*?-Live-[^ ]*?\.iso)(?{print $^N})/;')
$ MY_NAME=fc$MY_RLSE 
$ wget -O $MY_NAME.iso https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/$MY_RLSE/Workstation/x86_64/iso/$MY_LIVE
```

上面的命令下载 `Fedora-Workstation-Live-x86_64-27-1.6.iso` Fedora Live 镜像，并保存为 `fc27.iso`。更改 `MY_RLSE` 的值来下载其它档案版本。或者，你可以浏览 <https://getfedora.org/> 来下载最新的 Fedora live 镜像。在 21 之前的版本使用不同的命名约定，必需[在这里手动下载][5]。如果你手动下载一个 Live CD 镜像，设置 `MY_NAME` 变量为不带有扩展名的文件的基本名称。用此方法，下面部分中命令将引用正确的文件。

### 转换 Live CD 镜像

使用 `livecd-iso-to-disk` 工具来转换 ISO 文件为一个磁盘镜像，并添加 `netroot` 参数到嵌入的内核命令行：

```
$ sudo dnf install -y livecd-tools
$ MY_SIZE=$(du -ms $MY_NAME.iso | cut -f 1)
$ dd if=/dev/zero of=$MY_NAME.img bs=1MiB count=0 seek=$(($MY_SIZE+512)) 
$ MY_SRVR=server-01.example.edu 
$ MY_RVRS=$(echo $MY_SRVR | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_SRVR}) 
$ MY_LOOP=$(sudo losetup --show --nooverlap --find $MY_NAME.img) 
$ sudo livecd-iso-to-disk --format --extra-kernel-args netroot=iscsi:$MY_SRVR:::1:iqn.$MY_RVRS:$MY_NAME $MY_NAME.iso $MY_LOOP 
$ sudo losetup -d $MY_LOOP
```

### 上传 Live 镜像到你的服务器

在你的 ISCSI 服务器上创建一个目录来存储你的 live 镜像，随后上传你修改的镜像到其中。

对于 21 及更高发布版本：

```
$ MY_FLDR=/images 
$ scp $MY_NAME.img $MY_SRVR:$MY_FLDR/
```

对于 21 以前发布版本：

```
$ MY_FLDR=/images 
$ MY_LOOP=$(sudo losetup --show --nooverlap --find --partscan $MY_NAME.img) 
$ sudo tune2fs -O ^has_journal ${MY_LOOP}p1 
$ sudo e2fsck ${MY_LOOP}p1 
$ sudo dd status=none if=${MY_LOOP}p1 | ssh $MY_SRVR "dd of=$MY_FLDR/$MY_NAME.img" 
$ sudo losetup -d $MY_LOOP
```

### 定义 iSCSI 目标

在你的 iSCSI 服务器上运行下面的命令：

```
$ sudo -i 
# MY_NAME=fc27 
# MY_FLDR=/images 
# MY_SRVR=`hostname` 
# MY_RVRS=$(echo $MY_SRVR | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_SRVR}) 
# cat << END > /etc/tgt/conf.d/$MY_NAME.conf 
<target iqn.$MY_RVRS:$MY_NAME>
    backing-store $MY_FLDR/$MY_NAME.img
    readonly 1
    allow-in-use yes 
</target> 
END 
# tgt-admin --update ALL
```

### 创建一个可启动 USB 驱动器

[iPXE][4] 启动加载程序有一个 [sanboot][6] 命令，你可以使用它来连接并启动托管于你 ISCSI 服务器上运行的 live 镜像。它可以以很多不同的[格式][7]编译。最好的工作格式依赖于你正在运行的硬件。例如，下面的说明向你展示如何在一个 USB 驱动器上从 [syslinux][9] 中 [链式加载][8] iPXE。

首先，下载 iPXE，并以它的 lkrn 格式构建。这应该作为一个工作站上的普通用户完成：

```
$ sudo dnf install -y git 
$ git clone http://git.ipxe.org/ipxe.git $HOME/ipxe 
$ sudo dnf groupinstall -y "C Development Tools and Libraries"
$ cd $HOME/ipxe/src 
$ make clean 
$ make bin/ipxe.lkrn 
$ cp bin/ipxe.lkrn /tmp
```

接下来，准备一个带有一个 MSDOS 分区表和一个 FAT32 文件系统的 USB 驱动器。下面的命令假设你已经连接将要格式化的 USB 驱动器。**注意：你要格式正确的驱动器！**

```
$ sudo -i 
# dnf install -y parted util-linux dosfstools 
# echo; find /dev/disk/by-id ! -regex '.*-part.*' -name 'usb-*' -exec readlink -f {} \; | xargs -i bash -c "parted -s {} unit MiB print | perl -0 -ne '/^Model: ([^(]*).*\n.*?([0-9]*MiB)/i && print \"Found: {} = \$2 \$1\n\"'"; echo; read -e -i "$(find /dev/disk/by-id ! -regex '.*-part.*' -name 'usb-*' -exec readlink -f {} \; -quit)" -p "Drive to format: " MY_USB
# umount $MY_USB? 
# wipefs -a $MY_USB 
# parted -s $MY_USB mklabel msdos mkpart primary fat32 1MiB 100% set 1 boot on 
# mkfs -t vfat -F 32 ${MY_USB}1
```

最后，在 USB 驱动器上安装并配置 syslinux ，来链式加载 iPXE：

```
# dnf install -y syslinux-nonlinux 
# syslinux -i ${MY_USB}1 
# dd if=/usr/share/syslinux/mbr.bin of=${MY_USB} 
# MY_MNT=$(mktemp -d) 
# mount ${MY_USB}1 $MY_MNT 
# MY_NAME=fc27 
# MY_SRVR=server-01.example.edu 
# MY_RVRS=$(echo $MY_SRVR | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_SRVR}) 
# cat << END > $MY_MNT/syslinux.cfg
ui menu.c32
default $MY_NAME
timeout 100
menu title SYSLINUX
label $MY_NAME
    menu label ${MY_NAME^^}
    kernel ipxe.lkrn
    append dhcp && sanboot iscsi:$MY_SRVR:::1:iqn.$MY_RVRS:$MY_NAME
END 
# cp /usr/share/syslinux/menu.c32 $MY_MNT 
# cp /usr/share/syslinux/libutil.c32 $MY_MNT 
# cp /tmp/ipxe.lkrn $MY_MNT 
# umount ${MY_USB}1
```

通过简单地编辑 `syslinux.cfg` 文件，并添加附加的菜单项，你应该能够使用这同一个 USB 驱动器来网络启动附加的 ISCSI 目标。

这仅是加载 IPXE 的一种方法。你可以直接在你的工作站上安装 syslinux 。再一种选项是编译 iPXE 为一个 EFI 可执行文件，并直接放置它到你的 [ESP][10] 中。又一种选项是编译 iPXE 为一个 PXE 加载器，并放置它到你的能够被 DHCP 引用的 TFTP 服务器。最佳的选项依赖于的环境

### 最后说明

* 如果你以 IPXE 的 EFI 格式编译 IPXE ，你可能想添加 `–filename \EFI\BOOT\grubx64.efi` 参数到 `sanboot` 命令。
* 能够创建自定义 live 镜像。更多信息参考[创建和使用 live CD][11]。
* 可以添加 `–overlay-size-mb` 和 `–home-size-mb` 参数到 `livecd-iso-to-disk` 命令来创建永久存储的 live 镜像。然而，如果你有多个并发用户，你将需要设置你的 ISCSI 服务器来管理独立的每个用户的可写覆盖。这与 “[如何构建一个网络启动服务器，部分 4][12]” 一文所示类似。
* Live 镜像在它们的内核命令行中支持一个 `persistenthome` 选项（例如， `persistenthome=LABEL=HOME`）。与经过 CHAP 身份验证的 iSCSI 目标一起使用，对于中心控制主目录，`persistenthome` 选项为 NFS 提供一个有趣的替代方案。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/netboot-a-fedora-live-cd/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Live_CD
[2]: https://en.wikipedia.org/wiki/Live_CD#Uses
[3]: https://en.wikipedia.org/wiki/ISCSI
[4]: https://ipxe.org/
[5]: https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/
[6]: http://ipxe.org/cmd/sanboot/
[7]: https://ipxe.org/appnote/buildtargets#boot_type
[8]: https://en.wikipedia.org/wiki/Chain_loading
[9]: https://www.syslinux.org/wiki/index.php?title=SYSLINUX
[10]: https://en.wikipedia.org/wiki/EFI_system_partition
[11]: https://docs.fedoraproject.org/en-US/quick-docs/creating-and-using-a-live-installation-image/#proc_creating-and-using-live-cd
[12]: https://fedoramagazine.org/how-to-build-a-netboot-server-part-4/

