Linux FAQs with Answers--How to disable IPv6 on Linux
================================================================================
> **Question**: I notice that one of my applications is trying to establish a connection over IPv6. But since our local network is not able to route IPv6 traffic, the IPv6 connection times out, and the application falls back to IPv4, which causes unnecessary delay. As I don't have any need for IPv6 at the moment, I would like to disable IPv6 on my Linux box. What is a proper way to turn off IPv6 on Linux? 

IPv6 has been introduced as a replacement of IPv4, the traditional 32-bit address space used in the Internet, to solve the imminent exhaustion of available IPv4 address space. However, since IPv4 has been used by every host or device connected to the Internet, it is practically impossible to switch every one of them to IPv6 overnight. Numerous IPv4 to IPv6 transition mechanisms (e.g., dual IP stack, tunneling, proxying) have been proposed to facilitate the adoption of IPv6, and many applications are being rewritten, as we speak, to add support for IPv6. One thing for sure is that IPv4 and IPv6 will inevitably coexist for the forseeable future.

Ideally the [ongoing IPv6 transition process][1] should not be visible to end users, but the mixed IPv4/IPv6 environment might sometimes cause you to encounter various hiccups originating from unintended interaction between IPv4 and IPv6. For example, you may experience timeouts from applications such as apt-get or ssh trying to unsuccessfully connecting via IPv6, DNS server accidentally dropping AAAA DNS records for IPv6, or your IPv6-capable device not compatible with your ISP's legacy IPv4 network, etc.

Of course this doesn't mean that you should blindly disable IPv6 on you Linux box. With all the benefits promised by IPv6, we as a society want to fully embrace it eventually, but as part of troubleshooting process for end-user experienced hiccups, you may try turning off IPv6 to see if indeed IPv6 is a culprit.

Here are a few techniques allowing you to disable IPv6 partially (e.g., for a certain network interface) or completely on Linux. These tips should be applicable to all major Linux distributions including Ubuntu, Debian, Linux Mint, CentOS, Fedora, RHEL, and Arch Linux.

### Check if IPv6 is Enabled on Linux ###

All modern Linux distributions have IPv6 automatically enabled by default. To see IPv6 is activated on your Linux, use ifconfig or ip commands. If you see "inet6" in the output of these commands, this means your Linux has IPv6 enabled.

    $ ifconfig 

![](https://farm8.staticflickr.com/7282/16415082398_5fb0920506_b.jpg)

    $ ip addr 

![](https://farm8.staticflickr.com/7290/16415082248_c4e075548b_c.jpg)

### Disable IPv6 Temporarily ###

If you want to turn off IPv6 temporarily on your Linux system, you can use /proc file system. By "temporarily", we mean that the change we make to disable IPv6 will not be preserved across reboots. IPv6 will be enabled back again after you reboot your Linux box.

To disable IPv6 for a particular network interface, use the following command.

    $ sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/<interface-name>/disable_ipv6' 

For example, to disable IPv6 for eth0 interface:

    $ sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/eth0/disable_ipv6' 

![](https://farm8.staticflickr.com/7288/15982511863_0c1feafe7f_b.jpg)

To enable IPv6 back on eth0 interface:

    $ sudo sh -c 'echo 0 > /proc/sys/net/ipv6/conf/eth0/disable_ipv6' 

If you want to disable IPv6 system-wide for all interfaces including loopback interface, use this command:

    $ sudo sh -c 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' 

### Disable IPv6 Permanently across Reboots ###

The above method does not permanently disable IPv6 across reboots. IPv6 will be activated again once you reboot your system. If you want to turn off IPv6 for good, there are several ways you can do it.

#### Method One ####

The first method is to apply the above /proc changes persistently in /etc/sysctl.conf file.

That is, open /etc/sysctl.conf with a text editor, and add the following lines.

    # to disable IPv6 on all interfaces system wide
    net.ipv6.conf.all.disable_ipv6 = 1
    
    # to disable IPv6 on a specific interface (e.g., eth0, lo)
    net.ipv6.conf.lo.disable_ipv6 = 1
    net.ipv6.conf.eth0.disable_ipv6 = 1

To activate these changes in /etc/sysctl.conf, run:

    $ sudo sysctl -p /etc/sysctl.conf 

or simply reboot.

#### Method Two ####

An alternative way to disable IPv6 permanently is to pass a necessary kernel parameter via GRUB/GRUB2 during boot time.

Open /etc/default/grub with a text editor, and add "ipv6.disable=1" to GRUB_CMDLINE_LINUX variable.

    $ sudo vi /etc/default/grub

----------

    GRUB_CMDLINE_LINUX="xxxxx ipv6.disable=1"

In the above, "xxxxx" denotes any existing kernel parameter(s). Add "ipv6.disable=1" after them.

![](https://farm8.staticflickr.com/7286/15982512103_ec5d940e58_b.jpg)

Finally, don't forget to apply the modified GRUB/GRUB2 settings by running:

On Debian, Ubuntu or Linux Mint:

    $ sudo update-grub 

On Fedora, CentOS/RHEL:

    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg 

Now IPv6 will be completely disabled once you reboot your Linux system.

### Other Optional Steps after Disabling IPv6 ###

Here are a few optional steps you can consider after disabling IPv6. This is because while you disable IPv6 in the kernel, other programs may still try to use IPv6. In most cases, such application behaviors will not break things, but you want to disable IPv6 for them for efficiency or safety reason.

#### /etc/hosts ####

Depending on your setup, /etc/hosts may contain one or more IPv6 hosts and their addresses. Open /etc/hosts with a text editor, and comment out all lines which contain IPv6 hosts.

    $ sudo vi /etc/hosts

----------

    # comment these IPv6 hosts
    # ::1     ip6-localhost ip6-loopback
    # fe00::0 ip6-localnet
    # ff00::0 ip6-mcastprefix
    # ff02::1 ip6-allnodes
    # ff02::2 ip6-allrouters

#### Network Manager ####

If you are using NetworkManager to manage your network settings, you can disable IPv6 on NetworkManager as follows. Open the wired connection on NetworkManager, click on "IPv6 Settings" tab, and choose "Ignore" in "Method" field. Save the change and exit.

![](https://farm8.staticflickr.com/7293/16394993017_21917f027b_o.png)

#### SSH server ####

By default, OpenSSH server (sshd) tries to bind on both IPv4 and IPv6 addresses.

To force sshd to bind only on IPv4 address, open /etc/ssh/sshd_config with a text editor, and add the following line. inet is for IPv4 only, and inet6 is for IPv6 only.

    $ sudo vi /etc/ssh/sshd_config

----------

    AddressFamily inet

and restart sshd server.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-ipv6-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://www.google.com/intl/en/ipv6/statistics.html