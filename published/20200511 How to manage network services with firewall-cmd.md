[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12276-1.html)
[#]: subject: (How to manage network services with firewall-cmd)
[#]: via: (https://fedoramagazine.org/how-to-manage-network-services-with-firewall-cmd/)
[#]: author: (dan01 https://fedoramagazine.org/author/dan01/)

如何使用 firewall-cmd 管理网络服务
======

![](https://img.linux.net.cn/data/attachment/album/202006/03/090806hcmc9cxcbbcuccbe.jpg)

在上一篇文章中，我们探讨了如何在 Fedora 中[用命令行控制防火墙][2]。

现在你将看到如何“添加”、“删除”和“列出”服务、协议和端口，以便“阻止”或“允许”它们。

### 简短回顾

首先，最好检查一下防火墙的*状态*，看它是否正在运行。如我们先前所学，你可以使用状态选项（`firewall-cmd ‐‐state`）来得到。

下一步是获取网络接口适用的<ruby>域<rt>zone</rt></ruby>。例如，我使用的桌面有两个网络接口：一个*物理*接口（`enp0s3`），代表我实际的*网卡*，和*虚拟*接口（`virbr0`），它由 KVM 等虚拟化软件使用。要查看哪些域处于活动状态，请运行 `firewall-cmd ‐‐get-active-zones`。

现在，你知道了你感兴趣的域，可以使用 `firewall-cmd ‐‐info-zone=FedoraWorkstation` 这样的命令列出该域的规则。

### 读取区域信息

要显示*特定域*的信息，请运行 `firewall-cmd ‐‐zone=ZoneName ‐‐list-all`，或使用以下命令显示默认域的信息：

```
[dan@localhost ~]$ firewall-cmd --list-all
FedoraWorkstation (active)
target: default
icmp-block-inversion: no
interfaces: enp0s3
sources:
services: dhcpv6-client mdns samba-client ssh
ports: 1025-65535/udp 1025-65535/tcp
protocols:
masquerade: no
forward-ports:
source-ports:
icmp-blocks:
rich rules:
```

现在，让我们查看输出。第一行表明以下信息关联的域以及该域当前是否在使用中。

`target: default`：告诉我们这是默认域。可以通过 `‐‐set-default-zone=ZoneName` 和 `‐‐get-default-zone` 设置或获取。

`icmp-block-inversion` 表明是否阻止 [ICMP][3] 请求。例如，如果机器响应来自网络上其他机器的 ping 请求。

`interfaces` 字段显示接受此域的所有接口。

### 处理服务、端口和协议

现在，重点关注 `services`、`ports` 和 `protocols` 所在行。默认情况下，防火墙将阻止所有端口、服务和协议，而只允许列出的。

在这里，你可以看到允许的服务是非常基本的客户端服务。例如，访问网络上的共享文件夹（`samba-client`）、与 DNS 服务器通信或通过 SSH（`ssh` 服务）连接到计算机。你可以将 `service` 视为与端口组合的协议，例如 `ssh` 服务使用 SSH 协议，并且按照惯例使用 22 端口。通过允许 `ssh` 服务，你实际上所做的就是允许传入的连接在默认 22 端口上使用 SSH 协议。

请注意，根据经验，名称中带有 `client` 字样的服务是指传出连接，也就是你使用你的 IP 作为源对外部的*连接*，与之相反的是 `ssh` 服务，比如，它将接受传入连接（监听来自外部的连接）。

你可以在文件 `/etc/services` 中查找服务。例如，如果你想知道这些服务使用什么端口和协议：

```
[dan@localhost ~]$ cat /etc/services | grep ssh
ssh 22/tcp # The Secure Shell (SSH) Protocol
ssh 22/udp # The Secure Shell (SSH) Protocol
```

你可以看到 SSH 同时使用 TCP 和 UDP 的 22 端口。此外，如果你希望查看所有可用的服务，只需使用 `firewall-cmd --get-services`。

#### 打开端口

如果要阻止端口、服务或协议，请确保在此处未列出它们。展开来说，如果要允许服务，那么需要将它添加到列表中。

假设你要打开 `5000` 端口用于 TCP 连接。为此，请运行：

```
sudo firewall-cmd --zone=FedorwaWorkstation --permanent --add-port=5000/tcp
```

请注意，你需要指定规则适用的域。添加规则时，还需要如上指定它是 `tcp` 还是 `udp` 端口。`--permanent` 参数将规则设置为即使系统重启后也可以保留。

再次查看你所在区域的信息：

```
[dan@localhost ~]$ firewall-cmd --list-all
FedoraWorkstation (active)
target: default
icmp-block-inversion: no
interfaces: enp0s3
sources:
services: dhcpv6-client mdns samba-client ssh
ports: 1025-65535/udp 1025-65535/tcp 5000/tcp
protocols:
masquerade: no
forward-ports:
source-ports:
icmp-blocks:
rich rules:
```

类似地，如果你想从列表删除该端口，请运行：

```
sudo firewall-cmd --zone=FedorwaWorkstation --permanent --remove-port=5000/tcp
```

相同的 `remove` （`‐‐remove-protocol`、`‐‐remove-service`） 和 `add`（`‐‐add-protocol`、`‐‐add-service`）选项同样适用于*服务*和*协议*。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-manage-network-services-with-firewall-cmd/

作者：[dan01][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dan01/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/services-firewall-cmd-816x345.jpg
[2]: https://linux.cn/article-12103-1.html
[3]: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
[4]: https://unsplash.com/@tkaiser?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/poke-hole?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
