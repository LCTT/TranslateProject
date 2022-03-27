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

不要舍弃旧配置的树莓派，这个详细步骤的指南展示了我怎样用最小化设置来充分利用我珍贵的树莓派系统资源。

![Raspberry Pi board Model B][1]



最近，在我的 [树莓派][2]上的储存卡不工作了。它已经作为服务器持续使用将近两年了，这为我提供了一个开始探索和修正问题的好机会。在初始化安装完成以后，它开始表现出一些磁盘方面的问题，并且官方树莓派操作系统发布了一个有重大意义的更新（Raspbian更名为Raspberr Pi OS）。所以我买了一个新的储存卡并开始重装。



尽管树莓派3B不是最新的硬件，但它对运行最小化的服务器提供多样化服务还是足够的。我认为我之前的安装用了完整安装镜像包括图形用户界面和许多其他的软件包是没有必要的。


这个详细步骤的指南展示了我怎样用最小化设置来充分利用我珍贵的树莓派系统资源。


### 开始



开始，要为树莓派创建一个新的系统分区。这要求两件事：系统镜像文件和储存卡。

#### 下载树莓派系统镜像文件



当有好几种操作系统可用的时候，我选择坚持树莓派官方支持的系统。


第一步是从[Raspberry Pi OS][3]官方网站上下载最新的系统镜像文件到计算机，让后写入储存卡。有三个不同的镜像被提供，我选择树莓派精简版。它是最小化的操作系统只包含必要的文件为基本系统，所以它将占用最少的磁盘空间和系统内存。（当我下载系统的时候，发布日期是2020年8月20日，但是它已经被更新到最新。我不期望有什么巨大不同，但是我建议读一下发行说明。）











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






一旦分区被卸载，就可以将镜像文件写入到储存卡了。尽管有许多图形化工具，我还是习惯是用 `dd`命令：



```
`# dd bs=4M if=/home/alan/Downloads/raspios/2020-08-20-raspios-buster-armhf-lite.img of=/dev/mmcblk0 status=progress conv=fsync`
```

#### 启动树莓派

你只需要一个显示器，键盘，电源适配器来使用树莓派。我也有一个以太网口用网络连接，不过我更喜欢通过无线网络来搭建一个专用的服务器。

插入储存卡并打开电源。一旦成功启用，用默认的缺省密码来进行登录：用户名 `pi` and 密码`raspberry`。

### 系统设置


按照以下步骤尽可能最小化设置磁盘空间，内存使用等。我建议花时间尽可能正确的研究每个配置。通常有几种应用配置的方法，有些配置文件和目录可能会被丢弃，所以要查看产品文档确保你没有应用过时的配置。


#### 运行 raspi-config

在树莓派系统上这个主设置程序叫做raspi-config。登录以后立即运行它：


```
`# raspi-config`
```

![Raspberry Pi config main window][4]


它出现一个选项来扩展根文件系统用来利用储存卡上所有可利用的空间。选择这个选项之后，重启并重新登录。


用 `df`命令来验证储存卡的总容量是否被完全使用：

```
`# df -h`
```


如果你需要设置其他选项，请再次运行`raspi-config`。它们中的一些选项可以根据你的偏好和配置进行变化。通过设置整个选项确定没有丢失之后，我建议按照以下变化调整最优性能。（我忽略了一些我们有做任何变化的选项。）

  * **System options:** 你能设置主机名，最好使用完全限定的域名(FQDN)是强烈建议的。你也能在这里更改你的密码。
  * **Interface options:** 开启SSH服务。
  * **Performance options:** 减少GPU内存到最低设 (16MB）。
  * **Localization options:** 选择你的时区，位置，键盘类型。
  * **Advanced options:** 这个选项包括扩展根文件系统的扩展文件系统选项。如果你还没有扩展，去确定将所有可用空间扩展到储存卡上。
  * **Update:** 立即进入更新选项来更新raspi-config工具。如果更新可用，它将被下载并应用，否则，raspi-config将会在几秒钟重启。


一旦你在raspi-config中完成这些配置，选择**完成**退出工具.


#### 手动配置


我建议有几个其他的更改。他们全都是要求编辑某种配置文件来手动更改设置的。

##### 设置静态ip地址


一般来说，用静态ip地址设置服务器是最好不过的了。通过 `ip`命令来验证网络接口并设置ip地址和你的缺省网关（路由）和域名服务（DNS）地址：




```
# ip link
1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether b8:27:eb:48:3f:46 brd ff:ff:ff:ff:ff:ff
```


你也有必要知道你的缺省网关和更多的DNS服务器地址。加入这些信息到`/etc/dhcpcd.conf`这个配置文件中（我强烈建议更改之前对这个文件做一个备份）：


```
# cd /etc
# cp -a dhcpcd.conf dhcpcd.conf.original
```

按照以下来编辑文件：


```
# vi dhcpcd.conf

