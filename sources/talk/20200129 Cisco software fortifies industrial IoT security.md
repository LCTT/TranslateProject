[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco software fortifies industrial IoT security)
[#]: via: (https://www.networkworld.com/article/3516395/cisco-software-shapes-security-fortification-for-industrial-iot.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco software fortifies industrial IoT security
======
Cisco security architecture learns customer IIoT environment, keeps watch for anomalies
iStock

Cisco is looking to better protect myriad edge-attached IoT devices with new security software that promises to protect industrial assets in one of the most disparate of network environments.

The company rolled out what it called an overarching security architecture for Industrial IoT ([IIoT][1]) environments that includes existing products but also new software called Cisco Cyber Vision, for the automated discovery of industrial assets attached to Cisco’s extensive IIoT networking portfolio. 

**More about edge networking**

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][2] ]**

  * [How edge networking and IoT will reshape data centers][3]
  * [Edge computing best practices][4]
  * [How edge computing can help secure the IoT][5]



Last year, Cisco [rolled out a new family of switches][6], including the Cisco Catalyst IE3x00 ruggedized edge switches, software, developer tools and blueprints to meld [IoT][7] and industrial networking with [intent-based networking][8] and classic IT security, monitoring and application-development support.

The new security rollout also included Cisco Edge Intelligence software to simplify the extraction of IoT data at the network edge. Together with the new software, IT and operational technology (OT) groups will be able to work together to provide advanced anomaly detection in IIoT environments, said Joe Malenfant, director of global IoT for Cisco.

“The architecture understands what normal industrial traffic looks like, and if something is out of the ordinary, like a local industrial [programmable logic controller] suddenly starts communicating with a computer in another country, the IT and OT security folks can be notified immediately,” Malenfant said.

The security architecture looks to address a number of challenges in the IIoT arena, wrote Vikas Butaney, vice president of product management with Cisco’s Internet of Things (IoT) Business Group in a [blog about the announcement][9] which came at the Cisco Live Europe event in Barcelona. 

IIoT projects in operational settings typically lack up-to-date asset inventories with a baseline of normal communication patterns to detect security and configuration anomalies, he stated. Flat, unmanaged, industrial-plant networks allow unfettered propagation of cybersecurity threats, threatening system downtime, and increasing risks to people and industrial processes. And while data is king, it becomes trapped in heterogeneous environments incorporating industry-specific protocols that are foreign to IT and security tool sets, Butaney stated.

With that in mind, Cisco Cyber Vision software embedded in Cisco’s IoT networking gear works by passively discovering networked assets and decoding industry-specific process flows using passive Deep Packet Inspection (DPI) technology. Then, using a combination of OT-specific rules and intelligence from Cisco's Talos threat-research team, it provides real-time anomaly detection and monitoring, Butaney stated.

Information gathered by Cisco Cyber Vision can also be used to develop segmentation policies in existing Cisco Identity Services Engine (ISE) for access control and segmentation and DNA Center for centralized management. The idea is to let IT and OT stop the unfettered propagation of threats across operational environments – a process that is a highly manual and does not keep up with changing requirements today, Butaney stated.

Cisco Cyber Vision can also pass data to third-party security information and event management platforms, such as IBM QRadar and Splunk, Cisco stated.

Cyber Vision is based on technology [Cisco acquired from Sentryo last year][10]. Sentryo technology offers anomaly detection and real-time threat detection for IIoT networks. Sentryo products include an asset-inventory, network-monitoring and threat-intelligence platform, including network edge sensors that analyze network flows.

The other new software, Cisco Edge Intelligence, runs on Cisco’s IoT packages and gathers data from connected devices to create logical flows from the edge into private, public or third-party clouds, Malenfant said.

For example, if a robotic arm in a remote system needs replacement, it can send telemetry or information about the problem. Edge Intelligence extracts that data and gives the OT team information it can use to fix the problem Malenfant said.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3516395/cisco-software-shapes-security-fortification-for-industrial-iot.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3243928/what-is-the-industrial-internet-of-things-essentials-of-iiot.html
[2]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[5]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[6]: https://www.networkworld.com/article/3336454/cisco-goes-after-industrial-iot.html
[7]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[8]: https://www.networkworld.com/article/3202699/what-is-intent-based-networking.html
[9]: https://blogs.cisco.com/internet-of-things/cisco-live-barcelona-announcements-clear-the-way-to-industrial-iot
[10]: https://www.networkworld.com/article/3400847/cisco-to-buy-iot-security-management-firm-sentryo.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
