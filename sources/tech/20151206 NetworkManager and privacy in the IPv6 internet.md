Translating by itsang
NetworkManager and privacy in the IPv6 internet
======================

IPv6 is gaining momentum. With growing use of the protocol concerns about privacy that were not initially anticipated arise. The Internet community actively publishes solutions to them. What’s the current state and how does NetworkManager catch up? Let’s figure out!

![](https://blogs.gnome.org/lkundrak/files/2015/12/cameras1.jpg)

## The identity of a IPv6-connected host

The IPv6 enabled nodes don’t need a central authority similar to IPv4 [DHCP](https://tools.ietf.org/html/rfc2132) servers to configure their addresses. They discover the networks they are in and [complete the addresses themselves](https://tools.ietf.org/html/rfc4862) by generating the host part. This makes the network configuration simpler and scales better to larger networks. However, there’s some drawbacks to this approach. Firstly, the node needs to ensure that its address doesn’t collide with an address of any other node on the network. Secondly, if the node uses the same host part of the address in every network it enters then its movement can be tracked and the privacy is at risk.

Internet Engineering Task Force (IETF), the organization behind the Internet standards, [acknowledged this problem](https://tools.ietf.org/html/draft-iesg-serno-privacy-00) and recommends against use of hardware serial numbers to identify the node in the network.

But what does the actual implementation look like?

The problem of address uniqueness is addressed with [Duplicate Address Detection](https://tools.ietf.org/html/rfc4862#section-5.4) (DAD) mechanism. When a node creates an address for itself it first checks whether another node uses the same address using the [Neighbor Discovery Protocol](https://tools.ietf.org/html/rfc4861) (a mechanism not unlike IPv4 [ARP](https://tools.ietf.org/html/rfc826) protocol). When it discovers the address is already used, it must discard it.

The other problem (privacy) is a bit harder to solve. An IP address (be it IPv4 or IPv6) address consists of a network part and the host part. The host discovers the relevant network parts and is supposed generate the host part. Traditionally it just uses an Interface Identifier derived from the network hardware’s (MAC) address. The MAC address is set at manufacturing time and can uniquely identify the machine. This guarantees the address is stable and unique. That’s a good thing for address collision avoidance but a bad thing for privacy. The host part remaining constant in different network means that the machine can be uniquely identified as it enters different networks. This seemed like non-issue at the time the protocol was designed, but the privacy concerns arose as the IPv6 gained popularity. Fortunately, there’s a solution to this problem.

## Enter privacy extensions

It’s no secret that the biggest problem with IPv4 is that the addresses are scarce. This is no longer true with IPv6 and in fact an IPv6-enabled host can use addresses quite liberally. There’s absolutely nothing wrong with having multiple IPv6 addresses attached to the same interface. On the contrary, it’s a pretty standard situation. At the very minimum each node has an address that is used for contacting nodes on the same hardware link called a link-local address.  When the network contains a router that connects it to other networks in the internet, a node has an address for every network it’s directly connected to. If a host has more addresses in the same network the node accepts incoming traffic for all of them. For the outgoing connections which, of course, reveal the address to the remote host, the kernel picks the fittest one. But which one is it?

With privacy extensions enabled, as defined by [RFC4941](https://tools.ietf.org/html/rfc4941), a new address with a random host part is generated every now and then. The newest one is used for new outgoing connections while the older ones are deprecated when they’re unused. This is a nifty trick — the host does not reveal the stable address as it’s not used for outgoing connections, but still accepts connections to it from the hosts that are aware of it.

There’s a downside to this. Certain applications tie the address to the user identity. Consider a web application that issues a HTTP Cookie for the user during the authentication but only accepts it for the connections that come from the address that conducted the authentications. As the kernel generates a new temporary address, the server would reject the requests that use it, effectively logging the user out. It could be argued that the address is not an appropriate mechanism for establishing user’s identity but that’s what some real-world applications do.

## Privacy stable addressing to the rescue

Another approach would be needed to cope with this. There’s a need for an address that is unique (of course), stable for a particular network but still changes when user enters another network so that tracking is not possible. The RFC7217 introduces a mechanism that provides exactly this.

Creation of a privacy stable address relies on a pseudo-random key that’s only known the host itself and never revealed to other hosts in the network. This key is then hashed using a cryptographically secure algorithm along with values specific for a particular network connection. It includes an identifier of the network interface, the network prefix and possibly other values specific to the network such as the wireless SSID. The use of the secret key makes it impossible to predict the resulting address for the other hosts while the network-specific data causes it to be different when entering a different network.

This also solves the duplicate address problem nicely. The random key makes collisions unlikely. If, in spite of this, a collision occurs then the hash can be salted with a DAD failure counter and a different address can be generated instead of failing the network connectivity. Now that’s clever.

Using privacy stable address doesn’t interfere with the privacy extensions at all. You can use the [RFC7217](https://tools.ietf.org/html/rfc7217) stable address while still employing the RFC4941 temporary addresses at the same time.

## Where does NetworkManager stand?

We’ve already enabled the privacy extensions with the release NetworkManager 1.0.4. They’re turned on by default; you can control them with ipv6.ip6-privacy property.

With the release of NetworkManager 1.2, we’re adding the stable privacy addressing. It’s supposed to address the situations where the privacy extensions don’t make the cut. The use of the feature is controlled with the ipv6.addr-gen-mode property. If it’s set to stable-privacy then stable privacy addressing is used. Setting it to “eui64” or not setting it at all preserves the traditional default behavior.

Stay tuned for NetworkManager 1.2 release in early 2016! If you want to try the bleeding-edge snapshot, give Fedora Rawhide a try. It will eventually become Fedora 24.

*I’d like to thank Hannes Frederic Sowa for a valuable feedback. The article would make less sense without his corrections. Hannes also created the in-kernel implementation of the RFC7217 mechanism which can be used when the networking is not managed by NetworkManager.*

-------------------------------------------------------------------------------- 

via: https://blogs.gnome.org/lkundrak/2015/12/03/networkmanager-and-privacy-in-the-ipv6-internet/ 
作者：[Lubomir Rintel] 
译者：[译者ID](https://github.com/译者ID) 
校对：[校对者ID](https://github.com/校对者ID) 
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 
