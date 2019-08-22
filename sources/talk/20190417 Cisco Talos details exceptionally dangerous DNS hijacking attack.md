[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco Talos details exceptionally dangerous DNS hijacking attack)
[#]: via: (https://www.networkworld.com/article/3389747/cisco-talos-details-exceptionally-dangerous-dns-hijacking-attack.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco Talos details exceptionally dangerous DNS hijacking attack
======
Cisco Talos says state-sponsored attackers are battering DNS to gain access to sensitive networks and systems
![Peshkova / Getty][1]

Security experts at Cisco Talos have released a [report detailing][2] what it calls the “first known case of a domain name registry organization that was compromised for cyber espionage operations.”

Talos calls ongoing cyber threat campaign “Sea Turtle” and said that state-sponsored attackers are abusing DNS to harvest credentials to gain access to sensitive networks and systems in a way that victims are unable to detect, which displays unique knowledge on how to manipulate DNS, Talos stated.

**More about DNS:**

  * [DNS in the cloud: Why and why not][3]
  * [DNS over HTTPS seeks to make internet use more private][4]
  * [How to protect your infrastructure from DNS cache poisoning][5]
  * [ICANN housecleaning revokes old DNS security key][6]



By obtaining control of victims’ DNS, the attackers can change or falsify any data on the Internet, illicitly modify DNS name records to point users to actor-controlled servers; users visiting those sites would never know, Talos reported.

DNS, routinely known as the Internet’s phonebook, is part of the global internet infrastructure that translates between familiar names and the numbers computers need to access a website or send an email.

### Threat to DNS could spread

At this point Talos says Sea Turtle isn't compromising organizations in the U.S.

“While this incident is limited to targeting primarily national security organizations in the Middle East and North Africa, and we do not want to overstate the consequences of this specific campaign, we are concerned that the success of this operation will lead to actors more broadly attacking the global DNS system,” Talos stated.

Talos reports that the ongoing operation likely began as early as January 2017 and has continued through the first quarter of 2019. “Our investigation revealed that approximately 40 different organizations across 13 different countries were compromised during this campaign,” Talos stated. “We assess with high confidence that this activity is being carried out by an advanced, state-sponsored actor that seeks to obtain persistent access to sensitive networks and systems.”

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][7] ]**

Talos says the attackers directing the Sea Turtle campaign show signs of being highly sophisticated and have continued their attacks despite public reports of their activities. In most cases, threat actors typically stop or slow down their activities once their campaigns are publicly revealed suggesting the Sea Turtle actors are unusually brazen and may be difficult to deter going forward, Talos stated.

In January the Department of Homeland Security (DHS) [issued an alert][8] about this activity, warning that an attacker could redirect user traffic and obtain valid encryption certificates for an organization’s domain names.

At that time the DHS’s [Cybersecurity and Infrastructure Security Agency][9] said in its [Emergency Directive][9] that it was tracking a series of incidents targeting DNS infrastructure. CISA wrote that it “is aware of multiple executive branch agency domains that were impacted by the tampering campaign and has notified the agencies that maintain them.”

### DNS hijacking

CISA said that attackers have managed to intercept and redirect web and mail traffic and could target other networked services. The agency said the attacks start with compromising user credentials of an account that can make changes to DNS records. Then the attacker alters DNS records, like Address, Mail Exchanger, or Name Server records, replacing the legitimate address of the services with an address the attacker controls.

To achieve their nefarious goals, Talos stated the Sea Turtle accomplices:

  * Use DNS hijacking through the use of actor-controlled name servers.
  * Are aggressive in their pursuit targeting DNS registries and a number of registrars, including those that manage country-code top-level domains (ccTLD).


  * Use Let’s Encrypts, Comodo, Sectigo, and self-signed certificates in their man-in-the-middle (MitM) servers to gain the initial round of credentials.


  * Steal victim organization’s legitimate SSL certificate and use it on actor-controlled servers.



Such actions also distinguish Sea Turtle from an earlier DNS exploit known as DNSpionage, which [Talos ​reported][10]​ on in November 2018.

Talos noted “with high confidence” that these operations are distinctly different and independent from the operations performed by [DNSpionage.][11]

In that report, Talos said a DNSpionage campaign utilized two fake, malicious websites containing job postings that were used to compromise targets via malicious Microsoft Office documents with embedded macros. The malware supported HTTP and DNS communication with the attackers.

