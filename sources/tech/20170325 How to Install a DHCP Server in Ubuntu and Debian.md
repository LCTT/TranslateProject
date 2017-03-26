How to Install a DHCP Server in Ubuntu and Debian
============================================================

Dynamic Host Configuration Protocol (DHCP) is a network protocol that is used to enable host computers to be automatically assigned IP addresses and related network configurations from a server.

The IP address assigned by a DHCP server to DHCP client is on a “lease”, the lease time normally varies depending on how long a client computer is likely to require the connection or DHCP configuration.

#### How Does DHCP Work?

The following is a quick description of how DHCP actually works:

*   Once a client (that is configured to use DHCP) and connected to a network boots up, it sends a DHCPDISCOVER packet to the DHCP server.
*   When the DHCP server receives the DHCPDISCOVER request packet, it replies with a DHCPOFFERpacket.
*   Then the client gets the DHCPOFFER packet, and it sends a DHCPREQUEST packet to the server showing it is ready to receive the network configuration information provided in the DHCPOFFERpacket.
*   Finally, after the DHCP server receives the DHCPREQUEST packet from the client, it sends the DHCPACK packet showing that the client is now permitted to use the IP address assigned to it.

In this article, we will show you how to setup a DHCP server in Ubuntu/Debian Linux, and we will run all the commands with the [sudo command][1] to gain root user privileges.

#### Testing Environment Setup

We are going to use following testing environment for this setup.

```
DHCP Server - Ubuntu 16.04 
DHCP Clients - CentOS 7 and Fedora 25
```

### Step 1: Installing DHCP Server in Ubuntu

1. Run the command below to install the DCHP server package, which was formerly known as dhcp3-server.

```
$ sudo apt install isc-dhcp-server
```

2. When the installation completes, edit the file /etc/default/isc-dhcp-server to define the interfaces DHCPD should use to serve DHCP requests, with the INTERFACES option.

For example, if you want the DHCPD daemon to listen on `eth0`, set it like so:

```
INTERFACES="eth0"
```

And also remember to [configure a static IP address][2] for the interface above.

### Step 2: Configuring DHCP Server in Ubuntu

3. The main DHCP configuration file is `/etc/dhcp/dhcpd.conf`, you must add all your network information to be sent to clients here.

And, there are two types of statements defined in the DHCP configuration file, these are:

*   parameters – specify how to perform a task, whether to carry out a task, or what network configuration options to send to the DHCP client.
*   declarations – define the network topology, state the clients, offer addresses for the clients, or apply a group of parameters to a group of declarations.

4. Now, open and modify the main configuration file, define your DHCP server options:

```
$ sudo vi /etc/dhcp/dhcpd.conf 
```

Set the following global parameters at the top of the file, they will apply to all the declarations below (do specify values that apply to your scenario):

```
option domain-name "tecmint.lan";
option domain-name-servers ns1.tecmint.lan, ns2.tecmint.lan;
default-lease-time 3600; 
max-lease-time 7200;
authoritative;
```

5. Now, define a subnetwork; here, we’ll setup DHCP for 192.168.10.0/24 LAN network (use parameters that apply to your scenario).

```
subnet 192.168.10.0 netmask 255.255.255.0 {
option routers                  192.168.10.1;
option subnet-mask              255.255.255.0;
option domain-search            "tecmint.lan";
option domain-name-servers      192.168.10.1;
range   192.168.10.10   192.168.10.100;
range   192.168.10.110   192.168.10.200;
}
```

### Step 3: Configure Static IP on DHCP Client Machine

6. To assign a fixed (static) IP address to a particular client computer, add the section below where you need to explicitly specify it’s MAC addresses and the IP to be statically assigned:

```
host centos-node {
hardware ethernet 00:f0:m4:6y:89:0g;
fixed-address 192.168.10.105;
}
host fedora-node {
hardware ethernet 00:4g:8h:13:8h:3a;
fixed-address 192.168.10.106;
}
```

Save the file and close it.

7. Next, start the DHCP service for the time being, and enable it to start automatically from the next system boot, like so:

```
------------ SystemD ------------ 
$ sudo systemctl start isc-dhcp-server.service
$ sudo systemctl enable isc-dhcp-server.service
------------ SysVinit ------------ 
$ sudo service isc-dhcp-server.service start
$ sudo service isc-dhcp-server.service enable
```

8. Next, do not forget to permit DHCP service (DHCPD daemon listens on port 67/UDP) on firewall as below:

```
$ sudo ufw allow  67/udp
$ sudo ufw reload
$ sudo ufw show
```

### Step 4: Configuring DHCP Client Machines

9. At this point, you can configure your clients computers on the network to automatically receive IP addresses from the DHCP server.

Login to the client computers and edit the Ethernet interface configuration file as follows (take note of the interface name/number):

```
$ sudo vi /etc/network/interfaces
```

And define the options below:

```
auto  eth0
iface eth0 inet dhcp
```

Save the file and exit. And restart network services like so (or reboot the system):

```
------------ SystemD ------------ 
$ sudo systemctl restart networking
------------ SysVinit ------------ 
$ sudo service networking restart
```

Alternatively, use the GUI on a desktop machine to perform the settings, set the Method to Automatic (DHCP) as shown in the screenshot below (Fedora 25 desktop).

[
 ![Set DHCP Network in Fedora](http://www.tecmint.com/wp-content/uploads/2017/03/Set-DHCP-Network-in-Fedora.png) 
][3]

Set DHCP Network in Fedora

At this point, if all settings are correctly configured, your client machine should be receiving IP addresses automatically from the DHCP server.

That’s it! In this tutorial, we showed you how to setup a DHCP server in Ubuntu/Debian. Share your thoughts with us via the feedback section below. If you are using Fedora based distribution, go through how to setup a DHCP server in CentOS/RHEL.

--------------------------------------------------------------------------------
作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-dhcp-server-in-ubuntu-debian/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[2]:http://www.tecmint.com/set-add-static-ip-address-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-DHCP-Network-in-Fedora.png
[4]:http://www.tecmint.com/author/aaronkili/
[5]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[6]:http://www.tecmint.com/free-linux-shell-scripting-books/
