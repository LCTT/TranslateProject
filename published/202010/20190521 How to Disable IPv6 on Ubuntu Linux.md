[#]: collector: (lujun9972)
[#]: translator: (rakino)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12689-1.html)
[#]: subject: (How to Disable IPv6 on Ubuntu Linux)
[#]: via: (https://itsfoss.com/disable-ipv6-ubuntu-linux/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何在 Ubuntu Linux 上禁用 IPv6
======

想知道怎样在 Ubuntu 上**禁用 IPv6** 吗？我会在这篇文章中介绍一些方法，以及为什么你应该考虑这一选择；以防改变主意，我也会提到如何**启用，或者说重新启用 IPv6**。

### 什么是 IPv6？为什么会想要禁用它？

<ruby>[互联网协议第 6 版][1]<rt>Internet Protocol version 6</rt></ruby>（IPv6）是互联网协议（IP）的最新版本。互联网协议是一种通信协议，它为网络上的计算机提供识别和定位系统，并在互联网上进行通信路由。IPv6 于 1998 年设计，以取代 IPv4 协议。

**IPv6** 意在提高安全性与性能的同时保证地址不被用尽；它可以在全球范围内为每台设备分配唯一的以 **128 位比特**存储的地址，而 IPv4 只使用了 32 位比特。

![Disable IPv6 Ubuntu][2]

尽管 IPv6 的目标是取代 IPv4，但目前还有很长的路要走；互联网上只有不到 **30%** 的网站支持 IPv6（[这里][3] 是谷歌的统计），IPv6 有时也给 [一些应用带来问题][4]。

由于 IPv6 使用全球（唯一分配的）路由地址，以及（仍然）有<ruby>互联网服务供应商<rt>Internet Service Provider</rt></ruby>（ISP）不提供 IPv6 支持的事实，IPv6 这一功能在提供全球服务的<ruby>**虚拟私人网络**<rt>Virtual Private Network</rt></ruby>（VPN）供应商的优先级列表中处于较低的位置，这样一来，他们就可以专注于对 VPN 用户最重要的事情：安全。

不想让自己暴露在各种威胁之下可能是另一个让你想在系统上禁用 IPv6 的原因。虽然 IPv6 本身比 IPv4 更安全，但我所指的风险是另一种性质上的。如果你不实际使用 IPv6 及其功能，那么[启用 IPv6 后，你会很容易受到各种攻击][5]，因而为黑客提供另一种可能的利用工具。

同样，只配置基本的网络规则是不够的；你必须像对 IPv4 一样，对调整 IPv6 的配置给予同样的关注，这可能会是一件相当麻烦的事情（维护也是）。并且随着 IPv6 而来的将会是一套不同于 IPv4 的问题（鉴于这个协议的年龄，许多问题已经可以在网上找到了），这又会使你的系统多了一层复杂性。

据观察，在某些情况下，禁用 IPv6 有助于提高 Ubuntu 的 WiFi 速度。

### 在 Ubuntu 上禁用 IPv6 [高级用户]

在本节中，我会详述如何在 Ubuntu 上禁用 IPv6 协议，请打开终端（默认快捷键：`CTRL+ALT+T`），让我们开始吧！

**注意：** 接下来大部分输入终端的命令都需要 root 权限（`sudo`）。

> 警告！
>
> 如果你是一个普通 Linux 桌面用户，并且偏好稳定的工作系统，请避开本教程，接下来的部分是为那些知道自己在做什么以及为什么要这么做的用户准备的。

#### 1、使用 sysctl 禁用 IPv6

首先，可以执行以下命令来**检查** IPv6 是否已经启用：

```
ip a
```

如果启用了，你应该会看到一个 IPv6 地址（网卡的名字可能会与图中有所不同）

![IPv6 Address Ubuntu][7]

在教程《[在 Ubuntu 中重启网络][8]》（LCTT 译注：其实这篇文章并没有提到使用 sysctl 的方法……）中，你已经见过 `sysctl` 命令了，在这里我们也同样会用到它。要**禁用 IPv6**，只需要输入三条命令：

```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
```

检查命令是否生效：

```
ip a
```

如果命令生效，你应该会发现 IPv6 的条目消失了：

![IPv6 Disabled Ubuntu][9]

然而这种方法只能**临时禁用 IPv6**，因此在下次系统启动的时候，IPv6 仍然会被启用。

（LCTT 译注：这里的临时禁用是指这次所做的改变直到此次关机之前都有效，因为相关的参数是存储在内存中的，可以改变值，但是在内存断电后就会丢失；这种意义上来讲，下文所述的两种方法都是临时的，只不过改变参数值的时机是在系统启动的早期，并且每次系统启动时都有应用而已。那么如何完成这种意义上的永久改变？答案是在编译内核的时候禁用相关功能，然后要后悔就只能重新编译内核了（悲）。）

一种让选项持续生效的方式是修改文件 `/etc/sysctl.conf`，在这里我用 `vim` 来编辑文件，不过你可以使用任何你想使用的编辑器，以及请确保你拥有**管理员权限**（用 `sudo`）：

![Sysctl Configuration][10]

将下面这几行（和之前使用的参数相同）加入到文件中：

```
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
```

执行以下命令应用设置：

```
sudo sysctl -p
```

如果在重启之后 IPv6 仍然被启用了，而你还想继续这种方法的话，那么你必须（使用 root 权限）创建文件 `/etc/rc.local` 并加入以下内容：

```
#!/bin/bash
# /etc/rc.local

/etc/sysctl.d
/etc/init.d/procps restart

exit 0
```

接着使用 [chmod 命令][11] 来更改文件权限，使其可执行：

```
sudo chmod 755 /etc/rc.local
```

这会让系统（在启动的时候）从之前编辑过的 sysctl 配置文件中读取内核参数。

#### 2、使用 GRUB 禁用 IPv6

另外一种方法是配置 **GRUB**，它会在系统启动时向内核传递参数。这样做需要编辑文件 `/etc/default/grub`（请确保拥有管理员权限）。

![GRUB Configuration][13]

现在需要修改文件中分别以 `GRUB_CMDLINE_LINUX_DEFAULT` 和 `GRUB_CMDLINE_LINUX` 开头的两行来在启动时禁用 IPv6：

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

（LCTT 译注：这里是指在上述两行内增加参数 `ipv6.disable=1`，不同的系统中这两行的默认值可能有所不同。）

保存文件，然后执行命令：

```
sudo update-grub
```

（LCTT 译注：该命令用以更新 GRUB 的配置文件，在没有 `update-grub` 命令的系统中需要使用 `sudo grub-mkconfig -o /boot/grub/grub.cfg` ）

设置会在重启后生效。

### 在 Ubuntu 上重新启用 IPv6

要想重新启用 IPv6，你需要撤销之前的所有修改。不过只是想临时启用 IPv6 的话，可以执行以下命令：

```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0
```

否则想要持续启用的话，看看是否修改过 `/etc/sysctl.conf`，可以删除掉之前增加的部分，也可以将它们改为以下值（两种方法等效）：

```
net.ipv6.conf.all.disable_ipv6=0
net.ipv6.conf.default.disable_ipv6=0
net.ipv6.conf.lo.disable_ipv6=0
```

然后应用设置（可选）：

```
sudo sysctl -p
```

（LCTT 译注：这里可选的意思可能是如果之前临时启用了 IPv6 就没必要再重新加载配置文件了）

这样应该可以再次看到 IPv6 地址了：

![IPv6 Reenabled in Ubuntu][14]

另外，你也可以删除之前创建的文件 `/etc/rc.local`（可选）：

```
sudo rm /etc/rc.local
```

如果修改了文件 `/etc/default/grub`，回去删掉你所增加的参数：

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
```

然后更新 GRUB 配置文件：

```
sudo update-grub
```

### 尾声

在这篇文章中，我介绍了在 Linux 上**禁用 IPv6** 的方法，并简述了什么是 IPv6 以及可能想要禁用掉它的原因。

那么，这篇文章对你有用吗？你有禁用掉 IPv6 连接吗？让我们评论区见吧～

--------------------------------------------------------------------------------

via: https://itsfoss.com/disable-ipv6-ubuntu-linux/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
校对：[wxy](https://github.com/wxy)

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
[8]: https://linux.cn/article-10804-1.html
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/ipv6_disabled_ubuntu.png?fit=800%2C442&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/sysctl_configuration.jpg?fit=800%2C554&ssl=1
[11]: https://linuxhandbook.com/chmod-command/
[12]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/grub_configuration-1.jpg?fit=800%2C565&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/ipv6_address_ubuntu-1.png?fit=800%2C517&ssl=1
