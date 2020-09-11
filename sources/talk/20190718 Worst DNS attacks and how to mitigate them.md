[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Worst DNS attacks and how to mitigate them)
[#]: via: (https://www.networkworld.com/article/3409719/worst-dns-attacks-and-how-to-mitigate-them.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Worst DNS attacks and how to mitigate them
======
DNS threats, including DNS hijacking, tunneling, phishing, cache poisoning and DDoS attacks, are all on the rise.
![Max Bender \(CC0\)][1]

The Domain Name System remains under constant attack, and there seems to be no end in sight as threats grow increasingly sophisticated.

DNS, known as the internet’s phonebook, is part of the global internet infrastructure that translates between familiar names and the numbers computers need to access a website or send an email. While DNS has long been the target of assailants looking to steal all manner of corporate and private information, the threats in the [past year][2] or so indicate a worsening of the situation.

**More about DNS:**

  * [DNS in the cloud: Why and why not][3]
  * [DNS over HTTPS seeks to make internet use more private][4]
  * [How to protect your infrastructure from DNS cache poisoning][5]
  * [ICANN housecleaning revokes old DNS security key][6]



IDC reports that 82% of companies worldwide have faced a DNS attack over the past year. The research firm recently published its fifth annual [Global DNS Threat Report][7], which is based on a survey IDC conducted on behalf of DNS security vendor EfficientIP of 904 organizations across the world during the first half of 2019.

According to IDC's research, the average costs associated with a DNS attack rose by 49% compared to a year earlier. In the U.S., the average cost of a DNS attack tops out at more than $1.27 million. Almost half of respondents (48%) report losing more than $500,000 to a DNS attack, and nearly 10% say they lost more than $5 million on each breach. In addition, the majority of U.S. organizations say that it took more than one day to resolve a DNS attack.

“Worryingly, both in-house and cloud applications were damaged, with growth of over 100% for in-house application downtime, making it now the most prevalent damage suffered,” IDC wrote. "DNS attacks are moving away from pure brute-force to more sophisticated attacks acting from the internal network. This will force organizations to use intelligent mitigation tools to cope with insider threats."

### Sea Turtle DNS hijacking campaign

An ongoing DNS hijacking campaign known as Sea Turtle is one example of what's occuring in today's DNS threat landscape.

This month, [Cisco Talos][8] security researchers said the people behind the Sea Turtle campaign have been busy [revamping their attacks][9] with new infrastructure and going after new victims.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][10] ]**

In April, Talos released a [report detailing][11] Sea Turtle and calling it the “first known case of a domain name registry organization that was compromised for cyber espionage operations.” Talos says the ongoing DNS threat campaign is a state-sponsored attack that abuses DNS to harvest credentials to gain access to sensitive networks and systems in a way that victims are unable to detect, which displays unique knowledge on how to manipulate DNS.

By obtaining control of victims’ DNS, the attackers can change or falsify any data on the Internet and illicitly modify DNS name records to point users to actor-controlled servers; users visiting those sites would never know, Talos reports. 

The hackers behind Sea Turtle appear to have regrouped after the April report from Talos and are redoubling their efforts with new infrastructure – a move Talos researchers find to be unusual: “While many actors will slow down once they are discovered, this group appears to be unusually brazen, and will be unlikely to be deterred going forward,” Talos [wrote][9] in July.

“Additionally, we discovered a new DNS hijacking technique that we assess with moderate confidence is connected to the actors behind Sea Turtle. This new technique is similar in that the threat actors compromise the name server records and respond to DNS requests with falsified A records,” Talos stated. 

“This new technique has only been observed in a few highly targeted operations. We also identified a new wave of victims, including a country code top-level domain (ccTLD) registry, which manages the DNS records for every domain [that] uses that particular country code; that access was used to then compromise additional government entities. Unfortunately, unless there are significant changes made to better secure DNS, these sorts of attacks are going to remain prevalent,” Talos wrote.

### DNSpionage attack upgrades its tools

Another newer threat to DNS comes in the form of an attack campaign called [DNSpionage][12]. 

DNSpionage initially used two malicious websites containing job postings to compromise targets via crafted Microsoft Office documents with embedded macros. The malware supported HTTP and DNS communication with the attackers. And the attackers are continuing to develop new assault techniques.

