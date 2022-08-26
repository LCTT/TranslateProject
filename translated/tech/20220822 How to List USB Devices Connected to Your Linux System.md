[#]: subject: "How to List USB Devices Connected to Your Linux System"
[#]: via: "https://itsfoss.com/list-usb-devices-linux/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何列出连接到 Linux 系统的 USB 设备
======
你如何列出 Linux 中的 USB 设备？

这个问题可以有两种含义。

* 你的系统上有（检测到）多少个 USB 端口？
* 系统安装（插入）了多少个 USB 设备/磁盘？

大多数情况下，人们有兴趣了解哪些 USB 设备连接到系统。这可能有助于对 USB 设备进行故障排除。

最可靠的方法是使用这个命令：

```
lsusb
```

它显示了网络摄像头、蓝牙和以太网端口以及 USB 端口和挂载的 USB 驱动器。

![list usb with lsusb command linux][1]

但是了解 lsusb 的输出并不容易，当你只想查看和访问已挂载的 USB 驱动器时，你可能不需要复杂化。

我将向你展示可用于列出连接到系统的 USB 设备的各种工具和命令。

除非另有说明，我在例子中连接了一个 2GB 的 U 盘、1TB 的外置硬盘、通过 MTP 连接的 Android 智能手机和 USB 鼠标。

让我从桌面用户最简单的选项开始。

### 以图形方式检查连接的 USB 设备

你的分发文件管理器可用于查看连接到你的计算机的 USB 存储设备。正如你在下面的 Nautilus（GNOME 文件管理器）的截图中看到的那样。
The connected devices are shown in the sidebar (Only USB Storage devices are shown here).
连接的设备显示在边栏中（此处仅显示 USB 存储设备）。

![Nautilus showing connected USB devices][2]

你还可以使用 GNOME Disks 或 Gparted 等 GUI 应用来查看、格式化和分区连接到计算机的 USB 存储设备。默认情况下，大多数使用 GNOME 桌面环境的发行版都预装了 GNOME Disks。

这个应用也可以作为一个非常好的[分区管理器][3]。

![Use GNOME Disks to list mounted USB devices][4]

*图形工具足够了*。让我们讨论可用于列出 USB 设备的命令。

### 使用 mount 命令列出挂载的 USB 设备

mount 命令用于挂载 Linux 中的分区。你还可以使用相同的命令列出 USB 存储设备。

通常，USB 存储挂载在 media 目录中。因此，在媒体上过滤 mount 命令的输出将为你提供所需的结果。

```
mount | grep media
```

![][5]

### 使用 df 命令

[df 命令][6]是一个标准的 UNIX 命令，用于了解可用磁盘空间的大小。你还可以使用此命令列出已连接的 USB 存储设备。

```
df -Th | grep media
```

![Use df command to list mounted USB drives][7]

### 使用 lsblk 命令

lsblk 命令用于列出终端中的块设备。因此，这里也通过过滤包含 media 关键字的输出，你可以获得所需的结果，如下面的截图所示。

```
lsblk | grep media
```

![Using lsblk to list connected USb devicesUsing blkid to list connected USb devices][8]

如果你比较好奇，可以使用 `blkid` 命令了解 UUID、标签、块大小等。

此命令提供更多输出，因为你的内部驱动器也被列出。因此，你必须参考上述命令来识别你希望了解的设备。

```
sudo blkid
```

![Using blkid to list connected USb devices][9]

### 使用 fdisk

fdisk 是一款不错的老式命令行分区管理器，它还可以列出连接到你计算机的 USB 存储设备。这个命令的输出也很长。因此，通常连接的设备会列在底部，如下所示。

```
sudo fdisk -l
```

![Use fidsk to list usb devices][10]

### 检查 /proc/mounts

通过检查 /proc/mounts 文件，你可以列出 USB 存储设备。如你所见，它向你显示了文件系统使用的挂载选项以及挂载点。

```
cat /proc/mounts | grep media
```

![][11]

### 使用 lsusb 命令显示所有 USB 设备

我们重新审视有名的 lsusb 命令。

Linux 内核开发人员 [Greg Kroah-Hartman][12] 开发了这个方便的 [usbutils][13] 程序。这为我们提供了两个命令，即 `lsusb` 和 `usb-devices` 来列出 Linux 中的 USB 设备。

lsusb 命令列出系统中有关 USB 总线的所有信息。

```
lsusb
```

如你所见，此命令还显示了我已连接的鼠标和智能手机，这与其他命令（只能列出 USB 存储设备）不同。

![][14]

第二个命令 `usb-devices` 提供了更多详细信息，但未能列出所有设备，如下所示。

```
usb-devices
```

![][15]

Greg 还开发了一个名为 [Usbview][16] 的小型 GTK 应用。此应用向你显示连接到计算机的所有 USB 设备的列表。

该应用可在大多数 Linux 发行版的官方仓库中找到。你可以使用发行版的[包管理器][17]轻松安装 `usbview` 包。

安装后，你可以从应用菜单启动它。你可以选择任何列出的设备以获取详细信息，如下面的截图所示。

![][18]

### 总结

列出的大多数方法仅限于 USB 存储设备。 只有两种方法可以列出其他外围设备； usbview 和 usbutils。 我想我们还有一个理由感谢 Linux Kernel 开发人员 Greg 开发了这些方便的工具。

我知道还有很多方法可以列出连接到系统的 USB 设备。 欢迎你提出建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/list-usb-devices-linux/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/08/list-usb-with-lsusb-command-linux.png
[2]: https://itsfoss.com/wp-content/uploads/2022/08/nautilus-usb.png
[3]: https://itsfoss.com/partition-managers-linux/
[4]: https://itsfoss.com/wp-content/uploads/2022/08/gnome-disks-usb.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/mount-cmd-usb.png
[6]: https://linuxhandbook.com/df-command/
[7]: https://itsfoss.com/wp-content/uploads/2022/08/df-cmd-usb.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/blkid-cmd-usb.png
[9]: https://itsfoss.com/wp-content/uploads/2022/08/blkid-cmd-usb.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/fdisk-cmd-usb.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/proc-dir-usb.png
[12]: https://en.wikipedia.org/wiki/Greg_Kroah-Hartman
[13]: https://github.com/gregkh/usbutils
[14]: https://itsfoss.com/wp-content/uploads/2022/08/lsusb-cmd.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/usb-devices-cmd.png
[16]: https://github.com/gregkh/usbview
[17]: https://itsfoss.com/package-manager/
[18]: https://itsfoss.com/wp-content/uploads/2022/08/usbview.png
