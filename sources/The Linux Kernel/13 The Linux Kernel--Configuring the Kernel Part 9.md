13 The Linux Kernel: Configuring the Kernel Part 9
================================================================================
![](http://www.linux.org/attachments/slide-jpg.498/)

The Novell networking protocol, IPX, is commonly used between Windows systems and NetWare servers (The IPX protocol). IPX stands for Internetwork Packet Exchange. This is a network layer that is commonly used with the SPX protocol that is the transport layer.

To give a NetWare server the same IPX address on all of the networks it serves, enable this next feature (IPX: Full internal IPX network). Otherwise, each network will see the server as having a different IPX address.

NOTE: The IPX protocol uses IPX addressing, not IP addressing. IP addresses are not the only network addresses in computer networking.

For Linux systems on an Apple network, it will help to enable Appletalk (Appletalk protocol support). Apple computers and Apple printers commonly use Appletalk to communicate across a network. Appletalk does not require a central router/server and the network system is pug-and-play.

Linux systems that need to use IP on an Appletalk network will need "Appletalk interfaces support".

The next feature allows users to have IP tunneled in Appletalk (Appletalk-IP driver support).

Next, this feature permits IP packets to be encapsulated in Appletalk frames (IP to Appletalk-IP Encapsulation support). In networking, a frame is a special sequence of bits that marks the beginning and end of packets. This feature would place IP packets inside of Appletalk packets.

This setting allows the decapsulator to be enabled for the previous feature (Appletalk-IP to IP Decapsulation support). The decapsulator takes the IP packet out of the Appletalk packet.

This is another protocol layer called "X.25" (CCITT X.25 Packet Layer). This layer is usually enabled for very large networks like country wide public networks. Many banks use this in their extensive network systems. X25 (spelled “X25” or “X.25”) networks have packet-switching exchange (PSE) nodes which are devices that package the incoming data into packets. X25 is being replaced by IP which is more simple than X25. X25 is an old protocol that is not as efficient as TCP/IP, but some companies find it very useful in large, complex networks.

LAPB is a data link layer used by X.25 (LAPB Data Link Driver). If the above is enabled, then this should also be enabled. LAPB stands for "Link Access Procedure Balanced". LAPB can also be used on Ethernet and X.21 (this is not a typo) network cards. X.21 is a protocol used on the physical layer (hardware) and X.25 is used on the network layer. LAPB checks for errors and ensures the packets are placed back in the correct sequence.

Nokia modems use the phone network protocol commonly called PhoNet (Phonet protocols family). Linux computers controlling Nokia phones remotely need this feature.

The next network protocol is for small wireless connections between various automatic devices (IEEE Std 802.15.4 Low-Rate Wireless Personal Area Networks support). 802.15.4 is a simple low data rate protocol that requires little amounts of power. This wireless protocol extends out a maximum of about ten meters. This can be useful in robotics when connecting sensors through a wireless network. Any type of machinery that should not have cables may benefit from this local wireless network in place of cords.

If the above feature was enabled, it may be wise to enable this IPv6 compression feature (6lowpan support over IEEE 802.15.4).

SoftMAC devices that support IEEE 802.15.4 at the PHY level can use this feature (Generic IEEE 802.15.4 Soft Networking Stack (mac802154)).

When many packets need to be transmitted, the kernel must decide which ones to send out first (they cannot all be sent out at once), so they feature will help the kernel prioritize the packets (QoS and/or fair queuing). If this is not enabled, then the kernel will use a "first come, first serve approach". This would mean urgent networking messages will need to wait for their turn for transmission.

On networks with a data center server, this feature is highly recommended (Data Center Bridging support). This feature enhances the Ethernet connections for data center networks.

DNS lookups will be enabled with this next ability (DNS Resolver support). Most systems store DNS cache that allows the computer to perform a DNS lookup itself without the aid of a DNS server.

Next is another routing protocol for multi-hop ad-hoc mesh networks (B.A.T.M.A.N. Advanced Meshing Protocol). "B.A.T.M.A.N." stands for "better approach to mobile ad-hoc networking". This works on wired and wireless networks. Ad-hoc networks have no central infrastructure like routers and such. Each device on the network behaves like a router. Mesh networks are a similar concept. Each node must route data sent to it. In a mesh network, each computer is connected to all or nearly all of the other network devices. When such networks are written on a paper to make a map, the network looks like a mesh.

When many mesh nodes are connected to the same LAN and mesh, some network signals may loop (Bridge Loop Avoidance). This feature will prevent such looping. These loops may never end or harm performance. Preventing such looping is called Bridge Loop Avoidance (BLA).

Distributed ARP Tables (DAT) are used to enhance ARP reliability on sparse wireless mesh networks (Distributed ARP Table).

The BATMAN protocol has some debugging features that may be used by developers (B.A.T.M.A.N. Debugging). As with any debugging feature, it is usually best to disable it to save space and have a better optimized kernel.

Virtualized environments can benefit from "Open vSwitch". This is a multilayer Ethernet switch. Open vSwitch supports numerous protocols.

Network connections between virtual machines, hypervisors, and the host needs the "virtual socket protocol". This is similar to TCP/IP. These sockets are like other network sockets, but they are for virtual machines. This allows a guest OS to have a network connection with the host.

There is a cgroup subsystem that can manage network priorities (Network priority cgroup). This control group gives network traffic priority based on the sending application.

BPF filtering is handled by an interpreter, but the kernel can perform BPF filtering natively with this enabled (enable BPF Just In Time compiler). BPF stands for "Berkeley Packet Filter". This allows the computer system to support raw link-layer packets.

Next, we have two network testing tools. The first one is a "Packet Generator" which injects packets (makes void packets) for testing the network. The second, allows an alert system to be setup to alert the user/system when packets are dropped (Network packet drop alerting service).

The Linux kernel can be made to run radio systems or control them remotely. The "Amateur Radio AX.25 Level 2 protocol" is used for computer communication via radio. This radio protocol can support TCP/IP among many other protocols.

To prevent collisions on an AX.25 network, enable DAMA (AX.25 DAMA Slave support). So far, Linux cannot act as a DAMA server, but it can be a DAMA slave. DAMA stands for Demand Assigned Multiple Access. DAMA assigns network traffic to particular channels.

NET/ROM is a routing layer for AX.25 (Amateur Radio NET/ROM protocol).

An alternative to NET/ROM is Packet Layer Protocol (PLP) which also runs on top of AX.25 (Amateur Radio X.25 PLP (Rose)).

The Controller Area Network (CAN) bus devices need this driver (CAN bus subsystem support). CAN is a serial protocol with various purposes.

The CAN bus can be access through the BSD socket API with this feature (Raw CAN Protocol (raw access with CAN-ID filtering)).

A broadcast manager for the CAN protocol is available for the kernel (Broadcast Manager CAN Protocol (with content filtering)). This manager offers many controls including content filtering.

To make a Linux box a CAN Router and/or gateway, this feature is needed (CAN Gateway/Router (with netlink configuration)).

NOTE: A gateway is an interface device between two or more networks that each support different protocols. A simple definition would be a gateway is a protocol converter.

NOTE: A router redirects network traffic and connects networks together that use the same protocols.

There are many CAN devices (mainly controllers) and interfaces that the Linux kernel can support if enabled. All of the CAN drivers are for different brands and models of these types of devices. In the configuration tool, they have titles as seen below.


Virtual Local CAN Interface (vcan)
Serial / USB serial CAN Adaptors (slcan)
Platform CAN drivers with Netlink support
Enable LED triggers for Netlink based drivers
Microchip MCP251x SPI CAN controllers
Janz VMOD-ICAN3 Intelligent CAN controller
Intel EG20T PCH CAN controller
Philips/NXP SJA1000 devices
Bosch C_CAN/D_CAN devices
Bosch CC770 and Intel AN82527 devices
CAN USB interfaces
Softing Gmbh CAN generic support
Softing Gmbh CAN pcmcia cards

Like the many other features in the kernel, CAN devices also have debugging abilities that can be enabled (CAN devices debugging messages). Again, remember the purpose of your kernel - will you need debugging or do you want performance?

The Linux kernel also supports protocols for infrared signals (IrDA (infrared) subsystem support). IrDA stands for "Infrared Data Associations"; this is a standard for infrared signals.

Many people today will want these Bluetooth abilities (Bluetooth subsystem support).


RxRPC session sockets can be enabled (RxRPC session sockets). These sockets carry network connections that are using the RxRPC protocol. RxRPC runs on top of UDP.

The Linux kernel can support "RxRPC dynamic debugging" if enabled.

RxRPC has kerberos 4 and AFS kaserver security abilities that can be enabled (RxRPC Kerberos security). Kerberos is an authentication protocol where each network device is required to prove each other's identity to each other before any data transaction.

The configuration tool for wireless LAN (802.11) devices should be enabled for computers that have a wireless device like Wifi (cfg80211 - wireless configuration API). cfg80211 stands for Configuration 802.11. 802.11 is a wireless specification.

The "nl80211 testmode command" is used for calibration and/or validation utilities that perform such tasks on chips for wireless devices.

The next setting allows users to "enable developer warnings" for cfg80211 devices.

Next, "cfg80211 regulatory debugging" can be enabled.

The following cfg80211 setting is for "cfg80211 certification onus".

Powersaving features should be enabled for cfg80211 compatible devices (enable powersave by default).

cfg80211 supports debugfs entries (cfg80211 DebugFS entries).

Wireless devices have regulatory rules that they follow; these are stored in a database (use statically compiled regulatory rules database).

Some wireless extensions that use cfg80211-based drivers may need to use an old userspace; this feature permits that action (cfg80211 wireless extensions compatibility).

lib80211 can provide debugging features (lib80211 debugging messages).

The hardware independent IEEE 802.11 standard can be enabled (Generic IEEE 802.11 Networking Stack (mac80211)). mac80211 is a framework used to make SoftMAC wireless drivers. SoftMAC allows better control and configuration of the device.

This next feature allows the mac80211 to use a PID controller to manage the TX rate (PID controller based rate control algorithm). TX rate is the BPS (Bits per minute). Specifically, this feature is the algorithm for controlling the rate of data flow.

Another algorithm for the same feature is called "Minstrel". This is a much more precise and efficient TX rate managing algorithm.

Minstrel also supports 802.11n (Minstrel 802.11n support).

Because there are two TX rate controlling algorithms, only one can be used, so a default must be set (Default rate control algorithm (Minstrel)). Generally, it is best that Minstrel be the default.

Draft 802.11s mesh networking can be supported by the kernel (Enable mac80211 mesh networking (pre-802.11s) support). Draft 802.11s is a wireless standard for mesh networking.

For hardware that supports this feature, LED triggers for various packet traffic events can be enabled (Enable LED triggers). On many Ethernet devices, there is an LED that lights up when the port is active. This driver will make those LEDs work during packet traffic events.

mac80211 also supports debugfs features (Export mac80211 internals in DebugFS).

Here is a feature that collects mac80211 debug messages independently of the typical logging system (Trace all mac80211 debug messages).

There is also another set of mac80211 debugging abilities, but these use the typical logging system (Select mac80211 debugging features --->). In this menu, select the debugging features you need (if any).

In the next article, we still have a lot more to configure. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-9.4568/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出