[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to stop typosquatting attacks)
[#]: via: (https://opensource.com/article/20/1/stop-typosquatting-attacks)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

How to stop typosquatting attacks
======
Typosquatting is a way to lure users into divulging sensitive data to
cybercriminals. Learn how to protect your organization, your open source
project, and yourself.
![Gears above purple clouds][1]

Cybercriminals are turning to social engineering to try to trick unsuspecting people into divulging private information or valuable credentials. It is behind many [phishing scams][2] where the attacker poses as a reputable company or organization and uses it as a front to distribute a virus or other piece of malware.

One such risk is [typosquatting][3], a form of social engineering attack that tries to lure users into visiting malicious sites with URLs that are common misspellings of legitimate sites. These sites can cause significant damage to the reputation of organizations that are victimized by these attackers and harm users who are tricked into entering sensitive details into fake sites. Both system administrators and users need to be aware of the risks and take steps to protect themselves.

Open source software, which is developed and tested by large groups in public repositories, is often lauded for its security benefits. However, when it comes to social engineering schemes and malware implantation, even open source tools can fall victim.

This article looks at the rising trend of typosquatting and what these attacks could mean for open source software in the future.

### What is typosquatting?

Typosquatting is a very specific form of cybercrime that is often tied to a larger phishing attack. It begins with the cybercriminal buying and registering a domain name that is the misspelling of a popular site. For example, the cybercriminal might add an extra vowel or replace an "i" with a lowercase "l" character. Sometimes a cybercriminal obtains dozens of domain names, each with a different spelling variation.

A typosquatting attack does not become dangerous until real users start visiting the site. To make that happen, the criminal runs a phishing scam, typically over email, to urge people to click a link and visit the typosquatting website. Normally these rogue pages have simple login screens bearing familiar logos that try to imitate the real company's design.

If the user does not realize they are visiting a fake website and enters sensitive details, such as their password, username, or credit card number, into the page, the cybercriminal gets full access to that data. If a user is utilizing the same password across several sites, their other online accounts are likely to be exploited as well. This is a cybercriminal's payout: identity theft, ruined credit reports, stolen records, and sometimes worse.

### Some recent attacks

From a company perspective, having a typosquatting attack connected to your domain name can be a public relations disaster, even though you played no direct role in it, because it's seen as irresponsible internet stewardship. As a domain owner, you have a responsibility to be proactive in defending against typosquatting to limit the pain caused by this type of fraud.

A few years ago, many [health insurance customers fell victim][4] to a typosquatting attack when they received a phishing email that pointed to we11point.com, with the number 1 replacing the character "l" in the URL.

When the international domain name rules were changed to allow anyone to register a URL with an extension previously tied to specific countries, it created a brand new wave of typosquatting attacks. One of the most prevalent ones seen today is when a cybercriminal registers a .om domain that matches a popular .com domain to take advantage of accidental omissions of the letter "c" when entering a web address.

### How to protect your website from typosquatting

For companies, the best strategy is to try to stay ahead of typosquatting attacks.

That means spending the money to trademark your domain and purchase all related URLs that could be easy misspellings. You don't need to buy all top-level domain variants of your site name, but at least focus on common misspellings to your primary site name.

If you need to send your users to third-party sites, do so from your official website, not in a mass email. It's important to firmly establish a policy that official communication always and only sends users to your site. That way, should a cybercriminal attempt to spoof communication from you, your users will know something's amiss when they end up on an unfamiliar page or URL structure.

Use an open source tool like [DNS Twist][5] to automatically scan your company's domain and determine whether there could already be a typosquatting attack in progress. DNS Twist runs on Linux operating systems and can be used through a series of shell commands.

Some ISPs offer typosquatting protection as part of their product offering. This functions as an extra layer of web filtering—if a user in your organization accidentally misspells a common URL, they are alerted that the page is blocked and redirected to the proper domain.

If you are a system administrator, consider running your own [DNS server][6] along with a blacklist of incorrect and forbidden domains.

Another effective way to spot a typosquatting attack in progress is to monitor your site traffic closely and set an alert for a sudden decrease in visitors from a particular region. It could be that a large number of your regular users have been redirected to a fake site.

As with almost any form of cyberattack, the key to stopping typosquatting is constant vigilance. Your users are counting on you to identify and shut down any fake sites that are operating under your name, and if you don't, you could lose your audience's trust.

### Typosquatting threats to open source software

Most major open source projects go through security and penetration testing, largely because the code is public. However, mistakes happen under even the best of conditions. Here are some things to watch for if you're involved in an open source project.

When you get a merge request or patch from an unknown source, review it carefully before merging, especially if there's a networking stack involved. Don't fall prey to the temptation of only testing your build; look at the code to ensure that nothing nefarious has been embedded into an otherwise functional enhancement.

Also, use the same rigor in protecting your project's identity as a business does for its domain. Don't let a cybercriminal create alternate download sites and offer a version of your project with additional harmful code. Use digital signatures, like the following, to create an assurance of authenticity for your software:


```
gpg --armor --detach-sig \
\--output advent-gnome.sig \
example-0.0.1.tar.xz
```

You should also provide a checksum for the file you deliver:


```
`sha256sum example-0.0.1.tar.xz > example-0.0.1.txt`
```

Provide these safeguards even if you don't believe your users will take advantage of them, because all it takes is one perceptive user to notice a missing signature on an alternative download to alert you that someone, somewhere is spoofing your project.

### Final thoughts

Humans are prone to making mistakes. When you have millions of people around the world typing in a common web address, it's no surprise that a certain percentage enter a typo in the URL. Cybercriminals are trying to capitalize on that trend with typosquatting.

It's hard to stop cybercriminals from registering domains that are available for purchase, so mitigate against typosquatting attacks by focusing on the ways they spread. The best protection is to build trust with your users and to be diligent in detecting typosquatting attempts. Together, as a community, we can all help ensure that typosquatting attempts are ineffective.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/stop-typosquatting-attacks

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chaos_engineer_monster_scary_devops_gear_kubernetes.png?itok=GPYLvfVh (Gears above purple clouds)
[2]: https://www.cloudberrylab.com/resources/guides/types-of-phishing/
[3]: https://en.wikipedia.org/wiki/Typosquatting
[4]: https://www.menlosecurity.com/blog/-a-new-approach-to-end-typosquatting
[5]: https://github.com/elceef/dnstwist
[6]: https://opensource.com/article/17/4/build-your-own-name-server
