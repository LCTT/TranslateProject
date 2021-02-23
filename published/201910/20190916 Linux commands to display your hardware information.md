[#]: collector: (lujun9972)
[#]: translator: (way-ww)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11422-1.html)
[#]: subject: (Linux commands to display your hardware information)
[#]: via: (https://opensource.com/article/19/9/linux-commands-hardware-information)
[#]: author: (Howard Fosdick https://opensource.com/users/howtechhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/seth)

用 Linux 命令显示硬件信息
======

> 通过命令行获取计算机硬件详细信息。

![](https://img.linux.net.cn/data/attachment/album/201910/04/120618q2k1fflrsy1bgbwp.jpg)

你可能会有很多的原因需要查清计算机硬件的详细信息。例如，你需要修复某些问题并在论坛上发出请求，人们可能会立即询问你的计算机具体的信息。或者当你想要升级计算机配置时，你需要知道现有的硬件型号和能够升级的型号。这些都需要查询你的计算机具体规格信息。

最简单的方法是使用标准的 Linux GUI 程序之一:

* [i-nex][2] 收集硬件信息，并且类似于 Windows 下流行的 [CPU-Z][3] 的显示。
* [HardInfo][4] 显示硬件具体信息，甚至包括一组八个的流行的性能基准程序，你可以用它们评估你的系统性能。
* [KInfoCenter][5] 和 [Lshw][6] 也能够显示硬件的详细信息，并且可以从许多软件仓库中获取。

或者，你也可以拆开计算机机箱去查看硬盘、内存和其他设备上的标签信息。或者你可以在系统启动时，按下[相应的按键][7]进入 UEFI 和 BIOS 界面获得信息。这两种方式都会向你显示硬件信息但省略软件信息。

你也可以使用命令行获取硬件信息。等一下… 这听起来有些困难。为什么你会要这样做？

有时候通过使用一条针对性强的命令可以很轻松的找到特定信息。也可能你没有可用的 GUI 程序或者只是不想安装这样的程序。

使用命令行的主要原因可能是编写脚本。无论你是使用 Linux shell 还是其他编程语言来编写脚本通常都需要使用命令行。

很多检测硬件信息的命令行都需要使用 root 权限。所以要么切换到 root 用户，要么使用 `sudo` 在普通用户状态下发出命令：

```
sudo <the_line_command> 
```

并按提示输入你的密码。

这篇文章介绍了很多用于发现系统信息的有用命令。文章最后的快速查询表对它们作出了总结。

### 硬件概述

下面几条命令可以全面概述计算机硬件信息。

`inxi` 命令能够列出包括 CPU、图形、音频、网络、驱动、分区、传感器等详细信息。当论坛里的人尝试帮助其他人解决问题的时候，他们常常询问此命令的输出。这是解决问题的标准诊断程序：

```
inxi -Fxz
```

`-F` 参数意味着你将得到完整的输出，`x` 增加细节信息，`z` 参数隐藏像 MAC 和 IP 等私人身份信息。

`hwinfo` 和 `lshw` 命令以不同的格式显示大量相同的信息：

```
hwinfo --short
```

或

```
lshw -short
```

这两条命令的长格式输出非常详细，但也有点难以阅读：

```
hwinfo
```

或

```
lshw
```

### CPU 详细信息

通过命令你可以了解关于你的 CPU 的任何信息。使用 `lscpu` 命令或与它相近的 `lshw` 命令查看 CPU 的详细信息：

```
lscpu
```

或

```
lshw -C cpu
```

在这两个例子中，输出的最后几行都列出了所有 CPU 的功能。你可以查看你的处理器是否支持特定的功能。

使用这些命令的时候，你可以通过使用 `grep` 命令过滤复杂的信息，并缩小所需信息范围。例如，只查看 CPU 品牌和型号:

```
lshw -C cpu | grep -i product
```

仅查看 CPU 的速度（兆赫兹）:

```
lscpu | grep -i mhz
```

或其 [BogoMips][8] 额定功率:

```
lscpu | grep -i bogo
```

`grep` 命令的 `-i` 参数代表搜索结果忽略大小写。

### 内存

Linux 命令行使你能够收集关于你的计算机内存的所有可能的详细信息。你甚至可以不拆开计算机机箱就能确定是否可以为计算机添加额外的内存条。

使用 `dmidecode` 命令列出每根内存条和其容量：

```
dmidecode -t memory | grep -i size
```

使用以下命令获取系统内存更多的信息，包括类型、容量、速度和电压：

```
lshw -short -C memory
```

你肯定想知道的一件事是你的计算机可以安装的最大内存：

```
dmidecode -t memory | grep -i max
```

现在检查一下计算机是否有空闲的插槽可以插入额外的内存条。你可以通过使用命令在不打开计算机机箱的情况下就做到：

```
lshw -short -C memory | grep -i empty
```

输出为空则意味着所有的插槽都在使用中。

确定你的计算机拥有多少显卡内存需要下面的命令。首先使用 `lspci` 列出所有设备信息然后过滤出你想要的显卡设备信息:

```
lspci | grep -i vga
```

视频控制器的设备号输出信息通常如下：

```
00:02.0 VGA compatible controller: Intel Corporation 82Q35 Express Integrated Graphics Controller (rev 02)
```

现在再加上视频设备号重新运行 `lspci` 命令：

```
lspci -v -s 00:02.0
```

输出信息中 `prefetchable` 那一行显示了系统中的显卡内存大小:

```
...
Memory at f0100000 (32-bit, non-prefetchable) [size=512K]
I/O ports at 1230 [size=8]
Memory at e0000000 (32-bit, prefetchable) [size=256M]
Memory at f0000000 (32-bit, non-prefetchable) [size=1M]
...
```

最后使用下面的命令展示当前内存使用量（兆字节）：

```
free -m
```

这条命令告诉你多少内存是空闲的，多少命令正在使用中以及交换内存的大小和是否正在使用。例如，输出信息如下：

```
              total        used        free     shared    buff/cache   available
Mem:          11891        1326        8877      212        1687       10077
Swap:          1999           0        1999
```

`top` 命令为你提供内存使用更加详细的信息。它显示了当前全部内存和 CPU 使用情况并按照进程 ID、用户 ID 及正在运行的命令细分。同时这条命令也是全屏输出:

```
top
```

### 磁盘文件系统和设备

你可以轻松确定有关磁盘、分区、文件系统和其他设备信息。

显示每个磁盘设备的描述信息：

```
lshw -short -C disk
```

通过以下命令获取任何指定的 SATA 磁盘详细信息，例如其型号、序列号以及支持的模式和扇区数量等：

```
hdparm -i /dev/sda
```

当然，如果需要的话你应该将 `sda` 替换成 `sdb` 或者其他设备号。

要列出所有磁盘及其分区和大小，请使用以下命令：

```
lsblk
```

使用以下命令获取更多有关扇区数量、大小、文件系统 ID 和 类型以及分区开始和结束扇区：

```
fdisk -l
```

要启动 Linux，你需要确定 [GRUB][9] 引导程序的可挂载分区。你可以使用 `blkid` 命令找到此信息。它列出了每个分区的唯一标识符（UUID）及其文件系统类型（例如 ext3 或 ext4）：

```
blkid
```

使用以下命令列出已挂载的文件系统和它们的挂载点，以及已用的空间和可用的空间（兆字节为单位）：

```
df -m
```

最后，你可以列出所有的 USB 和 PCI 总线以及其他设备的详细信息：

```
lsusb
```

或

```
lspci
```

### 网络

Linux 提供大量的网络相关命令，下面只是几个例子。

查看你的网卡硬件详细信息:

```
lshw -C network
```

`ifconfig` 是显示网络接口的传统命令：

```
ifconfig -a
```

但是现在很多人们使用：

```
ip link show
```

或

```
netstat -i
```

在阅读输出时，了解常见的网络缩写十分有用：

缩写 | 含义
---|---
`lo` | 回环接口
`eth0` 或 `enp*` | 以太网接口
`wlan0` | 无线网接口
`ppp0` | 点对点协议接口（由拨号调制解调器、PPTP VPN 连接或者 USB 调制解调器使用）
`vboxnet0` 或 `vmnet*` | 虚拟机网络接口

表中的星号是通配符，代表不同系统的任意字符。

使用以下命令显示默认网关和路由表：

```
ip route | column -t
```

或

```
netstat -r
```

### 软件

让我们以显示最底层软件详细信息的两条命令来结束。例如，如果你想知道是否安装了最新的固件该怎么办？这条命令显示了 UEFI 或 BIOS 的日期和版本:

```
dmidecode -t bios
```

内核版本是多少，以及它是 64 位的吗？网络主机名是什么？使用下面的命令查出结果：

```
uname -a
```

### 快速查询表

用途 | 命令
--- | ---
显示所有硬件信息 | `inxi -Fxz` 或 `hwinfo --short` 或 `lshw  -short`
CPU 信息 | `lscpu` 或 `lshw -C cpu`
显示 CPU 功能（例如 PAE、SSE2） | `lshw -C cpu | grep -i capabilities`
报告 CPU 位数 | `lshw -C cpu | grep -i width`
显示当前内存大小和配置 | `dmidecode -t memory | grep -i size` 或 `lshw -short -C memory`
显示硬件支持的最大内存 | `dmidecode -t memory | grep -i max`
确定是否有空闲内存插槽 | `lshw -short -C memory | grep -i empty`（输出为空表示没有可用插槽）
确定显卡内存数量 | `lspci | grep -i vga` 然后指定设备号再次使用；例如：`lspci -v -s 00:02.0` 显卡内存数量就是 `prefetchable` 的值
显示当前内存使用情况 | `free -m` 或 `top`
列出磁盘驱动器 | `lshw -short -C disk`
显示指定磁盘驱动器的详细信息 | `hdparm -i /dev/sda`（需要的话替换掉 `sda`）
列出磁盘和分区信息 | `lsblk`（简单） 或 `fdisk -l`（详细）
列出分区 ID（UUID）| `blkid` 
列出已挂载文件系统挂载点以及已用和可用空间 | `df -m`
列出 USB 设备 | `lsusb`
列出 PCI 设备 | `lspci`
显示网卡详细信息 | `lshw -C network`
显示网络接口 | `ifconfig -a` 或 `ip link show` 或 `netstat -i`
显示路由表 | `ip route | column -t` 或 `netstat -r`
显示 UEFI/BIOS 信息 | `dmidecode -t bios`
显示内核版本网络主机名等 | `uname -a`

你有喜欢的命令被我忽略掉的吗？请添加评论分享给大家。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-commands-hardware-information

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtechhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: http://sourceforge.net/projects/i-nex/
[3]: https://www.cpuid.com/softwares/cpu-z.html
[4]: http://sourceforge.net/projects/hardinfo.berlios/
[5]: https://userbase.kde.org/KInfoCenter
[6]: http://www.binarytides.com/linux-lshw-command/
[7]: http://www.disk-image.com/faq-bootmenu.htm
[8]: https://en.wikipedia.org/wiki/BogoMips
[9]: https://www.dedoimedo.com/computers/grub.html
