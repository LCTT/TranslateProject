[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Different Ways to Configure Static IP Address in RHEL 8)
[#]: via: (https://www.linuxtechi.com/configure-static-ip-address-rhel8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

Different Ways to Configure Static IP Address in RHEL 8
======

While Working on **Linux Servers**, assigning Static IP address on NIC / Ethernet cards is one of the common tasks that every Linux engineer do. If one configures the **Static IP address** correctly on a Linux server then he/she can access it remotely over network. In this article we will demonstrate what are different ways to assign Static IP address on RHEL 8 Server’s NIC.

[![Configure-Static-IP-RHEL8][1]][2]

Following are the ways to configure Static IP on a NIC,

  * nmcli (command line tool)
  * Network Scripts files(ifcfg-*)
  * nmtui  (text based user interface)



### Configure Static IP Address using nmcli command line tool

Whenever we install RHEL 8 server then ‘**nmcli**’, a command line tool is installed automatically, nmcli is used by network manager and allows us to configure static ip address on Ethernet cards.

Run the below ip addr command to list Ethernet cards on your RHEL 8 server

```
[root@linuxtechi ~]# ip addr
```

![ip-addr-command-rhel8][1]

As we can see in above command output, we have two NICs enp0s3 &amp; enp0s8. Currently ip address assigned to the NIC is via dhcp server.

Let’s assume we want to assign the static IP address on first NIC (enp0s3) with the following details,

  * IP address = 192.168.1.4
  * Netmask = 255.255.255.0
  * Gateway= 192.168.1.1
  * DNS = 8.8.8.8



Run the following nmcli commands one after the another to configure static ip,

List currently active Ethernet cards using “**nmcli connection**” command,

```
[root@linuxtechi ~]# nmcli connection
NAME    UUID                                  TYPE      DEVICE
enp0s3  7c1b8444-cb65-440d-9bf6-ea0ad5e60bae  ethernet  enp0s3
virbr0  3020c41f-6b21-4d80-a1a6-7c1bd5867e6c  bridge    virbr0
[root@linuxtechi ~]#
```

Use beneath nmcli command to assign static ip on enp0s3,

**Syntax:**

# nmcli connection modify &lt;interface_name&gt; ipv4.address  &lt;ip/prefix&gt;

**Note:** In short form, we usually replace connection with ‘con’ keyword and modify with ‘mod’ keyword in nmcli command.

Assign ipv4 (192.168.1.4) to enp0s3 interface,

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.addresses 192.168.1.4/24
[root@linuxtechi ~]#
```

Set the gateway using below nmcli command,

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.gateway 192.168.1.1
[root@linuxtechi ~]#
```

Set the manual configuration (from dhcp to static),

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.method manual
[root@linuxtechi ~]#
```

Set DNS value as “8.8.8.8”,

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.dns "8.8.8.8"
[root@linuxtechi ~]#
```

To save the above changes and to reload the interface execute the beneath nmcli command,

```
[root@linuxtechi ~]# nmcli con up enp0s3
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/4)
[root@linuxtechi ~]#
```

Above command output confirms that interface enp0s3 has been configured successfully.Whatever the changes we have made using above nmcli commands, those changes is saved permanently under the file “etc/sysconfig/network-scripts/ifcfg-enp0s3”

```
[root@linuxtechi ~]# cat /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

![ifcfg-enp0s3-file-rhel8][1]

To Confirm whether IP address has been to enp0s3 interface use the below ip command,

```
[root@linuxtechi ~]#ip addr show enp0s3
```

### Configure Static IP Address manually using network-scripts (ifcfg-) files

We can configure the static ip address to an ethernet card using its network-script or ‘ifcfg-‘ files. Let’s assume we want to assign the static ip address on our second Ethernet card ‘enp0s8’.

  * IP= 192.168.1.91
  * Netmask / Prefix = 24
  * Gateway=192.168.1.1
  * DNS1=4.2.2.2



Go to the directory “/etc/sysconfig/network-scripts” and look for the file ‘ifcfg- enp0s8’, if it does not exist then create it with following content,

```
[root@linuxtechi ~]# cd /etc/sysconfig/network-scripts/
[root@linuxtechi network-scripts]# vi ifcfg-enp0s8
TYPE="Ethernet"
DEVICE="enp0s8"
BOOTPROTO="static"
ONBOOT="yes"
NAME="enp0s8"
IPADDR="192.168.1.91"
PREFIX="24"
GATEWAY="192.168.1.1"
DNS1="4.2.2.2"
```

Save and exit the file and then restart network manager service to make above changes into effect,

```
[root@linuxtechi network-scripts]# systemctl restart NetworkManager
[root@linuxtechi network-scripts]#
```

Now use below ip command to verify whether ip address is assigned to nic or not,

```
[root@linuxtechi ~]# ip add show enp0s8
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:7c:bb:cb brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.91/24 brd 192.168.1.255 scope global noprefixroute enp0s8
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe7c:bbcb/64 scope link
       valid_lft forever preferred_lft forever
[root@linuxtechi ~]#
```

Above output confirms that static ip address has been configured successfully on the NIC ‘enp0s8’

### Configure Static IP Address using ‘nmtui’ utility

nmtui is a text based user interface for controlling network manager, when we execute nmtui, it will open a text base user interface through which we can add, modify and delete connections. Apart from this nmtui can also be used to set hostname of your system.

Let’s assume we want to assign static ip address to interface enp0s3 with following details,

  * IP address = 10.20.0.72
  * Prefix = 24
  * Gateway= 10.20.0.1
  * DNS1=4.2.2.2



Run nmtui and follow the screen instructions, example is show

```
[root@linuxtechi ~]# nmtui
```

[![nmtui-rhel8][1]][3]

Select the first option ‘**Edit a connection**‘ and then choose the interface as ‘enp0s3’

[![Choose-interface-nmtui-rhel8][1]][4]

Choose Edit and then specify the IP address, Prefix, Gateway and DNS Server ip,

[![set-ip-nmtui-rhel8][1]][5]

Choose OK and hit enter. In the next window Choose ‘**Activate a connection**’

[![Activate-option-nmtui-rhel8][1]][6]

Select **enp0s3**,  Choose **Deactivate** &amp; hit enter

[![Deactivate-interface-nmtui-rhel8][1]][7]

Now choose **Activate** &amp; hit enter,

[![Activate-interface-nmtui-rhel8][1]][8]

Select Back and then select Quit,

[![Quit-Option-nmtui-rhel8][1]][9]

Use below IP command to verify whether ip address has been assigned to interface enp0s3

```
[root@linuxtechi ~]# ip add show enp0s3
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:53:39:4d brd ff:ff:ff:ff:ff:ff
    inet 10.20.0.72/24 brd 10.20.0.255 scope global noprefixroute enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::421d:5abf:58bd:c47e/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
[root@linuxtechi ~]#
```

Above output confirms that we have successfully assign the static IP address to interface enp0s3 using nmtui utility.

That’s all from this tutorial, we have covered three different ways to configure ipv4 address to an Ethernet card on RHEL 8 system. Please do not hesitate to share feedback and comments in comments section below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/configure-static-ip-address-rhel8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Configure-Static-IP-RHEL8.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/nmtui-rhel8.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-interface-nmtui-rhel8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/set-ip-nmtui-rhel8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Activate-option-nmtui-rhel8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Deactivate-interface-nmtui-rhel8.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Activate-interface-nmtui-rhel8.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Quit-Option-nmtui-rhel8.jpg
