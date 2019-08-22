[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco: 6 critical security alarms for UCS software, small-biz routers)
[#]: via: (https://www.networkworld.com/article/3433516/cisco-6-critical-security-alarms-for-ucs-software-small-biz-routers.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco: 6 critical security alarms for UCS software, small-biz routers
======
Cisco finds critical bugs in its Unified communications Director and Director Express software for Big Data packages as well as its Small Business 220 Series Smart Switches.
![Jaredd Craig \(CC0\)][1]

Cisco today warned its Unified Computing System (UCS) customers about four critical fixes they need to make to stop nefarious agents from taking over or attacking their systems.The problems all have a severity rating of 9.8 out of 10 on the Common Vulnerability Scoring System ([CVSS][2]).

The critical bugs are found in the Cisco UCS Director and UCS Director Express for [Big Data][3] packages.

**[ To learn about IoT security, see [our corporate guide to addressing IoT security concerns][4]. | Get regularly scheduled insights by [signing up for Network World newsletters][5]. ]**

UCS Director lets customers build private-cloud systems and supports automated provisioning processes and orchestration to optimize and simplify delivery of data-center resources, the company said. 

Cisco UCS Director Express for Big Data automates [Hadoop deployment][6] on the Cisco UCS Common Platform Architecture for Big Data infrastructure. It also provides a single management pane across both physical infrastructure and Hadoop software. Cisco says the UCS Director Express for Big Data is an open private-cloud platform that delivers on-premises Big-Data-as-a-Service (BDaaS) from the core to the edge.

“Automated workflows configure, deploy, and manage the infrastructure resources and big-data platforms such as Hadoop and Splunk Enterprise across Cisco UCS Integrated Infrastructure for Big Data and Analytics – a general-purpose converged infrastructure for big data,” the company stated.

Cisco describes the vulnerabilities as follows:

  * A [weakness in the web-based management interface][7] of Cisco UCS Director and Cisco UCS Director Express for Big Data could let an unauthenticated, remote attacker bypass authentication and execute arbitrary actions with administrator privileges on an affected system. A successful exploit could allow an unprivileged attacker to access and execute arbitrary actions through certain APIs. The vulnerability is due to improper authentication-request handling. An attacker could exploit this vulnerability by sending crafted HTTP requests to an affected device.
  * A [vulnerability in both the products][8] could let an unauthenticated remote attacker login to the command-line interface of an affected system by using the SCP User account (scpuser), which has default user credentials. The vulnerability is due to the presence of a documented default account with an undocumented default password and incorrect permission settings for that account. Changing the default password for this account is not enforced during the installation of the product. An attacker could exploit this vulnerability by using the account to log in to an affected system. A successful exploit could allow the attacker to execute arbitrary commands with the privileges of the scpuser account. This includes full read and write access to the system's database.
  * An [exposure in the web-based management interface][9] to both products could let an unauthenticated, remote attacker acquire a valid session token with administrator privileges, bypassing user authentication. The vulnerability is due to insufficient request-header validation during the authentication process and an attacker could exploit this vulnerability by sending a series of malicious requests to an affected device. An exploit could let the attacker use the acquired session token to gain full administrator access to the affected device.
  * The [final][10] two [critical][9] advisories are around similar problems.  An exposure in the web-based management interface to both products could let an unauthenticated, remote attacker acquire a valid session token with administrator privileges, bypassing user authentication. The vulnerability is due to insufficient request header validation during the authentication process and an attacker could exploit this vulnerability by sending a series of malicious requests to an affected device. An exploit could let the attacker use the acquired session token to gain full administrator access to the affected device. Cisco has released free software fixes to handle the vulnerabilities. Customers may only install and expect support for software versions and feature sets for which they have purchased a [license][11].



Two other critical warning were also issued involving the company’s Small Business 220 Series Smart Switches. 

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][12] ]**

In the [first warning][13] Cisco wrote that multiple vulnerabilities in the web management interface of Cisco Small Business 220 Series Smart Switches could let an unauthenticated, remote attacker to overflow a buffer, which then allows the execution of arbitrary code with root privileges on the underlying operating system.

“The vulnerabilities are due to insufficient validation of user-supplied input and improper boundary checks when reading data into an internal buffer. An attacker could exploit these vulnerabilities by sending malicious requests to the web management interface of an affected device. Depending on the configuration of the affected switch, the malicious requests must be sent via HTTP or HTTPS,” Cisco stated. 

The [second warning][14] described a weakness due to incomplete authorization checks in the web management interface. An attacker could exploit this vulnerability by sending a malicious request to certain parts of the web management interface, and a successful exploit could let the attacker modify the configuration of an affected device or to inject a reverse shell.

Cisco has released software to fix the 220 switch problems. 

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433516/cisco-6-critical-security-alarms-for-ucs-software-small-biz-routers.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/fear_stress_debilitation_weakness_exhaustion_fatigue_someone_crouching_head_in_hands_by_jaredd_craig_cc0_via_unsplash_1200x800-100766361-large.jpg
[2]: https://tools.cisco.com/security/center/cvssCalculator.x?version=3.0&vector=CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H
[3]: https://www.cisco.com/c/en/us/solutions/data-center-virtualization/big-data/index.html
[4]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: http://blogs.cisco.com/datacenter/ucsd-express-big-data
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190821-ucsd-authbypass
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190821-imcs-usercred
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190821-imcs-ucs-authbypass
[10]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190821-imcs-ucs-authby
[11]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[12]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[13]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190806-sb220-rce
[14]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190806-sb220-auth_bypass
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
