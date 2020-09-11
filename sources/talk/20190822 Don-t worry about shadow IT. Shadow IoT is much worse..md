[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don’t worry about shadow IT. Shadow IoT is much worse.)
[#]: via: (https://www.networkworld.com/article/3433496/dont-worry-about-shadow-it-shadow-iot-is-much-worse.html)
[#]: author: (Fredric Paul https://www.networkworld.com/author/Fredric-Paul/)

Don’t worry about shadow IT. Shadow IoT is much worse.
======
Shadow IoT – the use of unauthorized internet-of-things devices and networks – poses a new level of threats for enterprises
![Air Force photo illustration by Margo Wright][1]

For years, IT departments have been railing about the dangers of shadow IT and bring-your-own-device. The worry is that these unauthorized practices bring risks to corporate systems, introducing new vulnerabilities and increasing the attack surface.

That may be true, but it’s not the whole story. As I’ve long argued, shadow IT may increase risks, but it can also cut costs, boost productivity and speed innovation. That’s why users are often [so eager to circumvent what they see as slow and conservative IT departments][2] by adopting increasingly powerful and affordable consumer and cloud-based alternatives, with or without the blessing of the powers that be. Just as important, there’s plenty of evidence of that [enlightened IT departments should work to leverage those new approaches][3] to serve their internal customers in a more agile manner.

**Also on Network World:** [**5 key enterprise IoT security recommendations**][4]

### Shadow IoT takes shadow IT to the next level

So far so good. But this reasoning emphatically does not carry over to the [emerging practice of shadow IoT][5], which has become a growing concern in the last year or so. Basically, we are talking about when people in your organization connect internet-connected devices (or worse, entire [IoT][6] networks!) without IT’s knowledge.

Those renegades are likely seeking the same speed and flexibility that drove shadow IT, but they are taking a far bigger risk for a much smaller reward. Shadow IoT takes shadow IT to another level, with the potential for many more devices as well as new types of devices and use cases, not to mention the addition of wholly new networks and technologies.

### Why shadow IoT is worse than shadow IT

According to a 2018 report from [802 Secure][7], “IoT introduces [new operating systems, protocols and wireless frequencies][8]. Companies that rely on legacy security technologies are blind to this rampant IoT threat. Organizations need to broaden their view into these invisible devices and networks to identify rogue IoT devices on the network, visibility into shadow-IoT networks, and detection of nearby threats such as drones and spy cameras.”

The report noted that _all_ of the organizations surveyed had rogue consumer IoT wireless devices on their enterprise networks, and nine out of 10 had shadow IoT/[IIoT][9] wireless networks, defined as “undetected company-deployed wireless networks separate from the enterprise infrastructure.”

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][10] ]**

Similarly, a 2018 [Infoblox report][11] found that a third of companies have more than 1,000 shadow-IoT devices connected to their networks on a typical day, including fitness trackers, digital assistants, smart TVs, smart appliances and gaming consoles. (And yes, Infoblox is talking about _enterprise_ networks.)

It gets worse. Many of these consumer IoT devices don’t even _try_ to be secure. And, per Microsoft, criminal and [state-sponsored actors][12] are already weaponizing these devices and networks (both shadow and IT-approved), as shown by the [Mirai botnet][13] and many others.

One more thing: Unlike cloud and consumer shadow IT, shadow IoT implementations often don’t provide additional levels of speed, agility or usability, meaning that organizations are not getting much benefit in exchange for the heightened risks. But that doesn’t seem to be stopping people from using them on corporate networks.

### Security basics

Fortunately, protecting your organization from shadow IoT isn’t so different from security best practices for other threats, including shadow IT.

**Education:** Make sure your team is aware of the threat and try to get their buy-in on key IOT policies and security measures. According to that 802 Secure report, “88 percent of IT leaders in the US and UK believed they had an effective policy in place for mitigating security risks from connected devices. But a full 24 percent of employees represented in the survey said they did not even know such policies existed, while a bare 20 percent of the people who professed knowledge of these policies actually abided by them.” Sure, you’ll never get 100 percent participation, but people can’t follow a policy they don’t know exists.

**Assimilation:** Create policies to let team members easily connect their IoT devices and networks to the enterprise network with the IT department’s approval and support. It’s extra work, and some folks will inevitably go rogue anyway, but the more devices you know about, the better.

**Isolation:** Set up separate networks so you can support approved and shadow IoT devices while protecting your core corporate networks as much as possible.

**Monitoring:** Make regular checks of connected devices and networks, and proactively search for unknown devices on all your networks.

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433496/dont-worry-about-shadow-it-shadow-iot-is-much-worse.html

作者：[Fredric Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Fredric-Paul/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/fight-shadow-100787429-large.jpg
[2]: http://www.networkworld.com/cms/article/6%20ways%20'shadow%20IT'%20can%20actually%20help%20IT
[3]: https://www.networkworld.com/article/2885758/6-ways-shadow-it-can-actually-help-it.html
[4]: https://www.networkworld.com/article/3269247/5-key-enterprise-iot-security-recommendations.html
[5]: https://www.bbntimes.com/en/technology/shadow-iot-is-a-threat-to-your-business-here-s-how-to-deal-with-it
[6]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[7]: https://www.prnewswire.com/news/802-secure%2C-inc
[8]: https://www.networkworld.com/article/3235124/internet-of-things-definitions-a-handy-guide-to-essential-iot-terms.html
[9]: https://www.networkworld.com/article/3243928/what-is-the-industrial-iot-and-why-the-stakes-are-so-high.html
[10]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[11]: https://www.infoblox.com/company/news-events/press-releases/infoblox-research-finds-explosion-of-personal-and-iot-devices-on-enterprise-networks-introduces-immense-security-risk/
[12]: https://diginomica.com/state-sponsored-cyber-spies-targeting-iot-warning-microsoft
[13]: https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/antonakakis
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
