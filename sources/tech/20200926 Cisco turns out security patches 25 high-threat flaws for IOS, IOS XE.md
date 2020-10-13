[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco turns out security patches 25 high-threat flaws for IOS, IOS XE)
[#]: via: (https://www.networkworld.com/article/3583654/cisco-turns-out-security-patches-25-high-threat-flaws-for-ios-ios-xe.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco turns out security patches 25 high-threat flaws for IOS, IOS XE
======
Cisco this week posted 25 security advisories defining 34 vulnerabilities rated high that should be fixed right away
[Nathan Cowley / Ivanastar / Getty Images][1]

If you are a security admin with lots of systems running Cisco IOS and IOS XE software today is decidedly not your day.

Cisco this week posted 25 “High” rated security advisories that stem from 34 vulnerabilities the company suggests should be fixed as soon as possible. The vulnerabilities impact a wide-range of Cisco gear as IOS and IOS XE are the company’s most widely used operating systems. The warnings affect firewalls, wireless access points and switches.

[Network pros react to new Cisco certification curriculum][2]

For example, one of the highest rated threats--with an 8.6 out of 10 threat level, are [multiple vulnerabilities][3] in the Zone-Based Firewall feature of Cisco IOS XE Software that could let an remote attacker to cause the device to reload or stop forwarding traffic through the [firewall][4],resulting in a denial of service (DoS).

Cisco stated that the vulnerabilities are due to incomplete handling of Layer 4 packets through the device. An attacker could exploit these vulnerabilities by sending a certain sequence of traffic patterns through the device. 

Another 8.6-rated vulnerability involves the [Split DNS feature][5] of Cisco IOS Software and Cisco IOS XE Software could let an unauthenticated, remote attacker cause an affected device to reload, resulting in a DoS condition.

“The vulnerability occurs because the regular expression (regex) engine that is used with the Split [DNS][6] feature of affected releases may time out when it processes the DNS name list configuration. An attacker could exploit this vulnerability by trying to resolve an address or hostname that the affected device handles,” Cisco stated.

Still another 8.6-rated security threat involves a vulnerability in the [DHCP][7] message handler of Cisco IOS XE Software for Cisco cBR-8 Converged Broadband Routers.  The vulnerability is due to insufficient error handling when DHCP version 4 (DHCPv4) messages are parsed. An attacker could exploit this vulnerability by sending a malicious DHCPv4 message to or through a WAN interface of an affected device. A successful exploit could allow the attacker to cause a reload of the affected device, Cisco stated.

Some of the other threat advisories include:

  * A vulnerability in the [WPA2 and WPA3 security implementation][8] of Cisco IOS XE Wireless Controller Software for the Cisco Catalyst 9000 Family could let an unauthenticated, adjacent attacker send a crafted authentication packet to an affected device. A successful exploit could cause it to reload, resulting in a DoS condition. The vulnerability is due to incorrect packet processing during the WPA2 and WPA3 authentication handshake when configured for dot1x or pre-shared key (PSK) authentication key management (AKM) with 802.11r BSS Fast Transition (FT) enabled, Cisco stated.
  * A vulnerability in the [Umbrella Connector][9] component of Cisco IOS XE Software for Cisco Catalyst 9200 Series Switches could allow an unauthenticated, remote attacker to trigger a reload, resulting in a DOS condition on an affected device. The vulnerability is due to insufficient error handling when parsing DNS requests. An attacker could exploit this vulnerability by sending a series of malicious DNS requests to an Umbrella Connector client interface of an affected device.
  * Multiple vulnerabilities in the [web management framework of Cisco IOS XE][10] Software could allow an authenticated, remote attacker with read-only privileges to elevate them to _Administrator_ on an affected device. For example, a vulnerability in the APIs of the web management framework of Cisco IOS XE Software could lead to such an attack. Another weakness in the authentication controls of the web management framework of Cisco IOS XE Software could allow an authenticated, remote attacker with read-only privileges to elevate privileges to _Administrator_ on an affected device.



Workarounds are not available, but patches or software updates addressing all of the vulnerabilities are [available][11], Cisco stated.

Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3583654/cisco-turns-out-security-patches-25-high-threat-flaws-for-ios-ios-xe.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.pexels.com/photo/man-in-blue-and-brown-plaid-dress-shirt-touching-his-hair-897817/
[2]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[3]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-zbfw-94ckG4G
[4]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-splitdns-SPWqpdGW
[6]: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html
[7]: https://www.networkworld.com/article/3299438/dhcp-defined-and-how-it-works.html
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-wpa-dos-cXshjerc
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-iosxe-umbrella-dos-t2QMUX37
[10]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-ios-webui-priv-esc-K8zvEWM#d
[11]: https://tools.cisco.com/security/center/home.x
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
