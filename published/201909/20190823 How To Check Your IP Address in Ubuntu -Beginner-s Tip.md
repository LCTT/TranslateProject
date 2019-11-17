[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11308-1.html)
[#]: subject: (How To Check Your IP Address in Ubuntu [Beginner’s Tip])
[#]: via: (https://itsfoss.com/check-ip-address-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

如何在 Ubuntu 中检查你的 IP 地址
======

不知道你的 IP 地址是什么？以下是在 Ubuntu 和其他 Linux 发行版中检查 IP 地址的几种方法。

![][1]

### 什么是 IP 地址？

**互联网协议地址**（通常称为 **IP 地址**）是分配给连接到计算机网络的每个设备（使用互联网协议）的数字标签。IP 地址用于识别和定位机器。

**IP 地址**在网络中是*唯一的*，使得所有连接设备能够通信。

你还应该知道有两种**类型的 IP 地址**：**公有**和**私有**。**公有 IP 地址**是用于互联网通信的地址，这与你用于邮件的物理地址相同。但是，在本地网络（例如使用路由器的家庭）的环境中，会为每个设备分配在该子网内唯一的**私有 IP 地址**。这在本地网络中使用，而不直接暴露公有 IP（路由器用它与互联网通信）。

另外还有区分 **IPv4** 和 **IPv6** 协议。**IPv4** 是经典的 IP 格式，它由基本的 4 部分结构组成，四个字节用点分隔（例如 127.0.0.1）。但是，随着设备数量的增加，IPv4 很快就无法提供足够的地址。这就是 **IPv6** 被发明的原因，它使用 **128 位地址**的格式（与 **IPv4** 使用的 **32 位地址**相比）。

### 在 Ubuntu 中检查你的 IP 地址（终端方式）

检查 IP 地址的最快和最简单的方法是使用 `ip` 命令。你可以按以下方式使用此命令：

```
ip addr show
```

它将同时显示 IPv4 和 IPv6 地址：

![Display IP Address in Ubuntu Linux][2]

实际上，你可以进一步缩短这个命令 `ip a`。它会给你完全相同的结果。

```
ip a
```

如果你希望获得最少的细节，也可以使用 `hostname`：

```
hostname -I
```

还有一些[在 Linux 中检查 IP 地址的方法][3]，但是这两个命令足以满足这个目的。

`ifconfig` 如何？

老用户可能会想要使用 `ifconfig`（net-tools 软件包的一部分），但该程序已被弃用。一些较新的 Linux 发行版不再包含此软件包，如果你尝试运行它，你将看到 ifconfig 命令未找到的错误。

### 在 Ubuntu 中检查你的 IP 地址（GUI 方式）

如果你对命令行不熟悉，你还可以使用图形方式检查 IP 地址。

打开 Ubuntu 应用菜单（在屏幕左下角**显示应用**）并搜索**Settings**，然后单击图标：

![Applications Menu Settings][5]

这应该会打开**设置菜单**。进入**网络**：

![Network Settings Ubuntu][6]

按下连接旁边的**齿轮图标**会打开一个窗口，其中包含更多设置和有关你网络链接的信息，其中包括你的 IP 地址：

![IP Address GUI Ubuntu][7]

### 额外提示：检查你的公共 IP 地址（适用于台式计算机）

首先，要检查你的**公有 IP 地址**（用于与服务器通信），你可以[使用 curl 命令][8]。打开终端并输入以下命令：

```
curl ifconfig.me
```

这应该只会返回你的 IP 地址而没有其他多余信息。我建议在分享这个地址时要小心，因为这相当于公布你的个人地址。

**注意：** 如果 `curl` 没有安装，只需使用 `sudo apt install curl -y` 来解决问题，然后再试一次。

另一种可以查看公共 IP 地址的简单方法是在 Google 中搜索 “ip address”。

### 总结

在本文中，我介绍了在 Uuntu Linux 中找到 IP 地址的不同方法，并向你概述了 IP 地址的用途以及它们对我们如此重要的原因。

我希望你喜欢这篇文章。如果你觉得文章有用，请在评论栏告诉我们！

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-ip-address-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/checking-ip-address-ubuntu.png?resize=800%2C450&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/ip_addr_show.png?fit=800%2C493&ssl=1
[3]: https://linuxhandbook.com/find-ip-address/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/applications_menu_settings.jpg?fit=800%2C309&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/network_settings_ubuntu.jpg?fit=800%2C591&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/ip_address_gui_ubuntu.png?fit=800%2C510&ssl=1
[8]: https://linuxhandbook.com/curl-command-examples/
