fuowang 翻译中

Linux on UEFI:A Quick Installation Guide
============================================================


This Web page is provided free of charge and with no annoying outside ads; however, I did take time to prepare it, and Web hosting does cost money. If you find this Web page useful, please consider making a small donation to help keep this site up and running. Thanks!

### Introduction

For several years, a new firmware technology has been lurking in the wings, unknown to most ordinary users. Known as the [Extensible Firmware Interface (EFI),][29] or more recently as the Unified EFI (UEFI, which is essentially EFI 2. _x_ ), this technology has begun replacing the older [Basic Input/Output System (BIOS)][30] firmware with which most experienced computer users are at least somewhat familiar.

This page is a quick introduction to EFI for Linux users, including advice on getting started installing Linux to such a computer. Unfortunately, EFI is a dense topic; the EFI software itself is complex, and many implementations have system-specific quirks and even bugs. Thus, I cannot describe everything you'll need to know to install and use Linux on an EFI computer on this one page. It's my hope that you'll find this page a useful starting point, though, and links within each section and in the [References][31] section at the end will point you toward additional documentation.

#### Contents

*   [Introduction][18]
*   [Does Your Computer Use EFI?][19]
*   [Does Your Distribution Support EFI?][20]
*   [Preparing to Install Linux][21]
*   [Installing Linux][22]
*   [Fixing Post-Installation Problems][23]
*   [Oops: Converting a Legacy-Mode Install to Boot in EFI Mode][24]
*   [References][25]

### Does Your Computer Use EFI?

EFI is a type of  _firmware,_  meaning that it's software built into the computer to handle low-level tasks. Most importantly, the firmware controls the computer's boot process, which in turn means that EFI-based computers boot differently than do BIOS-based computers. (A partial exception to this rule is described shortly.) This difference can greatly complicate the design of OS installation media, but it has little effect on the day-to-day operation of the computer, once everything is set up and running. Note that most manufacturers use the term "BIOS" to refer to their EFIs. I consider this usage confusing, so I avoid it; in my view, EFIs and BIOSes are two different types of firmware.

**Note:** The EFI that Apple uses on Macs is unusual in many respects. Although much of this page applies to Macs, some details differ, particularly when it comes to setting up EFI boot loaders. This task is best handled from OS X by using the Mac's [bless utility,][49]which I don't describe here.

EFI has been used on Intel-based Macs since they were first introduced in 2006\. Beginning in late 2012, most computers that ship with Windows 8 or later boot using UEFI by default, and in fact most PCs released since mid-2011 use UEFI, although they may not boot in EFI mode by default. A few PCs sold prior to 2011 also support EFI, although most such computers boot in BIOS mode by default.

If you're uncertain about your computer's EFI support status, you should check your firmware setup utility and your user manual for references to  _EFI_ ,  _UEFI_ , or  _legacy booting_ . (Searching a PDF of your user manual can be a quick way to do this.) If you find no such references, your computer probably uses an old-style ("legacy") BIOS; but if you find references to these terms, it almost certainly uses EFI. You can also try booting a medium that contains  _only_  an EFI-mode boot loader. The USB flash drive or CD-R image of [rEFInd][50] is a good choice for this test.

Before proceeding further, you should understand that most EFIs on  _x_ 86 and  _x_ 86-64 computers include a component known as the  _Compatibility Support Module (CSM),_  which enables the EFI to boot OSes using the older BIOS-style boot mechanisms. This can be a great convenience because it provides backwards compatibility; but it also creates complications because there's no standardization in the rules and user interfaces for controlling when a computer boots in EFI mode vs. when it boots in BIOS (aka CSM or legacy) mode. In particular, it's far too easy to accidentally boot your Linux installation medium in BIOS/CSM/legacy mode, which will result in a BIOS/CSM/legacy-mode installation of Linux. This can work fine if Linux is your only OS, but it complicates the boot process if you're dual-booting with Windows in EFI mode. (The opposite problem can also occur.) The following sections should help you boot your installer in the right mode. If you're reading this page after you've installed Linux in BIOS mode and want to switch boot modes, read the upcoming section, [Oops: Converting a Legacy-Mode Install to Boot in EFI Mode.][51]