“The threat actor's ongoing development of DNSpionage malware shows that the attacker continues to find new ways to avoid detection. DNS tunneling is a popular method of exfiltration for some actors, and recent examples of DNSpionage show that we must ensure DNS is monitored as closely as an organization's normal proxy or weblogs,” [Talos wrote][13]. “DNS is essentially the phonebook of the internet, and when it is tampered with, it becomes difficult for anyone to discern whether what they are seeing online is legitimate.”

The DNSpionage campaign targeted various businesses in the Middle East as well as United Arab Emirates government domains.

“One of the biggest problems with DNS attacks or the lack of protection from them is complacency,” said Craig Williams, director of Talos outreach. Companies think DNS is stable and that they don’t need to worry about it. “But what we are seeing with attacks like DNSpionage and Sea Turtle are kind of the opposite, because attackers have figured out how to use it to their advantage – how to use it to do damage to credentials in a way, in the case of Sea Turtle, that the victim never even knows it happened. And that’s a real potential problem.”

If you know, for example, your name server has been compromised, then you can force everyone to change their passwords. But if instead they go after the registrar and the registrar points to the bad guy’s name, you never knew it happened because nothing of yours was touched – that’s why these new threats are so nefarious, Williams said.

“Once attackers start using it publicly, successfully, other bad guys are going to look at it and say, ‘Hey, why don't I use that to harvest a bunch of credentials from the sites I am interested in,’” Williams said.

### **The DNS IoT risk**

Another developing risk would be the proliferation of IoT devices.  The Internet Corporation for Assigned Names and Numbers (ICANN) recently wrote a [paper on the risk that IoT brings to DNS][14]. 

“The IoT is a risk to the DNS because various measurement studies suggest that IoT devices could stress the DNS infrastructure in ways that we have not seen before,” ICANN stated.   “For example, a software update for a popular IP-enabled IoT device that causes the device to use the DNS more frequently (e.g., regularly lookup random domain names to check for network availability) could stress the DNS in individual networks when millions of devices automatically install the update at the same time.”

While this is a programming error from the perspective of individual devices, it could result in a significant attack vector from the perspective of DNS infrastructure operators. Incidents like this have already occurred on a small scale, but they may occur more frequently in the future due to the growth of heterogeneous IoT devices from manufacturers that equip their IoT devices with controllers that use the DNS, ICANN stated.

ICANN also suggested that IoT botnets will represent an increased threat to DNS operators. “Larger DDoS attacks, partly because IoT bots are more difficult to eradicate. Current botnet sizes are on the order of hundreds of thousands. The most well-known example is the Mirai botnet, which involved 400K (steady-state) to 600K (peak) infected IoT devices.  The Hajime botnet hovers around 400K infected IoT devices, but has not launched any DDoS attacks yet. With the growth of the IoT, these attacks may grow to involve millions of bots and as a result larger DDoS attacks.

### **DNS security warnings grow**

The UK's [National Cyber Security Centre (NCSC)][15] issued a warning this month about ongoing DNS attacks, particularly focusing on DNS hijacking. It cited a number of risks associated with the uptick in DNS hijacking including:

**Creating malicious DNS records.** A malicious DNS record could be used, for example, to create a phishing website that is present within an organization’s familiar domain. This may be used to phish employees or customers.

**Obtaining SSL certificates.** Domain-validated SSL certificates are issued based on the creation of DNS records; thus an attacker may obtain valid SSL certificates for a domain name, which could be used to create a phishing website intended to look like an authentic website, for example.

**Transparent proxying.** One serious risk employed recently involves transparently proxying traffic to intercept data. The attacker modifies an organization’s configured domain zone entries (such as “A” or “CNAME” records) to point traffic to their own IP address, which is infrastructure they manage.

“An organization may lose total control of their domain and often the attackers will change the domain ownership details making it harder to recover,” the NCSC wrote.

These new threats, as well as other dangers, led the U.S. government to issue a warning earlier this year about DNS attacks on federal agencies. 

The Department of Homeland Security’s Cybersecurity and Infrastructure Security Agency (CISA) told all federal agencies to bolt down their DNS in the face of a series of global hacking campaigns.

CISA said in its [Emergency Directive][16] that it was tracking a series of incidents targeting DNS infrastructure. CISA wrote that it “is aware of multiple executive branch agency domains that were impacted by the tampering campaign and has notified the agencies that maintain them.”

CISA says that attackers have managed to intercept and redirect web and mail traffic and could target other networked services. The agency said the attacks start with compromising user credentials of an account that can make changes to DNS records.  Then the attacker alters DNS records, like Address, Mail Exchanger, or Name Server records, replacing the legitimate address of the services with an address the attacker controls.

