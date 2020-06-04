[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco issues fixes for numerous iOS XE, industrial router vulnerabilities)
[#]: via: (https://www.networkworld.com/article/3561293/cisco-issues-fixes-for-numerous-ios-xe-industrial-router-vulnerabilities.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco issues fixes for numerous iOS XE, industrial router vulnerabilities
======
Cisco issued 23 Security Advisories that describe 25 exposures in its IOS and IOS XE systems
peshkov / Getty / Negative Space

Cisco has unleashed an extensive new round of security warnings – three of them “critical” – mostly for users of its iOS XE software and industrial router family.

In total, Cisco issued [23 Security Advisories][1] that describe 25 exposures in its IOS and IOS XE systems.  

[Network pros react to new Cisco certification curriculum][2]

Beyond the three critical advisories, 20 have a “High” impact rating. Cisco said that one vulnerability affects Cisco IOS, IOS XE, IOS XR, and NX-OS Software. Five vulnerabilities affect both Cisco IOS and IOS XE Software. Six vulnerabilities affect Cisco IOS Software and 10 affect Cisco IOS XE Software. Three vulnerabilities affect the Cisco IOx application environment.

A number of the warnings are for a command-injection vulnerability” that would let an attacker execute commands on the impacted OS.

Cisco has [released free software][3] updates that fix the critical warnings issued this week. The company also said customers can use the [Cisco Software Checker][4] to search for critical or high rated advisories.

The critical warnings include:

  * A [vulnerability][5] rated at 9.8 out of 10 on the Common Vulnerability Scoring System in the authorization controls for the Cisco IOx application-hosting infrastructure in Cisco IOS XE software could let an unauthenticated, remote attacker obtain an authorization token and execute any of the IOx API commands on an affected device. The vulnerability is due to incorrect handling of requests for authorization tokens. An attacker could exploit this vulnerability by using a crafted API call to request such a token.
  * [Multiple weaknesses][6] rated at 9.8 on the CVSS in Cisco IOS software for Cisco 809 and 829 Industrial Integrated Services Routers (Industrial ISRs) and Cisco 1000 Series Connected Grid Routers (CGR1000) could let an unauthenticated, remote attacker or an authenticated local attacker execute arbitrary code on an affected system or cause an affected system to crash and reload. The vulnerability is due to incorrect bounds checking of certain values in packets that are destined for UDP port 9700 of an affected device. An attacker could exploit this vulnerability by sending malicious packets to an affected device. When the packets are processed, an exploitable buffer-overflow condition may occur, Cisco stated.
  * A [vulnerability][7] rated at 8.8 on the CVSS in the implementation of the inter-VM channel of Cisco IOS software for Cisco 809 and 829 Industrial Integrated Services Routers (Industrial ISR) and Cisco 1000 Series Connected Grid Routers (CGR1000) could let an attacker execute arbitrary commands in the context of the Linux shell of the virtual device server (VDS) with the privileges of the  root. Because the device is designed on a hypervisor architecture, exploitation of a vulnerability that affects the inter-VM channel may lead to a complete system compromise. The vulnerability is due to insufficient validation of signaling packets that are destined to the VDS. An attacker could exploit this vulnerability by sending malicious packets to an affected device, Cisco stated.



Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561293/cisco-issues-fixes-for-numerous-ios-xe-industrial-router-vulnerabilities.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://tools.cisco.com/security/center/viewErp.x?alertId=ERP-73388
[2]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[3]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[4]: https://tools.cisco.com/security/center/softwarechecker.x
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-ioxPE-KgGvCAf9
[6]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-ios-iot-rce-xYRSeMNH
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-ios-iot-udp-vds-inj-f2D5Jzrt
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
