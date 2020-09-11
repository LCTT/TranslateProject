[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11390-1.html)
[#]: subject: (Different Ways to Configure Static IP Address in RHEL 8)
[#]: via: (https://www.linuxtechi.com/configure-static-ip-address-rhel8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

在 RHEL8 配置静态 IP 地址的不同方法
======

在 Linux 服务器上工作时，在网卡/以太网卡上分配静态 IP 地址是每个 Linux 工程师的常见任务之一。如果一个人在 Linux 服务器上正确配置了静态地址，那么他/她就可以通过网络远程访问它。在本文中，我们将演示在 RHEL 8 服务器网卡上配置静态 IP 地址的不同方法。

![](https://img.linux.net.cn/data/attachment/album/201909/25/222737dx94bbl9qbhzlfe4.jpg)

以下是在网卡上配置静态IP的方法：
  
  * `nmcli`（命令行工具）
  * 网络脚本文件（`ifcfg-*`）
  * `nmtui`（基于文本的用户界面）

### 使用 nmcli 命令行工具配置静态 IP 地址

每当我们安装 RHEL 8 服务器时，就会自动安装命令行工具 `nmcli`，它是由网络管理器使用的，可以让我们在以太网卡上配置静态 IP 地址。

运行下面的 `ip addr` 命令，列出 RHEL 8 服务器上的以太网卡 

```
[root@linuxtechi ~]# ip addr
```

正如我们在上面的命令输出中看到的，我们有两个网卡 `enp0s3` 和 `enp0s8`。当前分配给网卡的 IP 地址是通过 DHCP 服务器获得的。

假设我们希望在第一个网卡 (`enp0s3`) 上分配静态 IP 地址，具体内容如下: 

  * IP 地址 = 192.168.1.4
  * 网络掩码 = 255.255.255.0
  * 网关 = 192.168.1.1
  * DNS = 8.8.8.8

依次运行以下 `nmcli` 命令来配置静态 IP，

使用 `nmcli connection` 命令列出当前活动的以太网卡，

```
[root@linuxtechi ~]# nmcli connection
NAME    UUID                                  TYPE      DEVICE
enp0s3  7c1b8444-cb65-440d-9bf6-ea0ad5e60bae  ethernet  enp0s3
virbr0  3020c41f-6b21-4d80-a1a6-7c1bd5867e6c  bridge    virbr0
[root@linuxtechi ~]#
```

使用下面的 `nmcli` 给 `enp0s3` 分配静态 IP。

**命令语法：**

```
# nmcli connection modify <interface_name> ipv4.address  <ip/prefix>
```

**注意:** 为了简化语句，在 `nmcli` 命令中，我们通常用 `con` 关键字替换 `connection`，并用 `mod` 关键字替换 `modify`。 

将 IPv4 地址 (192.168.1.4) 分配给 `enp0s3` 网卡上，

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.addresses 192.168.1.4/24
```

使用下面的 `nmcli` 命令设置网关，

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.gateway 192.168.1.1
```

设置手动配置（从 dhcp 到 static），

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.method manual
```

设置 DNS 值为 “8.8.8.8”，

```
[root@linuxtechi ~]# nmcli con mod enp0s3 ipv4.dns "8.8.8.8"
```

要保存上述更改并重新加载，请执行如下 `nmcli` 命令，

```
[root@linuxtechi ~]# nmcli con up enp0s3
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/4)
```

以上命令显示网卡 `enp0s3` 已成功配置。我们使用 `nmcli` 命令做的那些更改都将永久保存在文件 `etc/sysconfig/network-scripts/ifcfg-enp0s3` 里。

```
[root@linuxtechi ~]# cat /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

![ifcfg-enp0s3-file-rhel8][2]

要确认 IP 地址是否分配给了 `enp0s3` 网卡了，请使用以下 IP 命令查看，

```
[root@linuxtechi ~]#ip addr show enp0s3
```

### 使用网络脚本文件（ifcfg-*）手动配置静态 IP 地址

我们可以使用配置以太网卡的网络脚本或 `ifcfg-*` 文件来配置以太网卡的静态 IP 地址。假设我们想在第二个以太网卡 `enp0s8` 上分配静态 IP 地址：

* IP 地址 = 192.168.1.91
* 前缀 = 24
* 网关 =192.168.1.1
* DNS1 =4.2.2.2


转到目录 `/etc/sysconfig/network-scripts`，查找文件 `ifcfg-enp0s8`，如果它不存在，则使用以下内容创建它，

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

保存并退出文件，然后重新启动网络管理器服务以使上述更改生效，

```
[root@linuxtechi network-scripts]# systemctl restart NetworkManager
```

现在使用下面的 `ip` 命令来验证 IP 地址是否分配给网卡，

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

以上输出内容确认静态 IP 地址已在网卡 `enp0s8` 上成功配置了。

### 使用 nmtui 实用程序配置静态 IP 地址 

`nmtui` 是一个基于文本用户界面的，用于控制网络的管理器，当我们执行 `nmtui` 时，它将打开一个基于文本的用户界面，通过它我们可以添加、修改和删除连接。除此之外，`nmtui` 还可以用来设置系统的主机名。 

假设我们希望通过以下细节将静态 IP 地址分配给网卡 `enp0s3` ，

* IP 地址 = 10.20.0.72
* 前缀 = 24
* 网关 = 10.20.0.1
* DNS1 = 4.2.2.2

运行 `nmtui` 并按照屏幕说明操作，示例如下所示，

```
[root@linuxtechi ~]# nmtui
```

![nmtui-rhel8][3]

选择第一个选项 “Edit a connection”，然后选择接口为 “enp0s3”，

![Choose-interface-nmtui-rhel8][4]

选择 “Edit”，然后指定 IP 地址、前缀、网关和域名系统服务器 IP，

![set-ip-nmtui-rhel8][5]

选择确定，然后点击回车。在下一个窗口中，选择 “Activate a connection”，

![Activate-option-nmtui-rhel8][6]

选择 “enp0s3”，选择 “Deactivate” 并点击回车，

![Deactivate-interface-nmtui-rhel8][7]

现在选择 “Activate” 并点击回车，

![Activate-interface-nmtui-rhel8][8]

选择 “Back”，然后选择 “Quit”，

![Quit-Option-nmtui-rhel8][9]

使用下面的 `ip` 命令验证 IP 地址是否已分配给接口 `enp0s3`，

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

以上输出内容显示我们已经使用 `nmtui` 实用程序成功地将静态 IP 地址分配给接口 `enp0s3`。

以上就是本教程的全部内容，我们已经介绍了在 RHEL 8 系统上为以太网卡配置 IPv4 地址的三种不同方法。请在下面的评论部分分享反馈和评论。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/configure-static-ip-address-rhel8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Configure-Static-IP-RHEL8.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/ifcfg-enp0s3-file-rhel8.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/nmtui-rhel8.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-interface-nmtui-rhel8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/set-ip-nmtui-rhel8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Activate-option-nmtui-rhel8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Deactivate-interface-nmtui-rhel8.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Activate-interface-nmtui-rhel8.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Quit-Option-nmtui-rhel8.jpg
