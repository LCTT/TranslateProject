戴文的Linux内核专题：15 配置内核 (11)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.530/)

准备好配置更多的驱动了么？还有很多要做。

Linux支持两种不同的康柏智能阵列控制器：(Compaq SMART2 support)和(Compaq Smart Array 5xxx support)。阵列控制器是将物理存储单元表现为逻辑单元的设备。这些控制可能同样实现了基于硬件的RAID。硬件和软件RIAD的不同是简单的。Linux管理并见到软件RIAD。Linux将硬件RAID视为另外的存储单元。这意味着Linux没有意识到设备就是RAID驱动器。硬件(阵列控制器)独立于内核管理着RAID系统。这对于系统的性能更好因为内核不必配置或者管理RAID。注意，不同的阵列控制器有不同的RAID能力。

上面提到的阵列控制器可以通过这个驱动访问SCSI磁带(SCSI tape drive support for Smart Array 5xxx)。SCSI磁带是使用SCSI协议的磁带机。

PCI RAID控制器Mylex DAC960、AcceleRAID和eXtremeRAID在这个驱动中支持(Mylex DAC960/DAC1100 PCI RAID Controller support)。PCI RAID控制器是一个连接到PCI卡的阵列控制器。RAID控制器是拥有RAID功能的阵列控制器。

带电源备份的MM5415内存芯片在这个驱动中支持(Micro Memory MM5415 Battery Backed RAM support)。带后备电源内存芯片允许数据在切断电源后继续保存在内存设备中。这有助于保护数据。不然，当电源断开后，当前的计算机会话就会丢失。

当启用这个特性后，可以将典型的文件(比如ISO文件)作为一个块设备并挂载它Loopback device support)。这对于从镜像文件中检索文件而不必把文件烧录到光盘或者解压出来。想像一下你从因特网上得到了一份包含了很多文件的ISO文件。如果你只需要包中的一个文件并且用户不希望烧写ISO到光盘上或者不想知道如何打开一个ISO文件。用户可以用挂载ISO来替代。

Linux内核在初始化阶段会创建一些回路设备，所以一些回环设备已经准备好并创建了(Number of loop devices to pre-create at init time)。当一个文件(像ISO)或者虚拟设备(就像虚拟磁盘驱动器[vhd])被作为回环设备挂载时会节约一些时间。这个设定允许开发者选择内核可以预
创建多少回环设备。

当"Cryptoloop Support"启用后就可以CryptoAPI创建密码。这个用于硬件驱动器加密。然而，并不是所有的文件系统都支持。

下面用户可以启用"DRBD Distributed Replicated Block Device support"(译注：Linux上的分布存储系统)。这个就像网络RAID1。这些设备拥有设备文件/dev/drbdx。这些设备通常被用于集群，这里集群中的每台计算机都有一个从主单元镜像过来的存储单元。这意味着每台计算机的硬盘是位于组中心计算机硬盘的镜像拷贝。集群是一组计算机扮演着一台大型强力单元的角色。然而，每个集群都有一台控制计算机称为主节点。余下的计算机是从节点。

DRBD支持用于测试IO错误处理的故障注射(DRBD fault injection)。记住，故障注射就是使设备/软件认为发生了一个错误，因此开发者可以测试硬件/软件如何处理错误

如果内核要成为网络块设备的客户端，那么启用这个特性(Network block device support)。第一个设备文件是/dev/nd0。网络块设备是通过网络访问的远程存储单元。

直接连接SSD到PCI或者PCIe需要这个驱动(NVM Express block device)。

用这个特性允许将单独的SCSI OSD(object-based storage,基于对象的存储)对象作为块设备(OSD object-as-blkdev support)。

下一个驱动是"Promise SATA SX8 support"。这个驱动用于Promise公司(Promise Technology Inc.)生产的SATA控制器。

Linux允许将一部分内存作为块设备(RAM block device support)。这通常见与完全运行于内存上的Linux的live发行版。Linux的live发行版会卸载光盘并接着加载到内存中，所以在尝试一个新的操作系统或者修复另一个系统时不会伤害到已安装的系统。

下一个选项允许用户输入"Default number of RAM disks"(默认RAM磁盘数量)。

"Default RAM disk size"(默认RAM磁盘大小)可以以KB设置大小。

内核可以支持在内存设备的XIP文件系统作为块设备(Support XIP filesystems on RAM block device)。这个特性会增大内核的大小。 XIP (eXecute In Place)文件系统是一个允许可执行文件在相同的文件系统上存储数据而不必像其他应用一样利用内存。在一个驻留在内存上的live版linux系统上运行可执行文件时需要这个文件系统。

