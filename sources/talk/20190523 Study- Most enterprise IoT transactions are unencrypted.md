[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Study: Most enterprise IoT transactions are unencrypted)
[#]: via: (https://www.networkworld.com/article/3396647/study-most-enterprise-iot-transactions-are-unencrypted.html)
[#]: author: (Tim Greene https://www.networkworld.com/author/Tim-Greene/)

Study: Most enterprise IoT transactions are unencrypted
======
A Zscaler report finds 91.5% of IoT communications within enterprises are in plaintext and so susceptible to interference.
![HYWARDS / Getty Images][1]

Of the millions of enterprise-[IoT][2] transactions examined in a recent study, the vast majority were sent without benefit of encryption, leaving the data vulnerable to theft and tampering.

The research by cloud-based security provider Zscaler found that about 91.5 percent of transactions by internet of things devices took place over plaintext, while 8.5 percent were encrypted with [SSL][3]. That means if attackers could intercept the unencrypted traffic, they’d be able to read it and possibly alter it, then deliver it as if it had not been changed.

**[ For more on IoT security, see[our corporate guide to addressing IoT security concerns][4]. | Get regularly scheduled insights by [signing up for Network World newsletters][5]. ]**

Researchers looked through one month’s worth of enterprise traffic traversing Zscaler’s cloud seeking the digital footprints of IoT devices. It found and analyzed 56 million IoT-device transactions over that time, and identified the type of devices, protocols they used, the servers they communicated with, how often communication went in and out and general IoT traffic patterns.

The team tried to find out which devices generate the most traffic and the threats they face. It discovered that 1,015 organizations had at least one IoT device. The most common devices were set-top boxes (52 percent), then smart TVs (17 percent), wearables (8 percent), data-collection terminals (8 percent), printers (7 percent), IP cameras and phones (5 percent) and medical devices (1 percent).

While they represented only 8 percent of the devices, data-collection terminals generated 80 percent of the traffic.

The breakdown is that 18 percent of the IoT devices use SSL to communicate all the time, and of the remaining 82 percent, half used it part of the time and half never used it.
The study also found cases of plaintext HTTP being used to authenticate devices and to update software and firmware, as well as use of outdated crypto libraries and weak default credentials.

While IoT devices are common in enterprises, “many of the devices are employee owned, and this is just one of the reasons they are a security concern,” the report says. Without strict policies and enforcement, these devices represent potential vulnerabilities.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][6] ]**

Another reason employee-owned IoT devices are a concern is that many businesses don’t consider them a threat because no data is stored on them. But if the data they gather is transmitted insecurely, it is at risk.

### 5 tips to protect enterprise IoT

Zscaler recommends these security precautions:

  * Change default credentials to something more secure. As employees bring in devices, encourage them to use strong passwords and to keep their firmware current.
  * Isolate IoT devices on networks and restrict inbound and outbound network traffic.
  * Restrict access to IoT devices from external networks and block unnecessary ports from external access.
  * Apply regular security and firmware updates to IoT devices, and secure network traffic.
  * Deploy tools to gain visibility of shadow-IoT devices already inside the network so they can be protected.



**More on IoT:**

  * [What is edge computing and how it’s changing the network][7]
  * [Most powerful Internet of Things companies][8]
  * [10 Hot IoT startups to watch][9]
  * [The 6 ways to make money in IoT][10]
  * [What is digital twin technology? [and why it matters]][11]
  * [Blockchain, service-centric networking key to IoT success][12]
  * [Getting grounded in IoT networking and security][13]
  * [Building IoT-ready networks must become a priority][14]
  * [What is the Industrial IoT? [And why the stakes are so high]][15]



Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3396647/study-most-enterprise-iot-transactions-are-unencrypted.html

作者：[Tim Greene][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Tim-Greene/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/network_security_network_traffic_scanning_by_hywards_gettyimages-673891964_2400x1600-100796830-large.jpg
[2]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[3]: https://www.networkworld.com/article/3045953/5-things-you-need-to-know-about-ssl.html
[4]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[7]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[8]: https://www.networkworld.com/article/2287045/internet-of-things/wireless-153629-10-most-powerful-internet-of-things-companies.html
[9]: https://www.networkworld.com/article/3270961/internet-of-things/10-hot-iot-startups-to-watch.html
[10]: https://www.networkworld.com/article/3279346/internet-of-things/the-6-ways-to-make-money-in-iot.html
[11]: https://www.networkworld.com/article/3280225/internet-of-things/what-is-digital-twin-technology-and-why-it-matters.html
[12]: https://www.networkworld.com/article/3276313/internet-of-things/blockchain-service-centric-networking-key-to-iot-success.html
[13]: https://www.networkworld.com/article/3269736/internet-of-things/getting-grounded-in-iot-networking-and-security.html
[14]: https://www.networkworld.com/article/3276304/internet-of-things/building-iot-ready-networks-must-become-a-priority.html
[15]: https://www.networkworld.com/article/3243928/internet-of-things/what-is-the-industrial-iot-and-why-the-stakes-are-so-high.html
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
