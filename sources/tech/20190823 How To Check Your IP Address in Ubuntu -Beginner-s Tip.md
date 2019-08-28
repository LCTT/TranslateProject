[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check Your IP Address in Ubuntu [Beginner’s Tip])
[#]: via: (https://itsfoss.com/check-ip-address-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How To Check Your IP Address in Ubuntu [Beginner’s Tip]
======

Wonder what’s your IP address? Here are several ways to check IP address in Ubuntu and other Linux distributions.

![][1]

### What is an IP Address?

An **Internet Protocol address** (commonly referred to as **IP address**) is a numerical label assigned to each device connected to a computer network (using the Internet Protocol). An IP address serves both the purpose of identification and localisation of a machine.

The **IP address** is _unique_ within the network, allowing the communication between all connected devices.

You should also know that there are two **types of IP addresses**: **public** and **private**. The **public IP address** is the address used to communicate over the Internet, the same way your physical address is used for postal mail. However, in the context of a local network (such as a home where are router is used), each device is assigned a **private IP address** unique within this sub-network. This is used inside this local network, without directly exposing the public IP (which is used by the router to communicate with the Internet).

Another distinction can be made between **IPv4** and **IPv6** protocol. **IPv4** is the classic IP format,consisting of a basic 4 part structure, with four bytes separated by dots (e.g. 127.0.0.1). However, with the growing number of devices, IPv4 will soon be unable to offer enough addresses. This is why **IPv6** was invented, a format using **128-bit addresses** (compared to the **32-bit addresses** used by **IPv4**).

## Checking your IP Address in Ubuntu [Terminal Method]

The fastest and the simplest way to check your IP address is by using the ip command. You can use this command in the following fashion:

```
ip addr show
```

It will show you both IPv4 and IPv6 addresses:

![Display IP Address in Ubuntu Linux][2]

Actually, you can further shorten this command to just `ip a`. It will give you the exact same result.

```
ip a
```

If you prefer to get minimal details, you can also use **hostname**:

```
hostname -I
```

There are some other [ways to check IP address in Linux][3] but these two commands are more than enough to serve the purpose.

[][4]

Suggested read  How to Disable IPv6 on Ubuntu Linux

What about ifconfig?

Long-time users might be tempted to use ifconfig (part of net-tools), but that program is deprecated. Some newer Linux distributions don’t include this package anymore and if you try running it, you’ll see ifconfig command not found error.

## Checking IP address in Ubuntu [GUI Method]

If you are not comfortable with the command line, you can also check IP address graphically.

Open up the Ubuntu Applications Menu (**Show Applications** in the bottom-left corner of the screen) and search for **Settings** and click on the icon:

![Applications Menu Settings][5]

This should open up the **Settings Menu**. Go to **Network**:

![Network Settings Ubuntu][6]

Pressing on the **gear icon** next to your connection should open up a window with more settings and information about your link to the network, including your IP address:

![IP Address GUI Ubuntu][7]

## Bonus Tip: Checking your Public IP Address (for desktop computers)

First of all, to check your **public IP address** (used for communicating with servers etc.) you can [use curl command][8]. Open up a terminal and enter the following command:

```
curl ifconfig.me
```

This should simply return your IP address with no additional bulk information. I would recommend being careful when sharing this address, since it is the equivalent to giving out your personal address.

**Note:** _If **curl** isn’t installed on your system, simply use **sudo apt install curl -y** to solve the problem, then try again._

Another simple way you can see your public IP address is by searching for **ip address** on Google.

**Summary**

In this article I went through the different ways you can find your IP address in Uuntu Linux, as well as giving you a basic overview of what IP addresses are used for and why they are so important for us.

I hope you enjoyed this quick guide. Let us know if you found this explanation helpful in the comments section!

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-ip-address-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/checking-ip-address-ubuntu.png?resize=800%2C450&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/ip_addr_show.png?fit=800%2C493&ssl=1
[3]: https://linuxhandbook.com/find-ip-address/
[4]: https://itsfoss.com/disable-ipv6-ubuntu-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/applications_menu_settings.jpg?fit=800%2C309&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/network_settings_ubuntu.jpg?fit=800%2C591&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/ip_address_gui_ubuntu.png?fit=800%2C510&ssl=1
[8]: https://linuxhandbook.com/curl-command-examples/