One optional feature of UEFI deserves mention:  _Secure Boot._  This feature is designed to minimize the risk of a computer becoming infected with a  _boot kit,_  which is a type of malware that infects the computer's boot loader. Boot kits can be particularly difficult to detect and remove, which makes blocking them a priority. Microsoft requires that all desktop and laptop computers that bear a Windows 8 logo ship with Secure Boot enabled. This type of configuration complicates Linux installation, although some distributions handle this problem better than do others. Do not confuse Secure Boot with EFI or UEFI, though; it's possible for an EFI computer to not support Secure Boot, and it's possible to disable Secure Boot even on  _x_ 86-64 EFI computers that support it. Microsoft requires that users can disable Secure Boot for Windows 8 certification on  _x_ 86 and  _x_ 86-64 computers; however, this requirement is reversed for ARM computers—such computers that ship with Windows 8 must  _not_  permit the user to disable Secure Boot. Fortunately, ARM-based Windows 8 computers are currently rare. I recommend avoiding them.

### Does Your Distribution Support EFI?

Most Linux distributions have supported EFI for years. The quality of that support varies from one distribution to another, though. Most of the major distributions (Fedora, OpenSUSE, Ubuntu, and so on) provide good EFI support, including support for Secure Boot. Some more "do-it-yourself" distributions, such as Gentoo, have weaker EFI support, but their nature makes it easy to add EFI support to them. In fact, it's possible to add EFI support to  _any_  Linux distribution: You need to install it (even in BIOS mode) and then install an EFI boot loader on the computer. See the [Oops: Converting a Legacy-Mode Install to Boot in EFI Mode][52] section for information on how to do this.

You should check your distribution's feature list to determine if it supports EFI. You should also pay attention to your distribution's support for Secure Boot, particularly if you intend to dual-boot with Windows 8\. Note that even distributions that officially support Secure Boot may require that this feature be disabled, since Linux Secure Boot support is often poor or creates complications.

### Preparing to Install Linux

A few preparatory steps will help make your Linux installation on an EFI-based computer go more smoothly:

1.  **Upgrade your firmware**—Some EFIs are badly broken, but hardware manufacturers occasionally release updates to their firmware. Thus, I recommend upgrading your firmware to the latest version available. If you know from forum posts or the like that your EFI is problematic, you should do this before installing Linux, because some problems will require extra steps to correct if the firmware is upgraded after the installation. On the other hand, upgrading firmware is always a bit risky, so holding off on such an upgrade may be best if you've heard good things about your manufacturer's EFI support.
3.  **Learn how to use your firmware**—You</a> can usually enter a firmware setup utility by hitting the Del key or a function key early in the boot process. Check for prompts soon after you power on the computer or just try each function key. Similarly, the Esc key or a function key usually enters the firmware's built-in boot manager, which enables you to select which OS or external device to boot. Some manufacturers are making it hard to reach such settings. In some cases, you can do so from inside Windows 8, as described on [this page.][32]
4.  **Adjust the following firmware settings:**
    *   **Fast boot**—This feature can speed up the boot process by taking shortcuts in hardware initialization. Sometimes this is fine, but sometimes it can leave USB hardware uninitialized, which can make it impossible to boot from a USB flash drive or similar device. Thus, disabling fast boot  _may_  be helpful, or even required; but you can safely leave it active and deactivate it only if you have trouble getting the Linux installer to boot. Note that this feature sometimes goes by another name. In some cases, you must  _enable_  USB support rather than  _disable_  a fast boot feature.
    *   **Secure Boot**—Fedora, OpenSUSE, Ubuntu, and some other distributions officially support Secure Boot; but if you have problems getting a boot loader or kernel to start, you might want to disable this feature. Unfortunately, fully describing how to do so is impossible because the settings vary from one computer to another. See [my Secure Boot page][1] for more on this topic.

    **Note:** Some guides say to enable BIOS/CSM/legacy support to install Linux. As a general rule, they're wrong to do so. Enabling this support can overcome hurdles involved in booting the installer, but doing so creates new problems down the line. Guides to install in this way often overcome these later problems by running Boot Repair, but it's better to do it correctly from the start. This page provides tips to help you get your Linux installer to boot in EFI mode, thus bypassing the later problems.

    *   **CSM/legacy options**—If you want to install in EFI mode, set such options  _off._  Some guides recommend enabling these options, and in some cases they may be required—for instance, they may be needed to enable the BIOS-mode firmware in some add-on video cards. In most cases, though, enabling CSM/legacy support simply increases the risk of inadvertently booting your Linux installer in BIOS mode, which you do  _not_  want to do. Note that Secure Boot and CSM/legacy options are sometimes intertwined, so be sure to check each one after changing the other.
