The aftermath of the Gentoo GitHub hack
======

![](https://images.idgesg.net/images/article/2018/07/gentoo_penguins-100763422-large.jpg)

### Gentoo GitHub hack: What happened?

Late last month (June 28), the Gentoo GitHub repository was attacked after someone gained control of an admin account. All access to the repositories was soon removed from Gentoo developers. Repository and page content were altered. But within 10 minutes of the attacker gaining access, someone noticed something was going on, 7 minutes later a report was sent, and within 70 minutes the attack was over. Legitimate Gentoo developers were shut out for 5 days while the dust settled and repairs and analysis were completed.

The attackers also attempted to add "rm -rf" commands to some repositories to cause user data to be recursively removed. As it turns out, this code was unlikely to be run because of technical precautions that were in place, but this wouldn't have been obvious to the attacker.

One of the things that constrained how big a disaster this break in might have turned out to be was that the attack was "loud." The removal of developers resulted in them being emailed, and developers quickly discovered they'd been shut out. A stealthier attack might have led to a significant delay in anyone responding to the problem and a significantly bigger problem.

A detailed timeline showing the details of what happened is available at the [Gentoo Linux site][1].

### How the Gentoo GitHub attack happened

Much of the focus in the aftermath of this very significant attack has been on how the attacker was able to gain admin access and what might have been done differently to keep the site safe. The most obvious take-home was that the admin's password was guessed because it too closely related to one that had been captured on another system. This might be like your using "Spring2018" on one system and "Summer2018" on another.

Another problem was that it was unclear how end users might have been able to tell whether or not they had a clean copy of the code, and there was no confirmation as to whether the malicious commits (accessible for a while) would execute.

### Lessons learned from the hack

The lessons learned should come as no surprise. We should all be careful not to use the same password on multiple systems and not to use passwords that relate to each other so strongly that knowing one in a set suggests another.

We also have to admit that two-factor authentication would have prevented this break-in. While something of a burden on users (i.e., they may have to carry a token generator or confirm their login through some secondary service), it very strongly limits who can get access to an account.

Of course the lessons learned should also not overlook what this incident showed us was going right. The fact that the break-in was noticed so quickly and that communications lines were functional meant the break-in could be quickly addressed. The breach was also made public, the repository was only a secondary copy of the main Gentoo source code, and changes in the main repository were signed and could be verified.

#### The best news

The really good news is that it appears that no one was affected by the break in other than the fact that developers were locked out for a while. The hackers weren't able to penetrate Gentoo's master repository (the default location for automatic updates). They also weren't able to get their hands on Gentoo's digital signing key. This means that default updates would have rejected their files as fakes.

The harm that could have been made to Gentoo's reputation was avoided by the precautions in place and their professional handling of the incident. What could have cost them a lot ended up as a confirmation of what they're doing right and added to their determination to make some changes to strengthen their security. They faced up to some cyberbullies and came out stronger and more confident.

### Fixing the potholes

Gentoo is already addressing the weaknesses that contributed to the break-in. They are making frequent backups of their GitHub Organization (i.e., their content), starting to use two-factor authentication by default, working on an incident response plan with a focus on sharing information about a security incident with their users, and tightening procedures around credential revocation. They are also reducing the number of users with elevated privileges, auditing logins, and publishing password policies that mandate the use of password managers.

### Gentoo and GitHub

For readers unfamiliar with Gentoo, it's important to understand that Gentoo is different than most Linux distributions. Users download and then compile the source to build the OS they will then be using. It's as close to the Linux mantra of “know how to do it yourself” as you can get.

Git is a code management system not unlike CVS, and GitHub provides repositories for the code.

### Gentoo strengths

Gentoo users tend to be more knowledgeable about the low-level aspects of the OS (e.g., kernel configuration and hardware support) than most Linux users — probably due to their interest in working with the source code. The OS is also highly scalable and flexible with a "build what you need" focus. The name derives from that of the "Gentoo penguin" — a penguin breed that lives on many sub-Antarctic islands. More information and downloads are available at [www.gentoo.org][2].

### More on the Gentoo GitHub break-in

More information on the break in is available on [Naked Security][3] and (as noted above) the [Gentoo site][1].

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3287973/linux/the-aftermath-of-the-gentoo-github-hack.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://wiki.gentoo.org/wiki/Project:Infrastructure/Incident_Reports/2018-06-28_Github
[2]:https://www.gentoo.org/
[3]:https://nakedsecurity.sophos.com/2018/06/29/linux-distro-hacked-on-github-all-code-considered-compromised/
[4]:https://www.facebook.com/NetworkWorld/
[5]:https://www.linkedin.com/company/network-world
