6 个打造你自己的 VPN 的开源工具
======

> 想尝试建立您自己的 VPN，但是不确定从哪里开始吗？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/vpn_scrabble_networking.jpg?itok=pdsUHw5N)

如果您想尝试建立您自己的 VPN，但是不确定从哪里开始，那么您来对地方了。我将比较 6 个在您自己的服务器上搭建和使用 VPN 的最好的自由和开源工具。不管您是想为您的企业建立站点到站点的 VPN，还是只是想创建一个远程代理访问以解除访问限制并对 ISP 隐藏你的互联网流量，都可以通过 VPN 来达成。

根据您的需求和条件，并参考您自己的技术特长、环境以及您想要通过 VPN 实现的目标。需要考虑以下因素：

  * VPN 协议
  * 客户端的数量和设备类型
  * 服务端的兼容性
  * 需要的技术专业能力

### Algo

[Algo][1] 是从下往上设计的，可以为需要互联网安全代理的商务旅客创建 VPN 专用网。它“只包括您所需要的最小化的软件”，这意味着为了简单而牺牲了可扩展性。Algo 是基于 StrongSwan 的，但是删除了所有您不需要的东西，这有另外一个好处，那就是去除了新手可能不会注意到的安全漏洞。

作为额外的奖励，它甚至可以屏蔽广告！ 

Algo 只支持 IKEv2 协议和 Wireguard。因为对 IKEv2 的支持现在已经内置在大多数设备中，所以它不需要像 OpenVPN 这样的客户端应用程序。Algo 可以使用 Ansible 在 Ubuntu (首选选项)、Windows、RedHat、CentOS 和 FreeBSD 上部署。 使用 Ansible 可以自动化安装，它会根据您对一组简短的问题的回答来配置服务。卸载和重新部署也非常容易。

Algo 可能是在本文中安装和部署最简单和最快的 VPN。它非常简洁，考虑周全。如果您不需要其他工具提供的高级功能，只需要一个安全代理，这是一个很好的选择。请注意，Algo 明确表示，它不是为了解除地理封锁或逃避审查，主要是为了加密。

### Streisand

[Streisand][2] 可以使用一个命令安装在任何 Ubuntu 16.04 服务器上；这个过程大约需要 10 分钟。它支持 L2TP、OpenConnect、OpenSSH、OpenVPN、Shadowsocks、Stunnel、Tor bridge 和 WireGuard。根据您选择的协议，您可能需要安装客户端应用程序。

在很多方面，Streisand 与 Algo 相似，但是它提供了更多的协议和定制。这需要更多的工作来管理和维护，但也更加灵活。注意 Streisand 不支持 IKEv2。因为它的多功能性，我认为 Streisand 在某国和土耳其这样的地方绕过审查制度更有效，但是 Algo 的安装更容易和更快。

使用 Ansible 可以自动化安装，所以不需要太多的专业技术知识。通过向用户发送自定义生成的连接指令，包括服务器 SSL 证书的嵌入副本，可以轻松添加更多用户。

卸载 Streisand 是一个快速无痛的过程，您也可以随时重新部署。

### OpenVPN

[OpenVPN][3] 要求客户端和服务器应用程序使用其同名的协议建立 VPN 连接。OpenVPN 可以根据您的需求进行调整和定制，但它也需要更多专业技术知识。它支持远程访问和站点到站点配置；如果您计划使用 VPN 作为互联网代理，前者是您所需要的。因为在大多数设备上使用 OpenVPN 需要客户端应用程序，所以最终用户必须保持更新。

服务器端您可以选择部署在云端或你自己的 Linux 服务器上。兼容的发行版包括 CentOS 、Ubuntu 、Debian 和 openSUSE。Windows 、MacOS 、iOS 和 Android 都有客户端应用程序，其他设备也有非官方应用程序。企业可以选择设置一个 OpenVPN 接入服务器，但是对于想要使用社区版的个人来说，这可能有点过分。

OpenVPN 使用静态密钥加密来配置相对容易，但并不十分安全。相反，我建议使用 [easy-rsa][4] 来设置它，这是一个密钥管理包，可以用来设置公钥基础设施（PKI）。这允许您一次连接多个设备，并因此得到<ruby>完美前向保密<rt>perfect forward secrecy</rt></ruby>和其他好处的保护。OpenVPN 使用 SSL/TLS 进行加密，而且您可以在配置中指定 DNS 服务器。

OpenVPN 可以穿透防火墙和 NAT 防火墙，这意味着您可以使用它绕过可能会阻止连接的网关和防火墙。它同时支持 TCP 和 UDP 传输。

### StrongSwan

您可能会遇到一些名称中有 “Swan” 的各种 VPN 工具。FreeS/WAN 、OpenSwan、LibreSwan 和 [strongSwan][5] 都是同一个项目的分叉，后者是我个人最喜欢的。在服务器端，strongSwan 可以运行在 Linux 2.6、3.x 和 4x 内核、Android、FreeBSD、macOS、iOS 和 Windows 上。

