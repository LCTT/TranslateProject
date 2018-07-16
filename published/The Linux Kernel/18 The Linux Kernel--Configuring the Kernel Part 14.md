戴文的Linux内核专题：18 配置内核 (14)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.566/)

你好！ 准备好读另一篇很酷的Linux内核文章了么?

接下来，在这个任务中，我们可以启用/禁用"Fusion MPT logging facility"。MPT代表"Message Passing Technology"(消息传递技术)。Fusion驱动是由LSI Logic公司开发。MPT一种进程间使用的特定消息策略。这个技术是同步的意味着进程将会等待所需的消息。

在这之后，如果计算机处理拥有火线端口就应该启用"FireWire driver stack"。如果没有，那么就没有必要去启动一个不会使用到的火线驱动。火线很像USB。不过在协议、速度、物理形状和端口布局上不同。通常上，苹果设备使用火线和USB。一些PC有火线端口，但是不像USB口那样普及。

一些火线控制器使用OHCI-1394规范(OHCI-1394 controllers)。如果是这样，启用这个驱动。

为了使用火线存储设备，启用下一个驱动(Storage devices (SBP-2 protocol))。这个驱动提供了火线存储单元与火线总线通信的协议(the card with the attached FireWire ports)。一些火线扫描仪同样需要这个驱动。

IPv4可以用在火线端口(IP networking over 1394)。IEEE 1394或者简单的"1394"就是火线。使用IPv4在火线多播有局限。

"Nosy"是"FireWire PCILynx"卡上的流量监控(Nosy - a FireWire traffic sniffer for PCILynx cards)。

下一步，可以支持I2O设备(I2O device support)。"Intelligent Input/Output (I2O)"(智能输入/输出)总线使用硬件和操作系统层的驱动。硬件驱动(hardware drivers (HDM))并不特定与任何操作系统而OS驱动(OS drivers (OSM))必须在目标操作系统上使用。OSM可以与任何HDM通信。I2O卡/总线有一个IOP- 输入/输出处理器(Input/Output Processor)。由于主CPU处理更少的数据，所以加速了系统。

只在缺乏SUN I2O控制器的系统上启用"Enable LCT notification"。I2C SUN固件不支持LCT通知。
如果目标是RAID，Adaptec I2O控制器需要下一个驱动(Enable Adaptec extensions)。

64位的直接内存访问可以在Adaptec I2O控制器上启用(Enable 64-bit DMA)。

如果允许，可以配置I2O设备(I2O Configuration support)。这个特性主要用在RAID设定中。

可以为I2O启用支持老的输入/输出控制(Enable ioctls (OBSOLETE))。

可以启用I2O总线适配器的OSM软件(I2O Bus Adapter OSM)。这组OSM被用来寻找新的在其他适配器末端的I2O设备。

下面，可以启用I2O块设备上的OSM(I2O Block OSM)。I2O硬件上的RAID控制器需要这个OSM。

下面的OSM用于I2O控制器上的SCSI或者光纤通道设备。

如果启用了(I2O /proc support)，可以通过/proc读取I2O设备的信息。

在启用/禁用了I2O特性，我们可以继续其他的内核特性。下面，我们看到"Macintosh device drivers"。这只对苹果设备有用。PC的Linux内核不应该有任何这些驱动启用。然而，正如许多说法都有例外一样。一些PC用户可能会使用苹果鼠标、键盘和/或者一些其他的苹果设备。再说一次，最好彻底地理解需求和正在开发的内核。

下一步，我们有一个用于网络的驱动(Network device support)。X11和其他的Linux软件不依赖于这个驱动，所以如果内核不会连接到另一台计算机、因特网、内联网或者网络，那么这个特性可以安全地禁用。

下面的驱动就像上面，但是特定于核心驱动(Network core driver support)。

这个驱动支持Etherchannel(Bonding driver support)。"bonding"是两条或者更多的以太网通道的融合。这也成为中继。

使用这个驱动(Dummy net driver support)，可以在Linux中设置一个虚拟网络。虚拟网络(dummy network)就像网络中的/dev/null。任何发送给虚拟网络的数据都会永久消失，因为它会发往/dev/null。IP地址没有设置。用户可以定义他们的网络相当于/dev/null。

下一步，可以支持和EQL(EQL (serial line load balancing) support)。这允许两台计算机使用SLIP或者PPP协议在两条串行连接上通信。

