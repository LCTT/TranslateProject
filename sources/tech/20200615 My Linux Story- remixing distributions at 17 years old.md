[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My Linux Story: remixing distributions at 17 years old)
[#]: via: (https://opensource.com/article/20/6/linux-remix)
[#]: author: (Kai Lyons https://opensource.com/users/kailikeslinux)

My Linux Story: remixing distributions at 17 years old
======
Open source and Linux create an environment ripe for hands-on learning
and experimentation, and it's never too early to start.
![Person programming on a laptop on a building][1]

The [Lumina desktop][2] was originally developed by iXSystems for TrueOS, which later became Project Trident. It's well-known as the BSD desktop environment but has been ported to Linux. It introduces desktop elements like a panel, system tray, and so on, to the Fluxbox window manager, and is highly portable. It's a good desktop, and while it's generally easy to install, there aren't many distributions offering it by default.

I'm the sole contributor and maintainer to the Ubuntu Lumina remix. My work on the Ubuntu Lumina project has been a lengthy process, and much of it has been learning along the way. As of this writing, I'm 17 years old, but I've been a technology enthusiast since age six when a friend of mine helped me write my first ever "Hello, world" script.

### My introduction to Linux

Although I am a distribution developer, I haven't been on Linux all that long. I didn't start using Linux until 2018 when I first got into Fedora 29. My original reason for installing Linux was to build an operating system, and Linux taught me an important lesson—in open source, you can build upon the successful work of others. You can learn the components of the existing scaffolding, which grants you a substantial headstart in reaching your ultimate goal.

My original plan was to write a custom kernel. Once I learned what a monumental task it was, I decided to redirect that enthusiasm to working with the Linux kernel for a while, since I ultimately wanted to make an operating system.

I got started on Fedora using the Gnome desktop. I still couldn't tell you for sure how I got it to fit on a 1GB flash drive, but that's why Fedora 29 was my pick—I fell in love with Gnome 3 immediately, and [Gnome Boxes][3] was the first virtual machine I ever used. I've found many other desktops to love, too—Pantheon, Cinnamon, LXQt, and others. After testing FreeBSD for the first time only a short three months after finding Linux, I found Lumina.

### My first operating system attempts

My initial attempts to design my own distribution with Lumina as the default environment were mostly exercises in experimenting with tools. The tool I used most at first was [Linux-Live][4]. I never thought of working on an operating system from anything but the live-system. It actually wouldn't be until Ubuntu Lumina that I would even try to do it with an installed system.

My first distribution had no name, and it was a [Linux From Scratch][5] (LFS) system. It taught me a lot, but in the end, it wasn't what I really wanted; it didn't even have a proper installer.

My second through seventh tries were random assortments of mashing software together, and only one of them ever got "shipped." I don't remember the name of it, or even whether it worked, but it was something that I had made myself, and it showed me what was possible. While the end results weren't what I ultimately wanted, I still loved the process of making them.

I spent time reading LFS, remixing Gentoo and Arch, made a couple of weird Debian tries, and finally decided to create an Ubuntu Cinnamon remix. I soon found out that Joshua Peisach had already made one. I didn't get far on my own remix; it never booted, so I abandoned the idea. With Joshua's encouragement, there were a few intermediate attempts at remixes (a failed attempt at Pantheon, and then i3) before I settled on concentrating on Lumina.

### Lumina desktop on Linux

My Lumina-based distribution is still in development, meaning it's usable but has several significant omissions. The goal of the project is to provide a comfortable and lightweight OS. The Lumina desktop environment doesn't have many tools compared to a full desktop environment, including those considered to be minimal, like LXQt. And while Lumina is a little clunky, it's about as lightweight as XFCE.

While it's true that I'm the only contributor to the project, I have gotten a lot of help along the way. Advice from Martin Wimpress, Joshua Peisach, Rik Mills, Thomas Castleman, and many other incredible distribution developers has guided me through many a twist and turn on what could have been a discouraging learning curve.

### Open source knowledge

This is what remixing, and indeed, open source itself, is all about—learning and helping one another while making better technology. My work builds upon the work of other distribution maintainers, packagers, a BSD desktop, an ISO-Builder developed for Budgie, and the entire Linux community. There's no question in my mind that I wouldn't have a bootable OS to call my own and to share with others without Linux and open source.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/linux-remix

作者：[Kai Lyons][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kailikeslinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://opensource.com/article/19/12/linux-lumina-desktop
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: https://www.linuxliveusb.com/
[5]: http://www.linuxfromscratch.org/
