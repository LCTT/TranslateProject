[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Manipulate an Ethernet Card Using the ethtool Command)
[#]: via: (https://www.2daygeek.com/linux-ethtool-command-view-change-ethernet-adapter-settings-nic-card/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Manipulate an Ethernet Card Using the ethtool Command
======

Ethtool is used to view and modify network device driver parameters and hardware settings, especially for wired ethernet devices.

You can change ethernet card parameters as required, including auto-negotiation, Speed, Duplex and Wake-on LAN.

The configuration of your Ethernet card allows your computer to communicate effectively over the network.

This tool provides many information about Ethernet devices connected to your Linux system.

In this article, we will show you how to change the below parameters and how to view them.

This article will help you troubleshoot Ethernet card related problems on a Linux system.

The following information will help you understand how Ethernet card works.

  * **Half Duplex:** Half-duplex mode allows a device to either send or receive packets at a time.
  * **Full Duplex:** Full-duplex mode allows a device to send and receive packets simultaneously.
  * **Auto-Negotiation:** Auto-negotiation is a mechanism that allows a device to automatically choose the best network speed and mode of operation (full-duplex or half-dual mode).
  * **Speed:** By default it uses maximum speed and you can change it according to your need.
  * **Link detection:** Link detection shows the status of the network interface card. If it shows “no” then try restarting the interface. If the link detection still says “no”, check if there are any issues with the cables connected between the switch and the system.



### How to Install ethtool on Linux

By default ethtool should already be installed on most systems. If not, you can install it from the distribution official repository.

For **RHEL/CentOS 6/7** systems, use the **[yum command][1]** to install ethtool.

```
$ sudo yum install -y ethtool
```

For **RHEL/CentOS 8** and **Fedora** systems, use the **[dnf command][2]** to install ethtool.

```
$ sudo yum install -y ethtool
```

For **Debian** based systems, use the **[apt command][3]** or **[apt-get command][4]** to install ethtool.

```
$ sudo apt-get install ethtool
```

For **openSUSE** systems, use the **[zypper command][5]** to install ethtool.

```
$ sudo zypper install -y ethtool
```

For **Arch Linux** systems, use the **[pacman command][6]** to install ethtool.

```
$ sudo pacman -S ethtool
```

### How to Check the Available Network Interface on Linux

You can use the **[ip command][7]** or the **ifconfig command** (deprecated in modern distribution) to verify the name and other details of the available and active network interfaces.

```
# ip a
or
# ifconfig

1: lo: mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:10:22:35:23:sf brd ff:ff:ff:ff:ff:ff
    inet 192.164.23.100/24 brd 192.164.23.255 scope global eth0
       valid_lft forever preferred_lft forever
```

### How to Check Network Interface Card (NIC) Information on Linux

Once you have the Ethernet interface name, you can easily check the details of it using the ethtool command as shown below.

On Linux, each network interface card (NIC) is assigned unique names, such as ethX, enpXXX, and so on.

  * The older Linux distribution used the **eth[X]** format. For example, RHEL 6 and their older versions.
  * Modern Linux distributions use **enp[XXX]** or **ens[XXX]** formats. For example, most of the modern Linux distribution uses this format, including RHEL 7, Debian 10, Ubuntu 16.04 LTS.



```
# ethtool eth0

Settings for eth0:
        Supported ports: [ TP ]
        Supported link modes: 1000baseT/Full
                              10000baseT/Full
        Supported pause frame use: No
        Supports auto-negotiation: No
        Supported FEC modes: Not reported
        Advertised link modes: Not reported
        Advertised pause frame use: No
        Advertised auto-negotiation: No
        Advertised FEC modes: Not reported
        Speed: 10000Mb/s
        Duplex: Full
        Port: Twisted Pair
        PHYAD: 0
        Transceiver: internal
        Auto-negotiation: off
        MDI-X: Unknown
        Supports Wake-on: uag
        Wake-on: d
        Link detected: yes
```

### How to Check Ethernet Card Driver and Firmware Version on Linux

You can check driver version, firmware version, and bus details using the ethtool command with the **“-i”** option as shown below.

```
# ethtool -i eth0

driver: vmxnet3
version: 1.4.16.0-k-NAPI
firmware-version:
expansion-rom-version:
bus-info: 0000:0b:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: yes
supports-priv-flags: no
```

### How to Check Network Usage Statistics on Linux

You can view network usage statistics using the ethtool command with the **“-S”** option. It shows the bytes transferred, received, errors etc.

```
# ethtool -S eth0

NIC statistics:
     Tx Queue#: 0
       TSO pkts tx: 2053
       TSO bytes tx: 7167572
       ucast pkts tx: 4028081
       ucast bytes tx: 399093197
       mcast pkts tx: 0
       mcast bytes tx: 0
       bcast pkts tx: 0
       bcast bytes tx: 0
       pkts tx err: 0
       pkts tx discard: 0
       drv dropped tx total: 0
          too many frags: 0
          giant hdr: 0
          hdr err: 0
          tso: 0
       ring full: 0
       pkts linearized: 0
       hdr cloned: 0
       giant hdr: 0
     Tx Queue#: 1
       TSO pkts tx: 1955
       TSO bytes tx: 6536945
       ucast pkts tx: 3711838
       ucast bytes tx: 346309662
       mcast pkts tx: 0
       mcast bytes tx: 0
       bcast pkts tx: 1186
       bcast bytes tx: 49812
       pkts tx err: 0
       pkts tx discard: 0
       drv dropped tx total: 0
          too many frags: 0
          giant hdr: 0
          hdr err: 0
          tso: 0
       ring full: 0
       pkts linearized: 0
       hdr cloned: 0
       giant hdr: 0
     Rx Queue#: 0
       LRO pkts rx: 0
       LRO byte rx: 0
       ucast pkts rx: 5084776
       ucast bytes rx: 4673133395
       mcast pkts rx: 0
       mcast bytes rx: 0
       bcast pkts rx: 154143
       bcast bytes rx: 45415676
       pkts rx OOB: 0
       pkts rx err: 0
       drv dropped rx total: 0
          err: 0
          fcs: 0
       rx buf alloc fail: 0
     Rx Queue#: 1
       LRO pkts rx: 0
       LRO byte rx: 0
       ucast pkts rx: 6346769
       ucast bytes rx: 4835534292
       mcast pkts rx: 0
       mcast bytes rx: 0
       bcast pkts rx: 3464
       bcast bytes rx: 714646
       pkts rx OOB: 0
       pkts rx err: 0
       drv dropped rx total: 0
          err: 0
          fcs: 0
       rx buf alloc fail: 0
     tx timeout count: 0
```

### How to Change the Speed of Ethernet Device on Linux

You can change the speed of the Ethernet as needed. When you make this change the interface will automatically go offline and you will need to bring it back online using the **[ifup command][8]** or the ip command or the nmcli command.

```
# ethtool -s eth0 speed 100
# ip link set eth0 up
```

### How to Enable/Disable Auto-Negotiation for Ethernet Device on Linux

You can enable or disable Auto-Negotiation using the ethtool command with the **“autoneg”** option as shown below.

```
# ethtool -s eth0 autoneg off
# ethtool -s eth0 autoneg on
```

### How to Change Multiple Parameters at Once

If you want to change multiple parameters of the Ethernet interface simultaneously using the ethtool command, use the format below.

```
Syntax:
ethtool –s [device_name] speed [10/100/1000] duplex [half/full] autoneg [on/off]
```

```
# ethtool –s eth0 speed 1000 duplex full autoneg off
```

### How to Check Auto-negotiation, RX and TX of a Particular Interface on Linux

To view auto-negotiation details about a specific Ethernet device, use the below format.

```
# ethtool -a eth0
```

### How to Identify a Specific NIC from Multiple Devices (Blink LED Port of NIC Card)

This option is very useful if you want to identify a specific physical interface port among others. The below ethtool command blink the LED of the eth0 port.

```
# ethtool -p eth0
```

### How to Set These Parameters in Linux Permanently

After a system restarts the changes you made with ethtool will be reverted by default.

To make custom settings permanent, you need to update your value in the network configuration file. Depending on your Linux distribution you may need to update this value to the correct file.

For RHEL based systems. You must use the ETHTOOL_OPTS variables.

```
# vi /etc/sysconfig/network-scripts/ifcfg-eth0

ETHTOOL_OPTS="speed 1000 duplex full autoneg off"
```

For **Debian** based systems.

```
# vi /etc/network/interfaces

post-up ethtool -s eth0 speed 1000 duplex full autoneg off
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-ethtool-command-view-change-ethernet-adapter-settings-nic-card/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[2]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[7]: https://www.2daygeek.com/ip-command-configure-network-interface-usage-linux/
[8]: https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/
