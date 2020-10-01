[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12602-1.html)
[#]: subject: (What is DNS and how does it work?)
[#]: via: (https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html)
[#]: author: (Keith Shaw, Josh Fruhlinger )

什么是 DNS，它是如何工作的？
======

> 域名系统解析互联网网站的名称及其底层 IP 地址，并在此过程中增加了效率和安全性。

![](https://images.techhive.com/images/article/2017/04/domain-name-systems-dns-100719737-large.jpg)

<ruby>域名系统<rt>Domain Name System</rt></ruby>（DNS）是互联网的基础之一，然而大多数不懂网络的人可能并不知道他们每天都在使用它来工作、查看电子邮件或在智能手机上浪费时间。

就其本质而言，DNS 是一个与数字匹配的名称目录。这些数字，在这里指的是 IP 地址，计算机用 IP 地址来相互通信。大多数对 DNS 的描述都是用电话簿来比喻，这对于 30 岁以上的人来说是没有问题的，因为他们知道电话簿是什么。

如果你还不到 30 岁，可以把 DNS 想象成你的智能手机的联系人名单，它将人们的名字与他们的电话号码及电子邮件地址进行匹配，然后这个联系人名单的就像地球上的人一样多。

### DNS 简史

当互联网还非常、非常小的时候，人们很容易将特定的 IP 地址与特定的计算机对应起来，但随着越来越多的设备和人加入到不断发展的网络中，这种简单的情况就没法持续多久了。现在仍然可以在浏览器中输入一个特定的 IP 地址来到达一个网站，但当时和现在一样，人们希望得到一个由容易记忆的单词组成的地址，也就是我们今天所认识的那种域名（比如 linux.cn）。在 20 世纪 70 年代和 80 年代早期，这些名称和地址是由一个人指定的，她是[斯坦福大学的 Elizabeth Feinler][2]，她在一个名为 [HOSTS.TXT][3] 的文本文件中维护着一个主列表，记录了每一台连接互联网的计算机。

随着互联网的发展，这种局面显然无法维持下去，尤其是因为 Feinler 只处理加州时间下午 6 点之前的请求，而且圣诞节也要请假。1983 年，南加州大学的研究人员 Paul Mockapetris 受命在处理这个问题的多种建议中提出一个折中方案。但他基本上无视了所有提出的建议，而是开发了自己的系统，他将其称为 DNS。虽然从那时起，现今的它显然发生了很大的变化，但在基本层面上，它的工作方式仍然与将近 40 年前相同。

### DNS 服务器是如何工作的

将名字与数字相匹配的 DNS 目录并不是整个藏在互联网的某个黑暗角落。截至 2017 年底，[它记录了超过 3.32 亿个域名][4]，如果作为一个目录确实会非常庞大。就像互联网本身一样，该目录分布在世界各地，存储在域名服务器（一般简称为 DNS 服务器）上，这些服务器都会非常有规律地相互沟通，以提供更新和冗余。

### 权威 DNS 服务器与递归 DNS 服务器的比较

当你的计算机想要找到与域名相关联的 IP 地址时，它首先会向<ruby>递归<rt>recursive</rt></ruby> DNS 服务器（也称为递归解析器）提出请求。递归解析器是一个通常由 ISP 或其他第三方提供商运营的服务器，它知道需要向其他哪些 DNS 服务器请求解析一个网站的名称与其 IP 地址。实际拥有所需信息的服务器称为<ruby>权威<rt>authoritative</rt></ruby> DNS 服务器。

### DNS 服务器和 IP 地址

每个域名可以对应一个以上的 IP 地址。事实上，有些网站有数百个甚至更多的 IP 地址与一个域名相对应。例如，你的计算机访问 [www.google.com][5] 所到达的服务器，很可能与其他国家的人在浏览器中输入相同的网站名称所到达的服务器完全不同。

该目录的分布式性质的另一个原因是，如果这个目录只在一个位置，在数百万，可能是数十亿在同一时间寻找信息的人中共享，那么当你在寻找一个网站时，你需要花费多少时间才能得到响应 —— 这就像是排着长队使用电话簿一样。

### 什么是 DNS 缓存？

为了解决这个问题，DNS 信息在许多服务器之间共享。但最近访问过的网站的信息也会在客户端计算机本地缓存。你有可能每天使用 google.com 好几次。你的计算机不是每次都向 DNS 名称服务器查询 google.com 的 IP 地址，而是将这些信息保存在你的计算机上，这样它就不必访问 DNS 服务器来解析这个名称的 IP 地址。额外的缓存也可能出现在用于将客户端连接到互联网的路由器上，以及用户的互联网服务提供商（ISP）的服务器上。有了这么多的缓存，实际上对 DNS 名称服务器的查询数量比看起来要少很多。

### 如何找到我的 DNS 服务器？

一般来说，当你连接到互联网时，你使用的 DNS 服务器将由你的网络提供商自动建立。如果你想看看哪些服务器是你的主要名称服务器（一般是递归解析器，如上所述），有一些网络实用程序可以提供关于你当前网络连接的信息。[Browserleaks.com][6] 是一个很好的工具，它提供了很多信息，包括你当前的 DNS 服务器。

### 我可以使用 8.8.8.8 的 DNS 吗？

但要记住，虽然你的 ISP 会设置一个默认的 DNS 服务器，但你没有义务使用它。有些用户可能有理由避开他们 ISP 的 DNS —— 例如，有些 ISP 使用他们的 DNS 服务器将不存在的地址的请求重定向到[带有广告的网页][7]。

如果你想要一个替代方案，你可以将你的计算机指向一个公共 DNS 服务器，以它作为一个递归解析器。最著名的公共 DNS 服务器之一是谷歌的，它的 IP 地址是 8.8.8.8 和 8.8.4.4。Google 的 DNS 服务往往是[快速的][8]，虽然对 [Google 提供免费服务的别有用心的动机][9]有一定的质疑，但他们无法真正从你那里获得比他们从 Chrome 浏览器中获得的更多信息。Google 有一个页面，详细说明了如何[配置你的电脑或路由器][10]连接到 Google 的 DNS。

### DNS 如何提高效率

DNS 的组织结构有助于保持事情的快速和顺利运行。为了说明这一点，让我们假设你想访问 linux.cn。

如上所述，对 IP 地址的初始请求是向递归解析器提出的。递归解析器知道它需要请求哪些其他 DNS 服务器来解析一个网站（linux.cn）的名称与其 IP 地址。这种搜索会传递至根服务器，它知道所有顶级域名的信息，如 .com、.net、.org 以及所有国家域名，如 .cn（中国）和 .uk（英国）。根服务器位于世界各地，所以系统通常会将你引导到地理上最近的一个服务器。

一旦请求到达正确的根服务器，它就会进入一个顶级域名（TLD）名称服务器，该服务器存储二级域名的信息，即在你写在 .com、.org、.net 之前的单词（例如，linux.cn 的信息是 “linux”）。然后，请求进入域名服务器，域名服务器掌握着网站的信息和 IP 地址。一旦 IP 地址被找到，它就会被发回给客户端，客户端现在可以用它来访问网站。所有这一切都只需要几毫秒的时间。

因为 DNS 在过去的 30 多年里一直在工作，所以大多数人都认为它是理所当然的。在构建系统的时候也没有考虑到安全问题，所以[黑客们充分利用了这一点][11]，制造了各种各样的攻击。

### DNS 反射攻击

DNS 反射攻击可以用 DNS 解析器服务器的大量信息淹没受害者。攻击者使用伪装成受害者的 IP 地址来向他们能找到的所有开放的 DNS 解析器请求大量的 DNS 数据。当解析器响应时，受害者会收到大量未请求的 DNS 数据，使其不堪重负。

### DNS 缓存投毒

[DNS 缓存投毒][12]可将用户转移到恶意网站。攻击者设法在 DNS 中插入虚假的地址记录，这样，当潜在的受害者请求解析其中一个中毒网站的地址时，DNS 就会以另一个由攻击者控制的网站的 IP 地址作出回应。一旦访问了这些假网站，受害者可能会被欺骗，泄露密码或下载了恶意软件。

### DNS 资源耗尽

[DNS 资源耗尽][13]攻击可以堵塞 ISP 的 DNS 基础设施，阻止 ISP 的客户访问互联网上的网站。攻击者注册一个域名，并通过将受害者的名称服务器作为域名的权威服务器来实现这种攻击。因此，如果递归解析器不能提供与网站名称相关的 IP 地址，就会询问受害者的名称服务器。攻击者会对自己注册的域名产生大量的请求，并查询不存在的子域名，这就会导致大量的解析请求发送到受害者的名称服务器，使其不堪重负。

### 什么是 DNSSec？

DNS 安全扩展是为了使参与 DNS 查询的各级服务器之间的通信更加安全。它是由负责 DNS 系统的<ruby>互联网名称与数字地址分配机构<rt>Internet Corporation for Assigned Names and Numbers</rt></ruby>（ICANN）设计的。

ICANN 意识到 DNS 顶级、二级和三级目录服务器之间的通信存在弱点，可能会让攻击者劫持查询。这将允许攻击者用恶意网站的 IP 地址来响应合法网站的查询请求。这些网站可能会向用户上传恶意软件，或者进行网络钓鱼和网络欺骗攻击。

DNSSec 将通过让每一级 DNS 服务器对其请求进行数字签名来解决这个问题，这就保证了终端用户发送进来的请求不会被攻击者利用。这就建立了一个信任链，这样在查询的每一步，请求的完整性都会得到验证。

此外，DNSSec 可以确定域名是否存在，如果不存在，它就不会让该欺诈性域名交付给寻求域名解析的无辜请求者。

随着越来越多的域名被创建，越来越多的设备继续通过物联网设备和其他“智能”系统加入网络，随着[更多的网站迁移到 IPv6][14]，将需要维持一个健康的 DNS 生态系统。大数据和分析的增长也[带来了对 DNS 管理的更大需求][15]。

### SIGRed: 蠕虫病毒 DNS 漏洞再次出现

最近，随着 Windows DNS 服务器缺陷的发现，全世界都看到了 DNS 中的弱点可能造成的混乱。这个潜在的安全漏洞被称为 SIGRed，[它需要一个复杂的攻击链][16]，但利用未打补丁的 Windows DNS 服务器，有可能在客户端安装和执行任意恶意代码。而且该漏洞是“可蠕虫传播”的，这意味着它可以在没有人为干预的情况下从计算机传播到计算机。该漏洞被认为足够令人震惊，以至于美国联邦机构[被要求他们在几天时间内安装补丁][17]。

### DNS over HTTPS：新的隐私格局

截至本报告撰写之时，DNS 正处于其历史上最大的一次转变的边缘。谷歌和 Mozilla 共同控制着浏览器市场的大部分份额，他们正在鼓励向 [DNS over HTTPS][18]（DoH）的方向发展，在这种情况下，DNS 请求将被已经保护了大多数 Web 流量的 HTTPS 协议加密。在 Chrome 的实现中，浏览器会检查 DNS 服务器是否支持 DoH，如果不支持，则会将 DNS 请求重新路由到谷歌的 8.8.8.8。

这是一个并非没有争议的举动。早在上世纪 80 年代就在 DNS 协议上做了大量早期工作的 Paul Vixie 称此举对安全来说是“[灾难][19]”：例如，企业 IT 部门将更难监控或引导穿越其网络的 DoH 流量。不过，Chrome 浏览器是无所不在的，DoH 不久就会被默认打开，所以让我们拭目以待。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html

作者：[Keith Shaw][a], [Josh Fruhlinger][c]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Keith-Shaw/
[c]: https://www.networkworld.com/author/Josh-Fruhlinger/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.internethalloffame.org/blog/2012/07/23/why-does-net-still-work-christmas-paul-mockapetris
[3]: https://tools.ietf.org/html/rfc608
[4]: http://www.verisign.com/en_US/domain-names/dnib/index.xhtml?section=cc-tlds
[5]: http://www.google.com
[6]: https://browserleaks.com/ip
[7]: https://www.networkworld.com/article/2246426/comcast-redirects-bad-urls-to-pages-with-advertising.html
[8]: https://www.networkworld.com/article/3194890/comparing-the-performance-of-popular-public-dns-providers.html
[9]: https://blog.dnsimple.com/2015/03/why-and-how-to-use-googles-public-dns/
[10]: https://developers.google.com/speed/public-dns/docs/using
[11]: https://www.networkworld.com/article/2838356/network-security/dns-is-ubiquitous-and-its-easily-abused-to-halt-service-or-steal-data.html
[12]: https://www.networkworld.com/article/2277316/tech-primers/tech-primers-how-dns-cache-poisoning-works.html
[13]: https://www.cloudmark.com/releases/docs/whitepapers/dns-resource-exhaustion-v01.pdf
[14]: https://www.networkworld.com/article/3254575/lan-wan/what-is-ipv6-and-why-aren-t-we-there-yet.html
[15]: http://social.dnsmadeeasy.com/blog/opinion/future-big-data-dns-analytics/
[16]: https://www.csoonline.com/article/3567188/wormable-dns-flaw-endangers-all-windows-servers.html
[17]: https://federalnewsnetwork.com/cybersecurity/2020/07/cisa-gives-agencies-a-day-to-remedy-windows-dns-server-vulnerability/
[18]: https://www.networkworld.com/article/3322023/dns-over-https-seeks-to-make-internet-use-more-private.html
[19]: https://www.theregister.com/2018/10/23/paul_vixie_slaps_doh_as_dns_privacy_feature_becomes_a_standard/
[20]: https://www.facebook.com/NetworkWorld/
[21]: https://www.linkedin.com/company/network-world
