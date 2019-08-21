[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco: DNSpionage attack adds new tools, morphs tactics)
[#]: via: (https://www.networkworld.com/article/3390666/cisco-dnspionage-attack-adds-new-tools-morphs-tactics.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco: DNSpionage attack adds new tools, morphs tactics
======
Cisco's Talos security group says DNSpionage tools have been upgraded to be more stealthy
![Calvin Dexter / Getty Images][1]

The group behind the Domain Name System attacks known as DNSpionage have upped their dark actions with new tools and malware to focus their attacks and better hide their activities.

Cisco Talos security researchers, who discovered [DNSpionage][2] in November, this week warned of new exploits and capabilities of the nefarious campaign.

**More about DNS:**

  * [DNS in the cloud: Why and why not][3]
  * [DNS over HTTPS seeks to make internet use more private][4]
  * [How to protect your infrastructure from DNS cache poisoning][5]
  * [ICANN housecleaning revokes old DNS security key][6]



“The threat actor's ongoing development of DNSpionage malware shows that the attacker continues to find new ways to avoid detection. DNS tunneling is a popular method of exfiltration for some actors and recent examples of DNSpionage show that we must ensure DNS is monitored as closely as an organization's normal proxy or weblogs,” [Talos wrote][7]. “DNS is essentially the phonebook of the internet, and when it is tampered with, it becomes difficult for anyone to discern whether what they are seeing online is legitimate.”

In Talos’ initial report, researchers said a DNSpionage campaign targeted various businesses in the Middle East as well as United Arab Emirates government domains. It also utilized two malicious websites containing job postings that were used to compromise targets via crafted Microsoft Office documents with embedded macros. The malware supported HTTP and DNS communication with the attackers.

In a separate DNSpionage campaign, the attackers used the same IP address to redirect the DNS of legitimate .gov and private company domains. During each DNS compromise, the actor carefully generated “Let's Encrypt” certificates for the redirected domains. These certificates provide X.509 certificates for [Transport Layer Security (TLS)][8] free of charge to the user, Talos said.

This week Cisco said DNSpionage actors have created a new remote administrative tool that supports HTTP and DNS communication with the attackers' command and control (C2).

“In our previous post concerning DNSpionage, we showed that the malware author used malicious macros embedded in a Microsoft Word document. In the new sample from Lebanon identified at the end of February, the attacker used an Excel document with a similar macro.”

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][9] ]**

Talos wrote: “The malware supports HTTP and DNS communication to the C2 server. The HTTP communication is hidden in the comments in the HTML code. This time, however, the C2 server mimics the GitHub platform instead of Wikipedia. While the DNS communication follows the same method we described in our previous article, the developer added some new features in this latest version and, this time, the actor removed the debug mode.”

Talos added that the domain used for the C2 campaign is “bizarre.”

“The previous version of DNSpionage attempted to use legitimate-looking domains in an attempt to remain undetected. However, this newer version uses the domain ‘coldfart[.]com,’ which would be easier to spot than other APT campaigns which generally try to blend in with traffic more suitable to enterprise environments. The domain was also hosted in the U.S., which is unusual for any espionage-style attack.”

Talos researchers said they discovered that DNSpionage added a reconnaissance phase, that ensures the payload is being dropped on specific targets rather than indiscriminately downloaded on every machine.

This level of attack also returns information about the workstation environment, including platform-specific information, the name of the domain and the local computer, and information concerning the operating system, Talos wrote. This information is key to helping the malware select the victims only and attempts to avoid researchers or sandboxes. Again, it shows the actor's improved abilities, as they now fingerprint the victim.

This new tactic indicates an improved level of sophistication and is likely in response to the significant amount of public interest in the campaign.

Talos noted that there have been several other public reports of DNSpionage attacks, and in January, the U.S. Department of Homeland Security issued an [alert][10] warning users about this threat activity.

“In addition to increased reports of threat activity, we have also discovered new evidence that the threat actors behind the DNSpionage campaign continue to change their tactics, likely in an attempt to improve the efficacy of their operations,” Talos stated.

In April, Cisco Talos identified an undocumented malware developed in .NET. On the analyzed samples, the malware author left two different internal names in plain text: "DropperBackdoor" and "Karkoff."

“The malware is lightweight compared to other malware due to its small size and allows remote code execution from the C2 server. There is no obfuscation and the code can be easily disassembled,” Talos wrote.

The Karkoff malware searches for two specific anti-virus platforms: Avira and Avast and will work around them.

“The discovery of Karkoff also shows the actor is pivoting and is increasingly attempting to avoid detection while remaining very focused on the Middle Eastern region,” Talos wrote.

Talos distinguished DNSpionage from another DNS attack method, “[Sea Turtle][11]”, it detailed this month. Sea Turtle involves state-sponsored attackers that are abusing DNS to target organizations and harvest credentials to gain access to sensitive networks and systems in a way that victims are unable to detect. This displays unique knowledge about how to manipulate DNS, Talos stated.

By obtaining control of victims’ DNS, attackers can change or falsify any data victims receive from the Internet, illicitly modify DNS name records to point users to actor-controlled servers and users visiting those sites would never know, Talos reported.

“While this incident is limited to targeting primarily national security organizations in the Middle East and North Africa, and we do not want to overstate the consequences of this specific campaign, we are concerned that the success of this operation will lead to actors more broadly attacking the global DNS system,” Talos stated about Sea Turtle.

Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390666/cisco-dnspionage-attack-adds-new-tools-morphs-tactics.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/cyber_attack_threat_danger_breach_hack_security_by_calvindexter_gettyimages-860363294_2400x800-100788395-large.jpg
[2]: https://blog.talosintelligence.com/2018/11/dnspionage-campaign-targets-middle-east.html
[3]: https://www.networkworld.com/article/3273891/hybrid-cloud/dns-in-the-cloud-why-and-why-not.html
[4]: https://www.networkworld.com/article/3322023/internet/dns-over-https-seeks-to-make-internet-use-more-private.html
[5]: https://www.networkworld.com/article/3298160/internet/how-to-protect-your-infrastructure-from-dns-cache-poisoning.html
[6]: https://www.networkworld.com/article/3331606/security/icann-housecleaning-revokes-old-dns-security-key.html
[7]: https://blog.talosintelligence.com/2019/04/dnspionage-brings-out-karkoff.html
[8]: https://www.networkworld.com/article/2303073/lan-wan-what-is-transport-layer-security-protocol.html
[9]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[10]: https://www.us-cert.gov/ncas/alerts/AA19-024A
[11]: https://www.networkworld.com/article/3389747/cisco-talos-details-exceptionally-dangerous-dns-hijacking-attack.html
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
