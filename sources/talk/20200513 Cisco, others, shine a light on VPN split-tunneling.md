[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco, others, shine a light on VPN split-tunneling)
[#]: via: (https://www.networkworld.com/article/3543298/cisco-others-shine-a-light-on-vpn-split-tunneling.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco, others, shine a light on VPN split-tunneling
======
Cisco, Microsoft and others play up VPN split-tunneling features to handle growing enterprise remote workload security
Putilich / Getty Images

As work-from-home becomes the norm due to the COVID-19 pandemic, the need for secure access to enterprise resources continues to grow and with it the demand for ever-more [VPN][1].

For example demand for commercial virtual private networks in the U.S. [jumped by 41%][2] between March 13 and March 23, according to research from Top10VPN.com, a VPN research and testing company in the U.K. The VPN market will hit $70 billion by 2026, according to market research and management consulting company Global Market Insights. In an April [blog][3] AT&amp;T pointed to a 700% increase in connections to its cloud-based [SD-WAN Static Network Based][4] (ANIRA) VPN service.

**[ Also see [What to consider when deploying a next generation firewall][5]. | Get regularly scheduled insights by [signing up for Network World newsletters][6]. ]**

That increased traffic puts more stress on enterprise VPN infrastructure, but one of the most effective ways to ease that stress is split tunneling.

Basically split tunneling is a feature that lets customers select specific, enterprise-bound traffic to be sent through a corporate VPN tunnel. The rest goes directly to the internet without going throuogh the tunnel. Otherwise all traffic, even traffic headed for sites on the internet, would go through the VPN, through enterprise security measures and then back out to the internet.The idea is that the VPN infrastructure has to handle less traffic, so it performs better.

Inadvertent split tunneling can also arise when enterprise VPN concentrators don't support IPv6, resulting in all IPV6 traffic from remote users going directly to the internet and avoiding corporate security controls, a situation known as [IPv6 VPN breakout][7].

Figuring out what traffic can be taken out of the VPN stream can be a challenge that Cisco is trying to address with a relatively new product. It combines telemetry data gathered by Cisco AnyConnect VPN clients with real-time report generation and dashboard technology from Splunk.Taken together the product is known as [Cisco Endpoint Security Analytics (CESA)][8] and is part of the AnyConnect Network Visibility Module (NVM). Cisco says that until July 1, 2020, CESA trial licenses are offered free for 90 days to help IT organizations with surges in remote working.

AnyConnect NVM gathers security information such as unique device ID, device name, process/container names, parent processes, privilege changes, source/destination domains, DNS info and network interfaces that can help customers spot data leakage, unapproved applications or SaaS services, security evasion and malware activity, according to Scott Pope, director, product management and business development for the security technical alliances ecosystem at Cisco.

AnyConnect supports another feature called Dynamic Split Tunneling, which makes it easy to direct tunneled traffic by domain name (for example, put all “*webex*.cisco.com” traffic into the split tunnel).  Dynamic Split Tunneling analytics is also supported in CESA.

In a recent [blog][9] Pope wrote that utilizing CESA data customers can use it to:

  * Implement VPN split tunneling to alleviate VPN capacity constraints without sacrificing security.
  * Monitor and further optimize traffic traversing an existing split tunnel deployment.
  * Analyze security behavior of remote endpoints, users and VPN “top talkers”. This is particularly useful for remote work endpoints that were rapidly deployed with less stringent that normal security compliance testing.



“The idea is that with CESA customers can quickly figure out what can be safely put into split tunnels which is of growing importance with the increasing VPN loads many companies are facing,” Pope said. “There’s some pretty low-hanging fruit customers can send to the internet but then there’s cloud-based applications and other traffic that may not be so obvious, and it’s hard to separate that traffic without knowing what’s coming across the tunnel.”

CESA provides the VPN traffic insight needed to keep tabs on what traffic is going over the split tunnel and also identify the traffic that should be moved back into the corporate tunnel. And the reverse is also true, Pope stated.

“CESA can monitor the corporate tunnel to identify traffic that could be safely moved to the split tunnel. Furthermore, CESA tracks the volume of traffic by application, protocol, port, software process, domain, source/destination, etc,” Pope stated.  “This enables IT orgs to identify high volume applications and data sources and move them to the split tunnel first to make the largest impact on VPN performance with the least amount of effort and configuration.”

In emergency situations, IT organizations are often put in the position of rolling out a high volume of remote workers in a very short time, Pope stated.  

“Depending on the situation, normal validation of security oversights for these users might be overlooked to expedite getting business running again. This might mean the user endpoints aren’t on standard IT builds. Or they don’t have the usual endpoint security used for remote workers. Whatever the situation, rapidly deployed remote working often entails less than perfect remote user/endpoint security and visibility.”

CESA takes the next step by using behavioral analysis to detect threats like malicious insiders, malware droppers and other activity not detectible via file-hash detection.  And CESA can be configured to monitor endpoints when they are off the network and when they are on it, giving complete visibility into all endpoint activity, Pope stated.

Security is the biggest challenge when using split tunnels since the data outside the VPN still has to be protected and monitored. It’s a case of knowing what that traffic is and how to increase security on that traffic.

Cisco isn’t the only industry player to advance split tunneling.  Microsoft [recent detailed][10] a tool customers can use to evaluate VPN connectivity and split tunneling via its Office 365 onboarding tool.    

That tool now detects use of a VPN and evaluates if the VPN is configured for recommended [Office 365 split tunneling][11]. “With many companies sending employees to work from home, scalable and performant VPN implementation supporting Office 365 is one of the top responsibilities that IT faces,” Microsoft stated. 

“For customers who connect their remote worker devices to the corporate network or cloud infrastructure over VPN, Microsoft recommends that the key Office 365 scenarios Microsoft Teams, SharePoint Online and Exchange Online are routed over a _VPN split tunnel_ configuration. This becomes especially important as the first-line strategy to facilitate continued employee productivity during large scale work-from-home events such as the COVID-19 crisis,” Microsoft stated.

Amazon Web Services [recently republished][12] a VPN client guide with [split tunneling][13] suggestions. 

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3543298/cisco-others-shine-a-light-on-vpn-split-tunneling.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[2]: https://www.networkworld.com/article/3542032/global-vpn-use-exploded-in-march.html
[3]: https://about.att.com/innovationblog/2020/04/anira.html
[4]: https://www.business.att.com/content/dam/attbusiness/briefs/sd-wan-static-network-based-anira-product-brief.pdf
[5]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[6]: https://www.networkworld.com/newsletters/signup.html
[7]: https://www.networkworld.com/article/3445200/how-to-prevent-ipv6-vpn-breakout.html
[8]: https://www.cisco.com/c/dam/en/us/products/collateral/security/amp-for-endpoints/at-a-glance-c45-742564.pdf
[9]: https://blogs.cisco.com/security/how-to-monitor-vpn-split-tunneling-and-remote-endpoints-with-existing-infrastructure?dtid=osscdc000283
[10]: https://techcommunity.microsoft.com/t5/office-365-networking/office-365-network-onboarding-tool-poc-updated-with-vpn-testing/m-p/1292515
[11]: https://docs.microsoft.com/en-us/Office365/Enterprise/office-365-vpn-split-tunnel
[12]: https://aws.amazon.com/blogs/networking-and-content-delivery/introducing-aws-client-vpn-to-securely-access-aws-and-on-premises-resources/
[13]: https://aws.amazon.com/about-aws/whats-new/2019/07/aws-client-vpn-now-adds-support-for-split-tunnel/
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