下面，内核可以支持"Packet writing on CD/DVD media"。(CD/DVD刻录机支持.)

内核开发者可以设置最大活跃并发包数量(Free buffers for data gathering)。大的数字会以内存的消耗为代价加速写入性能。一个包会消耗大约64KB。

Linux内核可以使用可擦写光盘作为缓存空间(Enable write caching)。这个特性仍然是试验性质。

下面的特性允许通过以太网线缆使用ATA规范(ATA over Ethernet support)。

下面的驱动允许虚拟块设备创建为virtio(Virtio block driver)。virtio是IO虚拟化平台。

一些非常老的硬盘还要一个特殊的驱动(Very old hard disk (MFM/RLL/IDE) driver)。

这里有一个驱动用于先前提到的Rados设备(Rados block device (RBD))。

下面是一个特殊的设备驱动(IBM FlashSystem 70/80 PCIe SSD Device Driver)。

现在，我们可以进入杂项设备。第一个设定是启用/禁用电位器(Analog Devices Digital Potentiometers )。

如果电位器在I2C总线上，那么就启用这个(support I2C bus connection)。

如果电位器是连接到SPI总线，那么需要这个驱动(support SPI bus connection)。

注意:Linux内核支持很多传感器因为Linux内核经常用于天气设备和机器人。

这个驱动用于IBM RSA(Condor)服务处理器(Device driver for IBM RSA service processor)。

内核同样支持PCI Sensable PHANToM设备驱动(Sensable PHANToM (PCI))。

这个驱动指引不同来自并行追踪接口(Parallel Trace Interface (PTI))的追踪数据发往Intel Penwell PTI口 (Parallel Trace Interface for MIPI P1149.7 cJTAG standard)。这个被指领的数据用于调试目的。

一些带有IOC4芯片的SGI IO控制器需要这个驱动(SGI IOC4 Base IO support)。SGI IO是由SCI管理的输入/输出设备。IOC4芯片控制着许多由这些设备执行的任务。这是一个基础驱动。其他对这些设备的驱动依赖于这个驱动。

这里有很少的TI闪存媒体适配器驱动在Linux内核中，(TI Flash Media interface support) 和(TI Flash Media PCI74xx/PCI76xx host adapter support)。

这个驱动("Integrated Circuits ICS932S401")用于ICS932S401时钟控制芯片。

Atmel同步串行通信外设(Synchronized Serial Communication peripheral (SSC))有一个驱动在内核中(Device driver for Atmel SSC peripheral)。这个设备提供点对点的设备间的串行连接。

"Enclosure Services"特性支持硬盘托架。

这是对于CS5535/CS5536芯片的定时器驱动(CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support)。

这个驱动让应用可以与HP工业标准服务器中的iLO管理处理器通信(Channel interface driver for the HP iLO processor)。"iLO"代表的是"Integrity Integrated Lights-Out".iLO允许远程服务器管理。

Linux内核支持ALS APDS9802光敏传感器(Medfield Avago APDS9802 ALS Sensor module)。一些其他支持的传感器包括：

- Intersil ISL29003 ambient light sensor
- Intersil ISL29020 ambient light sensor
- Taos TSL2550 ambient light sensor
- ROHM BH1780GLI ambient light sensor
- BH1770GLC / SFH7770 combined ALS - Proximity sensor
- APDS990X combined als and proximity sensors

注意：如果内核是为广泛的计算机编译的话，大多数驱动应该以模块形式加入。

Linux甚至可以使用"Honeywell HMC6352 compass"(一种电子罗盘)。

内核同样支持"Dallas DS1682 Total Elapsed Time Recorder with Alarm"。(一种运行时间记录仪)

16位的数模转换器通过这个驱动支持(Texas Instruments DAC7512)。

"VMware Balloon Driver"将客户机操作系统不需要的物理内存页交给需要那些需要的。

这里有两个不同的压力传感器(BMP085 digital pressure sensor on I2C) 和 (BMP085 digital pressure sensor on SPI)。

Intel输入/输出集线器(Intel Input/Output Hub (IOH))同样在内核中支持(Intel EG20T PCH/LAPIS Semicon IOH(ML7213/ML7223/ML7831) PHUB)。具体地说，这个是Intel Topcliff芯片组的PCH PHUB(Platform Controller Hub Packet Hub)

"FSA9480 USB Switch"是检测设备何时插入的检测器。

下一个选项允许比特流配置(Lattice ECP3 FPGA bitstream configuration via SPI)。

Silicon微控制器使用Silicon实验室C2端口，这需要一个特殊的驱动(Silicon Labs C2 port support)。

再说一次，继续留意下一篇文章因为我们还有更多的要做。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-11.4640/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出