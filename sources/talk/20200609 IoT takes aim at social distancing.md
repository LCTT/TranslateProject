[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IoT takes aim at social distancing)
[#]: via: (https://www.networkworld.com/article/3561495/iot-takes-aim-at-social-distancing.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

IoT takes aim at social distancing
======

Getty Images

As many part of the U.S. are at least partially lifting lockdown sanctions prompted by the [COVID pandemic][1], questions about the safety of those moves remain. IoT technology, however, might help alleviate some of those concerns.

The degree to which it’s safe to reopen certain workspaces hinges in large part on how strictly social distancing practices are followed, and IoT technology may have a role to play. Companies like Genetec, a building management and security firm, are rolling out products designed to help businesses manage their facilities during the pandemic.

Genetec’s clearly-labeled Occupancy Management Package leverages the company’s expertise in smart vision technology to track people throughout defined areas of a facility, and keep track of whether any limits on occupancy are being breached.

The system can work with either a standard camera with an optical people-counter module attached to it, or with a dedicated LIDAR sensor. The data is sent via either Ethernet or Wi-Fi over the client’s network to Genetec, which makes it available asa graphical representation of a space’s occupancy data via a web portal. The system can then alert employees if a particular area is overcrowded or distancing rules are being violated. Audit reports can be produced to demonstrate a client’s compliance with applicable public policies.

Another company using cameras to help fight the pandemic is Viper Imaging, which until recently used thermal cameras to track small temperature abnormalities in industrial settings. After a high-speed pivot, the company now says that its cameras can be used to spot people with elevated body temperatures in crowds, providing a screening option for organizations with that need.

Ubigreen’s Smartdesk takes a slightly different tack in its attempt to address social distancing requirements. A small, AAA-battery-powered wall-mount sensor tracks room occupancy via an infrared sensor and reports back its findings via a low-power Sigfox network. Like Genetec’s product, Smartdesk feeds back into a web portal and real-time API that can give at-a-glance occupancy information for a pre-defined area.

#### [ IoT Sector Report: [How to prepare for tech’s Wild West][2] ]

**Kaiji rears its ugly head**

Security researchers at malware analysis firm Intezer announced last month that it had identified a new botnet dubbed Kaiji operating in the wild. Unusually, this is a piece of malware apparently developed entirely from scratch – most IoT botnets steal code from one another or otherwise build on each other’s techniques – and it seems to have very clearly originated in China, given the apparent inclusion of lots of Chinese text throughout its source code.

[According to an Intezer blog post][3], Kaiji targeted different types of servers and IoT devices, and may have been a trial run for future attacks. The malware infects devices via SSH brute force attacks, and has the capability to perform eight different types of DDoS attack.

IoT botnets, sadly, are hardly a new phenomenon – Mirai is the one that everyone remembers, but dozens of others have been unearthed by security researchers over the years. The relatively weak security measures present on a still-large subset of IoT devices makes them tempting targets for bad actors.

**Microsoft puts out bounties on Azure IoT bugs**

Microsoft announced in early May that it would open a bug bounty program designed to find vulnerabilities in its Azure Sphere IoT security framework to the general public, after offering Azure Sphere as a target for select researchers at last year’s Black Hat event.

Awards of up to $100,000 are available for demonstrated remote code execution on particularly critical parts of Azure Sphere, including the Pluton security subsystem and the Secure World software subsection, both of which are integral to defending the platform against compromise.

The Azure Sphere-specific program will remain open for three months, between June 1 and August 31, but the general [Azure Bounty Program][4] remains open for other parts of the Azure ecosystem.

#### [ Certifcations: [Become a certified IoT business leader][5] ]

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561495/iot-takes-aim-at-social-distancing.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.idginsiderpro.com/article/3532433/coronavirus-managing-and-pivoting-during-a-crisis.html
[2]: https://www.idginsiderpro.com/article/3412066/iot-sector-report-how-to-prepare-for-tech-s-wild-west.html
[3]: https://intezer.com/blog/research/kaiji-new-chinese-linux-malware-turning-to-golang/
[4]: https://www.microsoft.com/en-us/msrc/bounty-microsoft-azure
[5]: https://www.idginsiderpro.com/article/3453740/become-a-certified-iot-business-leader.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
