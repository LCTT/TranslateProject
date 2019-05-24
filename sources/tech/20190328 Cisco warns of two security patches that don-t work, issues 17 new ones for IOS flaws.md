[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco warns of two security patches that don’t work, issues 17 new ones for IOS flaws)
[#]: via: (https://www.networkworld.com/article/3384742/cisco-warns-of-two-security-patches-that-dont-work-issues-17-new-ones-for-ios-flaws.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco warns of two security patches that don’t work, issues 17 new ones for IOS flaws
======

### Cisco is issuing 17 new fixes for security problems with IOS and IOS/XE software that runs most of its routers and switches, while it has no patch yet to replace flawed patches to RV320 and RV 325 routers.

![Marisa9 / Getty][1]

Cisco has dropped [17 Security advisories describing 19 vulnerabilities][2] in the software that runs most of its routers and switches, IOS and IOS/XE.

The company also announced that two previously issued patches for its RV320 and RV325 Dual Gigabit WAN VPN Routers were “incomplete” and would need to be redone and reissued.

**[ Also see[What to consider when deploying a next generation firewall][3]. | Get regularly scheduled insights by [signing up for Network World newsletters][4]. ]**

Cisco rates both those router vulnerabilities as “High” and describes the problems like this:

  * [One vulnerability][5] is due to improper validation of user-supplied input. An attacker could exploit this vulnerability by sending malicious HTTP POST requests to the web-based management interface of an affected device. A successful exploit could allow the attacker to execute arbitrary commands on the underlying Linux shell as _root_.
  * The [second exposure][6] is due to improper access controls for URLs. An attacker could exploit this vulnerability by connecting to an affected device via HTTP or HTTPS and requesting specific URLs. A successful exploit could allow the attacker to download the router configuration or detailed diagnostic information.



Cisco said firmware updates that address these vulnerabilities are not available and no workarounds exist, but is working on a complete fix for both.

On the IOS front, the company said six of the vulnerabilities affect both Cisco IOS Software and Cisco IOS XE Software, one of the vulnerabilities affects just Cisco IOS software and ten of the vulnerabilities affect just Cisco IOS XE software. Some of the security bugs, which are all rated as “High”, include:

  * [A vulnerability][7] in the web UI of Cisco IOS XE Software could let an unauthenticated, remote attacker access sensitive configuration information.
  * [A vulnerability][8] in Cisco IOS XE Software could let an authenticated, local attacker inject arbitrary commands that are executed with elevated privileges. The vulnerability is due to insufficient input validation of commands supplied by the user. An attacker could exploit this vulnerability by authenticating to a device and submitting crafted input to the affected commands.
  * [A weakness][9] in the ingress traffic validation of Cisco IOS XE Software for Cisco Aggregation Services Router (ASR) 900 Route Switch Processor 3 could let an unauthenticated, adjacent attacker trigger a reload of an affected device, resulting in a denial of service (DoS) condition, Cisco said. The vulnerability exists because the software insufficiently validates ingress traffic on the ASIC used on the RSP3 platform. An attacker could exploit this vulnerability by sending a malformed OSPF version 2 message to an affected device.
  * A problem in the [authorization subsystem][10] of Cisco IOS XE Software could allow an authenticated but unprivileged (level 1), remote attacker to run privileged Cisco IOS commands by using the web UI. The vulnerability is due to improper validation of user privileges of web UI users. An attacker could exploit this vulnerability by submitting a malicious payload to a specific endpoint in the web UI, Cisco said.
  * A vulnerability in the [Cluster Management Protocol][11] (CMP) processing code in Cisco IOS Software and Cisco IOS XE Software could allow an unauthenticated, adjacent attacker to trigger a DoS condition on an affected device. The vulnerability is due to insufficient input validation when processing CMP management packets, Cisco said.



Cisco has released free software updates that address the vulnerabilities described in these advisories and [directs users to their software agreements][12] to find out how they can download the fixes.

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3384742/cisco-warns-of-two-security-patches-that-dont-work-issues-17-new-ones-for-ios-flaws.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/woman-with-hands-over-face_mistake_oops_embarrassed_shy-by-marisa9-getty-100787990-large.jpg
[2]: https://tools.cisco.com/security/center/viewErp.x?alertId=ERP-71135
[3]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190123-rv-inject
[6]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190123-rv-info
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190327-xeid
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190327-xecmd
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190327-rsp3-ospf
[10]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190327-iosxe-privesc
[11]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190327-cmp-dos
[12]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
