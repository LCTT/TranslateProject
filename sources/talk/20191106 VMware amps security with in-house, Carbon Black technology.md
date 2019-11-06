[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware amps security with in-house, Carbon Black technology)
[#]: via: (https://www.networkworld.com/article/3451998/vmware-amps-security-with-in-house-carbon-black-technology.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware amps security with in-house, Carbon Black technology
======
VMware's Carbon Black platform, along with VMware NSX, VMware Workspace ONE, VMware Secure State and future innovations, will deliver built-in security to networks, endpoints, workloads, identity\ies, cloud and analytics.
LordRunar / Getty Images

VMware is moving quickly to meld its recently purchased Carbon Black technology across its product lines with an eye toward helping users protect their distributed enterprises.

VMware just closed the $2.1 billion buy of cloud-native endpoint-security vendor Carbon Black in October and in the process created a [new security business unit][1] that will target cybersecurity and analytics to protect networked enterprise resources.

**More about edge networking**

  * [How edge networking and IoT will reshape data centers][2]
  * [Edge computing best practices][3]
  * [How edge computing can help secure the IoT][4]



“The Carbon Black platform, along with VMware NSX, VMware Workspace ONE, VMware Secure State and our future innovations, will deliver a highly differentiated intrinsic security platform across network, endpoint, workload, identity, cloud and analytics," VMware said upon closing the deal. 

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Indeed that’s a significant part of the security direction the company has started moving.  VMware this week announced a slew of new Carbon Black security options, including Carbon Black Endpoint Standard, Advanced and Enterprise packages, which depending on which version the customer needs, include antivirus, endpoint protection as well as advanced threat hunting and incident response support. Threat hunting lets customers watch for abnormal activity in their networks and use threat intelligence and custom watchlists to augment and automate the search.

Another package, Carbon Black workload protects cloud workloads in the vSphere realm. And finally VMware Workspace Security which is a package that combines Carbone Black and VMware products for behavior threat detection, antivirus, and digital workspace analytics and remediation.

Also part of the security announcements was the fact that Dell will preload Carbon Black Cloud, along with Dell Trusted Devices and Secureworks to make it the strategic endpoint security package for Dell commercial customers.  The enhanced partnership will bring Carbon Black’s advanced, next-generation endpoint protection to businesses of all sizes directly on-the-box, [wrote Patrick Morley][6], former CEO for Carbon Black, now the General Manager for VMware’s Security Business Unit in a blog about the Dell announcement.  “We now have the opportunity to work together and further expand our collective ability to keep worldwide customers protected from advanced cyberattacks."

The goal is to deliver intrinsic security through a wide-ranging portfolio of products spanning the critical control points of security: network, endpoint, workload, identity, cloud, and analytics, VMware stated.   “Because we’re built-in, we’re everywhere apps, devices, and users reside. This gives us a unique vantage point to be informed about what’s happening in a customer’s environment. With this knowledge, we can be proactive in hardening customers’ environments to better prevent threats.”

The new VMware Carbon Black Cloud offerings are expected to be available before September of 2020.

The other component of VMware’s security strategy is making its own core network software – NSX –  fundamentally more protected.

The company said NSX will now include distributed intrusion detection and prevention (IDS/IPS) support that will let customers match IDS/IPS signatures to specific parts of an application and let them microsegment their networks based on specific service traffic.   NSX Distributed IDS/IPS in combination with VMware [Service-defined Firewall][7] with will let customers microsegment their networks and block internal traffic that might be using stolen credentials or compromised machines. 

VMware says its Service-defined Firewall gains deep visibility into the hosts and services that generate network traffic by tapping into the NSX network management software, vSphere hypervisors and AppDefense threat-detection system.

“East-west traffic control is the new security battleground,” said [Tom Gillis VMware's senior vice president and general manager][8] of its networking and security business.  “Microsegmentation can stop the obvious problems but we’ll be doing Layer 7 inspection of traffic and going beyond the obvious – we can read traffic and look for less obvious things like  [ransomware worm] WannaCry and stop that.”

The company also said it was bringing a new feature to [NSX][9] that would let customers with distributed NSX instances manage security and more easily generate and support security policies. 

The feature, NSX Federation, will let users set security policies in one location and distribute and enforce them around the world, Gillis said. The Federation feature makes use of NSX Intelligence, the company’s a distributed analytics engine to analyze workload traffic and generate security policies that can then be distributed as the customer needs.

Experts say the new NSX security features will help customers more effectively secure environments that are more distributed and cannot depend on traditional perimeter-based security systems.

“Administering security in a widely distributed system can be a huge challenge and VMware is beginning to address that issue,” said Lee Doyle,  principal analyst with Doyle Research.  “Customers can choose what security levels or policies to implement in different parts of their network.”

NSX Federation will be part of a future release of the VMware NSX platform and NSX Distributed IDS/IPS will be added when made generally available. Both are in beta today.

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3451998/vmware-amps-security-with-in-house-carbon-black-technology.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.carbonblack.com/2019/10/08/delivering-intrinsic-intelligent-and-informed-security-vmware-completes-acquisition-of-carbon-black/
[2]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[3]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[4]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://www.carbonblack.com/2019/11/05/dell-vmware-carbon-black-better-together/
[7]: https://www.networkworld.com/article/3359242/vmware-firewall-takes-aim-at-defending-apps-in-data-center-cloud.html
[8]: https://www.networkworld.com/article/3367742/exec-how-sdn-sd-wan-security-fit-in-vmwares-strategy.html
[9]: https://blogs.vmware.com/networkvirtualization/2019/11/extending-intrinsic-security.html/
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
