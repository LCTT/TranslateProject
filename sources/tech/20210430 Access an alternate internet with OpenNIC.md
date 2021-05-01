[#]: subject: (Access an alternate internet with OpenNIC)
[#]: via: (https://opensource.com/article/21/4/opennic-internet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Access an alternate internet with OpenNIC
======
Take a detour on the super information highway.
![An intersection of pipes.][1]

In the words of Dan Kaminsky, the legendary DNS hacker, "the Internet's proven to be a pretty big deal for global society." For the Internet to work, computers must be able to find one another on the most complex network of all: the World Wide Web. This was the problem posed to government workers and academic IT staff a few decades ago, and it's their solutions that we use today. They weren't, however, actually seeking to build _the Internet_, they were defining specifications for _internets_ (actually for _catenets_, or "concatenated networks", but the term that eventually fell out of vogue), a generic term for _interconnected networks_.

According to these specifications, a network uses a combination of numbers that serve as a sort of home address for each online computer and assigns a human-friendly but highly structured "hostname" (such as `example.com`) to each website. Because users primarily interact with the internet through website _names_, it can be said that the internet works only because we've all agreed to a standardized naming scheme. The Internet _could_ work differently, should enough people decide to use a different naming scheme. A group of users could form a parallel internet, one that exists using the same physical infrastructure (the cables and satellites and other modes of transport that get data from one place to another) but uses a different means of correlating hostnames with numbered addresses.

In fact, this already exists, and this article shows how you can access it.

### Understand name servers

The term "internet" is actually a portmanteau of the terms _interconnected_ and _networks_ because that's exactly what it is. Like neighborhoods in a city, or cities in a country, or countries on a continent, or continents on a planet, the internet spans the globe by transmitting data from one home or office network to data centers and server rooms or other home or office networks. It's a gargantuan task—but it's not without precedent. After all, phone companies long ago connected the world, and before that, telegraph and postal services did the same.

In a phone or mail system, there's a list, whether it's formal or informal, that relates human names to physical addresses. This used to be delivered to houses in the form of telephone books, a directory of every phone owner in that phone book's community. Post offices operate differently: they usually rely on the person sending the letter to know the name and address of the intended recipient, but postcodes and city names are used to route the letter to the correct post office. Either way, the need for a standard organizational scheme is necessary.

For computers, the [IP protocol][2] describes how addresses on the internet must be formatted. The domain name server [(DNS) protocol][3] describes how human-friendly names may be assigned to and resolved from IP addresses. Whether you're using IPv4 or IPv6, the idea is the same: When a node (which could be a computer or a gateway leading to another network) joins a network, it is assigned an IP address.

If you wish, you may register a domain name with [ICANN][4] (a non-profit organization that helps coordinate website names on the internet) and register the name as a pointer to an IP address. There is no requirement that you "own" the IP address. Anyone can point any domain name to any IP address. The only restrictions are that only one person can own a specific domain name at a time, and the domain name must follow the recognized DNS naming scheme.

Records of a domain name and its associated IP address are entered into a DNS. When you navigate to a website in your browser, it quickly consults the DNS network to find what IP address is associated with whatever URL you've entered (or clicked on from a search engine).

### A different DNS

To avoid arguments over who owns which domain name, most domain name registrars charge a fee for domain registration. The fee is usually nominal, and sometimes it's even $0 (for instance, `freenom.com` offers gratis `.tk`, `.ml`, `.gq`, and `.cf` domains on a first-come, first-served basis).

For a very long time, there were only a few "top-level" domains, including `.org`, `.edu`, and `.com`. Now there are a lot more, including `.club`, `.biz`, `.name`, `.international`, and so on. Letter combinations being what they are, however, there are lots of potential top-level domains that aren't valid, such as `.null`. If you try to navigate to a website ending in `.null`, then you won't get very far. It's not available for registration, it's not a valid entry for a domain name server, and it just doesn't exist.

The [OpenNIC Project][5] has established an alternate DNS network to resolve domain names to IP addresses, but it includes names not currently used by the internet. Available top-level domains include:

  * .geek
  * .indy
  * .bbs
  * .gopher
  * .o
  * .libre
  * .oss
  * .dyn
  * .null



You can register a domain within these (and more) top-level domains and register them on the OpenNIC DNS system so that they map to an IP address of your choice.

In other words, a website may exist in the OpenNIC network but remain inaccessible to anyone not using OpenNIC name servers. This isn't by any means a security measure or even a means of obfuscation; it's just a conscious choice to take a detour on the _super information highway_.

### How to use an OpenNIC DNS server

To access OpenNIC sites, you must configure your computer to use OpenNIC DNS servers. Luckily, this isn't a binary choice. By using an OpenNIC DNS server, you get access to both OpenNIC and the standard web.

To configure your Linux computer to use an OpenNIC DNS server, you can use the [nmcli][6] command, a terminal interface to Network Manager. Before starting the configuration, visit [opennic.org][5] and look for your nearest OpenNIC DNS server. As with standard DNS and [edge computing][7], the closer the server is to you geographically, the less delay you'll experience when your browser queries it.

Here's how to use OpenNIC:

  1. First, get a list of connections:


```
$ sudo nmcli connection
NAME                TYPE             DEVICE
Wired connection 1  802-3-ethernet   eth0
MyPersonalWifi      802-11-wireless  wlan0
ovpn-phx2-tcp       vpn              --
```

Your connections are sure to differ from this example, but focus on the first column. This provides the human-readable name of your connections. In this example, I'll configure my Ethernet connection, but the process is the same for a wireless connection.

  2. Now that you know the name of the connection you need to modify, use `nmcli` to update its `ipv4.dns` property:


```
$ sudo nmcli con modify \
"Wired connection 1" \
ipv4.dns "134.195.4.2"
```

In this example, `134.195.4.2` is my closest server.

  3. Prevent Network Manager from auto-updating `/etc/resolv.conf` with what your router is set to use:


```
$ sudo nmcli con modify \
"Wired connection 1" \
ipv4.ignore-auto-dns yes
```

  4. Bring your network connection down and then up again to instantiate the new settings:


```
$ sudo nmcli con down \
"Wired connection 1"
$ sudo nmcli con up \
"Wired connection 1"
```




That's it. You're now using the OpenNIC DNS servers.

#### DNS at your router

You can set your entire network to use OpenNIC by making this change to your router. You won't have to configure your computer's connection because the router will provide the correct DNS server automatically. I can't demonstrate this because router interfaces differ depending on the manufacturer. Furthermore, some internet service providers (ISP) don't allow you to modify your name server settings, so this isn't always an option.

### Test OpenNIC

To explore the "other" internet you've unlocked, try navigating to `grep.geek` in your browser. If you enter `http://grep.geek`, then your browser takes you to a search engine for OpenNIC. If you enter just `grep.geek`, then your browser interferes, taking you to your default search engine (such as [Searx][8] or [YaCy][9]), with an offer at the top of the window to navigate to the page you requested in the first place.

![OpenNIC][10]

(Klaatu, [CC BY-SA 4.0][11])

Either way, you end up at `grep.geek` and can now search the OpenNIC version of the web.

### Great wide open

The internet is meant to be a place of exploration, discovery, and equal access. OpenNIC helps ensure all of these things using existing infrastructure and technology. It's an opt-in internet alternative. If these ideas appeal to you, give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/opennic-internet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
