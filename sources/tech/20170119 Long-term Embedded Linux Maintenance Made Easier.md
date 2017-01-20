Long-term Embedded Linux Maintenance Made Easier
============================================================

 ![Jan Lübbe ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/jan-lubbe-elc.png?itok=6G5lADKu "Jan Lübbe ") 
Pengutronix kernel hacker Jan Lübbe summarized growing security threats in embedded Linux and outlined a plan to keep long-life devices secure and fully functional in this talk from Embedded Linux Conference Europe.[The Linux Foundation][1]

The good old days when security breaches only happened to Windows folk are fading fast. Malware hackers and denial of service specialists are increasingly targeting out of date embedded Linux devices, and fixing Linux security vulnerabilities was the topic of several presentations at the [Embedded Linux Conference Europe ][3](ELCE) in October.

One of the best attended was “Long-Term Maintenance, or How to (Mis-)Manage Embedded Systems for 10+ Years” by [Pengutronix][4] kernel hacker Jan Lübbe. After summarizing the growing security threats in embedded Linux, Lübbe laid out a plan to keep long-life devices secure and fully functional. “We need to move to newer, more stable kernels and do continuous maintenance to fix critical vulnerabilities,” said Lübbe. “We need to do the upstreaming and automate processes, and put in place a sustainable workflow. We don’t have any more excuses for leaving systems in the field with outdated software.”

As Linux devices grow older, traditional lifecycle procedures are no longer up to the job. “Typically, you would take a kernel from a SoC vendor or mainline, take a build system, and add user space,” said Lübbe. “You customize that and add an application, and do some testing and you’re done. But then there’s a maintenance phase for 15 years, and you better hope you have no platform changes, or want to add new features, or need to apply regulatory changes.”

All these changes increasingly expose your system to new errors, and require massive updates to keep in sync with upstream software. “But it’s not always unintentional errors that occur in the kernel that lead to problems,” said Lübbe. “These vendor kernels never went through the mainline community review process,” he added, noting the [backdoor][5] found last year in an Allwinner kernel.

“You cannot trust that your vendor will do the correct thing,” continued Lübbe. “Maybe only one or two engineers looked at that backdoor code. That would never happen if the patch was posted on a Linux kernel mailing list. Somebody would notice. Hardware vendors don’t care about security or maintenance. Maybe you get an update after one or two years, but even then it usually takes years between the time they start developing based on one fixed version to the point they declare it stable. If you then start developing on that base, you add maybe another half a year, and it’s even more obsolete.”

Increasingly, embedded developers working with long-life products build on Long Term Stable (LTS) kernels. But that doesn’t mean your work is done. “After a product is released, people don’t often follow the stable release chain anymore, so they don’t apply the security patches,” said Lübbe. “You’re getting the worst of both worlds: an obsolete kernel and no security. You don’t get the benefit of testing by many people.”

Lübbe noted that Pengutronix customers that used server-oriented distributions like Red Hat often ran into problems due to the rapid rate of customizations, as well as deployment and update systems that assume a sysadmin is on duty.

“The updates can work for some things, especially if they are x86, but each project is basically on its own to build infrastructure to update to new releases.”

Many developers choose backporting as a solution for updating long-life products. “It’s easy in the beginning, but once you are no longer in the project's maintenance window, they don’t tell you if the version you use is affected by a bug, so it becomes much more difficult to find out if a fix is relevant,” said Lübbe. “So you pile up patches and changes and the bugs accumulate, and you have to maintain them yourself because no one else is using those patches. The benefits of using open source software are lost.”

### Follow Upstream Projects

The best solution, argues Lübbe, is to follow releases maintained by upstream projects. “We’ve mostly focused on mainline based development, so we have as little difference as possible between the product and the mainstream kernel and other upstream projects. Long-term systems are well supported in mainline. Most systems that don’t use 3D graphics can run very few patches. Newer kernel versions also have lots of [new hardening features][6] that reduce the impact of vulnerabilities.”

Following mainline seems daunting to many developers, but it’s relatively easy if you implement procedures from the start, and then stick to them, said Lübbe. “You need to develop processes for everything you do on the system,” he said. “You always need to know what software is running, which is easier when you use a good build system. Each software release should define the complete system so you can update everything in the field. If you don’t know what’s there, you can’t fix it. You also want to have automated testing and automated deployment of updates.”

To “save an update cycle,” Lübbe recommends using the most recent Linux kernel when you start developing, and only moving to a stable kernel when you enter testing. After that, he suggests updating all the software in the system, including kernel, build system, user space, glibc, and components like OpenSSL every year, to versions that are supported by the upstream projects for the rest of the year.

“Just because you update at that point doesn’t mean you need to deploy,” said Lübbe. “If you see no security vulnerabilities, you can just put the patch on the shelf and have it ready if you need it.”

Finally, Lübbe recommends looking at release announcements every month, and checking out security announcements on CVE and mainline lists every week. You only need to respond “if the security announcement actually affects you,” he added. “If your kernel is current enough, it’s not too much work. You don’t want to get feedback on your product by seeing your device in the news.”

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/ELCE/2017/long-term-embedded-linux-maintenance-made-easier

作者：[ERIC BROWN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.linux.com/files/images/jan-lubbe-elcpng
[3]:http://events.linuxfoundation.org/events/archive/2016/embedded-linux-conference-europe
[4]:http://www.pengutronix.de/index_en.html
[5]:http://arstechnica.com/security/2016/05/chinese-arm-vendor-left-developer-backdoor-in-kernel-for-android-pi-devices/
[6]:https://www.linux.com/news/event/ELCE/2017hardening-kernel-protect-against-attackers