5.  **Disable the Windows Fast Startup feature**—[This page][33] describes how to disable this feature, which is almost certain to cause filesystem corruption if left enabled. Note that this feature is distinct from the firmware's fast boot feature.
6.  **Check your partition table**—Using [GPT fdisk,][34] parted, or any other partitioning tool, check your disk's partitions. Ideally, you should create a hardcopy that includes the exact start and end points (in sectors) of each partition. This will be a useful reference, particularly if you use a manual partitioning option in the installer. If Windows is already installed, be sure to identify your [EFI System Partition (ESP),][35] which is a FAT partition with its "boot flag" set (in parted or GParted) or that has a type code of EF00 in gdisk.

### Installing Linux

Most Linux distributions provide adequate installation instructions; however, I've observed a few common stumbling blocks on EFI-mode installations:

*   **Ensure that you're using a distribution that's the right bit depth**—EFI runs boot loaders that are the same bit depth as the EFI itself. This is normally 64-bit for modern computers, although the first couple generations of Intel-based Macs, some modern tablets and convertibles, and a handful of obscure computers use 32-bit EFIs. I have yet to encounter a 32-bit Linux distribution that officially supports EFI, although it is possible to add a 32-bit EFI boot loader to 32-bit distributions. (My [Managing EFI Boot Loaders for Linux][36] covers boot loaders generally, and understanding those principles may enable you to modify a 32-bit distribution's installer, although that's not a task for a beginner.) Installing a 32-bit Linux distribution on a computer with a 64-bit EFI is difficult at best, and I don't describe the process here; you should use a 64-bit distribution on a computer with a 64-bit EFI.
*   **Properly prepare your boot medium**—Third-party tools for moving .iso images onto USB flash drives, such as unetbootin, often fail to create the proper EFI-mode boot entries. I recommend you follow whatever procedure your distribution maintainer suggests for creating USB flash drives. If no such recommendation is made, use the Linux dd utility, as in dd if=image.iso of=/dev/sdc to create an image on the USB flash drive on /dev/sdc. Ports of dd to Windows, such as [WinDD][37] and [dd for Windows,][38] exist, but I've never tested them. Note that using tools that don't understand EFI to create your installation medium is one of the mistakes that leads people into the bigger mistake of installing in BIOS mode and then having to correct the ensuing problems, so don't ignore this point!
*   **Back up the ESP**—If you're installing to a computer that already boots Windows or some other OS, I recommend backing up your ESP before installing Linux. Although Linux  _shouldn't_  damage files that are already on the ESP, this does seem to happen from time to time. Having a backup will help in such cases. A simple file-level backup (using cp, tar, or zip, for example) should work fine.
*   **Booting in EFI mode**—It's too easy to accidentally boot your Linux installer in BIOS/CSM/legacy mode, particularly if you leave the CSM/legacy options enabled in your firmware. A few tips can help you to avoid this problem:

*   You should verify an EFI-mode boot by dropping to a Linux shell and typing ls /sys/firmware/efi. If you see a list of files and directories, you've booted in EFI mode and you can ignore the following additional tips; if not, you've probably booted in BIOS mode and should review your settings.
*   Use your firmware's built-in boot manager (which you should have located earlier; see [Learn how to use your firmware][26]) to boot in EFI mode. Typically, you'll see two options for a CD-R or USB flash drive, one of which includes the string  _EFI_  or  _UEFI_  in its description, and one of which does not. Use the EFI/UEFI option to boot your medium.
*   Disable Secure Boot—Even if you're using a distribution that officially supports Secure Boot, sometimes this doesn't work. In this case, the computer will most likely silently move on to the next boot loader, which could be your medium's BIOS-mode boot loader, resulting in a BIOS-mode boot. See [my page on Secure Boot][27] for some tips on how to disable Secure Boot.
*   If you can't seem to get the Linux installer to boot in EFI mode, try using a USB flash drive or CD-R version of my [rEFInd boot manager.][28] If rEFInd boots, it's guaranteed to be running in EFI mode, and on a UEFI-based PC, it will show only EFI-mode boot options, so if you can then boot to the Linux installer, it should be in EFI mode. (On Macs, though, rEFInd shows BIOS-mode boot options in addition to EFI-mode options.)

