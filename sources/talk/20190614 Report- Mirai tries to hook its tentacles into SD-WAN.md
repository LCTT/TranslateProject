[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Report: Mirai tries to hook its tentacles into SD-WAN)
[#]: via: (https://www.networkworld.com/article/3403016/report-mirai-tries-to-hook-its-tentacles-into-sd-wan.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Report: Mirai tries to hook its tentacles into SD-WAN
======

Mirai – the software that has hijacked hundreds of thousands of internet-connected devices to launch massive DDoS attacks – now goes beyond recruiting just IoT products; it also includes code that seeks to exploit a vulnerability in corporate SD-WAN gear.

That specific equipment – VMware’s SDX line of SD-WAN appliances – now has an updated software version that fixes the vulnerability, but by targeting it Mirai’s authors show that they now look beyond enlisting security cameras and set-top boxes and seek out any vulnerable connected devices, including enterprise networking gear.

**More about SD-WAN**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][1]
  * [How to pick an off-site data-backup method][2]
  * [SD-Branch: What it is and why you’ll need it][3]
  * [What are the options for security SD-WAN?][4]



“I assume we’re going to see Mirai just collecting as many devices as it can,” said Jen Miller-Osborn, deputy director of threat research at Palo Alto Networks’ Unit 42, which recently issued [a report][5] about Mirai.

### Exploiting SD-WAN gear is new

While the exploit against the SD-WAN appliances was a departure for Mirai, it doesn’t represent a sea-change in the way its authors are approaching their work, according Miller-Osborn.

The idea, she said, is simply to add any devices to the botnet, regardless of what they are. The fact that SD-WAN devices were targeted is more about those particular devices having a vulnerability than anything to do with their SD-WAN capabilities.

### Responsible disclosure headed off execution of exploits

[The vulnerability][6] itself was discovered last year by independent researchers who responsibly disclosed it to VMware, which then fixed it in a later software version. But the means to exploit the weakness nevertheless is included in a recently discovered new variant of Mirai, according to the Unit 42 report.

The authors behind Mirai periodically update the software to add new targets to the list, according to Unit 42, and the botherders’ original tactic of simply targeting devices running default credentials has given way to a strategy that also exploits vulnerabilities in a wide range of different devices. The updated variant of the malicious software includes a total of eight new-to-Mirai exploits.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][7] ]**

The remediated version of the VMware SD-WAN is SD-WAN Edge 3.1.2. The vulnerability still affects SD-WAN Edge 3.1.1 and earlier, [according to a VMware security advisory][8]. After the Unit 42 report came out VMware posted [a blog][9] that says it is conducting its own investigation into the matter.

Detecting whether a given SD-WAN implementation has been compromised depends heavily on the degree of monitoring in place on the network. Any products that give IT staff the ability to notice unusual traffic to or from an affected appliance could flag that activity. Otherwise, it could be difficult to tell if anything’s wrong, Miller-Osborne said. “You honestly might not notice it unless you start seeing a hit in performance or an outside actor notifies you about it.”

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3403016/report-mirai-tries-to-hook-its-tentacles-into-sd-wan.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[2]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[3]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[4]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[5]: https://unit42.paloaltonetworks.com/new-mirai-variant-adds-8-new-exploits-targets-additional-iot-devices/
[6]: https://www.exploit-db.com/exploits/44959
[7]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[8]: https://www.vmware.com/security/advisories/VMSA-2018-0011.html
[9]: https://blogs.vmware.com/security/2019/06/vmsa-2018-0011-revisited.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
