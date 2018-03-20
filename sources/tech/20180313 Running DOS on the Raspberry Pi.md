hankchow translating

Running DOS on the Raspberry Pi
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wings_freedos_game.jpg?itok=7j8x-A-w)
You may be familiar with [The FreeDOS Project][1]. FreeDOS is a complete, free, DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded PC applications. Any program that works on MS-DOS should also run on FreeDOS.

As the founder and project coordinator of the FreeDOS Project, I'm often the go-to person when users ask questions. And one question I seem to get a lot lately is: "Can you run FreeDOS on the Raspberry Pi?"

This question isn't surprising. After all, Linux runs great on the Raspberry Pi, and FreeDOS is an older operating system that requires fewer resources than Linux, so why shouldn't FreeDOS run on the Raspberry Pi.

**[Enter our[Raspberry Pi week giveaway][2] for a chance at this arcade gaming kit.]**

The simple answer is that FreeDOS cannot run on a Raspberry Pi by itself because of the CPU architecture. Like any DOS, FreeDOS requires an Intel x86 CPU and a BIOS to provide basic runtime services. But the Raspberry Pi is a completely different architecture. The Raspberry Pi runs an ARM CPU, which is not binary compatible with the Intel CPU and does not include a BIOS. So FreeDOS cannot run on the Raspberry Pi at the "bare hardware" level.

Fortunately, it's possible to run FreeDOS on the Raspberry Pi through PC emulation. Maybe that's not as cool as running FreeDOS natively, but it's a great way to run DOS applications on the Raspberry Pi.

### What about DOSBox?

Some might ask, "Why not use DOSBox instead?" DOSBox is an open source x86 emulator that runs on a variety of systems, including Linux. It is a great system that provides a DOS-like environment, mostly aimed at running games. So if you just want to run a classic DOS game, DOSBox can do that for you. But if you run want to run DOS applications, DOSBox isn't the best platform. And if you ask the DOSBox forums, they'll tell you DOSBox is really meant for games.

For most users, it's a matter of preference. It shouldn't be a surprise that I prefer to install FreeDOS to run classic DOS games and other programs. I find the full DOS experience gives me greater flexibility and control than running DOSBox. I use DOSBox for a few games, but for most things I prefer to run a full FreeDOS instead.

### Installing FreeDOS on Raspberry Pi

[QEMU][3] (short for Quick EMUlator) is an open source virtual machine software system that can run DOS as a "guest" operating system on Linux. Most popular Linux systems include QEMU by default. QEMU is available for Raspbian, the Linux distribution I'm using on my Raspberry Pi. I took the QEMU screenshots in this article with my Raspberry Pi running [Raspbian GNU/Linux 9 (Stretch)][4].

Last year, I wrote an article about [how to run DOS programs in Linux][5] using QEMU. The steps to install and run FreeDOS using QEMU are basically the same on the Raspberry Pi as they were for my GNOME-based system.

In QEMU, you need to "build" your virtual system by instructing QEMU to add each component of the virtual machine. Let's start by defining a virtual disk image that we'll use to install and run DOS. The `qemu-img` command lets you create virtual disk images. For FreeDOS, we won't need much room, so I created my virtual disk with 200 megabytes:
```
qemu-img create freedos.img 200M

```

Unlike PC emulator systems like VMware or VirtualBox, you need to "build" your virtual system by instructing QEMU to add each component of the virtual machine. Although this may seem laborious, it's not that hard. I used these parameters to run QEMU to install FreeDOS on my Raspberry Pi:
```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -hda freedos.img -cdrom FD12CD.iso -boot order=d

```

You can find the full description of that command line in my other [article][5]. In brief, the command line defines an Intel i386-compatible virtual machine with 16 megabytes of memory, a US/English keyboard, and a real-time clock based on my local system time. The command line also defines a classic Sound Blaster 16 sound card, Adlib digital music card, and standard Cirrus Logic VGA card. The file `freedos.img` is defined as the first hard drive (`C:`) and the `FD12CD.iso` image as the CD-ROM (`D:`) drive. QEMU is set to boot from that `D:` CD-ROM drive.

The FreeDOS 1.2 distribution is easy to install. Just follow the prompts.

However, it takes forever to install because of the heavy disk I/O when you install the operating system, and the microSD card isn't exactly fast.

### Running FreeDOS on Raspberry Pi

Your results may vary depending on the microSD card you use. I used a SanDisk Ultra 64GB microSDXC UHS-I U1A1 card. The U1 is designed to support 1080p video recording (such as you might use in a GoPro camera) at minimum serial write speeds of 10MB/s. By comparison, a V60 is aimed at cameras that do 4K video and has a minimum sequential write speed of 60MB/s. If your Pi has a V60 microSD card or even a V30 (30MB/s), you'll see noticeably better disk I/O performance than I did.

After installing FreeDOS, you may prefer to boot directly from the virtual `C:` drive. Modify your QEMU command line to change the boot order, using `-boot order=c`, like this:
```
​qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -hda freedos.img -cdrom FD12CD.iso -boot order=c​

```

Once you have installed FreeDOS in QEMU on the Raspberry Pi, you shouldn't notice any performance issues. For example, games usually load maps, sprites, sounds, and other data when you start each level. While starting a new level in a game might take a while, I didn't notice any performance lag while playing DOS games in FreeDOS on the Raspberry Pi.

The FreeDOS 1.2 distribution includes many games and other applications that might interest you. You may need to run the `FDIMPLES` package manager program to install these extra packages. My favorite game in FreeDOS 1.2 is WING, a space-shooter game that's very reminiscent of the classic arcade game Galaga. (The name WING is a recursive acronym for Wing Is Not Galaga.)

One of my favorite DOS programs is the shareware As-Easy-As spreadsheet program. It was a popular spreadsheet application from the 1980s and 1990s, which does the same job Microsoft Excel and LibreOffice Calc fulfill today or that the DOS-based Lotus 1-2-3 spreadsheet did back in the day. As-Easy-As and Lotus 1-2-3 both saved data as WKS files, which newer versions of Microsoft Excel can't read, but LibreOffice Calc may still support, depending on compatibility. While the original version of As-Easy-As was shareware, TRIUS Software made the [activation code for As-Easy-As 5.7][6] available for free.

I'm also quite fond of the GNU Emacs editor, and FreeDOS includes a similar Emacs-like text editor called Freemacs. If you want a more powerful editor than the default FreeDOS Edit and desire an experience like GNU Emacs, then Freemacs is for you. You can install Freemacs using the `FDIMPLES` package manager in the FreeDOS 1.2 distribution.

### Yes, you can run DOS on the Raspberry Pi (sort of)

While you can't run DOS on "bare hardware" on the Raspberry Pi, it's nice to know that you can still run DOS on the Raspberry Pi via an emulator. Thanks to the QEMU PC emulator and FreeDOS, it's possible to play classic DOS games and run other DOS programs on the Raspberry Pi. Expect a slight performance hit when doing any disk I/O, especially if you're doing something intensive on the disk, like writing large amounts of data, but things will run fine after that. Once you've set up QEMU as the virtual machine emulator and installed FreeDOS, you are all set to enjoy your favorite classic DOS programs on the Raspberry Pi.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/can-you-run-dos-raspberry-pi

作者：[Jim Hall][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:http://www.freedos.org/
[2]:https://opensource.com/article/18/3/raspberry-pi-week-giveaway
[3]:https://www.qemu.org/
[4]:https://www.raspberrypi.org/downloads/
[5]:https://opensource.com/article/17/10/run-dos-applications-linux
[6]:http://www.triusinc.com/forums/viewtopic.php?t=10
