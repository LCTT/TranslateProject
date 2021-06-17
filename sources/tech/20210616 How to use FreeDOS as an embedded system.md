[#]: subject: (How to use FreeDOS as an embedded system)
[#]: via: (https://opensource.com/article/21/6/freedos-embedded-system)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to use FreeDOS as an embedded system
======
Many embedded systems today run on Linux. But once upon a time, embedded
systems either ran on a custom, proprietary platform or ran on DOS.
![Computer laptop in space][1]

The [FreeDOS website][2] says that most people use FreeDOS for three main tasks:

  1. Playing classic DOS games
  2. Running legacy DOS software
  3. Running an embedded system



But what does it mean to run an "embedded" system?

An embedded system is basically a very minimal system that is dedicated to run a specific task. You might think of embedded systems today as part of the _Internet of Things_ (IoT) including sensors, thermostats, and doorbell cameras. Many embedded systems today run on Linux.

But once upon a time, embedded systems either ran on a custom, proprietary platform or ran on DOS. Some of these DOS-based embedded systems still run today, such as cash registers or phone private branch exchange (PBX) systems. In one example as recently as 2017, trainspotters discovered a Russian electric train control system (Russian: _САВПЭ_) running FreeDOS with special software to control and monitor the route of suburban trains and to make passenger announcements.

Setting up an embedded system on DOS requires defining a minimal DOS environment that runs a single application. Fortunately, setting up a minimal FreeDOS environment is pretty easy. Technically, all you need to boot FreeDOS and run DOS applications is the kernel and a `FDCONFIG.SYS` configuration file.

### Installing a minimal system

We can simulate a dedicated, minimal FreeDOS system by using the QEMU emulator with very small allocations. To reflect an embedded system more accurately, I'll define a virtual machine with only 8 megabytes of memory and a mere 2 megabytes for a virtual hard drive.

To create the tiny virtual hard drive, I'll use this `qemu-img` command to define a 2-megabyte file:


```
$ qemu-img create tiny.img 2M
Formatting 'tiny.img', fmt=raw size=2097152
```

This command line defines a 32-bit "i386" CPU with 8 megabytes of memory, using the 2-megabyte `tiny.img` file as the hard drive image and the FreeDOS 1.3 RC4 LiveCD as the CD-ROM media. We'll also set the machine to boot from the CD-ROM drive (`-boot order=d`) although we only need that to install. We'll boot the completed embedded system from the hard disk after we've set everything up:


```
qemu-system-i386 -m 8 -hda tiny.img -cdrom FD13LIVE.iso -boot order=d
```

Boot the system using the "Live Environment mode"—this provides us with a running FreeDOS system that we can use to transfer a minimal FreeDOS to the hard disk.

![embedded setup][3]

Boot into the LiveCD environment
(Jim Hall, [CC-BY SA 4.0][4])

We'll need to create a partition on the virtual hard drive for our programs. To do that, run the FDISK program from the command line. FDISK is the standard _fixed disk_ utility on FreeDOS. Use FDISK to create a single hard drive partition that spans the entire (2-megabyte) hard drive.

![embedded setup][5]

FDISK, after creating the 2 megabyte partition
(Jim Hall, [CC-BY SA 4.0][4])

But FreeDOS won't see the new hard drive partition until you reboot—FreeDOS only reads the hard disk details at startup. Exit FDISK and reboot, and you'll be ready for the next step.

After rebooting, you need to create a DOS filesystem on the new hard drive. Since there's just the one virtual hard disk, FreeDOS will identify it as the `C:` drive. You can create a DOS filesystem on `C:` with the FORMAT command. The `/S` option transfers the operating system files (the kernel, plus a copy of the `COMMAND.COM` shell) to the new drive.

![embedded setup][6]

Format the new drive to create a DOS filesystem
(Jim Hall, [CC-BY SA 4.0][4])
 

Now that you've created the drive and formatted it, you can install the application that will run on the embedded system.

### Installing the dedicated application

An embedded system is really just a single-purpose application running on a dedicated system. Such applications are usually custom-built for the system it will control, such as a cash register, display terminal, or control environment. For this demonstration, let's use a program from the FreeDOS 1.3 RC4 installation CD-ROM. It needs to be small enough to fit in the tiny 2-megabyte hard drive we've created for it. This can be anything—so just for fun, let's make it a game.

FreeDOS 1.3 RC4 includes several fun games. One game that I like is a board game called Simple Senet. It's based on Senet, an ancient Egyptian board game. The details of the game aren't important for this demonstration, except that we'll install it and set it up as the dedicated application for the embedded system.

To install the application, go into the `\PACKAGES\GAMES` directory on the FreeDOS 1.3 RC4 LiveCD. You'll see a long list of packages there, and the one we want is `SENET.ZIP`.

![embedded setup][7]

A list of game packages from FreeDOS 1.3 RC4
(Jim Hall, [CC-BY SA 4.0][4])

To unzip the Simple Senet package onto the virtual hard drive, use the `UNZIP` command. All FreeDOS packages are Zip files, so you can use any Zip-compatible archive utility to manage them. FreeDOS 1.3 RC4 includes `ZIP` to create Zip archives, and `UNZIP` to extract Zip archives. Both are from the [Info-Zip Project][8].


```
`UNZIP SENET.ZIP -d C:\FDOS`
```

Normally, using `UNZIP` will extract a Zip file in the current directory. The `-d C:\FDOS` option at the end of the command line tells `UNZIP` to extract the Zip file to the `C:\FDOS` directory. (`-d` means "destination.")

![embedded setup][9]

Unzipping the Simple Senet game
(Jim Hall, [CC-BY SA 4.0][4])

To run the Simple Senet game whenever the embedded system boots, we need to tell FreeDOS to use Senet as the system "shell." The default FreeDOS shell is the `COMMAND.COM` program, but you can define a different shell program using the `SHELL=` directive in the `FDCONFIG.SYS` kernel configuration file. We can use FreeDOS Edit to create the new `C:\FDCONFIG.SYS` file.

![Embedded edit senet][10]

(Jim Hall, [CC-BY SA 4.0][4])

If you need to define other parameters to support the embedded system, you can add those to the `FDCONFIG.SYS` file. For example, you might need to set environment variables using the `SET` action, or tune the FreeDOS kernel with `FILES=` or `BUFFERS=` statements.

### Run the embedded system

With the embedded system fully defined, we can now reboot the machine to run the embedded application. Running an embedded system usually requires only limited resources, so for this demonstration, we'll tweak the QEMU command line to only boot from the hard drive (`-boot order=c`) and not define a CD-ROM drive:


```
qemu-system-i386 -m 8 -hda tiny.img -boot order=c
```

When the FreeDOS kernel starts up, it reads the `FDCONFIG.SYS` file for its startup parameters. Then it runs the shell using the `SHELL=` line. That runs the Simple Senet game automatically.

![embedded setup][11]

Running Simple Senet as an embedded system
(Jim Hall, [CC-BY SA 4.0][4])

We've used Simple Senet to demonstrate how to set up an embedded system on FreeDOS. Depending on your needs, you can use whatever standalone application you like. Define it as the DOS shell using the `SHELL=` line in `FDCONFIG.SYS` and FreeDOS will automatically launch the application at boot-time.

However, there's one limitation here. Embedded systems do not usually need to exit back to a command prompt, so these dedicated applications don't usually allow the user to quit to DOS. If you manage to exit the embedded application, you'll likely see a "Bad or missing Command Interpreter" prompt, where you'll need to enter the full path to a new shell. For a user-focused desktop system, this would be a problem. But on an embedded system that's dedicated to doing only one job, you should never need to exit anyway.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-embedded-system

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://www.freedos.org/
[3]: https://opensource.com/sites/default/files/uploads/embedded-setup02.png (Boot into the LiveCD environment)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/embedded-setup09.png (FDISK, after creating the 2 megabyte partition)
[6]: https://opensource.com/sites/default/files/uploads/embedded-setup19.png (Format the new drive to create a DOS filesystem)
[7]: https://opensource.com/sites/default/files/uploads/games-dir.png (A list of game packages from FreeDOS 1.3 RC4)
[8]: http://infozip.sourceforge.net/
[9]: https://opensource.com/sites/default/files/uploads/senet-unzip.png (Unzipping the Simple Senet game)
[10]: https://opensource.com/sites/default/files/pictures/embedded-edit-senet.png (Embedded edit senet)
[11]: https://opensource.com/sites/default/files/uploads/senet.png (Running Simple Senet as an embedded system)
