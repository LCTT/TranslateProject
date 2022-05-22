[#]: collector: (lujun9972)
[#]: translator: (rakino)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12702-1.html)
[#]: subject: (How to view information on your Linux devices with lshw)
[#]: via: (https://www.networkworld.com/article/3583598/how-to-view-information-on-your-linux-devices-with-lshw.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何使用 lshw 查看 Linux 设备信息
======

> Linux 系统上的 lshw 命令提供的系统设备信息比我们大多数人想象的要多得多。

![Kali Linux logo / gears / binary data][1]

虽然 `lshw` 命令（<ruby>列出硬件<rt>list hardware</rt></ruby>，读作 “ls hardware”）远不是每个人最先学会的 50 个 Linux 命令之一，但它可以提供很多系统硬件的有用信息。

它以一种相当易于理解的格式提取出可能比你知道的更多的信息。在看到描述、（设备）逻辑名称、大小等以后，你可能会理解到自己能获得多少信息。

这篇文章会研究 `lshw` 给出的信息，但侧重于磁盘及相关硬件。下面是 `lshw` 的输出示例：

```
$ sudo lshw -C disk
  *-disk:0
       description: SCSI Disk
       product: Card Reader-1
       vendor: JIE LI
       physical id: 0.0.0
       bus info: scsi@4:0.0.0
       logical name: /dev/sdc
       version: 1.00
       capabilities: removable
       configuration: logicalsectorsize=512 sectorsize=512
     *-medium
          physical id: 0
          logical name: /dev/sdc
```

请注意，你需要使用 `sudo` 运行 `lshw` 命令以确保能得到所有可用的信息。

虽然我们在上面的命令中要求了输出“磁盘（`disk`）”（上面只包含了原始输出里五个条目中的一个），这里的输出却不是一个硬盘，而是读卡器——磁盘的一种。注意系统将这个设备命名为了 `/dev/sdc`。

系统的主磁盘上也有相似的信息：

```
*-disk
        description: ATA Disk
        product: SSD2SC120G1CS175
        physical id: 0
        bus info: scsi@0:0.0.0
         logical name: /dev/sda         <==这里
        version: 1101
        serial: PNY20150000778410606
        size: 111GiB (120GB)
        capabilities: partitioned partitioned:dos
        configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512 signature=
           f63b5929
```

这块硬盘是 `/dev/sda`。这个系统上的硬盘都显示为 `ATA` 磁盘，`ATA` 是一种把控制器与盘体集成在一起的磁盘驱动器实现。

要获得“磁盘”类设备的简略列表，可以运行下面这条命令。注意其中有两个设备被列出了两次，所以我们看到的仍然是五个磁盘设备。

```
$ sudo lshw -short -C disk
H/W path               Device      Class          Description
=============================================================
/0/100/1d/1/1/0.0.0    /dev/sdc    disk           Card Reader-1
/0/100/1d/1/1/0.0.0/0  /dev/sdc    disk
/0/100/1d/1/1/0.0.1    /dev/sdd    disk           2
/0/100/1d/1/1/0.0.1/0  /dev/sdd    disk
/0/100/1f.2/0          /dev/sda    disk           120GB SSD2SC120G1CS175
/0/100/1f.2/1          /dev/cdrom  disk           DVD+-RW GSA-H73N
/0/100/1f.5/0.0.0      /dev/sdb    disk           500GB SAMSUNG HE502HJ
```

如果你决定要查看系统上的 **所有** 设备，请坐稳了；你会得到一个包含的东西比你通常认为的“设备”要多得多的列表，下面是一个例子，这是一个“简短（`short`）”（信息很少）的列表：

```
$ sudo lshw -short
[sudo] password for shs:
H/W path               Device      Class          Description
=============================================================
                                   system         Inspiron 530s
/0                                 bus            0RY007
/0/0                               memory         128KiB BIOS
/0/4                               processor      Intel(R) Core(TM)2 Duo CPU
/0/4/a                             memory         32KiB L1 cache
/0/4/b                             memory         6MiB L2 cache
/0/24                              memory         6GiB System Memory
/0/24/0                            memory         2GiB DIMM DDR2 Synchronous 667
/0/24/1                            memory         1GiB DIMM DDR2 Synchronous 667
/0/24/2                            memory         2GiB DIMM DDR2 Synchronous 667
/0/24/3                            memory         1GiB DIMM DDR2 Synchronous 667
/0/1                               generic
/0/10                              generic
/0/11                              generic
/0/12                              generic
/0/13                              generic
/0/14                              generic
/0/15                              generic
/0/17                              generic
/0/18                              generic
/0/19                              generic
/0/2                               generic
/0/20                              generic
/0/100                             bridge         82G33/G31/P35/P31 Express DRAM
/0/100/1                           bridge         82G33/G31/P35/P31 Express PCI
/0/100/1/0                         display        Caicos [Radeon HD 6450/7450/84
/0/100/1/0.1                       multimedia     Caicos HDMI Audio [Radeon HD 6
/0/100/19              enp0s25     network        82562V-2 10/100 Network Connec
/0/100/1a                          bus            82801I (ICH9 Family) USB UHCI
/0/100/1a/1            usb3        bus            UHCI Host Controller
/0/100/1a.1                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1a.1/1          usb4        bus            UHCI Host Controller
/0/100/1a.1/1/2                    input          Rock Candy Wireless Keyboard
/0/100/1a.2                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1a.2/1          usb5        bus            UHCI Host Controller
/0/100/1a.2/1/2                    input          USB OPTICAL MOUSE
/0/100/1a.7                        bus            82801I (ICH9 Family) USB2 EHCI
/0/100/1a.7/1          usb1        bus            EHCI Host Controller
/0/100/1b                          multimedia     82801I (ICH9 Family) HD Audio
/0/100/1d                          bus            82801I (ICH9 Family) USB UHCI
/0/100/1d/1            usb6        bus            UHCI Host Controller
/0/100/1d/1/1          scsi4       storage        CD04
/0/100/1d/1/1/0.0.0    /dev/sdc    disk           Card Reader-1
/0/100/1d/1/1/0.0.0/0  /dev/sdc    disk
/0/100/1d/1/1/0.0.1    /dev/sdd    disk           2
/0/100/1d/1/1/0.0.1/0  /dev/sdd    disk
/0/100/1d.1                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1d.1/1          usb7        bus            UHCI Host Controller
/0/100/1d.2                        bus            82801I (ICH9 Family) USB UHCI
/0/100/1d.2/1          usb8        bus            UHCI Host Controller
/0/100/1d.7                        bus            82801I (ICH9 Family) USB2 EHCI
/0/100/1d.7/1          usb2        bus            EHCI Host Controller
/0/100/1d.7/1/2                    multimedia     USB  Live camera
/0/100/1e                          bridge         82801 PCI Bridge
/0/100/1e/1                        communication  HSF 56k Data/Fax Modem
/0/100/1f                          bridge         82801IR (ICH9R) LPC Interface
/0/100/1f.2            scsi0       storage        82801IR/IO/IH (ICH9R/DO/DH) 4
/0/100/1f.2/0          /dev/sda    disk           120GB SSD2SC120G1CS175
/0/100/1f.2/0/1        /dev/sda1   volume         111GiB EXT4 volume
/0/100/1f.2/1          /dev/cdrom  disk           DVD+-RW GSA-H73N
/0/100/1f.3                        bus            82801I (ICH9 Family) SMBus Con
/0/100/1f.5            scsi3       storage        82801I (ICH9 Family) 2 port SA
/0/100/1f.5/0.0.0      /dev/sdb    disk           500GB SAMSUNG HE502HJ
/0/100/1f.5/0.0.0/1    /dev/sdb1   volume         433GiB EXT4 volume
/0/3                               system         PnP device PNP0c02
/0/5                               system         PnP device PNP0b00
/0/6                               storage        PnP device PNP0700
/0/7                               system         PnP device PNP0c02
/0/8                               system         PnP device PNP0c02
/0/9                               system         PnP device PNP0c01
```

运行下面的命令来列出设备类别，并统计每个类别中的设备数量。

```
$ sudo lshw -short | awk ‘{print substr($0,36,13)}’ | tail -n +3 | sort | uniq -c
      4 bridge
     18 bus
      1 communication
      7 disk
      1 display
     12 generic
      2 input
      8 memory
      3 multimedia
      1 network
      1 processor
      4 storage
      6 system
      2 volume
```

**注意：** 上面使用 `awk` 命令从 `lshw` 的输出中选择 Class（类别）栏是这样实现的：使用 `$0`（选取完整行），但只取从正确位置（第 36 个字符）开始的子串，而因为“类别”中并没有条目的长度超过 13 个字符，所以子串就在那里结束。命令中 `tail -n +3` 的部分移除了标题和下面的`=====`，所以最终的列表中只包含了那 14 种设备类型。

（LCTT 译注：上面的命令中 `awk` 的部分在选取子串时是从第 36 个字符开始的，这个数字基本上取决于最长的设备逻辑名称的长度，因而在不同的系统环境中可能有所不同，一个例子是，当你的系统上有 NVMe SSD 时，可能需要将其改为 41。）

你会发现在没有使用 `-short` 选项的时候，每一个磁盘类设备都会有大约 12 行的输出，包括像是 `/dev/sda` 这样的逻辑名称，磁盘大小和种类等等。

```
$ sudo lshw -C disk
[sudo] password for shs:
  *-disk:0
       description: SCSI Disk
       product: Card Reader-1           <== 读卡器？ 
       vendor: JIE LI
       physical id: 0.0.0
       bus info: scsi@4:0.0.0
       logical name: /dev/sdc
       version: 1.00
       capabilities: removable
       configuration: logicalsectorsize=512 sectorsize=512
     *-medium
          physical id: 0
          logical name: /dev/sdc
  *-disk:1
       description: SCSI Disk
       product: 2
       vendor: AC4100 -
       physical id: 0.0.1
       bus info: scsi@4:0.0.1
       logical name: /dev/sdd
       capabilities: removable
       configuration: logicalsectorsize=512 sectorsize=512
     *-medium
          physical id: 0
          logical name: /dev/sdd
  *-disk
       description: ATA Disk
       product: SSD2SC120G1CS175
       physical id: 0
       bus info: scsi@0:0.0.0
       logical name: /dev/sda           <== 主要磁盘
       version: 1101
       serial: PNY20150000778410606
       size: 111GiB (120GB)
       capabilities: partitioned partitioned:dos
       configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512 signature=f63b5929
  *-cdrom                               <== 也叫 /dev/sr0
       description: DVD writer
       product: DVD+-RW GSA-H73N
       vendor: HL-DT-ST
       physical id: 1
       bus info: scsi@1:0.0.0
       logical name: /dev/cdrom
       logical name: /dev/cdrw
       logical name: /dev/dvd
       logical name: /dev/dvdrw
       logical name: /dev/sr0
       version: B103
       serial: [
       capabilities: removable audio cd-r cd-rw dvd dvd-r
       configuration: ansiversion=5 status=nodisc
  *-disk
       description: ATA Disk
       product: SAMSUNG HE502HJ
       physical id: 0.0.0
       bus info: scsi@3:0.0.0
       logical name: /dev/sdb           <== 次要磁盘
       version: 0002
       serial: S2B6J90B501053
       size: 465GiB (500GB)
       capabilities: partitioned partitioned:dos
       configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512 signature=7e67ccf3
```

### 总结

`lshw` 命令提供了一些我们许多人通常不会处理的信息，不过即使你只用了其中的一部分，知道有多少信息可用还是很不错的。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3583598/how-to-view-information-on-your-linux-devices-with-lshw.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2020/02/kali_linux_tools_abstract_gears_binary_data_by_nevarpp_gettyimages-688718788_2400x1600-100832674-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
