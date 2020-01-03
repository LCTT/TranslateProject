[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco issues critical security warnings its Data Center Network Manager)
[#]: via: (https://www.networkworld.com/article/3512041/cisco-issues-critical-security-warnings-its-data-center-network-manager.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco issues critical security warnings its Data Center Network Manager
======
Cisco warns of vulnerabilities that can let attackers issue arbitrary actions with administrative permissions.
Metamorworks / Getty Images

[Cisco][1] this week issued software to address multiple critical authentication exposures in its Data Center Network Manager (DCNM) software for its [Nexus][2] data center switches.

DCNM is a central management dashboard for [data-center][3] fabrics based on Cisco Nexus switches and handles a number of core duties such as automation, configuration control, flow policy management and real-time health details for fabric, devices, and network topology.

[See predictions about what's big in IT tech for the coming year.][4]

Cisco said that there were [three exposures][5], which it rated as a 9.8 out of 10 on the Common Vulnerability Scoring System, in the DCNM authentication mechanisms that could let a remote attacker bypass authentication and execute arbitrary actions with administrative privileges on vulnerable devices.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][6] ]**

Cisco said that the vulnerabilities are independent of each other so exploitation of one is not required to exploit another. In addition, a software release that is affected by one of the vulnerabilities may not be affected by the others, the company said.

The critical weaknesses include:

Advertisement

REST API authentication bypass vulnerability: A vulnerability in the [REST API][7] endpoint of Cisco DCNM could allow a remote attacker to bypass authentication. “The vulnerability exists because a static encryption key is shared between installations. An attacker could exploit this vulnerability by using the static key to craft a valid session token. A successful exploit could allow the attacker to perform arbitrary actions through the REST API with administrative privileges,” Cisco stated.  

SOAP API authentication bypass vulnerability: A weakness in the [SOAP API][8] endpoint of Cisco DCNM could let an unauthenticated, remote attacker to bypass authentication on an affected device. Like the REST vulnerability, this problem exists because a static encryption key is shared between installations. Exploits could allow arbitrary actions through the SOAP API with administrative privileges.

Authentication-bypass vulnerability: A weakness in the web-based management interface of Cisco DCNM could also let remote attackers bypass authentication on an affected device. Again, the vulnerability is due to the presence of static credentials that and an attacker could exploit by using them to authenticate against the user interface, Cisco stated. “A successful exploit could allow the attacker to access a specific section of the web interface and obtain certain confidential information from an affected device. This information could be used to conduct further attacks against the system,” Cisco stated. 

There are no workarounds that address these vulnerabilities but Cisco has released a DCNM [software version ][9]that address the problems, the company stated. Cisco said it is not aware of any public announcements about or malicious use of the DCNM vulnerabilities.

### Less severe vulnerabilities

There were numerous additional DCNM vulnerabilities involving the REST and SOAP APIs  with “high” to “medium” threat ratings including:

REST API SQL-injection vulnerability**:** A vulnerability in the REST API of Cisco DCNM could let an authenticated, remote attacker with administrative privileges execute arbitrary SQL commands on an affected device. The vulnerability is due to insufficient validation of user-supplied input to the API and an attacker could exploit this vulnerability by sending a crafted request to the API, [Cisco wrote][10]. A successful exploit could let an attacker view information that they are not authorized to view, make changes to the system that they are not authorized to make, or execute commands within the underlying operating system that may affect the availability of the system.

REST API path-traversal vulnerability: A vulnerability in the REST API of Cisco DCNM could allow an authenticated, remote attacker with administrative privileges to conduct directory-traversal attacks on an affected device. An attacker could exploit this vulnerability by sending a crafted request to the API, which could allow the attacker to read, write, or execute arbitrary files in the system with full administrative privileges. The exposure is due to insufficient validation of user-supplied input to the API, Cisco wrote.

REST API command-injection vulnerability: A weakness in the REST API of Cisco DCNM could allow an authenticated, remote attacker with administrative privileges on the DCNM application to inject arbitrary commands on the underlying OS. An attacker could exploit this vulnerability by sending a crafted request to the API and could let an attacker execute arbitrary commands on the device with full administrative privileges. The vulnerability is due to insufficient validation of user-supplied input to the API, Cisco stated.

SOAP API SQL-injection vulnerability: A weakness in the SOAP API of Cisco DCNM could allow an authenticated, remote attacker with administrative privileges to execute arbitrary SQL commands on an affected device. A successful exploit could allow the attacker to view information that they are not authorized to view, make changes to the system that they are not authorized to make, or execute commands within the underlying operating system that may affect the availability of the device. The problem is due to insufficient validation of user-supplied input to the API, Cisco wrote.

SOAP API path-traversal vulnerability: A vulnerability in the SOAP API of DCNM could allow an authenticated, remote attacker with administrative privileges to conduct directory-traversal attacks on an affected device. A successful exploit could allow the attacker to read, write, or execute arbitrary files in the system with full administrative privileges. Cisco said the vulnerability is due to insufficient validation of user-supplied input to the API.

SOAP API command injection vulnerability: A vulnerability in the SOAP API of DCNM could let an authenticated, remote attacker with administrative privileges on the DCNM application inject arbitrary commands on the underlying OS. An attacker could exploit this vulnerability by sending a crafted request to the API. A successful exploit could let an attacker execute arbitrary commands on the device with full administrative privileges. Cisco said the vulnerability is due to insufficient validation of user-supplied input to the API.

Path-traversal vulnerability: A vulnerability in the Application Framework feature of DCNM could allow an authenticated, remote attacker with administrative privileges to conduct directory traversal attacks on an affected device. An attacker could exploit this vulnerability by sending a crafted request to the application. A successful exploit could allow the attacker to read, write, or execute arbitrary files in the system with full administrative privileges. The vulnerability is due to insufficient validation of user-supplied input to the Application Framework endpoint, Cisco [stated][11].

Cisco has released [software updates][12] that address the vulnerabilities.

Cisco said it fixed all of the vulnerabilities in Cisco DCNM Software releases 11.3.1 and later.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][13]

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3512041/cisco-issues-critical-security-warnings-its-data-center-network-manager.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3487831/what-s-hot-for-cisco-in-2020.html
[2]: https://www.networkworld.com/article/2174731/lan-wan-first-look-cisco-nexus-9000.html
[3]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[4]: https://www.networkworld.com/article/3488562/whats-big-in-it-tech-for-the-coming-year.html
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200102-dcnm-auth-bypass#details
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[7]: https://www.networkworld.com/article/2339954/a-restful-approach-to-web-services.html
[8]: https://en.wikipedia.org/wiki/SOAP
[9]: https://www.cisco.com/c/en/us/products/end-user-license-agreement.html
[10]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200102-dcnm-sql-inject
[11]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20200102-dcnm-comm-inject
[12]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[13]: https://www.networkworld.com/newsletters/signup.html
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
