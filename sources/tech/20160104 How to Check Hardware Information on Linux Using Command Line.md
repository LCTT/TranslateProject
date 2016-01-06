sonofelice translating
Linux系统下使用命令行来查看硬件信息
How to Check Hardware Information on Linux Using Command Line
================================================================================
![](https://maketecheasier-holisticmedia.netdna-ssl.com/assets/uploads/2015/12/hdd_info_featured-1.png)

有许多可用的命令可以用来查看Linux系统上的硬件信息。有些命令只能够打印出像CPU和内存这一特定的硬件组件信息，其余的命令可以查看其余硬件单元的信息。

There are many commands available to check hardware information of your Linux system. Some commands report only specific hardware components like CPU or memory while the rest cover multiple hardware units.

这个教程可以带大家快速学习一下核查各种硬件设备的信息和配置详情的最常用的命令。

This tutorial takes a quick look at some of the most commonly used commands to check information and configuration details about various hardware devices.
### lscpu ###

`lscpu`命令能够查看CPU和处理单元的信息。该命令没有任何其他选项或者别的功能。
The `lscpu` command gives you information about the CPU and processing units. It does not have any other options or functionality.

    lscpu

运行该命令会看到下面输出：
You will see the following output by running the above command.

![hdd_info_lscpu](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lscpu.png)

### lspci ###

`lspci`是另一个命令行工具，可以用来列出所有的PCI总线，还有与PCI总线相连的设备的详细信息，比如VGA适配器、显卡、网络适配器、usb端口、SATA控制器等。
The lspci is another command line tool that lists all the PCI buses and details about the devices connected to them like VGA adapter, graphics card, network adapter, usb ports, SATA controller, etc.

    lspci

你可以看到类似下图的输出信息。
You will see an output similar to the following image.

![hdd_info_lspci](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lspci-1.png)

可以通过运行下面的命令来过滤出特定的设备的信息。
You can also filter out specific device information by running the following command:

    lspci -v | grep "VGA" -A 12

运行上面的命令可以看到类似下图的关于显卡的信息。
You will see graphics card information similar to the following.

![hdd_info_lspci_vga](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lspci_vga.png)

### lshw ###

`lshw`是一个通用的工具，可以列出多种硬件单元的详细或者概要的信息，比如CPU、内存、usb控制器、硬盘等。`lshw`能够从不同的“/proc”文件中提取出相关的信息。
The `lshw` is a general purpose utility that reports detailed and brief information about multiple hardware units like CPU, memory, usb controller, disk, etc. Lshw extracts the information from different “/proc” files.

    lshw -short

通过运行上面的命令可以看到下面的信息。
You will see the following information by running the above command.

![hdd_info_lshw](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lshw.png)

### lsscsi ###

通过运行下面的命令可以列出像硬盘和光驱等scsi/sata设备的信息：
You can list all scsi/sata devices like hard drives and optical drives by running the following command:

    lsscsi

会得到类似下面的输出。
The output wI’ll look something like this image.

![hdd_info_lsscsi](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lsscsi-1.png)

### lsusb ###

`lsusb`命令能够列出USB控制器和与USB控制相连的设备的详细信息。默认情况下，`lsusb`命令只打印出概要信息。可以通过使用-v参数打印每一个usb端口的详细信息。
This command shows you the USB controllers and details about devices connected to them. By default, the lsusb command prints brief information. You can also use the verbose option -v to print detailed information about each usb port.

    lsusb

可以看到下面输出。
You will see the following output.

![hdd_info_lsusb](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_lsusb.png)

### Inxi ###

`Inxi`是一个bash脚本，能够从系统的多个源文件和命令行抓取硬件信息，并打印出一个非技术人员也能看懂的友好的报告。
`Inxi` is a bash script that fetches hardware information from multiple sources and commands on the system and gives you goodlooking reports that non-technical users can read easily.

默认情况下，Ubuntu上没有安装`inxi`。可以通过运行下面命令来安装`Inxi`：
By default, `inxi` is not installed in Ubuntu. You can install it by running the following command:

    sudo apt-get install inxi

安装完`Inxi`之后，通过运行下面命令能够得到硬件相关的信息：
After installing inxi, you can get hardware information by running the following command:

    inxi -Fx

能够得到类似下图的输出。
You will see an output similar to the image below.

![hdd_info_inxi](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_inxi.jpg)

### df ###

This command gives you brief information about various partitions, their mount points and the used and available space on each.
可以在使用`df`命令的时候加上`-H`参数。
You can run the `df` command with the `-H` parameter.

    df -H

会得到下面的输出。
You will see the following output.

![hdd_info_df](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_df-1.png)

### Free ###

You can check the amount of used, free and total amount of RAM on your system with the free command.

    free -m

You will see the following output.

![hdd_info_free](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_free.png)

### Dmidecode ###

The `dmidecode` command is different from all other commands. It extracts hardware information by reading data from the DMI tables.

To display information about the processor, run:

    sudo dmidecode -t processor

![hdd_info_dmi_processor](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_processor.jpg)

To display information about the memory, run:

    sudo dmidecode -t memory

![hdd_info_dmi_memory](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_memory.png)

To display information about the bios, run:

    sudo dmidecode -t bios

![hdd_info_dmi_bios](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_dmi_bios.png)

### Hdparm ###

The hdparm command gives you information about sata devices like hard disks.

    sudo hdparm

You will see the following output.

![hdd_info_hdparm](https://www.maketecheasier.com/assets/uploads/2015/12/hdd_info_hdparm.png)

### 总结 ###

每个命令都有不同的方式来获取硬件的信息。在查看特定的硬件信息的时候，可以尝试使用不同的方式。上面所有的命令行工具在大部分的Linux发型版本中都是可以使用的，可以很容易的从仓库中获取安装。
Each of the commands has a different method of extracting hardware information. You can try more than one of them while looking for specific hardware details. All of the above tools are available in most Linux distros, and can be easily installed from the default repository.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/check-hardware-information-linux/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
