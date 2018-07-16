戴文的Linux内核专题：14 配置内核 (10)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.514/)

使用WiMAX协议的无线宽频设备可以启用这个(WiMAX Wireless Broadband support)。这个类型的无线连接通常需由服务供应商提供的连接服务才能工作(这与3G/4G的概念相同)。WiMAX代表"Worldwide Interoperability for Microwave Access"(微波存取全球互通)。WiMAX的目的是代替DSL。宽频指的是宽的带宽和大量信号的传输。

射频开关被用于许多Wifi和蓝牙卡中(RF switch subsystem support)。"RF"代表"Radio Frequency"。RF开关路由高频信号。

RF开关输入支持同样也在内核中支持(RF switch input support)。

内核可以控制并请求无线传输(Generic rfkill regulator driver)。启用这个生成一个设备文件(/dev/rfkill)。这个设备文件作为无线设备的接口。

Linux内核支持9P2000协议(Plan 9 Resource Sharing Support (9P2000))。这个网络协议有时称作Styx。Plan 9的窗口系统(Rio)的Styx和Linux的X11都使用Unix网络套接字。Linux系统可能使用Styx在Styx网络中。Plan 9和Linux可以在一个网络中使用Styx

"9P Virtio Transport"(9P 虚拟io传输)系统提供了在虚拟系统上客户机和主机分区间的传输。

内核同样支持RDMA传输(9P RDMA Transport (Experimental))。RDMA代表的是"Remote Direct Memory Access"(远程内存直接访问)。这个Plan9上访问远程计算机内存的协议。

9P系统与其他内核组件一样有调试特性(Debug information)。

"CAIF support"支持同样可以在内核中启用。CAIF代表" Communication CPU to Application CPU Interface"(通信CPU到应用CPU接口)。这是一个使用数据包的多路复用(MUX)协议并被用于ST-Ericsson(意法爱立信)调制解调器中。ST-Ericsson是开发这个协议的公司(是的，MeeGo和Android是Linux系统，并且我正在讨论Google的Andorid)。MUX协议就是多路复用(multiplexing)协议。多路复用在前面的文章中已经提到过。

下面，cephlib可以加入内核，它可以用于rados块设备(rbd)h和Ceph文件系统(Ceph核心库)(译注：Ceph是一种分布式文件系统)。cephlib是是Ceph的完整核心库。Ceph是存储平台。CephFs(Ceph文件系统)是运行在另外一个文件系统的顶部。通常，CephFs运行在EXT2、ZFS、XFS或者BTRFS上面。Rados设备是使用CephFs的块存储单元。

ceph的调试特性会损害内核性能，所以只在需要的时候启用(Include file:line in ceph debug output)。
当启用这个选项(Use in-kernel support for DNS lookup)，CONFIG_DNS_RESOLVER设施会执行DNS查询。

近场通信(Near Field Communication (NFC))设备在Linux内核中也被支持(NFC subsystem support)。

如果上面的特性被启用，那么NFC控制器接口(NFC Controller Interface (NCI))也应该启用(NCI protocol support)。这允许主机和NFC控制器相互通信。

NFC要处理HCI帧需要启用下面一个特性(NFC HCI implementation)。

一些HCI驱动需要一个SHDLC链路层(SHDLC link layer)(SHDLC link layer for HCI based NFC drivers)。SHDLC是检测完整性和管理HCI帧顺序的协议。

如果NFC特性启用了，那么通常也启用"NFC LLCP support"(就像上面那样)。

接下来有一些为特别的NFC设备的驱动。第一个是"NXP PN533 USB driver"。

下一个NFC驱动支持TI的BT/FM/GPS/NFC设备(Texas Instruments NFC WiLink driver)。

下面的是"NXP PN544 NFC driver"。

对于Inside Secure(译注：法国一家非接触半导体芯片厂商)生产的microread NFC芯片驱动同样在内核中支持(Inside Secure microread NFC driver)。

现在，我们将继续配置与网络无关的驱动。首先我们可以选择uevent帮助程序的路径(path to uevent helper)。如今许多计算机不在需要这个特性因为一个uevent帮助程序会在每次执行时fork一个进程处理。这回很快地消耗资源。

在启动时，内核会创建一个tmpfs/ramfs 文件系统(Maintain a devtmpfs filesystem to mount at /dev)。这个提供了完整的/dev目录系统。在这两个文件系统中(tmpfs和ramfs)，ramfs两者中最简单。"tmpfs"代表"temporary filesystem"(临时文件系统)，而"ramfs"代表"ram filesystem"(内存文件系统)。

下一个设置是devtmpfs文件系统的代码，它同样挂载在/dev下(Automount devtmpfs at /dev, after the kernel mounted the rootfs)。

下面的特性允许模块加载到用户空间(Userspace firmware loading support)。

为了"Include in-kernel firmware blobs in kernel binary"(译注：将固件编译进内核)(这会增加专有固件到内核中)，就启用这个特性。

一些二进制专有驱动需要在启动时使用。这个特性允许这类软件这么做(External firmware blobs to build into the kernel binary)。一些计算机有些引导设备需要只包含专有二进制文件的特殊固件。这个特性不启用，系统将无法引导。

启用"Fallback user-helper invocation for firmware loading"，允许user-helper(用户助手) (udev)作为内核加载固件驱动失败的后备手段加载固件。udev可以加载驻留在非标准路径的固件。

管理驱动的不跟内核如果被允许就可以生成调试信息(Driver Core verbose debug messages)。

