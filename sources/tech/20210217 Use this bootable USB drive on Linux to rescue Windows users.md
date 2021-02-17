[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this bootable USB drive on Linux to rescue Windows users)
[#]: via: (https://opensource.com/article/21/2/linux-woeusb)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Use this bootable USB drive on Linux to rescue Windows users
======
WoeUSB makes Windows boot disks from Linux and help your friends unlock
their out-of-commission machines.
![Puzzle pieces coming together to form a computer screen][1]

People regularly ask me to help them rescue Windows computers that have become locked or damaged. Sometimes, I can use a Linux USB boot drive to mount Windows partitions and then transfer and back up files from the damaged systems.

Other times, clients lose their passwords or otherwise lock their login account credentials. One way to unlock an account is to create a Windows boot disk to repair the computer. Microsoft allows you to download copies of Windows from its website and offers tools to create a USB boot device. But to use them, you need a Windows computer, which means, as a Linux user, I need another way to create a boot DVD or USB drive. I have found it difficult to create Windows USBs on Linux. My reliable tools, like [Etcher.io][2], [Popsicle][3] (for Pop!_OS), and [UNetbootin][4], or using `dd` from the command line to create bootable media, have not been very successful.

That is until I discovered [WoeUSB-ng][5], a [GPL 3.0][6] Linux tool that creates a bootable USB drive for Windows Vista, 7, 8, and 10. The open source software has two programs: a command-line utility and a graphical user interface (GUI) version.

### Install WoeUSB-ng

The GitHub repository contains instructions for [installing][7] WoeUSB-ng on Arch, Ubuntu, Fedora, or with pip3.

If you're on a supported Linux operating system, you can install WoeUSB-ng using your package manager. Alternatively, you can use Python's package manager, [pip][8], to install the application. This is universal across any Linux distribution. There's no functional difference between these methods, so use whichever's familiar to you.

I'm running Pop!_OS, which is an Ubuntu derivative, but being comfortable with Python, I chose the pip3 install:


```
`$ sudo pip3 install WoeUSB-ng`
```

### Create a boot disk

You can use WoeUSB-ng from the command line or the GUI version.

To create a boot disk from the command line, the syntax requires the command, a path to your Windows ISO file (`/dev/sdX` in this example; use the `lsblk` command to determine your drive), and a device: 


```
`$ sudo woeusb --device Windows.iso /dev/sdX`
```

You can also launch the program for an easy-to-use interface. In the WoeUSB-ng application window, find the Windows.iso file and select it. Choose your USB target device—the drive you want to make into a Windows boot drive. This will ERASE all information on this drive, so choose carefully—and then double-check (and triple-check) your choice!

Once you're sure you have the right destination drive selected, click the **Install** button.

![WoeUSB-ng UI][9]

(Don Watkins, [CC BY-SA 4.0][10])

Creating media takes five to 10 minutes, depending on your Linux computer's processor, memory, USB port speed, etc. Be patient.

Once the process is finished and verified, you have a functional Windows USB boot device to help someone repair their Windows computer.

### Help others

Open source is all about helping other people. Very often, you can help Windows users by using the Linux-based [System Rescue CD][11]. But sometimes, the only way to help is directly from Windows, and WoeUSB-ng is a great open source tool to make that possible.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-woeusb

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://etcher.io/
[3]: https://github.com/pop-os/popsicle
[4]: https://github.com/unetbootin/unetbootin
[5]: https://github.com/WoeUSB/WoeUSB-ng
[6]: https://github.com/WoeUSB/WoeUSB-ng/blob/master/COPYING
[7]: https://github.com/WoeUSB/WoeUSB-ng#installation
[8]: https://opensource.com/downloads/pip-cheat-sheet
[9]: https://opensource.com/sites/default/files/uploads/woeusb-ng-gui.png (WoeUSB-ng UI)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://www.system-rescue.org/