These actions let the attacker direct user traffic to their own infrastructure for manipulation or inspection before passing it on to the legitimate service, should they choose. This creates a risk that persists beyond the period of traffic redirection, CISA stated. 

“Because the attacker can set DNS record values, they can also obtain valid encryption certificates for an organization’s domain names. This allows the redirected traffic to be decrypted, exposing any user-submitted data. Since the certificate is valid for the domain, end users receive no error warnings,” CISA stated.

### **Get on the DNSSEC bandwagon**

“Enterprises that are potential targets – in particular those that capture or expose user and enterprise data through their applications – should heed this advisory by the NSCS and should pressure their DNS and registrar vendors to make DNSSEC and other domain security best practices easy to implement and standardized,” said Kris Beevers, co-founder and CEO of DNS security vendor [NS1][17]. “They can easily implement DNSSEC signing and other domain security best practices with technologies in the market today. At the very least, they should work with their vendors and security teams to audit their implementations.”

DNSSEC was in the news earlier this year when in response to increased DNS attacks, ICANN called for an intensified community effort to install stronger DNS security technology. 

Specifically, ICANN wants full deployment of the Domain Name System Security Extensions ([DNSSEC][18]) across all unsecured domain names. DNSSEC adds a layer of security on top of DNS. Full deployment of DNSSEC ensures end users are connecting to the actual web site or other service corresponding to a particular domain name, ICANN said. “Although this will not solve all the security problems of the Internet, it does protect a critical piece of it – the directory lookup – complementing other technologies such as SSL (https:) that protect the ‘conversation’, and provide a platform for yet-to-be-developed security improvements,” ICANN stated.

DNSSEC technologies have been around since about 2010 but are not widely deployed, with less than 20% of the world’s DNS registrars having deployed it, according to the regional internet address registry for the Asia-Pacific region ([APNIC][19]).

DNSSEC adoption has been lagging because it was viewed as optional and can require a tradeoff between security and functionality, said NS1's Beevers.

### **Traditional DNS threats**

While DNS hijacking may be the front line attack method, other more traditional threats still exist. 

The IDC/EfficientIP study found most popular DNS threats have changed compared with last year. Phishing (47%) is now more popular than last year’s favorite, DNS-based malware (39%), followed by DDoS attacks (30%), false positive triggering (26%), and lock-up domain attacks (26%).

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3409719/worst-dns-attacks-and-how-to-mitigate-them.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/anonymous_faceless_hooded_mand_in_scary_halloween_mask_finger_to_lips_danger_threat_stealth_attack_hacker_hush_silence_warning_by_max_bender_cc0_via_unsplash_1200x800-100766358-large.jpg
[2]: https://www.fireeye.com/blog/threat-research/2019/01/global-dns-hijacking-campaign-dns-record-manipulation-at-scale.html
[3]: https://www.networkworld.com/article/3273891/hybrid-cloud/dns-in-the-cloud-why-and-why-not.html
[4]: https://www.networkworld.com/article/3322023/internet/dns-over-https-seeks-to-make-internet-use-more-private.html
[5]: https://www.networkworld.com/article/3298160/internet/how-to-protect-your-infrastructure-from-dns-cache-poisoning.html
[6]: https://www.networkworld.com/article/3331606/security/icann-housecleaning-revokes-old-dns-security-key.html
[7]: https://www.efficientip.com/resources/idc-dns-threat-report-2019/
[8]: https://www.talosintelligence.com/
[9]: https://blog.talosintelligence.com/2019/07/sea-turtle-keeps-on-swimming.html
[10]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[11]: https://blog.talosintelligence.com/2019/04/seaturtle.html
[12]: https://www.networkworld.com/article/3390666/cisco-dnspionage-attack-adds-new-tools-morphs-tactics.html
[13]: https://blog.talosintelligence.com/2019/04/dnspionage-brings-out-karkoff.html
[14]: https://www.icann.org/en/system/files/files/sac-105-en.pdf
[15]: https://www.ncsc.gov.uk/news/ongoing-dns-hijacking-and-mitigation-advice
[16]: https://cyber.dhs.gov/ed/19-01/
[17]: https://ns1.com/
[18]: https://www.icann.org/resources/pages/dnssec-qaa-2014-01-29-en
[19]: https://www.apnic.net/
