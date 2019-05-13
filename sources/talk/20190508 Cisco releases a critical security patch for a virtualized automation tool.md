[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco releases a critical security patch for a virtualized automation tool)
[#]: via: (https://www.networkworld.com/article/3394337/cisco-releases-a-critical-security-patch-for-a-virtualized-automation-tool.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco releases a critical security patch for a virtualized automation tool
======
Security hole in Cisco Elastic Services Controller gets a 10 out of 10 vulnerability rating
![Zapp2Photo / Getty Images][1]

Cisco has released a patch for a critical vulnerability in software used to control large virtual environments.

The weakness gets a 10 out of 10 severity score and is found in Cisco’s Elastic Services Controller (ESC), which the company describes as offering a single point of control to manage all aspects of Virtual Network Functions and offers capabilities such as VM and service monitoring, auto-recovery and dynamic scaling. With ESC users control the lifecycle all virtualized resources, whether using Cisco or third-party VNFs, Cisco stated.

[RELATED: What IT admins love/hate about 8 top network monitoring tools][2]

The vulnerability in this case lies in the REST API of ESC and could let an unauthenticated remote attacker to bypass authentication on the REST API and execute arbitrary actions through with administrative privileges on an affected system. The vulnerability is due to improper validation of API requests, [Cisco wrote in its advisory][3].

This vulnerability affects Cisco ESC running Software Release 4.1, 4.2, 4.3 or 4.4 when the REST API is enabled. The REST API is not enabled by default, Cisco noted. The vulnerability is fixed in Cisco Elastic Services Controller Release 4.5.

Cisco said the susceptibility was found during internal security testing and the company is not aware of any public announcements or malicious use of the vulnerability.

Cisco has released free software updates that address this vulnerability and suggests going [here][4] for the fix.

This announcement was Cisco’s second “critical” patch this month. Last week [Cisco said a vulnerability in its Cisco Nexus 9000][5] Series Application Centric Infrastructure (ACI) Mode data center switch that could let an attacker secretly access system resources.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][6] ]**

That patch was part of some 40 security advisories issued last week.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3394337/cisco-releases-a-critical-security-patch-for-a-virtualized-automation-tool.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/digital_security_review_lock_keyhole_network_circuits_by_zapp2photo_gettyimages-675942166_1200x800-100768191-large.jpg
[2]: http://www.networkworld.com/article/3126746/network-management/what-it-admins-love-hate-about-8-top-network-monitoring-tools.html#tk.nww-fsb
[3]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190507-esc-authbypass
[4]: https://tools.cisco.com/security/center/resources/security_vulnerability_policy.html#fixes
[5]: https://www.networkworld.com/article/3392858/cisco-issues-critical-security-warning-for-nexus-data-center-switches.html
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
