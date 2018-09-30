BootISO – A Simple Bash Script To Securely Create A Bootable USB Device From ISO File
======
Most of us (including me) very often create a bootable USB device from ISO file for OS installation.

There are many applications freely available in Linux for this purpose. Even we wrote few of the utility in the past.

Every one uses different application and each application has their own features and functionality.

In that few of applications are belongs to CLI and few of them associated with GUI.

Today we are going to discuss about similar kind of utility called BootISO. It’s a simple bash script, which allow users to create a USB device from ISO file.

Many of the Linux admin uses dd command to create bootable ISO, which is one of the native and famous method but the same time, it’s one of the very dangerous command. So, be careful, when you performing any action with dd command.

**Suggested Read :**
**(#)** [Etcher – Easy way to Create a bootable USB drive & SD card from an ISO image][1]
**(#)** [Create a bootable USB drive from an ISO image using dd command on Linux][2]

### What IS BootISO

[BootIOS][3] is a simple bash script, which allow users to securely create a bootable USB device from one ISO file. It’s written in bash.

It doesn’t offer any GUI but in the same time it has vast of options, which allow newbies to create a bootable USB device in Linux without any issues. Since it’s a intelligent tool that automatically choose if any USB device is connected on the system.

It will print the list when the system has more than one USB device connected. When you choose manually another hard disk manually instead of USB, this will safely exit without writing anything on it.

This script will also check for dependencies and prompt user for installation, it works with all package managers such as apt-get, yum, dnf, pacman and zypper.

### BootISO Features

  * It checks whether the selected ISO has the correct mime-type or not. If no then it exit.
  * BootISO will exit automatically, if you selected any other disks (local hard drive) except USB drives.
  * BootISO allow users to select the desired USB drives when you have more than one.
  * BootISO prompts the user for confirmation before erasing and paritioning USB device.
  * BootISO will handle any failure from a command properly and exit.
  * BootISO will call a cleanup routine on exit with trap.



### How To Install BootISO In Linux

There are few ways are available to install BootISO in Linux but i would advise users to install using the following method.
```
$ curl -L https://git.io/bootiso -O
$ chmod +x bootiso
$ sudo mv bootiso /usr/local/bin/

```

Once BootISO installed, run the following command to list the available USB devices.
```
$ bootiso -l

Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE TYPE
sdd 1 32G running disk

```

If you have only one USB device, then simple run the following command to create a bootable USB device from ISO file.
```
$ bootiso /path/to/iso file

$ bootiso /opt/iso_images/archlinux-2018.05.01-x86_64.iso
Granting root privileges for bootiso.
Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE TYPE
sdd 1 32G running disk
Autoselecting `sdd' (only USB device candidate)
The selected device `/dev/sdd' is connected through USB.
Created ISO mount point at `/tmp/iso.vXo'
`bootiso' is about to wipe out the content of device `/dev/sdd'.
Are you sure you want to proceed? (y/n)>y
Erasing contents of /dev/sdd...
Creating FAT32 partition on `/dev/sdd1'...
Created USB device mount point at `/tmp/usb.0j5'
Copying files from ISO to USB device with `rsync'
Synchronizing writes on device `/dev/sdd'
`bootiso' took 250 seconds to write ISO to USB device with `rsync' method.
ISO succesfully unmounted.
USB device succesfully unmounted.
USB device succesfully ejected.
You can safely remove it !

```

Mention your device name, when you have more than one USB device using `--device` option.
```
$ bootiso -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso

```

By default bootios uses `rsync` command to perform all the action and if you want to use `dd` command instead of, use the following format.
```
$ bootiso --dd -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso

```

If you want to skip `mime-type` check, include the following option with bootios utility.
```
$ bootiso --no-mime-check -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso

```

Add the below option with bootios to skip user for confirmation before erasing and partitioning USB device.
```
$ bootiso -y -d /dev/sde /opt/iso_images/archlinux-2018.05.01-x86_64.iso

```

Enable autoselecting USB devices in conjunction with -y option.
```
$ bootiso -y -a /opt/iso_images/archlinux-2018.05.01-x86_64.iso

```

To know more all the available option for bootiso, run the following command.
```
$ bootiso -h
Create a bootable USB from any ISO securely.
Usage: bootiso [...]

Options

-h, --help, help Display this help message and exit.
-v, --version Display version and exit.
-d, --device Select block file as USB device.
 If is not connected through USB, `bootiso' will fail and exit.
 Device block files are usually situated in /dev/sXX or /dev/hXX.
 You will be prompted to select a device if you don't use this option.
-b, --bootloader Install a bootloader with syslinux (safe mode) for non-hybrid ISOs. Does not work with `--dd' option.
-y, --assume-yes `bootiso' won't prompt the user for confirmation before erasing and partitioning USB device.
 Use at your own risks.
-a, --autoselect Enable autoselecting USB devices in conjunction with -y option.
 Autoselect will automatically select a USB drive device if there is exactly one connected to the system.
 Enabled by default when neither -d nor --no-usb-check options are given.
-J, --no-eject Do not eject device after unmounting.
-l, --list-usb-drives List available USB drives.
-M, --no-mime-check `bootiso' won't assert that selected ISO file has the right mime-type.
-s, --strict-mime-check Disallow loose application/octet-stream mime type in ISO file.
-- POSIX end of options.
--dd Use `dd' utility instead of mounting + `rsync'.
 Does not allow bootloader installation with syslinux.
--no-usb-check `bootiso' won't assert that selected device is a USB (connected through USB bus).
 Use at your own risks.

Readme

 Bootiso v2.5.2.
 Author: Jules Samuel Randolph
 Bugs and new features: https://github.com/jsamr/bootiso/issues
 If you like bootiso, please help the community by making it visible:
 * star the project at https://github.com/jsamr/bootiso
 * upvote those SE post: https://goo.gl/BNRmvm https://goo.gl/YDBvFe

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bootiso-a-simple-bash-script-to-securely-create-a-bootable-usb-device-in-linux-from-iso-file/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/etcher-easy-way-to-create-a-bootable-usb-drive-sd-card-from-an-iso-image-on-linux/
[2]:https://www.2daygeek.com/create-a-bootable-usb-drive-from-an-iso-image-using-dd-command-on-linux/
[3]:https://github.com/jsamr/bootiso
