CentOS 上的 FirewallD 简明指南
============================================================

[FirewallD][4] 是 iptables 的前端控制器，用于实现持久的网络流量规则。它提供命令行和图形界面，在大多数 Linux 发行版的仓库中都有。与直接控制 iptables 相比，使用 FirewallD 有两个主要区别：

1. FirewallD 使用区域和服务而不是链式规则。
2. 它动态管理规则集，允许更新规则而不破坏现有会话和连接。

> FirewallD 是 iptables 的一个封装，可以让你更容易地管理 iptables 规则 - 它并*不是* iptables 的替代品。虽然 iptables 命令仍可用于 FirewallD，但建议使用 FirewallD 时仅使用 FirewallD 命令。

本指南将向您介绍 FirewallD 的区域和服务的概念，以及一些基本的配置步骤。

### 安装与管理 FirewallD

CentOS 7 和 Fedora 20+ 已经包含了 FirewallD，但是默认没有激活。可以像其它的 systemd 单元那样控制它。

1、 启动服务，并在系统引导时启动该服务：

```
sudo systemctl start firewalld
sudo systemctl enable firewalld
```

要停止并禁用：

```
sudo systemctl stop firewalld
sudo systemctl disable firewalld
```

2、 检查防火墙状态。输出应该是 `running` 或者 `not running`。

```
sudo firewall-cmd --state
``` 

3、 要查看 FirewallD 守护进程的状态：

```
sudo systemctl status firewalld
```

示例输出

```
firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled)
   Active: active (running) since Wed 2015-09-02 18:03:22 UTC; 1min 12s ago
 Main PID: 11954 (firewalld)
   CGroup: /system.slice/firewalld.service
   └─11954 /usr/bin/python -Es /usr/sbin/firewalld --nofork --nopid
```

4、 重新加载 FirewallD 配置：

```
sudo firewall-cmd --reload
```

### 配置 FirewallD

FirewallD 使用 XML 进行配置。除非是非常特殊的配置，你不必处理它们，而应该使用 `firewall-cmd`。

配置文件位于两个目录中：

* `/usr/lib/FirewallD` 下保存默认配置，如默认区域和公用服务。 避免修改它们，因为每次 firewall 软件包更新时都会覆盖这些文件。
* `/etc/firewalld` 下保存系统配置文件。 这些文件将覆盖默认配置。

#### 配置集

FirewallD 使用两个_配置集_：“运行时”和“持久”。 在系统重新启动或重新启动 FirewallD 时，不会保留运行时的配置更改，而对持久配置集的更改不会应用于正在运行的系统。

默认情况下，`firewall-cmd` 命令适用于运行时配置，但使用 `--permanent` 标志将保存到持久配置中。要添加和激活持久性规则，你可以使用两种方法之一。

1、 将规则同时添加到持久规则集和运行时规则集中。

```
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=http
```
 
2、 将规则添加到持久规则集中并重新加载 FirewallD。

```
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload
```

> `reload` 命令会删除所有运行时配置并应用永久配置。因为 firewalld 动态管理规则集，所以它不会破坏现有的连接和会话。

### 防火墙的区域

“区域”是针对给定位置或场景（例如家庭、公共、受信任等）可能具有的各种信任级别的预构建规则集。不同的区域允许不同的网络服务和入站流量类型，而拒绝其他任何流量。 首次启用 FirewallD 后，`public` 将是默认区域。

区域也可以用于不同的网络接口。例如，要分离内部网络和互联网的接口，你可以在 `internal` 区域上允许 DHCP，但在`external` 区域仅允许 HTTP 和 SSH。未明确设置为特定区域的任何接口将添加到默认区域。

要找到默认区域：

```
sudo firewall-cmd --get-default-zone
```

要修改默认区域：

```
sudo firewall-cmd --set-default-zone=internal
```

要查看你网络接口使用的区域：
 
```
sudo firewall-cmd --get-active-zones
```

示例输出：

```
public
  interfaces: eth0
```
 
要得到特定区域的所有配置：

```
sudo firewall-cmd --zone=public --list-all
```

示例输出：

```
public (default, active)
  interfaces: ens160
  sources:
  services: dhcpv6-client http ssh
  ports: 12345/tcp
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
```
 
要得到所有区域的配置：

```
sudo firewall-cmd --list-all-zones
```

示例输出：

```
block
  interfaces:
  sources:
  services:
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

  ...

work
  interfaces:
  sources:
  services: dhcpv6-client ipp-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
```
 

#### 与服务一起使用

FirewallD 可以根据特定网络服务的预定义规则来允许相关流量。你可以创建自己的自定义系统规则，并将它们添加到任何区域。 默认支持的服务的配置文件位于 `/usr/lib /firewalld/services`，用户创建的服务文件在 `/etc/firewalld/services` 中。

要查看默认的可用服务：

```
sudo firewall-cmd --get-services
```
 
比如，要启用或禁用 HTTP 服务：

```
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --remove-service=http --permanent
```

#### 允许或者拒绝任意端口/协议

比如：允许或者禁用 12345 端口的 TCP 流量。

```
sudo firewall-cmd --zone=public --add-port=12345/tcp --permanent
sudo firewall-cmd --zone=public --remove-port=12345/tcp --permanent
```

#### 端口转发

下面是**在同一台服务器上**将 80 端口的流量转发到 12345 端口。

