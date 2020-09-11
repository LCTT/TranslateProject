[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco warns of five SD-WAN security weaknesses)
[#]: via: (https://www.networkworld.com/article/3533550/cisco-warns-of-five-sd-wan-security-weaknesses.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco warns of five SD-WAN security weaknesses
======
Cisco warnings include three high-impact SD-WAN vulnerabilities
[Jaredd Craig][1] [(CC0)][2]

Cisco has issued five  warnings about security weaknesses in its [SD-WAN][3] offerings, three of them on the high-end of the vulnerability scale.

The worst problem is with the command-line interface (CLI) of its [SD-WAN][4] Solution software where a weakness could let a local attacker inject arbitrary commands that are executed with root privileges, Cisco [wrote.][5]

[[Get regularly scheduled insights by signing up for Network World newsletters.]][6]

An attacker could exploit this vulnerability – which has a 7.8 out if 10 on  the Common Vulnerability Scoring System – by authenticating to the device and submitting crafted input to the CLI utility. The attacker must be authenticated to access the CLI utility. The vulnerability is due to insufficient input validation, Cisco wrote.

Another high warning problem lets an authenticated, local attacker elevate privileges to root on the underlying operating system.  An attacker could exploit this vulnerability by sending a crafted request to an affected system. A successful exploit could allow the attacker to gain root-level privileges, Cisco [wrote][7].  The vulnerability is due to insufficient input validation.

The third high-level vulnerability in the SD-WAN Solution software could let an attacker cause a buffer overflow on an affected device. An attacker could exploit this vulnerability by sending crafted traffic to an affected device. A successful exploit could allow the attacker to gain access to information that they are not authorized to access and make changes to the system that they are not authorized to make, Cisco [wrote][8].

The vulnerabilities affect a number of Cisco products if they are running a Cisco SD-WAN Solution software release earlier than Release 19.2.2: vBond Orchestrator Software, vEdge 100-5000 Series Routers, vManage Network Management System and vSmart Controller Software.

Cisco said there were no workarounds for any of the vulnerabilities and it suggested users accept automatic software updates to allay exploit risks. There are [software fixes for the problems][9] as well. 

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][10] ]**

All three of the high-level warnings were reported to Cisco by the Orange Group, Cisco said.

The other two SD-WAN Solution software warnings – with medium threat levels -- include a one that allows a cross-site scripting (XSS) attack against the web-based management interface of the vManage software and SQL injection threat.

The [XXS vulnerability][11] is due to insufficient validation of user-supplied input by the web-based management interface. An attacker could exploit this vulnerability by persuading a user of the interface to click a crafted link. A successful exploit could allow the attacker to execute arbitrary script code in the context of the interface or to access sensitive, browser-based information.

The SQL vulnerability exists because the web UI improperly validates SQL values. An attacker could exploit this vulnerability by authenticating to the application and sending malicious SQL queries to an affected system. A successful exploit could let the attacker  modify values on, or return values from, the underlying database as well as the operating system, Cisco [wrote][12].

Cisco recognized Julien Legras and Thomas Etrillard of Synacktiv for reporting the problems.

The company said release 19.2.2 of the [Cisco SD-WAN Solution][13] contains fixes for all five vulnerabilities.

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3533550/cisco-warns-of-five-sd-wan-security-weaknesses.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/T15gG5nA9Xk
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[4]: https://www.networkworld.com/article/3527194/multicloud-security-integration-drive-massive-sd-wan-adoption.html
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwclici-cvrQpH9v
[6]: https://www.networkworld.com/newsletters/signup.html
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwpresc-ySJGvE9
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-sdwanbo-QKcABnS2
[9]: https://software.cisco.com/download/home
[10]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[11]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200318-vmanage-xss
[12]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200318-vmanage-cypher-inject
[13]: https://www.cisco.com/c/en/us/solutions/enterprise-networks/sd-wan/index.html#~benefits
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
