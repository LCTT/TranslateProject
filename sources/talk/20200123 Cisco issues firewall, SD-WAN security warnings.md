[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco issues firewall, SD-WAN security warnings)
[#]: via: (https://www.networkworld.com/article/3516110/cisco-issues-firewall-sd-wan-security-warnings.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco issues firewall, SD-WAN security warnings
======
The warning about Cisco Firepower management software is rated critical among 26 other less urgent security advisories it issued.
Thinkstock

Amongst Cisco’s dump of [27 security advisories][1] today only one was rated as critical – a vulnerability in its Firepower [firewall][2] system that could let an attacker bypass authentication and execute arbitrary actions with administrative privileges on a particular device.

The Firepower Management Center (FMC) vulnerability – which was rated at 9.8 out of 10 – comes from improper handling of Lightweight Directory Access Protocol (LDAP) authentication responses from an external authentication server. With it, an attacker could exploit the vulnerability by sending crafted HTTP requests to an affected device and gain administrative access to its web-based management interface.

[Network pros react to new Cisco certification curriculum][3]

Cisco said the vulnerability affects its FMC Software if it is configured to authenticate users of the web-based management interface through an external LDAP server.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][4] ]**

Customers may install a fix either by upgrading to a software release that addresses the flaw or by installing a hotfix patch. A menu of fix options reads:

  * Releases earlier than 6.1.0: Migrate to a 6.2.3 release and apply available hotfixes.
  * 6.1.0: Apply the hotfix (Sourcefire_3D_Defense_Center_S3_Hotfix_ES-6.1.0.8-2.sh) or migrate to a 6.2.3 release and apply available hotfix.
  * 2.0 through 6.2.2: Migrate to a 6.2.3 release and apply available hotfix.
  * 2.3 or 6.3.0: Apply available hotfixes; maintenance releases will be available later this year.
  * 4.0: Apply available hotfixes or upgrade to Release 6.4.0.7.
  * 5.0: Upgrade to 6.5.0.2.



A couple of the other security advisories were directed at Cisco’s [SD-WAN][5] package. The first involves a weakness in Cisco IOS XE SD-WAN Software that could let an unauthenticated, local attacker gain unauthorized access and completely control an affected device.

The vulnerability is due to the existence of default credentials within the default configuration of an affected device, Cisco stated. An attacker who has access to an affected device could log in with elevated privileges. This vulnerability affects Cisco devices that are running Cisco IOS XE SD-WAN Software releases 16.11 and earlier.

The second SD-WAN-related problem is in CLI of the Cisco SD-WAN Solution vManage software. An exploit could let the attacker elevate privileges to root-level privileges.  The vulnerability is due to insufficient input validation. An attacker could exploit this vulnerability by sending a crafted file to the affected system. This vulnerability affects Cisco SD-WAN Solution vManage Software Release 18.4.1, Cisco stated.

Cisco said it has released [software updates][6] for both SD-WAN vulnerabilities.

A couple of the other highly rated vulnerabilities were in Cisco’s [implementation of Border Gateway Protocol (BGP) Ethernet VPN (EVPN)][7] functionality in Cisco IOS XR Software could allow an unauthenticated, remote attacker to cause a denial of service (DoS) condition.

The [other vulnerabilities][8] are due to incorrect processing of BGP update messages that contain crafted EVPN attributes. An attacker could exploit these vulnerabilities by sending BGP EVPN update messages with malformed attributes to be processed by an affected system. A successful exploit could allow the attacker to cause the BGP process to restart unexpectedly, resulting in a DoS condition, Cisco stated.

Cisco has released free [software updates][9] that address the vulnerabilities.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][10]

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3516110/cisco-issues-firewall-sd-wan-security-warnings.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://tools.cisco.com/security/center/publicationListing.x
[2]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[3]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[5]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[6]: http://www.networkworld.com/cms/article/This%20vulnerability%20affects%20Cisco%20SD-WAN%20Solution%20vManage%20Software%20Release%2018.4.1.
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200122-ios-xr-routes
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200122-ios-xr-evpn
[9]: https://tools.cisco.com/security/center/resources/security_vulnerability_policy.html#fixes
[10]: https://www.networkworld.com/newsletters/signup.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
