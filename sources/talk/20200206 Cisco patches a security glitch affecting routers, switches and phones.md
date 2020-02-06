[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco patches a security glitch affecting routers, switches and phones)
[#]: via: (https://www.networkworld.com/article/3519691/cisco-patches-a-security-glitch-affecting-routers-switches-and-phones.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco patches a security glitch affecting routers, switches and phones
======
Cisco fixes vulnerabilities in its Cisco Discovery Protocol (CDP) that could let remote attackers take over products without any user interaction
[Nathan Cowley / Ivanastar / Getty Images][1]

Cisco has issued fixes for five security glitches that can be found in a wealth of its networked enterprise products – from switches and routers to web cameras and desktop VoIP phones.  

The problems center around vulnerabilities in the implementation of the Cisco Discovery Protocol (CDP) that could let remote attackers take over the products without any user interaction. While no public exploit has been found, an attacker simply needs to send a maliciously crafted CDP packet to a target device located inside the network to take advantage of the weakness, Cisco stated.

Cisco’s CDP is a Layer 2 protocol that runs on Cisco devices and enables networking applications to learn about directly connected devices nearby, according to Cisco. It enables management of Cisco devices by discovering networked devices, determining how they are configured, and letting systems using different network-layer protocols learn about each other, according to Cisco.

The five vulnerabilities, revealed by Armis Security and dubbed CDPwn, are significant because Layer 2 protocols are the underpinning for all networks, Armis wrote in a [blog][2] about the problems.

“As an attack surface, Layer 2 protocols are an under-researched area and yet are the foundation for the practice of [network segmentation][3]. Network segmentation is utilized as a means to improve network performance and also to provide security. Unfortunately, as this research highlights, the network infrastructure itself is at risk and exploitable by any attacker, so network segmentation is no longer a guaranteed security strategy,” [Armis wrote][4].

Cisco rated the CDP security threats as “High.” The specific warnings include:

  * A CDP vulnerability the [Cisco IP Phone][5] could allow an unauthenticated, adjacent attacker to remotely execute code with root privileges or cause a reload of an affected IP phone. Affected products include a variety of Cisco IP Conference Phones model 6xxx to models 8xxx and Wireless IP Phone 8821, 8821-EX.
  * A CDP implementation in [Cisco NX-OS software][6] could allow an attacker to cause a stack overflow, which could let the attacker execute arbitrary code with administrative privileges on an affected device. Impacted products include Nexus 3000, 5500, 5600, 6000 and 9000 series switches.
  * A CDP vulnerability in the [Cisco Video Surveillance 8000][7] Series IP Cameras could allow the attacker to expose the affected IP Camera for remote code execution or cause it to reload unexpectedly, resulting in a denial of service (DoS) state. This vulnerability affects Cisco Video Surveillance 8000 Series IP Cameras with the Cisco Discovery Protocol enabled when they are running a firmware version earlier than 1.0.7, Cisco stated.
  * A CDP exposure in [Cisco IOS XR software][8] could let an attacker cause a stack overflow, which could allow the attacker to execute arbitrary code with administrative privileges on an affected device. Products impacted include ASR 9000 Series Aggregation Services Routers, IOS XRv 9000 Router, Network Convergence System (NCS) 540, 560, 1000, 5000, 6000 Series Routers. Cisco noted, too, that this vulnerability also affects third-party white-box routers if they have CDP enabled both globally and on at least one interface and if they are running a vulnerable release of Cisco IOSR XR Software.
  * A CDP weakness in [Cisco FXOS Software, Cisco IOS XR Software, and Cisco NX-OS][9] Software could allow an unauthenticated, adjacent attacker to exhaust system memory, causing the device to reload. Affected products include a wide variety of Cisco gear from the ASR 9000 Series Aggregation Services Router and NCS Series Routers to the Nexus family and UCS Series.



Armis said it discovered the bugs in August last year as worked with Cisco to develop patches which [Cisco says are available for free][4]. 

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][10] ]**

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519691/cisco-patches-a-security-glitch-affecting-routers-switches-and-phones.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.pexels.com/photo/man-in-blue-and-brown-plaid-dress-shirt-touching-his-hair-897817/
[2]: https://www.armis.com/cdpwn/#general
[3]: https://www.networkworld.com/article/3247672/what-is-microsegmentation-how-getting-granular-improves-network-security.html
[4]: https://go.armis.com/hubfs/White-papers/Armis-CDPwn-WP.pdf
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-voip-phones-rce-dos
[6]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-nxos-cdp-rce
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-ipcameras-rce-dos
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-iosxr-cdp-rce
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-fxnxos-iosxr-cdp-dos
[10]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
