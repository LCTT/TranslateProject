[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco: 13 IOS, IOS XE security flaws you should patch now)
[#]: via: (https://www.networkworld.com/article/3441221/cisco-13-ios-ios-xe-security-flaws-you-should-patch-now.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco: 13 IOS, IOS XE security flaws you should patch now
======
Cisco says vulnerabilities in IOS/IOS XE could cause DOS situation; warns on Traceroute setting
Woolzian / Getty Images

Cisco this week warned its IOS and IOS XE customers of 13 vulnerabilities in the operating system software they should patch as soon as possible.

All of the vulnerabilities – revealed in the company’s semiannual [IOS and IOS XE Software Security Advisory Bundle][1] – have a security impact rating (SIR) of "high". Successful exploitation of the vulnerabilities could allow an attacker to gain unauthorized access to, conduct a command injection attack on, or cause a denial of service (DoS) condition on an affected device, Cisco stated. 

["How to determine if Wi-Fi 6 is right for you"][2]

Two of the vulnerabilities affect both Cisco IOS Software and Cisco IOS XE Software. Two others affect Cisco IOS Software, and eight of the vulnerabilities affect Cisco IOS XE Software. The final one affects the Cisco IOx application environment. Cisco has confirmed that none of the vulnerabilities affect Cisco IOS XR Software or Cisco NX-OS Software.  Cisco [has released software updates][3] that address these problems.

Some of the worst exposures include:

  * A [vulnerability in the IOx application environment][4] for Cisco IOS Software could let an authenticated, remote attacker gain unauthorized access to the Guest Operating System (Guest OS) running on an affected device. The vulnerability is due to incorrect role-based access control (RBAC) evaluation when a low-privileged user requests access to a Guest OS that should be restricted to administrative accounts. An attacker could exploit this vulnerability by authenticating to the Guest OS by using the low-privileged-user credentials. An exploit could allow the attacker to gain unauthorized access to the Guest OS as a root.This vulnerability affects Cisco 800 Series Industrial Integrated Services Routers and Cisco 1000 Series Connected Grid Routers (CGR 1000) that are running a vulnerable release of Cisco IOS Software with Guest OS installed.  While Cisco did not rate this vulnerability as critical, it did have a Common Vulnerability Scoring System (CVSS) of 9.9 out of 10.  Cisco recommends disabling the guest feature until a proper fix is installed.
  * An exposure in the [Ident protocol handler of Cisco IOS and IOS XE][5] software could allow a remote attacker to cause an affected device to reload. The problem exists because the affected software incorrectly handles memory structures, leading to a NULL pointer dereference, Cisco stated. An attacker could exploit this vulnerability by opening a TCP connection to specific ports and sending traffic over that connection. A successful exploit could let the attacker cause the affected device to reload, resulting in a denial of service (DoS) condition. This vulnerability affects Cisco devices that are running a vulnerable release of Cisco IOS or IOS XE Software and that are configured to respond to Ident protocol requests.
  * A vulnerability in the [common Session Initiation Protocol (SIP) library][6] of Cisco IOS and IOS XE Software could let an unauthenticated, remote attacker trigger a reload of an affected device, resulting in a denial of service (DoS). The vulnerability is due to insufficient sanity checks on an internal data structure. An attacker could exploit this vulnerability by sending a sequence of malicious SIP messages to an affected device. An exploit could allow the attacker to cause a NULL pointer dereference, resulting in a crash of the _iosd_ This triggers a reload of the device, Cisco stated.
  * A [vulnerability in the ingress packet-processing][7] function of Cisco IOS Software for Cisco Catalyst 4000 Series Switches could let an aggressor cause a denial of service (DoS). The vulnerability is due to improper resource allocation when processing TCP packets directed to the device on specific Cisco Catalyst 4000 switches. An attacker could exploit this vulnerability by sending crafted TCP streams to an affected device. A successful exploit could cause the affected device to run out of buffer resources, impairing operations of control-plane and management-plane protocols, resulting in a DoS condition. This vulnerability can be triggered only by traffic that is destined to an affected device and cannot be exploited using traffic that transits an affected device Cisco stated.



In addition to the warnings, Cisco also [issued an advisory][8] for users to deal with problems in its IOS and IOS XE  Layer 2 (L2) traceroute utility program.  The traceroute identifies the L2 path that a packet takes from a source device to a destination device.

Cisco said that by design, the L2 traceroute server does not require authentication, but it allows certain information about an affected device to be read, including Hostname, hardware model, configured interfaces, IP addresses and other details.  Reading this information from multiple switches in the network could allow an attacker to build a complete L2 topology map of that network.

Depending on whether the L2 traceroute feature is used in the environment and whether the Cisco IOS or IOS XE Software release supports the CLI commands to implement the respective option, Cisco said there are several ways to secure the L2 traceroute server: disable it, restrict access to it through infrastructure access control lists (iACLs), restrict access through control plane policing (CoPP), and upgrade to a software release that disables the server by default.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][9] ]**

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3441221/cisco-13-ios-ios-xe-security-flaws-you-should-patch-now.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://tools.cisco.com/security/center/viewErp.x?alertId=ERP-72547
[2]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[3]: https://tools.cisco.com/security/center/softwarechecker.x
[4]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190925-ios-gos-auth
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190925-identd-dos
[6]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190925-sip-dos
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190925-cat4000-tcp-dos
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190925-l2-traceroute
[9]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