*   **Preparing your ESP**—Except on Macs, EFIs use the ESP to hold boot loaders. If your computer came with Windows pre-installed, an ESP should already exist, and you can use it in Linux. If not, I recommend creating an ESP that's 550MiB in size. (If your existing ESP is smaller than this, go ahead and use it.) Create a FAT32 filesystem on it. If you use GParted or parted to prepare your disk, give the ESP a "boot flag." If you use GPT fdisk (gdisk, cgdisk, or sgdisk) to prepare the disk, give it a type code of EF00\. Some installers create a smallish ESP and put a FAT16 filesystem on it. This usually works fine, although if you subsequently need to re-install Windows, its installer will become confused by the FAT16 ESP, so you may need to back it up and convert it to FAT32 form.
*   **Using the ESP**—Different distributions' installers have different ways of identifying the ESP. For instance, some versions of Debian and Ubuntu call the ESP the "EFI boot partition" and do not show you an explicit mount point (although it will mount it behind the scenes); but a distribution like Arch or Gentoo will require you to mount it. The closest thing to a standard ESP mount point in Linux is /boot/efi, although /boot works well with some configurations—particularly if you want to use gummiboot or ELILO. Some distributions won't let you use a FAT partition as /boot, though. Thus, if you're asked to set a mount point for the ESP, make it /boot/efi. Do  _not_  create a fresh filesystem on the ESP unless it doesn't already have one—if Windows or some other OS is already installed, its boot loader lives on the ESP, and creating a new filesystem will destroy that boot loader!
*   **Setting the boot loader location**—Some distributions may ask about the boot loader's (GRUB's) location. If you've properly flagged the ESP as such, this question should be unnecessary, but some distributions' installers still ask. Try telling it to use the ESP.
*   **Other partitions**—Other than the ESP, no other special partitions are required; you can set up root (/), swap, /home, or whatever else you like in the same way you would for a BIOS-mode installation. Note that you do  _not_  need a [BIOS Boot Partition][39] for an EFI-mode installation, so if your installer is telling you that you need one, this may be a sign that you've accidentally booted in BIOS mode. On the other hand, if you create a BIOS Boot Partition, that will give you some extra flexibility, since you'll be able to install a BIOS version of GRUB to boot in either mode (EFI or BIOS).
*   **Fixing blank displays**—A problem that many people had through much of 2013 (but with decreasing frequency since then) was blank displays when booted in EFI mode. Sometimes this problem can be fixed by adding nomodeset to the kernel's command line. You can do this by typing e to open a simple text editor in GRUB. In many cases, though, you'll need to research this problem in more detail, because it often has more hardware-specific causes.

In some cases, you may be forced to install Linux in BIOS mode. You can sometimes then manually install an EFI-mode boot loader for Linux to begin booting in EFI mode. See my [Managing EFI Boot Loaders for Linux][53] page for information on available boot loaders and how to install them.

### Fixing Post-Installation Problems

If you can't seem to get an EFI-mode boot of Linux working but a BIOS-mode boot works, you can abandon EFI mode entirely. This is easiest on a Linux-only computer; just install a BIOS-mode boot loader (which the installer should have done if you installed in BIOS mode). If you're dual-booting with an EFI-mode Windows, though, the easiest solution is to install my [rEFInd boot manager.][54] Install it from Windows and edit the refind.conf file: Uncomment the scanfor line and ensure that hdbios is among the options. This will enable rEFInd to redirect the boot process to a BIOS-mode boot loader. This solution works for many systems, but sometimes it fails for one reason or another.

If you reboot the computer and it boots straight into Windows, it's likely that your Linux boot loader or boot manager was not properly installed. (You should try disabling Secure Boot first, though; as I've said, it often causes problems.) There are several possible solutions to this problem:

