# Recover from a badly corrupt Linux EFI installation

In the past decade or so, Linux distributions would occasionally fail before, during and after the installation, but I was always able to somehow recover the system and continue working normally. Well, [Solus][1]broke my laptop. Literally.

GRUB rescue. No luck. Reinstall. No luck still! Ubuntu refused to install, complaining about the target device not being this or that. Wow. Something like this has never happened to me before. Effectively my test machine had become a useless brick. Should we despair? No, absolutely not. Let me show you how you can fix it.

### Problem in more detail

It all started with Solus trying to install its own bootloader - goofiboot. No idea what, who or why, but it failed to complete successfully, and I was left with a system that would not boot. After BIOS, I would get a GRUB rescue shell.

 ![Installation failed](http://www.dedoimedo.com/images/computers-years/2016-2/solus-installation-failed.png) 

I tried manually working in the rescue shell, using this and that command, very similar to what I have outlined in my extensive [GRUB2 tutorial][2]. This did not really work. My next attempt was to recover from a live CD, again following my own advice, as I have outlined in my [GRUB2 & EFI tutorial][3]. I set up a new entry, and made sure to mark it active with the efibootmgr utility. Just as we did in the guide, and this has served us well before. Alas, this recovery method did not work, either.

I tried to perform a complete Ubuntu installation, into the same partition used by Solus, expecting the installer to sort out some of the fine details. But Ubuntu was not able to finish the install. It complained about: failed to install into /target. This was a first. What now?

### Manually clean up EFI partition

Obviously, something is very wrong with our EFI partition. Just to briefly recap, if you are using UEFI, then you must have a separate FAT32-formatted partition. This partition is used to store EFI boot images. For instance, when you install Fedora, the Fedora boot image will be copied into the EFI subdirectory. Every operating system is stored into a folder of its own, e.g. /boot/efi/EFI/<os version>/.

 ![EFI partition contents](http://www.dedoimedo.com/images/computers-years/2016-2/grub2-efi-partition-contents.png) 

On my [G50][4] machine, there were multiple entries, from a variety of my distro tests, including: centos, debian, fedora, mx-15, suse, ubuntu, zorin, and many others. There was also a goofiboot folder. However, the efibootmgr was not showing a goofiboot entry in its menu. There was obviously something wrong with the whole thing.

```
sudo efibootmgr -d /dev/sda
BootCurrent: 0001
Timeout: 0 seconds
BootOrder: 0001,0005,2003,0000,2001,2002
Boot0000* Lenovo Recovery System
Boot0001* ubuntu
Boot0003* EFI Network 0 for IPv4 (68-F7-28-4D-D1-A1)
Boot0004* EFI Network 0 for IPv6 (68-F7-28-4D-D1-A1)
Boot0005* Windows Boot Manager
Boot0006* fedora
Boot0007* suse
Boot0008* debian
Boot0009* mx-15
Boot2001* EFI USB Device
Boot2002* EFI DVD/CDROM
Boot2003* EFI Network
...
```

P.S. The output above was generated running the command in a LIVE session!

I decided to clean up all the non-default and non-Microsoft entries and start fresh. Obviously, something was corrupt, and preventing new distros from setting up their own bootloader. So I deleted all the folders in the /boot/efi/EFI partition except Boot and Windows. And then, I also updated the boot manager by removing all the extras.

```
efibootmgr -b <hex> -B <hex>
```

Lastly, I reinstalled Ubuntu and closely monitored the progress with the GRUB installation and setup. This time, things completed fine. There were some errors with several invalid entries, as can be expected, but the whole sequenced completed just fine.

 ![Install errors](http://www.dedoimedo.com/images/computers-years/2016-2/grub2-install-errors.jpg) 

 ![Install successful](http://www.dedoimedo.com/images/computers-years/2016-2/grub2-install-successful.jpg) 

### More reading

If you don't fancy this manual fix, you may want to read:

```
[Boot-Info][5] page, with automated tools to help you recover your system

[Boot-repair-cd][6] automatic repair tool download page
```

### Conclusion

If you ever encounter a situation where your system is badly botched due to an EFI partition clobbering, then you may want to follow the advice in this guide. Delete all non-default entries. Make sure you do not touch anything Microsoft, if you're multi-booting with Windows. Then update the boot menu accordingly so the baddies are removed. Rerun the installation setup for your desired distro, or try to fix with a less stringent method as explained before.

I hope this little article saves you some bacon. I was quite annoyed by what Solus did to my system. This is not something that should happen, and the recovery ought to be simpler. However, while things may seem dreadful, the fix is not difficult. You just need to delete the corrupt files and start again. Your data should not be affected, and you will be able to promptly boot into a running system and continue working. There you go.

Cheers.

--------------------------------------------------------------------------------


作者简介：

My name is Igor Ljubuncic. I'm more or less 38 of age, married with no known offspring. I am currently working as a Principal Engineer with a cloud technology company, a bold new frontier. Until roughly early 2015, I worked as the OS Architect with an engineering computing team in one of the largest IT companies in the world, developing new Linux-based solutions, optimizing the kernel and hacking the living daylights out of Linux. Before that, I was a tech lead of a team designing new, innovative solutions for high-performance computing environments. Some other fancy titles include Systems Expert and System Programmer and such. All of this used to be my hobby, but since 2008, it's a paying job. What can be more satisfying than that?

From 2004 until 2008, I used to earn my bread by working as a physicist in the medical imaging industry. My work expertise focused on problem solving and algorithm development. To this end, I used Matlab extensively, mainly for signal and image processing. Furthermore, I'm certified in several major engineering methodologies, including MEDIC Six Sigma Green Belt, Design of Experiment, and Statistical Engineering.

I also happen to write books, including high fantasy and technical work on Linux; mutually inclusive.

Please see my full list of open-source projects, publications and patents, just scroll down.

For a complete list of my awards, nominations and IT-related certifications, hop yonder and yonder please.


-------------


via: http://www.dedoimedo.com/computers/grub2-efi-corrupt-part-recovery.html

作者：[Igor Ljubuncic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html

[1]:http://www.dedoimedo.com/computers/solus-1-2-review.html
[2]:http://www.dedoimedo.com/computers/grub-2.html
[3]:http://www.dedoimedo.com/computers/grub2-efi-recovery.html
[4]:http://www.dedoimedo.com/computers/lenovo-g50-distros-second-round.html
[5]:https://help.ubuntu.com/community/Boot-Info
[6]:https://sourceforge.net/projects/boot-repair-cd/
