[#]: subject: (Access an alternate internet with OpenNIC)
[#]: via: (https://opensource.com/article/21/4/opennic-internet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13393-1.html)

用 OpenNIC 访问另一个互联网
======

> 在超级信息高速公路上绕行。

![](https://img.linux.net.cn/data/attachment/album/202105/15/181625le76l758lel653b5.jpg)

用传奇的 DNS 黑客 Dan Kaminsky 的话说，“事实证明，互联网对全球社会而言意义重大”。为了使互联网发挥作用，计算机必须能够在最复杂的网络万维网（WWW）中找到彼此。这是几十年前给政府工作人员和学术界 IT 人员提出的问题，而今天我们使用的正是他们的解决方案。然而，他们实际上并不是在寻求建立 <ruby>互联网<rt>the Internet</rt></ruby>，他们是在为 <ruby>互联网络</rt></ruby>（实际上是 <ruby>级联网<rt>catenets</rt></ruby>，即“<ruby>级联的网络<rt>concatenated networks</rt></ruby></ruby>”，但这个术语最终不再流行）定义规范，它是一个<ruby>互连的网络<rt>interconnected networks</rt></ruby>的通用术语。

根据这些规范，网络使用数字组合，作为每台在线计算机的一种家地址，并为每个网站分配一个人性化但高度结构化的“主机名”（如 `example.com`）。由于用户主要是通过网站 _名称_ 与互联网互动，可以说互联网的运作只是因为我们都同意一个标准化的命名方案。如果有足够多的人决定使用不同的命名方案，互联网的工作方式 _可能_ 会有所不同。一群用户可以形成一个平行的互联网，它使用相同的物理基础设施（电缆、卫星和其他传输方式，将数据从一个地方传送到另一个地方），但使用不同的方法将主机名与编号地址联系起来。

事实上，这已经存在了，这篇文章展示了你如何访问它。

### 了解名称服务器

术语“<ruby>互联网<rt>internet</rt></ruby>”实际上是 <ruby>互联<rt>interconnected</rt></ruby> 和 <ruby>网络<rt>networks</rt></ruby> 这两个术语的组合，因为这正是它的本质。就像一个城市里的邻里、一个国家里的城市、或一个大陆里的国家，或一个星球里的大陆一样，互联网通过将数据从一个家庭或办公室网络传输到数据中心和服务器房或其他家庭或办公室网络而跨越了全球。这是一项艰巨的任务，但它并非没有先例。毕竟，电话公司很久以前就把世界连接起来了，在那之前，电报和邮政服务也是这样做的。

在电话或邮件系统中，有一份名单，无论是正式的还是非正式的，都将人名与实际地址联系起来。它过去以电话簿的形式传递到家里，该电话簿是社区内每个电话所有者的目录。邮局的运作方式不同：他们通常依靠寄信人知道预定收信人的姓名和地址，但邮政编码和城市名称被用来把信送到正确的邮局。无论哪种方式，都需要有一个标准的组织方案。

对于计算机来说，[IP 协议][2] 描述了必须如何设置互联网上的地址格式。域名服务器 [（DNS） 协议][3] 描述了如何将人性化名称分配给 IP 以及从 IP 解析。无论你使用的是 IPv4 还是 IPv6，其想法都是一样的：当一个节点（可能是一台计算机或通往另一个网络的网关）加入一个网络时，它被分配一个 IP 地址。

如果你愿意，你可以在 [ICANN][4]（一个帮助协调互联网上的网站名称的非营利组织）注册一个域名，并将该名称指向该 IP。没有要求你“拥有”该 IP 地址。任何人都可以将任何域名指向任何 IP 地址。唯一的限制是，一次只能有一个人拥有一个特定的域名，而且域名必须遵循公认的 DNS 命名方案。

域名及其相关 IP 地址的记录被输入到 DNS 中。当你在浏览器中导航到一个网站时，它会迅速查询 DNS 网络，以找到与你所输入（或从搜索引擎点击）的任何 URL 相关的 IP 地址。

### 一个不同的 DNS

为了避免在谁拥有哪个域名的问题上发生争论，大多数域名注册商对域名注册收取一定的费用。该费用通常是象征性的，有时甚至是 0 美元（例如，`freenom.com` 提供免费的 `.tk`、`.ml`、`.gq` 和 `.cf` 域名，先到先得）。

在很长一段时间里，只有几个“顶级”域名，包括 `.org`、`.edu` 和 `.com`。现在有很多，包括 `.club`、`.biz`、`.name`、`.international` 等等。本质上它们就是字母组合，但是，有很多潜在的顶级域名是无效的，如 `.null`。如果你试图导航到一个以 `.null` 结尾的网站，那么你不会成功。它不能注册，也不是域名服务器的有效条目，而且它根本就不存在。

[OpenNIC项目][5] 已经建立了一个备用的 DNS 网络，将域名解析为 IP 地址，但它包括目前互联网不使用的名字。可用的顶级域名包括：

  * .geek
  * .indy
  * .bbs
  * .gopher
  * .o
  * .libre
  * .oss
  * .dyn
  * .null

你可以在这些（以及更多的）顶级域名中注册一个域名，并在 OpenNIC 的 DNS 系统上注册，使它们映射到你选择的 IP 地址。

换句话说，一个网站可能存在于 OpenNIC 网络中，但对于不使用 OpenNIC 名称服务器的人来说，仍然无法访问。这绝不是一种安全措施，甚至不是一种混淆手段。这只是一种有意识的选择，在 _超级信息高速公路上绕行_ 。

### 如何使用 OpenNIC 的 DNS 服务器

要访问 OpenNIC 网站，你必须配置你的计算机使用 OpenNIC 的 DNS 服务器。幸运的是，这并不是一个非此即彼的选择。通过使用一个 OpenNIC 的 DNS 服务器，你可以同时访问 OpenNIC 和标准网络。

要配置你的 Linux 电脑使用 OpenNIC 的 DNS 服务器，你可以使用 [nmcli][6] 命令，这是 Network Manager 的一个终端界面。在开始配置之前，请访问 [opennic.org][5]，寻找离你最近的 OpenNIC DNS 服务器。与标准 DNS 和 [边缘计算][7] 一样，服务器在地理上离你越近，你的浏览器查询时的延迟就越少。

下面是如何使用 OpenNIC：

1、首先，获得一个连接列表：

```
$ sudo nmcli connection
NAME                TYPE             DEVICE
Wired connection 1  802-3-ethernet   eth0
MyPersonalWifi      802-11-wireless  wlan0
ovpn-phx2-tcp       vpn              --
```

你的连接肯定与这个例子不同，但要关注第一栏。这提供了你的连接的可读名称。在这个例子中，我将配置我的以太网连接，但这个过程对无线连接是一样的。

2、现在你知道了需要修改的连接的名称，使用 `nmcli` 更新其 `ipv4.dns` 属性：

```
$ sudo nmcli con modify "Wired connection 1" ipv4.dns "134.195.4.2"
```

在这个例子中，`134.195.4.2` 是离我最近的服务器。

3、防止 Network Manager 使用你路由器设置的内容自动更新 `/etc/resolv.conf`：

```
$ sudo nmcli con modify "Wired connection 1" ipv4.ignore-auto-dns yes
```

4、将你的网络连接关闭，然后再次启动，以实例化新的设置：

```
$ sudo nmcli con down "Wired connection 1"
$ sudo nmcli con up "Wired connection 1"
```

完成了。你现在正在使用 OpenNIC 的 DNS 服务器。

#### 路由器上的 DNS

你可以通过对你的路由器做这样的修改，将你的整个网络设置为使用 OpenNIC。你将不必配置你的计算机的连接，因为路由器将自动提供正确的 DNS 服务器。我无法演示这个，因为路由器的接口因制造商而异。此外，一些互联网服务提供商 （ISP） 不允许你修改名称服务器的设置，所以这并不总是一种选择。

### 测试 OpenNIC

为了探索你所解锁的“其他”互联网，尝试在你的浏览器中导航到 `grep.geek`。如果你输入 `http://grep.geek`，那么你的浏览器就会带你到 OpenNIC 的搜索引擎。如果你只输入 `grep.geek`，那么你的浏览器会干扰你，把你带到你的默认搜索引擎（如 [Searx][8] 或 [YaCy][9]），并在窗口的顶部提供一个导航到你首先请求的页面。

![OpenNIC][10]

不管怎么说，你最终还是来到了 `grep.geek`，现在可以在网上搜索 OpenNIC 的版本了。

### 广阔天地

互联网旨在成为一个探索、发现和平等访问的地方。OpenNIC 利用现有的基础设施和技术帮助确保这些东西。它是一个可选择的互联网替代方案。如果这些想法吸引了你，那就试一试吧!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/opennic-internet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://tools.ietf.org/html/rfc791
[3]: https://tools.ietf.org/html/rfc1035
[4]: https://www.icann.org/resources/pages/register-domain-name-2017-06-20-en
[5]: http://opennic.org
[6]: https://opensource.com/article/20/7/nmcli
[7]: https://opensource.com/article/17/9/what-edge-computing
[8]: http://searx.me
[9]: https://opensource.com/article/20/2/open-source-search-engine
[10]: https://opensource.com/sites/default/files/uploads/did-you-mean.jpg (OpenNIC)
[11]: https://creativecommons.org/licenses/by-sa/4.0/
