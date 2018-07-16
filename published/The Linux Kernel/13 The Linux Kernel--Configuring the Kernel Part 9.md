戴文的Linux内核专题：13 配置内核(9)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.498/)

Novell的网络协议IPX通常用于Windows系统和NetWare服务器(The IPX protocol)。IPX代表网间分组交换(Internetwork Packet Exchange)。这是一个网络层协议通常与传输层的SPX协议同时使用。

为了使NetWare服务器在服务的网络中有相同的IPX地址，启用下一个特性(IPX: Full internal IPX network)。不然，每个网络都会看到服务器一个不同的IPX地址。

注意：IPX协议使用IPX寻址，而不是IP寻址。IP地址不是计算机网络中唯一的网络地址。

对于在Apple网络中的Linux系统，需要启用Appletalk(Appletalk protocol support)。苹果计算机和苹果打印机通常使用Appletalk在网络间通信。Appletalk不需要一台中心路由器/服务器并且网络系统是即插即用的。

在Appletalk网络中Linux系统需要使用IP需要"Appletalk interfaces support"(AppleTalk接口支持)。

下一个特性允许用户在Appletalk中使用IP隧道(Appletalk-IP driver support)。

接下来，这个特性允许IP包被封装成Apppletalk帧(IP to Appletalk-IP Encapsulation support)。在网络中，帧是一种标记包的开始和结束的特殊序列位。这个特性会将IP包放在Appletalk包内部。

这个特性允许为先前的特性解包(Appletalk-IP to IP Decapsulation support)。解包器会将IP包从Appletalk包中拿出。

这是另外一个协议层称为"X.25" (CCITT X.25 Packet Layer)。这个协议层通常用于非常大的网络，就像国家公网。许多银行使用这个在他们的扩展网络系统里。X25(拼成"X25"或"X.25")网络拥有将进入数据包打包的包分组交换机。X25正在被更简单的IP协议代替。X25是一个不如TCP/IP有效率的旧协议，但是一些公司发现它在大型、复杂的网络中很有用。

LAPB是用于X.25的数据链路层(LAPB Data Link Driver)。如果上面的启用了，那么这也应该同时启用。LAPB代表的是"Link Access Procedure Balanced"(链路访问过程平衡)。LAPB同样也用于以太网和X.21网卡中(这里没有打错)。X.21是用于物理层(硬件),X.25用于网络层。LPAB会检查错误并确保包被放回正确的序列中。

Nokia调制解调器使用的电话网络协议通常称作"PhoNet"(Phonet protocols family)。Linux计算机远程控制Nokia电话机需要这个特性。

下一个网络通常是用于不同自动设备间的小型无线连接(IEEE Std 802.15.4 Low-Rate Wireless Personal Area Networks support)。802.15.4是一种需要很少电量的简单低数据率协议。这个无线协议最大可扩展到10米。这在通过无线网络连接机器人传感器时是很有用的。任何不该有线缆的机械可能都会从这个代替了绳子的本地无线网络中获益。

如果启用了上面的特性，那么最好明智地启用这个IPv6 压缩特性(6lowpan support over IEEE 802.15.4)。

支持物理层 IEEE 802.15.4协议的SoftMac设备可以启用这个特性(Generic IEEE 802.15.4 Soft Networking Stack (mac802154))。

当有许多包需要传输时，内核必须决定先发送哪一个(它们不能一次全部发送)，所以这个特性帮助内核区分包的优先级(QoS and/or fair queuing)。如果不启用这个，那么内核会使用"first come, first serve approach"("谁先到，谁先服务")。这可能意味着紧急的网络消息需要等待才能轮到它们传输。

在有数据中心服务器的网络中，这个特性强烈建议启用(Data Center Bridging support)。这个特性增强了以太网对数据中心网络的连接。

DNS查询可以在下一个选项中启用(DNS Resolver support)。大多数存储DNS缓存的系统允许计算机无需DNS服务器的辅助下执行DNS查询。

