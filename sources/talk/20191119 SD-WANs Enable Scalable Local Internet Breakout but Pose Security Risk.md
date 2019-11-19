[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SD-WANs Enable Scalable Local Internet Breakout but Pose Security Risk)
[#]: via: (https://www.networkworld.com/article/3454282/sd-wans-enable-scalable-local-internet-breakout-but-pose-security-risk.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

SD-WANs Enable Scalable Local Internet Breakout but Pose Security Risk
======

NatalyaBurova/istock

SD-WAN streamlines how application traffic is routed from the branch, making it easier to create local internet breakout and allowing users to access cloud services directly from the branch. In an ideal [SD-WAN][1] scenario, every remote location and device has its own local internet breakout and corresponding security services. Yet, reality looks a lot different for many companies. 

This is something network professionals have wanted to enable for decades. The problem was that setting up local internet breakout using traditional routers was not trivial and required a tremendous amount of engineering work so most businesses, except for the ones that had high levels of technical talent shied away. The shift to cloud and edge computing has made local internet breakout almost mandatory today, so businesses have turned to SD-WAN as a simpler path to enable it. As this happens, organizations need to understand the security risks. 

Using broadband internet services to quickly send enterprise application traffic has many benefits, but it’s also risky since it exposes users and their local networks to the untrusted public internet. As [previously mentioned][2] in another post, EMA’s [WAN Transformation research][3] found companies that exclusively relied on the native security features in their SD-WAN devices were 1.3 times more likely to have a data breach, compared to those who supplemented their SD-WAN with additional layers of security. 

Local internet breakout is a modern approach to the SD-WAN; it provides application awareness and automation that cannot be achieved with traditional routers. However, security shouldn’t be an afterthought when deploying it. Not all local internet breakout solutions can administer application-specific security policies in real-time or keep up with SaaS/IaaS changes and updates.

In order to deliver the highest SaaS and IaaS performance, there are several local internet breakout requirements that must be addressed:

  * Application-driven security policies must be supported for all apps running over broadband internet
  * Performance must be optimized without compromising security
  * Security must be enforced with an integrated firewall to safeguard the branch from potential threats
  * Service chaining to next generation firewalls or cloud-delivered security services must be automated



When security enforcement is positioned close to branch locations, local internet breakout can provide enterprises with the desired application performance and protection.

That’s where moving security to the cloud comes in. Cloud-hosted security services help enterprises centralize the entire security stack in the cloud instead of deploying costly security appliances at each branch location. A cloud-hosted security stack, like [Zscaler][4] or [Check Point][5], includes next-gen firewall services, as well as intrusion detection and prevention, URL filtering, antivirus protection, sandboxing, and much more.

By shifting away from a hub-and-spoke architecture to a cloud-enabled architecture, enterprises can reduce cost and complexity, offer a better user experience, simplify their operations, and deploy new services faster—all without compromising security. 

Learn more about how we can help with secure local internet breakout with SD -WAN at [SilverPeak.com][6]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454282/sd-wans-enable-scalable-local-internet-breakout-but-pose-security-risk.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.silver-peak.com/sd-wan/sd-wan-explained
[2]: https://blog.silver-peak.com/integrations-are-essential-to-secure-sd-wan
[3]: https://www.enterprisemanagement.com/research/asset.php/3683/Wide-Area-Network-Transformation:-How-Enterprises-Succeed-with-Software-Defined-WAN
[4]: https://www.silver-peak.com/sites/default/files/infoctr/zscaler-silver-peak-solution-brief.pdf
[5]: https://www.silver-peak.com/sites/default/files/infoctr/silver-peak-solution-brief-point-silver-peak-1019.pdf
[6]: http://www.silverpeak.com/
