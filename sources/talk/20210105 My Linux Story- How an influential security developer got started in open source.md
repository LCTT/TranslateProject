[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My Linux Story: How an influential security developer got started in open source)
[#]: via: (https://opensource.com/article/21/1/lynis)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

My Linux Story: How an influential security developer got started in open source
======
Michael Boelen shares how he strengthened Lynis by building a company
around the open source, security auditing and hardening tool.
![A lock on the side of a building][1]

Michael Boelen is very active in computer security. He is the author of the popular open source security tools Rootkit Hunter ([rkhunter][2]) and [Lynis][3], and he blogs about Linux security on [Linux Audit][4] and evaluates security tools on [Linux Security Expert][5]. He also formed a company named [CISOfy][6] around the Lynis tool to help organizations with security audits of multiple operating systems.

[Having used Lynis][7], I was eager to speak with Michael to learn about his views on Linux, security, and open source software. The following interview has been edited for clarity and conciseness.

**Gaurav: Michael, could you please introduce yourself?**

**Michael:** Hi there! My name is Michael Boelen, and I live in the southern part of The Netherlands with my wife, Debbie, and our son, Hugo. I was born in 1982 and got hooked on computers early when we got a used Commodore 64 from our neighbors. In the beginning, my brother and I played games like [Boulder Dash][8] on it. Then I discovered you could create your own programs in BASIC. It was a magical feeling to make something out of nothing. At the age of 10, my programs were simple, but the desire to create more had emerged.

Later on, I moved to a 286 with MS-DOS. It did not take long before it got infected with a computer virus. Some viruses were pretty funny, like characters that slowly dropped from the screen. Maybe this is the origin of my interest in malware and information security.

You could always find me behind the computer when I was not at school. We played games on the computers that followed, like a 150MHz Intel Pentium and later a 450MHz Intel Pentium III. When I was alone, I tried to figure out how things worked, including programming and learning how to build computers.

Moving quickly forward: I completed school a bit too easily due to circumstances like not having the right modules. For example, I dropped mathematics B because I didn't like it. A few years later, my mentor told me that I could not proceed to higher education due to missing that module. Oops… So I had to continue education below my level. It did not encourage me to study further after completing it, so I went on a job hunt. I got my first full-time job in 2002 at a small company that created a customer relationship management (CRM) solution with some additional web development. My direct manager saw my potential and gave me the freedom to research and optimize or replace existing services. I migrated an old system running Sendmail, created a new DNS server, and developed a custom web interface for both. I was doing DevOps when the word did not exist yet.

After my first full-time job, I switched to a consultancy company. This company served most of the more prominent companies in The Netherlands. It provided me with a few opportunities to work for multinationals like Philips, ASML, and a daughter company of Deutsche Telekom named T-Systems. Work included technical responsibilities for things like Unix administration and data storage. Next in line were roles such as security officer, problem manager, and service manager. That last role taught me more about financial planning, budgeting, servicing internal stakeholders, and dealing with deadlines.

It came time to take a bold step: say farewell to a well-paying job and start my own company. That happened in 2013. The idea was to create a valuable service that used the open source tool Lynis in its core. At the same time, it allowed me to do more development on the tool while allowing me to make a living. Fortunately, things worked out well for me and, more importantly, for the Lynis project.

**Gaurav: You have been associated with open source software and security for quite some time. What projects have you worked on?**

**Michael:** People may know me from two popular software projects named rkhunter and Lynis. I created rkhunter in 2003 to offer an alternative for chkrootkit. As the name implies, it finds traces of rootkits or other malware parts that can exist on a system.

The other tool is Lynis, a security tool to scan Unix-based systems to detect room for improvement when it comes to system hardening.

**Gaurav: How did you get started in open source?**

**Michael:** My real start with open source was in 2003 with rkhunter. I did not have enough shell scripting experience to help the chkrootkit project when I found it showed several false positives on a FreeBSD system. Instead, I decided it was a great opportunity to learn shell scripting and, at the same time, build a useful tool. As a bonus challenge, I thought it was a good idea to make it [POSIX][9] compatible. This way, it could run on Linux, but also on BSD, Solaris, and others.

**Gaurav: What does open source software mean to you?**

**Michael:** Open source is a way to express creativity in software while solving a problem. With the right license, it allows almost anyone to use the software, typically for free. That is also important, as not everyone has the luxury to pay for software or related services. The Dutch are known to be humble, outspoken, and in love with things being "gratis." This word is the same in Latin and means "for thanks" or "for nothing." While the F in FOSS does not refer to this type of free, I believe it is a powerful driver to bring the software into more people's hands. That is valuable in itself, as it can open the gates to more feedback, ideas, or even code improvements.

**Gaurav: What compelled you to develop Lynis?**

**Michael:** In 2007, while being between two jobs for a month, I wanted to start a new project that helped me in my own job of improving security aspects of Linux and Unix-based systems. Existing tooling seemed to be outdated, so I wanted a fresh start.

**Gaurav: How is Lynis different from other security tools available out there? What has been your experience promoting Lynis as an open source tool?**

**Michael:** There are many security tools available. I'm reviewing many of them as part of the Linux Security Expert project. After looking at hundreds of tools, I found that Lynis has something that many of them don't have. The difference is "simplicity," or making the tool as easy to use as possible. From this experience, I can also share that it is really hard to make a tool simple to use.

When it comes to promoting Lynis, I try to diversify things. Sometimes it is writing about it in a blog post or speaking at a conference. At the same time, the value of the tool itself does the real promotion. People tend to share the tool with others because they like it. I strongly believe in the value of promotion. It shows your creation to more people, resulting in increased usage and suggestions. So, if you are a tool author, don't skip this part. You might like to read my blog post _[How to promote your open source project][10]_.

**Gaurav: You also run a popular blog at Linux Audit. Does it complement your learning from Lynis or Linux security in general?**

**Michael:** Yes, the blog is popular and consists of hundreds of articles. Nowadays, I get less time to write, but I hope that will change soon. Blogging is a great way to dive into a difficult subject and turn it into something easier for the reader to understand. The principle of "simplicity" really applies here as well. The blog focuses on Linux security, including the use of Lynis, but also other relevant topics.

**Gaurav: You also formed a company named CISOfy around Lynis and to provide training. Please tell me about these.**

**Michael:** I'm very wary about companies using their open source software as a marketing instrument. That's not how Lynis and CISOfy relate. The Lynis project was there long before the company was founded (2007 and 2013, respectively). Instead of the software being closed, as with some other security companies, the company allowed me to do more active development on the tool and gave it a big boost. I believe that doing good for others returns the favor in unexpected ways.

And I'm also very strict when it comes to Lynis: It must remain open source. That is one of the primary reasons I founded the company.

To ensure that there's a clear line in the sand, we named the commercial part Lynis Enterprise. It is not an extended version of Lynis but a separate thing that actually requires the Lynis tool. This way, the company relies on the quality of the tool, which gives it a strong motivation to keep investing in Lynis. Everyone wins, as both the community and customers get a better tool in their hands.

Although textbooks say companies exist to make money and turn a profit, I discovered that a software company can also make a difference. For this reason, I decided several years ago that we should no longer use tools like Google Analytics, and we got rid of tracking technologies. We also limit the data that we collect and store to the bare minimum to conduct business. I dislike spam, so that is also the reason we don't reach out to companies or individuals. You only receive email from us if you requested it or do business with us. Right now, I want CISOfy to become even more proactive in things besides privacy. One is to support more sustainability initiatives, such as becoming CO2 neutral or even absorbing CO2. Things like using solar power, donating to causes that help with replanting of forests, switching a more sustainable bank, and so on.

**Gaurav: As Linux continues to grow, it will likely continue to be a target for malware authors. What do you think?**

**Michael:** We have already seen an increase, even though most attacks still focus on Windows, Android, and Apple-based systems. My guess is that targeting a Linux system has its own challenges, such as the variety in distributions and versions.

**Gaurav: How is ransomware different from regular malware, and how should organizations tackle this threat?**

**Michael:** It is a different threat actor with the primary focus on getting your data and holding it hostage. My suggestion is simple: [make backups and test your restores][11].

**Gaurav: People often want to work on Linux security but have no idea where to start. How do you suggest they get started?**

**Michael:** I would suggest implementing security measures on your personal systems or any test devices that you have available. If you don't know where to start, then Lynis might be a good inspiration for what can be done when it comes to Linux security. You also mentioned the Linux Audit blog, which might help readers get more familiar with the subject.

**Gaurav: Are you working on any interesting new projects or tools?**

**Michael:** Spare time is minimal currently. We recently moved to a new house and are still settling in. When my spare time increases, I will most likely start blogging again and reviewing security tools for the Linux Security Expert website.

**Gaurav: When not working on Lynis or security tooling, what do you do in your spare time?**

**Michael:** It depends a little bit on the season. I like a good walk and drinking a whisky. Then there are the chores at home and in the garden. My current focus is on cleaning up the crawl space under the house to add additional floor insulation. The attic also needs further insulation. Not an average spare-time project, but essential for the comfort level in the future.

### Find out more

If you're interested in learning how to secure your operating system, you will find a wealth of information on Michael's blogs. Also, open source enthusiasts should try Lynis to uncover weaknesses in their systems and learn how to mitigate them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/lynis

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: http://rkhunter.sourceforge.net/
[3]: https://cisofy.com/lynis/
[4]: https://linux-audit.com/
[5]: https://linuxsecurity.expert/
[6]: https://cisofy.com/
[7]: https://opensource.com/article/20/5/linux-security-lynis
[8]: https://en.wikipedia.org/wiki/Boulder_Dash
[9]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[10]: https://linux-audit.com/how-to-promote-your-open-source-project/
[11]: https://opensource.com/article/19/3/backup-solutions
