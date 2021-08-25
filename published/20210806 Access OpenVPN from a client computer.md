[#]: subject: "Access OpenVPN from a client computer"
[#]: via: "https://opensource.com/article/21/7/openvpn-client"
[#]: author: "D. Greg Scott https://opensource.com/users/greg-scott"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13714-1.html"

如何在免费 WiFi 中保护隐私（四）
======

> 在 Linux 上安装好“虚拟专用网络” 之后，是时候使用它了。

![](https://img.linux.net.cn/data/attachment/album/202108/24/101214ng2afee2gmefgj5z.jpg)

0penVPN 在两点之间创建了一个加密通道，以阻止第三方访问你的网络流量数据。通过设置你的 “虚拟专用网络” 服务，你可以成为你自己的 “虚拟专用网络” 服务商。许多流行的 “虚拟专用网络” 服务都使用 0penVPN，所以当你可以掌控自己的网络时，为什么还要将你的网络连接绑定到特定的提供商呢？

本系列的 [第一篇文章][3] 安装了一个“虚拟专用网络” 的服务器，[第二篇文章][4] 介绍了如何安装和配置一个 0penVPN 服务软件，[第三篇文章][5] 解释了如何配置防火墙并启动你的 0penVPN 服务。第四篇也是最后一篇文章将演示如何从客户端计算机使用你的 0penVPN 服务器。这就是你做了前三篇文章中所有工作的原因！

### 创建客户端证书

请记住，0penVPN 的身份验证方法要求服务器和客户端都拥有某些东西（证书）并知道某些东西（口令）。是时候设置它了。

首先，为你的客户端计算机创建一个客户端证书和一个私钥。在你的 0penVPN 服务器上，生成证书请求。它会要求你输入密码；确保你记住它：

```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
  gen-req greglaptop
```

本例中，`greglaptop` 是创建证书的客户端计算机主机名。

无需将请求导入证书颁发机构（CA），因为它已经存在。审查它以确保请求存在：

```
$ cd /etc/openvpn/ca
$ /etc/openvpn/easy-rsa/easyrsa \
  show-req greglaptop
```

你也可以以客户端身份签署请求：

```
$ /etc/openvpn/easy-rsa/easyrsa \
  sign-req client greglaptop
```

### 安装 0penVPN 客户端软件

在 Linux 系统上，网络管理器可能已经包含了一个 0penVPN 客户端。如果没有，你可以安装插件：

```
$ sudo dnf install NetworkManager-openvpn
```

在 Windows 系统上，你必须从 0penVPN 下载网页下载和安装 0penVPN 客户端。启动安装程序并按照提示操作。

### 复制证书和私钥到客户端

现在你的客户端需要你为其生成的身份验证凭据。你在服务器上生成了这些，因此你必须将它们传输到你的客户端。我推荐使用 SSH 来完成传输。在 Linux 系统上，通过 `scp` 命令实现。在 Windows 系统上，你可以以管理员身份运行 [WinSCP][6] 来推送证书和密钥。

假设客户端名称为 `greglaptop`，那么证书和私钥的文件名以及服务的位置如下：

```
/etc/openvpn/ca/pki/issued/greglaptop.crt
/etc/openvpn/ca/pki/private/greglaptop.key
/etc/openvpn/ca/pki/issued/ca.crt
```

在 Linux 系统上，复制这些文件到 `/etc/pki/tls/certs` 目录。在 Windows 系统上，复制它们到 `C:\Program Files\OpenVPN\config` 目录。

### 复制和自定义客户端配置文件

在 Linux 系统上，你可以复制服务器上的 `/etc/openvpn/client/OVPNclient2020.ovpn` 文件到 `/etc/NetworkManager/system-connections/` 目录，或者你也可以导航到系统设置中的网络管理器添加一个“虚拟专用网络” 连接。

连接类型选择“<ruby>证书（TLS）<rt>Certificates(TLS)</rt></ruby>”。告知网络管理器你从服务器上复制的证书和密钥。

![VPN displayed in Network Manager][7]

在 Windows 系统上，以管理员身份运行 WinSCP，将服务器上的客户端配置模板 `/etc/openvpn/client/OVPNclient2020.ovpn` 文件复制到客户端上的 `C:\Program Files\OpenVPN\config` 目录。然后：

  * 重命名它以匹配上面的证书。
  * 更改 CA 证书、客户端证书和密钥的名称以匹配上面从服务器复制的名称。
  * 修改 IP 信息，以匹配你的网络。

你需要超级管理员权限来编辑客户端配置文件。最简单的方式就是以管理员身份启动一个 CMD 窗口，然后从管理员 CMD 窗口启动记事本来编辑此文件。

### 将你的客户端连接到服务器

在 Linux 系统上，网络管理器会显示你的 “虚拟专用网络” 连接。选择它进行连接。

![Add a connection in Network Manager][9]

在 Windows 系统上，启动 0penVPN 图形用户界面。它会在任务栏右侧的 Windows 系统托盘中生成一个图标，通常位于 Windows 桌面的右下角。右键单击图标以连接、断开连接或查看状态。

对于第一次连接，编辑客户端配置文件的 `remote` 行以使用 0penVPN 服务器的内部 IP 地址。通过右键单击 Windows 系统托盘中的 0penVPN 图标并单击“<ruby>连接<rt>Connect</rt></ruby>”，从办公室网络内部连接到服务器。调试此连接，这应该可以找到并解决问题，而不会出现任何防火墙问题，因为客户端和服务器都在防火墙的同一侧。

接下来，编辑客户端配置文件的 `remote` 行以使用 0penVPN 服务器的公共 IP 地址。将 Windows 客户端连接到外部网络并进行连接。调试有可能的问题。

### 安全连接

恭喜！你已经为其他客户端系统准备好了 0penVPN 网络。对其余客户端重复设置步骤。你甚至可以使用 Ansible 来分发证书和密钥并使其保持最新。

本文基于 D.Greg Scott 的 [博客][10]，经许可后重新使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/openvpn-client

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://openvpn.net/
[3]: https://linux.cn/article-13680-1.html
[4]: https://linux.cn/article-13702-1.html
[5]: https://linux.cn/article-13707-1.html
[6]: https://winscp.net/eng/index.php
[7]: https://opensource.com/sites/default/files/uploads/network-manager-profile.jpg (VPN displayed in Network Manager)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/network-manager-connect.jpg (Add a“虚拟专用网络” connection in Network Manager)
[10]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/
