[#]: collector: (lujun9972)
[#]: translator: (hwlife )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up a minimal server on a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/1/minimal-server-raspberry-pi)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)



在树莓派上创建一个最小化的服务器

======

不要舍旧配置的树莓派，这个详细步骤的指南展示了我怎样用最小化设置来充分利用我珍贵的树莓派系统资源。



最近，在我树莓派的储存卡不工作了。它已经作为服务器持续使用将近两年了，这为我提供了一个开始探索和修正问题的好机会。在初始化安装完成以后，它开始表现出一些磁盘方面的问题，并且官方树莓派操作系统发布了一个有重大意义的更新（Raspbian更名为Raspberr Pi OS）。所以我买了一个新的储存卡并开始重装。



尽管树莓派3B不是最新的硬件，但它对运行最小化的服务器提供多样化服务还是足够的。我认为我之前的安装用了完整安装镜像包括图形用户界面和许多其他的软件包是没有必要的。


这个详细步骤的指南展示了我怎样用最小化设置来充分利用我珍贵的树莓派系统资源。


### 开始



开始，要为树莓派创建一个新的系统分区。这要求两件事：系统镜像文件和储存卡。

#### 下载树莓派系统镜像文件



当有好几种操作系统可用的时候，我选择坚持树莓派官方支持的系统。


第一步是从树莓派官方那个网站上下载最新的系统镜像文件到计算机，让后写入储存卡。有三个不同的镜像被提供，我选择树莓派精简版。它是最小化的操作系统只包含必要的文件为基本系统，所以它将占用最少的磁盘空间和系统内存。（当我下载系统的时候，发布日期是2020年8月20日，但是它已经被更新到最新。我不期望有什么巨大不同，但是我建议读一下发行说明。）



#### 写树莓派系统镜像到储存卡


第二步是写下载的系统镜像到储存卡。我的卡之前用过，当我把它插入我的Linux桌面之后，它自动加载了两个存在的分区。我不能写入镜像直到我卸载了这两个分区。
我不得不用`lsblk`命令来证实`/dev/mmcblk0`设备文件的路径：


```
`# lsblk -p`
```


我用`umount`命令卸载了这两个分区：


```
# umount /dev/mmcblk0p2
# umount /dev/mmcblk0p1
```


一旦分区被卸载，就可以将镜像文件写入到储存卡了。尽管有许多图形化烧录工具，我还是习惯是用 `dd`命令：



```
`# dd bs=4M if=/home/alan/Downloads/raspios/2020-08-20-raspios-buster-armhf-lite.img of=/dev/mmcblk0 status=progress conv=fsync`
```

#### 启动树莓派

你只需要一个显示器，键盘，电源适配器来使用树莓派。我也有一个以太网口用网络连接，不过我更喜欢通过无线网络来搭建一个专用的服务器。

插入储存卡并打开电源。一旦成功启用，用默认的缺省密码来进行登录：用户名 `pi` and 密码`raspberry`。

### 系统设置


按照以下步骤尽可能最小化设置磁盘空间，内存使用等。我建议花时间尽可能正确的研究每个配置。通常有几种应用配置的方法，有些配置文件和目录可能会被丢弃，所以要查看产品文档确保你没有应用过时的配置。

#### Run raspi-config

The main configuration program in Raspberry Pi OS is called raspi-config. Run it immediately after logging in:


```
`# raspi-config`
```

![Raspberry Pi config main window][4]

It presents an option to expand the root filesystem to use all of the available space on the microSD card. After taking this option, reboot and log in again.

Verify that the card's full capacity is being used with the `df` command:


```
`# df -h`
```

If you need to configure other options, run `raspi-config` again. Some of these will vary according to your requirements or preferences. Go through all of them just to be sure you don't miss anything. I recommend the following changes for best performance. (I will skip the sections where I did not make any changes.)

  * **System options:** You can set the hostname, preferably using a fully qualified domain name (FQDN). You can also change your password here, which is always highly recommended.
  * **Interface options:** Enable SSH.
  * **Performance options:** Reduce GPU memory to the lowest setting (16MB).
  * **Localization options:** Choose your time zone, location, and keyboard type.
  * **Advanced options:** This section contains the Expand Filesystem option to expand the root filesystem. If you didn't do this above, be sure to do it here so that you have access to all storage available on the microSD card.
  * **Update:** Entering the Update section immediately checks for an update to the raspi-config tool. If an update is available, it will be downloaded and applied. Otherwise, raspi-config will re-launch after a few seconds.



Once you complete these configurations in raspi-config, select **Finish** to exit the tool.

#### Manual configurations

There are several other changes that I recommend. They are all manual changes that require editing certain configuration files.

##### Configure static IP

Generally, it is best to configure a server with a static IP address. To configure the IP and your default gateway (router) and domain name service (DNS) addresses, begin by identifying the network interface device with the `ip` command:


```
# ip link
1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether b8:27:eb:48:3f:46 brd ff:ff:ff:ff:ff:ff
```

You also need to know the IP address of your default gateway and one or more DNS servers. Add this information to the file `/etc/dhcpcd.conf` (_I strongly suggest making a backup of this file before making changes)_:


```
# cd /etc
# cp -a dhcpcd.conf dhcpcd.conf.original
```

Edit the file as shown:


```
# vi dhcpcd.conf

# static IP configuration:
interface eth0
static ip_address=192.168.1.5/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.3 192.168.1.4
```

##### Disable IPv6

Unless you specifically need to use IPv6, you might prefer to disable it. Do this by creating two new files that include a one-line directive instructing the Linux kernel not to use IPv6.

First, create the file `/etc/sysctl.d/disable-ipv6.conf` with the line
`net.ipv6.conf.all.disable_ipv6 = 1`:


```
# cd /etc/sysctl.d
# echo "net.ipv6.conf.all.disable_ipv6 = 1" &gt; disable-ipv6.conf
```

Then create the file `/etc/modprobe.d/blacklist-ipv6.conf` with the line `blacklist ipv6`:


```
# cd /etc/modprobe.d
# echo "blacklist ipv6" &gt; blacklist-ipv6.conf
```

##### Disable WiFi, Bluetooth, and audio

My server's specific purpose will not need Bluetooth or audio. Also, since it's connected with Ethernet, it will not use wireless (WiFi). Unless you plan to use them, disable them with the following steps.

Make the following changes to the file `/boot/config.txt` _(again, I suggest making a backup of this file)_:


```
# cd /boot
# cp -a config.txt config.txt.original
```

Add the following two directives to the bottom of the file to disable Bluetooth and WiFi:

  * `dtoverlay=disable-bt`
  * `dtoverlay=disable-wifi`



These echo commands will do the trick:


```
# cd /boot
# echo "dtoverlay=disable-bt" &gt;&gt; config.txt
# echo "dtoverlay=disable-wifi" &gt;&gt; config.txt
```

To disable audio, change the parameter `dtparam=audio` to `off`. You can do this with a short `sed` command:


```
`# sed -i '/dtparam=audio/c dtparam=audio=off' config.txt`
```

The last step is to disable the WiFi service. Use the `systemctl mask` command:


```
`systemctl mask wpa_supplicant.service`
```

You can disable a couple of other services if you won't need them:

  * **Disable modem service:** [code]`systemctl disable hciuart`
```
* **Disable Avahi-daemon:** [code]`systemctl disable avahi-daemon.service`
```



### Final steps

  * **Check your memory usage:** [code]`# free -h`[/code] I was astonished: My OS only uses 30MB of RAM.
  * **Create personal accounts:** It is advisable to create user accounts for any individuals who will log into this server. You can assign them to the sudo group to allow them to issue administrative commands. For example, to give a user named George an account: [code] # adduser george
# usermod -a -G adm,sudo,users george 
```
  * **Get updates:** This is an important step. Apply updates to get the latest fixes to the Raspberry Pi OS: [code] # apt update
# apt full-upgrade
```
  * **Reboot:** It's a good idea to reboot your new server: [code]`# systemctl reboot`
```
* **Install Cockpit:** You can install [Cockpit][5], also known as the Linux Web Console, on Raspberry Pi OS. It provides an HTML-based interface for managing and monitoring your server remotely. I recently wrote about [getting started with Cockpit][6]. Install it with: [code]`# apt install cockpit`
```



Now my Raspberry Pi is ready to host a server. I could use it for a [web server][7], a [VPN server][8], a game server such as [Minetest][9], or (as I did) an [ad blocker based on Pi-Hole][10].

### Keep old hardware alive

Regardless of what hardware you have available, carefully minimizing and controlling your operating system and packages can keep your resource usage low so that you can get the most out of it. This also improves security by reducing the number of services and packages available to would-be mal-actors trying to exploit a vulnerability.

So, before you decommission older hardware, consider all the possibilities for how it can continue to be used.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/minimal-server-raspberry-pi

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/RaspberryPi.SUNY_.jpg?itok=uS_-VUcb (Raspberry Pi board Model B)
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://www.raspberrypi.org/software/operating-systems
[4]: https://opensource.com/sites/default/files/uploads/raspi-config-main.png (Raspberry Pi config main window)
[5]: https://cockpit-project.org/
[6]: https://opensource.com/article/20/11/cockpit-server-management
[7]: https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3
[8]: https://opensource.com/article/19/6/raspberry-pi-vpn-server
[9]: https://github.com/minetest
[10]: https://opensource.com/article/18/2/block-ads-raspberry-pi
