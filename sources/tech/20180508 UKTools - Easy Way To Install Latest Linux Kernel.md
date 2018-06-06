UKTools - Easy Way To Install Latest Linux Kernel
======
There are multiple utilities is available for Ubuntu to upgrade Linux kernel to latest stable version. We had already wrote about those utility in the past such as Linux Kernel Utilities (LKU), Ubuntu Kernel Upgrade Utility (UKUU) and Ubunsys.

Also few utilities are available and we will be planning to include in the further article like, ubuntu-mainline-kernel.sh and manual method from mainline kernel.

Today also we are going to teach you the similar utility called UKTools. You can try any one of these utilities to get your Linux kernels to the latest releases.

Latest kernel release comes with security bug fixes and some improvements so, better to keep latest one to get reliable, secure and better hardware performance.

Some times the latest kernel version might be buggy and can crash your system so, it’s your own risk. I would like to advise you to not to install on production environment.

**Suggested Read :**
**(#)** [Linux Kernel Utilities (LKU) – A Set Of Shell Scripts To Compile, Install & Update Latest Kernel In Ubuntu/LinuxMint][1]
**(#)** [Ukuu – An Easy Way To Install/Upgrade Linux Kernel In Ubuntu based Systems][2]
**(#)** [6 Methods To Check The Running Linux Kernel Version On System][3]

### What Is UKTools

[UKTools][4] stands for Ubuntu Kernel Tools, that contains two shell scripts `ukupgrade` and `ukpurge`.

ukupgrade stands for “Ubuntu Kernel Upgrade”, which allows user to upgrade Linux kernel to latest stable version for Ubuntu/Mint and derivatives based on [kernel.ubuntu.com][5].

ukpurge stands for “Ubuntu Kernel Purge”, which allows user to remove old Linux kernel images/headers in machine for Ubuntu/ Mint and derivatives. It will keep only three kernel versions.

There is no GUI for this utility, however it looks very simple and straight forward so, newbie can perform the upgrade without any issues.

I’m running Ubuntu 17.10 and the current kernel version is below.
```
$ uname -a
Linux ubuntu 4.13.0-39-generic #44-Ubuntu SMP Thu Apr 5 14:25:01 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

```

Run the following command to get the list of installed kernel on your system (Ubuntu and derivatives). Currently i’m holding `seven` kernels.
```
$ dpkg --list | grep linux-image
ii linux-image-4.13.0-16-generic 4.13.0-16.19 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-17-generic 4.13.0-17.20 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-32-generic 4.13.0-32.35 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-36-generic 4.13.0-36.40 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-37-generic 4.13.0-37.42 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-38-generic 4.13.0-38.43 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-39-generic 4.13.0-39.44 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-16-generic 4.13.0-16.19 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-17-generic 4.13.0-17.20 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-32-generic 4.13.0-32.35 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-36-generic 4.13.0-36.40 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-37-generic 4.13.0-37.42 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-38-generic 4.13.0-38.43 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-39-generic 4.13.0-39.44 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-generic 4.13.0.39.42 amd64 Generic Linux kernel image

```

### How To Install UKTools

Just run the below commands to install UKTools on Ubuntu and derivatives.

Run the below command to clone UKTools repository on your system.
```
$ git clone https://github.com/usbkey9/uktools

```

Navigate to uktools directory.
```
$ cd uktools

```

Run the Makefile to generate the necessary files. Also this will automatically install latest available kernel. Just reboot the system in order to use the latest kernel.
```
$ sudo make
[sudo] password for daygeek:
Creating the directories if neccessary
Linking profile.d file for reboot message
Linking files to global sbin directory
Ubuntu Kernel Upgrade - by Mustafa Hasturk
------------------------------------------
This script is based on the work of Mustafa Hasturk and was reworked by
Caio Oliveira and modified and fixed by Christoph Kepler

Current Development and Maintenance by Christoph Kepler

Do you want the Stable Release (if not sure, press y)? (y/n): y
Do you want the Generic kernel? (y/n): y
Do you want to autoremove old kernel? (y/n): y
no crontab for root
Do you want to update the kernel automatically? (y/n): y
Setup complete. Update the kernel right now? (y/n): y
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
 linux-headers-4.13.0-16 linux-headers-4.13.0-16-generic linux-headers-4.13.0-17 linux-headers-4.13.0-17-generic linux-headers-4.13.0-32 linux-headers-4.13.0-32-generic linux-headers-4.13.0-36
 linux-headers-4.13.0-36-generic linux-headers-4.13.0-37 linux-headers-4.13.0-37-generic linux-image-4.13.0-16-generic linux-image-4.13.0-17-generic linux-image-4.13.0-32-generic linux-image-4.13.0-36-generic
 linux-image-4.13.0-37-generic linux-image-extra-4.13.0-16-generic linux-image-extra-4.13.0-17-generic linux-image-extra-4.13.0-32-generic linux-image-extra-4.13.0-36-generic
 linux-image-extra-4.13.0-37-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
 lynx-common
The following NEW packages will be installed:
 lynx lynx-common
0 upgraded, 2 newly installed, 0 to remove and 71 not upgraded.
Need to get 1,498 kB of archives.
After this operation, 5,418 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 lynx-common all 2.8.9dev16-1 [873 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 lynx amd64 2.8.9dev16-1 [625 kB]
Fetched 1,498 kB in 12s (120 kB/s)
Selecting previously unselected package lynx-common.
(Reading database ... 441037 files and directories currently installed.)
Preparing to unpack .../lynx-common_2.8.9dev16-1_all.deb ...
Unpacking lynx-common (2.8.9dev16-1) ...
Selecting previously unselected package lynx.
Preparing to unpack .../lynx_2.8.9dev16-1_amd64.deb ...
Unpacking lynx (2.8.9dev16-1) ...
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Processing triggers for man-db (2.7.6.1-2) ...
Setting up lynx-common (2.8.9dev16-1) ...
Setting up lynx (2.8.9dev16-1) ...
update-alternatives: using /usr/bin/lynx to provide /usr/bin/www-browser (www-browser) in auto mode

Cleaning old downloads in /tmp

Downloading the kernel's components...
Checksum for linux-headers-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb succeed
Checksum for linux-image-unsigned-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb succeed
Checksum for linux-modules-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb succeed

Downloading the shared kernel header...
Checksum for linux-headers-4.16.7-041607_4.16.7-041607.201805021131_all.deb succeed

Installing Kernel and Headers...
Selecting previously unselected package linux-headers-4.16.7-041607.
(Reading database ... 441141 files and directories currently installed.)
Preparing to unpack .../linux-headers-4.16.7-041607_4.16.7-041607.201805021131_all.deb ...
Unpacking linux-headers-4.16.7-041607 (4.16.7-041607.201805021131) ...
Selecting previously unselected package linux-headers-4.16.7-041607-generic.
Preparing to unpack .../linux-headers-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb ...
Unpacking linux-headers-4.16.7-041607-generic (4.16.7-041607.201805021131) ...
Selecting previously unselected package linux-image-unsigned-4.16.7-041607-generic.
Preparing to unpack .../linux-image-unsigned-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb ...
Unpacking linux-image-unsigned-4.16.7-041607-generic (4.16.7-041607.201805021131) ...
Selecting previously unselected package linux-modules-4.16.7-041607-generic.
Preparing to unpack .../linux-modules-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb ...
Unpacking linux-modules-4.16.7-041607-generic (4.16.7-041607.201805021131) ...
Setting up linux-headers-4.16.7-041607 (4.16.7-041607.201805021131) ...
dpkg: dependency problems prevent configuration of linux-headers-4.16.7-041607-generic:
 linux-headers-4.16.7-041607-generic depends on libssl1.1 (>= 1.1.0); however:
 Package libssl1.1 is not installed.

Setting up linux-modules-4.16.7-041607-generic (4.16.7-041607.201805021131) ...
Setting up linux-image-unsigned-4.16.7-041607-generic (4.16.7-041607.201805021131) ...
I: /vmlinuz.old is now a symlink to boot/vmlinuz-4.13.0-39-generic
I: /initrd.img.old is now a symlink to boot/initrd.img-4.13.0-39-generic
I: /vmlinuz is now a symlink to boot/vmlinuz-4.16.7-041607-generic
I: /initrd.img is now a symlink to boot/initrd.img-4.16.7-041607-generic
Processing triggers for linux-image-unsigned-4.16.7-041607-generic (4.16.7-041607.201805021131) ...
/etc/kernel/postinst.d/initramfs-tools:
update-initramfs: Generating /boot/initrd.img-4.16.7-041607-generic
/etc/kernel/postinst.d/zz-update-grub:
Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.16.7-041607-generic
Found initrd image: /boot/initrd.img-4.16.7-041607-generic
Found linux image: /boot/vmlinuz-4.13.0-39-generic
Found initrd image: /boot/initrd.img-4.13.0-39-generic
Found linux image: /boot/vmlinuz-4.13.0-38-generic
Found initrd image: /boot/initrd.img-4.13.0-38-generic
Found linux image: /boot/vmlinuz-4.13.0-37-generic
Found initrd image: /boot/initrd.img-4.13.0-37-generic
Found linux image: /boot/vmlinuz-4.13.0-36-generic
Found initrd image: /boot/initrd.img-4.13.0-36-generic
Found linux image: /boot/vmlinuz-4.13.0-32-generic
Found initrd image: /boot/initrd.img-4.13.0-32-generic
Found linux image: /boot/vmlinuz-4.13.0-17-generic
Found initrd image: /boot/initrd.img-4.13.0-17-generic
Found linux image: /boot/vmlinuz-4.13.0-16-generic
Found initrd image: /boot/initrd.img-4.13.0-16-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done

Thanks for using this script! Hope it helped.
Give it a star: https://github.com/MarauderXtreme/uktools

```

Restart the system to activate the latest kernel.
```
$ sudo shutdown -r now

```

Once the system back to up, re-check the kernel version.
```
$ uname -a
Linux ubuntu 4.16.7-041607-generic #201805021131 SMP Wed May 2 15:34:55 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

```

This make command will drop the below files into `/usr/local/bin` directory.
```
do-kernel-upgrade
do-kernel-purge

```

To remove old kernels, run the following command.
```
$ do-kernel-purge

Ubuntu Kernel Purge - by Caio Oliveira

This script will only keep three versions: the first and the last two, others will be purge

---Current version:
Linux Kernel 4.16.7-041607 Generic (linux-image-4.16.7-041607-generic)

---Versions to remove:
4.13.0-16
4.13.0-17
4.13.0-32
4.13.0-36
4.13.0-37

---Do you want to remove the old kernels/headers versions? (Y/n): y
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
 linux-headers-4.13.0-17 linux-headers-4.13.0-17-generic linux-headers-4.13.0-32 linux-headers-4.13.0-32-generic linux-headers-4.13.0-36 linux-headers-4.13.0-36-generic linux-headers-4.13.0-37
 linux-headers-4.13.0-37-generic linux-image-4.13.0-17-generic linux-image-4.13.0-32-generic linux-image-4.13.0-36-generic linux-image-4.13.0-37-generic linux-image-extra-4.13.0-17-generic
 linux-image-extra-4.13.0-32-generic linux-image-extra-4.13.0-36-generic linux-image-extra-4.13.0-37-generic
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
 linux-headers-4.13.0-16* linux-headers-4.13.0-16-generic* linux-image-4.13.0-16-generic* linux-image-extra-4.13.0-16-generic*
0 upgraded, 0 newly installed, 4 to remove and 71 not upgraded.
After this operation, 318 MB disk space will be freed.
(Reading database ... 465582 files and directories currently installed.)
Removing linux-headers-4.13.0-16-generic (4.13.0-16.19) ...
Removing linux-headers-4.13.0-16 (4.13.0-16.19) ...
Removing linux-image-extra-4.13.0-16-generic (4.13.0-16.19) ...
run-parts: executing /etc/kernel/postinst.d/apt-auto-removal 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
run-parts: executing /etc/kernel/postinst.d/initramfs-tools 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
update-initramfs: Generating /boot/initrd.img-4.13.0-16-generic
run-parts: executing /etc/kernel/postinst.d/unattended-upgrades 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
run-parts: executing /etc/kernel/postinst.d/update-notifier 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
run-parts: executing /etc/kernel/postinst.d/zz-update-grub 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.16.7-041607-generic
Found initrd image: /boot/initrd.img-4.16.7-041607-generic
Found linux image: /boot/vmlinuz-4.13.0-39-generic
Found initrd image: /boot/initrd.img-4.13.0-39-generic
Found linux image: /boot/vmlinuz-4.13.0-38-generic
Found initrd image: /boot/initrd.img-4.13.0-38-generic
Found linux image: /boot/vmlinuz-4.13.0-37-generic
Found initrd image: /boot/initrd.img-4.13.0-37-generic
Found linux image: /boot/vmlinuz-4.13.0-36-generic
Found initrd image: /boot/initrd.img-4.13.0-36-generic
Found linux image: /boot/vmlinuz-4.13.0-32-generic
Found initrd image: /boot/initrd.img-4.13.0-32-generic
Found linux image: /boot/vmlinuz-4.13.0-17-generic
Found initrd image: /boot/initrd.img-4.13.0-17-generic
Found linux image: /boot/vmlinuz-4.13.0-16-generic
Found initrd image: /boot/initrd.img-4.13.0-16-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
Removing linux-image-4.13.0-16-generic (4.13.0-16.19) ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
update-initramfs: Deleting /boot/initrd.img-4.13.0-16-generic
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.16.7-041607-generic
Found initrd image: /boot/initrd.img-4.16.7-041607-generic
Found linux image: /boot/vmlinuz-4.13.0-39-generic
Found initrd image: /boot/initrd.img-4.13.0-39-generic
Found linux image: /boot/vmlinuz-4.13.0-38-generic
Found initrd image: /boot/initrd.img-4.13.0-38-generic
Found linux image: /boot/vmlinuz-4.13.0-37-generic
Found initrd image: /boot/initrd.img-4.13.0-37-generic
Found linux image: /boot/vmlinuz-4.13.0-36-generic
Found initrd image: /boot/initrd.img-4.13.0-36-generic
Found linux image: /boot/vmlinuz-4.13.0-32-generic
Found initrd image: /boot/initrd.img-4.13.0-32-generic
Found linux image: /boot/vmlinuz-4.13.0-17-generic
Found initrd image: /boot/initrd.img-4.13.0-17-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
(Reading database ... 430635 files and directories currently installed.)
Purging configuration files for linux-image-extra-4.13.0-16-generic (4.13.0-16.19) ...
Purging configuration files for linux-image-4.13.0-16-generic (4.13.0-16.19) ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 4.13.0-16-generic /boot/vmlinuz-4.13.0-16-generic
Reading package lists... Done
Building dependency tree
Reading state information... Done
.
.
.
.
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
 linux-headers-4.13.0-37* linux-headers-4.13.0-37-generic* linux-image-4.13.0-37-generic* linux-image-extra-4.13.0-37-generic*
0 upgraded, 0 newly installed, 4 to remove and 71 not upgraded.
After this operation, 321 MB disk space will be freed.
(Reading database ... 325772 files and directories currently installed.)
Removing linux-headers-4.13.0-37-generic (4.13.0-37.42) ...
Removing linux-headers-4.13.0-37 (4.13.0-37.42) ...
Removing linux-image-extra-4.13.0-37-generic (4.13.0-37.42) ...
run-parts: executing /etc/kernel/postinst.d/apt-auto-removal 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
run-parts: executing /etc/kernel/postinst.d/initramfs-tools 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
update-initramfs: Generating /boot/initrd.img-4.13.0-37-generic
run-parts: executing /etc/kernel/postinst.d/unattended-upgrades 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
run-parts: executing /etc/kernel/postinst.d/update-notifier 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
run-parts: executing /etc/kernel/postinst.d/zz-update-grub 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.16.7-041607-generic
Found initrd image: /boot/initrd.img-4.16.7-041607-generic
Found linux image: /boot/vmlinuz-4.13.0-39-generic
Found initrd image: /boot/initrd.img-4.13.0-39-generic
Found linux image: /boot/vmlinuz-4.13.0-38-generic
Found initrd image: /boot/initrd.img-4.13.0-38-generic
Found linux image: /boot/vmlinuz-4.13.0-37-generic
Found initrd image: /boot/initrd.img-4.13.0-37-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
Removing linux-image-4.13.0-37-generic (4.13.0-37.42) ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
update-initramfs: Deleting /boot/initrd.img-4.13.0-37-generic
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
Generating grub configuration file ...
Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported.
Found linux image: /boot/vmlinuz-4.16.7-041607-generic
Found initrd image: /boot/initrd.img-4.16.7-041607-generic
Found linux image: /boot/vmlinuz-4.13.0-39-generic
Found initrd image: /boot/initrd.img-4.13.0-39-generic
Found linux image: /boot/vmlinuz-4.13.0-38-generic
Found initrd image: /boot/initrd.img-4.13.0-38-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
(Reading database ... 290810 files and directories currently installed.)
Purging configuration files for linux-image-extra-4.13.0-37-generic (4.13.0-37.42) ...
Purging configuration files for linux-image-4.13.0-37-generic (4.13.0-37.42) ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 4.13.0-37-generic /boot/vmlinuz-4.13.0-37-generic

Thanks for using this script!!!

```

Re-check the list of installed kernels using the below command. This will keep only old three kernels.
```
$ dpkg --list | grep linux-image
ii linux-image-4.13.0-38-generic 4.13.0-38.43 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-4.13.0-39-generic 4.13.0-39.44 amd64 Linux kernel image for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-38-generic 4.13.0-38.43 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-extra-4.13.0-39-generic 4.13.0-39.44 amd64 Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii linux-image-generic 4.13.0.39.42 amd64 Generic Linux kernel image
ii linux-image-unsigned-4.16.7-041607-generic 4.16.7-041607.201805021131 amd64 Linux kernel image for version 4.16.7 on 64 bit x86 SMP

```

For next time you can call `do-kernel-upgrade` utility for new kernel installation. If any new kernel is available then it will install. If no, it will report no kernel update is available at the moment.
```
$ do-kernel-upgrade
Kernel up to date. Finishing

```

Run the `do-kernel-purge` command once again to confirm on this. If this found more than three kernels then it will remove. If no, it will report nothing to remove message.
```
$ do-kernel-purge

Ubuntu Kernel Purge - by Caio Oliveira

This script will only keep three versions: the first and the last two, others will be purge

---Current version:
Linux Kernel 4.16.7-041607 Generic (linux-image-4.16.7-041607-generic)
Nothing to remove!

Thanks for using this script!!!

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/uktools-easy-way-to-install-latest-stable-linux-kernel-on-ubuntu-mint-and-derivatives/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/lku-linux-kernel-utilities-compile-install-update-latest-kernel-in-linux-mint-ubuntu/
[2]:https://www.2daygeek.com/ukuu-install-upgrade-linux-kernel-in-linux-mint-ubuntu-debian-elementary-os/
[3]:https://www.2daygeek.com/check-find-determine-running-installed-linux-kernel-version/
[4]:https://github.com/usbkey9/uktools
[5]:http://kernel.ubuntu.com/~kernel-ppa/mainline/