下一步，如果启用这个特性(Managed device resources verbose debug messages)，devres.log文件就可以使用。这是一个用于设备资源的调试系统。

下面一个特性会通过netlink套接字生成一条用户空间和内核空间的连接(Connector - unified userspace <-> kernelspace linker)。这个套接字使用netlink协议。这是另外一个Linux系统即使在没有物理网络情况下仍需要网络特性的例子。

用户空间可以通过套接字得到进城时间的通知(Report process events to userspace)。一些报告事件包含了ID改变、fork、和退出状态。一些先前启用的内核特性可能需要这个。最好按配置工具建议的那样设置。

使用固态硬盘的系统需要MTD的支持(Memory Technology Device (MTD) support)。MTD设备是固态存储设备。典型的存储设备与固态硬盘(SSD)不同。用于磁盘单元的标准常规不适用于SSD(读、写、擦除)。

大多数会桌面电脑带有并口(一个有25个洞的连接器)，所以他们需要这个特性(Parallel port support)。并口在其他许多鲜为人知的应用中通常用于打印机和ZIP驱动器。并口有25针。

对IBM兼容计算机启用这个特性(PC-style hardware)。它们是不同类型的计算机。除了IBM计算机(通常运行Windows),还有苹果计算机。Linxu可以运行在几乎所有类型的计算机上。

Linux同样支持Multi-IO PCI卡(Multi-IO cards (parallel and serial))。Multi-IO PCI卡同时拥有并口和串口。串口每次发送或接收1位数据。

下一个特性允许内核"Use FIFO/DMA if available"。这用于特定的并口卡来加速打印。FIFO代表"First In, First Out"(先入先出)。DMA是先前提过的直接内存访问(Direct Memory Access)。

下面一个特性用于探测Super-IO卡(SuperIO chipset support)。这些探针会发信中断号、DMA通道和其他类型设备的地址/数量。Super-IO是一种集成IO控制器类型。

PCMCIA的并口支持可以启用(Support for PCMCIA management for PC-style ports)。

注意：对于许多特性来说，你最好按照配置工具的建议除非你有特别的理由不这么做。通常地，如果你是交叉编译或者编译一个通用内核，那么你应该熟悉你想要支持的并做出相应的选择。

在AX88796网络控制器的并口需要这个支持(AX88796 Parallel Port)。

"IEEE 1284 transfer modes"在并口上支持增强型并口(Enhanced Parallel Port (EPP))和增强功能口(Enhanced Capability Port (ECP))并支持打印机状态回读。状态回读是检索打印机的状态。

即插即用("Plug and Play support" (PnP))应该启用。这允许用户在系统开机状态下插入设备并能马上使用它们。没有这个特性，用户不能使用USB设备、打印机或者其他没有执行特殊任务的设备。系统会自动管理复位(译注：原文是 "The system will manage the rest automatically")。

下面，用户可以启用块设备(Block devices)。这是一个应该启用的特性，因为块设备很常见。

软驱也是可以启用的块设备(Normal floppy disk support)。

连接到并口的IDE设备也同样支持(Parallel port IDE device support)。一些外部CD-ROM设备也能通过并口连接。

外部IDE存储设备单元同样可以连接到并口(Parallel port IDE disks)。

连接到并口的ATA包接口(ATA Packet Interface (ATAPI)) CD-ROM需要这个驱动(Parallel port ATAPI CD-ROMs)。ATAPI是用于并行ATA(PATA)设备的ATA协议扩展。

还有一个ATAPI磁盘设备可以插到并口中(Parallel port ATAPI disks)。这个驱动会除了支持CD-ROM外还支持其他类型的磁盘。

内核同样支持通过并口连接ATAPI磁带设备(Parallel port ATAPI tapes)。

还有许多其他的ATAPI设备可以连接到并口中。结果就是，一个通用驱动被用于管理前面提到过的驱动不支持的设备(Parallel port generic ATAPI devices)。

连接到并口上的IDE设备需要一个特殊的协议用于通信。有很多这样的协议，其中一个是"ATEN EH-100 protocol"。

一个可选的用于并行IDE设备的协议是"MicroSolutions backpack (Series 5) protocol"。

这里仍有另外一个并口IDE设备协议(DataStor Commuter protocol)和另一个(DataStor EP-2000 protocol)还有(FIT TD-2000 protocol)。

再提一次，这里有另外一个协议，但是这个强烈建议用在更新的插在并口上的CD-ROM和PD/CD设备(FIT TD-3000 protocol)。

下面的协议主要用于SyQuest、Avatar、Imation和HP生产的并口设备(Shuttle EPAT/EPEZ protocol)。

Imation SuperDisks需要Shuttle EP1284芯片的支持(Support c7/c8 chips)。

一些其他的并行IDE协议可以启用，包括：

- Shuttle EPIA protocol
- Freecom IQ ASIC-2 protocol - (用于Maxell Superdisks)
- FreeCom power protocol
- KingByte KBIC-951A/971A protocols
- KT PHd protocol - (用于2.5英寸外置并口硬盘)
- OnSpec 90c20 protocol
- OnSpec 90c26 protocol

注意：这些协议以及支持的插入并口的设备意味着这些都类似于热插拔设备,就像USB设备插入USB端口一样。USB和火线人仍旧是使用最流行的端口,因为它们的大小和速度。一个并口设备单元大于USB闪存因为并口大于USB端口。

下一步,我们有一个对于Micron PCIe的SSD驱动(Block Device Driver for Micron PCIe SSDs)。

你可能已经猜到了- 下面的文章会讨论更多的配置.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-10.4613/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
