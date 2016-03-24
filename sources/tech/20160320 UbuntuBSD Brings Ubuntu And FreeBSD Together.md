UbuntuBSD Brings Ubuntu And FreeBSD Together
=================================================

![](http://itsfoss.com/wp-content/uploads/2016/03/UbuntuBSD.jpg)

Move over [Linux][1], people. UbuntuBSD is bringing the experience of Ubuntu on the top of a FreeBSD kernel.

Quite unsurprisingly, UbuntuBSD has taglined itself as ‘Unix for human beings’. If you remember, Ubuntu uses the tagline ‘Linux for human beings’ and have actually made it possible for a ‘normal human’ to use Linux in last 11 years.

UbuntuBSD aims to do the same. Which is to make Unix accessible and usable by beginners, if I may put it that way. At least, this is what it aims.

### What’s BSD? How is Linux different from it?

If you are a beginner, then you should know the [difference between Unix and Linux][2].

Way before Linux, Unix operating systems was desgined at [AT&T][3] by [Ken Thompson][4], [Denis Ricthie][5] and team. This was back in 1970. You might be surprised to know that Unix is a closed source, properitry operating system. AT&T licensed Unix to various thrid parties, both academic and commercial vendors.

One of the academic vendors is University of California, Berkeley. The Unix operating system developed here is known as [BSD (Berkeley Software Distribution)][6]. One of the most popular open source derivative of BSD is [FreeBSD][7]. Another most popular closed source BSD derviative is Apple’s Mac OS X.

In 1991, Finnish computer science student Linus Torvalds developed his own Unix clone from scratch. This is what we know today as Linux Kernel. Linux distributions add GUI system, GNU utilities (such as cp, mv, ls,date, bash etc), installation & management tools, GNU c/c++ Compilers and various applications on top of the Linux kernel.

### UbuntuBSD is not the first of its kind

When you have get the difference between Unix, Linux and FreeBSD, let me tell you that UbuntuBSD is not the first Linux-ish experience on the top of FreeBSD kernel.

When Debian opted out for [systemd][8], this resulted in the birth of [Debian GNU/kFreeBSD][9] operating system. It is a port of Debian that run on the top of FreeBSD rather than the usual Linux kernel.

UbuntuBSD is a similar implementation of Ubuntu on FreeBSD kernel.

### UbuntuBSD Beta codenamed Escape From SystemD

The first beta release of UbuntuBSD is out and it has been codenamed “Escape from SystemD”. It is based on Ubuntu 15.10 and FreeBSD kernel 10.1.

It ships with [Xfce][10] desktop and is designed for both desktop and server. [ZFS][11] support is included as well. It has text based installer.

### Wanna try?

I won’t suggest that everyone start trying it in excitement. It is still under development and the installer is text based. If you are confident enough, go ahead and download it from the link below but beginners, please stay out, at least for now:

[UbuntuBSD][12]

What do you think of UbuntuBSD?

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntubsd-ubuntu-freebsd/

作者：[ABHISHEK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]: http://itsfoss.com/tag/linux/
[2]: http://www.cyberciti.biz/faq/what-is-the-difference-between-linux-and-unix/
[3]: https://en.wikipedia.org/wiki/AT%26T
[4]: https://en.wikipedia.org/wiki/Ken_Thompson
[5]: https://en.wikipedia.org/wiki/Dennis_Ritchie
[6]: http://www.bsd.org/
[7]: https://www.freebsd.org/
[8]: https://www.freedesktop.org/wiki/Software/systemd/
[9]: https://www.debian.org/ports/kfreebsd-gnu/
[10]: http://www.xfce.org/
[11]: https://en.wikipedia.org/wiki/ZFS
[12]: https://sourceforge.net/projects/ubuntubsd/
