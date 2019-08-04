[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dual booting Windows and Linux using UEFI)
[#]: via: (https://opensource.com/article/19/5/dual-booting-windows-linux-uefi)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss/users/ckrzen)

Dual booting Windows and Linux using UEFI
======
A quick rundown of setting up Linux and Windows to dual boot on the same
machine, using the Unified Extensible Firmware Interface (UEFI).
![Linux keys on the keyboard for a desktop computer][1]

Rather than doing a step-by-step how-to guide to configuring your system to dual boot, I’ll highlight the important points. As an example, I will refer to my new laptop that I purchased a few months ago. I first installed [Ubuntu Linux][2] onto the entire hard drive, which destroyed the pre-installed [Windows 10][3] installation. After a few months, I decided to install a different Linux distribution, and so also decided to re-install Windows 10 alongside [Fedora Linux][4] in a dual boot configuration. I’ll highlight some essential facts to get started.

### Firmware

Dual booting is not just a matter of software. Or, it is, but it involves changing your firmware, which among other things tells your machine how to begin the boot process. Here are some firmware-related issues to keep in mind.

#### UEFI vs. BIOS

Before attempting to install, make sure your firmware configuration is optimal. Most computers sold today have a new type of firmware known as [Unified Extensible Firmware Interface (UEFI)][5], which has pretty much replaced the other firmware known as [Basic Input Output System (BIOS)][6], which is often included through the mode many providers call Legacy Boot.

I had no need for BIOS, so I chose UEFI mode.

#### Secure Boot

One other important setting is Secure Boot. This feature detects whether the boot path has been tampered with, and stops unapproved operating systems from booting. For now, I disabled this option to ensure that I could install Fedora Linux. According to the Fedora Project Wiki [Features/Secure Boot ][7] Fedora Linux will work with it enabled. This may be different for other Linux distributions —I plan to revisit this setting in the future.

In short, if you find that you cannot install your Linux OS with this setting active, disable Secure Boot and try again.

### Partitioning the boot drive

If you choose to dual boot and have both operating systems on the same drive, you have to break it into partitions. Even if you dual boot using two different drives, most Linux installations are best broken into a few basic partitions for a variety of reasons. Here are some options to consider.

#### GPT vs MBR

If you decide to manually partition your boot drive in advance, I recommend using the [GUID Partition Table (GPT)][8] rather than the older [Master Boot Record (MBR)][9]. Among the reasons for this change, there are two specific limitations of MBR that GPT doesn’t have:

  * MBR can hold up to 15 partitions, while GPT can hold up to 128.
  * MBR only supports up to 2 terabytes, while GPT uses 64-bit addresses which allows it to support disks up to 8 million terabytes.



If you have shopped for hard drives recently, then you know that many of today’s drives exceed the 2 terabyte limit.

#### The EFI system partition

If you are doing a fresh installation or using a new drive, there are probably no partitions to begin with. In this case, the OS installer will create the first one, which is the [EFI System Partition (ESP)][10]. If you choose to manually partition your drive using a tool such as [gdisk][11], you will need to create this partition with several parameters. Based on the existing ESP, I set the size to around 500MB and assigned it the ef00 (EFI System) partition type. The UEFI specification requires the format to be FAT32/msdos, most likely because it is supportable by a wide range of operating systems.

![Partitions][12]

### Operating System Installation

Once you accomplish the first two tasks, you can install your operating systems. While I focus on Windows 10 and Fedora Linux here, the process is fairly similar when installing other combinations as well.

#### Windows 10

I started the Windows 10 installation and created a 20 Gigabyte Windows partition. Since I had previously installed Linux on my laptop, the drive had an ESP, which I chose to keep. I deleted all existing Linux and swap partitions to start fresh, and then started my Windows installation. The Windows installer automatically created another small partition—16 Megabytes—called the [Microsoft Reserved Partition (MSR)][13]. Roughly 400 Gigabytes of unallocated space remained on the 512GB boot drive once this was finished.

I then proceeded with and completed the Windows 10 installation process. I then rebooted into Windows to make sure it was working, created my user account, set up wi-fi, and completed other tasks that need to be done on a first-time OS installation.

#### Fedora Linux

I next moved to install Linux. I started the process, and when it reached the disk configuration steps, I made sure not to change the Windows NTFS and MSR partitions. I also did not change the EPS, but I did set its mount point to **/boot/efi**. I then created the usual ext4 formatted partitions, **/** (root), **/boot** , and **/home**. The last partition I created was Linux **swap**.

As with Windows, I continued and completed the Linux installation, and then rebooted. To my delight, at boot time the [GRand][14] [Unified Boot Loader (GRUB)][14] menu provided the choice to select either Windows or Linux, which meant I did not have to do any additional configuration. I selected Linux and completed the usual steps such as creating my user account.

### Conclusion

Overall, the process was painless. In past years, there has been some difficulty navigating the changes from UEFI to BIOS, plus the introduction of features such as Secure Boot. I believe that we have now made it past these hurdles and can reliably set up multi-boot systems.

I don’t miss the [Linux LOader (LILO)][15] anymore!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/dual-booting-windows-linux-uefi

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss/users/ckrzen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://www.ubuntu.com
[3]: https://www.microsoft.com/en-us/windows
[4]: https://getfedora.org
[5]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[6]: https://en.wikipedia.org/wiki/BIOS
[7]: https://fedoraproject.org/wiki/Features/SecureBoot
[8]: https://en.wikipedia.org/wiki/GUID_Partition_Table
[9]: https://en.wikipedia.org/wiki/Master_boot_record
[10]: https://en.wikipedia.org/wiki/EFI_system_partition
[11]: https://sourceforge.net/projects/gptfdisk/
[12]: /sites/default/files/u216961/gdisk_screenshot_s.png
[13]: https://en.wikipedia.org/wiki/Microsoft_Reserved_Partition
[14]: https://en.wikipedia.org/wiki/GNU_GRUB
[15]: https://en.wikipedia.org/wiki/LILO_(boot_loader)
