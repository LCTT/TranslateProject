[#]: subject: "How to Setup Internet in CentOS, RHEL, Rocky Linux Minimal Install"
[#]: via: "https://www.debugpoint.com/setup-internet-minimal-install-server/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15126-1.html"

如何在最小安装的 CentOS、RHEL、Rocky Linux 中设置互联网
======

![](https://img.linux.net.cn/data/attachment/album/202210/10/162428grhkhtayzt4cdh5k.jpg)

> 在最小安装的服务器中设置互联网或网络非常容易。本指南将解释如何在最小安装的 CentOS、RHEL 和 Rocky Linux 中设置互联网或网络。

当你安装了任何服务器发行版的最小安装环境，你将没有任何 GUI 或桌面环境来设置你的网络或互联网。因此，当你只能访问终端时，了解如何设置互联网非常重要。NetworkManager 工具提供了必要的工具，辅以 systemd 服务来完成这项工作。以下是方法。

### 在最小安装的 CentOS、RHEL、Rocky Linux 中设置互联网

在你完成了服务器的安装后，启动进入服务器终端。理想情况下，你会看到一个终端提示符。使用 root 或管理员账户登录。

首先，尝试使用 [nmcli][1] 检查网络接口的状态和详细信息。`nmcli` 是用于控制 NetworkManager 服务的命令行工具。使用以下命令进行检查。

```
nmcli device status
```

这将显示设备名称、状态等。

![nmcli device status][2]

运行工具 `nmtui` 来配置网络接口。

`nmtui` 是 NetworkManager 工具的一部分，它为你提供了一个友好的用户界面来配置网络。

这是 `NetworkManager-tui` 包的一部分，在你完成最小服务器安装后默认安装。

```
nmtui
```

单击 nmtui 窗口中的“<ruby>编辑连接<rt>Edit a connection</rt></ruby>”。

![nmtui - 选择选项][3]

选择接口名称

![选择要编辑的接口][4]

在“<ruby>编辑连接<rt>Edit Connection</rt></ruby>”窗口中，为 IPv4 和 IPv6 选择“<ruby>自动<rt>Automatic</rt></ruby>”选项。并选择“<ruby>自动连接<rt>Automatically Connect</rt></ruby>”。完成后按 “OK”。

![nmtui - 编辑连接][5]

使用以下命令通过 [systemd systemctl][6] 重启 NetworkManager 服务。

```
systemctl restart NetworkManager
```

如果一切顺利，你可以在最小安装的 CentOS、RHEL 和 Rocky Linux 服务器中连接到网络和互联网。前提是你的网络有互联网连接。你可以使用 `ping` 来验证它是否正常工作。

![设置最小化服务器互联网 - CentOS Rocky Linux RHEL][7]

### 附加技巧：在最小化服务器中设置静态 IP

当你将网络配置设置为自动时，接口会在你连接到互联网时动态分配 IP。在你设置局域网的某些情况下，你可能希望将静态 IP 分配给你的网络接口。这非常容易。

打开你的网络配置脚本。将 `ens3` 改为为你自己的设备名。

```
vi /etc/sysconfig/network-scripts/ifcfg-ens3
```

在上面的文件中，使用 `IPADDR` 属性添加所需的 IP 地址。保存文件。

```
IPADDR=192.168.0.55
```

在 `/etc/sysconfig/network` 中为你的网络添加网关。

```
NETWORKING=yes
HOSTNAME=debugpoint
GATEWAY=10.1.1.1
```

在 `/etc/resolv.conf` 中添加任意公共 DNS 服务器。

```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

然后重启网络服务。

```
systemctl restart NetworkManager
```

这就完成了静态 IP 的设置。你还可以使用 `ip addr` 命令检查 IP 详细信息。

### 总结

我希望本指南可以帮助你在最小化安装的服务器中设置网络、互联网和静态 IP。如果你有任何问题，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/setup-internet-minimal-install-server/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://linux.die.net/man/1/nmcli
[2]: https://www.debugpoint.com/wp-content/uploads/2021/06/nmcli-device-status.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2021/06/nmtui-Select-options.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2021/06/Select-Interface-to-Edit.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2021/06/nmtui-Edit-Connection.jpg
[6]: https://www.debugpoint.com/2020/12/systemd-systemctl-service/
[7]: https://www.debugpoint.com/wp-content/uploads/2021/06/setup-internet-minimal-server-CentOS-Rocky-Linux-RHEL.jpg