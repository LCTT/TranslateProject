[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage network services with firewall-cmd)
[#]: via: (https://fedoramagazine.org/how-to-manage-network-services-with-firewall-cmd/)
[#]: author: (dan01 https://fedoramagazine.org/author/dan01/)

如何使用 firewall-cmd 管理网络服务
======

![][1]

在上一篇文章中，我们探讨了如何在 Fedora 中[用命令行控制防火墙][2]。

现在你将看到如何“添加”、“删除”和“列出”服务、协议和端口，以便“阻止”或“允许”它们。

### 简短回顾

首先，最好检查一下防火墙的_状态_，看它是否正在运行。如我们先前所学，你可以使用状态选项（_firewall-cmd_ ‐‐_state_）来执行。

下一步是获取所需网络接口的区域。例如，我使用的桌面有两个网络接口：一个_物理_接口（_enp0s3_），代表我实际的_网卡_，和_虚拟_接口（_virbr0_），它被 _KVM_ 等虚拟化软件使用。要查看哪些区域处于活动状态，请运行 _firewall-cmd ‐‐get-active-zones_。

现在，你知道了你感兴趣的区域，可以使用 _firewall-cmd -info-zone = FedoraWorkstation_ 列出该区域的规则。

### 读取区域信息

要显示特定_区域_的信息，请运行  _firewall-cmd ‐‐zone=ZoneName ‐‐list-all_，或使用以下命令显示默认区域的信息：

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

现在，让我们查看输出。第一行表明以下信息关联的_区域_以及该区域当前是否在使用中。

_target_ : _default_  告诉我们这是默认区域。可以通过 _‐‐set-default-zone=ZoneName_ 和 _‐‐get-default-zone_ 设置或获取。

_icmp-block-inversion_ 表明是否阻止 [ICMP][3] 请求。例如，如果机器响应来自网络上其他机器的 _ping_ 请求。 _interfaces_ 字段显示接受此区域的所有接口。

### 处理服务、端口和协议

现在，重点关注 _services _、_ ports_ 和 _protocols_ 所在行。默认情况下，防火墙将阻止所有端口、服务和协议。而只允许列出的。

在这里，你可以看到允许的服务是非常基本的客户端服务。例如，访问网络上的共享文件夹（_samba-client_），与 _DNS_ 服务器通信或通过 SSH（_ssh_ 服务）连接到计算机。你可以将 _service_ 视为与端口组合的协议，例如 ssh 服务使用 SSH 协议，并且按照惯例使用 22 端口。通过允许 ssh 服务，你实际上所做的就是允许传入的连接在默认 22 端口上使用 ssh 协议。

请注意，根据经验，名称中带有 _client_ 字样的服务是指传出连接，也就是你使用你的 IP 作为源与外部_连接_，与之相反的是 **SSH** 服务，比如，它将接受传入连接（监听你外部的连接）。

你可以在文件 _/etc/services_ 中查找服务。例如，如果你想知道这些服务使用什么端口和协议：

```
[dan@localhost ~]$ cat /etc/services | grep ssh
ssh 22/tcp # The Secure Shell (SSH) Protocol
ssh 22/udp # The Secure Shell (SSH) Protocol
```

你可以看到 SSH 同时使用 TCP 和 UDP 的 22 端口。此外，如果你希望查看所有可用的服务，只需使用 _firewall-cmd -get-services_。

#### 打开端口

如果要阻止端口、服务或协议，请确保在此处未列出它们。 扩展一下，如果要允许服务，那么需要将它添加到列表中。

假设你要打开 _5000_ 端口用于 _TCP_ 连接。 为此，请运行：

```
sudo firewall-cmd --zone=FedorwaWorkstation --permanent --add-port=5000/tcp
```

请注意，你需要指定规则适用的区域。添加规则时，还需要如上指定它是 _TCP_ 还是 _UDP_ 端口。_permanent_ 参数将规则设置为即使系统重启后也可以保留。

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

相同的 _remove_ （_‐‐remove-protocol_, _‐‐remove-service_） 和  _add_ （_‐‐add-protocol_, _‐‐add-service_）选项同样适用于_服务_和_协议_。

* * *

_照片由 [T. Kaiser][4] 拍摄，发布于[Unsplash][5]_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-manage-network-services-with-firewall-cmd/

作者：[dan01][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dan01/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/services-firewall-cmd-816x345.jpg
[2]: https://fedoramagazine.org/control-the-firewall-at-the-command-line/
[3]: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
[4]: https://unsplash.com/@tkaiser?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/poke-hole?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