# static IP configuration:
interface eth0
static ip_address=192.168.1.5/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.3 192.168.1.4
```

##### 关闭IPV6协议


除非你有特别需要使用IPV6，你可能更会选择来禁用它。做这个只需要创建包含一行直接指令给Linux内核不让它开启IPV6的两个文件。

首先，创建 `/etc/sysctl.d/disable-ipv6.conf`文件并添加行`net.ipv6.conf.all.disable_ipv6 = 1`：


```
# cd /etc/sysctl.d
# echo "net.ipv6.conf.all.disable_ipv6 = 1" &gt; disable-ipv6.conf
```


然后创建`/etc/modprobe.d/blacklist-ipv6.conf`文件并添加行 `blacklist ipv6`：



```
# cd /etc/modprobe.d
# echo "blacklist ipv6" &gt; blacklist-ipv6.conf
```


##### 关闭WiFi,蓝牙和音频


我的服务器用于特定目的并不需要蓝牙和音频，同时，它用以太网连接，并不使用无线(WiFi)。除非你计划用它们，按照以下步骤来关闭它们。


对`/boot/config.txt`这个文件做一下更改 _(再说一遍, 我建议为这个文件做个备份)_:



```
# cd /boot
# cp -a config.txt config.txt.original
```


加入以下两个指令到文件底部来禁用蓝牙和WIFI：

  * `dtoverlay=disable-bt`
  * `dtoverlay=disable-wifi`



这些echo命令就可以完成：

```
# cd /boot
# echo "dtoverlay=disable-bt" &gt;&gt; config.txt
# echo "dtoverlay=disable-wifi" &gt;&gt; config.txt
```


要关闭音频，更改 `dtparam=audio`的参数为 `off`。你可以用一个简短的命令 `sed`来完成：


```
`# sed -i '/dtparam=audio/c dtparam=audio=off' config.txt`
```


最后一步是禁用WIFI服务，用`systemctl mask` 命令来操作：


```
`systemctl mask wpa_supplicant.service`
```


如果你不需要其他服务的话，也可以禁用它们：



* **禁用调制解调器服务** [code]`systemctl disable hciuart`
```
* **Disable Avahi-daemon:** [code]`systemctl disable avahi-daemon.service`
```



### 最后一步

  * **检查你的内存使用量** [code]`# free -h`[/code] 我震惊了：我的系统只用了30MB的内存
  * **创建个人账户:** 建议为登录这台服务器的个人创建用户账户。你能分配他们到sudo组允许他们发布管理命令。举个例子，创建一个用户名为George的一个账户：: [code] # adduser george
# usermod -a -G adm,sudo,users george 
```
  * **得到更新:** 这是一个重要的步骤。应用更新到最新来修复树莓派操作系统: [code] # apt update
# apt full-upgrade
```
  * **重启:** 重启你的新服务器是一个好主意: [code]`# systemctl reboot`
```
  * **安装Cockpit:** 你可以在树莓派系统上安装 [Cockpit][5], 以Linux网络控制台而著名. 它提供了一个基于HTML界面来远程管理和监控的程序。我最近写了一个关于 从Cockpit开始][6]. 用这个命令来安装: [code]`# apt install cockpit`
```


现在我的树莓派服务器已经准备好了，我能用它来做[网页服务器][7] ，[VPN务器][8]， [Minetest][9]等游戏服务器，或者就像我做的基于 [Pi-Hole的d blocker服务器][10] 。

### 保持旧硬件的活力


不论你有什么样可用的硬件，认真的最小化并控制你的操作系统和软件包可以保证你的系统资源使用量最低以至于你能从中获得最大收益。这还可以通过减少试图利用漏洞进行攻击的潜在恶意行为者可用的服务和软件包数量，提高了安全性。

因此，在你舍弃你的旧硬件之前，考虑它怎么能够继续使用的所有可能性

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/minimal-server-raspberry-pi

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
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
