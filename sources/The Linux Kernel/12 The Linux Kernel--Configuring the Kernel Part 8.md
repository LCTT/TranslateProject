12 The Linux Kernel: Configuring the Kernel Part 8
================================================================================
![](http://www.linux.org/attachments/slide-jpg.484/)

In this article, we will continue configuring the network abilities. Remember, networking is the most important characteristic of computers, so this article and the networking ones after this are important to know.

Before we begin the next part of this series, I want to clarify something. This configuration process does not edit the current kernel on your system. This process is configuring the source code before a new kernel is compiled (or cross-compiled). Once I finish going through the configuration process, then I will discuss the topics that were suggested to me by my readers. Also, as a reminder, the text in the quotes or parenthesis of the first or (rarely) the second sentence of each paragraph is the name of the setting in the configuration tool.

First, we can enable two different Sparse Mode Protocol Independent Multicast routing protocols ("IP: PIM-SM version 1 support" and "IP: PIM-SM version 2 support"). A multicast is like a broadcast, but a broad cast sends signals to all computers while a multicast sends messages to a selective group or set of computers. All PIM protocols are multicasting routing protocols that work on IP.

NOTE: When a computer communicates with one other computer or server, this is called a unicast – just in case you were wondering.

The next network feature to configure is "ARP daemon support". This allows the kernel to have a list of IP addresses and their respective hardware addresses in internal cache. ARP stands for Address-Resolution-Protocol.

For extra security, "TCP syncookie support" should be enabled. This protects computers from SVN flood attacks. Hackers or malware could send SVN messages to a server to consume resources that would allow real visitors to use the service provided by the server. The SVN message opens a connection between a computer and a server. The Syncookie blocks SVN messages that are not legitimate. Then, real users can still access the site without hackers consuming bandwidth. Servers should have this feature enabled.

The following feature is for "Virtual (secure) IP: tunneling". Tunneling is the encapsulation of one network protocol into another. Secure tunnels are needed when making virtual private networks (VPN).

Next, enabling "AH transformation" adds support for the IPsec Authentication Header. This is a security measure that manages data authentication.

After that, enabling "ESP transformation" adds support for the IPsec Encapsulation Security Protocol. This is a security measure with encryption and optional data authentication.

The Linux kernel supports the IP Payload Compression Protocol if this feature is enabled (IP: IPComp transformation). This is a lossless compression system. Lossless refers to the fact that the data remains in its complete form. After the uncompression, there is no difference in the data before or after compression. The compression is performed before encryption. This compression protocol speeds up networks because less data is moving.

The next three settings deal with different IPsec features ("IP: IPsec transport mode", "IP: IPsec tunnel mode", and "IP: IPsec BEET mode"). IPsec stands for Internet Protocol SECurity. Transport mode is the default IPsec mode for connections between two computers and/or servers. Transport mode uses either an AH or an ESP header and only encrypts the IP header. In tunnel mode, the IP header and payload are encrypted. Tunnel mode is usually used when connecting a gateway to a server or gateway or a server to a server. BEET mode (Bound End-to-End Tunnel) does not reconnect when the IP address changes; the BEET mode connection remains connected. BEET mode uses less bytes than the other modes.

Next, the kernel can be given support for large IPv4/TCP offloads that are received (Large Receive Offload (ipv4/tcp)). The network interface cards (NIC) process the TCP/IP stacks. This feature adds code to the kernel to process large stacks.

INET socket monitoring can be enabled (INET: socket monitoring interface). INET sockets go to the Internet. This feature (when enabled) watches the connections and traffic to and from the Internet.

Here is another socket monitoring interface (UDP: socket monitoring interface). This one is for User Datagram Protocol (UDP). Again, this feature watches the sockets for UDP.

The following setting enables various TCP congestion controls (TCP: advanced congestion control). If the network gets too busy or the bandwidth is full, then many computers must wait for some bandwidth or their data stream will be slow. It helps network performance if the traffic is managed properly.

TCP connections can be protected with MD5 (TCP: MD5 Signature Option support). This is used for protecting Border Gateway Protocol (BGP) connections between core routers. Core routers are the main routers of a network; these routers are sometimes referred to as the “backbone of the Internet/network”. BGP is a protocol for making routing decisions.

The next setting allows you to enable/disable "The IPv6 protocol". When this is enabled, IPv4 will still work well.

The following feature is a special privacy ability (IPv6: Privacy Extensions (RFC 3041) support). This makes the system generate and use a different random address for the network interface.

NOTE: Nothing is computers is truly random. Random numbers and strings in computers are often called pseudo-random.

On networks with multiple routers, this feature will allow the system to more efficiently figure out which one to use (IPv6: Router Preference (RFC 4191)).

After that, an experimental feature for dealing with route information can be enabled/disabled (IPv6: Route Information (RFC 4191)). Remember, when making a stable kernel, only install experimental features unless you really need the feature in question.

Sometimes, when a system autoconfigures its IPv6 address, it may get an IPv6 address that is already used on the network. This experimental feature allows Duplicate Address Detection (DAD) (IPv6: Enable RFC 4429 Optimistic DAD).

IPv6 can get support for various IPsec features ("IPv6: AH transformation" and "IPv6: ESP transformation").

IPv6 can also use the IP Payload Compression Protocol discussed previously (IPv6: IPComp transformation).

There is even mobility support for IPv6 (IPv6: Mobility). This permits mobile devices using IPv6 to be able to use other networks while retaining the same IP address.

Again, there are some IPsec features for IPv6 ("IPv6: IPsec transport mode", "IPv6: IPsec tunnel mode", and "IPv6: IPsec BEET mode").

When enabled, IPv6 can support MIPv6 route optimization (IPv6: MIPv6 route optimization mode). This ensures the shortest and best network path is made. The download and upload speeds are faster if the messages are sent through less routers and other network devices.

If an administrator needs to connect two IPv6 networks, but it can only be done through an IPv4 connection, this kernel feature will make that possible (IPv6: IPv6-in-IPv4 tunnel (SIT driver)). This tunnels IPv6 through IPv4.

This tunneling feature is for IPv6-in-IPv6 and IPv4 tunneled in IPv6 (IPv6: IP-in-IPv6 tunnel (RFC2473)).

Another tunneling feature is seen (IPv6: GRE tunnel). This one allows GRE tunnels.

Multiple routing tables can be supported (IPv6: Multiple Routing Tables). A routing table is a list of network locations and the paths to take to get data to the destinations.

Routing can be done by source address or prefix with IPv6 if enabled (IPv6: source address based routing).

"IPv6 Multicast routing" is still experimental. IPv4 and IPv6 handle multicasting differently.

Typical multicast routers decide what should be done to multicast packets based on destination and source addresses (IPv6: multicast policy routing). Enabling this feature will allow interfaces and packet marks to be included in the decision making.

Next, the PIM-SMv2 multicast routing protocol can be enabled for IPv6 (IPv6: PIM-SM version 2 support). This is the same PIM mentioned previously with IPv4. Because IP v4 and v6 are different, PIM can be activated for v4 and/or v6.

Network packet labeling protocols (like CIPSO and RIPSO) can be enabled (NetLabel subsystem support). These labels contain security information and permissions.

Network packets can be made more secure by enabling security marking (Security Marking).

This network feature adds some overhead (Time-stamping in PHY devices). PHY devices can time-stamp network packets. PHY stands for “PHYsical layer”. These devices manages received and transmitted data.

A netfilter can be enabled (Network packet filtering framework). Netfilters filter and mangle passing network packets. A packet filter is a type of firewall. If the packet matches certain criteria, the packet is not allowed through.

The Datagram Congestion Control Protocol can be enabled (The DCCP Protocol). DCCP permits bi-directional unicast connections. DCCP is helpful with streaming media, Internet telephony, and on-line games.

Next, the Stream Control Transmission Protocol can be enabled (The SCTP Protocol). SCTP works on top of IP and is a stable and reliable protocol.

The following protocol is the Reliable Datagram Sockets protocol (The RDS Protocol).

RDS can use Infiniband and iWARP as a transport that supports RDMA operations (RDS over Infiniband and iWARP). Infiniband and iWARP are both protocols. RDMA stands for remote direct memory access. RDMA is seen when a remote computer accesses another's RAM directly without the need of the local computer's operating system assistance. It is like direct memory access (DMA) but with a remote computer rather than this taking place locally.

RDS can also use TCP as a transport (RDS over TCP).

Next, "RDS debugging messages" should be disabled.

This next network protocol is for clusters (The TIPC Protocol). A cluster is a group of computers that act as one. They need a way to communicate, so they use the Transparent Inter Process Communication (TIPC) protocol.

This high-speed protocol uses packets with a fixed size (Asynchronous Transfer Mode (ATM)).

IP can be used on ATM to communicate with systems using IP that are connected to a ATM network (Classical IP over ATM).

This next feature disables the "ICMP host unreachable" error message (Do NOT send ICMP if no neighbor). This prevents problems when the ATMARP tables from being removed due to a revalidation. ATMARP tables manage address resolution. ICMP stands for Internet Control Message Protocol and is usually used for sending error messages across a network.

LAN Emulation (LANE) emulates LAN services on an ATM network (LAN Emulation (LANE) support). A LANE computer can be a proxy that bridges Ethernet and ELAN segments.

"Multi-Protocol Over ATM (MPOA) support" allows ATM devices to send connections over subnetwork boundaries.

With this feature, ATM PVCs will behave like Ethernet, at least from the kernel's perspective (RFC1483/2684 Bridged protocols). PVC stands for permanent virtual circuit. A virtual connection is a packet-based connection that uses other higher protocols along with the main/original protocol.

The "Layer Two Tunneling Protocol (L2TP)" makes tunneling transparent to applications. Virtual Private Networks (VPNs) uses L2TP.

To make a Linux-based Ethernet bridge, enabled this bridging feature (802.1d Ethernet Bridging). In networking, a bridge connects two or more networks together. An Ethernet bridge is a hardware bridge that uses Ethernet ports.

"IGMP/MLD snooping" is the ability for an Ethernet bridge to be able to selectively forward multicast signals based on the IGMP/MLD load. Disabling this feature can reduce the kernel size significantly. IGMP stands for Internet Group Management Protocol which is a protocol used to set up multicast groups. MLD stands for Multicast Listener Discovery.

This next filtering feature allows Ethernet bridges to selectively manage traffic based on VLAN information seen in each packet. Disabling this feature reduces the size of the kernel being made.

VLAN interfaces can be created on Ethernet interfaces with this feature enabled (802.1Q VLAN Support).
Next, "GVRP (GARP VLAN Registration Protocol)" support allows the GVRP protocol to be used to register certain values from network devices.

After that, "MVRP (Multiple VLAN Registration Protocol) support" can be enabled. MVRP is a newer alternative to GVRP.

"DECnet Support" is a network protocol made by Digital. This is a stable and safe protocol.

"DECnet router support" allows users to make a Linux-based router that supports DECnet.

NOTE: Linux can be used as a server, workstation, router, cluster, firewall, and supports many other uses.

This next feature will enable Logical Link Layer type 2 (ANSI/IEEE 802.2 LLC type 2 Support). This layer allows multiple protocols to be used on the same network equipment. It is highly recommended that this be enabled in environments where networks are important. It may be best if all kernels supported this feature.

In the next article, we will discuss more about the networking abilities that can be configured.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-8.4525/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出