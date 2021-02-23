[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Are newer medical IoT devices less secure than old ones?)
[#]: via: (https://www.networkworld.com/article/3568608/are-newer-medical-iot-devices-less-secure-than-old-ones.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Are newer medical IoT devices less secure than old ones?
======
Legacy medical IoT devices may lack security features, but newer ones built around commodity components can have a whole different set of vulnerabilities that are better understood by attackers.
Thinkstock

Experts differ on whether older connected medical devices or newer ones are more to blame for making healthcare networks more vulnerable to cyberattack.

The classic narrative of insecure [IoT][1] centers on the integration of older devices into the network. In some industries, those devices pre-date the [internet][2], sometimes by a considerable length of time, so it’s hardly surprising that businesses face a lot of challenges in securing them against remote compromise.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

Even if those devices aren’t quite that old, they often lack key capabilities – in particular, remote software updates and configurable password protection – that would help IT staff defend them against modern threats.

That might not be strictly true in regards to the medical field, according to Richard Staynings, chief security strategist for medical IoT security startup Cylera. There has, he argues, been an explosion in the number and variety of medical IoT devices in recent years, and many of those gadgets are at least as insecure as the true legacy equipment in the field.

In some cases, said Staynings, the older devices might actually be considerably more secure than those of more recent vintage. In particular, those based on dated technology like older versions of electrically erasable programmable read-only memory (EEPROM).

“The older systems were written in EEPROM – you need an EEPROM reader to mess with them,” he said. “The codebase is not on the Internet for hackers to look at, and you need physical access to the EEPROM to rewrite it.”

In contrast, the newer devices frequently use software and hardware components that are much more familiar to potential attackers. “They’re more ubiquitous in their design and construction – they use [consumer off-the-shelf] operating systems, like Windows embedded, which is still being used believe it or not, and they are much more vulnerable to attack than a legacy system,” Staynings said.

Insecurity in the current generation of medical IoT hardware also carries the potential for ongoing problems, not just immediate ones. While IT assets get replaced rapidly, IoT devices often have much longer replacement cycles. “Medical devices have the half-life of plutonium,” said Staynings. “They just don’t go away.”

Other experts are less sold on Staynings’ characterization of the threat to medical IoT, arguing that the idea that newer devices pose a greater threat than older ones flies in the face of recent efforts to make them safer. Keith Mularski directs an advisory cybersecurity practice at Ernst and Young, and described Staynings’ assertion as “surprising,” noting that the regulatory landscape for connected medical devices is quickly moving standards in a positive direction.

“The FDA has some pretty stringent guidelines that before devices can go to market, you need to put together threat modeling, so looking at security architecture, vectors, and so on ,and then in addition to that the FDA is getting ready to require third-party pen testing in premarket submissions,” said Mularski. “With legacy devices, those premarket submissions aren’t nearly as complete.”

Mularski does concede that some particularly vulnerable old devices are often more isolated on the network by design, in part because they’re more recognizable as vulnerable assets. Windows 95-vintage x-ray machines, for example, are easy to spot as a potential target for a bad actor.

“For the most part, I think most of the hospital environments, they do a good job at recognizing that they have these old deices, and the ones that are more vulnerable,” he said.

This underlines a topic most experts on – simple awareness of the potential security flaws on a given network are central to securing healthcare networks. Greg Murphy is the CEO of Ordr, a network visibility and security startup based in Santa Clara. He said that both Mularski and Staynings have points in their favor.

“Anyone who minimizes the issue of legacy devices needs to walk a mile in the shoes of the biomedical engineering department at a hospital,” he said. “[But] on the flipside, new devices that are being connected to the network have huge vulnerabilities themselves. Many manufacturers themselves don’t know what vulnerabilities their devices have.”

The only real way to address the issues, said Murphy, is at the network level – trying to make everything secure at the device level might be a near-impossibility in many cases, and even getting an accurate picture of every device connected to a network often requires the use of an automated solution.

“This is not a problem of human scale anymore,” he said.

Both Mularski and Staynings concurred on this point, as well. Regardless of which devices on a particular network are the most vulnerable, it’s worth remembering that cybercriminals generally aren’t particular about what they compromise, as long as they’re able to gain access.

“There may be an attacker that comes across these devices, runs a scan and happens to see [a vulnerability], but we really haven’t seen specific targeting of medical devices,” said Mularski. “It’s important to make sure that companies that have medical devices are enumerating their network, tracking their devices.”

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3568608/are-newer-medical-iot-devices-less-secure-than-old-ones.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[2]: https://www.networkworld.com/article/3410588/evolution-of-the-internet-celebrating-50-years-since-arpanet.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
