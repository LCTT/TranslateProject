[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bad News! Windows 10 Will Soon Have a Real Linux Kernel)
[#]: via: (https://itsfoss.com/windows-linux-kernel-wsl-2/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Bad News! Windows 10 Will Soon Have a Real Linux Kernel
======

_**The upcoming version of Windows 10 will feature a real Linux kernel in it as part of Windows Subsystem for Linux (WSL).**_

When Microsoft first announced [bash on Windows][1] and brought Linux inside Windows as Windows Subsystem for Linux (popularly known as WSL), few would have thought that the next step would be to bring the real Linux kernel inside Windows operating system.

But Microsoft has just done that. Among several other announcements at the Microsoft Build 2019 conference, it [announced][2] bringing the real Linux kernel to Windows 10 for WSL.

### WSL 2 with real Linux kernel in Windows 10

![][3]

WSL (Windows Subsystem for Linux) is a Linux kernel compatibility layer for Windows. It allows many Linux programs (mainly the command line ones) to run inside Windows. This feature is also called ‘bash on Windows’.

To use WSL, you can [install bash on Windows through Ubuntu, Kali Linux and OpenSUSE][1]. These Linux distributions are available in Windows 10 Store. Instead of a slow virtual machine, the WSL allows you to natively run the Linux commands on Windows.

In WSL 2, the Linux kernel compatibility layer has been replaced by the real Linux kernel. So now if you use WSL, you’ll be using the real Linux kernel 4.9.

> this will be the first time a Linux kernel is shipped with Windows, which is a true testament to how much Microsoft loves Linux
>
> Craig Loewen, Program Manager, Windows Developer Platform

### The advantages of real Linux kernel in WSL 2

It has been optimized for size and performance to give an amazing Linux experience on Windows. We will service this Linux kernel through Windows updates, which means you will get the latest security fixes and kernel improvements without needing to manage it yourself.

The inclusion of real Linux kernel will boost the file-system I/O and system calls. The specifically optimized Linux kernel makes WSL 2 faster than WSL 1. In certain tasks like, unpacking a tarball, WSL 2 was 20x faster than WSL 1 and around 5x faster in using Git clone, npm install.

[][4]

Suggested read Canonical Rubbishes Microsoft Buyout Rumors

[WSL 2][2] also allows Windows to run docker containers natively. You probably already know that Docker and [Linux containers][5] are the backbone of the IT industry these days and most of the software deployments take advantage of the Linux containers.

_**The Linux kernel will get security fixes, kernel improvements and other updates through Windows updates**_. Hah! Does this mean Linux kernel will start upgrading in the middle of work like Windows updates? That remains to be seen.

### When is WSL 2 releasing? Which Linux distros are available via WSL 2?

WSL 2 will be available through Windows insider program by the end of June. Windows insider program is sort of a beta program for early adapters and developers to try out the upcoming Windows features before its final release.

There is no date for WSL 2 release to the general public, yet.

Canonical has [announced][6] the support for WSL 2 meaning you would be able to use Ubuntu through WSL 2.

> Collaboration with Microsoft enables us to certify Ubuntu on WSL, including Docker containers, Kubernetes, and snaps
>
> Stephan Fabel, Director of Product at Canonical

### Opinion/rant on Linux Kernel in Windows and Microsoft’s so-called love for Linux and Open Source

![Microsoft Loves Linux?][7]

This is strictly my opinion. You may call it rant, I don’t really mind.

Microsoft is infamous for its [Embrace, Extend, Extinguish policy][8]. It has started ‘loving’ open source and Linux in the last few years but before that [Linux was cancer][9].

The so-called ‘love for Linux’ seems more like ‘lust for Linux’ to me. The Linux community is behaving like a teen-aged girl madly in love with a brute. Who benefits from this Microsoft-Linux relationship? Clearly, Microsoft has more to gain here. The WSL has the capacity of shrinking (desktop) Linux to a mere desktop app in this partnership.

By bringing Linux kernel to Windows 10 desktop, programmers and software developers will be able to use Linux for setting up programming environments and use tools like Docker for deployment. They won’t have to leave the Windows ecosystem or use a virtual machine or log in to a remote Linux system through [Putty][10] or other SSH clients.

[][11]

Suggested read WPS Office: Microsoft Office Clone For Ubuntu!

In the coming years, a significant population of future generation of programmers won’t even bother to try Linux desktop because they’ll get everything right in their systems that comes pre-installed with Windows.

Linux kernel will continue to grow in the IT infrastructure, thanks to the efforts of Linux Foundation backed by the enterprise giants for their own interests.

The desktop Linux will unfortunately see a decline. The [Linux Foundation already doesn’t care about the desktop Linux][12]. Out of the millions it gets, literally nothing goes for the development of desktop Linux (as far as I know). Linux Foundation doesn’t make any effort to support desktop Linux probably because it doesn’t generate any money.

**Microsoft loves Linux. Microsoft loves Open Source. It’s love is so deep that it[open sourced the magnificent Windows calculator][13] so that all of us Linux users could run this marvel of a technology.**

But when it comes to bringing commercial products like Microsoft Office to Linux, Microsoft suddenly recalls that there is not ‘enough demand’ for MS Office on Linux.

Not enough demand? So, were people signing petitions or holding yellow jacket protests for open sourcing Windows calculator?

Microsoft is one of the biggest contributors to open source project on GitHub (platform now owned by Microsoft). But if you look at [their projects][14], you’ll notice that almost all of the Microsoft’s open source products are aimed at programmers and software developers.

This is not love, Microsoft and Linux. This is merely a relationship of convenience.

--------------------------------------------------------------------------------

via: https://itsfoss.com/windows-linux-kernel-wsl-2/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-bash-on-windows/
[2]: https://devblogs.microsoft.com/commandline/announcing-wsl-2/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/wsl-linux-kernel.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/canonical-microsoft-buyout/
[5]: https://opensource.com/resources/what-are-linux-containers
[6]: https://blog.ubuntu.com/2019/05/06/canonical-announces-support-for-ubuntu-on-windows-subsystem-for-linux-2
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/microsoft-loves-linux.jpg?resize=800%2C448&ssl=1
[8]: https://en.wikipedia.org/wiki/Embrace,_extend,_and_extinguish
[9]: https://www.theregister.co.uk/2001/06/02/ballmer_linux_is_a_cancer/
[10]: https://itsfoss.com/putty-linux/
[11]: https://itsfoss.com/wps-office-microsoft-office-clone-for-ubuntu/
[12]: http://techrights.org/2019/03/24/linux-desktop-lf/
[13]: https://www.theverge.com/2019/3/6/18253474/microsoft-windows-calculator-open-source-github
[14]: https://github.com/microsoft