接下来是另一个用于多跳专用网状网络(B.A.T.M.A.N. Advanced Meshing Protocol)。"B.A.T.M.A.N."代表"better approach to mobile ad-hoc networking"(更好接入移动专用网络)。这个工作与有线和无线网络。专用网络没有中心像路由器这类中心设置。每台网络上的设备就像个一台路由器。网状网络是一个简单的概念。每个节点必须路由发送给它的数据。在这个网状网络中，每台计算机连接到全部或几乎全部其他网络设备。当这样的网络画在纸上成为一张地图时，这个网络看上去就像一张网。

当许多网状节点连接到相同的LAN和网时，一些网络信号可能会回环(Bridge Loop Avoidance)(避免桥回环)。这个特性可以避免此类的回环。这些回环可能永远不会结束或者降低性能。避免这样的回环被称为"Bridge Loop Avoidance (BLA)"。

分布式ARP表(Distributed ARP Tables (DAT))被用于增强ARP在稀疏无线网状网络的可靠性(Distributed ARP Table)。

BATMAN协议有些开发者需要用到的调式特性(B.A.T.M.A.N. Debugging)。对于任何调试特性，通常最好禁用它来节省空间以及得到一个更好优化后的内核。

虚拟化环境可以从"Open vSwitch"中得益。这是一个多层以太网交换机。Open vSwitch支持大量的协议。

虚拟机、hypervisor、主机之间的网络连接需要"virtual socket protocol"。这个类似于TCP/IP.这些套接字就像其他网络套接字，但是它们针对虚拟机。这允许客户机系统拥有一个与主机的网络连接。

这是一个可以管理网络优先级的cgroup子系统(Network priority cgroup)。这允许控制组(cgroup)根据发送应用设置网络流量优先级。

BPF过滤器由解释器处理，但是内核可以执行原生BPF过滤通过这个(enable BPF Just In Time compiler)。BPF代表的是"Berkeley Packet Filter"(伯克利报过滤器)。这允许计算机系统支持原生链路层包。

下面，我们有两个网络测试工具。第一个是"Packet Generator"(包生成器)，这用于测试网络时注射数据包(制造空包)。第二个，允许设置一个警报系统，当数据包丢失时警告用户/系统(Network packet drop alerting service)。

Linux内核可以用于无线电系统或者远程控制它们。"Amateur Radio AX.25 Level 2 protocol"用于计算机通过无线电通信。这个无线电协议可以在其他许多的协议中支持TCP/IP。

为了放置在AX.25网络中冲突，启用DAMA(AX.25 DAMA Slave support)。至今为止，Linux还不能作为DAMA的服务器，但是可以作为DAMA的客户端。DAMA代表"Demand Assigned Multiple Access"(按需分配多址访问)。DAMA分配网络流量到特定的信道中去。

NET/ROM是AX.25的路由层。(Amateur Radio NET/ROM protocol)。

NET/ROM的一个替代是"Packet Layer Protocol (PLP)"(包层协议)，它可以运行在AX.25的顶端(Amateur Radio X.25 PLP (Rose))。

控制器局域网络(Controller Area Network (CAN))总线需要这个驱动(CAN bus subsystem support)。CAN总线是一种用于不同目的的串行协议。

使用这个特性(Raw CAN Protocol (raw access with CAN-ID filtering))，CAN总线可以通过BSD套接字API访问

内核中有用于CAN协议的广播管理(Broadcast Manager CAN Protocol (with content filtering))。这个管理提供了很多控制，包括内容过滤。

为了让Linux盒子成为一个CAN路由器和/或者网关，需要这个特性(CAN Gateway/Router (with netlink configuration))。

注意：网关是两个或者更多网络的接口设备，它提供不同的协议。一个简单的定义可以是"网关是一个协议转换器。"

注意：路由器转发网络流量和连接使用相同协议网络。

如果启用了(一些选项)，Linux内核可以支持很多CAN设备(主要是控制器)和接口。所有的CAN驱动都是对于这些设备的不同品牌和型号。在配置工具中，它们有以下这些标题。

