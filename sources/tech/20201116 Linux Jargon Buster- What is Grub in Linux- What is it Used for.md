[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is Grub in Linux? What is it Used for?)
[#]: via: (https://itsfoss.com/what-is-grub/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Jargon Buster: What is Grub in Linux? What is it Used for?
======

If you ever used a desktop Linux system, you must have seen this screen. This is called the GRUB screen. Yes, it is written in all capital letters.

![Remember this screen? This is GRUB][1]

In this chapter of the Linux Jargon Buster series, I’ll tell you what is Grub and what is it used for. I’ll also briefly touch upon the configuration and customization part.

### What is GRUB?

[GRUB][2] is complete program for loading and managing boot. It is the most common bootloader for Linux distributions. A bootloader is the first software that runs when a computer starts. It loads the [kernel of the operating system][3] and then the kernel initializes the rest of the operating systems (shell, [display manager][4], [desktop environment][5] etc).

#### Boot loader vs boot manager

I didn’t want to confuse you at this stage but I see no option to avoid bringing this topic. There is a blur line between a bootloader and a boot manager.

You already know that bootloader starts first and then loads the kernel into memory and executes it. A boot manager program allows you to choose between operating systems (if there are more than one OS on your system). A boot manager doesn’t load the OS directly,

With Linux kernel version 3.3, the [Linux kernel includes a built-in EFI bootloader][6]. In fact, any operating system that is capable of working [EFI system includes an EFI bootloader][7]. In EFI capable systems, the firmware reads the EFI System Partition (ESP) for the EFI files for boot information.

_**Insert Image: Show partition table with ESP partition.**_

![][8]

GRUB is both a bootloader and a boot manager. I’ll come back to GRUB in a moment. Let’s see other GRUB like programs.

Trivia

GRUB is acronym for **GR**and **U**nified **B**ootloader.

### What are some other boot managing programs like GRUB?

GRUB is the most popular boot manager for Linux. But it is not the only one. There is this highly customizable [rEFInd boot manager][9] that some Linux users love to use.

![Customized rEFInd Boot Manager Screen | Image Credit][10]

There is [systemd-boot][11] text-based boot manager. You can guess that this is exclusively for systemd-based Linux distributions. Some distributions like Pop OS use the systemd-boot.

![systemd-Boot in Pop OS | Image Credit][12]

### Accessing or editing GRUB

The usual GRUB screen you see is its menu interface. It allows you to choose the operating systems if there are more than one operating system. You can also choose to load a different kernel if your Linux distribution as more than one kernel installed.

Depending upon the configuration set by the Linux distribution, you may have some other entries on the GRUB menu.

You can edit GRUB menu entry by pressing the key `e`. This way, you can change the kernel parameters before loading it. For example, in some cases, [disabling the graphics driver from the kernel helps you with Linux system stuck at boot][13].

![][14]

You can also enter the command line menu of GRUB using the key `c` at the GRUB menu interface.

#### GRUB configuration file

Any changes you make to the GRUB from the menu interface is temporary. If you want to make some permanent changes to GRUB like changing the default timeout, you can change the configuration file after you boot into your Linux system.

The default GRUB configuration file is located at /etc/default/grub. There is also a /etc/default/grub.d directory. You may edit the /etc/default/grub file directly, however it is advised to make additional changes by adding config files (.cfg files) in this directory.

![Default GRUB Config File][15]

You must [update GRUB for the changes to take into effect][16].

#### GRUB customizer in Ubuntu

If you think [editing file with a text editor in the terminal][17] is not something you feel comfortable with, you can [use a graphical tool called GRUB Customizer][18].

![][19]

It allows you to change the boot order, default timeout etc. You can also use it to change the background of GRUB with a custom wallpaper.

This tool is unfortunately available for Ubuntu-based Linux distributions only.

### Conclusion

I have touched everything on the surface. EFI, boot loading and GRUB itself is detailed and complicated topic and not in the scope of this article. This article intended to give you a high level overview of GRUB boot program.

Perhaps I’ll write a detailed guide on GRUB explaining the low level details. For now, if you want to learn more on GRUB, you can access the GRUB documentation in your Linux terminal using `info grub` command.

![GRUB Manual can be accessed via Terminal][20]

I hope you have a tad bit better understanding of what is GRUB now. Here’s a GIF to humor you.

![What Is GRUB? UEFI don’t hurt me, no more… :\)][21]

I may not have answered all questions you have about GRUB. Please feel free to let me know in the comment section. I may update the article with your questions or suggestions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-grub/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/grub-screen-linux.png?resize=800%2C450&ssl=1
[2]: https://www.gnu.org/software/grub/
[3]: https://itsfoss.com/what-is-linux/
[4]: https://itsfoss.com/display-manager/
[5]: https://itsfoss.com/what-is-desktop-environment/
[6]: https://www.rodsbooks.com/efi-bootloaders/efistub.html
[7]: https://jdebp.eu/FGA/efi-boot-process.html
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/disk-partition-gparted.png?resize=744%2C385&ssl=1
[9]: https://www.rodsbooks.com/refind/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/refind-boot-manager.png?resize=800%2C602&ssl=1
[11]: https://wiki.gentoo.org/wiki/Systemd-boot
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/systemd-boot.png?resize=714%2C333&ssl=1
[13]: https://itsfoss.com/fix-ubuntu-freezing/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/editing-grub-to-fix-nvidia-issue.jpg?resize=800%2C343&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/default-grub-config-file.png?resize=759%2C437&ssl=1
[16]: https://itsfoss.com/update-grub/
[17]: https://itsfoss.com/command-line-text-editors-linux/
[18]: https://itsfoss.com/grub-customizer-ubuntu/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2013/05/make-windows-default-grub-2.jpeg?resize=799%2C435&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/grub-manual-Linux-terminal.png?resize=800%2C462&ssl=1
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/what_is_GRUB.gif?resize=500%2C343&ssl=1
