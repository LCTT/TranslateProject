[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco warns WLAN controller, 9000 series router and IOS/XE users to patch urgent security holes)
[#]: via: (https://www.networkworld.com/article/3390159/cisco-warns-wlan-controller-9000-series-router-and-iosxe-users-to-patch-urgent-security-holes.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco warns WLAN controller, 9000 series router and IOS/XE users to patch urgent security holes
======
Cisco says unpatched vulnerabilities could lead to DoS attacks, arbitrary code execution, take-over of devices.
![Woolzian / Getty Images][1]

Cisco this week issued 31 security advisories but directed customer attention to “critical” patches for its IOS and IOS XE Software Cluster Management and IOS software for Cisco ASR 9000 Series routers. A number of other vulnerabilities also need attention if customers are running Cisco Wireless LAN Controllers.

The [first critical patch][2] has to do with a vulnerability in the Cisco Cluster Management Protocol (CMP) processing code in Cisco IOS and Cisco IOS XE Software that could allow an unauthenticated, remote attacker to send malformed CMP-specific Telnet options while establishing a Telnet session with an affected Cisco device configured to accept Telnet connections. An exploit could allow an attacker to execute arbitrary code and obtain full control of the device or cause a reload of the affected device, Cisco said.

**[ Also see[What to consider when deploying a next generation firewall][3]. | Get regularly scheduled insights by [signing up for Network World newsletters][4]. ]**

The problem has a Common Vulnerability Scoring System number of 9.8 out of 10.

According to Cisco, the Cluster Management Protocol utilizes Telnet internally as a signaling and command protocol between cluster members. The vulnerability is due to the combination of two factors:

  * The failure to restrict the use of CMP-specific Telnet options only to internal, local communications between cluster members and instead accept and process such options over any Telnet connection to an affected device
  * The incorrect processing of malformed CMP-specific Telnet options.



Cisco says the vulnerability can be exploited during Telnet session negotiation over either IPv4 or IPv6. This vulnerability can only be exploited through a Telnet session established _to_ the device; sending the malformed options on Telnet sessions _through_ the device will not trigger the vulnerability.

The company says there are no workarounds for this problem, but disabling Telnet as an allowed protocol for incoming connections would eliminate the exploit vector. Cisco recommends disabling Telnet and using SSH instead. Information on how to do both can be found on the [Cisco Guide to Harden Cisco IOS Devices][5]. For patch information [go here][6].

The second critical patch involves a vulnerability in the sysadmin virtual machine (VM) on Cisco’s ASR 9000 carrier class routers running Cisco IOS XR 64-bit Software could let an unauthenticated, remote attacker access internal applications running on the sysadmin VM, Cisco said in the [advisory][7]. This CVSS also has a 9.8 rating.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][8] ]**

Cisco said the vulnerability is due to incorrect isolation of the secondary management interface from internal sysadmin applications. An attacker could exploit this vulnerability by connecting to one of the listening internal applications. A successful exploit could result in unstable conditions, including both denial of service (DoS) and remote unauthenticated access to the device, Cisco stated.

Cisco has released [free software updates][6] that address the vulnerability described in this advisory.

Lastly, Cisco wrote that [multiple vulnerabilities][9] in the administrative GUI configuration feature of Cisco Wireless LAN Controller (WLC) Software could let an authenticated, remote attacker cause the device to reload unexpectedly during device configuration when the administrator is using this GUI, causing a DoS condition on an affected device. The attacker would need to have valid administrator credentials on the device for this exploit to work, Cisco stated.

“These vulnerabilities are due to incomplete input validation for unexpected configuration options that the attacker could submit while accessing the GUI configuration menus. An attacker could exploit these vulnerabilities by authenticating to the device and submitting crafted user input when using the administrative GUI configuration feature,” Cisco stated.

“These vulnerabilities have a Security Impact Rating (SIR) of High because they could be exploited when the software fix for the Cisco Wireless LAN Controller Cross-Site Request Forgery Vulnerability is not in place,” Cisco stated. “In that case, an unauthenticated attacker who first exploits the cross-site request forgery vulnerability could perform arbitrary commands with the privileges of the administrator user by exploiting the vulnerabilities described in this advisory.”

Cisco has released [software updates][10] that address these vulnerabilities and said that there are no workarounds.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390159/cisco-warns-wlan-controller-9000-series-router-and-iosxe-users-to-patch-urgent-security-holes.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/compromised_data_security_breach_vulnerability_by_woolzian_gettyimages-475563052_2400x1600-100788413-large.jpg
[2]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170317-cmp
[3]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: http://www.cisco.com/c/en/us/support/docs/ip/access-lists/13608-21.html
[6]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190417-asr9k-exr
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190417-wlc-iapp
[10]: https://www.cisco.com/c/en/us/support/web/tsd-cisco-worldwide-contacts.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
