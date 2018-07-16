戴文的Linux内核专题：17 配置内核 (13)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.555/)

你好!这是Linux内核系列的下一篇，我们仍将配置ATA设备并将进入逻辑卷/存储。

"ATA SFF support (for legacy IDE and PATA)"应该启用，因为这扩展了ATA的能力。

为了支持Pacific Digital的ADMA控制器，应该启用"Pacific Digital ADMA support"。

"Pacific Digital Serial ATA QStor support"(串口ATA支持)在下一个驱动中支持

Promise的SATA SX4设备在内核中支持(Promise SATA SX4 support (Experimental))。

可以BMDMA的SFF ATA控制器需要这个驱动(ATA BMDMA support)。BMDMA代表总线主控直接内存访问(BMDMA stands for Bus-Master Direct Memory Access)。

下面，这个驱动对不同的SATA和PATA控制器提供支持Intel ESB, ICH, PIIX3, PIIX4 PATA/SATA support)。

这里有其他的特定设备驱动(Calxeda Highbank SATA support)、(Marvell SATA support)、(NVIDIA SATA support)、(Promise SATA TX2/TX4 support)、(Silicon Image SATA support)还有(SiS 964/965/966/180 SATA support)、(ServerWorks Frodo / Apple K2 SATA support)、(ULi Electronics SATA support)、(VIA SATA support)。。。由于有很多SATA/PATA控制器设计不同，一个通用驱动无法使用在这些设备上。

接下来，这个驱动支持PC卡上的ATA设备除非有特定设备管理硬件的驱动(PCMCIA PATA support)。

在这之后，有一个通用PATA驱动用于管理其他不被先前驱动支持的PATA设备 (Generic platform device PATA support)。

PATA设备的电源消耗由这个ACPI驱动管理(ACPI firmware driver for PATA)。强烈建议对系统上所有的硬件启用ACPI。虽然这会增加内核的大小，但是ACPI会增强性能。

"Generic ATA support"(通用ATA支持)由这个驱动提供。

古老的ISA、VLB和PCI总线PATA设备可以通过这个驱动支持(Legacy ISA PATA support (Experimental))。这个古老支持使用新的ATA层。

这组特性包含了许多对于RAID和LVM能力，可见下面的特性选项(Multiple devices driver support (RAID and LVM))。

有趣的事实：内核是由C和汇编写成的。

这个驱动允许RAID和LVM组合在一起。这用于使几个LVM卷使用RAID。分区被组合成逻辑块设备，然后形成RAID设备。

许多用户会希望RAID可以在启动时侦测到(Autodetect RAID arrays during kernel boot)。如果你没有RAID，那么不要启用这个特性。不然，启动处理会比原先希望的慢上几秒。

注意：当配置Linux内核时，最好按照"use it or lose it"(非用即失)的原则。那就是，如果你不用它，那就禁用这个特性。

硬盘分区可以通过这个驱动加在一起(Linear (append) mode)。

下面的驱动加入RAID-0支持带逻辑块设备中(RAID-0 (striping) mode)。接着还有 (RAID-1 (mirroring) mode)、(RAID-10 (mirrored striping) mode)和(RAID-4/RAID-5/RAID-6 mode)。

MD框架需要多路径支持(Multipath I/O support)。MD框架就是多设备(Multi Device)框架,它将多台设备作为一个单元管理。举例来说，将许多存储单元的分区组合起来可以使多个设备就像一个那样。多路径支持是用于使用处理虚拟的有多个地址的"单个设备"。因为单存储单元物理上有多件物理设备，所以它有多个硬件地址。

使用这个调试驱动，可以测试更大的多磁盘存储单元的bug(Faulty test module for MD)。

"Device mapper support"是一个用来映射逻辑扇区的卷管理器。LVM使用扇区映射。

如果启用的话，设备映射器可以有调试特性(Device mapper debugging support)。

如果需要，逻辑设备可以设置加密数据(Crypt target support)。这个特性允许用户将来加密那些存储设备。

只有启用了这个特性，才能使用逻辑存储单元的快照功能(Snapshot target)。

"Thin provisioning"(自动精简配置)允许逻辑卷设置成比组成逻辑卷的物理设备拥有更大的存储容量(Thin provisioning target)。这个特性同样为这类设备提供了快照功能。这额外的虚拟数据空间无法马上使用。这个特性的意义是允许用户在将来增加物理存储单元并且节约了配置逻辑块设备的时间。

