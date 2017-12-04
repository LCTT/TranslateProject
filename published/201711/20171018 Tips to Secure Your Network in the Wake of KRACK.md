由 KRACK 攻击想到的确保网络安全的小贴士
============================================================

![KRACK](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/krack-security.jpg?itok=_gKsJm7N "KRACK")

> 最近的 KRACK （密钥重装攻击，这是一个安全漏洞名称或该漏洞利用攻击行为的名称）漏洞攻击的目标是位于你的设备和 Wi-Fi 访问点之间的链路，这个访问点或许是在你家里、办公室中、或你喜欢的咖啡吧中的任何一台路由器。这些提示能帮你提升你的连接的安全性。

[KRACK 漏洞攻击][4] 出现已经一段时间了，并且已经在 [相关技术网站][5] 上有很多详细的讨论，因此，我将不在这里重复攻击的技术细节。攻击方式的总结如下：

*   在 WPA2 无线握手协议中的一个缺陷允许攻击者在你的设备和 wi-fi 访问点之间嗅探或操纵通讯。
*   这个问题在 Linux 和 Android 设备上尤其严重，由于在 WPA2 标准中的措辞含糊不清，也或许是在实现它时的错误理解，事实上，在底层的操作系统打完补丁以前，该漏洞一直可以强制无线流量以无加密方式通讯。
*   还好这个漏洞可以在客户端上修补，因此，天并没有塌下来，而且，WPA2 加密标准并没有像 WEP 标准那样被淘汰（不要通过切换到 WEP 加密的方式去“修复”这个问题）。
*   大多数流行的 Linux 发行版都已经通过升级修复了这个客户端上的漏洞，因此，老老实实地去更新它吧。
*   Android 也很快修复了这个漏洞。如果你的设备在接收 Android 安全补丁，你会很快修复这个漏洞。如果你的设备不再接收这些更新，那么，这个特别的漏洞将是你停止使用你的旧设备的一个理由。

即使如此，从我的观点来看， Wi-Fi 是不可信任的基础设施链中的另一个环节，并且，我们应该完全避免将其视为可信任的通信通道。

### Wi-Fi 是不受信任的基础设备

