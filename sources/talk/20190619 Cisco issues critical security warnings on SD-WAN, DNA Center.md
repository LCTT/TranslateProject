[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco issues critical security warnings on SD-WAN, DNA Center)
[#]: via: (https://www.networkworld.com/article/3403349/cisco-issues-critical-security-warnings-on-sd-wan-dna-center.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco issues critical security warnings on SD-WAN, DNA Center
======
Vulnerabilities to Cisco's SD-WAN and DNA Center software top a list of nearly 30 security advisories issued by the company.
![zajcsik \(CC0\)][1]

Cisco has released two critical warnings about security issues with its SD-WAN and DNA Center software packages.

The worse, with a Common Vulnerability Scoring System rating of 9.3 out of 10, is a vulnerability in its [Digital Network Architecture][2] (DNA) Center software that could let an unauthenticated attacker connect an unauthorized network device to the subnet designated for cluster services.

**More about SD-WAN**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][3]
  * [How to pick an off-site data-backup method][4]
  * [SD-Branch: What it is and why you’ll need it][5]
  * [What are the options for security SD-WAN?][6]



A successful exploit could let an attacker reach internal services that are not hardened for external access, Cisco [stated][7]. The vulnerability is due to insufficient access restriction on ports necessary for system operation, and the company discovered the issue during internal security testing, Cisco stated.

Cisco DNA Center gives IT teams the ability to control access through policies using Software-Defined Access, automatically provision through Cisco DNA Automation, virtualize devices through Cisco Network Functions Virtualization (NFV), and lower security risks through segmentation and Encrypted Traffic Analysis.

This vulnerability affects Cisco DNA Center Software releases prior to 1.3, and it is fixed in version 1.3 and releases after that.

Cisco wrote that system updates are available from the Cisco cloud but not from the [Software Center][8] on Cisco.com. To upgrade to a fixed release of Cisco DNA Center Software, administrators can use the “System Updates” feature of the software.

A second critical warning – with a CVVS score of 7.8 – is a weakness in the command-line interface of the Cisco SD-WAN Solution that could let an authenticated local attacker elevate lower-level privileges to the root user on an affected device.

Cisco [wrote][9] that the vulnerability is due to insufficient authorization enforcement. An attacker could exploit this vulnerability by authenticating to the targeted device and executing commands that could lead to elevated privileges. A successful exploit could let the attacker make configuration changes to the system as the root user, the company stated.

This vulnerability affects a range of Cisco products running a release of the Cisco SD-WAN Solution prior to Releases 18.3.6, 18.4.1, and 19.1.0 including:

  * vBond Orchestrator Software
  * vEdge 100 Series Routers
  * vEdge 1000 Series Routers
  * vEdge 2000 Series Routers
  * vEdge 5000 Series Routers
  * vEdge Cloud Router Platform
  * vManage Network Management Software
  * vSmart Controller Software



Cisco said it has released free [software updates][10] that address the vulnerability described in this advisory. Cisco wrote that it fixed this vulnerability in Release 18.4.1 of the Cisco SD-WAN Solution.

The two critical warnings were included in a dump of [nearly 30 security advisories][11].

There were two other “High” impact rated warnings involving the SD-WAN software.

One, a vulnerability in the vManage web-based UI (Web UI) of the Cisco SD-WAN Solution could let an authenticated, remote attacker gain elevated privileges on an affected vManage device, Cisco [wrote][12].

The vulnerability is due to a failure to properly authorize certain user actions in the device configuration. An attacker could exploit this vulnerability by logging in to the vManage Web UI and sending crafted HTTP requests to vManage. A successful exploit could let attackers gain elevated privileges and make changes to the configuration that they would not normally be authorized to make, Cisco stated.

Another vulnerability in the vManage web-based UI could let an authenticated, remote attacker inject arbitrary commands that are executed with root privileges.

This exposure is due to insufficient input validation, Cisco [wrote][13]. An attacker could exploit this vulnerability by authenticating to the device and submitting crafted input to the vManage Web UI.

Both vulnerabilities affect Cisco vManage Network Management Software that is running a release of the Cisco SD-WAN Solution prior to Release 18.4.0 and Cisco has released free [software updates][10] to correct them.

Other high-rated vulnerabilities Cisco disclosed included:

  * A [vulnerability][14] in the Cisco Discovery Protocol (CDP) implementation for the Cisco TelePresence Codec (TC) and Collaboration Endpoint (CE) Software could allow an unauthenticated, adjacent attacker to inject arbitrary shell commands that are executed by the device.
  * A [weakness][15] in the internal packet-processing functionality of the Cisco StarOS operating system running on virtual platforms could allow an unauthenticated, remote attacker to cause an affected device to stop processing traffic, resulting in a denial of service (DoS) condition.
  * A [vulnerability][16] in the web-based management interface of the Cisco RV110W Wireless-N VPN Firewall, Cisco RV130W Wireless-N Multifunction VPN Router, and Cisco RV215W Wireless-N VPN Router could allow an unauthenticated, remote attacker to cause a reload of an affected device, resulting in a denial of service (DoS) condition.



Cisco has [released software][10] fixes for those advisories as well.

Join the Network World communities on [Facebook][17] and [LinkedIn][18] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3403349/cisco-issues-critical-security-warnings-on-sd-wan-dna-center.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/04/lightning_storm_night_gyorgy_karoly_toth_aka_zajcsik_cc0_via_pixabay_1200x800-100754504-large.jpg
[2]: https://www.networkworld.com/article/3401523/cisco-software-to-make-networks-smarter-safer-more-manageable.html
[3]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[4]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[5]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[6]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-dnac-bypass
[8]: https://software.cisco.com/download/home
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-sdwan-privesca
[10]: https://tools.cisco.com/security/center/resources/security_vulnerability_policy.html#fixes
[11]: https://tools.cisco.com/security/center/publicationListing.x?product=Cisco&sort=-day_sir&limit=50#~Vulnerabilities
[12]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-sdwan-privilescal
[13]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-sdwan-cmdinj
[14]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-tele-shell-inj
[15]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-staros-asr-dos
[16]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190619-rvrouters-dos
[17]: https://www.facebook.com/NetworkWorld/
[18]: https://www.linkedin.com/company/network-world
