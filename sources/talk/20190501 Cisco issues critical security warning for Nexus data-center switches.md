[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco issues critical security warning for Nexus data-center switches)
[#]: via: (https://www.networkworld.com/article/3392858/cisco-issues-critical-security-warning-for-nexus-data-center-switches.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco issues critical security warning for Nexus data-center switches
======
Cisco released 40 security advisories around Nexus switches, Firepower firewalls and more
![Thinkstock][1]

Cisco issued some 40 security advisories today but only one of them was deemed “[critical][2]” – a vulnerability in the Cisco Nexus 9000 Series Application Centric Infrastructure (ACI) Mode data-center switch that could let an attacker secretly access system resources.

The exposure, which was given a Common Vulnerability Scoring System importance of 9.8 out of 10, is described as a problem with secure shell (SSH) key-management for the Cisco Nexus 9000 that lets a remote attacker to connect to the affected system with the privileges of a root user, Cisco said.

**[ Read also:[How to plan a software-defined data-center network][3] ]**

“The vulnerability is due to the presence of a default SSH key pair that is present in all devices. An attacker could exploit this vulnerability by opening an SSH connection via IPv6 to a targeted device using the extracted key materials. This vulnerability is only exploitable over IPv6; IPv4 is not vulnerable," Cisco wrote.

This vulnerability affects Nexus 9000s if they are running a Cisco NX-OS software release prior to 14.1, and the company said there were no workarounds to address the problem.

However, Cisco has [released free software updates][4] that address the vulnerability.

The company also issued a “high” security warning advisory for the Nexus 9000 that involves an exploit that would let attackers execute arbitrary operating-system commands as root on an affected device. To succeed, an attacker would need valid administrator credentials for the device, Cisco said.

The vulnerability is due to overly broad system-file permissions, [Cisco wrote][5]. An attacker could exploit this vulnerability by authenticating to an affected device, creating a crafted command string and writing this crafted string to a specific file location.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][6] ]**

Cisco has released software updates that address this vulnerability.

Two other vulneraries rated “high” also involved the Nexus 9000:

  * [A vulnerability][7] in the background-operations functionality of Cisco Nexus 9000 software could allow an authenticated, local attacker to gain elevated privileges as root on an affected device. The vulnerability is due to insufficient validation of user-supplied files on an affected device. Cisco said an attacker could exploit this vulnerability by logging in to the CLI of the affected device and creating a crafted file in a specific directory on the filesystem.
  * A [weakness][7] in the background-operations functionality of the switch software could allow an attacker to login to the CLI of the affected device and create a crafted file in a specific directory on the filesystem. The vulnerability is due to insufficient validation of user-supplied files on an affected device, Cisco said.



Cisco has [released software][4] for these vulnerabilities as well.

Also part of these security alerts were a number of “high” rated warnings about vulneraries in Cisco’s FirePower firewall series.

For example Cisco [wrote][8] that multiple vulnerabilities in the Server Message Block Protocol preprocessor detection engine for Cisco Firepower Threat Defense Software could allow an unauthenticated, adjacent or remote attacker to cause a denial of service (DoS) condition.

Yet [another vulnerability][9] in the internal packet-processing functionality of Cisco Firepower software for the Cisco Firepower 2100 Series could let an unauthenticated, remote attacker cause an affected device to stop processing traffic, resulting in a DOS situation, Cisco said.

[Software patches][4] are available for these vulnerabilities.

Other products such as the Cisco [Adaptive Security Virtual Appliance][10], and [Web Security appliance][11] had high priority patches as well.

Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3392858/cisco-issues-critical-security-warning-for-nexus-data-center-switches.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/02/lock_broken_unlocked_binary_code_security_circuits_protection_privacy_thinkstock_873916354-100750739-large.jpg
[2]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-nexus9k-sshkey
[3]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[4]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-nexus9k-rpe
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-aci-hw-clock-util
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-frpwr-smb-snort
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-frpwr-dos
[10]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-asa-ipsec-dos
[11]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-wsa-privesc
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
