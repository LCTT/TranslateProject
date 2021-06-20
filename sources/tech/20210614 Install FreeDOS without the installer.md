[#]: subject: (Install FreeDOS without the installer)
[#]: via: (https://opensource.com/article/21/6/install-freedos-without-installer)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Install FreeDOS without the installer
======
Here's how to set up your FreeDOS system manually without using the
installer.
![FreeDOS fish logo and command prompt on computer][1]

Most people should be able to install FreeDOS 1.3 RC4 very easily using the installer. The FreeDOS installer asks a few questions, then takes care of the rest—including making space for FreeDOS and making the system bootable.

But what if the installer doesn't work for you? Or what if you prefer to set up your FreeDOS system _manually_, without using the installer? With FreeDOS, you can do that too! Let's walk through the steps to install FreeDOS without using the installer. I'll do all of these steps using the QEMU virtual machine, using a blank hard drive image. I created a one hundred megabyte ("100M") hard drive image with this Linux command:


```
`$ qemu-img create freedos.img 100M`
```

I downloaded the FreeDOS 1.3 RC4 installation LiveCD as FD13LIVE.iso, which provides a "live" environment where I can run FreeDOS, including all the standard tools. Most users also use the LiveCD to install FreeDOS with the regular installer, but here I'll only use the LiveCD to install FreeDOS using individual commands from the command line.

I started the virtual machine with this rather long QEMU command, and selected the "Use FreeDOS 1.3 in Live Environment mode" boot menu entry:


```
`$ qemu-system-x86_64 -name FreeDOS -machine pc-i440fx-4.2,accel=kvm,usb=off,dump-guest-core=off -enable-kvm -cpu host -m 8 -overcommit mem-lock=off -no-user-config -nodefaults -rtc base=utc,driftfix=slew -no-hpet -boot menu=on,strict=on -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on -hda freedos.img -cdrom FD13LIVE.iso -device sb16 -device adlib -soundhw pcspk -vga cirrus -display sdl -usbdevice mouse`
```

![manual install][2]

Select "Use FreeDOS 1.3 in Live Environment mode" to boot the LiveCD
(Jim Hall, [CC-BY SA 4.0][3])

That QEMU command line includes a bunch of options that may seem confusing at first. You configure QEMU entirely with command-line options, so there is a lot to examine here. But I'll briefly highlight a few important options:

  * `-m 8:` Set the system memory ("RAM") to 8 megabytes
  * **`-boot menu=on,strict=on:`** Use a boot menu, so I can select if I want to boot from the CD-ROM image or the hard drive image
  * **`-hda freedos.img`:** Use **freedos.img** as the hard drive image
  * `-cdrom FD13LIVE.iso:`Use **FD13LIVE.iso** as the CD-ROM image
  * **`-device sb16 -device adlib -soundhw pcspk`:** Define the machine with a SoundBlaster16 sound card, AdLib digitial music card, and PC speaker emulation (these are useful if you want to play DOS games)
  * **`-usbdevice mouse`:** Recognize the user's mouse as a USB mouse (click in the QEMU window to use the mouse)



### Partition the hard drive

You can use FreeDOS 1.3 RC4 from the LiveCD, but if you want to install FreeDOS to your computer, you'll first need to make space on the hard drive. This requires creating a _partition_ with the FDISK program.

From the DOS command line, type `FDISK` to run the _fixed disk_ setup program. FDISK is a full-screen interactive program, and you only need to type a number to select a menu item. From the main FDISK menu, enter "1" to create a DOS partition on the drive, then enter "1" on the next screen to create a _primary_ DOS partition.

![using fdisk][4]

Select "1" to create a partition
(Jim Hall, [CC-BY SA 4.0][3])

![using fdisk][5]

Select "1" on the next menu to make a primary partition
(Jim Hall, [CC-BY SA 4.0][3])

FDISK asks you if you wish to use the full size of the hard disk to create the partition. Unless you need to share space on this hard drive with another operating system, such as Linux, you should answer "Y" to this prompt.

After FDISK creates the new partition, you'll need to reboot before DOS can recognize the new partition information. Like all DOS operating systems, FreeDOS identifies the hard drive information only when it boots up. So if you create or delete any disk partitions, you'll need to reboot so FreeDOS recognizes the changed partition information. FDISK reminds you to reboot, so you don't forget.

![using fdisk][6]

You need to reboot to recognize the new partition
(Jim Hall, [CC-BY SA 4.0][3])

You can reboot by stopping and restarting the QEMU virtual machine, but I prefer to reboot FreeDOS from the FreeDOS command line, using the FreeDOS Advanced Power Management (FDADPM) tool. To reboot, type the command `FDADPM /WARMBOOT` and FreeDOS reboots itself.

### Formatting the hard drive

After FreeDOS restarts, you can continue setting up the hard drive. Creating the disk partition was "step 1" in this process; now you need to make a DOS _filesystem_ on the partition so FreeDOS can use it.

DOS systems identify "drives" using the letters `A` through `Z`. FreeDOS recognizes the first partition on the first hard drive as the `C` drive, and so on. You often indicate the drive with the letter and a colon (`:`) so the new partition we created above is actually the `C:` drive.

You can create a DOS filesystem on the new partition with the FORMAT command. This command takes a few options, but we'll only use the `/S` option to tell FORMAT to make the new filesystem bootable—the "S" means to install the FreeDOS "System" files. Type `FORMAT /S C:` to make a new DOS filesystem on the `C:` drive.

![formatting the disk][7]

Format the partition to create the DOS filesystem
(Jim Hall, [CC-BY SA 4.0][3])

With the `/S` option, FORMAT will run the SYS program to transfer the system files. You'll see this as part of the output from FORMAT:

![formatting the disk][8]

FORMAT /S will use SYS to make the disk bootable
(Jim Hall, [CC-BY SA 4.0][3])

### Installing software

Having created a new partition with FDISK and a new filesystem with FORMAT, the new `C:` drive is basically empty. At this point, the `C:` drive only contains a copy of the kernel and the `COMMAND.COM` command-line shell. To do anything useful with the new disk, we need to install software on it. This is the last step for the manual install process.

The FreeDOS 1.3 RC4 LiveCD contains all of the software you might want to install on the new system. Each FreeDOS program is available as a separate "package," which is really just a Zip archive file. The packages that set up the standard DOS environment are stored in the `BASE` directory, under the `PACKAGES` directory on the LiveCD.

You could install the packages by "unzipping" each of them to the hard drive, one at a time. With 62 individual packages in the "Base" group, installing each package individually would take a very long time. However, you can run a one-line `FOR` "loop" command to "unzip" each program. Then FreeDOS can "unzip" all of the packages for you.

The basic usage of the `FOR` loop indicates a single-letter variable (let's use `%F`) that FreeDOS uses to "fill in" the filename later. The `FOR` also requires a list of files in brackets and the command that it should run against each of the files. The syntax to unzip a list of Zip files looks like this:


```
`FOR %F IN (*.ZIP) DO UNZIP %F`
```

This extracts all of the Zip files into the current directory. To extract or "unzip" the files into a different location, use the `-d` ("destination") option at the end of the `UNZIP` command line. For most FreeDOS systems, you will want to install the software packages to the `C:\FDOS` directory:

![installing the software][9]

Unzip all of the Base packages to finish installing FreeDOS
(Jim Hall, [CC-BY SA 4.0][3])

FreeDOS takes care of the rest, installing all 62 packages to your system. This may take several minutes because DOS can be slow when working with lots of individual files—and this command needs to extract 62 Zip files. The installation process would run a lot faster if we used a single `BASE.ZIP` archive file, but using packages provides more flexibility in what software you might want to install versus what you choose to leave out.

![installing the software][10]

After installing all the Base packages
(Jim Hall, [CC-BY SA 4.0][3])

After you've installed everything, reboot your system with `FDADPM /WARMBOOT`. Installing manually means your new FreeDOS system won't have the usual `FDCONFIG.SYS` configuration file, so FreeDOS will assume a few typical default values when it starts up. Without the `AUTOXEC.BAT` file, FreeDOS also prompts you for the time and date.

![rebooting FreeDOS][11]

Rebooting FreeDOS after a manual install
(Jim Hall, [CC-BY SA 4.0][3])

Most users should be able to use the more user-friendly process to install FreeDOS on a new computer. But if you want to install it yourself the "old school" way, you can also run the installation steps manually. This can provide some additional flexibility and control because you install everything yourself. And now you know how to do it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/install-freedos-without-installer

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph (FreeDOS fish logo and command prompt on computer)
[2]: https://opensource.com/sites/default/files/uploads/manual-install3.png (Select "Use FreeDOS 1.3 in Live Environment mode" to boot the LiveCD)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/manual-install6.png (Select "1" to create a partition)
[5]: https://opensource.com/sites/default/files/uploads/manual-install7.png (Select "1" on the next menu to make a primary partition)
[6]: https://opensource.com/sites/default/files/uploads/manual-install10.png (You need to reboot to recognize the new partition)
[7]: https://opensource.com/sites/default/files/uploads/manual-install13.png (Format the partition to create the DOS filesystem)
[8]: https://opensource.com/sites/default/files/uploads/manual-install14.png (FORMAT /S will use SYS to make the disk bootable)
[9]: https://opensource.com/sites/default/files/uploads/manual-install18.png (Unzip all of the Base packages to finish installing FreeDOS)
[10]: https://opensource.com/sites/default/files/uploads/manual-install24.png (After installing all the Base packages)
[11]: https://opensource.com/sites/default/files/uploads/manual-install28.png (Rebooting FreeDOS after a manual install)
