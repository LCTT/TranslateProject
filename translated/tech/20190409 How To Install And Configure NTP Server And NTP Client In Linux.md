[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install And Configure NTP Server And NTP Client In Linux?)
[#]: via: (https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在Linux上安装、配置NTP服务和NTP客户端？
======

你也许听说过这个词很多次或者你可能已经在使用它了。
但是，在这篇文章中我将会清晰的告诉你NTP服务和NTP客户端的安装。

之后我们将会了解 **[Chrony NTP 客户端的安装][1]**。


### 什么是NTP服务?

NTP 表示为网络时间协议。

它是通过网络在电脑系统之间进行时钟同步的网络协议。

另一方面，我可以说，它可以让那些通过NTP或者Chrony客户端连接到NTP服务的系统保持时间上的一致（它能保持一个精确的时间）。


NTP在公共互联网上通常能够保持时间延迟在几十毫秒以内的精度，并在理想条件下，它能在局域网下达到优于一毫秒的延迟精度。

它使用用户数据报协议（UDP）在端口123上发送和接受时间戳。它是C/S架构的应用程序。



### 什么是NTP客户端？

NTP客户端将其时钟与网络时间服务器同步。

### 什么是Chrony客户端？
Chrony是NTP客户端的替代品。它能以更精确的时间更快的同步系统时钟，并且它对于那些不总是在线的系统很有用。

### 为什么我们需要NTP服务？

为了使你组织中的所有服务器与基于时间的作业保持精确的时间同步。

为了说明这点，我将告诉你一个场景。比如说，我们有两个服务器（服务器1和服务器2）。服务器1通常在10:55完成离线作业，然后服务器2在11:00需要基于服务器1完成的作业报告去运行其他作业。

如果两个服务器正在使用不同的时间（如果服务器2时间比服务器1提前，服务器1的时间就落后于服务器2），然后我们就不能去执行这个作业。为了达到时间一致，我们应该安装NTP。
希望上述能清除你对于NTP的疑惑。


在这篇文章中，我们将使用下列设置去测试。

  * **`NTP Server:`** HostName: CentOS7.2daygeek.com, IP:192.168.1.8, OS:CentOS 7
  * **`NTP Client:`** HostName: Ubuntu18.2daygeek.com, IP:192.168.1.5, OS:Ubuntu 18.04



### NTP服务端： 如何在Linux上安装NTP？

因为它是c/s架构，所以NTP服务端和客户端的安装包没有什么不同。在发行版的官方仓库中都有NTP安装包，因此可以使用发行版的包管理器安装它。

对于 **`Fedora`** 系统, 使用 **[DNF 命令][2]** 去安装ntp.

```
$ sudo dnf install ntp
```

对于 **`Debian/Ubuntu`** 系统, 使用 **[APT-GET 命令][3]** 或者 **[APT 命令][4]** 去安装 ntp.

```
$  
```

对基于 **`Arch Linux`** 的系统, 使用 **[Pacman 命令][5]** 去安装 ntp.

```
$ sudo pacman -S ntp
```

对 **`RHEL/CentOS`** 系统, 使用 **[YUM 命令][6]** 去安装 ntp.

```
$ sudo yum install ntp
```

对于 **`openSUSE Leap`** 系统, 使用 **[Zypper 命令][7]** 去安装 ntp.

```
$ sudo zypper install ntp
```

### 如何在Linux上配置NTP服务？

安装NTP软件包后，请确保在服务器端的`/etc/ntp.conf`文件中，必须取消以下配置的注释。

默认情况下，NTP服务器配置依赖于`X.distribution_name.pool.ntp.org`。 如果有必要，可以使用默认配置，也可以访问<https://www.ntppool.org/zone/@>站点，根据你所在的位置（特定国家/地区）进行更改。

比如说如果你在印度，然后你的NTP服务器将是`0.in.pool.ntp.org`，并且这个地址适用于大多数国家。

```
# vi /etc/ntp.conf

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
server 0.asia.pool.ntp.org
server 1.asia.pool.ntp.org
server 2.asia.pool.ntp.org
server 3.asia.pool.ntp.org
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap
driftfile /var/lib/ntp/drift
keys /etc/ntp/keys
```

我们仅允许`192.168.1.0/24`子网的客户端访问NTP服务器。

由于默认情况下基于RHEL7的发行版的防火墙是打开的，因此允许ntp服务通过。

```
# firewall-cmd --add-service=ntp --permanent
# firewall-cmd --reload
```

更新配置后重启服务。

对于基于Debian的sysvinit系统，我们需要去运行`ntp`而不是`ntpd`。

```
# service ntpd restart

# chkconfig ntpd on
```
对于基于Debian的systemctl系统，我们需要去运行`ntp`和`ntpd`。

```
# systemctl restart ntpd

# systemctl enable ntpd
```

### NTP客户端：如何在Linux上安装NTP客户端？

正如我在这篇文章中前面所说的。NTP服务端和客户端的安装包没有什么不同。因此在客户端上也安装同样的软件包。

对于 **`Fedora`** 系统, 使用 **[DNF 命令][2]** 去安装ntp.

```
$ sudo dnf install ntp
```

对于 **`Debian/Ubuntu`** 系统, 使用 **[APT-GET 命令][3]** 或者 **[APT 命令][4]** 去安装 ntp.

```
$  
```

对基于 **`Arch Linux`** 的系统, 使用 **[Pacman 命令][5]** 去安装 ntp.

```
$ sudo pacman -S ntp
```

对 **`RHEL/CentOS`** 系统, 使用 **[YUM 命令][6]** 去安装 ntp.

```
$ sudo yum install ntp
```

对于 **`openSUSE Leap`** 系统, 使用 **[Zypper 命令][7]** 去安装 ntp.

```
$ sudo zypper install ntp
```

我已经在`CentOS7.2daygeek.com`这台主机上安装和配置了NTP服务器，因此将其附加到所有的客户端机器上。

```
# vi /etc/ntp.conf

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
server CentOS7.2daygeek.com prefer iburst
driftfile /var/lib/ntp/drift
keys /etc/ntp/keys
```

更新配置后重启服务。

对于基于Debian的sysvinit系统，我们需要去运行`ntp`而不是`ntpd`。

```
# service ntpd restart

# chkconfig ntpd on
```
对于基于Debian的systemctl系统，我们需要去运行`ntp`和`ntpd`。

```
# systemctl restart ntpd

# systemctl enable ntpd
```

重新启动NTP服务后等待几分钟以便从NTP服务器获取同步的时间。

在Linux上运行下列命令去验证NTP服务的同步状态。

```
# ntpq –p
或
# ntpq -pn

     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*CentOS7.2daygee 133.243.238.163  2 u   14   64   37    0.686    0.151  16.432
```

运行下列命令去得到ntpd的当前状态。

```
# ntpstat
synchronised to NTP server (192.168.1.8) at stratum 3
   time correct to within 508 ms
   polling server every 64 s
```

最后运行`date`命令。

```
# date
Tue Mar 26 23:17:05 CDT 2019
```

如果你观察到NTP中输出的偏移很大。运行下列命令从NTP服务器手动同步时钟。当你执行下列命令的时候，确保你的NTP客户端应该为未激活状态。

```
# ntpdate –uv CentOS7.2daygeek.com
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-configure-ntp-server-ntp-client-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[arrowfeng](https://github.com/arrowfeng)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/configure-ntp-client-using-chrony-in-linux/
[2]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
