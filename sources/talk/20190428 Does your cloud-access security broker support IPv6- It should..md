[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Does your cloud-access security broker support IPv6? It should.)
[#]: via: (https://www.networkworld.com/article/3391380/does-your-cloud-access-security-broker-support-ipv6-it-should.html#tk.rss_all)
[#]: author: (Scott Hogg )

Does your cloud-access security broker support IPv6? It should.
======
Knowingly or not, enterprises employ IPv6 for many of their internet connections, and that means CASBs should support the protocol, too, in order to enforce policies on all customer traffic. Here's how major CASBs stack up.
Cloud access security brokers ([CASB][1]) insert security between enterprises and their cloud services by providing visibility and access control, but IPv6 could be causing a dangerous blind spot.

That’s because CASBs might not support IPv6, which could be in wide corporate use even in enterprises that choose IPv4 as their preferred protocol.

**[ Related:[What is IPv6, and why aren’t we there yet?][2]**

For example, end users working remotely have a far greater chance of connecting via IPv6 than when they are in the office. Mobile providers collectively have a [high percentage of IPv6-connected subscribers and broadband residential Internet customers often have IPv6 connectivity][3] without realizing it. Internet service providers and software-as-a-service (SaaS) vendors both widely support IPv6, so a mobile worker accessing, say, DropBox over a Verizon 4G wireless service might very well connect via IPv6.

Additionally, enterprises may contract with SaaS providers and Internet-based application services that use both IPv4 and IPv6 internet connectivity. IPv6 is now supported by major cloud providers, making it easier than ever for companies to IPv6-enable internet-facing web applications.

### Certain CASBs might not see IPv6 traffic

So wittingly or not, enterprises may be employ IPv6 for many internet connections that are used for common business functions. If the corporate choice of CASB (pronounced caz-bee) inspects and controls only IPv4 traffic, then these direct IPv6 connections could bypass corporate policies the CASB is supposed to enforce. If the CASB your organization selects is only looking at IPv4 connections, there could be dangers lurking in the blind spots.

Enterprises aren’t the only ones that might overlook this danger. Gartner outlines [four pillars of functionality that CASBs][4] should possess to be suitable for enterprise deployment:

  1. CASBs must provide visibility to end-user behavior and the cloud services used.
  2. CASBs should be cognizant of data classification, data marking and confidentiality.
  3. CASBs should help the organization protect against Internet/cloud threats and malicious behavior.
  4. CASBs should provide governance of cloud service usage based on corporate policies.



These are good goals, but they should be expanded to explicitly include IPv6:

  1. CASBs must provide visibility to connections that could be occurring using IPv4, IPv6 or a combination of both.
  2. CASBs should be cognizant of data classification, marking and confidentiality regardless of client IP address family.
  3. CASBs should protect against Internet-based threats that could be transported over either IPv4 or IPv6 and alert to malicious behavior occurring over either protocol.
  4. CASBs should provide control and governance based on corporate policies dictated by physical location of either the end-user or the cloud service and should also be aware of [geolocation information][5] based on IPv4 or IPv6 address.



Enterprise may not immediately enable the IPv6 features in a product or service. But, by purchasing products and services that already support IPv6, they have the option to enable IPv6 on their own schedule.

To continue reading this article register now

[Get Free Access][6]

[Learn More][7] Existing Users [Sign In][6]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3391380/does-your-cloud-access-security-broker-support-ipv6-it-should.html#tk.rss_all

作者：[Scott Hogg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://www.csoonline.com/article/3104981/what-is-a-cloud-access-security-broker-and-why-do-i-need-one.html
[2]: https://www.networkworld.com/article/3254575/lan-wan/what-is-ipv6-and-why-aren-t-we-there-yet.html
[3]: https://www.hexabuild.io/assets/files/HexaBuild-IPv6-Infographic.pdf
[4]: https://www.bitglass.com/blog/the-four-pillars-of-casbs
[5]: https://community.infoblox.com/t5/IPv6-CoE-Blog/Geolocation-with-IPv6/ba-p/11752
[6]: javascript://
[7]: /learn-about-insider/
