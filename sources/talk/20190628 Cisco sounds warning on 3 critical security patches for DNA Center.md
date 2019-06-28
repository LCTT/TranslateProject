[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco sounds warning on 3 critical security patches for DNA Center)
[#]: via: (https://www.networkworld.com/article/3405901/cisco-sounds-warning-on-3-critical-security-patches-for-dna-center.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco sounds warning on 3 critical security patches for DNA Center
======
The two worst security problems involve Cisco Data Center Network Manager (DCNM)
![Matejmo][1]

Cisco issued three “critical” security warnings for its DNA Center users – two having a Common Vulnerability Scoring System rating of 9.8 out of 10.

The two worst problems involve Cisco Data Center Network Manager (DCNM).  Cisco DNA Center controls access through policies using Software-Defined Access, automatically provision through Cisco DNA Automation, virtualize devices through Cisco Network Functions Virtualization (NFV), and lower security risks through segmentation and Encrypted Traffic Analysis.

**More about SD-WAN**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][2]
  * [How to pick an off-site data-backup method][3]
  * [SD-Branch: What it is and why you’ll need it][4]
  * [What are the options for security SD-WAN?][5]



In [one advisory][6] Cisco said a vulnerability in the web-based management interface of DCNM could let an attacker obtain a valid session cookie without knowing the administrative user password by sending a specially crafted HTTP request to a specific web servlet that is available on affected devices. The vulnerability is due to improper session management on affected DCNM software.

The vulnerability affects DCNM software releases prior to Release 11.1(1). Cisco said it removed the affected web servlet completely in DCNM Software Release 11.1(1).

[Another critical warning][7] was issued for DCNM on a vulnerability that lets an attacker create arbitrary files on the underlying DCNM filesystem by sending specially crafted data to a specific web servlet that is available on affected devices.  

Cisco said the vulnerability is due to incorrect permission settings in affected DCNM software. A successful exploit could allow the attacker to write arbitrary files on the filesystem and execute code with root privileges on the affected device.

In DCNM Software Release 11.0(1) and earlier, an attacker would need to be authenticated to the DCNM web-based management interface to exploit this vulnerability, Cisco said.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][8] ]**

The [third vulnerability][9] – with a CVSS score of 9.3 – defines a vulnerability in DNA Center that could let an unauthenticated, adjacent attacker bypass authentication and access critical internal services. An attacker could exploit this vulnerability by connecting an unauthorized network device to the subnet designated for cluster services. A successful exploit could allow an attacker to reach internal services that are not hardened for external access, Cisco said.

The vulnerability is due to insufficient access restriction to ports necessary for system operation, the company stated. 

In this case Cisco said a workaround is available for customers who cannot upgrade to a fixed release. To coordinate implementation of the workaround, contact the [Cisco Technical Assistance Center (TAC)][10].

Cisco said it has released free [software updates][11] that address the vulnerabilities described in these advisories.  

The critical warnings this week follow another critical DNA Center notice last week. Then Cisco detailed a critical warning – with a CVSS rating of 9.3 – about vulnerability in its DNA Center software that could let an unauthenticated attacker exploit this weakness by connecting an unauthorized network device to the subnet designated for cluster services.

A successful exploit could let an attacker reach internal services that are not hardened for external access, Cisco [stated][9].  The vulnerability is due to insufficient access restriction to ports necessary for system operation, and Cisco discovered the issue during internal security testing, the company stated.

This vulnerability affects Cisco DNA Center Software releases prior to 1.3, and it is fixed in version 1.3 and releases after that.   

Cisco wrote that system updates are available for installation from the Cisco cloud and are not available for download from the [Software Center][12] on Cisco.com. To upgrade to a fixed release of Cisco DNA Center Software, administrators can use the System Updates feature of the software.

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3405901/cisco-sounds-warning-on-3-critical-security-patches-for-dna-center.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/cso_binary_warnings_alerts_mistakes_intrusions_exclamation_marks_locks_by_matejmo_gettyimages-901630486_2400x1600-100800256-large.jpg
[2]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[3]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[4]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[5]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[6]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190626-dcnm-bypass
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190626-dcnm-codex
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-dnac-bypass
[10]: https://www.cisco.com/go/tac/
[11]: https://tools.cisco.com/security/center/resources/security_vulnerability_policy.html#fixes
[12]: https://software.cisco.com/download/home
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