*   **Use efibootmgr**—You can boot a Linux emergency disc  _in EFI mode_  and use the efibootmgr utility to re-register your Linux boot loader, as described [here.][40]
*   **Use bcdedit in Windows**—In a Windows Administrator Command Prompt window, typing bcdedit /set {bootmgr} path \EFI\fedora\grubx64.efi will set the EFI/fedora/grubx64.efi file on the ESP as the default boot loader. Change that path as necessary to point to your desired boot loader. If you're booting with Secure Boot enabled, you should set shim.efi, shimx64.efi, or PreLoader.efi (whichever is present) as the boot program, rather than grubx64.efi.
*   **Install rEFInd**—Sometimes rEFInd can overcome this problem. I recommend testing by using the [CD-R or USB flash drive image.][41] If it can boot Linux, install the Debian package, RPM, or .zip file package. (Note that you may need to edit your boot options by highlighting a Linux vmlinuz* option and hitting F2 or Insert twice. This is most likely to be required if you've got a separate /bootpartition, since in this situation rEFInd can't locate the root (/) partition to pass to the kernel.)
*   **Use Boot Repair**—Ubuntu's [Boot Repair utility][42] can auto-repair some boot problems; however, I recommend using it only on Ubuntu and closely-related distributions, such as Mint. In some cases, it may be necessary to click the Advanced option and check the box to back up and replace the Windows boot loader.
*   **Hijack the Windows boot loader**—Some buggy EFIs boot only the Windows boot loader, which is called EFI/Microsoft/Boot/bootmgfw.efi on the ESP. Thus, you may need to rename this boot loader to something else (I recommend moving it down one level, to EFI/Microsoft/bootmgfw.efi) and putting a copy of your preferred boot loader in its place. (Most distributions put a copy of GRUB in a subdirectory of EFI named after themselves, such as EFI/ubuntu for Ubuntu or EFI/fedora for Fedora.) Note that this solution is an ugly hack, and some users have reported that Windows will replace its boot loader, so it may not even work 100% of the time. It is, however, the only solution that works on some badly broken EFIs. Before attempting this solution, I recommend upgrading your firmware and re-registering your own boot loader with efibootmgr in Linux or bcdedit in Windows.

Another class of problems relates to boot loader troubles—If you see GRUB (or whatever boot loader or boot manager your distribution uses by default) but it doesn't boot an OS, you must fix that problem. Windows often fails to boot because GRUB 2 is very finicky about booting Windows. This problem can be exacerbated by Secure Boot in some cases. See [my page on GRUB 2][55] for a sample GRUB 2 entry for booting Windows. Linux boot problems, once GRUB appears, can have a number of causes, and are likely to be similar to BIOS-mode Linux boot problems, so I don't cover them here.

Despite the fact that it's very common, my opinion of GRUB 2 is rather low—it's an immensely complex program that's difficult to configure and use. Thus, if you run into problems with GRUB, my initial response is to replace it with something else. [My Web page on EFI boot loaders for Linux][56] describes the options that are available. These include my own [rEFInd boot manager,][57] which is much easier to install and maintain, aside from the fact that many distributions do manage to get GRUB 2 working—but if you're considering replacing GRUB 2 because of its problems, that's obviously not worked out for you!

Beyond these issues, EFI booting problems can be quite idiosyncratic, so you may need to post to a Web forum for help. Be sure to describe the problem as thoroughly as you can. The [Boot Info Script][58] can provide useful information—run it and it should produce a file called RESULTS.txt that you can paste into your forum post. Be sure to precede this pasted text with the string [code] and follow it with [/code], though; otherwise people will complain. Alternatively, upload RESULTS.txt to a pastebin site, such as [pastebin.com,][59] and post the URL that the site gives you.

### Oops: Converting a Legacy-Mode Install to Boot in EFI Mode

**Warning:** These instructions are written primarily for UEFI-based PCs. If you've installed Linux in BIOS mode on a Mac but want to boot Linux in EFI mode, you can install your boot program  _in OS X._  rEFInd (or the older rEFIt) is the usual choice on Macs, but GRUB can be made to work with some extra effort.

As of early 2015, one very common problem I see in online forums is that people follow bad instructions and install Linux in BIOS mode to dual-boot with an existing EFI-mode Windows installation. This configuration works poorly because most EFIs make it difficult to switch between boot modes, and GRUB can't handle the task, either. You might also find yourself in this situation if you've got a very flaky EFI that simply won't boot an external medium in EFI mode, or if you have video or other problems with Linux when it's booted in EFI mode.

