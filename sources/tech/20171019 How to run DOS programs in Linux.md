How to run DOS programs in Linux
============================================================

### QEMU and FreeDOS make it easy to run old DOS programs under Linux.

 [![photo of Jim Hall](https://opensource.com/sites/default/files/styles/byline_thumbnail/public/pictures/jimhall1.jpg?itok=ALPmHWAH "Jim Hall")][22]  19 Oct 2017 [Jim Hall][23] [Feed][17] 20[up][15] [13 comments][24]
![How to run DOS programs in Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 "How to run DOS programs in Linux")
Image by : opensource.com

The classic DOS operating system supported a lot of great applications: word processors, spreadsheets, games, and other programs. Just because an application is old doesn't mean it's no longer useful.

There are many reasons to run an old DOS application today. Maybe to extract a report from a legacy business application. Or to play a classic DOS game. Or just because you are curious about "classic computing." You don't need to dual-boot your system to run DOS programs. Instead, you can run them right inside Linux with the help of a PC emulator and [FreeDOS][18].

FreeDOS is a complete, free, DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded systems. Any program that works on MS-DOS should also run on FreeDOS.

In the "old days," you installed DOS as the sole operating system on a computer. These days, it's much easier to install DOS in a virtual machine running under Linux. [QEMU][19] (short for Quick EMUlator) is an open source software virtual machine system that can run DOS as a "guest" operating system Linux. Most popular Linux systems include QEMU by default.

Here are four easy steps to run old DOS applications under Linux by using QEMU and FreeDOS.

### Step 1: Set up a virtual disk

You'll need a place to install FreeDOS inside QEMU, and for that you'll need a virtual **C:** drive. In DOS, drives are assigned with letters—**A:** and **B:** are the first and second floppy disk drives and **C:** is the first hard drive. Other media, including other hard drives or CD-ROM drives, are assigned **D:**, **E:**, and so on.

Under QEMU, virtual drives are image files. To initialize a file that you can use as a virtual **C: **drive, use the **qemu-img** command. To create an image file that's about 200MB, type this:

```
qemu-img create dos.img 200M
```

Compared to modern computing, 200MB may seem small, but in the early 1990s, 200MB was pretty big. That's more than enough to install and run DOS.

### Step 2: QEMU options

Unlike PC emulator systems like VMware or VirtualBox, you need to "build" your virtual system by instructing QEMU to add each component of the virtual machine. Although this may seem laborious, it's really not that hard. Here are the parameters I use to boot FreeDOS inside QEMU:

| | |
|:-- |:--|
| **qemu-system-i386** | QEMU can emulate several different systems, but to boot DOS, we'll need to have an Intel-compatible CPU. For that, start QEMU with the i386 command. |
| **-m 16** | I like to define a virtual machine with 16MB of memory. That may seem small, but DOS doesn't require much memory to do its work. When DOS was king, computers with 16MB or even 8MB were quite common. |
| **-k en-us** | Technically, the **-k** option isn't necessary, because QEMU will set the virtual keyboard to match your actual keyboard (in my case, that's English in the standard U.S. layout). But I like to specify it anyway. |
| **-rtc base=localtime** | Every classic PC provides a real time clock (RTC) so the system can keep track of time. I find it's easiest to simply set the virtual RTC to match your local time. |
| **-soundhw sb16,adlib,pcspk** | If you need sound, especially for games, I prefer to define QEMU with SoundBlaster16 sound hardware and AdLib Music support. SoundBlaster16 and AdLib were the most common sound hardware in the DOS era. Some older programs may use the PC speaker for sound; QEMU can also emulate this. |
| **-device cirrus-vga** | To use graphics, I like to emulate a simple VGA video card. The Cirrus VGA card was a common graphics card at the time, and QEMU can emulate it. |
| **-display gtk** | For the virtual display, I set QEMU to use the GTK toolkit, which puts the virtual system in its own window and provides a simple menu to control the virtual machine. |
| **-boot order=** | You can tell QEMU to boot the virtual machine from a variety of sources. To boot from the floppy drive (typically **A:** on DOS machines) specify **order=a**. To boot from the first hard drive (usually called **C:**) use **order=c**. Or to boot from a CD-ROM drive (often assigned **D:** by DOS) use **order=d**. You can combine letters to specify a specific boot preference, such as **order=dc** to first use the CD-ROM drive, then the hard drive if the CD-ROM drive does not contain bootable media. |

### Step 3: Boot and install FreeDOS

Now that QEMU is set up to run a virtual system, we need a version of DOS to install and boot inside that virtual computer. FreeDOS makes this easy. The latest version is FreeDOS 1.2, released in December 2016.

Download the FreeDOS 1.2 distribution from the [FreeDOS website][20]. The FreeDOS 1.2 CD-ROM "standard" installer (**FD12CD.iso**) will work great for QEMU, so I recommend that version.

Installing FreeDOS is simple. First, tell QEMU to use the CD-ROM image and to boot from that. Remember that the **C:** drive is the first hard drive, so the CD-ROM will show up as the **D:** drive.

```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.img -cdrom FD12CD.iso -boot order=d
```

Just follow the prompts, and you'll have FreeDOS installed within minutes.

### [install1a.png][6]

![Starting FreeDOS installation](https://opensource.com/sites/default/files/u128651/install1a.png "Starting FreeDOS installation")

### [install2_0.png][7]

![Select your keyboard layout](https://opensource.com/sites/default/files/u128651/install2_0.png "Select your keyboard layout")

### [install3.png][8]

![Selecting which packages to install](https://opensource.com/sites/default/files/u128651/install3.png "Selecting which packages to install")

### [install4.png][9]

![Rebooting after installation](https://opensource.com/sites/default/files/u128651/install4.png "Rebooting after installation")

After you've finished, exit QEMU by closing the window.

### Step 4: Install and run your DOS application

Once you have installed FreeDOS, you can run different DOS applications inside QEMU. You can find old DOS programs online through various archives or other [websites][21].

QEMU provides an easy way to access local files on Linux. Let's say you want to share the **dosfiles/** folder with QEMU. Simply tell QEMU to use the folder as a virtual FAT drive by using the **-drive** option. QEMU will access this folder as though it were a hard drive.

```
-drive file=fat:rw:dosfiles/
```

Now, start QEMU with your regular options, plus the extra virtual FAT drive:

```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.img -drive file=fat:rw:dosfiles/ -boot order=c
```

Once you're booted in FreeDOS, any files you save to the **D:** drive will be saved to the **dosfiles/** folder on Linux. This makes reading the files directly from Linux easy; however, be careful not to change the **dosfiles/** folder from Linux after starting QEMU. QEMU builds a virtual FAT table once, when you start QEMU. If you add or delete files in **dosfiles/** after you start QEMU, the emulator may become confused.

I use QEMU like this to run my favorite DOS programs, like the As-Easy-As spreadsheet program. This was a popular spreadsheet application from the 1980s and 1990s, which does the same job that Microsoft Excel and LibreOffice Calc fulfill today, or that the more expensive Lotus 1-2-3 spreadsheet did back in the day. As-Easy-As and Lotus 1-2-3 both saved data as WKS files, which newer versions of Microsoft Excel cannot read, but which LibreOffice Calc may still support, depending on compatibility.

### [aseasy-regress1.png][10]

![As-Easy-As spreadsheet program](https://opensource.com/sites/default/files/u128651/aseasy-regress1.png "As-Easy-As spreadsheet program")

As-Easy-As spreadsheet program

I also like to boot FreeDOS under QEMU to play some of my favorite DOS games, like the original Doom. These old games are still fun to play, and they all run great under QEMU.

### [qemu-doom.png][11]

![Doom](https://opensource.com/sites/default/files/u128651/qemu-doom.png "Doom")

Doom

### [qemu-heretic.png][12]

![Heretic](https://opensource.com/sites/default/files/u128651/qemu-heretic.png "Heretic")

Heretic

### [qemu-jill.png][13]

![Jill of the Jungle](https://opensource.com/sites/default/files/u128651/qemu-jill.png "Jill of the Jungle")

Jill of the Jungle

### [qemu-keen.png][14]

![Commander Keen](https://opensource.com/sites/default/files/u128651/qemu-keen.png "Commander Keen")

Commander Keen

QEMU and FreeDOS make it easy to run old DOS programs under Linux. Once you've set up QEMU as the virtual machine emulator and installed FreeDOS, you should be all set to run your favorite classic DOS programs from Linux.

 _All images courtesy of [FreeDOS.org][16]._

--------------------------------------------------------------------------------

作者简介：

Jim Hall - Jim Hall is an open source software developer and advocate, probably best known as the founder and project coordinator for FreeDOS. Jim is also very active in the usability of open source software, as a mentor for usability testing in GNOME Outreachy, and as an occasional adjunct professor teaching a course on the Usability of Open Source Software. From 2016 to 2017, Jim served as a director on the GNOME Foundation Board of Directors. At work, Jim is Chief Information Officer in local...

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/run-dos-applications-linux

作者：[ Jim Hall ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/file/374821
[7]:https://opensource.com/file/374771
[8]:https://opensource.com/file/374776
[9]:https://opensource.com/file/374781
[10]:https://opensource.com/file/374761
[11]:https://opensource.com/file/374786
[12]:https://opensource.com/file/374791
[13]:https://opensource.com/file/374796
[14]:https://opensource.com/file/374801
[15]:https://opensource.com/article/17/10/run-dos-applications-linux?rate=STdDX4LLLyyllTxAOD-CdfSwrZQ9D3FNqJTpMGE7v_8
[16]:http://www.freedos.org/
[17]:https://opensource.com/user/126046/feed
[18]:http://www.freedos.org/
[19]:https://www.qemu.org/
[20]:http://www.freedos.org/
[21]:http://www.freedos.org/links/
[22]:https://opensource.com/users/jim-hall
[23]:https://opensource.com/users/jim-hall
[24]:https://opensource.com/article/17/10/run-dos-applications-linux#comments
