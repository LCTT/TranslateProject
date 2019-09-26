[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Reports: As the IoT grows, so do its threats to DNS)
[#]: via: (https://www.networkworld.com/article/3411437/reports-as-the-iot-grows-so-do-its-threats-to-dns.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Reports: As the IoT grows, so do its threats to DNS
======
ICANN and IBM's security researchers separately spell out how the growth of the internet of things will increase opportunities for malicious actors to attack the Domain Name System with hyperscale botnets and worm their malware into the cloud.
The internet of things is shaping up to be a more significant threat to the Domain Name System through larger IoT botnets, unintentional adverse effects of IoT-software updates and the continuing development of bot-herding software.

The Internet Corporation for Assigned Names and Numbers (ICANN) and IBM’s X-Force security researchers have recently issued reports outlining the interplay between DNS and IoT that includes warnings about the pressure IoT botnets will put on the availability of DNS systems.

**More about DNS:**

  * [DNS in the cloud: Why and why not][1]
  * [DNS over HTTPS seeks to make internet use more private][2]
  * [How to protect your infrastructure from DNS cache poisoning][3]
  * [ICANN housecleaning revokes old DNS security key][4]



ICANN’s Security and Stability Advisory Committee (SSAC) wrote in a [report][5] that “a significant number of IoT devices will likely be IP enabled and will use the DNS to locate the remote services they require to perform their functions. As a result, the DNS will continue to play the same crucial role for the IoT that it has for traditional applications that enable human users to interact with services and content,” ICANN stated. “The  role of  the  DNS  might  become  even  more  crucial  from  a  security  and  stability perspective with IoT devices interacting with people’s physical environment.”

IoT represents both an opportunity and a risk to the DNS, ICANN stated. “It is an opportunity because the DNS provides functions and data that can help make the IoT more secure, stable, and transparent, which is critical given the IoT's interaction with the physical world. It is a risk because various measurement studies suggest that IoT devices may stress the DNS, for instance, because of complex DDoS attacks carried out by botnets that grow to hundreds of thousands or in the future millions of infected IoT devices within hours,” ICANN stated.

Unintentional DDoS attacks

One risk is that the IoT could place new burdens on the DNS. “For example, a software update for a popular IP-enabled IoT device that causes the device to use the DNS more frequently (e.g., regularly lookup random domain names to check for network availability) could stress the DNS in individual networks when millions of devices automatically install the update at the same time,” ICANN stated.

While this is a programming error from the perspective of individual devices, it could result in a significant attack vector from the perspective of DNS infrastructure operators. Incidents like this have already occurred on a small scale, but they may occur more frequently in the future due to the growth of heterogeneous IoT devices from manufacturers that equip their IoT devices with controllers that use the DNS, ICANN stated.

Massively larger botnets, threat to clouds

The report also suggested that the scale of IoT botnets could grow from hundreds of thousands of devices to millions. The best known IoT botnet is Mirai, responsible for DDoS attacks involving 400,000 to 600,000 devices. The Hajime botnet hovers around 400K infected IoT devices but has not launched any DDoS attacks yet. But as the IoT grows, so will the botnets and as a result larger DDoS attacks.

Cloud-connected IoT devices could endanger cloud resources. “IoT devices connected to cloud architecture could allow Mirai adversaries to gain access to cloud servers. They could infect a server with additional malware dropped by Mirai or expose all IoT devices connected to the server to further compromise,” wrote Charles DeBeck,  a senior cyber threat intelligence strategic analyst with [IBM X-Force Incident Response][6] in a recent report. 

 “As organizations increasingly adopt cloud architecture to scale efficiency and productivity, disruption to a cloud environment could be catastrophic.”

For enterprises that are rapidly adopting both IoT technology and cloud architecture, insufficient security controls could expose the organization to elevated risk, calling for the security committee to conduct an up-to-date risk assessment, DeBeck stated.

Attackers continue malware development

“Since this activity is highly automated, there remains a strong possibility of large-scale infection of IoT devices in the future,” DeBeck stated. “Additionally, threat actors are continuing to expand their targets to include new types of IoT devices and may start looking at industrial IoT devices or connected wearables to increase their footprint and profits.”

Botnet bad guys are also developing new Mirai variants and IoT botnet malware outside of the Mirai family to target IoT devices, DeBeck stated.

To continue reading this article register now

[Get Free Access][7]

[Learn More][8]   Existing Users [Sign In][7]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3411437/reports-as-the-iot-grows-so-do-its-threats-to-dns.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3273891/hybrid-cloud/dns-in-the-cloud-why-and-why-not.html
[2]: https://www.networkworld.com/article/3322023/internet/dns-over-https-seeks-to-make-internet-use-more-private.html
[3]: https://www.networkworld.com/article/3298160/internet/how-to-protect-your-infrastructure-from-dns-cache-poisoning.html
[4]: https://www.networkworld.com/article/3331606/security/icann-housecleaning-revokes-old-dns-security-key.html
[5]: https://www.icann.org/en/system/files/files/sac-105-en.pdf
[6]: https://securityintelligence.com/posts/i-cant-believe-mirais-tracking-the-infamous-iot-malware-2/?cm_mmc=OSocial_Twitter-_-Security_Security+Brand+and+Outcomes-_-WW_WW-_-SI+TW+blog&cm_mmca1=000034XK&cm_mmca2=10009814&linkId=70790642
[7]: javascript://
[8]: https://www.networkworld.com/learn-about-insider/
