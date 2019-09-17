[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Flaw found in Supermicro motherboards could allow for remote hijacking)
[#]: via: (https://www.networkworld.com/article/3435123/exploit-found-in-supermicro-motherboards-could-allow-for-remote-hijacking.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Flaw found in Supermicro motherboards could allow for remote hijacking
======
The vulnerability impacts three generations of Supermicro motherboards. Fortunately, a fix is already available.
IDG / Thinkstock

A security group discovered a vulnerability in three models of Supermicro motherboards that could allow an attacker to remotely commandeer the server. Fortunately, a fix is already available.

Eclypsium, which specializes in firmware security, announced in its blog that it had found a set of flaws in the baseboard management controller (BMC) for three different models of Supermicro server boards: the X9, X10, and X11.

**[ Also see: [What to consider when deploying a next-generation firewall][1] | Get regularly scheduled insights: [Sign up for Network World newsletters][2] ]**

BMCs are designed to permit administrators remote access to the computer so they can do maintenance and other updates, such as firmware and operating system patches. It’s meant to be a secure port into the computer while at the same time walled off from the rest of the server.

Normally BMCs are locked down within the network in order to prevent this kind of malicious access in the first place. In some cases, BMCs are left open to the internet so they can be accessed from a web browser, and those interfaces are not terribly secure. That’s what Eclypsium found.

For its BMC management console, Supermicro uses an app called virtual media application. This application allows admins to remotely mount images from USB devices and CD or DVD-ROM drives.

When accessed remotely, the virtual media service allows for plaintext authentication, sends most of the traffic unencrypted, uses a weak encryption algorithm for the rest, and is susceptible to an authentication bypass, [according to Eclypsium][3].

Eclypsium was more diplomatic than I, so I’ll say it: Supermicro was sloppy.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][4] ]**

These issues allow an attacker to easily gain access to a server, either by capturing a legitimate user’s authentication packet, using default credentials, and in some cases, without any credentials at all.

"This means attackers can attack the server in the same way as if they had physical access to a USB port, such as loading a new operating system image or using a keyboard and mouse to modify the server, implant malware, or even disable the device entirely," Eclypsium wrote in its blog post.

All told, the team found four different flaws within the virtual media service of the BMC's web control interface.

### How an attacker could exploit the Supermicro flaws

According to Eclypsium, the easiest way to attack the virtual media flaws is to find a server with the default login or brute force an easily guessed login (root or admin). In other cases, the flaws would have to be targeted.

Normally, access to the virtual media service is conducted by a small Java application served on the BMC’s web interface. This application then connects to the virtual media service listening on TCP port 623 on the BMC. A scan by Eclypsium on port 623 turned up 47,339 exposed BMCs around the world.

Eclypsium did the right thing and contacted Supermicro and waited for the vendor to release [an update to fix the vulnerabilities][5] before going public. Supermicro thanked Eclypsium for not only bringing this issue to its attention but also helping validate the fixes.

Eclypsium is on quite the roll. In July it disclosed BMC [vulnerabilities in motherboards from Lenovo, Gigabyte][6] and other vendors, and last month it [disclosed flaws in 40 device drivers][7] from 20 vendors that could be exploited to deploy malware.

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3435123/exploit-found-in-supermicro-motherboards-could-allow-for-remote-hijacking.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://eclypsium.com/2019/09/03/usbanywhere-bmc-vulnerability-opens-servers-to-remote-attack/
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[5]: https://www.supermicro.com/support/security_BMC_virtual_media.cfm
[6]: https://eclypsium.com/2019/07/16/vulnerable-firmware-in-the-supply-chain-of-enterprise-servers/
[7]: https://eclypsium.com/2019/08/10/screwed-drivers-signed-sealed-delivered/
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