As noted earlier, in [Fixing Post-Installation Problems,][60] one possible solution to such problems is to install rEFInd  _in Windows_  and configure it to support BIOS-mode boots. You can then boot rEFInd and chainload to your BIOS-mode GRUB. I recommend this fix mainly when you have EFI-specific problems in Linux, such as a failure to use your video card. If you don't have such EFI-specific problems, installing rEFInd and a suitable EFI filesystem driver in Windows will enable you to boot Linux directly in EFI mode. This can be a perfectly good solution, and it will be equivalent to what I describe next.

In most cases, it's best to configure Linux to boot in EFI mode. There are many ways to do this, but the best way requires using an EFI-mode boot of Linux (or conceivably Windows or an EFI shell) to register an EFI-mode version of your preferred boot manager. One way to accomplish this goal is as follows:

1.  Download a USB flash drive or CD-R version of my [rEFInd boot manager.][43]
2.  Prepare a medium from the image file you've downloaded. You can do this from any computer, booted in either EFI or BIOS mode (or in other ways on other platforms).
3.  If you've not already done so, [disable Secure Boot.][44] This is necessary because the rEFInd CD-R and USB images don't support Secure Boot. If you want to keep Secure Boot, you can re-enable it later.
4.  Boot rEFInd on your target computer. As described earlier, you may need to adjust your firmware settings and use the built-in boot manager to select your boot medium. The option you select may need to include the string  _UEFI_  in its description.
5.  In rEFInd, examine the boot options. You should see at least one option for booting a Linux kernel (with a name that includes the string vmlinuz). Boot it in one of two ways:
    *   If you do  _not_  have a separate /boot partition, simply highlight the kernel and press Enter. Linux should boot.
    *   If you  _do_  have a separate /boot partition, press Insert or F2 twice. This action will open a line editor in which you can edit your kernel options. Add a root= specification to those options to identify your root (/) filesystem, as in root=/dev/sda5 if root (/) is on /dev/sda5. If you don't know what your root filesystem is, you should reboot in any way possible to figure it out.In some rare cases, you may need to add other kernel options instead of or in addition to a root= option. Gentoo with an LVM configuration requires dolvm, for example.
6.  Once Linux is booted, install your desired boot program. rEFInd is usually pretty easy to install via the RPM, Debian package, PPA, or binary .zip file referenced on the [rEFInd downloads page.][45] On Ubuntu and similar distributions, Boot Repair can fix your GRUB setup relatively simply, but it will be a bit of a leap of faith that it will work correctly. (It usually works fine, but in some cases it will make a hash of things.) Other options are described on my [Managing EFI Boot Loaders for Linux][46] page.
7.  If you want to boot with Secure Boot active, reboot and enable it. Note, however, that you may need to take extra installation steps to set up your boot program to use Secure Boot. Consult [my page on the topic][47] or your boot program's Secure Boot documentation for details.

When you reboot, you should see the boot program you just installed. If the computer instead boots into a BIOS-mode version of GRUB, you should enter your firmware and disable the BIOS/CSM/legacy support, or perhaps adjust your boot order options. If the computer boots straight to Windows, then you should read the preceding section, [Fixing Post-Installation Problems.][61]

You may want or need to tweak your configuration at this point. It's common to see extra boot options, or for an option you want to not be visible. Consult your boot program's documentation to learn how to make such changes.

### References and Additional Information


