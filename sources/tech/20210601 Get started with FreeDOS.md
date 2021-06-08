[#]: subject: (Get started with FreeDOS)
[#]: via: (https://opensource.com/article/21/6/get-started-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get started with FreeDOS
======
It looks like retro computing, but it's a modern OS you can use to get
stuff done.
![Old UNIX computer][1]

Throughout the 1980s and into the 1990s, I was primarily a DOS user. I loved the command line environment offered in DOS, which became more powerful with each successive release. I even learned how to write my own DOS programs in the C programming language so I could extend the DOS command line, and write more powerful replacements for the standard DOS commands. I'd experimented with Microsoft's Windows—but if you remember Windows 3 from that time, you know it was slow and tended to crash. But I preferred the command line anyway, so I stuck to DOS.

That all changed in 1994. Popular tech magazines talked about an upcoming version of Windows that would completely do away with DOS. I didn't want to be forced to Windows. On the discussion boards I visited on Usenet, others felt the same. So [on 29 June 1994][2], I decided that if we wanted to keep DOS, we needed to write our own. So on June 29, I announced a small project that would become [The FreeDOS Project][3].

Since then, we've released several full distributions of FreeDOS. We started with the alpha series from 1994 to 1997, the beta series from 1998 to 2005, before finally releasing the FreeDOS 1.0 distribution in 2006. Progress has been slow but steady since then. We haven't really been rushed to release each new version after 1.0, because DOS stopped being a moving target in 1995.

Each FreeDOS distribution since 1.0 has been a continual re-imagining of what a modern DOS might look like. We've included lots of compilers, assemblers for developers to write software. We also provide lots of "power tools" so you can do real work. And we offer a variety of editors because everyone has their favorite.

We recently released the FreeDOS 1.3 RC4 distribution. This is technically a release candidate towards our upcoming FreeDOS 1.3 distribution, but it's a full-featured distribution. I'm very excited about all the great features in FreeDOS 1.3 RC4.

### Run FreeDOS without installing FreeDOS

In all our previous FreeDOS distributions, we focused on _installing_ FreeDOS to a computer. But we recognize that most users don't actually run FreeDOS on actual hardware anymore—they run FreeDOS in [a virtual machine like QEMU or VirtualBox][4]. So in FreeDOS 1.3 RC4, we improved the "LiveCD" environment.

With FreeDOS 1.3 RC4, you can just boot the LiveCD image in your favorite virtual machine, and start using FreeDOS right away. That's how I run FreeDOS now; I have a small virtual hard drive image where I store all my files, but I boot and run FreeDOS from the LiveCD.

![Booting the FreeDOS 1.3 RC4 LiveCD on QEMU][5]

Booting the FreeDOS 1.3 RC4 LiveCD (Jim Hall, [CC-BY SA 4.0][6])

### Installing is really easy

If you don't want to run FreeDOS from the LiveCD, you can also install it on your hard drive. We updated the installer in FreeDOS so it's not really a "program" per se, but instead is a very smart DOS "batch" file that detects all sorts of things and takes the appropriate action, like creating a new disk partition for FreeDOS if none exist already.

Older FreeDOS distributions used to prompt you for everything, even selecting individual programs to install. The new installer is very streamlined. It asks you a few questions to get started, then does everything else on its own. Installing FreeDOS on an empty virtual machine takes only a few minutes.

![Installing FreeDOS 1.3 RC4][7]

Installing FreeDOS 1.3 RC4 (Jim Hall, [CC-BY SA 4.0][6])

### You can install it from floppy

Not everyone prefers to run FreeDOS in a virtual machine. There's a retrocomputing community out there that collects and lovingly restores classic PC hardware like Pentium or '486 systems. You can even find some XT (8088) or AT (80286) systems out there, kept running by a dedicated user community.

And while we consider FreeDOS a _modern_ DOS, we wouldn't be "DOS" if we didn't also run on the older PC hardware too. So with FreeDOS 1.3, we include a Floppy-Only Edition! This edition should run on any hardware that can run FreeDOS and has EGA or better graphics.

Are you running a '286 or another classic system without a CD-ROM drive? Install from these floppies to install FreeDOS. Do you have just one hard drive and no CD or floppy drive? Just copy the contents of the floppies to a temporary directory and run the installer from there. Want to perform a "headless" install to a different DOS directory? It's easy with the command-line options.

The Floppy-Only Edition uses a completely different installer and contains a limited FreeDOS set of programs that are more useful on classic PC hardware.

![Installing the FreeDOS Floppy-Only Edition][8]

Installing the FreeDOS Floppy-Only Edition (Jim Hall, [CC-BY SA 4.0][6])

### Filled with open source apps and games

FreeDOS isn't a _free_ DOS if it's a closed source DOS. We want everyone to be able to use and study FreeDOS, including its source code. As we planned the FreeDOS 1.3 distribution, we took a close look at every license in every package and focused on including only _open source_ programs. (A few programs in previous FreeDOS distributions were not quite "open source," and one or two programs didn't include source code but were otherwise "free to use and distribute." In this release, everything is open source, using the Open Source Definition as our model.)

And what a great collection of open source apps and games. The games are my favorite addition to FreeDOS 1.3 RC4. Many people use FreeDOS to play classic DOS games, but we wanted to provide our own open source games for people to play.

You can find two games already installed in the LiveCD: Simple Senet (a board game dating to ancient Egypt) and Floppy Bird (a version of the Flappy Bird game). If you install FreeDOS, you'll also find lots of other games to try, including Sudoku86 (a sudoku game), Wing (a space shooter), and Bolitaire (solitaire card game).

![Playing the Floppy Bird game][9]

Playing the Floppy Bird game (Jim Hall, [CC-BY SA 4.0][6])

![The ancient game of Senet][10]

The ancient game of Senet (Jim Hall, [CC-BY SA 4.0][6])

### Try FreeDOS 1.3 RC4 now

You can find the new FreeDOS 1.3 RC4 from the FreeDOS website, on our [Downloads][11] page. To install FreeDOS, you'll need at least 20MB of free disk space: 20MB to install a plain FreeDOS system, or 250MB to install everything, including applications and games. To install the source code too, you'll need up to 450MB of free space.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/get-started-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://groups.google.com/g/comp.os.msdos.apps/c/oQmT4ETcSzU/m/O1HR8PE2u-EJ
[3]: https://www.freedos.org/
[4]: https://opensource.com/article/20/8/virt-tools
[5]: https://opensource.com/sites/default/files/freedos-livecd.png (Booting the FreeDOS 1.3 RC4 LiveCD)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/install6.png (Installing FreeDOS 1.3 RC4)
[8]: https://opensource.com/sites/default/files/freedos-floppy.png (Installing the FreeDOS Floppy-Only Edition)
[9]: https://opensource.com/sites/default/files/floppy-bird.png (Playing the Floppy Bird game)
[10]: https://opensource.com/sites/default/files/simple-senet.png (The ancient game of Senet)
[11]: https://www.freedos.org/download/
