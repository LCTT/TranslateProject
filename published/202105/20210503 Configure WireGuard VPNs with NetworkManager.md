[#]: subject: (Configure WireGuard VPNs with NetworkManager)
[#]: via: (https://fedoramagazine.org/configure-wireguard-vpns-with-networkmanager/)
[#]: author: (Maurizio Garcia https://fedoramagazine.org/author/malgnuz/)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13379-1.html)

用 NetworkManager 配置 WireGuard 虚拟私有网络
======

![](https://img.linux.net.cn/data/attachment/album/202105/10/235609bmbzbr4bikupbjjr.jpg)

<ruby>虚拟私有网络<rt>Virtual Private Networks</rt></ruby>应用广泛。如今有各种方案可供使用，用户可通过这些方案访问任意类型的资源，同时保持其机密性与隐私性。

最近，WireGuard 因为其简单性、速度与安全性成为最广泛使用的虚拟私有网络协议之一。WireGuard 最早应用于 Linux 内核，但目前可以用在其他平台，例如 iOS、Android 等。

WireGuard 使用 UDP 作为其传输协议，并在 Critokey Routing（CKR）的基础上建立对等节点之间的通信。每个对等节点（无论是服务器或客户端）都有一对<ruby>密钥<rt>key</rt></ruby>（公钥与私钥），公钥与许可 IP 间建立通信连接。有关 WireGuard 更多信息请访问其 [主页][4]。

本文描述了如何在两个对等节点（PeerA 与 PeerB）间设置 WireGuard。两个节点均运行 Fedora Linux 系统，使用 NetworkManager 进行持久性配置。

### WireGuard 设置与网络配置

在 PeerA 与 PeerB 之间建立持久性虚拟私有网络连接只需三步：

  1. 安装所需软件包。
  2. 生成<ruby>密钥对<rt>key pair</rt></ruby>。
  3. 配置 WireGuard 接口。

### 安装

在两个对等节点（PeerA 与 PeerB）上安装 `wireguard-tools` 软件包：

```
$ sudo -i
# dnf -y install wireguard-tools
```

这个包可以从 Fedora Linux 更新库中找到。它在 `/etc/wireguard/` 中创建一个配置目录。在这里你将创建密钥和接口配置文件。

### 生成密钥对

现在，使用 `wg` 工具在每个节点上生成公钥与私钥：

```
# cd /etc/wireguard
# wg genkey | tee privatekey | wg pubkey > publickey
```

### 在 PeerA 上配置 WireGuard 接口

WireGuard 接口命名规则为 `wg0`、`wg1` 等等。完成下述步骤为 WireGuard 接口创建配置：

  * PeerA 节点上配置想要的 IP 地址与掩码。
  * 该节点监听的 UDP 端口。
  * PeerA 的私钥。

```
# cat << EOF > /etc/wireguard/wg0.conf
[Interface]
Address = 172.16.1.254/24
SaveConfig = true
ListenPort = 60001
PrivateKey = mAoO2RxlqRvCZZoHhUDiW3+zAazcZoELrYbgl+TpPEc=

[Peer]
PublicKey = IOePXA9igeRqzCSzw4dhpl4+6l/NiQvkDSAnj5LtShw=
AllowedIPs = 172.16.1.2/32
EOF
```

允许 UDP 流量通过节点监听的端口：

```
# firewall-cmd --add-port=60001/udp --permanent --zone=public
# firewall-cmd --reload
success
```

最后，将接口配置文件导入 NetworkManager。这样，WireGuard 接口在重启后将持续存在。

```
# nmcli con import type wireguard file /etc/wireguard/wg0.conf
Connection 'wg0' (21d939af-9e55-4df2-bacf-a13a4a488377) successfully added.
```

验证 `wg0`的状态：

```
# wg
interface: wg0
  public key: FEPcisOjLaZsJbYSxb0CI5pvbXwIB3BCjMUPxuaLrH8=
  private key: (hidden)
  listening port: 60001

peer: IOePXA9igeRqzCSzw4dhpl4+6l/NiQvkDSAnj5LtShw=
  allowed ips: 172.16.1.2/32

# nmcli -p device show wg0

===============================================================================
                             Device details (wg0)
===============================================================================
GENERAL.DEVICE:                         wg0
-------------------------------------------------------------------------------
GENERAL.TYPE:                           wireguard
-------------------------------------------------------------------------------
GENERAL.HWADDR:                         (unknown)
-------------------------------------------------------------------------------
GENERAL.MTU:                            1420
-------------------------------------------------------------------------------
GENERAL.STATE:                          100 (connected)
-------------------------------------------------------------------------------
GENERAL.CONNECTION:                     wg0
-------------------------------------------------------------------------------
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveC>
-------------------------------------------------------------------------------
IP4.ADDRESS[1]:                         172.16.1.254/24
IP4.GATEWAY:                            --
IP4.ROUTE[1]:                           dst = 172.16.1.0/24, nh = 0.0.0.0, mt =>
-------------------------------------------------------------------------------
IP6.GATEWAY:                            --
-------------------------------------------------------------------------------
```

上述输出显示接口 `wg0` 已连接。现在，它可以和虚拟私有网络 IP 地址为 172.16.1.2 的对等节点通信。

### 在 PeerB 上配置 WireGuard 接口

现在可以在第二个对等节点上创建 `wg0` 接口的配置文件了。确保你已经完成以下步骤：

  * PeerB 节点上设置 IP 地址与掩码。
  * PeerB 的私钥。
  * PeerA 的公钥。
  * PeerA 的 IP 地址或主机名、监听 WireGuard 流量的 UDP 端口。

```
# cat << EOF > /etc/wireguard/wg0.conf
[Interface]
Address = 172.16.1.2
SaveConfig = true
PrivateKey = UBiF85o7937fBK84c2qLFQwEr6eDhLSJsb5SAq1lF3c=

[Peer]
PublicKey = FEPcisOjLaZsJbYSxb0CI5pvbXwIB3BCjMUPxuaLrH8=
AllowedIPs = 172.16.1.254/32
Endpoint = peera.example.com:60001
EOF
```

最后一步是将接口配置文件导入 NetworkManager。如上所述，这一步是重启后保持 WireGuard 接口持续存在的关键。

```
# nmcli con import type wireguard file /etc/wireguard/wg0.conf
Connection 'wg0' (39bdaba7-8d91-4334-bc8f-85fa978777d8) successfully added.
```

验证 `wg0` 的状态：

```
# wg
interface: wg0
  public key: IOePXA9igeRqzCSzw4dhpl4+6l/NiQvkDSAnj5LtShw=
  private key: (hidden)
  listening port: 47749

peer: FEPcisOjLaZsJbYSxb0CI5pvbXwIB3BCjMUPxuaLrH8=
  endpoint: 192.168.124.230:60001
  allowed ips: 172.16.1.254/32

# nmcli -p device show wg0

===============================================================================
                             Device details (wg0)
===============================================================================
GENERAL.DEVICE:                         wg0
-------------------------------------------------------------------------------
GENERAL.TYPE:                           wireguard
-------------------------------------------------------------------------------
GENERAL.HWADDR:                         (unknown)
-------------------------------------------------------------------------------
GENERAL.MTU:                            1420
-------------------------------------------------------------------------------
GENERAL.STATE:                          100 (connected)
-------------------------------------------------------------------------------
GENERAL.CONNECTION:                     wg0
-------------------------------------------------------------------------------
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveC>
-------------------------------------------------------------------------------
IP4.ADDRESS[1]:                         172.16.1.2/32
IP4.GATEWAY:                            --
-------------------------------------------------------------------------------
IP6.GATEWAY:                            --
-------------------------------------------------------------------------------
```

上述输出显示接口 `wg0` 已连接。现在，它可以和虚拟私有网络 IP 地址为 172.16.1.254 的对等节点通信。

### 验证节点间通信

完成上述步骤后，两个对等节点可以通过虚拟私有网络连接相互通信，以下是 ICMP 测试结果：

```
[root@peerb ~]# ping 172.16.1.254 -c 4
PING 172.16.1.254 (172.16.1.254) 56(84) bytes of data.
64 bytes from 172.16.1.254: icmp_seq=1 ttl=64 time=0.566 ms
64 bytes from 172.16.1.254: icmp_seq=2 ttl=64 time=1.33 ms
64 bytes from 172.16.1.254: icmp_seq=3 ttl=64 time=1.67 ms
64 bytes from 172.16.1.254: icmp_seq=4 ttl=64 time=1.47 ms
```

在这种情况下，如果你在 PeerA 端口 60001 上捕获 UDP 通信，则将看到依赖 WireGuard 协议的通信过程和加密的数据：

![捕获依赖 WireGuard 协议的节点间 UDP 流量][5]

## 总结

虚拟私有网络很常见。在用于部署虚拟私有网络的各种协议和工具中，WireGuard 是一种简单、轻巧和安全的选择。它可以在对等节点之间基于 CryptoKey 路由建立安全的点对点连接，过程非常简单。此外，NetworkManager 支持 WireGuard 接口，允许重启后进行持久配置。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/configure-wireguard-vpns-with-networkmanager/

作者：[Maurizio Garcia][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/malgnuz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/wireguard-nm-816x345.jpg
[2]: https://youtu.be/0eiXMGfZc60?t=633
[3]: https://www.youtube.com/c/HighTreason610/featured
[4]: https://www.wireguard.com/
[5]: https://fedoramagazine.org/wp-content/uploads/2021/04/capture-1024x601.png
