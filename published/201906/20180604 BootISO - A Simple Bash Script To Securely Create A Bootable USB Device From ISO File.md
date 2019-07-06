BootISO：从 ISO 文件中创建一个可启动的 USB 设备
======

![](https://img.linux.net.cn/data/attachment/album/201906/16/110109qq0b7atyaped3ij2.jpg)

为了安装操作系统，我们中的大多数人（包括我）经常从 ISO 文件中创建一个可启动的 USB 设备。为达到这个目的，在 Linux 中有很多自由可用的应用程序。甚至在过去我们写了几篇介绍这种实用程序的文章。

每个人使用不同的应用程序，每个应用程序有它们自己的特色和功能。在这些应用程序中，一些应用程序属于 CLI 程序，一些应用程序则是 GUI 的。

今天，我们将讨论名为 BootISO 的实用程序类似工具。它是一个简单的 bash 脚本，允许用户来从 ISO 文件中创建一个可启动的 USB 设备。

很多 Linux 管理员使用 `dd` 命令开创建可启动的 ISO ，它是一个著名的原生方法，但是与此同时，它也是一个非常危险的命令。因此，小心，当你用 `dd` 命令执行一些动作时。

建议阅读：

- [Etcher：从一个 ISO 镜像中创建一个可启动的 USB 驱动器 & SD 卡的简单方法][1]
- [在 Linux 上使用 dd 命令来从一个 ISO 镜像中创建一个可启动的 USB 驱动器][2]

### BootISO 是什么

[BootISO][3] 是一个简单的 bash 脚本，允许用户来安全的从一个 ISO 文件中创建一个可启动的 USB 设备，它是用 bash 编写的。

它不提供任何图形用户界面而是提供了大量的选项，可以让初学者顺利地在 Linux 上来创建一个可启动的 USB 设备。因为它是一个智能工具，能自动地选择连接到系统上的 USB 设备。

当系统有多个 USB 设备连接，它将打印出列表。当你手动选择了另一个硬盘而不是 USB 时，在这种情况下，它将安全地退出，而不会在硬盘上写入任何东西。

这个脚本也将检查依赖关系，并提示用户安装，它可以与所有的软件包管理器一起工作，例如 apt-get、yum、dnf、pacman 和 zypper。

### BootISO 的功能

  * 它检查选择的 ISO 是否是正确的 mime 类型。如果不是，那么退出。
  * 如果你选择除 USB 设备以外的任何其它的磁盘（本地硬盘），BootISO 将自动地退出。
  * 当你有多个驱动器时，BootISO 允许用户选择想要使用的 USB 驱动器。
  * 在擦除和分区 USB 设备前，BootISO 会提示用户确认。
  * BootISO 将正确地处理来自一个命令的任何错误，并退出。
  * BootISO 在遇到问题退出时将调用一个清理例行程序。

### 如何在 Linux 中安装 BootISO

在 Linux 中安装 BootISO 有几个可用的方法，但是，我建议用户使用下面的方法安装。

```
$ curl -L https://git.io/bootiso -O
$ chmod +x bootiso
$ sudo mv bootiso /usr/local/bin/
```

一旦 BootISO 已经安装，运行下面的命令来列出可用的 USB 设备。

```
$ bootiso -l

Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE   TYPE
sdd  1       32G  running disk
```

如果你仅有一个 USB 设备，那么简单地运行下面的命令来从一个 ISO 文件中创建一个可启动的 USB 设备。

```
$ bootiso /path/to/iso file
```

```
$ bootiso /opt/iso_images/archlinux-2018.05.01-x86_64.iso
Granting root privileges for bootiso.
Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE   TYPE
sdd  1       32G  running disk
Autoselecting `sdd' (only USB device candidate)
The selected device `/dev/sdd' is connected through USB.
Created ISO mount point at `/tmp/iso.vXo'
`bootiso' is about to wipe out the content of device `/dev/sdd'.
Are you sure you want to proceed? (y/n)>y
Erasing contents of /dev/sdd...
Creating FAT32 partition on `/dev/sdd1'...
Created USB device mount point at `/tmp/usb.0j5'
Copying files from ISO to USB device with `rsync' 
Synchronizing writes on device `/dev/sdd' 
`bootiso' took 250 seconds to write ISO to USB device with `rsync' method.
ISO succesfully unmounted.
USB device succesfully unmounted.
USB device succesfully ejected.
You can safely remove it !
```

当你有多个 USB 设备时，可以使用 `--device` 选项指明你的设备名称。

```
$ bootiso -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso
```

默认情况下，BootISO 使用 `rsync` 命令来执行所有的动作，如果你想使用 `dd` 命令代替它，使用下面的格式。

```
$ bootiso --dd -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso
```

如果你想跳过 mime 类型检查，BootISO 实用程序带有下面的选项。

```
$ bootiso --no-mime-check -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso
```

为 BootISO 添加下面的选项来跳过在擦除和分区 USB 设备前的用户确认。

```
$ bootiso -y -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso
```

连同 `-y` 选项一起，启用自动选择 USB 设备。

```
$ bootiso -y -a /opt/iso_images/archlinux-2018.05.01-x86_64.iso
```

为知道更多的 BootISO 选项，运行下面的命令。

```
$ bootiso -h
Create a bootable USB from any ISO securely.
Usage: bootiso [...] 

Options

-h, --help, help             Display this help message and exit.
-v, --version                Display version and exit.
-d, --device         Select  block file as USB device.
                             If  is not connected through USB, `bootiso' will fail and exit.
                             Device block files are usually situated in /dev/sXX or /dev/hXX.
                             You will be prompted to select a device if you don't use this option.
-b, --bootloader             Install a bootloader with syslinux (safe mode) for non-hybrid ISOs. Does not work with `--dd' option.
-y, --assume-yes             `bootiso' won't prompt the user for confirmation before erasing and partitioning USB device.
                             Use at your own risks.
-a, --autoselect             Enable autoselecting USB devices in conjunction with -y option.
                             Autoselect will automatically select a USB drive device if there is exactly one connected to the system.
                             Enabled by default when neither -d nor --no-usb-check options are given.
-J, --no-eject               Do not eject device after unmounting.
-l, --list-usb-drives        List available USB drives.
-M, --no-mime-check          `bootiso' won't assert that selected ISO file has the right mime-type.
-s, --strict-mime-check      Disallow loose application/octet-stream mime type in ISO file.
--                           POSIX end of options.
--dd                         Use `dd' utility instead of mounting + `rsync'.
                             Does not allow bootloader installation with syslinux.
--no-usb-check               `bootiso' won't assert that selected device is a USB (connected through USB bus).
                             Use at your own risks.

Readme

    Bootiso v2.5.2.
    Author: Jules Samuel Randolph
    Bugs and new features: https://github.com/jsamr/bootiso/issues
    If you like bootiso, please help the community by making it visible:
    * star the project at https://github.com/jsamr/bootiso
    * upvote those SE post: https://goo.gl/BNRmvm https://goo.gl/YDBvFe
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bootiso-a-simple-bash-script-to-securely-create-a-bootable-usb-device-in-linux-from-iso-file/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/etcher-easy-way-to-create-a-bootable-usb-drive-sd-card-from-an-iso-image-on-linux/
[2]:https://www.2daygeek.com/create-a-bootable-usb-drive-from-an-iso-image-using-dd-command-on-linux/
[3]:https://github.com/jsamr/bootiso
