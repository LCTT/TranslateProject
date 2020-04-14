[#]: collector: (lujun9972)
[#]: translator: (bingzxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My Linux Story: From 8-bit enthusiast to Unix sysadmin)
[#]: via: (https://opensource.com/article/20/4/linux-story)
[#]: author: (James Farrell https://opensource.com/users/jamesf)

bingzxy is translating
My Linux Story: From 8-bit enthusiast to Unix sysadmin
======
How my early interest in computers got me hooked on a career as a
sysadmin and Linux fan.
![Person typing on a 1980's computer][1]

It all started in the mid-1980s with an [Apple ][c][2] that my parents purchased for our family. Although I enjoyed playing games, I quickly became fascinated with BASIC programming and how useful it could be for work and fun. This was an era when computers were viewed as little more than typewriters, so people with "advanced computer skills" could easily use them to their advantage.

One example was using BASIC and a dot matrix printer to auto-generate punishment assignments. When I was assigned to write out 200 times some apologetic statements, I asked my teacher if it could be typed out. On confirmation, I wrote a 5 line BASIC program to generate it for me. Another example of subtle trickery was using non-WYSIWYG word processors, such as AppleWorks for micro-manipulation of fonts, line spacing, and margins to "stretch" term papers out to the required length.

My obsession with computers quickly lead to an Apple ][gs with a RAM drive card and an x86 PC co-processor card. Modems and BBSs were getting hot, and having a dual-hardware system like this gave me all sorts of options for software. However, modem speeds of 2400bps put a real damper on getting anything more than a few KBs of fun downloads per day. I stuck with Apple as a hobby for some time, but that was soon to change.

### Venturing into Unix

My undergraduate program was BS in Computer Information Systems (CIS) and my graduate degree was MS in Computer Science. My undergraduate education program put me mostly into PCs and a little into timeshare mainframes. The real fun began in my graduate programs, where dial-in access to Unix machines with internet connections opened a whole new world of exploration. Although I still used my dual-processor ][gs for modem work and writing and printing papers, Unix systems really grabbed my attention with their general-access Telnet-based games, FTP archives, online email, and C programming. Gopher was popular and growing with people like me who were bound to plain terminal interfaces.

My graduate program took a fateful turn for the better when I was assigned to the academic computing department, which was charged with running computer services for the school. The students had access to [Ultrix][3]-based systems with X Window terminals. Most were grayscale, as color processing was then a CPU intensive task and really affected system performance. The few color systems were nice, but those machines just dragged.

This was a really fun time for me, as I was given root access to systems and assigned to system and network maintenance. I had some excellent mentors, and this strongly influenced my decision to get into system administration rather than programming (although I still really love programming to this day).

### From Unix to Linux

Scarcity is the mother of invention, and we students often got creative when we had to share the scant resources of the school's computer systems. We had three to five times more students than we had Ultrix workstations, so finding resources (especially at project delivery time) was often a challenge. There was a bank of 56k [PPP][4] modems available for remote system access when graphical displays were not needed. However, finding a machine with spare resources and sharing the system for source compilation often resulted in slow progress. Like most, I found working at night often helped, but I needed something else to let me iterate more quickly.

Then one of the school's sysadmins suggested I check out a Unix system that was freely available. This was Linux, made available as 3.5" floppy images. Given our school's blazing fast T1 line, it was easy for me to search newsgroups and other sources to learn how to download it. It was all 32-bit Intel PC-based, a class of equipment that I did not own.

Luckily, my work at the school gave me access to junk piles of old computers, so the wheels started turning.

I found enough discarded PCs to build a solid 80386 PC with some decent RAM (I am sure well under 1GB), a workable graphic display, a thin-net (coax) Ethernet card, and a hard disk. The images I had were Linux kernel 0.98, and I don't recall it being part of an official distribution (it might have been SLS). What I do remember is that it came on a series of floppy images—the first booted the kernel and a minimal installer, next it formatted the drive, and then it asked for each successive floppy image to install the core GNU utilities. After the core was installed and the system bootable, you would download and install other package images, like compilers and such.

This was a serious boon to me in my academic career. With no X Window server display running, this PC seriously outperformed the Ultrix workstations I had access to at school. I was allowed to connect this machine to the academic network, mount the school's student Network File System (NFS) shares, and access the internet directly. Since my graduate program used [GCC][5] (and sometimes Perl 4) for most student work, I could do my development work locally. This gave me exclusive access to a key resource that enabled me to iterate more quickly on my projects.

All was not perfect, however. The hardware was a tiny bit unstable (likely why it was discarded), but I could deal with that. What really got me was how much Linux and Ultrix differed at the OS and system library level. I began to appreciate what it meant to port software to other platforms; I was free to develop wherever I wanted, but I had to deliver my projects as Ultrix compiled binaries. The C code that ran perfectly on one platform would crash on the other. This was very frustrating, but probably my rudest awakening was early Linux's handling of null-pointer dereferencing. Linux seemed happy to pass over these as a virtual no-op, but Ultrix promptly dumped core on [SIGSEGV][6]. This was quite a thing to find out when my first port to the target platform happened days before my project was due! This also made my exploration of C++ quite challenging, as my careless use of malloc()/free() along with automatic [constructor and destructor][7] processing peppered my projects with null pointer bombs all over the place.

Toward the end of my graduate program, I upgraded to a complete beast of a workstation—an Intel 486DX2 66MHz with SCSI hard drives, a CD-ROM drive, a 1024x768 RGB monitor, and a 16550 UART serial card perfectly matched to my new US Robotics V.Everything modem. It could dual-boot Windows and Linux, but more importantly, the graphics card and processor allowed a much more pleasant (and faster) development environment. The old 386 was still in service back at the school, but most of my heavy work and hacking now happened at home.

Similar to [Mike Harris' story][8] about Linux in the '90s, I really got into those CD bundles that were popular at the time. There was a new Micro Center computer store close to where I lived, and it was a goldmine of hobby PC parts, phenomenal technical books, and every conceivable Linux (and free Unix) CD archive. I remember [Yggdrasil][9] and [Slackware][10] being some of my favorite distributions. What was really incredible was the enormous size of CD storage—650MB! This was an essential resource for getting access to software. Yes, you could download the bits at 56k, but that was quite limiting. Not to mention the fact that most people could not afford to archive that much idle data for later perusal.

### And on to today

This is what kicked off my more than 25 years of system administration and open source software fun. Linux has been an important part of both my career and personal development. Nowadays, I am still heavily into Linux (mostly CentOS, RedHat, and Ubuntu), but often have fun with the likes of [FreeBSD][11] and other cool open source offerings.

My forays into Linux led me to Opensource.com, where I hope to give back a little and help bootstrap new generations of hands-on computer fun.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/linux-story

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://en.wikipedia.org/wiki/Apple_IIc
[3]: https://en.wikipedia.org/wiki/Ultrix
[4]: https://en.wikipedia.org/wiki/Point-to-Point_Protocol
[5]: https://en.wikipedia.org/wiki/GNU_Compiler_Collection
[6]: https://en.wikipedia.org/wiki/Segmentation_fault
[7]: https://www.tutorialspoint.com/cplusplus/cpp_constructor_destructor.htm
[8]: https://opensource.com/article/19/11/learning-linux-90s
[9]: https://en.wikipedia.org/wiki/Yggdrasil_Linux/GNU/X
[10]: http://slackware.com
[11]: https://www.freebsd.org/
