[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco security spotlights Microsoft Office 365 e-mail phishing increase)
[#]: via: (https://www.networkworld.com/article/3398925/cisco-security-spotlights-microsoft-office-365-e-mail-phishing-increase.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco security spotlights Microsoft Office 365 e-mail phishing increase
======
Cisco blog follows DHS Cybersecurity and Infrastructure Security Agency (CISA) report detailing risks around Office 365 and other cloud services
![weerapatkiatdumrong / Getty Images][1]

It’s no secret that if you have a cloud-based e-mail service, fighting off the barrage of security issues has become a maddening daily routine.

The leading e-mail service – in [Microsoft’s Office 365][2] package – seems to be getting the most attention from those attackers hellbent on stealing enterprise data or your private information via phishing attacks. Amazon and Google see their share of phishing attempts in their cloud-based services as well.

**[ Also see[What to consider when deploying a next generation firewall][3]. | Get regularly scheduled insights by [signing up for Network World newsletters][4]. ]**

But attackers are crafting and launching phishing campaigns targeting Office 365 users, [wrote][5] Ben Nahorney, a Threat Intelligence Analyst focused on covering the threat landscape for Cisco Security in a blog focusing on the Office 365 phishing issue.

Nahorney wrote of research from security vendor [Agari Data][6], that found over the last few quarters, there has been a steady increase in the number of phishing emails impersonating Microsoft. While Microsoft has long been the most commonly impersonated brand, it now accounts for more than half of all brand impersonations seen in the last quarter.

Recently cloud security firm Avanan wrote in its [annual phishing report][7], one in every 99 emails is a phishing attack, using malicious links and attachments as the main vector. “Of the phishing attacks we analyzed, 25 percent bypassed Office 365 security, a number that is likely to increase as attackers design new obfuscation methods that take advantage of zero-day vulnerabilities on the platform,” Avanan wrote.

The attackers attempt to steal a user’s login credentials with the goal of taking over accounts. If successful, attackers can often log into the compromised accounts, and perform a wide variety of malicious activity: Spread malware, spam and phishing emails from within the internal network; carry out tailored attacks such as spear phishing and [business email compromise][8] [a long-standing business scam that uses spear-phishing, social engineering, identity theft, e-mail spoofing], and target partners and customers, Nahorney wrote.

Nahorney wrote that at first glance, this may not seem very different than external email-based attacks. However, there is one critical distinction: The malicious emails sent are now coming from legitimate accounts.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][9] ]**

“For the recipient, it’s often even someone that they know, eliciting trust in a way that would not necessarily be afforded to an unknown source. To make things more complicated, attackers often leverage ‘conversation hijacking,’ where they deliver their payload by replying to an email that’s already located in the compromised inbox,” Nahorney stated.

The methods used by attackers to gain access to an Office 365 account are fairly straightforward, Nahorney wrote.

“The phishing campaigns usually take the form of an email from Microsoft. The email contains a request to log in, claiming the user needs to reset their password, hasn’t logged in recently or that there’s a problem with the account that needs their attention. A URL is included, enticing the reader to click to remedy the issue,” Nahorney wrote.

Once logged in, nefarious activities can go on unnoticed as the attacker has what look like authorized credentials.

“This gives the attacker time for reconnaissance: a chance to observe and plan additional attacks. Nor will this type of attack set off a security alert in the same way something like a brute-force attack against a webmail client will, where the attacker guesses password after password until they get in or are detected,” Nahorney stated.

Nahorney suggested the following steps customers can take to protect email:

  * Use multi-factor authentication. If a login attempt requires a secondary authorization before someone is allowed access to an inbox, this will stop many attackers, even with phished credentials.
  * Deploy advanced anti-phishing technologies. Some machine-learning technologies can use local identity and relationship modeling alongside behavioral analytics to spot deception-based threats.
  * Run regular phishing exercises. Regular, mandated phishing exercises across the entire organization will help to train employees to recognize phishing emails, so that they don’t click on malicious URLs, or enter their credentials into malicious website.



### Homeland Security flags Office 365, other cloud email services

The U.S. government, too, has been warning customers of Office 365 and other cloud-based email services that they should be on alert for security risks. The US Department of Homeland Security's Cybersecurity and Infrastructure Security Agency (CISA) this month [issued a report targeting][10] Office 365 and other cloud services saying:

“Organizations that used a third party have had a mix of configurations that lowered their overall security posture (e.g., mailbox auditing disabled, unified audit log disabled, multi-factor authentication disabled on admin accounts). In addition, the majority of these organizations did not have a dedicated IT security team to focus on their security in the cloud. These security oversights have led to user and mailbox compromises and vulnerabilities.”

The agency also posted remediation suggestions including:

  * Enable unified audit logging in the Security and Compliance Center.
  * Enable mailbox auditing for each user.
  * Ensure Azure AD password sync is planned for and configured correctly, prior to migrating users.
  * Disable legacy email protocols, if not required, or limit their use to specific users.



Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3398925/cisco-security-spotlights-microsoft-office-365-e-mail-phishing-increase.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/cso_phishing_social_engineering_security_threat_by_weerapatkiatdumrong_gettyimages-489433130_3x2_2400x1600-100796450-large.jpg
[2]: https://docs.microsoft.com/en-us/office365/securitycompliance/security-roadmap
[3]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://blogs.cisco.com/security/office-365-phishing-threat-of-the-month
[6]: https://www.agari.com/
[7]: https://www.avanan.com/hubfs/2019-Global-Phish-Report.pdf
[8]: https://www.networkworld.com/article/3195072/fbi-ic3-vile-5b-business-e-mail-scam-continues-to-breed.html
[9]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[10]: https://www.us-cert.gov/ncas/analysis-reports/AR19-133A
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
