[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Report: Mirai tries to wrap its tentacles around SD-WAN)
[#]: via: (https://www.networkworld.com/article/3403016/report-mirai-tries-to-wrap-its-tentacles-around-sd-wan.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Report: Mirai tries to wrap its tentacles around SD-WAN
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

To continue reading this article register now

[Get Free Access][7]

[Learn More][8] Existing Users [Sign In][7]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3403016/report-mirai-tries-to-wrap-its-tentacles-around-sd-wan.html

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
[7]: javascript://
[8]: /learn-about-insider/