光纤通道是一种用于连接存储设备到计算机的快速串行协议(Fibre Channel driver support)。

TMII收发器需要这个驱动(Generic Media Independent Interface device support)。MII是一种用于最高速度为100Mbit/s以太网的接口。以太网线缆用于连接到PHYceiver，这是一种以太网收发器。

为了通过虚拟接口组织许多以太网设备，需要"Ethernet team driver support"。

"MAC-VLAN support"允许用户在特定的MAC地址和某个接口上映射数据包。

TAP字符设备可以由MAC-VLAN接口生成(MAC-VLAN based tap driver)。TAP设备从内核中获取数据包，这样它们就可以被送往其他地方。

下一个特性允许虚拟vxvlan接口在3层网络上创建2层网络(Virtual eXtensible Local Area Network (VXLAN))。这通常用于隧道虚拟网络。

内核发送给网络的消息可任意通过这个特性记录下来(Network console logging support)。除非记录网络信息对你很重要时才启用它。禁用这个特性会增强性能。

这个特性允许不同参数被改变(Dynamic reconfiguration of logging targets)。这些参数包括端口号、MAC地址、IP地址和其他一些设定。

如果用户空间程序希望使用TAP设备，那么启用这个特性可以允许这样的活动(Universal TUN/TAP device driver support)。

这个驱动用于本地以太网隧道(Virtual ethernet pair device)。

"Virtio network driver"用于QEMU、Xen、KVM和其他虚拟机。

下一步，可以启用"ARCnet support"。ARCnet是一种类似令牌环本地局域网络(Local-Area-Network (LAN)协议。ARCnet代表"Attached Resource Computer Network"(附加资源计算器网络)。

现在，我们进入到"ATM drivers"。ATM代表"Asynchronous Transfer Mode"(异步传输模式)。ATM用于电信。

Marevell以太网交换机芯片需要这个驱动(Marvell 88E6060 ethernet switch chip support)。同样，这类交换机的芯片同样需要依赖模型(Marvell 88E6085/6095/6095F/6131 ethernet switch chip support)和(Marvell 88E6123/6161/6165 ethernet switch chip support)。

现在，我们可以学习关于"Ethernet driver support"。

首先我们可以启用/禁用"3Com devices"。接下来允许内核开发者选择支持哪些3Com设备。

下一组选项是对于不同的"Adaptec devices"和接下来的"Alteon devices"。

这些只是特定设备/供应商驱动。通常地，这些驱动被作为模块加入。

在设置了这两组选项后，接下来还有"AMD devices"和"Atheros devices"。

注意：请记住内核会运行在哪类硬件上。对于大量不同的设备，或许最好把它们作为模块加入

这里有不同特定供货商的设备驱动-"Cadence devices"、"Broadcom devices"、"Brocade devices"、"Chelsio devices"、"Cisco devices"、"Digital Equipment devices"。一些其他的特定设备/供应商驱动遵循它们。

接下来的驱动并不是特定设备/供应商的 "SLIP (serial line) support"。这个驱动支持SLIP和CSLIP。SLIP(Serial Line Internet Protocol)是一种用于调制解调器和串口的因特网驱动。PPP现在用来代替SLIP。CSLIP是压缩的SLIP。

下面，"CSLIP compressed headers"可以启用用来压缩TCP/IP头。CSLIP快于SLIP，但是想要启用CSLIP，传输和接收的计算机都必须理解CSLIP。

当在恶劣的模拟线路上使用SLIP时，最好启用"Keepalive and linefill"，这会帮助保持连接。

对于质量差的网络或者7bit网络中运行IP而言，最好启用"Six bit SLIP encapsulation"。

现在我们可以进入流行的USB系统，但是这些是用于网络的USB驱动。

第一个启用/禁用的USB网络设备是"USB CATC NetMate-based Ethernet device support"。这是用于10Mbps的USB以太网EL1210A芯片设备。USB设备将会扮演和成为一个以太网设备即使硬件是USB。

接下来，除了设备是KLSI KL5KUSB101B芯片组(USB KLSI KL5USB101-based ethernet device support)，其他与上面的驱动一样。

Pegasus USB是USB转以太网的适配器/转换器(USB Pegasus/Pegasus-II based ethernet device support)。

接下来是另外一个USB转以太网驱动(USB RTL8150 based ethernet device support)。

下一篇文章中，我们将继续配置USB网络系统。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-14.4765/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出