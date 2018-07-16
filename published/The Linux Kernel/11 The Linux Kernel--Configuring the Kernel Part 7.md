戴文的Linux内核专题：11 配置内核(7)
================================================================================
![](http://www.linux.org/attachments/slide-jpeg.474/)

来享受这个Linux内核系列的下一篇文章。我们将继续配置PCI特性，接着是计算机中最重要的特性-网络。

进程地址空间标识符(Process Address Space Identifiers (PASIDs))允许PCI设备同时访问多个IO地址空间(PCI PASID support)。这个特性需要一个支持PASIDs支持的IOMMU。

下面我们可以启用/禁用"PCI IO-APIC hotplug support"。APIC代表高级可编程中断控制器(Advanced Programmable Interrupt Controllers)。可编程中断控制器(PIC)收集所有来自不同源发给一个或者多个CPU流水线的中断。高级PIC与PIC一样，但是它们有更多的特性像高级中断管理和更多的优先级模型。热插拔是一种在系统在运行时加入一件设备的能力并且不需要重启。这个驱动是为了PCI主板能拥有处理输入/输出APIC热插拔的能力。

在这之后，下面的问题询问的是启用"ISA-style DMA support"。在前文中提到过，DMA是直接内存访问，它是一种设备无需借助CPU直接访问内存的能力。ISA代表的是工业标准架构(Industry Standard Architecture),它是一种像PCI的总线标准。这个特性允许在ISA主板上支持DMA。

现在，我们可以移步到"PC Card (PCMCIA/CardBus) support"。PCMCIA代表的是个人计算机存储卡国际协会(Personal Computer Memory Card International Association)。PC卡、PCMCIA卡和Cardbus卡都是卡片形状的笔记本外设。

下一个PCMCIA选项处理"16-bit PCMCIA support"。一些旧的计算机使用16位PCMCIA卡。

为了从用户空间加载卡式信息结构(Card Information Structure (CIS))以使PCMCIA卡正常工作，这个特性应该启用(Load CIS updates from userspace)。

CardBus是16位PCMCIA的更新32位版本。这个驱动提供对这类设备的支持(32-bit CardBus support)。为了使用32位PC卡，需要一个兼容Cardbus的主机桥。

下面的驱动提供对上面提到的CardBus桥支持(CardBus yenta-compatible bridge support)。这是PCMCIA卡插入的硬件端口。

下面三个选项"Special initialization for O2Micro bridges"、"Special initialization for Ricoh bridges"和"Special initialization for TI and EnE bridges"。它们都是不同类型卡桥。

接下来，提供了"Auto-tune EnE bridges for CB cards"的驱动。

"Special initialization for Toshiba ToPIC bridges"可以在下一个选项中启用/关闭。

下一个提供的设备驱动是"Cirrus PD6729 compatible bridge support"。这在一些老的笔记本上需要。

下一个PCMCIA桥驱动是Itel的"i82092 compatible bridge support"。这也在一些老的笔记本上出现。这是另外一种桥驱动。

在这之后，以下的选项询问关于是否启用"Support for PCI Hotplug"。

下一步，ACPI PCI热插拔可以启用(ACPI PCI Hotplug driver)。这个驱动允许拥有ACPI的PCI设备热插拔(这个特性之前已经讨论过)。

对于IBM系统，为了ACPI热插拔下一个驱动应该启用(ACPI PCI Hotplug driver IBM extensions)。这就像上面的特性但特定与IBM设备。

对于带有支持CompactPCI热插拔支持的CompactPCI卡的系统，启用"CompactPCI Hotplug driver"。

下面，我们有一个选项对于另一种CompactPCI系统卡(Ziatech ZT5550 CompactPCI Hotplug)。

使用#ENUM热插拔信号通过标准IO口作为系统注册位的CompactPCI卡需要这个驱动(Generic port I/O CompactPCI Hotplug)。

使用SHPC PCI热插拔控制器的主板需要下一个驱动(SHPC PCI Hotplug driver)。SHPC代表的是标准热插拔控制器(Standard Hot-Plug Controller)。这对于PCI主板是一个通用热插拔系统。

RapidIO互联设备也需要一个特殊的驱动(RapidIO support)。RapidIO芯片和主板快于PCI和PCIe。

"IDT Tsi721 PCI Express SRIO Controller"是一个特殊类型的RapidIO控制器。

下一个选项允许开发者输入在主机完成枚举前系统发现节点应该等待多久时间(以秒计)。这通常选择默认值

下一个特性会允许RapidIO系统接受除了维护信号外其他流量(Enable RapidIO Input/Output Ports)。

为了使用DMA引擎框架从RIO设备上发送或接收RapidIO数据，启用这个驱动(DMA Engine support for RapidIO)。RIO设备是可重配的输入/输出设备。RapidIO使用NREAD和NWRITE请求来在本地和远程内存间传输数据，因此驱动需要允许RapidIO使用DMA访问RIO设备。DMA控制器需要在内存中完成这个特性。

如果允许，RapidIO可以提供调试信息(RapidIO subsystem debug messages)。如前面所说，调试特性可以禁用，除非你或者其他人使用的内核需要调试特性。

下一个驱动提供"IDT Tsi57x SRIO switches support"。这是一组串口RapidIO开关，下面的四个选项是对于不同串口RapisIO开关驱动-"IDT CPS-xx SRIO switches support"、"Tsi568 SRIO switch support"、"IDT CPS Gen.2 SRIO switch support"和"Tsi500 Parallel RapidIO switch support"。

管理这些驱动后，我们可以继续其他的内核选项。下一个选项提供对ELF的支持(Kernel support for ELF binaries)。可执行与可链接格式(Executable and Linkable Format (ELF))支持是一种可执行文件规范。强烈建议启动这个。

为了执行那些需要解释器的脚本和二进制文件，这个特性必须启用(Kernel support for MISC binaries)。这些可执行文件的类型通常称为包装器驱动的二进制格式。例如包括Python2/3、 .NET、Java、DOS执行程序等等。

当这个选项启用时(Enable core dump support)，内核可以生成崩溃文件。这是一个调试特性。除非这个内核是用来调试(无论内核本身还是软件)，不然这个并不必要。

64位处理器可以执行32位程序如果启用了"IA32 Emulation"。最好启用这个特性除非开发者确定内核永远不会运行32位代码。

老式的a.out二进制文件也被支持(IA32 a.out support)。就像它称呼的那样，"汇编输出"(Assembler Output),这是一种已编译代码的文件格式。

下一个设置允许32位处理器访问完整的64位寄存器文件和宽数据路径(x32 ABI for 64-bit mode)。然而，仍旧使用32位指针。这些32位进程将比同样的为64位编译的进程使用内存更少，因为他们使用32位指针

下面，我们将讲网络支持。

我们第一个网络设定是启用一般的网络(Networking Support)。很少有开发者会禁用这个特性。如果他们这么做了，内核会变得又小又快，但是它将无法使用Wifi、蓝牙、以太网或者任何由网络设备或协议处理的连接。一些在独立系统上程序也需要这个特性，即使硬件上不存在网络设备。举例来说，X11依赖于网络特性。如果你能提供一个替代方案在屏幕上显示图形，你才能在内核中禁用网络特性。

"Packet socket"允许在没有中介物的情况下，进程与网络设备间进行通信。这个增强了性能。

ss工具需要启用这个特性用来数据包监控(Packet: sockets monitoring interface)。包监控意味着监视相关本地设备的网络流量。

"Unix domain sockets" (Unix域套接字)是用来建立和访问网络连接。X窗口系统需要这个特性；这是一个极好的例子来说明为什么即使系统中不会使用网络但是仍然在内核中启用网络特性。Unix域套接字是运行在同一台机器上的进程间的网络协议。

上面的Unix套接字可以被ss工具监控，但是下面一个特性必须先启用(UNIX: socket monitoring interface)。

转换(Transformation (XFRM))用户配置接口被许多Linux原生工具用到，所以这个特性强烈建议启用(Transformation user configuration)。这个会启用Ipsec-Internet Protocol SECurity(互联网协议安全)。Ipsec控制着验证并且/或者加密IP数据包。

下一个特性允许开发者给予网络数据包第二个政策(称作sub-policy)(Transformation sub policy support)。

IPsec安全联合定位器可以当这个特性启用时(Transformation migrate database)动态更新。使用移动IPv6的设备需要这个特性。当计算机与路由器或者任何形式的网络设备设置了一个网络连接，安全协议会确保两者不会意外地连接到网络上的其他设备上。IP数据包被设定发送到一个特定的设备上。然而，移动设备会使用不同的网络，比如说提供了4G信号，也需要能够使用相同的连接到新的网络点上。即使可能是相同的4G供应商，不同的设备会提供一个4G连接到它的物理位置。当设备处在新的区域时，它仍会使用相同的IP地址。

下一个特性是显示在包处理中的传输错误统计(Transformation statistics)。这对开发者有用。如果不需要，可以禁用掉它。

"PF\_KEY sockets"与KAME套接字兼容且它在使用从KAME移植来的IPsec工具时有用。KAME是IPv4 IPsec、IPv6 IPsec和IPv6的免费协议栈。

这是另外一个需要的移动IPv6特性，它增加了到PF\_KEYv2套接字的PF\_KEY MIGRATE消息(PF\_KEY MIGRATE)。

下面的是最重要的并且是在网络中最著名的需要启用的特性-"TCP/IP networking"。大多数网络(包括因特网)依赖于这个协议。甚至X窗口系统也使用TCP/IP。这个特性甚至允许用户ping它们自己(命令：ping 127.0.0.1)。要使用因特网或者X11，这个必须启用。

为了寻找网络中数个计算机，"IP: multicasting"必须启用。多播是一种给多台计算机但不是全部计算机发送消息的能力。广播会给网络中的所有计算机发送信号。

如果这是一个路由器Linux系统的内核,那就启用这个选项(IP: advanced router)。

如果下面的特性启用了，那么IP地址会在启动时自动配置(IP: kernel level autoconfiguration)。当用户希望不用配置就能连接到一个网络时是很有用的。

启用了DHCP协议支持，那么Linux系统可以通过网络像NFS挂载它的根文件系统并且使用DHCP发现IP地址(IP: DHCP support)。这允许Linux系统通过网络拥有它的远程根文件系统而不必用户在每次系统启动时手动管理进程。

下面的选项和上面的类似除了使用的是BOOTP而不是DHCP(IP: BOOTP support。BOOTP是自举协议；这个协议使用UDP而不是TCP并且只能使用IPv4网络

RARP是一个被BOOTP和DHCP替代了的旧协议，但是它仍可以加到内核中(IP: RARP support)。

网络协议可以在另一个概念中使用，称作"隧道"。这个特性可以用在Linux内核中(IP: tunneling)。安全shell协议(The secure shell protocol (SSH))就是隧道协议的一个例子。SSH需要这个特性。

下面的驱动可以多路复用通用路由封装包(GRE (Generic Routing Encapsulation))(IP: GRE demultiplexer)。多路复用是一个使单个信号进入不同部分的过程(这不会复制消息，只是分解它)。GRE是一种隧道协议。

下面的特性允许GRE通道在IP连接中形成(IP: GRE tunnels over IP)。这允许GRE隧道在IP网络中形成。

当启用这个特性(IP: broadcast GRE over IP)，广播可以通过IP使用GRE。

在Linux系统的路由器内，为了让IP包发往多个地址，需要启用这个(IP: multicast routing)。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-7.4490/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出