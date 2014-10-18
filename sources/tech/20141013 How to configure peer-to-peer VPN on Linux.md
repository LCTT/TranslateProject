[felixonmars translating...]

How to configure peer-to-peer VPN on Linux
================================================================================
A traditional VPN (e.g., OpenVPN, PPTP) is composed of a VPN server and one or more VPN clients connected to the server. When any two VPN clients talk to each other, the VPN server needs to relay VPN traffic between them. The problem of such a hub-and-spoke type of VPN topology is that the VPN server can easily become a performance bottleneck as the number of connected clients increases. The centralized VPN server is also a single point of failure in a sense that if the VPN server goes down, the entire VPN is no longer accessible to any VPN client.

Peer-to-peer VPN (or P2P VPN) is an alternative VPN model that addresses these problems of the traditional server-client based VPN. In a P2P VPN, there is no longer a centralized VPN server. Any node with a public IP address can bootstrap other nodes into a VPN. Once connected to a VPN, each node can communicate with any other node in the VPN directly, without going through an intermediary server node. When any one node goes down, the rest of nodes in the VPN are not affected. Inter-node latency/bandwidth and VPN scalability naturally improve in such a setting, which is desirable if you want to use a VPN for multi-player gaming or file sharing among many friends.

There are several open-source implementations of P2P VPN, such as [Tinc][1], peerVPN, and [n2n][2]. In this tutorial, I am going to demonstrate **how to configure a peer-to-peer VPN using** n2n **on Linux**.

n2n is an open-source (GPLv3) software allowing you to construct an encrypted layer-2/3 peer-to-peer VPN among users. The VPN created by n2n is "NAT-friendly," which means that two users behind different NAT routers can directly talk to each other over the VPN. n2n supports symmetric NAT type which is the most restrictive form of NAT. For that, the VPN traffic of n2n is encapsulated by UDP.

A n2n VPN is composed of two kinds of nodes: edge node and super node. An edge node is a computer which is connected to a VPN, potentially from behind a NAT router. A super node is a computer with a publicly reachable IP address, which assists with initial signaling for NATed edges. To create a P2P VPN among users, we need at least one super node.

![](https://farm3.staticflickr.com/2948/15460916306_fc18fd9d76_o.png)

### Preparation ###

In this tutorial, I am going to set up a P2P VPN using three nodes: one super node, and two edge nodes. The only requirement is that edge nodes be able to ping the IP address of the super node. It does not matter whether the edge nodes are behind NAT routers or not.

### Install n2n on Linux ###

To construct a P2P VPN using n2n, you need to install n2n on every edge node as well as super node.

Due to its minimal dependency requirements, n2n can be built easily on most Linux platforms.

To install n2n on Debian-based system:

    $ sudo apt-get install subversion build-essential libssl-dev
    $ svn co https://svn.ntop.org/svn/ntop/trunk/n2n
    $ cd n2n/n2n_v2
    $ make
    $ sudo make install 

To install n2n on Red Hat-based system:

    $ sudo yum install subversion gcc-c++ openssl-devel
    $ svn co https://svn.ntop.org/svn/ntop/trunk/n2n
    $ cd n2n/n2n_v2
    $ make
    $ sudo make install 

### Configure a P2P VPN with n2n ###

As mentioned before, we need to set up at least one super node which acts as an initial bootstraping server. We assume that the IP address of the super node is 1.1.1.1.

#### Super node: ####

On a computer which acts as a super node, run the following command. The "-l <port>" specifies the listening port of the super node. No root privilege is required to run supernode.

    $ supernode -l 5000 

#### Edge node: ####

On each edge node, use the following command to connect to a P2P VPN. The edge daemon will be running in the background.

Edge node #1:

     $ sudo edge -d edge0 -a 10.0.0.10 -c mynetwork -u 1000 -g 1000 -k password -l 1.1.1.1:5000 -m ae:e0:4f:e7:47:5b 

Edge node #2:

     $ sudo edge -d edge0 -a 10.0.0.11 -c mynetwork -u 1000 -g 1000 -k password -l 1.1.1.1:5000 -m ae:e0:4f:e7:47:5c 

Here are some explanations on the command-line.

- The "-d <name>" option specifies the name of a TAP interface being created by edge command.
- The "-a <IP-address>" option defines (statically) the VPN IP address to be assigned to the TAP interface. If you want to use DHCP, you need to set up a DHCP server on one of edge nodes, and use "-a dhcp:0.0.0.0" option instead.
- The "-c <community-name>" option specifies the name of a VPN group (with a length of up to 16 bytes). This option is used to create multiple VPNs among the same group of nodes.
- The "-u" and "-g" options are used to drop root priviledge after creating a TAP interface. The edge daemon will run as the specified user/group ID.
- The "-k <key-string>" option specifies a twofish encryption key string to be used. If you want to hide a key-string from the command-line, you can define the key in N2N_KEY environment variable.
- The "-l <IP-address:port>" option specifies super node's listening IP address and port number. For redundancy, you can specify up to two different super nodes (e.g., -l <supernode A> -l <supernode B>).
- The "-m <mac-address> assigns a static MAC address to a TAP interface. Without this, edge command will randomly generate a MAC address. In fact, hardcoding a static MAC address for a VPN interface is highly recommended. Otherwise, in case you restart edge daemon on a node, ARP cache of other peers will be polluted due to a newly generated MAC addess, and they will not send traffic to the node until the polluted ARP entry is evicted. 

![](https://farm3.staticflickr.com/2946/15460918796_72c7c4e461_b.jpg)

At this point, you should be able to ping from one edge node to the other using their VPN IP addresses.

### Troubleshooting ###

1. You are getting the following error while invoking edge daemon.

    n2n[4405]: ERROR: ioctl() [Operation not permitted][-1]

Be aware that edge daemon requires superuser privilege when creating a TAP interface. Thus make sure to use root privilege or set SUID for edge command. You can always use "-u" and "-g" option to drop root privilege afterwards.

### Conclusion ###

n2n can be a quite practical free VPN solution for you. You can easily configure a super node from your own home network or by grabbing a publicly addressable VPS instance from [cloud hosting][3]. Instead of placing sensitive credentials and encryption keys in the hands of a third-party VPN provider, you can use n2n to set up your own low-latency, high bandwidth, scalable P2P VPN among your friends.

What is your thought on n2n? Share your opinion in the comment.

--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-peer-to-peer-vpn-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-install-and-configure-tinc-vpn.html
[2]:http://www.ntop.org/products/n2n/
[3]:http://xmodulo.com/go/digitalocean
