[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Web of Trust, Part 1: Concept)
[#]: via: (https://fedoramagazine.org/web-of-trust-part-1-concept/)
[#]: author: (Kevin "Eonfge" Degeling https://fedoramagazine.org/author/eonfge/)

Web of Trust, Part 1: Concept
======

![][1]

Every day we rely on technologies who nobody can fully understand. Since well before the industrial revolution, complex and challenging tasks required an approach that broke out the different parts into smaller scale tasks. Each resulting in specialized knowledge used in some parts of our lives, leaving other parts to trust in skills that others had learned. This shared knowledge approach also applies to software. Even the most avid readers of this magazine, will likely not compile and validate every piece of code they run. This is simply because the world of computers is itself also too big for one person to grasp.

Still, even though it is nearly impossible to understand everything that happens within your PC when you are using it, that does not leave you blind and unprotected. FLOSS software shares trust, giving protection to all users, even if individual users can’t grasp all parts in the system. This multi-part article will discuss how this ‘Web of Trust’ works and how you can get involved.

But first we’ll have to take a step back and discuss the basic concepts, before we can delve into the details and the web. Also, a note before we start, security is not just about viruses and malware. Security also includes your privacy, your economic stability and your technological independence.

### One-Way System

By their design, computers can only work and function in the most rudimentary ways of logic: _True_ or _false_. _And_ or _Or._ This (boolean logic) is not readily accessible to humans, therefore we must do something special. We write applications in a code that we can (reasonably) comprehend (human readable). Once completed, we turn this human readable code into a code that the computer can comprehend (machine code).

The step of conversion is called compilation and/or building, and it’s a one-way process. Compiled code (machine code) is not really understandable by humans, and it takes special tools to study in detail. You can understand small chunks, but on the whole, an entire application becomes a black box.

This subtle difference shifts power. Power, in this case being the influence of one person over another person. The person who has written the human-readable version of the application and then releases it as compiled code to use by others, knows all about what the code does, while the end user knows a very limited scope. When using (software) in compiled form, it is impossible to know for certain what an application is intended to do, unless the original human readable code can be viewed.

### **The Nature of Power**

Spearheaded by Richard Stallman, this shift of power became a point of concern. This discussion started in the 1980s, for this was the time that computers left the world of academia and research, and entered the world of commerce and consumers. Suddenly, that power became a source of control and exploitation.

One way to combat this imbalance of power, was with the concept of FLOSS software. FLOSS Software is built on [4-Freedoms][2], which gives you a wide array of other ‘affiliated’ rights and guarantees. In essence, FLOSS software uses copyright-licensing as a form of moral contract, that forces software developers not to leverage the one-way power against their users. The principle way of doing this, is with the the GNU General Public Licenses, which Richard Stallman created and has since been promoting.

One of those guarantees, is that you can see the code that should be running on your device. When you get a device using FLOSS software, then the manufacturer should provide you the code that the device is using, as well as all instructions that you need to compile that code yourself. Then you can replace the code on the device with the version you can compile yourself. Even better, if you compare the version you have with the version on the device, you can see if the device manufacturer tried to cheat you or other customers.

This is where the web of Trust comes back into the picture. The Web of Trust implies that even if the vast majority of people can’t validate the workings of a device, that others can do so on their behalf. Journalists, security analysts and hobbyists, can do the work that others might be unable to do. And if they find something, they have the power to share their findings.

### Security by B**lind** **Trust**

This is of course, if the application and all components underneath it, are FLOSS. Proprietary software, or even software which is merely Open Source, has compiled versions that nobody can recreate and validate. Thus, you can never truly know if that software is secure. It might have a backdoor, it might sell your personal data, or it might be pushing a closed ecosystem to create a vendor-lock. With closed-source software, your security is as good as the company making the software is trustworthy.

For companies and developers, this actually creates another snare. While you might still care about your users and their security, you’re a liability: If a criminal can get to your official builds or supply-chain, then there is no way for anybody to discover that afterwards. An increasing number of attacks do not target users directly, but instead try to get in, by exploiting the trust the companies/developers have carefully grown.

You should also not underestimate pressure from outside: Governments can ask you to ignore a vulnerability, or they might even demand cooperation. Investment firms or shareholders, may also insist that you create a vendor-lock for future use. The blind trust that you demand of your users, can be used against you.

### Security by a Web of Trust

If you are a user, FLOSS software is good because others can warn you when they find suspicious elements. You can use any FLOSS device with minimal economic risk, and there are many FLOSS developers who care for your privacy. Even if the details are beyond you, there are rules in place to facilitate trust.

If you are a tinkerer, FLOSS is good because with a little extra work, you can check the promises of others. You can warn people when something goes wrong, and you can validate the warnings of others. You’re also able to check individual parts in a larger picture. The libraries used by FLOSS applications, are also open for review: It’s “Trust all the way down”.

For companies and developers, FLOSS is also a great reassurance that your trust can’t be easily subverted. If malicious actors wish to attack your users, then any irregularity can quickly be spotted. Last but not least, since you also stand to defend your customers economic well-being and privacy, you can use that as an important selling point to customers who care about their own security.

### Fedora’s case

Fedora embraces the concept of FLOSS and it stands strong to defend it. There are comprehensive [legal guidelines][3], and Fedora’s principles are directly referencing the 4-Freedoms: [Freedom, Friends, Features, and First][4]

![][5]

To this end, entire systems have been set up to facilitate this kind of security. Fedora works completely in the open, and any user can check the official servers. [Koji][6] is the name of the Fedora Buildsystem, and you can see every application and it’s build logs there. For added security, there is also [Bohdi][7], which orchestrates the deployment of an application. Multiple people must approve it, before the application can become available.

This creates the Web of Trust on which you can rely. Every package in the repository goes through the same process, and at every point somebody can intervene. There are also escalation systems in place to report issues, so that issues can quickly be tackled when they occur. Individual contributors also know that they can be reviewed at every time, which itself is already enough of a precaution to dissuade mischievous thoughts.

You don’t have to trust Fedora (implicitly), you can get something better; trust in users like you.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/web-of-trust-part-1-concept/

作者：[Kevin "Eonfge" Degeling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/09/weboftrust1-816x345.jpg
[2]: https://fsfe.org/freesoftware/freesoftware.en.html
[3]: https://fedoraproject.org/wiki/Licensing:Main?rd=Licensing
[4]: https://docs.fedoraproject.org/en-US/project/
[5]: https://fedoramagazine.org/wp-content/uploads/2020/09/foundations_expand_1_freedom.png
[6]: https://koji.fedoraproject.org/koji/index
[7]: https://bodhi.fedoraproject.org/