```
sudo firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=12345
``` 

要将端口转发到**另外一台服务器上**：

1、 在需要的区域中激活 masquerade。

```
sudo firewall-cmd --zone=public --add-masquerade
```

2、 添加转发规则。例子中是将 IP 地址为 ：123.456.78.9 的_远程服务器上_ 80 端口的流量转发到 8080 上。


```
sudo firewall-cmd --zone="public" --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=123.456.78.9
```

要删除规则，用 `--remove` 替换 `--add`。比如：

```
sudo firewall-cmd --zone=public --remove-masquerade
```

### 用 FirewallD 构建规则集

例如，以下是如何使用 FirewallD 为你的服务器配置基本规则（如果您正在运行 web 服务器）。

1. 将 `eth0` 的默认区域设置为 `dmz`。 在所提供的默认区域中，dmz（非军事区）是最适合于这个程序的，因为它只允许 SSH 和 ICMP。

```
sudo firewall-cmd --set-default-zone=dmz
sudo firewall-cmd --zone=dmz --add-interface=eth0
```

2、 把 HTTP 和 HTTPS 添加永久的服务规则到 dmz 区域中：

```
sudo firewall-cmd --zone=dmz --add-service=http --permanent
sudo firewall-cmd --zone=dmz --add-service=https --permanent
```

3、 重新加载 FirewallD 让规则立即生效：

```
sudo firewall-cmd --reload
```

如果你运行 `firewall-cmd --zone=dmz --list-all`， 会有下面的输出：

```
dmz (default)
  interfaces: eth0
  sources:
  services: http https ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:
```

这告诉我们，`dmz` 区域是我们的**默认**区域，它被用于 `eth0` 接口**中所有网络的**源地址**和**端口**。 允许传入 HTTP（端口 80）、HTTPS（端口 443）和 SSH（端口 22）的流量，并且由于没有 IP 版本控制的限制，这些适用于 IPv4 和 IPv6。 不允许**IP 伪装**以及**端口转发**。 我们没有 **ICMP 块**，所以 ICMP 流量是完全允许的。没有**丰富（Rich）规则**，允许所有出站流量。

### 高级配置

服务和端口适用于基本配置，但对于高级情景可能会限制较多。  丰富（Rich）规则和直接（Direct）接口允许你为任何端口、协议、地址和操作向任何区域 添加完全自定义的防火墙规则。

#### 丰富规则

丰富规则的语法有很多，但都完整地记录在 [firewalld.richlanguage(5)][5] 的手册页中（或在终端中 `man firewalld.richlanguage`）。 使用 `--add-rich-rule`、`--list-rich-rules` 、 `--remove-rich-rule` 和 firewall-cmd 命令来管理它们。

这里有一些常见的例子：

允许来自主机 192.168.0.14 的所有 IPv4 流量。

```
sudo firewall-cmd --zone=public --add-rich-rule 'rule family="ipv4" source address=192.168.0.14 accept'
```

拒绝来自主机 192.168.1.10 到 22 端口的 IPv4 的 TCP 流量。

```
sudo firewall-cmd --zone=public --add-rich-rule 'rule family="ipv4" source address="192.168.1.10" port port=22 protocol=tcp reject'
```

允许来自主机 10.1.0.3 到 80 端口的 IPv4 的 TCP 流量，并将流量转发到 6532 端口上。

```
sudo firewall-cmd --zone=public --add-rich-rule 'rule family=ipv4 source address=10.1.0.3 forward-port port=80 protocol=tcp to-port=6532'
```

将主机 172.31.4.2 上 80 端口的 IPv4 流量转发到 8080 端口（需要在区域上激活 masquerade）。

```
sudo firewall-cmd --zone=public --add-rich-rule 'rule family=ipv4 forward-port port=80 protocol=tcp to-port=8080 to-addr=172.31.4.2'
```

列出你目前的丰富规则：

```
sudo firewall-cmd --list-rich-rules
```

### iptables 的直接接口

对于最高级的使用，或对于 iptables 专家，FirewallD 提供了一个直接（Direct）接口，允许你给它传递原始 iptables 命令。 直接接口规则不是持久的，除非使用 `--permanent`。

要查看添加到 FirewallD 的所有自定义链或规则：

```
firewall-cmd --direct --get-all-chains
firewall-cmd --direct --get-all-rules
```

讨论 iptables 的具体语法已经超出了这篇文章的范围。如果你想学习更多，你可以查看我们的 [iptables 指南][6]。

### 更多信息

你可以查阅以下资源以获取有关此主题的更多信息。虽然我们希望我们提供的是有效的，但是请注意，我们不能保证外部材料的准确性或及时性。

* [FirewallD 官方网站][1]
* [RHEL 7 安全指南：FirewallD 简介][2]
* [Fedora Wiki：FirewallD][3]

--------------------------------------------------------------------------------

via: https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos

作者：[Linode][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos
[1]:http://www.firewalld.org/
[2]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-Using_Firewalls.html#sec-Introduction_to_firewalld
[3]:https://fedoraproject.org/wiki/FirewallD
[4]:http://www.firewalld.org/
[5]:https://jpopelka.fedorapeople.org/firewalld/doc/firewalld.richlanguage.html
[6]:https://www.linode.com/docs/networking/firewalls/control-network-traffic-with-iptables