用这个可以调试"Thin provisioning" (Keep stack trace of thin provisioning block lock holders)。

块设备性能的提升可以通过移动更多的常用数据到更快的存储单元中(Cache target (EXPERIMENTAL))。

卷管理器可以制成镜像逻辑卷(Mirror target)。

设备映射器(Device-mapper (dm))单元支持映射RAID1、RAID10、 RAID4、RAID5和RAID6(RAID 1/4/5/6/10 target)。

设备映射器(device-mapper)日志可以镜像到用户空间(Mirror userspace logging)。

"Zero target"是一个忽视写入并返回读取为零的设备。

接下来，卷管理器应该对硬件有多路径支持(Multipath target)。

这个驱动会发现最有效的到存储设备的路径来读取和写入(I/O Path Selector based on the number of in-flight I/Os)。

下面的一个驱动和以上相同，但是会寻找最快路径(I/O Path Selector based on the service time)。

如果一个逻辑卷上的物理存储单元正忙，如果可能的话，这个特性会允许读取/写入到另一个物理卷上。

udev可以生成设备管理器操作事件DM uevents)。udev是/dev的设备管理器。

为了测试软件/硬件对偶尔失败的输入/输出任务的逻辑设备如何反映，启用这个调试特性(Flakey target)。

逻辑卷可以创建为一个用于验证另一个逻辑分区数据的只读存储单元(Verity target support)。

注意：如果你喜欢我的文章，并且如果你有Linux.org的账号，请在我的文章上点击"Like"。同样，再次分享这篇文章在Google、Twitter和/或者Facebook上。

ConfigFS和TCM存储引擎可以通过这个设置启用(Generic Target Core Mod (TCM) and ConfigFS Infrastructure)。ConfigFS是一个基于内存的文件系统。

有趣的事实：Linux内核没有"main()"函数。在程序中，main()被依赖于kernel的libc调用。内核没有main()函数是因为libc将无法启动内核。如果内核的确有main()函数，那么我们就有一个"鸡或者蛋"的问题-谁先来？另外，内核的入口点用汇编写成，这并不使用main()函数。

下面，"TCM/IBLOCK Subsystem Plugin for Linux/BLOCK"可以禁用或者启用。

接着"TCM/FILEIO Subsystem Plugin for Linux/VFS"可以启用/禁用。

再次，还有两个TCM特性 - (TCM/pSCSI Subsystem Plugin for Linux/SCSI) 和 (TCM Virtual SAS target and Linux/SCSI LDD fabric loopback module)

对于ConfigFS的"Linux-iSCSI.org iSCSI Target Mode Stack"在这个驱动中支持(Linux-iSCSI.org iSCSI Target Mode Stack)。

下一步，可以启用/禁用"FireWire SBP-2 fabric module"。这允许一台计算机作为一个硬盘连接到另一台计算机上。

在这之后，我们可以配置"Fusion Message Passing Technology (MPT) device support"。

在那个标题下的第一个选项是一个用于并口适配器的SCSI支持的驱动(Fusion MPT ScsiHost drivers for SPI)。

SCSI同样也可以支持光纤通道主机适配器(Fusion MPT ScsiHost drivers for FC)和/或SAS适配器(Fusion MPT ScsiHost drivers for SAS)。

下一步，用户可以设置"Maximum number of scatter gather entries"。一个低的数值可以减少每个控制器实例的内存消耗。

下一个驱动提供了ioctl系统调用来管理MPT适配器(Fusion MPT misc device (ioctl) driver)。

光纤通道端口可以用这个驱动支持IP LAN的流量(Fusion MPT LAN driver)。

我可以读到你们的想法-你们会想到对于这个还有另外一篇文章。是的，你们想对了。请继续关注这个系列的下一篇文章。

如果你喜欢这个系列，请在Linux.org和/或者Google+上发表评论告诉我你有多喜欢这个系列，并且告诉我你想在今后的文章中希望看到的方面。或者给我发邮件DevynCJohnson@Gmail.com)。谢谢！

想要更多地了解作者，请检查下面的签名栏中的链接(译注：原文所在论坛有)

如果你已经完整地阅读了这篇文章，那么你应该已经看到单词"Facebook"三次了。如果没有，你没有阅读全部文章。

单词"Facebook"在这段中，上一段，和一个注解中。我打赌你阅读了上面的段落而没有通读文章来试图寻找第三个单词实例。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-13.4714/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出