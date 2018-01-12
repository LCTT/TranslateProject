How to install/update Intel microcode firmware on Linux
======


I am a new Linux sysadmin. How do I install or update microcode firmware for Intel/AMD CPUs on Linux using the command line option?


A microcode is nothing but CPU firmware provided by Intel or AMD. The Linux kernel can update the CPU's firmware without the BIOS update at boot time. Processor microcode is stored in RAM and kernel update the microcode during every boot. These microcode updates from Intel/AMD needed to fix bugs or apply errata to avoid CPU bugs. This page shows how to install AMD or Intel microcode update using package manager or processor microcode updates supplied by Intel on Linux.

## How to find out current status of microcode


Run the following command as root user:
`# dmesg | grep microcode`
Sample outputs:

[![Verify microcode update on a CentOS RHEL Fedora Ubuntu Debian Linux][1]][1]

Please note that it is entirely possible that there is no microcode update available for your CPU. In that case it will look as follows:
```
[ 0.952699] microcode: sig=0x306a9, pf=0x10, revision=0x1c
[ 0.952773] microcode: Microcode Update Driver: v2.2.

```

## How to install Intel microcode firmware on Linux using a package manager

Tool to transform and deploy CPU microcode update for x86/amd64 comes with Linux. The procedure to install AMD or Intel microcode firmware on Linux is as follows:

  1. Open the terminal app
  2. Debian/Ubuntu Linux user type: **sudo apt install intel-microcode**
  3. CentOS/RHEL Linux user type: **sudo yum install microcode_ctl**



The package names are as follows for popular Linux distros:

  * microcode_ctl and linux-firmware - CentOS/RHEL microcode update package
  * intel-microcode - Debian/Ubuntu and clones microcode update package for Intel CPUS
  * amd64-microcode - Debian/Ubuntu and clones microcode firmware for AMD CPUs
  * linux-firmware - Arch Linux microcode firmware for AMD CPUs (installed by default and no action is needed on your part)
  * intel-ucode - Arch Linux microcode firmware for Intel CPUs
  * microcode_ctl and ucode-intel - Suse/OpenSUSE Linux microcode update package



**Warning** : In some cases, microcode update may cause boot issues such as server getting hang or resets automatically at the time of boot. The procedure worked for me, and I am an experienced sysadmin. I do not take responsibility for any hardware failures. Do it at your own risk.

### Examples

Type the following [apt command][2]/[apt-get command][3] on a Debian/Ubuntu Linux for Intel CPU:

`$ sudo apt-get install intel-microcode`

Sample outputs:

[![How to install Intel microcode firmware Linux][4]][4]

You [must reboot the box to activate micocode][5] update:

`$ sudo reboot`

Verify it after reboot:

`# dmesg | grep 'microcode'`

Sample outputs:

```
[ 0.000000] microcode: microcode updated early to revision 0x1c, date = 2015-02-26
[ 1.604672] microcode: sig=0x306a9, pf=0x10, revision=0x1c
[ 1.604976] microcode: Microcode Update Driver: v2.01 <tigran@aivazian.fsnet.co.uk>, Peter Oruba

```

If you are using RHEL/CentOS try installing or updating the following two packages using [yum command][6]:

```
$ sudo yum install linux-firmware microcode_ctl
$ sudo reboot
$ sudo dmesg | grep 'microcode'
```

## How to update/install microcode downloaded from Intel site

Only use the following method when recommended by your vendor otherwise stick to Linux packages as described above. Most Linux distro maintainer update microcode via the package manager. Package manager method is safe as tested by many users.

### How to install Intel processor microcode blob for Linux (20180108 release)

Ok, first visit AMD or [Intel site][7] to grab the latest microcode firmware. In this example, I have a file named ~/Downloads/microcode-20180108.tgz (don't forget to check for checksum) that suppose to help with meltdown/Spectre. First extract it using the tar command:
```
$ mkdir firmware
$ cd firmware
$ tar xvf ~/Downloads/microcode-20180108.tgz
$ ls -l
```

Sample outputs:

```
drwxr-xr-x 2 vivek vivek 4096 Jan 8 12:41 intel-ucode
-rw-r--r-- 1 vivek vivek 4847056 Jan 8 12:39 microcode.dat
-rw-r--r-- 1 vivek vivek 1907 Jan 9 07:03 releasenote

```

Make sure /sys/devices/system/cpu/microcode/reload exits:

`$ ls -l /sys/devices/system/cpu/microcode/reload`

You must copy all files from intel-ucode to /lib/firmware/intel-ucode/ using the [cp command][8]:

`$ sudo cp -v intel-ucode/* /lib/firmware/intel-ucode/`

You just copied intel-ucode directory to /lib/firmware/. Write the reload interface to 1 to reload the microcode files:

`# echo 1 > /sys/devices/system/cpu/microcode/reload`

Update an existing initramfs so that next time it get loaded via kernel:

```
$ sudo update-initramfs -u
$ sudo reboot
```
Verifying that microcode got updated on boot or reloaded by echo command:
`# dmesg | grep microcode`

That is all. You have just updated firmware for your Intel CPU.

## about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][9], [Facebook][10], [Google+][11].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/install-update-intel-microcode-firmware-linux/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2018/01/Verify-microcode-update-on-a-CentOS-RHEL-Fedora-Ubuntu-Debian-Linux.jpg
[2]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[3]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[4]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-install-Intel-microcode-firmware-Linux.jpg
[5]:https://www.cyberciti.biz/faq/howto-reboot-linux/
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[7]:https://downloadcenter.intel.com/download/27431/Linux-Processor-Microcode-Data-File
[8]:https://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/ (See Linux/Unix cp command examples for more info)
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
