Linux 系统下查看硬件信息命令大全
================================================================================

![](https://maketecheasier-holisticmedia.netdna-ssl.com/assets/uploads/2015/12/hdd_info_featured-1.png)

有许多命令可以用来查看 Linux 系统上的硬件信息。有些命令只能够打印出像 CPU 和内存这一特定的硬件组件信息，另外一些命令可以查看多种硬件组件的信息。

这个教程可以带大家快速了解一下查看各种硬件设备的信息和配置详情的最常用的命令。

### lscpu ###

`lscpu`命令能够查看 CPU 和处理单元的信息。该命令没有任何其他选项或者别的功能。

    lscpu

运行该命令会看到下面输出：

![hdd_info_lscpu](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lscpu.png)

### lspci ###

`lspci`是另一个命令行工具，可以用来列出所有的 PCI 总线，还有与 PCI 总线相连的设备的详细信息，比如 VGA 适配器、显卡、网络适配器、usb 端口、SATA 控制器等。

    lspci

你可以看到类似下图的输出信息。

![hdd_info_lspci](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lspci-1.png)

可以通过运行下面的命令来过滤出特定设备的信息：

    lspci -v | grep "VGA" -A 12

运行上面的命令可以看到类似下图的关于显卡的信息。

![hdd_info_lspci_vga](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lspci_vga.png)

### lshw ###

`lshw`是一个通用的工具，可以列出多种硬件单元的详细或者概要的信息，比如 CPU、内存、usb 控制器、硬盘等。`lshw`能够从各个“/proc”文件中提取出相关的信息。

    lshw -short

通过运行上面的命令可以看到下面的信息。

![hdd_info_lshw](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lshw.png)

### lsscsi ###

通过运行下面的命令可以列出像硬盘和光驱等 scsi/sata 设备的信息：

    lsscsi

会得到类似下面的输出。

![hdd_info_lsscsi](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lsscsi-1.png)

### lsusb ###

`lsusb`命令能够列出 USB 控制器和与 USB 控制器相连的设备的详细信息。默认情况下，`lsusb`命令只打印出概要信息。可以通过使用-v参数打印每一个usb端口的详细信息。

    lsusb

可以看到下面输出。

![hdd_info_lsusb](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lsusb.png)

### Inxi ###

`Inxi`是一个 bash 脚本，能够从系统的多个来源和命令获取硬件信息，并打印出一个非技术人员也能看懂的友好的报告。

默认情况下，Ubuntu 上没有安装`inxi`。可以通过运行下面命令来安装`Inxi`：

    sudo apt-get install inxi

安装完`Inxi`之后，通过运行下面命令能够得到硬件相关的信息：

    inxi -Fx

能够得到类似下图的输出。

![hdd_info_inxi](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_inxi.jpg)

### df ###

`df`命令能够列出不同分区的概要信息、挂载点、已用的和可用的空间。

可以在使用`df`命令的时候加上`-H`参数。

    df -H

会得到下面的输出。

![hdd_info_df](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_df-1.png)

### Free ###

通过使用`free`命令可以查看系统中使用的、闲置的和 RAM 的总体数量。

    free -m

会看到下面输出。

![hdd_info_free](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_free.png)

### Dmidecode ###

`dmidecode`命令与其他命令不同。该命令是从硬件中的 DMI 表中读取信息的。

要查看处理器的信息，运行下面命令：

    sudo dmidecode -t processor

![hdd_info_dmi_processor](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_processor.jpg)

要查看内存的信息，运行下面命令：

    sudo dmidecode -t memory

![hdd_info_dmi_memory](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_memory.png)

要查看 bios 的信息，运行下面命令：

    sudo dmidecode -t bios

![hdd_info_dmi_bios](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_bios.png)

### Hdparm ###

`hdparm`命令可以用来显示像硬盘这样的 sata 设备的信息。

    sudo hdparm

可以看到下面的输出。

![hdd_info_hdparm](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_hdparm.png)

### 总结 ###

每个命令都有不同的方式来获取硬件的信息。在查看特定的硬件信息的时候，可以尝试使用不同的方式。上面所有的命令行工具在大部分的 Linux 发行版本中都是可以使用的，可以很容易的从仓库中获取安装。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/check-hardware-information-linux/

作者：[Hitesh Jethva][a]
译者：[sonofelice](https://github.com/sonofelice)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
