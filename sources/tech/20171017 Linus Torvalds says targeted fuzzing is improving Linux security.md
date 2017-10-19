Linus Torvalds says targeted fuzzing is improving Linux security
============================================================

Linux 4.14 release candidate five is out. "Go out and test," says Linus Torvalds.

 ![linus-toravlds-linuxcon-toronto.jpg](http://zdnet4.cbsistatic.com/hub/i/r/2016/09/13/02537e55-6620-4c3b-aa09-c9c068f3823b/resize/770xauto/b866caa8695edbec68f67da0e9a411e9/linus-toravlds-linuxcon-toronto.jpg) 

Announcing the fifth release candidate for the Linux kernel version 4.14, Linus Torvalds has revealed that fuzzing is producing a steady stream of security fixes.

Fuzzing involves stress testing a system by generating random code to induce errors, which in turn may help identify potential security flaws. Fuzzing is helping software developers catch bugs before shipping software to users.

Google uses a variety of fuzzing tools to find bugs in its and other vendors' software. Microsoft has launched the [Project Springfield][1] fuzzing service to allow enterprise customers to test their own software.

As Torvalds points out, Linux kernel developers have been using fuzzing programs since the beginning, such as tools like "crashme", which was released in 1991 and nearly 20 years later was [used by Google security researcher Tavis Ormandy][2] to test how well shielded a host is when untrusted data is being processed in a virtual machine.

"The other thing perhaps worth mentioning is how much random fuzzing people are doing, and it's finding things," [writes][3] Torvalds.

"We've always done fuzzing (who remembers the old "crashme" program that just generated random code and jumped to it? We used to do that quite actively very early on), but people have been doing some nice targeted fuzzing of driver subsystems etc, and there's been various fixes (not just this last week either) coming out of those efforts. Very nice to see."

Torvalds mentions that 4.14's development has until now "felt a bit messier than perhaps should have been" but has now smoothed out, and runs through some of the fixes in this build for x86 systems and systems with AMD chips. There are also updates for several drivers, core kernel components, and tooling.

As previously [reported][4], Linux 4.14 is 2017's Long-Term Stable release, which has so far introduced core memory management features, device driver updates, and changes to documentation, architecture, filesystems, networking and tooling.

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linus-torvalds-says-targeted-fuzzing-is-improving-linux-security/

作者：[Liam Tung ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/eu/liam-tung/
[1]:http://www.zdnet.com/article/microsoft-seeks-testers-for-project-springfield-bug-detection-service/
[2]:http://taviso.decsystem.org/virtsec.pdf
[3]:http://lkml.iu.edu/hypermail/linux/kernel/1710.1/06454.html
[4]:http://www.zdnet.com/article/first-linux-4-14-release-adds-very-core-features-arrives-in-time-for-kernels-26th-birthday/
[5]:http://www.zdnet.com/meet-the-team/eu/liam-tung/
[6]:http://www.zdnet.com/meet-the-team/eu/liam-tung/
[7]:http://www.zdnet.com/topic/security/
