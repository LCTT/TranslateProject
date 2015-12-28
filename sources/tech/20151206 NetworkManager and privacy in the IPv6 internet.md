Translating by itsang
NetworkManager and privacy in the IPv6 internet
IPv6因特网中的隐私保护和网络管理器

======================

IPv6 is gaining momentum. With growing use of the protocol concerns about privacy that were not initially anticipated arise. The Internet community actively publishes solutions to them. What’s the current state and how does NetworkManager catch up? Let’s figure out!
IPv6的使用量正在不断增加，让我们始料未及的是，伴随这个协议不断增加的使用量，大量隐私问题涌现出来。互联网社区在积极发表相关解决方案，当前状况是怎样的呢？网络管理器又是如何跟上的呢？让我们来瞧瞧吧！


![](https://blogs.gnome.org/lkundrak/files/2015/12/cameras1.jpg)

## The identity of a IPv6-connected host 通过IPv6方式连接的主机的特性

The IPv6 enabled nodes don’t need a central authority similar to IPv4 [DHCP](https://tools.ietf.org/html/rfc2132) servers to configure their addresses. They discover the networks they are in and [complete the addresses themselves](https://tools.ietf.org/html/rfc4862) by generating the host part. This makes the network configuration simpler and scales better to larger networks. However, there’s some drawbacks to this approach. Firstly, the node needs to ensure that its address doesn’t collide with an address of any other node on the network. Secondly, if the node uses the same host part of the address in every network it enters then its movement can be tracked and the privacy is at risk.
通过IPv6方式激活的结点（译者注：结点在网络中指一个联网的设备）不需要类似IPv4网络中[DHCP](https://tools.ietf.org/html/rfc2132)服务器的中央机构来配置他们的地址。它们发现自己所在的网络然后通过生成主机部分来[自主生成地址](https://tools.ietf.org/html/rfc2132)。这种方式使得网络配置更加简单，并且能够更好的扩展到更大规模的网络。然而，这种方式也有一些缺点。首先，这个结点需要确保它的地址不会和网络上其他结点冲突。其次，如果这个结点在进入的每一个网络中使用相同的主机部分，它的运动就可以被追踪，如此一来，隐私便处于危险之中。

Internet Engineering Task Force (IETF), the organization behind the Internet standards, [acknowledged this problem](https://tools.ietf.org/html/draft-iesg-serno-privacy-00) and recommends against use of hardware serial numbers to identify the node in the network.
负责制定因特网标准的组织Internet工程任务组（Internet Engineering Task Force，IETF）[意识到了这个问题](https://tools.ietf.org/html/draft-iesg-serno-privacy-00)，这个组织建议取消使用硬件序列号来识别网络上的结点。

But what does the actual implementation look like?
但实际的实施情况是怎样的呢？

The problem of address uniqueness is addressed with [Duplicate Address Detection](https://tools.ietf.org/html/rfc4862#section-5.4) (DAD) mechanism. When a node creates an address for itself it first checks whether another node uses the same address using the [Neighbor Discovery Protocol](https://tools.ietf.org/html/rfc4861) (a mechanism not unlike IPv4 [ARP](https://tools.ietf.org/html/rfc826) protocol). When it discovers the address is already used, it must discard it.
地址唯一性问题可以通过[重复地址检测(Duplicate Address Detection, DAD)](https://tools.ietf.org/html/rfc4862#section-5.4)机制来解决。当结点为自身创建地址的时候，他首先通过[邻居发现协议（Neighbor Discovery Protocol）](https://tools.ietf.org/html/rfc4861)（一种不同于IPv4 [ARP](https://tools.ietf.org/html/rfc826)协议的机制）来检查另一个结点是否使用了相同的地址。当它发现地址已经被使用，它必须抛弃掉这个地址。

The other problem (privacy) is a bit harder to solve. An IP address (be it IPv4 or IPv6) address consists of a network part and the host part. The host discovers the relevant network parts and is supposed generate the host part. Traditionally it just uses an Interface Identifier derived from the network hardware’s (MAC) address. The MAC address is set at manufacturing time and can uniquely identify the machine. This guarantees the address is stable and unique. That’s a good thing for address collision avoidance but a bad thing for privacy. The host part remaining constant in different network means that the machine can be uniquely identified as it enters different networks. This seemed like non-issue at the time the protocol was designed, but the privacy concerns arose as the IPv6 gained popularity. Fortunately, there’s a solution to this problem.
解决另一个问题——隐私问题，有一点困难。一个IP地址（无论IPv4或IPv6）由网络部分和主机部分组成（译者注：网络部分用来划分子网，主机部分用来从相应子网中找到具体的主机）。主机查找出相关的网络部分，并且生成主机部分。传统上它只使用了源自网络硬件（MAC）地址的接口识别器。MAC地址在硬件制造的时候就被设置好了，它可以唯一的识别机器。这样就确保了地址的稳定性和唯一性。这对避免地址冲突来说是件好事，但是对隐私来说一点也不好。主机部分在不同网络下保持恒定意味着机器在进入不同网络时可以被唯一的识别。这在协议制定的时候看起来无可非议，但是随着IPv6的流行，人们对于隐私问题的担忧也愈演愈烈。幸运的是，解决办法还是有的。

## Enter privacy extensions 进入隐私扩展

It’s no secret that the biggest problem with IPv4 is that the addresses are scarce. This is no longer true with IPv6 and in fact an IPv6-enabled host can use addresses quite liberally. There’s absolutely nothing wrong with having multiple IPv6 addresses attached to the same interface. On the contrary, it’s a pretty standard situation. At the very minimum each node has an address that is used for contacting nodes on the same hardware link called a link-local address.  When the network contains a router that connects it to other networks in the internet, a node has an address for every network it’s directly connected to. If a host has more addresses in the same network the node accepts incoming traffic for all of them. For the outgoing connections which, of course, reveal the address to the remote host, the kernel picks the fittest one. But which one is it?
Pv4的最大问题——地址枯竭，已经不是什么秘密。对IPv6来说，这一点不再成立，事实上，使用IPv6的主机能够相当大方的利用地址。多个IPv6地址对应一块网卡绝对没有任何错误，正好相反，这是一种标准情形。最起码每个结点都有一个“本地连接地址”，它被用来与同一物理链路的结点联络。当网络包含了一个连接其他网络的路由器，这个网络中的每一个结点都有一个与每个直接连接网络联络的地址。如果主机在相同网络有更多的地址，结点（译者注：指路由器）将接受它们全部的传入流量。对于输出连接，它会把地址显示给远程主机，内核会挑选最适合的地址。但到底是哪一个呢？

With privacy extensions enabled, as defined by [RFC4941](https://tools.ietf.org/html/rfc4941), a new address with a random host part is generated every now and then. The newest one is used for new outgoing connections while the older ones are deprecated when they’re unused. This is a nifty trick — the host does not reveal the stable address as it’s not used for outgoing connections, but still accepts connections to it from the hosts that are aware of it.
隐私扩展可用时，就像[RFC4941](https://tools.ietf.org/html/rfc4941)定义的那样，时常会生成带有随机主机部分的新地址。最新的那个被用于最新的输出连接，与此同时，那些不被使用了的旧地址将被丢弃。这是一个极好的窍略——当固定地址不用于输出连接的时候，主机就不会显示它，但它仍然会接受注意到它的主机的连接。

There’s a downside to this. Certain applications tie the address to the user identity. Consider a web application that issues a HTTP Cookie for the user during the authentication but only accepts it for the connections that come from the address that conducted the authentications. As the kernel generates a new temporary address, the server would reject the requests that use it, effectively logging the user out. It could be argued that the address is not an appropriate mechanism for establishing user’s identity but that’s what some real-world applications do.
但这也存在美中不足之处——某些应用会把地址与用户识别绑定在一起。让我们来考虑一下这种情形，一个web应用在用户认证的时候生成一个HTTP Cookie，但它只接受实施认证的地址的连接。当内核生成了一个新的临时地址，服务器会拒绝使用这个地址的请求，实际上相当于将用户登出。地址是不是建立用户认证的合适机制值得商榷，但这确实是现实中应用程序正在做的。

## Privacy stable addressing to the rescue 解救之道——隐私固定寻址

Another approach would be needed to cope with this. There’s a need for an address that is unique (of course), stable for a particular network but still changes when user enters another network so that tracking is not possible. The RFC7217 introduces a mechanism that provides exactly this.
解决这个问题可能需要另辟蹊径。唯一的（当然咯）地址确实有必要，对于特定网络来说是稳定的，但当用户进入了另一个网络后仍然会变，这样的话追踪就变得几乎不可能。RFC7217介绍了一种如上所述的机制。

Creation of a privacy stable address relies on a pseudo-random key that’s only known the host itself and never revealed to other hosts in the network. This key is then hashed using a cryptographically secure algorithm along with values specific for a particular network connection. It includes an identifier of the network interface, the network prefix and possibly other values specific to the network such as the wireless SSID. The use of the secret key makes it impossible to predict the resulting address for the other hosts while the network-specific data causes it to be different when entering a different network.
创建隐私固定地址依赖于伪随机值，这个随机值只被主机本身知晓，它不会显示给网络上的其他主机。这个随机值随后被一个密码安全算法加密，一起被加密的还有一些与网络连接的特殊值。这些值包含：用以标识网卡的标识符；网络前缀；对于这个网络来说有可能的其他特殊值，例如无线的SSID。使用安全值使其他主机很难预测结果地址，与此同时，当进入不同的网络时，网络的特殊数据会让地址变得不同。

This also solves the duplicate address problem nicely. The random key makes collisions unlikely. If, in spite of this, a collision occurs then the hash can be salted with a DAD failure counter and a different address can be generated instead of failing the network connectivity. Now that’s clever.
这也巧妙的解决了地址重复问题。因为有随机值的存在，冲突也不太可能发生。万一发生了冲突，结果地址会得到重复地址检测失败的记录，这时会生成一个不同的地址而不会断开网络连接。看，这种方式很聪明吧。

Using privacy stable address doesn’t interfere with the privacy extensions at all. You can use the [RFC7217](https://tools.ietf.org/html/rfc7217) stable address while still employing the RFC4941 temporary addresses at the same time.
使用隐私固定地址一点儿也不会妨碍隐私扩展。你可以在使用RFC4941所描述的临时地址的同时使用[RFC7217](https://tools.ietf.org/html/rfc7217)中的固定地址。

## Where does NetworkManager stand? 网络管理器处于什么样的状况？

We’ve already enabled the privacy extensions with the release NetworkManager 1.0.4. They’re turned on by default; you can control them with ipv6.ip6-privacy property.
我们已经在网络管理器1.0.4版本中实现了隐私扩展。在这个版本中，隐私扩展默认开启。你可以用ipv6.ip6-privacy参数来控制它。

With the release of NetworkManager 1.2, we’re adding the stable privacy addressing. It’s supposed to address the situations where the privacy extensions don’t make the cut. The use of the feature is controlled with the ipv6.addr-gen-mode property. If it’s set to stable-privacy then stable privacy addressing is used. Setting it to “eui64” or not setting it at all preserves the traditional default behavior.
在网络管理器1.2版本中，我们将会加入固定隐私寻址。应该指出的是，目前的隐私扩展还不符合这种需求。我们可以使用ipv6.addr-gen-mode参数来控制这个特性。如果它被设置成固定隐私，那么将会使用固定隐私寻址。设置成“eui64”或者干脆不设置它将会保持传统的默认寻址方式。

Stay tuned for NetworkManager 1.2 release in early 2016! If you want to try the bleeding-edge snapshot, give Fedora Rawhide a try. It will eventually become Fedora 24.
敬请期待明年，也就是2016年年初网络管理器1.2版本的发布吧！如果你想尝试一下最新的版本，不妨试试Fedora Rawhide，它最终会变成Fedora24。

*I’d like to thank Hannes Frederic Sowa for a valuable feedback. The article would make less sense without his corrections. Hannes also created the in-kernel implementation of the RFC7217 mechanism which can be used when the networking is not managed by NetworkManager.*
*我想感谢Hannes Frederic Sowa，他给了我很有价值的反馈。如果没有他的帮助，这篇文章的作用将会逊色很多。另外，Hannes也是RFC7217所描述机制的内核实现者，当网络管理器不起作用的时候，它将发挥作用。*

-------------------------------------------------------------------------------- 

via: https://blogs.gnome.org/lkundrak/2015/12/03/networkmanager-and-privacy-in-the-ipv6-internet/ 
作者：[Lubomir Rintel] 
译者：[itsang](https://github.com/itsang) 
校对：[校对者ID](https://github.com/校对者ID) 
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 
