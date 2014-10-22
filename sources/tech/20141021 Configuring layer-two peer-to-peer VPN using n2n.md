Configuring layer-two peer-to-peer VPN using n2n
================================================================================
n2n is a layer-two peer-to-peer virtual private network (VPN) which allows users to exploit features typical of P2P applications at network instead of application level. This means that users can gain native IP visibility (e.g. two PCs belonging to the same n2n network can ping each other) and be reachable with the same network IP address regardless of the network where they currently belong. In a nutshell, as OpenVPN moved SSL from application (e.g. used to implement the https protocol) to network protocol, n2n moves P2P from application to network level.

### n2n main features ###

An n2n is an encrypted layer two private network based on a P2P protocol.

Encryption is performed on edge nodes using open protocols with user-defined encryption keys: you control your security without delegating it to companies as it happens with Skype or Hamachi.

Each n2n user can simultaneously belong to multiple networks (a.k.a. communities).

Ability to cross NAT and firewalls in the reverse traffic direction (i.e. from outside to inside) so that n2n nodes are reachable even if running on a private network. Firewalls no longer are an obstacle to direct communications at IP level.

n2n networks are not meant to be self-contained, but it is possible to route traffic across n2n and non-n2n networks.

### The n2n architecture is based on two components ###

**Supernode**: it is used by edge nodes at startup or for reaching nodes behind symmetrical firewalls. This application is basically a directory register and a packet router for those nodes that cannot talk directly.

**Edge nodes**: applications installed on user PCs that allow the n2n network to be build. Practically each edge node creates a tun/tap device that is then the entry point to the n2n network.

### Install n2n on Ubuntu ###

Open the terminal and run the following commands

    $ sudo apt-get install subversion build-essential libssl-dev
    $ svn co https://svn.ntop.org/svn/ntop/trunk/n2n
    $ cd n2n/n2n_v2
    $ make
    $ sudo make install

### Configure a P2P VPN with n2n ###

First we need to configure one super node and any number of edge nodes

Decide where to place your supernode. Suppose you put it on host a.b.c.d at port xyw.

Decide what encryption password you want to use to secure your data. Suppose you use the password encryptme

Decide the network name you want to use. Suppose you call it mynetwork. Note that you can use your supernode/edge nodes to handle multiple networks, not just one.

Decide what IP address you plan to use on your edge nodes. Suppose you use IP address 10.1.2.0/24

Start your applications:

### Configure Super node ###

    supernode -l xyw

### Configure Edge Nodes ###

On each edge node, use the following command to connect to a P2P VPN.

    sudo edge -a 10.1.2.1 -c mynetwork -k encryptme -l a.b.c.d:xyw

    sudo edge -a 10.1.2.2 -c mynetwork -k encryptme -l a.b.c.d:xyw

### Now test your n2n network ###

    edge node1> ping 10.1.2.2

    edge node2> ping 10.1.2.1

Windows n2n VPN Client (N2N Edge GUI)

You can download N2N Edge GUI from [here][1]

N2N Edge GUI is a basic installer and GUI configuration screen for the peer-to-peer ‘n2n' VPN solution 

![](http://www.ubuntugeek.com/wp-content/uploads/2014/10/client.jpg)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/configuring-layer-two-peer-to-peer-vpn-using-n2n.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://sourceforge.net/projects/n2nedgegui/