[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is DNS and how does it work?)
[#]: via: (https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html)
[#]: author: (Keith Shaw and Josh Fruhlinger )

What is DNS and how does it work?
======
The Domain Name System resolves the names of internet sites with their underlying IP addresses adding efficiency and even security in the process.
Thinkstock

The Domain Name System (DNS) is one of the foundations of the internet, yet most people outside of networking probably don’t realize they use it every day to do their jobs, check their email or waste time on their smartphones.

At its most basic, DNS is a directory of names that match with numbers. The numbers, in this case are IP addresses, which computers use to communicate with each other. Most descriptions of DNS use the analogy of a phone book, which is fine for people over the age of 30 who know what a phone book is.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

If you’re under 30, think of DNS like your smartphone’s contact list, which matches people’s names with their phone numbers and email addresses. Then multiply that contact list by everyone else on the planet.

### A brief history of DNS

When the internet was very, very small, it was easier for people to correspond specific IP addresses with specific computers, but that didn’t last for long as more devices and people joined the growing network. It's still possible to type a specific IP address into a browser to reach a website, but then, as now, people wanted an address made up of easy-to-remember words, of the sort that we would recognize as a domain name (like networkworld.com) today. In the 1970s and early '80s, those names and addresses were assigned by one person — [Elizabeth Feinler at Stanford][2] – who maintained a master list of every Internet-connected computer in a text file called [HOSTS.TXT][3].

This was obviously an untenable situation as the Internet grew, not least because Feinler only handled requests before 6 p.m. California time, and took time off for Christmas. In 1983, Paul Mockapetris, a researcher at USC, was tasked with coming up with a compromise among multiple suggestions for dealing with the problem. He basically ignored them all and developed his own system, which he dubbed DNS. While it's obviously changed quite a bit since then, at a fundamental level it still works the same way it did nearly 40 years ago.

### How DNS servers work

The DNS directory that matches name to numbers isn’t located all in one place in some dark corner of the internet. With [more than 332 million domain names listed at the end of 2017][4], a single directory would be very large indeed. Like the internet itself, the directory is distributed around the world, stored on domain name servers (generally referred to as DNS servers for short) that all communicate with each other on a very regular basis to provide updates and redundancies.

### Authoritative DNS servers vs. recursive DNS servers

When your computer wants to find the IP address associated with a domain name, it first makes its request to a recursive DNS server, also known as recursive resolver*.* A recursive resolver is a server that is usually operated by an ISP or other third-party provider, and it knows which other DNS servers it needs to ask to resolve the name of a site with its IP address. The servers that actually have the needed information are called authoritative DNS servers*.*

### DNS servers and IP addresses

Each domain can correspond to more than one IP address. In fact, some sites have hundreds or more IP addresses that correspond with a single domain name. For example, the server your computer reaches for [www.google.com][5] is likely completely different from the server that someone in another country would reach by typing the same site name into their browser.

Another reason for the distributed nature of the directory is the amount of time it would take for you to get a response when you were looking for a site if there was only one location for the directory, shared among the millions, probably billions, of people also looking for information at the same time. That’s one long line to use the phone book.

### What is DNS caching?

To get around this problem, DNS information is shared among many servers. But information for sites visited recently is also cached locally on client computers. Chances are that you use google.com several times a day. Instead of your computer querying the DNS name server for the IP address of google.com every time, that information is saved on your computer so it doesn’t have to access a DNS server to resolve the name with its IP address. Additional caching can occur on the routers used to connect clients to the internet, as well as on the servers of the user’s Internet Service Provider (ISP). With so much caching going on, the number of queries that actually make it to DNS name servers is a lot lower than it would seem.

### How do I find my DNS server?

Generally speaking, the DNS server you use will be established automatically by your network provider when you connect to the internet. If you want to see which servers are your primary nameservers — generally the recursive resolver, as described above — there are web utilities that can provide a host of information about your current network connection. [Browserleaks.com][6] is a good one, and it provides a lot of information, including your current DNS servers.

### Can I use 8.8.8.8 DNS?

It's important to keep in mind, though, that while your ISP will set a default DNS server, you're under no obligation to use it. Some users may have reason to avoid their ISP's DNS — for instance, some ISPs use their DNS servers to redirect requests for nonexistent addresses to [pages with advertising][7].

If you want an alternative, you can instead point your computer to a public DNS server that will act as a recursive resolver. One of the most prominent public DNS servers is Google's; its IP address is 8.8.8.8. Google's DNS services tend to be [fast][8], and while there are certain questions about the [ulterior motives Google has for offering the free service][9], they can't really get any more information from you that they don't already get from Chrome. Google has a page with detailed instructions on how to [configure your computer or router][10] to connect to Google's DNS.

### How DNS adds efficiency

DNS is organized in a hierarchy that helps keep things running quickly and smoothly. To illustrate, let’s pretend that you wanted to visit networkworld.com.

The initial request for the IP address is made to a recursive resolver, as discussed above. The recursive resolver knows which other DNS servers it needs to ask to resolve the name of a site (networkworld.com) with its IP address. This search leads to a root server, which knows all the information about top-level domains, such as .com, .net, .org and all of those country domains like .cn (China) and .uk (United Kingdom). Root servers are located all around the world, so the system usually directs you to the closest one geographically.

Once the request reaches the correct root server, it goes to a top-level domain (TLD) name server, which stores the information for the second-level domain, the words used before you get to the .com, .org, .net (for example, that information for networkworld.com is “networkworld”). The request then goes to the Domain Name Server, which holds the information about the site and its IP address. Once the IP address is discovered, it is sent back to the client, which can now use it to visit the website. All of this takes mere milliseconds.

Because DNS has been working for the past 30-plus years, most people take it for granted. Security also wasn’t considered when building the system, so [hackers have taken full advantage of this][11], creating a variety of attacks.

### DNS reflection attacks

DNS reflection attacks can swamp victims with high-volume messages from DNS resolver servers. Attackers request large DNS files from all the open DNS resolvers they can find and do so using the spoofed IP address of the victim. When the resolvers respond, the victim receives a flood of unrequested DNS data that overwhelms their machines.

### DNS cache poisoning

[DNS cache poisoning][12] can divert users to malicious Web sites. Attackers manage to insert false address records into the DNS so when a potential victim requests an address resolution for one of the poisoned sites, the DNS responds with the IP address for a different site, one controlled by the attacker. Once on these phony sites, victims may be tricked into giving up passwords or suffer malware downloads.

### DNS resource exhaustion

[DNS resource exhaustion][13] attacks can clog the DNS infrastructure of ISPs, blocking the ISP’s customers from reaching sites on the internet. This can be done by attackers registering a domain name and using the victim’s name server as the domain’s authoritative server. So if a recursive resolver can’t supply the IP address associated with the site name, it will ask the name server of the victim. Attackers generate large numbers of requests for their domain and toss in non-existent subdomains to boot, which leads to a torrent of resolution requests being fired at the victim’s name server, overwhelming it.

### What is DNSSec?

DNS Security Extensions is an effort to make communication among the various levels of servers involved in DNS lookups more secure. It was devised by the Internet Corporation for Assigned Names and Numbers (ICANN), the organization in charge of the DNS system.

ICANN became aware of weaknesses in the communication between the DNS top-level, second-level and third-level directory servers that could allow attackers to hijack lookups. That would allow the attackers to respond to requests for lookups to legitimate sites with the IP address for malicious sites. These sites could upload malware to users or carry out phishing and pharming attacks.

DNSSEC would address this by having each level of DNS server digitally sign its requests, which insures that the requests sent in by end users aren’t commandeered by attackers. This creates a chain of trust so that at each step in the lookup, the integrity of the request is validated.

In addition, DNSSec can determine if domain names exist, and if one doesn’t, it won’t let that fraudulent domain be delivered to innocent requesters seeking to have a domain name resolved.

As more domain names are created, and more devices continue to join the network via internet of things devices and other “smart” systems, and as [more sites migrate to IPv6][14], maintaining a healthy DNS ecosystem will be required. The growth of big data and analytics also [brings a greater need for DNS management][15].

### SIGRed: A wormable DNS flaw rears its head

The world got a good look recently at the sort of chaos weaknesses in DNS could cause with the discovery of a flaw in Windows DNS servers. The potential security hole, dubbed SIGRed, [requires a complex attack chain][16], but can exploit unpatched Windows DNS servers to potentially install and execute arbitrary malicious code on clients. And the exploit is "wormable," meaning that it can spread from computer to computer without human intervention. The vulnerability was considered alarming enough that U.S. federal agencies were [given only a few days to install patches][17].

### DNS over HTTPS: A new privacy landscape

As of this writing, DNS is on the verge of one of its biggest shifts in its history. Google and Mozilla, who together control the lion's share of the browser market, are encouraging a move towards [DNS over HTTPS][18], or DoH, in which DNS requests are encrypted by the same HTTPS protocol that already protects most web traffic. In Chrome's implementation, the browser checks to see if the DNS servers support DoH, and if they don't, it reroutes DNS requests to Google's 8.8.8.8.

It's a move not without controversy. Paul Vixie, who did much of the early work on the DNS protocol back in the 1980s, calls the move a "[disaster][19]" for security: corporate IT will have a much harder time monitoring or directing DoH traffic that traverses their network, for instance. Still, Chrome is omnipresent and DoH will soon be turned on by default, so we'll see what the future holds.

_(Keith Shaw is_ _a former senior editor for Network World and_ _an award-winning writer, editor and product reviewer who has written for many publications and websites around the world.)_

_(Josh Fruhlinger is a writer and editor who lives in Los Angeles.)_

Join the Network World communities on [Facebook][20] and [LinkedIn][21] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html

作者：[Keith Shaw and Josh Fruhlinger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
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
