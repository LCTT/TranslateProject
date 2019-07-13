使用 mDNS 在局域网中轻松发现系统
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/mDNS-816x345.jpg)

mDNS（<ruby>多播 DNS<rt>Multicast DNS</rt></ruby>）允许系统在局域网中广播查询其他资源的名称。Fedora 用户经常在没有复杂名称服务的路由器上接有多个 Linux 系统。在这种情况下，mDNS 允许你按名称与多个系统通信 —— 多数情况下不用路由器。你也不必在所有本地系统上同步类似 `/etc/hosts` 之类的文件。本文介绍如何设置它。

mDNS 是一个零配置网络服务，它已经诞生了很长一段时间。Fedora  Workstation 带有零配置系统 Avahi（它包含 mDNS）。 （mDNS 也是 Bonjour 的一部分，可在 Mac OS 上找到。）

本文假设你有两个系统运行受支持的 Fedora 版本（27 或 28）。它们的主机名是 castor 和 pollux。

### 安装包

确保系统上安装了 nss-mdns 和 avahi 软件包。你可能是不同的版本，这也没问题：

```
$ rpm -q nss-mdns avahi
nss-mdns-0.14.1-1.fc28.x86_64
avahi-0.7-13.fc28.x86_64
```

Fedora Workstation 默认提供这两个包。如果不存在，请安装它们：

```
$ sudo dnf install nss-mdns avahi
```

确保 `avahi-daemon.service` 单元已启用并正在运行。同样，这是 Fedora Workstation 的默认设置。

```
$ sudo systemctl enable --now avahi-daemon.service
```

虽然是可选的，但你可能还需要安装 avahi-tools 软件包。该软件包包括许多方便的程序，用于检查系统上的零配置服务的工作情况。使用这个 `sudo` 命令：

```
$ sudo dnf install avahi-tools
```

`/etc/nsswitch.conf` 控制系统使用哪个服务用于解析，以及它们的顺序。你应该在那个文件中看到这样的一行：

```
hosts: files mdns4_minimal [NOTFOUND=return] dns myhostname
```

注意命令 `mdns4_minimal [NOTFOUND=return]`。它们告诉你的系统使用多播 DNS 解析程序将主机名解析为 IP 地址。即使该服务有效，如果名称无法解析，也会尝试其余服务。

如果你没有看到与此类似的配置，则可以（以 root 用户身份）对其进行编辑。但是，nss-mdns 包会为你处理此问题。如果你对自己编辑它感到不舒服，请删除并重新安装该软件包以修复该文件。

在**两个系统**中执行同样的步骤 。

### 设置主机名并测试

现在你已完成常见的配置工作，请使用以下方法之一设置每个主机的名称：

1. 如果你正在使用 Fedora Workstation，[你可以使用这个步骤][1]。
2. 如果没有，请使用 `hostnamectl` 来做。在第一台机器上这么做：`$ hostnamectl set-hostname castor`。
3. 你还可以编辑 `/etc/avahi/avahi-daemon.conf`，删除主机名设置行上的注释，并在那里设置名称。但是，默认情况下，Avahi 使用系统提供的主机名，因此你**不应该**需要此方法。

接下来，重启 Avahi 守护进程，以便它接收更改：

```
$ sudo systemctl restart avahi-daemon.service
```

然后正确设置另一台机器：

```
$ hostnamectl set-hostname pollux
$ sudo systemctl restart avahi-daemon.service
```

只要你的路由器没有禁止 mDNS 流量，你现在应该能够登录到 castor 并 ping 通另一台机器。你应该使用默认的 .local 域名，以便解析正常工作：

```
$ ping pollux.local
PING pollux.local (192.168.0.1) 56(84) bytes of data.
64 bytes from 192.168.0.1 (192.168.0.1): icmp_seq=1 ttl=64 time=3.17 ms
64 bytes from 192.168.0.1 (192.168.0.1): icmp_seq=2 ttl=64 time=1.24 ms
...
```

如果你在 pollux `ping castor.local`，同样的技巧也适用。现在在网络中访问你的系统更方便了！

此外，如果你的路由器也支持这个服务，请不要感到惊讶。现代 WiFi 和有线路由器通常提供这些服务，以使消费者的生活更轻松。

此过程适用于大多数系统。但是，如果遇到麻烦，请使用 avahi-browse 和 avahi-tools 软件包中的其他工具来查看可用的服务。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/find-systems-easily-lan-mdns/

作者：[Paul W. Frields][a]  选题：[lujun9972](https://github.com/lujun9972)  译者：[geekpi](https://github.com/geekpi)  校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[1]: https://fedoramagazine.org/set-hostname-fedora/
