Why Linux is better than Windows or macOS for security
======

![](https://images.idgesg.net/images/article/2018/02/linux_security_vs_macos_and_windows_locks_data_thinkstock-100748607-large.jpg)

Enterprises invest a lot of time, effort and money in keeping their systems secure. The most security-conscious might have a security operations center. They of course use firewalls and antivirus tools. They probably spend a lot of time monitoring their networks, looking for telltale anomalies that could indicate a breach. What with IDS, SIEM and NGFWs, they deploy a veritable alphabet of defenses.

But how many have given much thought to one of the cornerstones of their digital operations: the operating systems deployed on the workforce’s PCs? Was security even a factor when the desktop OS was selected?

This raises a question that every IT person should be able to answer: Which operating system is the most secure for general deployment?

We asked some experts what they think of the security of these three choices: Windows, the ever-more-complex platform that’s easily the most popular desktop system; macOS X, the FreeBSD Unix-based operating system that powers Apple Macintosh systems; and Linux, by which we mean all the various Linux distributions and related Unix-based systems.

### How we got here

One reason enterprises might not have evaluated the security of the OS they deployed to the workforce is that they made the choice years ago. Go back far enough and all operating systems were reasonably safe, because the business of hacking into them and stealing data or installing malware was in its infancy. And once an OS choice is made, it’s hard to consider a change. Few IT organizations would want the headache of moving a globally dispersed workforce to an entirely new OS. Heck, they get enough pushback when they move users to a new version of their OS of choice.

Still, would it be wise to reconsider? Are the three leading desktop OSes different enough in their approach to security to make a change worthwhile?

Certainly the threats confronting enterprise systems have changed in the last few years. Attacks have become far more sophisticated. The lone teen hacker that once dominated the public imagination has been supplanted by well-organized networks of criminals and shadowy, government-funded organizations with vast computing resources.

Like many of you, I have firsthand experience of the threats that are out there: I have been infected by malware and viruses on numerous Windows computers, and I even had macro viruses that infected files on my Mac. More recently, a widespread automated hack circumvented the security on my website and infected it with malware. The effects of such malware were always initially subtle, something you wouldn’t even notice, until the malware ended up so deeply embedded in the system that performance started to suffer noticeably. One striking thing about the infestations was that I was never specifically targeted by the miscreants; nowadays, it’s as easy to attack 100,000 computers with a botnet as it is to attack a dozen.

### Does the OS really matter?

The OS you deploy to your users does make a difference for your security stance, but it isn’t a sure safeguard. For one thing, a breach these days is more likely to come about because an attacker probed your users, not your systems. A [survey][1] of hackers who attended a recent DEFCON conference revealed that “84 percent use social engineering as part of their attack strategy.” Deploying a secure operating system is an important starting point, but without user education, strong firewalls and constant vigilance, even the most secure networks can be invaded. And of course there’s always the risk of user-downloaded software, extensions, utilities, plug-ins and other software that appears benign but becomes a path for malware to appear on the system.

And no matter which platform you choose, one of the best ways to keep your system secure is to ensure that you apply software updates promptly. Once a patch is in the wild, after all, the hackers can reverse engineer it and find a new exploit they can use in their next wave of attacks.

And don’t forget the basics. Don’t use root, and don’t grant guest access to even older servers on the network. Teach your users how to pick really good passwords and arm them with tools such as [1Password][2] that make it easier for them to have different passwords on every account and website they use.

Because the bottom line is that every decision you make regarding your systems will affect your security, even the operating system your users do their work on.

**[ To comment on this story, visit[Computerworld's Facebook page][3]. ]**

### Windows, the popular choice

If you’re a security manager, it is extremely likely that the questions raised by this article could be rephrased like so: Would we be more secure if we moved away from Microsoft Windows? To say that Windows dominates the enterprise market is to understate the case. [NetMarketShare][4] estimates that a staggering 88% of all computers on the internet are running a version of Windows.

If your systems fall within that 88%, you’re probably aware that Microsoft has continued to beef up security in the Windows system. Among its improvements have been rewriting and re-rewriting its operating system codebase, adding its own antivirus software system, improving firewalls and implementing a sandbox architecture, where programs can’t access the memory space of the OS or other applications.

But the popularity of Windows is a problem in itself. The security of an operating system can depend to a large degree on the size of its installed base. For malware authors, Windows provides a massive playing field. Concentrating on it gives them the most bang for their efforts.
As Troy Wilkinson, CEO of Axiom Cyber Solutions, explains, “Windows always comes in last in the security world for a number of reasons, mainly because of the adoption rate of consumers. With a large number of Windows-based personal computers on the market, hackers historically have targeted these systems the most.”

It’s certainly true that, from Melissa to WannaCry and beyond, much of the malware the world has seen has been aimed at Windows systems.

### macOS X and security through obscurity

If the most popular OS is always going to be the biggest target, then can using a less popular option ensure security? That idea is a new take on the old — and entirely discredited — concept of “security through obscurity,” which held that keeping the inner workings of software proprietary and therefore secret was the best way to defend against attacks.

Wilkinson flatly states that macOS X “is more secure than Windows,” but he hastens to add that “macOS used to be considered a fully secure operating system with little chance of security flaws, but in recent years we have seen hackers crafting additional exploits against macOS.”

In other words, the attackers are branching out and not ignoring the Mac universe.

Security researcher Lee Muson of Comparitech says that “macOS is likely to be the pick of the bunch” when it comes to choosing a more secure OS, but he cautions that it is not impenetrable, as once thought. Its advantage is that “it still benefits from a touch of security through obscurity versus the still much larger target presented by Microsoft’s offering.”

Joe Moore of Wolf Solutions gives Apple a bit more credit, saying that “off the shelf, macOS X has a great track record when it comes to security, in part because it isn’t as widely targeted as Windows and in part because Apple does a pretty good job of staying on top of security issues.”

### And the winner is … 

You probably knew this from the beginning: The clear consensus among experts is that Linux is the most secure operating system. But while it’s the OS of choice for servers, enterprises deploying it on the desktop are few and far between.

And if you did decide that Linux was the way to go, you would still have to decide which distribution of the Linux system to choose, and things get a bit more complicated there. Users are going to want a UI that seems familiar, and you are going to want the most secure OS.

As Moore explains, “Linux has the potential to be the most secure, but requires the user be something of a power user.” So, not for everyone.

Linux distros that target security as a primary feature include [Parrot Linux][5], a Debian-based distro that Moore says provides numerous security-related tools right out of the box.

Of course, an important differentiator is that Linux is open source. The fact that coders can read and comment upon each other’s work might seem like a security nightmare, but it actually turns out to be an important reason why Linux is so secure, says Igor Bidenko, CISO of Simplex Solutions. “Linux is the most secure OS, as its source is open. Anyone can review it and make sure there are no bugs or back doors.”

Wilkinson elaborates that “Linux and Unix-based operating systems have less exploitable security flaws known to the information security world. Linux code is reviewed by the tech community, which lends itself to security: By having that much oversight, there are fewer vulnerabilities, bugs and threats.”

That’s a subtle and perhaps counterintuitive explanation, but by having dozens — or sometimes hundreds — of people read through every line of code in the operating system, the code is actually more robust and the chance of flaws slipping into the wild is diminished. That had a lot to do with why PC World came right out and said Linux is more secure. As Katherine Noyes [explains][6], “Microsoft may tout its large team of paid developers, but it’s unlikely that team can compare with a global base of Linux user-developers around the globe. Security can only benefit through all those extra eyeballs.”

Another factor cited by PC World is Linux’s better user privileges model: Windows users “are generally given administrator access by default, which means they pretty much have access to everything on the system,” according to Noyes’ article. Linux, in contrast, greatly restricts “root.”

Noyes also noted that the diversity possible within Linux environments is a better hedge against attacks than the typical Windows monoculture: There are simply a lot of different distributions of Linux available. And some of them are differentiated in ways that specifically address security concerns. Security Researcher Lee Muson of Comparitech offers this suggestion for a Linux distro: “The[Qubes OS][7] is as good a starting point with Linux as you can find right now, with an [endorsement from Edward Snowden][8] massively overshadowing its own extremely humble claims.” Other security experts point to specialized secure Linux distributions such as [Tails Linux][9], designed to run securely and anonymously directly from a USB flash drive or similar external device.

### Building security momentum

Inertia is a powerful force. Although there is clear consensus that Linux is the safest choice for the desktop, there has been no stampede to dump Windows and Mac machines in favor of it. Nonetheless, a small but significant increase in Linux adoption would probably result in safer computing for everyone, because in market share loss is one sure way to get Microsoft’s and Apple’s attention. In other words, if enough users switch to Linux on the desktop, Windows and Mac PCs are very likely to become more secure platforms.

--------------------------------------------------------------------------------

via: https://www.computerworld.com/article/3252823/linux/why-linux-is-better-than-windows-or-macos-for-security.html

作者：[Dave Taylor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.computerworld.com/author/Dave-Taylor/
[1]:https://www.esecurityplanet.com/hackers/fully-84-percent-of-hackers-leverage-social-engineering-in-attacks.html
[2]:http://www.1password.com
[3]:https://www.facebook.com/Computerworld/posts/10156160917029680
[4]:https://www.netmarketshare.com/operating-system-market-share.aspx?options=%7B%22filter%22%3A%7B%22%24and%22%3A%5B%7B%22deviceType%22%3A%7B%22%24in%22%3A%5B%22Desktop%2Flaptop%22%5D%7D%7D%5D%7D%2C%22dateLabel%22%3A%22Trend%22%2C%22attributes%22%3A%22share%22%2C%22group%22%3A%22platform%22%2C%22sort%22%3A%7B%22share%22%3A-1%7D%2C%22id%22%3A%22platformsDesktop%22%2C%22dateInterval%22%3A%22Monthly%22%2C%22dateStart%22%3A%222017-02%22%2C%22dateEnd%22%3A%222018-01%22%2C%22segments%22%3A%22-1000%22%7D
[5]:https://www.parrotsec.org/
[6]:https://www.pcworld.com/article/202452/why_linux_is_more_secure_than_windows.html
[7]:https://www.qubes-os.org/
[8]:https://twitter.com/snowden/status/781493632293605376?lang=en
[9]:https://tails.boum.org/about/index.en.html
