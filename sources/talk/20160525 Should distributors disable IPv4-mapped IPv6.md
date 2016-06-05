Should distributors disable IPv4-mapped IPv6?
=============================================

By all accounts, the Internet's transition to IPv6 has been a slow affair. In recent years, though, perhaps inspired by the exhaustion of the IPv4 address space, IPv6 usage has been [on the rise][1]. There is a corresponding interest in ensuring that applications work with both IPv4 and IPv6. But, as a recent discussion on the OpenBSD mailing list has highlighted, a mechanism designed to ease the transition to an IPv6 network may also make the net less secure — and Linux distributions may be configured insecurely by default.

### Address mapping

IPv6 may look like IPv4 in many ways, but it is a different protocol with a different address space. Server programs wanting to receive connections using either protocol must thus open separate sockets for the two different address families — AF_INET for IPv4, and AF_INET6 for IPv6. In particular, a program wishing to accept connections to any of a host's interfaces using either protocol will need to create an AF_INET socket bound to the all-zeroes wild-card address (0.0.0.0) and an AF_INET6 socket bound to the IPv6 equivalent (written as "::"). It must then listen for connections on both sockets — or so one would think.

Many years ago, in [RFC 3493][2], the IETF specified a mechanism by which a program could work with either protocol using a single IPv6 socket. With a socket enabled for this behavior, the program need only bind to :: to receive connections to all interfaces with both protocols. When an IPv4 connection is made to the bound port, the source address will be mapped into IPv6 as described in [RFC 2373][3]. So, for example, a program using this mode would see an incoming connection from 192.168.1.1 as originating from ::ffff:192.168.1.1 (the mixed notation is how such addresses are ordinarily written). The program can also open connections to IPv4 addresses by mapping them in the same manner.

The RFC calls for this behavior to be implemented by default, so most systems do so. There are exceptions, though, one of which is OpenBSD; there, programs wishing to work with both protocols can only do so by creating two independent sockets. A program that opens two sockets on Linux, though, will run into trouble: both the IPv4 and the IPv6 socket will try to bind to the IPv4 address(es), so whichever attempt comes second will fail. In other words, a program that binds a socket to a given port on :: will be bound to that port on both the IPv6 :: and the IPv4 0.0.0.0. If it then tries to bind an IPv4 socket to the same port on 0.0.0.0, the operation will fail as the port is already bound.

There is a way around that problem, of course; the program can call setsockopt() to turn on the IPV6_V6ONLY option. A program that opens two sockets and sets IPV6_V6ONLY should be portable across all systems.

Readers may be less than thoroughly shocked to learn that not every program out there gets all of this right. One of those, it turns out, is the [OpenNTPD][4] implementation of the Network Time Protocol. Brent Cook recently [proposed a small patch][5] adding the requisite setsockopt() call to the upstream OpenNTPD source, which lives within OpenBSD itself. That patch does not look likely to be accepted, though, for the most OpenBSD-like of reasons.

### Security concerns

As mentioned above, OpenBSD does not support IPv4-mapped IPv6 sockets at all. Even if a program tries to explicitly enable address mapping by setting the IPV6_V6ONLY option to zero, its author will be disappointed; that setting has no effect on OpenBSD systems. The reasoning behind this decision is that this mapping brings some security concerns with it. There are various types of attack surface that it opens up, but it all comes down to the provision of two different ways to reach the same port, each with its own access-control rules.

Any given server system may have set up firewall rules describing the allowed access to the port in question. There may also be mechanisms like TCP wrappers or a BPF-based filter in place, or a router on the net could be doing its own stateful connection filtering. The result is likely to be gaps in firewall protection and the potential for all kinds of confusion resulting from the same IPv4 address being reachable via two different protocols. If the address mapping is done at the edge of the network, the situation gets even more complex; see [this draft RFC from 2003][6] for a description of some other attack scenarios that come about if mapped addresses are transmitted between hosts.

Adapting systems and software to properly handle IPv4-mapped IPv6 addresses can certainly be done. But that adds to the overall complexity of the system, and it's a sure bet that this adaptation has not actually been done anywhere near as widely as it should be. As Theo de Raadt [put it][7]:

  **Sometimes people put a bad idea into an RFC. Later they discover it is impossible to walk the idea back to the garbagebin. The result is concepts so complicated that everyone has to be a fulltime expert, on admin side and coder side**.

It is not at all clear how many of these full-time experts are actually out there configuring systems and networks where IPv4-mapped IPv6 addresses are in use.

One might well argue that, while IPv4-mapped IPv6 addresses create security hazards, there should be no harm in changing a program so that it turns off address mapping on systems that implement it. But Theo argues that this should not be done, for a couple of reasons. The first is that there are many broken programs out there, and it will never be possible to fix them all. But the real reason is to put pressure on distributors to turn off address mapping by default. As he put it: "**Eventually someone will understand the damage is systematic, and change the system defaults to 'secure by default'**."

### Address mapping on Linux

On Linux systems, address mapping is controlled by a sysctl knob called net.ipv6.bindv6only; it is set to zero (enabling address mapping) by default. Administrators (or distributors) can turn off mapping by setting this knob to one, but they would be well advised to be sure that their applications all work properly before deploying such a system in production. A quick survey suggests that none of the primary distributors change the default for this knob; Debian [changed the default][9] for the "squeeze" release in 2009, but the change broke enough packages ([anything involving Java][10], for example) that it was, [after a certain amount of Debian-style discussion][11], reverted. It would appear that quite a few programs rely on address mapping being enabled by default.

OpenBSD has the freedom to break things outside of its core system in the name of "secure by default"; Linux distributors tend to have a harder time getting away with such changes. So those distributors, being generally averse to receiving abuse from their users, are unlikely to change the default of the bindv6only knob anytime soon. The good news is that this functionality has been the default for years and stories of exploits are hard to find. But, as we all know, that provides no guarantees that exploits are not possible.


--------------------------------------------------------------------------------

via: https://lwn.net/Articles/688462/

作者：[Jonathan Corbet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://lwn.net/
[1]: https://www.google.com/intl/en/ipv6/statistics.html
[2]: https://tools.ietf.org/html/rfc3493#section-3.7
[3]: https://tools.ietf.org/html/rfc2373#page-10
[4]: https://github.com/openntpd-portable/
[5]: https://lwn.net/Articles/688464/
[6]: https://tools.ietf.org/html/draft-itojun-v6ops-v4mapped-harmful-02
[7]: https://lwn.net/Articles/688465/
[8]: https://lwn.net/Articles/688466/
[9]: https://lists.debian.org/debian-devel/2009/10/msg00541.html
[10]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=560056
[11]: https://lists.debian.org/debian-devel/2010/04/msg00099.html