*   **Informational Web pages**
    *   My [Managing EFI Boot Loaders for Linux][2] page covers the available EFI boot loaders and boot managers.
    *   The [man page for OS X's bless tool][3] may be helpful in setting up a boot loader or boot manager on that platform.
    *   [The EFI Boot Process][4] describes, in broad strokes, how EFI systems boot.
    *   The [Arch Linux UEFI wiki page][5] has a great deal of information on UEFI and Linux.
    *   Adam Williamson has written a good [summary of what EFI is and how it works.][6]
    *   [This page][7] describes how to adjust EFI firmware settings from within Windows 8.
    *   Matthew J. Garrett, the developer of the Shim boot loader to manage Secure Boot, maintains [a blog][8] in which he often writes about EFI issues.
    *   If you're interested in developing EFI software yourself, my [Programming for EFI][9] can help you get started.
*   **Additional programs**
    *   [The official rEFInd Web page][10]
    *   [The official gummiboot Web page][11]
    *   [The official ELILO Web page][12]
    *   [The official GRUB Web page][13]
    *   [The official GPT fdisk partitioning software Web page][14]
    *   Ubuntu's [Boot Repair utility][15] can help fix some boot problems
*   **Communications**
    *   The [rEFInd discussion forum on Sourceforge][16] provides a way to discuss rEFInd with other users or with me.
    *   Pastebin sites, such as [http://pastebin.com,][17] provide a convenient way to exchange largeish text files with users on Web forums.

--------------------------------------------------------------------------------

via: http://www.rodsbooks.com/linux-uefi/

作者：[Roderick W. Smith][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:rodsmith@rodsbooks.com
[1]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html#disable
[2]:http://www.rodsbooks.com/efi-bootloaders/
[3]:http://ss64.com/osx/bless.html
[4]:http://homepage.ntlworld.com/jonathan.deboynepollard/FGA/efi-boot-process.html
[5]:https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface
[6]:https://www.happyassassin.net/2014/01/25/uefi-boot-how-does-that-actually-work-then/
[7]:http://www.eightforums.com/tutorials/20256-uefi-firmware-settings-boot-inside-windows-8-a.html
[8]:http://mjg59.dreamwidth.org/
[9]:http://www.rodsbooks.com/efi-programming/
[10]:http://www.rodsbooks.com/refind/
[11]:http://freedesktop.org/wiki/Software/gummiboot
[12]:http://elilo.sourceforge.net/
[13]:http://www.gnu.org/software/grub/
[14]:http://www.rodsbooks.com/gdisk/
[15]:https://help.ubuntu.com/community/Boot-Repair
[16]:https://sourceforge.net/p/refind/discussion/
[17]:http://pastebin.com/
[18]:http://www.rodsbooks.com/linux-uefi/#intro
[19]:http://www.rodsbooks.com/linux-uefi/#isitefi
[20]:http://www.rodsbooks.com/linux-uefi/#distributions
[21]:http://www.rodsbooks.com/linux-uefi/#preparing
[22]:http://www.rodsbooks.com/linux-uefi/#installing
[23]:http://www.rodsbooks.com/linux-uefi/#troubleshooting
[24]:http://www.rodsbooks.com/linux-uefi/#oops
[25]:http://www.rodsbooks.com/linux-uefi/#references
[26]:http://www.rodsbooks.com/linux-uefi/#using_firmware
[27]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html#disable
[28]:http://www.rodsbooks.com/refind/getting.html
[29]:https://en.wikipedia.org/wiki/Uefi
[30]:https://en.wikipedia.org/wiki/BIOS
[31]:http://www.rodsbooks.com/linux-uefi/#references
[32]:http://www.eightforums.com/tutorials/20256-uefi-firmware-settings-boot-inside-windows-8-a.html
[33]:http://www.eightforums.com/tutorials/6320-fast-startup-turn-off-windows-8-a.html
[34]:http://www.rodsbooks.com/gdisk/
[35]:http://en.wikipedia.org/wiki/EFI_System_partition
[36]:http://www.rodsbooks.com/efi-bootloaders
[37]:https://sourceforge.net/projects/windd/
[38]:http://www.chrysocome.net/dd
[39]:https://en.wikipedia.org/wiki/BIOS_Boot_partition
[40]:http://www.rodsbooks.com/efi-bootloaders/installation.html
[41]:http://www.rodsbooks.com/refind/getting.html
[42]:https://help.ubuntu.com/community/Boot-Repair
[43]:http://www.rodsbooks.com/refind/getting.html
[44]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html#disable
[45]:http://www.rodsbooks.com/refind/getting.html
[46]:http://www.rodsbooks.com/efi-bootloaders/
[47]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html
[48]:mailto:rodsmith@rodsbooks.com
[49]:http://ss64.com/osx/bless.html
[50]:http://www.rodsbooks.com/refind/getting.html
[51]:http://www.rodsbooks.com/linux-uefi/#oops
[52]:http://www.rodsbooks.com/linux-uefi/#oops
[53]:http://www.rodsbooks.com/efi-bootloaders/
[54]:http://www.rodsbooks.com/refind/
[55]:http://www.rodsbooks.com/efi-bootloaders/grub2.html
[56]:http://www.rodsbooks.com/efi-bootloaders
[57]:http://www.rodsbooks.com/refind/
[58]:http://sourceforge.net/projects/bootinfoscript/
[59]:http://pastebin.com/
[60]:http://www.rodsbooks.com/linux-uefi/#troubleshooting
[61]:http://www.rodsbooks.com/linux-uefi/#troubleshooting
