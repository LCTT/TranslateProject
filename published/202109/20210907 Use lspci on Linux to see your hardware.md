[#]: subject: "Use lspci on Linux to see your hardware"
[#]: via: "https://opensource.com/article/21/9/lspci-linux-hardware"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13793-1.html"

在 Linux 上使用 lspci 命令查看硬件情况
======

> lspci 命令用于显示 Linux 系统上的设备和驱动程序。

![](https://img.linux.net.cn/data/attachment/album/202109/17/091425l7c8au5c865x7q68.jpg)

当你在个人电脑或服务器上运行 Linux 时，有时需要识别该系统中的硬件。`lspci` 命令用于显示连接到 PCI 总线的所有设备，从而满足上述需求。该命令由 [pciutils][2] 包提供，可用于各种基于 Linux 和 BSD 的操作系统。

### 基础用法

由于访问权限，普通用户运行 `lspci` 时显示的信息可能会受限，因此可以使用 `sudo` 运行命令，系统会给出完整的信息图。

直接运行 `lspci` 命令会列出 PCI 总线及其连接的设备，下图是在我的媒体中心 PC 上的演示样例。图中是一个基于 AMD Phenom CPU 的系统，所以它有一个 AMD 芯片组，以及 Atheros 无线适配器和 Nvidia 显卡。所有硬件设备都列出了详细信息，例如供应商、名称和型号等：

```
$ sudo lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] RS880 Host Bridge
00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] RS780 PCI to PCI bridge (ext gfx port 0)
00:04.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] RS780/RS880 PCI to PCI bridge (PCIE port 0)
00:05.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] RS780/RS880 PCI to PCI bridge (PCIE port 1)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 SATA Controller [AHCI mode]
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:12.1 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0 USB OHCI1 Controller
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller
00:13.1 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0 USB OHCI1 Controller
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller (rev 3c)
00:14.1 IDE interface: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 IDE Controller
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 LPC host controller
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI Bridge
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI2 Controller
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor HyperTransport Configuration
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Address Map
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor DRAM Controller
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Miscellaneous Control
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Link Control
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GTX 650] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GK107 HDMI Audio Controller (rev a1)
02:00.0 Network controller: Qualcomm Atheros AR9287 Wireless Network Adapter (PCI-Express) (rev 01)
```

### 详细输出

添加 `-v` 选项会显示每个设备的详细信息，你可以使用 `-vv` 或 `-vvv` 来获取更多的设备细节。在 `-v` 级别，`lspci` 会显示所有设备的各种子系统和内存地址、中断请求（IRQ）编号和一些其他功能信息。输出信息会非常长。在你的系统上试一试吧。

### 使用 grep 过滤搜索

你可能会需要缩小搜索范围。例如，RPM Fusion 网站有安装 Nvidia 图形驱动程序的说明，里面就首先使用了 `grep` 命令来定位显卡信息。下面是我在笔记本电脑上得到的输出：

```
$ sudo lspci | grep -e VGA
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 620 (rev 07)
$ sudo lspci | grep -e 3D
01:00.0 3D controller: NVIDIA Corporation GM108M [GeForce MX130] (rev a2)
```

下面（LCTT 译注：原文为 “above”，应为作者笔误）的 `grep` 命令在我的媒体中心 PC 上定位了一个 VGA 设备，但没有显示 3D 设备。

```
$ sudo lspci | grep -e VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GTX 650] (rev a1)
$ sudo lspci | grep -e 3D
$
```

### 按供应商 ID 搜索

还有另一种无需 `grep` 的方法可以使用。假设我想确认一下此计算机是否有其他的 Nvidia 设备，在此之前我们还需要一些额外信息，使用 `-nn` 选项显示的供应商和设备 ID 号。在我的媒体中心 PC 上，此选项会给出我的 VGA 卡、供应商 ID 和设备 ID：

```
$ sudo lspci -nn | grep -e VGA
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce GTX 650] [10de:0fc6] (rev a1)
```

设备名称后的方括号内有用冒号分隔的数字，即供应商和设备 ID。输出表明 Nvidia Corporation 制造的设备的供应商 ID 为 `10de`。

`-d` 选项用于指定供应商、设备或类 ID 的所有设备。以下是我系统中的所有 Nvidia 设备（保留 `-nn` 以解析供应商 ID）：

```
$ sudo lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce GTX 650] [10de:0fc6] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GK107 HDMI Audio Controller [10de:0e1b] (rev a1)
```

从输出中可以看到，除了显卡之外，我还有一个 Nvidia 音频设备。实际上它们都属于同一张 **Nvidia GeForce GTX 650** 卡，但这仍然是一个很好的示例。

### 内核模块

结合 PCI 硬件设备，`lspci` 可以使用 `-k` 选项显示内核加载了哪些驱动程序模块。我将此选项添加到我的 `lspci` 命令来查看有关我的 Nvidia 设备的信息。

```
$ sudo lspci -nn -k -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce GTX 650] [10de:0fc6] (rev a1)
 Subsystem: eVga.com. Corp. GK107 [GeForce GTX 650] [3842:2650]
 Kernel driver in use: nvidia
 Kernel modules: nvidiafb, nouveau, nvidia_drm, nvidia
01:00.1 Audio device [0403]: NVIDIA Corporation GK107 HDMI Audio Controller [10de:0e1b] (rev a1)
 Subsystem: eVga.com. Corp. GK107 HDMI Audio Controller [3842:2650]
 Kernel driver in use: snd_hda_intel
 Kernel modules: snd_hda_intel
```

可以看到额外显示了两行：<ruby>正在使用的内核驱动程序<rt>Kernel driver in use</rt></ruby> 和 <ruby>内核模块<rt>Kernel modules</rt></ruby>，其中后者列出了可用于支持该设备的模块。

### 同步最新状态

新设备和供应商总是在不断迭代。如果看到显示为 `unknown` 的设备，说明你的 PCI 设备 ID 数据库可能已过时。有两种方法可以检查更新。`-Q` 选项会使用 DNS 查询中央数据库，当然，这需要联网。

```
$ sudo lspci -Q
```

你还可以通过运行命令 `update-pciids` 来更新本地 PCI ID 数据库。

```
$ sudo update-pciids
Downloaded daily snapshot dated 2021-08-22 03:15:01
```

### 了解有关你的硬件的更多信息

当然，`lspci` 只是 Linux 中用于查询系统硬件和软件的诸多命令之一。读者可以在阅读关于 USB 设备的文章，了解有关 Linux 硬件的更多信息：[使用此 USB ID 存储库识别 Linux 上的更多设备][3]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/lspci-linux-hardware

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: https://mj.ucw.cz/sw/pciutils/
[3]: https://opensource.com/article/20/8/usb-id-repository
