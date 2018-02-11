How to setup and configure network bridge on Debian Linux
======

I am new Debian Linux user. I want to setup Bridge for virtualised environments (KVM) running on Debian Linux. How do I setup network bridging in /etc/network/interfaces on Debian Linux 9.x server?

If you want to assign IP addresses to your virtual machines and make them accessible from your LAN you need to setup network bridge. By default, a private network bridge created when using KVM. You need to set up interfaces manually, avoiding conflicts with, network manager.

### How to install the brctl

Type the following [nixcmdn name=”apt”]/[apt-get command][1]:
`$ sudo apt install bridge-utils`

### How to setup network bridge on Debian Linux

You need to edit /etc/network/interface file. However, I recommend to drop a brand new config in /etc/network/interface.d/ directory. The procedure to configure network bridge on Debian Linux is as follows:

#### Step 1 – Find out your physical interface

Use the [ip command][2]:
`$ ip -f inet a s`
Sample outputs:
```
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
 inet 192.168.2.23/24 brd 192.168.2.255 scope global eno1
 valid_lft forever preferred_lft forever
```


eno1 is my physical interface.

#### Step 2 – Update /etc/network/interface file

Make sure only lo (loopback is active in /etc/network/interface). Remove any config related to eno1. Here is my config file printed using [cat command][3]:
`$ cat /etc/network/interface`
```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
 
source /etc/network/interfaces.d/*
 
# The loopback network interface
auto lo
iface lo inet loopback
```


#### Step 3 – Configuring bridging (br0) in /etc/network/interfaces.d/br0

Create a text file using a text editor such as vi command:
`$ sudo vi /etc/network/interfaces.d/br0`
Append the following config:
```
## static ip config file for br0 ##
auto br0
iface br0 inet static
    address 192.168.2.23
    broadcast 192.168.2.255
    netmask 255.255.255.0
    gateway 192.168.2.254
    # If the resolvconf package is installed, you should not edit
    # the resolv.conf configuration file manually. Set name server here
    #dns-nameservers 192.168.2.254
    # If you have muliple interfaces such as eth0 and eth1
    # bridge_ports eth0 eth1
    bridge_ports eno1
    bridge_stp off # disable Spanning Tree Protocol
    bridge_waitport 0 # no delay before a port becomes available
    bridge_fd 0 # no forwarding delay
```

If you want bridge to get an IP address using DHCP:
```
## DHCP ip config file for br0 ##
auto br0
 
# Bridge setup
 iface br0 inet dhcp
  bridge_ports eno1
```


[Save and close the file in vi/vim][4].

#### Step 4 – [Restart networking service in Linux][5]

Before you restart the networking service make sure firewall is disabled. The firewall may refer to older interface such as eno1. Once service restarted, you must update firewall rule for interface br0. Type the following restart the networking service:
`$ sudo systemctl restart network-manager`
Verify that service has been restarted:
`$ systemctl status network-manager`
Look for new br0 interface and routing table with the help of [ip command][2]:
`$ ip a s $ ip r $ ping -c 2 cyberciti.biz`
Sample outputs:
![](https://www.cyberciti.biz/media/new/faq/2018/02/How-to-setup-and-configure-network-bridge-on-Debian-Linux.jpg)
You can also use the brctl command to view info about your bridges:
`$ brctl show`
Show current bridges:
`$ bridge link`
![](https://www.cyberciti.biz/media/new/faq/2018/02/Show-current-bridges-and-what-interfaces-they-are-connected-to-on-Linux.jpg)

### About the author

The author is the creator of nixCraft and a seasoned sysadmin, DevOps engineer, and a trainer for the Linux operating system/Unix shell scripting. Get the **latest tutorials on SysAdmin, Linux/Unix and open source topics via[RSS/XML feed][6]** or [weekly email newsletter][7].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-configuring-bridging-in-debian-linux/

作者：[Vivek GIte][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[2]:https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/ (See Linux/Unix ip command examples for more info)
[3]:https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
[4]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[5]:https://www.cyberciti.biz/faq/linux-restart-network-interface/
[6]:https://www.cyberciti.biz/atom/atom.xml
[7]:https://www.cyberciti.biz/subscribe-to-weekly-linux-unix-newsletter-for-sysadmin/