StrongSwan 使用 IKEv2 协议和 IPSec 。与 OpenVPN 相比，IKEv2 连接速度更快，同时提供了很好的速度和安全性。如果您更喜欢不需要在客户端安装额外应用程序的协议，这将非常有用，因为现在生产的大多数新设备都支持 IKEv2，包括 Windows、MacOS、iOS 和 Android。 

StrongSwan 并不特别容易使用，尽管文档不错，但它使用的词汇与大多数其他工具不同，这可能会让人比较困惑。它的模块化设计让它对企业来说很棒，但这也意味着它不是很精简。这当然不像 Algo 或 Streisand 那么简单。

访问控制可以基于使用 X.509 属性证书的组成员身份，这是 strongSwan 独有的功能。它支持用于集成到其他环境（如 Windows Active Directory）中的 EAP 身份验证方法。strongSwan 可以穿透NAT 网络防火墙。 

### SoftEther

[SoftEther][6] 是由日本筑波大学的一名研究生发起的一个项目。SoftEther VPN 服务器和 VPN 网桥可以运行在 Windows、Linux、OSX、FreeBSD 和 Solaris 上，而客户端应用程序可以运行在 Windows、Linux 和 MacOS 上。VPN 网桥主要用于需要设置站点到站点 VPN 的企业，因此单个用户只需要服务器和客户端程序来设置远程访问。

SoftEther 支持 OpenVPN、L2TP、SSTP 和 EtherIP 协议，由于采用“基于 HTTPS 的以太网”伪装，它自己的 SoftEther 协议声称能够免疫深度数据包检测。SoftEther 还做了一些调整，以减少延迟并增加吞吐量。此外，SoftEther 还包括一个克隆功能，允许您轻松地从 OpenVPN  过渡到 SoftEther。

SoftEther 可以穿透 NAT 防火墙并绕过防火墙。在只允许 ICMP 和 DNS 数据包的受限网络上，您可以利用 SoftEther 的基于 ICMP 或 DNS 的 VPN 方式来穿透防火墙。SoftEther 可与 IPv4 和 IPv6 一起工作。

SoftEther 比 OpenVPN 和 strongSwan 更容易设置，但比 Streisand 和 Algo 要复杂。

### WireGuard

[WireGuard][7] 是这个名单上最新的工具；它太新了，甚至还没有完成。也就是说，它为部署 VPN 提供了一种快速简便的方法。它旨在通过使  IPSec 更简单、更精简来改进它，就像 SSH 一样。

与 OpenVPN 一样，WireGuard 既是一种协议，也是一种用于部署使用所述协议的 VPN 的软件工具。一个关键特性是“加密密钥路由”，它将公钥与隧道内允许的 IP 地址列表相关联。

WireGuard 可用于 Ubuntu、Debian、Fedora、CentOS、MacOS、Windows 和安卓系统。WireGuard 可在 IPv4 和 IPv6 上工作。

WireGuard 比大多数其他 VPN 协议轻得多，它只在需要发送数据时才发送数据包。

开发人员说，WireGuard 还不应该被信任，因为它还没有被完全审计过，但是欢迎你给它一个机会。这可能是下一个热门！

### 自制 VPN vs. 商业 VPN

制作您自己的 VPN 为您的互联网连接增加了一层隐私和安全，但是如果您是唯一一个使用它的人，那么装备精良的第三方，比如政府机构，将很容易追踪到你的活动。

此外，如果您计划使用您的 VPN 来解锁地理锁定的内容，自制的 VPN 可能不是最好的选择。因为您只能从一个 IP 地址连接，所以你的 VPN 服务器很容易被阻止。

好的商业 VPN 不存在这些问题。有了像 [ExpressVPN][8] 这样的提供商，您可以与数十甚至数百个其他用户共享服务器的 IP 地址，这使得跟踪一个用户的活动几乎变得不可能。您也可以从成百上千的服务器中选择，所以如果其中一台被列入黑名单，你可以切换到另一台。

然而，商业 VPN 的权衡是，您必须相信提供商不会窥探您的互联网流量。一定要选择一个有明确的无日志政策的信誉良好的供应商。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/open-source-tools-vpn

作者：[Paul Bischoff][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/paulbischoff
[1]: https://blog.trailofbits.com/2016/12/12/meet-algo-the-vpn-that-works/
[2]: https://github.com/StreisandEffect/streisand
[3]: https://openvpn.net/
[4]: https://github.com/OpenVPN/easy-rsa
[5]: https://www.strongswan.org/
[6]: https://www.softether.org/
[7]: https://www.wireguard.com/
[8]: https://www.comparitech.com/vpn/reviews/expressvpn/