如果从你的笔记本电脑或移动设备中读到这篇文章，那么，你的通信链路看起来应该是这样：

 ![Blank Network Diagram - Basics.png](https://lh4.googleusercontent.com/ihouLL-yQ-ZZCKpp3MvLH6-iWC3cMlxNqN6YySOqa6cIR9ShSHIwjR04KAXnkU9TO7vMZ27QEz1QjA0j0MrECcEZSpJoA4uURwHZjec4TSQpgd7-982isvpx89C73N9wt1cEzq9l) 

KRACK 攻击目标是在你的设备和 Wi-Fi 访问点之间的链接，访问点或许是在你家里、办公室中、或你喜欢的咖啡吧中的任何一台路由器。

 ![Blank Network Diagram - Where Kracks happen (1).png](https://lh3.googleusercontent.com/xvW0IhutTplAB3VHO00lSMLcJNK31DfjTCxEB8_0PkcenM9P46y0K-w8WZjVWQapj2pU9a8mRmG57sVhwv8kVn6lghoTnv8qkz8FRbo2VBCk_gK8M2ipi20di1qDTdj_dPGyRqWi) 

实际上，这个图示应该看起来像这样：

 ![Blank Network Diagram - Everywhere (1).png](https://lh4.googleusercontent.com/e4InTHN5ql28nw21NM8cz3HwO1VMZN4-itSArWqH2_6m492ZZKu851uD4pn0Ms3kfHEc2Rst1_c8ENIsoFJ-mEkhFjMH7zUbg9r0t0la78cPnLls_iaVeBwmf5vjS9XWpUIgHScS) 

Wi-Fi 仅仅是在我们所不应该信任的信道上的长长的通信链的第一个链路。让我来猜猜，你使用的 Wi-Fi 路由器或许从开始使用的第一天气就没有得到过一个安全更新，并且，更糟糕的是，它或许使用了一个从未被更改过的、缺省的、易猜出的管理凭据（用户名和密码）。除非你自己安装并配置你的路由器，并且你能记得你上次更新的它的固件的时间，否则，你应该假设现在它已经被一些人控制并不能信任的。

在 Wi-Fi 路由器之后，我们的通讯进入一般意义上的常见不信任区域 —— 这要根据你的猜疑水平。这里有上游的 ISP 和接入提供商，其中的很多已经被指认监视、更改、分析和销售我们的流量数据，试图从我们的浏览习惯中挣更多的钱。通常他们的安全补丁计划辜负了我们的期望，最终让我们的流量暴露在一些恶意者眼中。

一般来说，在互联网上，我们还必须担心强大的国家级的参与者能够操纵核心网络协议，以执行大规模的网络监视和状态级的流量过滤。

### HTTPS 协议

值的庆幸的是，我们有一个基于不信任的介质进行安全通讯的解决方案，并且，我们可以每天都能使用它 —— 这就是 HTTPS 协议，它加密你的点对点的互联网通讯，并且确保我们可以信任站点与我们之间的通讯。

Linux 基金会的一些措施，比如像 [Let’s Encrypt][7] 使世界各地的网站所有者都可以很容易地提供端到端的加密，这有助于确保我们的个人设备与我们试图访问的网站之间的任何有安全隐患的设备不再是个问题。

 ![Blank Network Diagram - HTTPS (1).png](https://lh6.googleusercontent.com/aFzS-eiJCJpTTQD967NzKZOfFcS0rQ8rTW4L_aiKQ3Q3pTkkeqGjBBAdYASw38VMxKLbNOwbKpGOT9CGzI1XVmyzeiuGqI9YSdkBjBwwJZ0Ee2k8EZonl43HeAv4o6hk2YKonbtW) 

是的... 基本没关系。

### DNS —— 剩下的一个问题

虽然，我们可以尽量使用 HTTPS 去创建一个可信的通信信道，但是，这里仍然有一个攻击者可以访问我们的路由器或修改我们的 Wi-Fi 流量的机会 —— 在使用 KRACK 的这个案例中 —— 可以欺骗我们的通讯进入一个错误的网站。他们可以利用我们仍然非常依赖 DNS 的这一事实 —— 这是一个未加密的、易受欺骗的 [诞生自上世纪 80 年代的协议][8]。

 ![Blank Network Diagram - LOL DNS.png](https://lh4.googleusercontent.com/EZfhN4crHvLX2cn3wbukh9z7aYsaB073jHMqI5IbOHba4VPhsc2GHMud75D9B_T6K2-ry6zXu_54jDa16gc0G3OC-RP7crchc0ltNGZPhoHpTsc_T6T0XXtMofUYw_iqlW5bG_0g) 

DNS 是一个将像 “linux.com” 这样人类友好的域名，转换成计算机可以用于和其它计算机通讯的 IP 地址的一个系统。要转换一个域名到一个 IP 地址，计算机将会查询解析器软件 —— 它通常运行在 Wi-Fi 路由器或一个系统上。解析器软件将查询一个分布式的“根”域名服务器网络，去找到在互联网上哪个系统有 “linux.com” 域名所对应的 IP 地址的“权威”信息。

麻烦就在于，所有发生的这些通讯都是未经认证的、[易于欺骗的][9]、明文协议、并且响应可以很容易地被攻击者修改，去返回一个不正确的数据。如果有人去欺骗一个 DNS 查询并且返回错误的 IP 地址，他们可以操纵我们的系统最终发送 HTTP 请求到那里。

幸运的是，HTTPS 有一些内置的保护措施去确保它不会很容易地被其它人诱导至其它假冒站点。恶意服务器上的 TLS 凭据必须与你请求的 DNS 名字匹配 —— 并且它必须由一个你的浏览器认可的信誉良好的 [认证机构（CA）][10] 所签发。如果不是这种情况，你的浏览器将在你试图去与他们告诉你的地址进行通讯时出现一个很大的警告。如果你看到这样的警告，在选择不理会警告之前，请你格外小心，因为，它有可能会把你的秘密泄露给那些可能会对付你的人。

如果攻击者完全控制了路由器，他们可以在一开始时，通过拦截来自服务器指示你建立一个安全连接的响应，以阻止你使用 HTTPS 连接（这被称为 “[SSL 脱衣攻击][11]”）。 为了帮助你防护这种类型的攻击，网站可以增加一个 [特殊响应头（HSTS）][12] 去告诉你的浏览器以后与它通讯时总是使用 HTTPS 协议，但是，这仅仅是在你首次访问之后的事。对于一些非常流行的站点，浏览器现在包含一个 [硬编码的域名列表][13]，即使是首次连接，它也将总是使用 HTTPS 协议访问。

现在已经有了 DNS 欺骗的解决方案，它被称为 [DNSSEC][14]，由于有重大的障碍 —— 真实和可感知的（LCTT 译注，指的是要求实名认证），它看起来接受程度很慢。在 DNSSEC 被普遍使用之前，我们必须假设，我们接收到的 DNS 信息是不能完全信任的。

### 使用 VPN 去解决“最后一公里”的安全问题

因此，如果你不能信任固件太旧的 Wi-Fi 和/或无线路由器，我们能做些什么来确保发生在你的设备与常说的互联网之间的“最后一公里”通讯的完整性呢？

一个可接受的解决方案是去使用信誉好的 VPN 供应商的服务，它将在你的系统和他们的基础设施之间建立一条安全的通讯链路。这里有一个期望，就是它比你的路由器提供者和你的当前互联网供应商更注重安全，因为，他们处于一个更好的位置去确保你的流量不会受到恶意的攻击或欺骗。在你的工作站和移动设备之间使用 VPN，可以确保免受像 KRACK 这样的漏洞攻击，不安全的路由器不会影响你与外界通讯的完整性。

 ![Blank Network Diagram - VPN.png](https://lh4.googleusercontent.com/vdulGCwUB239d76QXgtV3AcC0fG0YEi_LWCzOAYAEhFlEExtXXSOyXB-aq4PAI652egsUcgAXNi1KfUNWnUewWBlHkyRHSBDb5jWpD11MrSsfjbkTRZGTVhRv6wOszNdTQ12TKG8) 

这有一个很重要的警告是，当你选择一个 VPN 供应商时，你必须确信他们的信用；否则，你将被一拨恶意的人出卖给其它人。远离任何人提供的所谓“免费 VPN”，因为，它们可以通过监视你和向市场营销公司销售你的流量来赚钱。 [这个网站][2] 是一个很好的资源，你可以去比较他们提供的各种 VPN，去看他们是怎么互相竞争的。

注意，你所有的设备都应该在它上面安装 VPN，那些你每天使用的网站，你的私人信息，尤其是任何与你的钱和你的身份（政府、银行网站、社交网络、等等）有关的东西都必须得到保护。VPN 并不是对付所有网络级漏洞的万能药，但是，当你在机场使用无法保证的 Wi-Fi 时，或者下次发现类似 KRACK 的漏洞时，它肯定会保护你。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2017/10/tips-secure-your-network-wake-krack

作者：[KONSTANTIN RYABITSEV][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.vpnmentor.com/bestvpns/overall/
[3]:https://www.linux.com/files/images/krack-securityjpg
[4]:https://www.krackattacks.com/
[5]:https://blog.cryptographyengineering.com/2017/10/16/falling-through-the-kracks/
[6]:https://en.wikipedia.org/wiki/BGP_hijacking
[7]:https://letsencrypt.org/
[8]:https://en.wikipedia.org/wiki/Domain_Name_System#History
[9]:https://en.wikipedia.org/wiki/DNS_spoofing
[10]:https://en.wikipedia.org/wiki/Certificate_authority
[11]:https://en.wikipedia.org/wiki/Moxie_Marlinspike#Notable_research
[12]:https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security
[13]:https://hstspreload.org/
[14]:https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions
