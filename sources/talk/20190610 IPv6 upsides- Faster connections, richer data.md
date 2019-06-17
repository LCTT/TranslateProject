[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IPv6 upsides: Faster connections, richer data)
[#]: via: (https://www.networkworld.com/article/3401521/ipv6-upsides-faster-connections-richer-data.html)
[#]: author: (Scott Hogg )

IPv6 upsides: Faster connections, richer data
======

The business advantages of [IPv6][1] are many, including direct customer access to websites, faster end-user experiences with Internet applications, and the opportunity to gather data about visitors to applications as well as measure visitors’ engagement and conversion.

### Faster with IPv6

If your organization offers a public website or internet or mobile applications, then it is likely that your site will function faster when using IPv6 vs IPv4. That’s in part because of the proliferation network-address translation (NAT) by service providers for IPv4 Internet connectivity.

Carriers [lack sufficient public IPv4 addresses][2] to provide unique addresses to all of their subscribers so they channel them through a massive NAT using a pool of public IPv4 addresses. IPv4 traffic that hits carrier networks typically goes through one or more NATs and is backhauled through centralized carrier-grade or large-scale NATs where customer connections compete for TCP/UDP port space, connection limits, and bandwidth. All this NATing requires recomputing TCP and UDP header checksums which introduces delays in the delivery of packets.

By contrast, most mobile and broadband subscribers now have [native IPv6][3] on their devices. The IPv6 packets don’t pass through carrier NAT systems and instead go directly to the Internet. The lack of NAT usage by IPv6 means that TCP and UDP header checksums do not need to be re-computed like with IPv4.

Even though IPv6 packets have a larger header size and extension headers (more protocol overhead) they are hardware-accelerated just like IPv4. And for systems that support both IPv4 and IPv6, [the Happy Eyeballs algorithm][4] helps decide which protocol is working faster and selects it, helping to improve end-user experience.

[Facebook][5], [LinkedIn][6], [Google][7] and others have published statistics showing that IPv6 is faster from their perspective.

To continue reading this article register now

[Get Free Access][8]

[Learn More][9] Existing Users [Sign In][8]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3401521/ipv6-upsides-faster-connections-richer-data.html

作者：[Scott Hogg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html
[2]: https://www.networkworld.com/article/3235384/ipv6-address-enterprises-how-to-easier-than-ipv4.html
[3]: https://www.networkworld.com/article/2228420/cisco-subnet-when-it-comes-to-ipv6-go-native.html
[4]: https://tools.ietf.org/html/rfc8305
[5]: http://www.internetsociety.org/deploy360/blog/2015/04/facebook-news-feeds-load-20-40-faster-over-ipv6/
[6]: https://www.linkedin.com/pulse/ipv6-measurements-zaid-ali-kahn/
[7]: http://static.googleusercontent.com/media/research.google.com/en/pubs/archive/36240.pdf
[8]: javascript://
[9]: /learn-about-insider/
