[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Enable (UP) And Disable (DOWN) A Network Interface Port (NIC) In Linux?)
[#]: via: (https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Enable (UP) And Disable (DOWN) A Network Interface Port (NIC) In Linux?
======

You may need to run these commands based on your requirements.

I can tell you few examples, where you would be needed this.

When you add a new network interface or when you create a new virtual network interface from the original physical interface.

you may need to bounce these commands to bring up the new interface.

Also, if you made any changes or if it’s down then you need to run one of the below commands to bring them up.

It can be done on many ways and we would like to add best five method which we used in the article.

It can be done using the below five methods.

  * **`ifconfig Command:`** The ifconfig command is used configure a network interface. It provides so many information about NIC.
  * **`ifdown/up Command:`** The ifdown command take a network interface down and the ifup command bring a network interface up.
  * **`ip Command:`** ip command is used to manage NIC. It’s replacement of old and deprecated ifconfig command. It’s similar to ifconfig command but has many powerful features which isn’t available in ifconfig command.
  * **`nmcli Command:`** nmcli is a command-line tool for controlling NetworkManager and reporting network status.
  * **`nmtui Command:`** nmtui is a curses‐based TUI application for interacting with NetworkManager.



The below output shows the available network interface card (NIC) information in my Linux system.

```
# ip a
1: lo:  mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.4/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86049sec preferred_lft 86049sec
    inet6 fe80::3899:270f:ae38:b433/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: enp0s8:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:30:5d:52 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.3/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s8
       valid_lft 86049sec preferred_lft 86049sec
    inet6 fe80::32b7:8727:bdf2:2f3/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 1) How To Bring UP And Bring Down A Network Interface In Linux Using ifconfig Command?

The ifconfig command is used configure a network interface.

It is used at boot time to set up interfaces as necessary. It provides so many information about NIC. We can use ifconfig command when we need to make any changes on NIC.

Common Syntax for ifconfig:

```
# ifconfig [NIC_NAME] Down/Up
```

Run the following command to bring down the `enp0s3` interface in Linux. Make a note, you have to input your interface name instead of us.

```
# ifconfig enp0s3 down
```

Yes, the given interface is down now as per the following output.

```
# ip a | grep -A 1 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
```

Run the following command to bring down the `enp0s3` interface in Linux.

```
# ifconfig enp0s3 up
```

Yes, the given interface is up now as per the following output.

```
# ip a | grep -A 5 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.4/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86294sec preferred_lft 86294sec
    inet6 fe80::3899:270f:ae38:b433/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 2) How To Enable And Disable A Network Interface In Linux Using ifdown/up Command?

The ifdown command take a network interface down and the ifup command bring a network interface up.

**Note:**It doesn’t work on new interface device name like `enpXXX`

Common Syntax for ifdown/ifup:

```
# ifdown [NIC_NAME]

# ifup [NIC_NAME]
```

Run the following command to bring down the `eth1` interface in Linux.

```
# ifdown eth0
```

Run the following command to bring down the `eth1` interface in Linux.

```
# ip a | grep -A 3 "eth1:"
3: eth1:  mtu 1500 qdisc pfifo_fast state DOWN qlen 1000
    link/ether 08:00:27:d5:a0:18 brd ff:ff:ff:ff:ff:ff
```

Run the following command to bring down the `eth1` interface in Linux.

```
# ifup eth0
```

Yes, the given interface is up now as per the following output.

```
# ip a | grep -A 5 "eth1:"
3: eth1:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:d5:a0:18 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.7/24 brd 192.168.1.255 scope global eth1
    inet6 fe80::a00:27ff:fed5:a018/64 scope link tentative dadfailed
       valid_lft forever preferred_lft forever
```

ifup and ifdown doesn’t supporting the latest interface device `enpXXX` names. I got the below message when i ran the command.

```
# ifdown enp0s8
Unknown interface enp0s8
```

### 3) How To Bring UP/Bring Down A Network Interface In Linux Using ip Command?

ip command is used to manage Network Interface Card (NIC). It’s replacement of old and deprecated ifconfig command on modern Linux systems.

It’s similar to ifconfig command but has many powerful features which isn’t available in ifconfig command.

Common Syntax for ip:

```
# ip link set  Down/Up
```

Run the following command to bring down the `enp0s3` interface in Linux.

```
# ip link set enp0s3 down
```

Yes, the given interface is down now as per the following output.

```
# ip a | grep -A 1 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
```

Run the following command to bring down the `enp0s3` interface in Linux.

```
# ip link set enp0s3 up
```

Yes, the given interface is up now as per the following output.

```
# ip a | grep -A 5 "enp0s3:"
2: enp0s3:  mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c2:e4:e8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.4/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86294sec preferred_lft 86294sec
    inet6 fe80::3899:270f:ae38:b433/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 4) How To Enable And Disable A Network Interface In Linux Using nmcli Command?

nmcli is a command-line tool for controlling NetworkManager and reporting network status.

It can be utilized as a replacement for nm-applet or other graphical clients. nmcli is used to create, display, edit, delete, activate, and deactivate network

connections, as well as control and display network device status.

Run the following command to identify the interface name because nmcli command is perform most of the task using `profile name` instead of `device name`.

```
# nmcli con show
NAME                UUID                                  TYPE      DEVICE
Wired connection 1  3d5afa0a-419a-3d1a-93e6-889ce9c6a18c  ethernet  enp0s3
Wired connection 2  a22154b7-4cc4-3756-9d8d-da5a4318e146  ethernet  enp0s8
```

Common Syntax for ip:

```
# nmcli con  Down/Up
```

Run the following command to bring down the `enp0s3` interface in Linux. You have to give `profile name` instead of `device name` to bring down it.

```
# nmcli con down 'Wired connection 1'
Connection 'Wired connection 1' successfully deactivated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/6)
```

Yes, the given interface is down now as per the following output.

```
# nmcli dev status
DEVICE  TYPE      STATE         CONNECTION
enp0s8  ethernet  connected     Wired connection 2
enp0s3  ethernet  disconnected  --
lo      loopback  unmanaged     --
```

Run the following command to bring down the `enp0s3` interface in Linux. You have to give `profile name` instead of `device name` to bring down it.

```
# nmcli con up 'Wired connection 1'
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/7)
```

Yes, the given interface is up now as per the following output.

```
# nmcli dev status
DEVICE  TYPE      STATE      CONNECTION
enp0s8  ethernet  connected  Wired connection 2
enp0s3  ethernet  connected  Wired connection 1
lo      loopback  unmanaged  --
```

### 5) How To Bring UP/Bring Down A Network Interface In Linux Using nmtui Command?

nmtui is a curses based TUI application for interacting with NetworkManager.

When starting nmtui, the user is prompted to choose the activity to perform unless it was specified as the first argument.

Run the following command launch the nmtui interface. Select “Active a connection” and hit “OK”

```
# nmtui
```

[![][1]![][1]][2]

Select the interface which you want to bring down then hit “Deactivate” button.
[![][1]![][1]][3]

For activation do the same above procedure.
[![][1]![][1]][4]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/enable-disable-up-down-nic-network-interface-port-linux-using-ifconfig-ifdown-ifup-ip-nmcli-nmtui/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/wp-content/uploads/2019/04/enable-disable-up-down-nic-network-interface-port-linux-nmtui-1.png
[3]: https://www.2daygeek.com/wp-content/uploads/2019/04/enable-disable-up-down-nic-network-interface-port-linux-nmtui-2.png
[4]: https://www.2daygeek.com/wp-content/uploads/2019/04/enable-disable-up-down-nic-network-interface-port-linux-nmtui-3.png
