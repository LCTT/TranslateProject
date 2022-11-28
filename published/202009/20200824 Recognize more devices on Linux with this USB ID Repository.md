[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12612-1.html)
[#]: subject: (Recognize more devices on Linux with this USB ID Repository)
[#]: via: (https://opensource.com/article/20/8/usb-id-repository)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

利用这个 USB ID 仓库识别更多 Linux 上的设备
======

> 这是一个包含了所有已知 USB 设备 ID 的开源项目。

![](https://img.linux.net.cn/data/attachment/album/202009/13/225426zpfbfopxhjxomuxf.jpg)

市场上有成千上万的 USB 设备：键盘、扫描仪、打印机、鼠标和其他无数的设备，都能在 Linux 上工作。它们的供应商详情都存储在 USB ID 仓库中。

### lsusb

Linux `lsusb` 命令列出了连接到系统的 USB 设备的信息，但有时信息不完整。例如，我最近注意到我的一个 USB 设备的品牌没有被识别。设备是可以使用的，但是在列出我所连接的 USB 设备的详情中没有提供任何识别信息。以下是我的 `lsusb` 命令的输出：

```
$ lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 046d:082c Logitech, Inc.
Bus 001 Device 003: ID 0951:16d2 Kingston Technology
Bus 001 Device 002: ID 18f8:1486  
Bus 001 Device 005: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

正如你在最后一栏中看到的，有一个设备没有制造商描述。要确定这个设备是什么，我必须对我的 USB 设备树进行更深入的检查。幸运的是，`lsusb` 命令有更多的选项。其中一个选项是 `-D device`，来获取每个设备的详细信息，正如手册页面所解释的那样：

> “不会扫描 `/dev/bus/usb` 目录，而只显示给定设备文件所属设备的信息。设备文件应该是类似 `/dev/bus/usb/001/001` 这样的文件。这个选项会像 `v` 选项一样显示详细信息，但你必须是 root 用户才行。"

我认为如何将设备路径传递给 `lsusb` 命令并不容易，但在仔细阅读手册页和初始输出后，我能够确定如何构造它。USB 设备驻留在 UDEV 文件系统中。它们的设备路径始于 USB 设备目录 `/dev/bus/usb/`。路径的其余部分由设备的总线 ID 和设备 ID 组成。我的无描述设备是 `Bus 001 Device 002`，被翻译成了 `001/002`，完成的路径为 `/dev/bus/usb/001/002`。现在我可以把这个路径传给 `lsusb`。我还会用管道传给 `more`，因为这里往往有很多信息：

```
$ lsusb -D /dev/bus/usb/001/002 |more
Device: ID 18f8:1486  
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x18f8
  idProduct          0x1486
  bcdDevice            1.00
  iManufacturer           0
  iProduct                1
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           59
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              0
        HID Device Descriptor:
```

不幸的是，这里并没有提供我希望找到的细节。初始输出中出现的两个字段 `idVendor` 和 `idProduct` 都是空的。这有些帮助，因为往下看一下，就会发现 `Mouse` 这个词。所以，这个设备就是我的鼠标。

### USB ID 仓库

这让我不禁想知道如何才能填充这些字段，不仅是为了自己，也是为了其他 Linux 用户。原来已经有了一个开源项目：[USB ID 仓库][2]。它是一个公共仓库，它包含了 USB 设备中使用的所有已知 ID。它也被用于各种程序中，包括 [USB Utilities][3]，用于显示人类可读的设备名称。

![The USB ID Repository Site][4]

你可以从网站上或通过下载数据库来浏览特定设备的仓库。也欢迎用户提交新的数据。我要为我的鼠标提交数据，因为它没有在里面。

### 更新你的 USB ID

USB ID 数据库存储在一个名为 `usb.ids` 的文件中。这个文件的位置可能会因 Linux 发行版的不同而不同。

在 Ubuntu 18.04 中，这个文件位于 `/var/lib/usbutils`。要更新数据库，使用命令 `update-usbids`，你需要用 root 权限或 `sudo` 来运行。

```
$ sudo update-usbids
```

如果有新文件，它就会被下载。当前的文件将被备份，并被替换为新文件：

```
$ ls -la
total 1148
drwxr-xr-x  2 root root   4096 Jan 15 00:34 .
drwxr-xr-x 85 root root   4096 Nov  7 08:05 ..
-rw-r--r--  1 root root 614379 Jan  9 15:34 usb.ids
-rw-r--r--  1 root root 551472 Jan 15 00:34 usb.ids.old
```

最新版本的 Fedora Linux 将数据库文件保存在 `/usr/share/hwdata` 中。而且，没有更新脚本。而是，数据库由一个名为 `hwdata` 的软件包维护。

```
# dnf info hwdata

Installed Packages
Name         : hwdata
Version      : 0.332
Release      : 1.fc31
Architecture : noarch
Size         : 7.5 M
Source       : hwdata-0.332-1.fc31.src.rpm
Repository   : @System
From repo    : updates
Summary      : Hardware identification and configuration data
URL          : https://github.com/vcrhonek/hwdata
License      : GPLv2+
Description  : hwdata contains various hardware identification and configuration data,
             : such as the pci.ids and usb.ids databases.
```

现在我的 USB 设备列表在这个之前未命名的设备旁边显示了一个名字。比较一下上面的输出：

```
$ lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 046d:082c Logitech, Inc. HD Webcam C615
Bus 001 Device 003: ID 0951:16d2 Kingston Technology
Bus 001 Device 014: ID 18f8:1486 [Maxxter]
Bus 001 Device 005: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

你可能会注意到，随着仓库定期更新新设备和现有设备的详细信息，其他设备的描述也会发生变化。

### 提交新数据

提交新数据有两种方式：使用网站或通过电子邮件发送特殊格式的补丁文件。在开始之前，我阅读了提交指南。首先，我必须注册一个账户，然后我需要使用项目的提交系统提供我鼠标的 ID 和名称。添加任何 USB 设备的过程都是一样的。

你使用过 USB ID 仓库么？如果有，请在评论中分享你的反馈。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/usb-id-repository

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/usb-hardware.png?itok=ROPtNZ5V (Multiple USB plugs in different colors)
[2]: http://www.linux-usb.org/usb-ids.html
[3]: https://sourceforge.net/projects/linux-usb/files/
[4]: https://opensource.com/sites/default/files/uploads/theusbidrepositorysite.png (The USB ID Repository Site)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
