[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Disable IPv6 on Ubuntu Linux)
[#]: via: (https://itsfoss.com/disable-ipv6-ubuntu-linux/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Disable IPv6 on Ubuntu Linux
======

Are you looking for a way to **disable IPv6** connections on your Ubuntu machine? In this article, I’ll teach you exactly how to do it and why you would consider this option. I’ll also show you how to **enable or re-enable IPv6** in case you change your mind.

### What is IPv6 and why would you want to disable IPv6 on Ubuntu?

**[Internet Protocol version 6][1]** [(][1] **[IPv6][1]**[)][1] is the most recent version of the Internet Protocol (IP), the communications protocol that provides an identification and location system for computers on networks and routes traffic across the Internet. It was developed in 1998 to replace the **IPv4** protocol.

**IPv6** aims to improve security and performance, while also making sure we don’t run out of addresses. It assigns unique addresses globally to every device, storing them in **128-bits** , compared to just 32-bits used by IPv4.

![Disable IPv6 Ubuntu][2]

Although the goal is for IPv4 to be replaced by IPv6, there is still a long way to go. Less than **30%** of the sites on the Internet makes IPv6 connectivity available to users (tracked by Google [here][3]). IPv6 can also cause [problems with some applications at time][4].

Since **VPNs** provide global services, the fact that IPv6 uses globally routed addresses (uniquely assigned) and that there (still) are ISPs that don’t offer IPv6 support shifts this feature lower down their priority list. This way, they can focus on what matters the most for VPN users: security.

Another possible reason you might want to disable IPv6 on your system is not wanting to expose yourself to various threats. Although IPv6 itself is safer than IPv4, the risks I am referring to are of another nature. If you aren’t actively using IPv6 and its features, [having IPv6 enabled leaves you vulnerable to various attacks][5], offering the hacker another possible exploitable tool.

On the same note, configuring basic network rules is not enough. You have to pay the same level of attention to tweaking your IPv6 configuration as you do for IPv4. This can prove to be quite a hassle to do (and also to maintain). With IPv6 comes a suite of problems different to those of IPv4 (many of which can be referenced online, given the age of this protocol), giving your system another layer of complexity.

[][6]

Suggested read How To Remove Drive Icons From Unity Launcher In Ubuntu 14.04 [Beginner Tips]

### Disabling IPv6 on Ubuntu [For Advanced Users Only]

In this section, I’ll be covering how you can disable IPv6 protocol on your Ubuntu machine. Open up a terminal ( **default:** CTRL+ALT+T) and let’s get to it!

**Note:** _For most of the commands you are going to input in the terminal_ _you are going to need root privileges ( **sudo** )._

Warning!

If you are a regular desktop Linux user and prefer a stable working system, please avoid this tutorial. This is for advanced users who know what they are doing and why they are doing so.

#### 1\. Disable IPv6 using Sysctl

First of all, you can **check** if you have IPv6 enabled with:

```
ip a
```

You should see an IPv6 address if it is enabled (the name of your internet card might be different):

![IPv6 Address Ubuntu][7]

You have see the sysctl command in the tutorial about [restarting network in Ubuntu][8]. We are going to use it here as well. To **disable IPv6** you only have to input 3 commands:

```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
```

You can check if it worked using:

```
ip a
```

You should see no IPv6 entry:

![IPv6 Disabled Ubuntu][9]

However, this only **temporarily disables IPv6**. The next time your system boots, IPv6 will be enabled again.

One method to make this option persist is modifying **/etc/sysctl.conf**. I’ll be using vim to edit the file, but you can use any editor you like. Make sure you have **administrator rights** (use **sudo** ):

![Sysctl Configuration][10]

Add the following lines to the file:

```
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
```

For the settings to take effect use:

```
sudo sysctl -p
```

If IPv6 is still enabled after rebooting, you must create (with root privileges) the file **/etc/rc.local** and fill it with:

```
#!/bin/bash
# /etc/rc.local

/etc/sysctl.d
/etc/init.d/procps restart

exit 0
```

Now use [chmod command][11] to make the file executable:

```
sudo chmod 755 /etc/rc.local
```

What this will do is manually read (during the boot time) the kernel parameters from your sysctl configuration file.

[][12]

Suggested read 3 Ways to Check Linux Kernel Version in Command Line

#### 2\. Disable IPv6 using GRUB

An alternative method is to configure **GRUB** to pass kernel parameters at boot time. You’ll have to edit **/etc/default/grub**. Once again, make sure you have administrator privileges:

![GRUB Configuration][13]

Now you need to modify **GRUB_CMDLINE_LINUX_DEFAULT** and **GRUB_CMDLINE_LINUX** to disable IPv6 on boot:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

Save the file and run:

```
sudo update-grub
```

The settings should now persist on reboot.

### Re-enabling IPv6 on Ubuntu

To re-enable IPv6, you’ll have to undo the changes you made. To enable IPv6 until reboot, enter:

```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0
```

Otherwise, if you modified **/etc/sysctl.conf** you can either remove the lines you added or change them to:

```
net.ipv6.conf.all.disable_ipv6=0
net.ipv6.conf.default.disable_ipv6=0
net.ipv6.conf.lo.disable_ipv6=0
```

You can optionally reload these values:

```
sudo sysctl -p
```

You should once again see a IPv6 address:

![IPv6 Reenabled in Ubuntu][14]

Optionally, you can remove **/etc/rc.local** :

```
sudo rm /etc/rc.local
```

If you modified the kernel parameters in **/etc/default/grub** , go ahead and delete the added options:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
```

Now do:

```
sudo update-grub
```

**Wrapping Up**

In this guide I provided you ways in which you can **disable IPv6** on Linux, as well as giving you an idea about what IPv6 is and why you would want to disable it.

Did you find this article useful? Do you disable IPv6 connectivity? Let us know in the comment section!

--------------------------------------------------------------------------------

via: https://itsfoss.com/disable-ipv6-ubuntu-linux/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/IPv6
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/disable_ipv6_ubuntu.png?fit=800%2C450&ssl=1
[3]: https://www.google.com/intl/en/ipv6/statistics.html
[4]: https://whatismyipaddress.com/ipv6-issues
[5]: https://www.internetsociety.org/blog/2015/01/ipv6-security-myth-1-im-not-running-ipv6-so-i-dont-have-to-worry/
[6]: https://itsfoss.com/remove-drive-icons-from-unity-launcher-in-ubuntu/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/ipv6_address_ubuntu.png?fit=800%2C517&ssl=1
[8]: https://itsfoss.com/restart-network-ubuntu/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/ipv6_disabled_ubuntu.png?fit=800%2C442&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/sysctl_configuration.jpg?fit=800%2C554&ssl=1
[11]: https://linuxhandbook.com/chmod-command/
[12]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/grub_configuration-1.jpg?fit=800%2C565&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/ipv6_address_ubuntu-1.png?fit=800%2C517&ssl=1
