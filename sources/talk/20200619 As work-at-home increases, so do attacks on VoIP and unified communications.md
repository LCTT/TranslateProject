[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (As work-at-home increases, so do attacks on VoIP and unified communications)
[#]: via: (https://www.networkworld.com/article/3563549/as-work-at-home-increases-so-do-attacks-on-voip-and-unified-communications.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

As work-at-home increases, so do attacks on VoIP and unified communications
======

[Zoom][1]

Businesses use on-prem and cloud-based unified communications (UC) to connect distributed workforces but often don’t realize the security threats hidden within popular UC services, but they should, and they should address them.

There has been a sharp rise in eMeetings, Voice over IP (VoIP) and other UC capabilities as companies shift to a work-from-home (WFH) model because of the COVID-19 pandemic. Don’t expect this trend to abate any time soon as 93% of CXOs that responded to a ZK Research study say they see a permanent 30% uplift in the number of remote employees.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

Survey respondents say maintaining productivity is the top challenge when shifting users to WFH, highlighting the importance of collaboration tools. The right ones can make the transition seamless. For example, VoIP enables workers to maintain the same phone number at home as they do in the office. They can also connect using a desk phone, mobile phone or software client on a computer, which makes the shift nearly frictionless.

Threats to SIP

However, the use of real-time communications does create a number of security risks. Most communications and collaboration apps rely on session initiation protocol (SIP) for data transmission. Standardizing on SIP has created a more productive world where all the UC systems are interoperable. But one of the lesser known facts about SIP is that it’s susceptible to breaches, robocalls, and other anomalous behavior.

VoIP and SIP attacks on carrier and enterprise networks are increasing rapidly. Robocalls from botnets originate from legitimate servers or rented servers to launch dangerous attacks globally over SIP infrastructure.

On any given day, carriers and their enterprise customers face more than 40,000 different VoIP/SIP attacks, according to research from the [RedShift Networks][3]. In addition to robocalls, networks are vulnerable to cyberprobes, registration hijacking, and distributed denial of service (DDoS) attacks.  

From my conversations with network and security professionals, the 40,000 number seems on the conservative side, particularly now with the exponential rise in home workers. The growth in the number of people using VoIP services has created a massive opportunity for threat actors and a spike in malicious activity focused on UC systems.  This has been a problem long ignored by businesses and service providers but needs to be taken seriously.

**New standards have emerged to combat UC threats**

The Federal Communications Commission (FCC) and international regulators are tackling the problem by mandating that carriers adopt [SHAKEN (Secure Handling of Asserted information using toKENs) and STIR (Secure Telephony Identity Revisited) standards][4]. SHAKEN/STIR targets automated messages delivered via hijacked VoIP and UC-based computer systems. So, calls traveling through interconnected phone networks have their caller ID verified as legitimate before reaching end users.

But not all bogus SIP calls are easily detected. SIP carries all forms of media, not just voice. Various apps like chat and videoconferencing use SIP. Therefore, simply whitelisting or blacklisting IP-based communications is not enough. Businesses must focus on protecting their VoIP systems much like they do their data networks to tackle this growing cybersecurity challenge.

**Protecting communications requires a multi-pronged security approach**

A combination of SIP security, threat intelligence, actionable analytics, and automated fraud detection can improve visibility into unauthorized activities throughout VoIP networks and UC apps. SIP security is necessary to identify and prevent threats at the edge – or entry point – of the network, while threat-intelligence and analytics allows for fast troubleshooting and threat mitigation. Fraud detection and ultimately remediation are needed for real-time monitoring of threats discovered inside the network.

Some UC threat-management solutions are designed specifically for VoIP cybersecurity and implement SHAKEN/STIR standards. They work with protocols such as SIP, real-time transport protocol (RTP), transport layer security (TLS), and secure real-time transport protocol (SRTP) to validate callers beforehand and ensure their legitimacy. Carriers with enterprise customers have turned to such solutions to tackle key problem areas like theft of UC services, costly DDoS or TDoS attacks, robocalls, and VoIP troubleshooting.

Heavily regulated industries are also using UC threat management to maintain compliance by establishing a baseline for normal activity at the SIP/VoIP protocol level. With UC threat management, unique algorithms are used to verify authentic users and block anomalous VoIP/SIP communications or attempts from unregistered users. Healthcare and financial services are two examples of industries where compliance-level protections are required for all communications.

Earlier this year, the FCC issued an order requiring all providers of originating and terminating voice services including VoIP to implement STIR/SHAKEN in the IP portions of their networks by June 30, 2021. Vendors continue to invest in SIP security, as more businesses move to the cloud and adopt UC.

VoIP/SIP attacks on carrier and enterprise networks aren’t going away. Strengthening VoIP security should be a priority. Without security analytics and real-time threat management for UC, businesses could be putting themselves at risk and not meeting their industry’s compliance requirements.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3563549/as-work-at-home-increases-so-do-attacks-on-voip-and-unified-communications.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://zoom.us/docs/en-us/media-kit.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: http://www.redshiftnetworks.com/
[4]: https://www.fcc.gov/document/fcc-mandates-stirshaken-combat-spoofed-robocalls
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