- Virtual Local CAN Interface (vcan)
- Serial / USB serial CAN Adaptors (slcan)
- Platform CAN drivers with Netlink support
- Enable LED triggers for Netlink based drivers
- Microchip MCP251x SPI CAN controllers
- Janz VMOD-ICAN3 Intelligent CAN controller
- Intel EG20T PCH CAN controller
- Philips/NXP SJA1000 devices
- Bosch C_CAN/D_CAN devices
- Bosch CC770 and Intel AN82527 devices
- CAN USB interfaces
- Softing Gmbh CAN generic support
- Softing Gmbh CAN pcmcia cards

像Linux中的其他许多特性，CAN设备同样可以启用调试能力(CAN devices debugging messages)。再说一次，记住你内核的目的，你需要调试还是需要性能?

Linux内核同样支持红外线信号协议IrDA (infrared) subsystem support)。IrDa代表的是
"Infrared Data Associations"(红外数据协会)；这是红外信号的标准。

许多人如今想要蓝牙特性(Bluetooth subsystem support)。

RxRPC会话套接字可以启用(RxRPC session sockets)。这些套接字使用RxRPC协议运载网络连接。RxRPC运行于UDP的顶部。

如果启用的话，Linux内核可以支持"RxRPC dynamic debugging"(RxRPC 动态调试)。

RxRPC拥有kerberos 4和AFS kaserver安全特性可以启用(RxRPC Kerberos security)。Kerberos是一种每个网络设备在传输任何数据前都被需要证明彼此的身份的验证协议。

对于电脑的无线网络设备像Wifi，配置工具需要启用无线局域网(802.11)设备(cfg80211 - wireless configuration API)。cfg80211代表"Configuration 802.11"(配置 802.11)。802.11是一种无线规范。

"nl80211 testmode command"是用于校准并且/或验证的实用工具，它无线设备芯片上执行这些任务。

下一个设置允许用户"enable developer warnings"(启用开发者警告)对于cfg80211设备。

下面，"cfg80211 regulatory debugging"(cfg80211调控调试)可以启用。

下面的设定是"cfg80211 certification onus"(cfg80211证书义务)。

应该为cfg80211兼容设备启用省电特性(enable powersave by default)。

cfg80211支持debugfs入口(cfg80211 DebugFS entries)。

无线设备有它们遵守的调整规则；这些被存储在数据库中(use statically compiled regulatory rules database)(使用静态编译的调整规则数据库)

一些使用基于cfg80211的驱动扩展可能需要使用一个老的用户空间。这个特性允许这个行为(cfg80211 wireless extensions compatibility)(cfg80211 无线扩展兼容)。

lib80211可以提供调试特性(lib80211 debugging messages)。

独立于硬件的IEEE 802.11标准可以启用(Generic IEEE 802.11 Networking Stack (mac80211))。mac80211是一种用于编写softMAC无线设备驱动的框架。SoftMac允许很好地控制和配置设备。

下一个特性允许mac80211使用PID控制器管理TX(发送)速率(PID controller based rate control algorithm)(PID控制器基于速率控制算法)。TX单位是BFS(Bits per minute)(位/秒)。特别地，这个特性是用于控制数据流速率的算法。

另外一个相同特性的算法叫做"Minstrel"。这是一个比TX速率管理算法更精确和有效的算法。

Minstrel同样支持802.11n(Minstrel 802.11n support)。

由于有两种TX速率控制算法，但只能使用一种。所哟必须设备一个默认的(Default rate control algorithm (Minstrel))。通常地，最好选择Minstrel作为默认。

802.11s网状网络草案可以在内核中启用(Enable mac80211 mesh networking (pre-802.11s) support)。802.11s草案是网状网络的无线标准。

对于支持这个特性的设备，对于不同包流量时间的LED除法器特性可以启用(Enable LED triggers)。在我的以太网设备商上，当端口是活跃时LED灯会点亮。这些驱动可以是这些LED在包流量时间下工作。

mac80211同样支持debugfs特性(Export mac80211 internals in DebugFS)。

这是一个独立于典型日志系统收集mac80211调试信息的特性(Trace all mac80211 debug messages)。

这是另外一组mac80211调试特性，但是这些使用的是典型日志系统(Select mac80211 debugging features --->)。在这个菜单，选择你需要的调试特性。

在下一篇文章中，我们还有更多的需要配置。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-9.4568/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出