[#]: subject: "Configure your OpenVPN server on Linux"
[#]: via: "https://opensource.com/article/21/7/openvpn-firewall"
[#]: author: "D. Greg Scott https://opensource.com/users/greg-scott"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13707-1.html"

如何在免费 WiFi 中保护隐私（三）
======

> 在你安装了 0penVPN 之后，是时候配置它了。

![](https://img.linux.net.cn/data/attachment/album/202108/22/081708mvgwwzv8f58vgwqz.jpg)

0penVPN 在两点之间建立一条加密的隧道，阻止第三方访问你的网络流量。通过设置你的 “虚拟专用网络” 服务，你就成为你自己的 “虚拟专用网络” 供应商。许多流行的 “虚拟专用网络” 服务已支持 [0penVPN][2]，所以当你可以掌控自己的网络时，为什么还要将你的网络连接绑定到特定的提供商呢？

本系列中的 [第一篇][3] 展示了如何安装和配置一台作为你的 0penVPN 服务器的 Linux 计算机。，[第二篇][4] 演示了如何安装和配置 0penVPN 服务器软件。这第三篇文章演示了如何在认证成功的情况下启动 0penVPN。

要设置一个 0penVPN 服务器，你必须：

  * 创建一个配置文件。
  * 使用 `sysctl` 设置`net.ipv4.ip_forward = 1` 以启用路由。
  * 为所有的配置和认证文件设置适当的所有权，以便使用非 root 账户运行 0penVPN 服务器守护程序。
  * 设置 0penVPN 加载适当的配置文件启动。
  * 配置你的防火墙。

### 配置文件

你必须在 `/etc/openvpn/server/` 中创建一个服务器配置文件。如果你想的话，你可以从头开始，0penVPN 包括了几个配置示例示例文件，可以以此作为开始。看看 `/usr/share/doc/openvpn/sample/sample-config-files/` 就知道了。

如果你想手工建立一个配置文件，可以从 `server.conf` 或 `roadwarrior-server.conf` 开始（视情况而定），并将你的配置文件放在 `/etc/openvpn/server` 中。这两个文件都有大量的注释，所以请阅读注释并根据你的情况作出决定。

你可以使用我预先建立的服务器和客户端配置文件模板和 `sysctl` 文件来打开网络路由，从而节省时间和麻烦。这个配置还包括自定义记录连接和断开的情况。它在 0penVPN 服务器的 `/etc/openvpn/server/logs` 中保存日志。

如果你使用我的模板，你需要使用你的 IP 地址和主机名编辑它们。

要使用我的预建配置模板、脚本和 `sysctl` 来打开 IP 转发，请下载我的脚本：

```
$ curl \
  https://www.dgregscott.com/ovpn/OVPNdownloads.sh > \
  OVPNdownloads.sh
```

阅读该脚本，了解它的工作内容。下面是它的运行概述：

  * 在你的 0penVPN 服务器上创建适当的目录
  * 从我的网站下载服务器和客户端的配置文件模板
  * 下载我的自定义脚本，并以正确的权限把它们放到正确的目录中
  * 下载 `99-ipforward.conf` 并把它放到 `/etc/sysctl.d` 中，以便在下次启动时打开 IP 转发功能
  * 为 `/etc/openvpn` 中的所有内容设置了所有权

当你确定你理解了这个脚本的作用，就使它可执行并运行它：

```
$ chmod +x OVPNdownloads.sh
$ sudo ./OVPNdownloads.sh
```

下面是它复制的文件（注意文件的所有权）：

```
$ ls -al -R /etc/openvpn
/etc/openvpn:
total 12
drwxr-xr-x.  4 openvpn openvpn  34 Apr 6 20:35 .
drwxr-xr-x. 139 root  root  8192 Apr 6 20:35 ..
drwxr-xr-x.  2 openvpn openvpn  33 Apr 6 20:35 client
drwxr-xr-x.  4 openvpn openvpn  56 Apr 6 20:35 server

/etc/openvpn/client:
total 4
drwxr-xr-x. 2 openvpn openvpn  33 Apr 6 20:35 .
drwxr-xr-x. 4 openvpn openvpn  34 Apr 6 20:35 ..
-rw-r--r--. 1 openvpn openvpn 1764 Apr 6 20:35 OVPNclient2020.ovpn

/etc/openvpn/server:
total 4
drwxr-xr-x. 4 openvpn openvpn  56 Apr 6 20:35 .
drwxr-xr-x. 4 openvpn openvpn  34 Apr 6 20:35 ..
drwxr-xr-x. 2 openvpn openvpn  59 Apr 6 20:35 ccd
drwxr-xr-x. 2 openvpn openvpn  6 Apr 6 20:35 logs
-rw-r--r--. 1 openvpn openvpn 2588 Apr 6 20:35 OVPNserver2020.conf

/etc/openvpn/server/ccd:
total 8
drwxr-xr-x. 2 openvpn openvpn 59 Apr 6 20:35 .
drwxr-xr-x. 4 openvpn openvpn 56 Apr 6 20:35 ..
-rwxr-xr-x. 1 openvpn openvpn 917 Apr 6 20:35 client-connect.sh
-rwxr-xr-x. 1 openvpn openvpn 990 Apr 6 20:35 client-disconnect.sh

/etc/openvpn/server/logs:
total 0
drwxr-xr-x. 2 openvpn openvpn 6 Apr 6 20:35 .
drwxr-xr-x. 4 openvpn openvpn 56 Apr 6 20:35 ..
```

下面是 `99-ipforward.conf` 文件：

```
# Turn on IP forwarding. OpenVPN servers need to do routing
net.ipv4.ip_forward = 1
```

编辑 `OVPNserver2020.conf` 和 `OVPNclient2020.ovpn` 以包括你的 IP 地址。同时，编辑 `OVPNserver2020.conf` 以包括你先前的服务器证书名称。稍后，你将重新命名和编辑 `OVPNclient2020.ovpn` 的副本，以便在你的客户电脑上使用。以 `***?` 开头的块显示了你要编辑的地方。

### 文件所有权

如果你使用了我网站上的自动脚本，文件所有权就已经到位了。如果没有，你必须确保你的系统有一个叫 `openvpn` 的用户，并且是 `openvpn` 组的成员。你必须将 `/etc/openvpn` 中的所有内容的所有权设置为该用户和组。如果你不确定该用户和组是否已经存在，这样做也是安全的，因为 `useradd` 会拒绝创建一个与已经存在的用户同名的用户：

```
$ sudo useradd openvpn
$ sudo chown -R openvpn.openvpn /etc/openvpn
```

### 防火墙

如果你在步骤 1 中启用 firewalld 服务，那么你的服务器的防火墙服务可能默认不允许 “虚拟专用网络” 流量。使用 [firewall-cmd 命令][5]，你可以启用 0penVPN 服务，它可以打开必要的端口并按需路由流量：

```
$ sudo firewall-cmd --add-service openvpn --permanent
$ sudo firewall-cmd --reload
```

没有必要在 iptables 的迷宫中迷失方向!

### 启动你的服务器

现在你可以启动 0penVPN 服务器了。为了让它在重启后自动运行，使用 `systemctl` 的 `enable` 子命令：

```
systemctl enable --now openvpn-server@OVPNserver2020.service
```

### 最后的步骤

本文的第四篇也是最后一篇文章将演示如何设置客户端，以便远程连接到你的 0penVPN。

_本文基于 D.Greg Scott 的[博客][6]，经许可后重新使用。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/openvpn-firewall

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://openvpn.net/
[3]: https://linux.cn/article-13680-1.html
[4]: https://linux.cn/article-13702-1.html
[5]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[6]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/
