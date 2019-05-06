[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to shop for enterprise firewalls)
[#]: via: (https://www.networkworld.com/article/3390686/how-to-shop-for-enterprise-firewalls.html#tk.rss_all)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

How to shop for enterprise firewalls
======
Performance, form factors, and automation capabilities are key considerations when choosing a next-generation firewall (NGFW).
Firewalls have been around for years, but the technology keeps evolving as the threat landscape changes. Here are some tips about what to look for in a next-generation firewall ([NGFW][1]) that will satisfy business needs today and into the future.

### Don't trust firewall performance stats

Understanding how a NGFW performs requires more than looking at a vendor’s specification or running a bit of traffic through it. Most [firewalls][2] will perform well when traffic loads are light. It’s important to see how a firewall responds at scale, particularly when [encryption][3] is turned on. Roughly 80% of traffic is encrypted today, and the ability to maintain performance levels with high volumes of encrypted traffic is critical.

**Learn more about network security**

  * [How to boost collaboration between network and security teams][4]
  * [What is microsegmentation? How getting granular improves network security][5]
  * [What to consider when deploying a next-generation firewall][1]
  * [How firewalls fit into enterprise security][2]



Also, be sure to turn on all major functions – including application and user identification, IPS, anti-malware, URL filtering and logging – during testing to see how a firewall will hold up in a production setting. Firewall vendors often tout a single performance number that's achieved with core features turned off. Data from [ZK Research][6] shows many IT pros learn this lesson the hard way: 58% of security professionals polled said they were forced to turn off features to maintain performance.

Before committing to a vendor, be sure to run tests with as many different types of traffic as possible and with various types of applications. Important metrics to look at include application throughput, connections per second, maximum sessions for both IPv4 and [IPv6][7], and SSL performance.

### NGFW needs to fit into broader security platform

Is it better to have a best-of-breed strategy or go with a single vendor for security? The issue has been debated for years, but the fact is, neither approach works flawlessly. It’s important to understand that best-of-breed everywhere doesn’t ensure best-in-class security. In fact, the opposite is typically true; having too many vendors can lead to complexity that can't be managed, which puts a business at risk. A better approach is a security platform, which can be thought of as an open architecture, that third-party products can be plugged into.

Any NGFW must be able to plug into a platform so it can "see" everything from IoT endpoints to cloud traffic to end-user devices. Also, once the NGFW has aggregated the data, it should be able to perform analytics to provide insights. This will enable the NGFW to take action and enforce policies across the network.

### Multiple form factors, consistent security features

Firewalls used to be relegated to corporate data centers. Today, networks have opened up, and customers need a consistent feature set at every point in the network. NGFW vendors should have the following form factors available to optimize price/performance:

  * Data center
  * Internet edge
  * Midsize branch office
  * Small branch office
  * Ruggedized for IoT environments
  * Cloud delivered
  * Virtual machines that can run in private and public clouds



Also, NGFW vendors should have a roadmap for a containerized form factor. This certainly isn’t a trivial task. Most vendors won’t have a [container][8]-ready product yet, but they should be able to talk to how they plan to address the problem.

### Single-pane-of-glass firewall management

Having a broad product line doesn’t matter if products need to be managed individually. This makes it hard to keep policies and rules up to date and leads to inconsistencies in features and functions. A firewall vendor must have a single management tool that provides end-to-end visibility and enables the administrator to make a change and push it out across the network at once. Visibility must extend everywhere, including the cloud, [IoT][9] edge, operational technology (OT) environments, and branch offices. A single dashboard is also the right place to implement and maintain software-based segmentation instead of having to configure each device.

### Firewall automation capabilities

The goal of [automation][10] is to help remove many of the manual steps that create "human latency" in the security process. Almost all vendors tout some automation capabilities as a way of saving on headcount, but automation goes well beyond that.

To continue reading this article register now

[Get Free Access][11]

[Learn More][12] Existing Users [Sign In][11]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390686/how-to-shop-for-enterprise-firewalls.html#tk.rss_all

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3236448/what-to-consider-when-deploying-a-next-generation-firewall.html
[2]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[3]: https://www.networkworld.com/article/3098354/enterprise-encryption-adoption-up-but-the-devils-in-the-details.html
[4]: https://www.networkworld.com/article/3328218/how-to-boost-collaboration-between-network-and-security-teams.html
[5]: https://www.networkworld.com/article/3247672/what-is-microsegmentation-how-getting-granular-improves-network-security.html
[6]: https://zkresearch.com/
[7]: https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html
[8]: https://www.networkworld.com/article/3159735/containers-what-are-containers.html
[9]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[10]: https://www.networkworld.com/article/3184389/automation-rolls-on-what-are-you-doing-about-it.html
[11]: javascript://
[12]: /learn-about-insider/
