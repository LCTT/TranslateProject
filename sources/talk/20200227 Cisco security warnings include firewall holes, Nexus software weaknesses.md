[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco security warnings include firewall holes, Nexus software weaknesses)
[#]: via: (https://www.networkworld.com/article/3529383/cisco-security-warnings-include-firewall-holes-nexus-software-weaknesses.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco security warnings include firewall holes, Nexus software weaknesses
======
Cisco details security vulnerability warnings with Firepower firewall (FXOS), Unified Computing System software and Nexus (NX-OS) switch operating system.
Arkadiusz Wargua / Getty Images

Cisco has issued another batch of security warnings that include problems in its Firepower [firewall][1] (FXOS),  Unified Computing System (UCS) software and Nexus switch operating system (NX-OS) .

[Network pros react to new Cisco certification curriculum][2]

The firewall and UCS vulnerabilities all have a severity level of “high” on the Common Vulnerability Scoring System and include:

  * A vulnerability in the CLI of Cisco FXOS Software and Cisco UCS Manager Software could let an authenticated, local attacker execute arbitrary commands on the underlying operating system (OS). The vulnerability is due to insufficient input validation. A successful exploit could allow the attacker to execute arbitrary commands on the underlying OS with the privileges of the currently logged-in user for all affected platforms excluding Cisco UCS 6400 Series Fabric Interconnects. On Cisco UCS 6400 Series Fabric Interconnects, the injected commands are executed with root privileges, [Cisco stated][3].
  * A [second vulnerability][4] in the local management of the same CLI interface in  Cisco FXOS Software and Cisco UCS Manager Software could allow similar problems.
  * A weakness in the Cisco Discovery Protocol feature of Cisco FXOS Software and Cisco NX-OS Software could let an unauthenticated, adjacent attacker exploit this vulnerability by sending a crafted Cisco Discovery Protocol packet to a Layer 2-adjacent affected device. (Cisco Discovery Protocol is a Layer 2 protocol.) To exploit this vulnerability, an attacker must be Layer 2 adjacent – in the same broadcast domain – as the affected device  A successful exploit could lead to a buffer overflow that could then allow attackers to execute arbitrary code as root or cause a DoS condition on the affected device. The vulnerability exists because of insufficiently validated Cisco Discovery Protocol packet headers, Cisco [stated][5].



Cisco also noted that this problem is different from the ones it detailed earlier this month here: [Cisco FXOS, IOS XR, and NX-OS Software Cisco Discovery Protocol Denial of Service Vulnerability][6] and [Cisco NX-OS Software Cisco Discovery Protocol Remote Code Execution Vulnerability][7].

These vulnerabilities were found by Cisco during internal security testing and the company has released [software updates][8] that address the issues.

Other security problems with a high rating include one in the resource-handling system of Cisco NX-OS Software for Cisco MDS 9000 Series Multilayer Switches that could let an attacker set off a DoS attack. An attacker could exploit this vulnerability by sending traffic to the management interface (mgmt0) of an affected device at very high rates. An exploit could allow the attacker to cause unexpected behaviors such as high CPU usage, process crashes, or even full system reboots of an affected device. The vulnerability is due to improper resource usage control, Cisco [stated][9].  Cisco has addressed the vulnerability and more information can be found [here][10].

Another vulnerably with a high rating was found in the Secure Login Enhancements capability of Cisco Nexus 1000V Switch for VMware vSphere.  This weakness could let an attacker perform a high amount of login attempts against the affected device. A successful exploit could cause the affected device to become inaccessible to other users, resulting in a DoS situation.  The vulnerability is due to improper resource allocation during failed CLI login attempts when login parameters that are part of the Secure Login Enhancements capability are configured on an affected device, Cisco [stated][11].  Cisco has released [software updates][12] that address this vulnerability.

Cisco issued a number of other NS-OX vulnerability warnings that garnered “medium” level notices including issues with [Border Gateway Protocol][13], [Address Resolution Protocol][14] and the [NX-API system][15].

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][16] ]**

Join the Network World communities on [Facebook][17] and [LinkedIn][18] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3529383/cisco-security-warnings-include-firewall-holes-nexus-software-weaknesses.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[2]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[3]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-fxos-ucs-cmdinj
[4]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-fxos-ucs-cli-cmdinj
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-fxos-nxos-cdp
[6]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-fxnxos-iosxr-cdp-dos
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200205-nxos-cdp-rce
[8]: https://tools.cisco.com/security/center/viewErp.x?alertId=ERP-73749
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-mds-ovrld-dos
[10]: https://tools.cisco.com/security/center/resources/security_vulnerability_policy.html#fixes
[11]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-nexus-1000v-dos
[12]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[13]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-nxos-bgpmd5
[14]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-nxos-arp
[15]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200226-nxos-api-dos
[16]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[17]: https://www.facebook.com/NetworkWorld/
[18]: https://www.linkedin.com/company/network-world
