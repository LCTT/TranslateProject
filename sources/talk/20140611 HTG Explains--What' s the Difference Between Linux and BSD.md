HTG Explains: What’s the Difference Between Linux and BSD?
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/freebsd-devil-mascot-and-ubuntu-linux.jpg)

Both Linux and the BSDs are free and open-source, Unix-like operating systems. They even use much of the same software — these operating systems have more things in common than they do differences. So why do they all exist?

There are more differences than we can cover here, especially philosophical differences about the way one should build an operating system and license it. This should help you understand the basics, though.

### The Basics ###

[What most people call “Linux” isn’t actually Linux][1]. Linux is technically just the Linux kernel — typical Linux distributions are made up of many pieces of software. This is [why Linux is sometimes called GNU/Linux][2]. In fact, much of this same software on top of Linux is the same software used on the BSDs.

Linux and the BSDs are both Unix-like operating systems. As we covered when we looked at [the history of Unix-like operating systems][3], Linux and BSD have a different lineage. Linux was written by Linus Torvalds when he was a student in Finland. BSD stands for “Berkeley Software Distribution,” as it was originally a set of modifications to Bell Unix created at the University of California, Berkeley. It eventually grew into a complete operating system and now there are multiple different BSDs.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/freebsd-boot-screen.png)

### Kernel vs. Complete Operating System ###

Officially, Linux is just a kernel. [Linux distributions][4] have to do the work of bringing together all the software required to create a complete Linux OS and combining it into a Linux distribution like Ubuntu, Mint, Debian, Fedora, Red Hat, or Arch. There are many different Linux distributions.

In contrast, the BSDs are both a kernel and an operating system. For example, FreeBSD provides both the FreeBSD kernel and the FreeBSD operating system. It’s maintained as a single project. In other words, if you want to install FreeBSD, you just install FreeBSD. If you want to install Linux, you’ll need to choose among the many Linux distributions first.

BSDs include the ports system. which provides a way of installing software packages. The ports system contains software in source form, so your computer has to compile them before they’ll run. (If you ever used Gentoo when it was popular, it’s a bit like that.) However, packages can also be installed in pre-installed binary form so you don’t have to spend time and system resources compiling them.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/ubuntu-14.04-unity-desktop.png)

### Licensing ###

Licensing is a significant difference, although it won’t matter to most people. Linux uses the GNU General Public License, or GPL. If you modify the Linux kernel and distribute it, you have to release the source code for your modifications.

The BSDs use the BSD license. If you modify the BSD kernel or distribution and distribute it, you don’t have to release the source code at all. You’re free to do whatever you like with the BSD code and you’re not obligated to release the source code, although you can do so if you like.

Both are [open-source][5], but in different ways. People sometimes get into debates about which license is “more free.” The GPL helps users by ensuring they can have the source code to GPL software, but it limits developers by forcing them to release the code. The BSD license doesn’t ensure users can have the source code, but it gives developers the freedom to do whatever they choose with the code, even if they want to turn it into a closed-source project.

### The BSDs ###

These are often thought of as the three “main” BSD operating systems:

- [FreeBSD][6]: FreeBSD is the most popular BSD, aiming for high performance and ease of use. It works well on standard Intel and AMD 32-bit and 64-bit processors.
- [NetBSD][7]: NetBSD is designed to run on almost anything and supports many more architectures. The motto on their homepage is “Of course it runs NetBSD.”
- [OpenBSD][8]: OpenBSD is designed for maximum security — not just with its features, but with its implementation practices. It’s designed to be an operating system banks and other serious institutions would use for critical systems.

There are two other notable BSD operating systems:

- [DragonFly BSD][9]: DragonFly BSD was created with the design goal of providing an operating system that would run well in multithreaded environments — for example, in clusters of multiple computers.
- [Darwin / Mac OS X][10]: Mac OS X is actually based on the Darwin operating system, which is based on BSD. It’s a bit different from other BSDs. While the low-level kernel and other software is open-source BSD code, most of the rest of the operating system is closed-source Mac OS  code. Apple built Mac OS X and iOS on top of BSD so they wouldn’t have to write the low-level operating system themselves, just as [Google built Android on top of Linux][11]

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/mac-os-x-is-built-on-darwin-bsd.png)

### Why Would You Choose BSD Over Linux? ###

Linux is still more popular than even FreeBSD. Linux tends to get new hardware support before FreeBSD does, for example. The BSDs have a compatibility package available so they can natively execute Linux binaries, and most of the software works similarly.

If you’ve used Linux, FreeBSD won’t feel all that different. Install FreeBSD as a desktop operating system and you’ll end up using the same GNOME, KDE, or Xfce [desktop environments][12] you’d use on Linux along with most of the same other software. That’s once you get to that point, though — FreeBSD won’t automatically install a graphical desktop, so you’re left to fend for yourself more than you are with modern Linux distributions. It’s a more old-school experience.

FreeBSD may be preferred on some server operating systems for its reliability and stability. Manufacturers creating devices may choose BSD for the operating system instead of Linux so they won’t have to release the modifications to their code.

If you’re a desktop PC user, you really don’t need to care too much about the BSDs. You’ll probably prefer Linux for its superior hardware support, easier installation, and general modern and bleeding-edge nature. If you’re putting together a server or embedded device, you may prefer FreeBSD for another reason.

We’ll probably get comments from people who use FreeBSD on their desktop computers now, and you certainly could do so! But an operating system like Ubuntu or Mint will be more user-friendly and modern for most people.

Image Credit: [atzerok on Flickr][13]

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/190773/htg-explains-whats-the-difference-between-linux-and-bsd/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/177213/linux-isnt-just-linux-8-pieces-of-software-that-make-up-linux-systems/
[2]:http://www.howtogeek.com/139287/the-great-debate-is-it-linux-or-gnulinux/
[3]:http://www.howtogeek.com/182649/htg-explains-what-is-unix/
[4]:http://www.howtogeek.com/132624/htg-explains-whats-a-linux-distro-and-how-are-they-different/
[5]:http://www.howtogeek.com/129967/htg-explains-what-is-open-source-software-and-why-you-should-care/
[6]:http://www.freebsd.org/
[7]:http://www.netbsd.org/
[8]:http://www.openbsd.org/
[9]:http://www.dragonflybsd.org/
[10]:http://opensource.apple.com/
[11]:http://www.howtogeek.com/189036/android-is-based-on-linux-but-what-does-that-mean/
[12]:http://www.howtogeek.com/163154/linux-users-have-a-choice-8-linux-desktop-environments/
[13]:http://www.flickr.com/photos/atzerok/5378691454