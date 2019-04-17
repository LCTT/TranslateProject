[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Gov’t warns on VPN security bug in Cisco, Palo Alto, F5, Pulse software)
[#]: via: (https://www.networkworld.com/article/3388646/govt-warns-on-vpn-security-bug-in-cisco-palo-alto-f5-pulse-software.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Gov’t warns on VPN security bug in Cisco, Palo Alto, F5, Pulse software
======
VPN packages from Cisco, Palo Alto, F5 and Pulse may improperly secure tokens and cookies
![Getty Images][1]

The Department of Homeland Security has issued a warning that some [VPN][2] packages from Cisco, Palo Alto, F5 and Pulse may improperly secure tokens and cookies, allowing nefarious actors an opening to invade and take control over an end user’s system.

The DHS’s Cybersecurity and Infrastructure Security Agency (CISA) [warning][3] comes on the heels of a notice from Carnegie Mellon's CERT that multiple VPN applications store the authentication and/or session cookies insecurely in memory and/or log files.

**[Also see:[What to consider when deploying a next generation firewall][4]. Get regularly scheduled insights by [signing up for Network World newsletters][5]]**

“If an attacker has persistent access to a VPN user's endpoint or exfiltrates the cookie using other methods, they can replay the session and bypass other authentication methods,” [CERT wrote][6]. “An attacker would then have access to the same applications that the user does through their VPN session.”

According to the CERT warning, the following products and versions store the cookie insecurely in log files:

  * Palo Alto Networks GlobalProtect Agent 4.1.0 for Windows and GlobalProtect Agent 4.1.10 and earlier for macOS0 ([CVE-2019-1573][7])
  * Pulse Secure Connect Secure prior to 8.1R14, 8.2, 8.3R6, and 9.0R2.



The following products and versions store the cookie insecurely in memory:

  * Palo Alto Networks GlobalProtect Agent 4.1.0 for Windows and GlobalProtect Agent 4.1.10 and earlier for macOS0.
  * Pulse Secure Connect Secure prior to 8.1R14, 8.2, 8.3R6, and 9.0R2.
  * Cisco AnyConnect 4.7.x and prior.



CERT says that Palo Alto Networks GlobalProtect version 4.1.1 [patches][8] this vulnerability.

F5 said it was aware of both vulnerabilities and has issued advisories for both [CVE-2013-6024][9]and [CVE-2017-6139][10]. The severity of CVE-2013-6024 is low and F5 provided guidance to customers on how to mitigate. CVE-2017-6139 has been fixed in BIG-IP 12.1.3, 13.1.0 and 13.0.1 and customers can eliminate the vulnerability by upgrading to one of these versions. F5 has not received reports from customers of these vulnerabilities being exploited.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][11] ]**

CERT said it is unaware of any patches at the time of publishing for Cisco AnyConnect.

Pulse said it was notified by CERT with regards to a vulnerability. This vulnerability affects older versions of Pulse Secure Desktop and Network Connect clients. However, Pulse Secure had already fixed this vulnerability in the latest Pulse Desktop Client and Network Connect product. Pulse issued a related Security Advisory to disclose this to the public - [Security Advisory – SA44114][12].

CERT credited the [National Defense ISAC Remote Access Working Group][13] for reporting the vulnerability.

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3388646/govt-warns-on-vpn-security-bug-in-cisco-palo-alto-f5-pulse-software.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/10/broken-chain_metal_link_breach_security-100777433-large.jpg
[2]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[3]: https://www.us-cert.gov/ncas/current-activity/2019/04/12/Vulnerability-Multiple-VPN-Applications
[4]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://www.kb.cert.org/vuls/id/192371/
[7]: https://nvd.nist.gov/vuln/detail/CVE-2019-1573
[8]: https://securityadvisories.paloaltonetworks.com/Home/Detail/146
[9]: https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsupport.f5.com%2Fcsp%2Farticle%2FK14969&data=02%7C01%7Cshuerta%40we-worldwide.com%7C42c05a3bf228485df63708d6c1c94a8a%7C3ed60ab455674971a5341a5f0f7cc7f5%7C0%7C0%7C636909467626619415&sdata=dJc4KMoz526RHPVvtQZf%2FEv10FYgbqP5GIChysedvBo%3D&reserved=0
[10]: https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsupport.f5.com%2Fcsp%2Farticle%2FK45432295&data=02%7C01%7Cshuerta%40we-worldwide.com%7C42c05a3bf228485df63708d6c1c94a8a%7C3ed60ab455674971a5341a5f0f7cc7f5%7C0%7C0%7C636909467626629420&sdata=jB%2B%2FbFOWOgk2gVSmLCcx48nb1OusuXj1GKP5ZMoCkcs%3D&reserved=0
[11]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[12]: https://kb.pulsesecure.net/articles/Pulse_Security_Advisories/SA44114/?l=en_US&atype=sa&fs=Search&pn=1&atype=sa
[13]: https://ndisac.org/workinggroups/
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