In a separate DNSpionage campaign, the attackers used the same IP address to redirect the DNS of legitimate .gov and private company domains. During each DNS compromise, the actor carefully generated Let's Encrypt certificates for the redirected domains. These certificates provide X.509 certificates for [Transport Layer Security (TLS)][12] free of charge to the user, Talos said.

The Sea Turtle campaign gained initial access either by exploiting known vulnerabilities or by sending spear-phishing emails. Talos said it believes the attackers have exploited multiple known common vulnerabilities and exposures (CVEs) to either gain initial access or to move laterally within an affected organization. Talos research further shows the following known exploits of Sea Turtle include:

  * CVE-2009-1151​: PHP code injection vulnerability affecting phpMyAdmin
  * CVE-2014-6271​: RCE affecting GNU bash system, specifically the SMTP (this was part of the ​Shellshock​ CVEs)
  * CVE-2017-3881​: RCE by unauthenticated user with elevated privileges Cisco switches
  * CVE-2017-6736​: Remote Code Exploit (RCE) for Cisco integrated Service Router 2811
  * CVE-2017-12617​: RCE affecting Apache web servers running Tomcat
  * CVE-2018-0296​: ​Directory​ traversal allowing unauthorized access to Cisco Adaptive Security Appliances (ASAs) and firewalls
  * CVE-2018-7600​: RCE for Website built with Drupal, aka “Drupalgeddon”



“As with any initial access involving a sophisticated actor, we believe this list of CVEs to be incomplete,” Talos stated. “The actor in question can leverage known vulnerabilities as they encounter a new threat surface. This list only represents the observed behavior of the actor, not their complete capabilities.”

Talos says that the Sea Turtle campaign continues to be highly successful for several reasons. “First, the actors employ a unique approach to gain access to the targeted networks. Most traditional security products such as IDS and IPS systems are not designed to monitor and log DNS requests,” Talos stated. “The threat actors were able to achieve this level of success because the DNS domain space system added security into the equation as an afterthought. Had more ccTLDs implemented security features such as registrar locks, attackers would be unable to redirect the targeted domains.”

Talos said the attackers also used previously undisclosed techniques such as certificate impersonation. “This technique was successful in part because the SSL certificates were created to provide confidentiality, not integrity. The attackers stole organizations’ SSL certificates associated with security appliances such as [Cisco's Adaptive Security Appliance] to obtain VPN credentials, allowing the actors to gain access to the targeted network, and have long-term persistent access, Talos stated.

### Cisco Talos DNS attack mitigation strategy

To protect against Sea Turtle, Cisco recommends:

  * Use a registry lock service, which will require an out-of-band message before any changes can occur to an organization's DNS record.
  * If your registrar does not offer a registry-lock service, Talos recommends implementing multi-factor authentication, such as ​DUO​, to access your organization's DNS records.
  * If you suspect you were targeted by this type of intrusion, Talos recommends instituting a network-wide password reset, preferably from a computer on a trusted network.
  * Apply patches, especially on internet-facing machines. Network administrators can monitor passive DNS records on their domains to check for abnormalities.



Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3389747/cisco-talos-details-exceptionally-dangerous-dns-hijacking-attack.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/man-in-boat-surrounded-by-sharks_risk_fear_decision_attack_threat_by-peshkova-getty-100786972-large.jpg
[2]: https://blog.talosintelligence.com/2019/04/seaturtle.html
[3]: https://www.networkworld.com/article/3273891/hybrid-cloud/dns-in-the-cloud-why-and-why-not.html
[4]: https://www.networkworld.com/article/3322023/internet/dns-over-https-seeks-to-make-internet-use-more-private.html
[5]: https://www.networkworld.com/article/3298160/internet/how-to-protect-your-infrastructure-from-dns-cache-poisoning.html
[6]: https://www.networkworld.com/article/3331606/security/icann-housecleaning-revokes-old-dns-security-key.html
[7]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[8]: https://www.networkworld.com/article/3336201/batten-down-the-dns-hatches-as-attackers-strike-feds.html
[9]: https://cyber.dhs.gov/ed/19-01/
[10]: https://blog.talosintelligence.com/2018/11/dnspionage-campaign-targets-middle-east.html
[11]: https://krebsonsecurity.com/tag/dnspionage/
[12]: https://www.networkworld.com/article/2303073/lan-wan-what-is-transport-layer-security-protocol.html
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
