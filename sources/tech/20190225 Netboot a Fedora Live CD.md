[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Netboot a Fedora Live CD)
[#]: via: (https://fedoramagazine.org/netboot-a-fedora-live-cd/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Netboot a Fedora Live CD
======

![](https://fedoramagazine.org/wp-content/uploads/2019/02/netboot-livecd-816x345.jpg)

[Live CDs][1] are useful for many tasks such as:

  * installing the operating system to a hard drive
  * repairing a boot loader or performing other rescue-mode operations
  * providing a consistent and minimal environment for web browsing
  * …and [much more][2].



As an alternative to using DVDs and USB drives to store your Live CD images, you can upload them to an [iSCSI][3] server where they will be less likely to get lost or damaged. This guide shows you how to load your Live CD images onto an iSCSI server and access them with the [iPXE][4] boot loader.

### Download a Live CD Image

```
$ MY_RLSE=27
$ MY_LIVE=$(wget -q -O - https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/$MY_RLSE/Workstation/x86_64/iso | perl -ne '/(Fedora[^ ]*?-Live-[^ ]*?\.iso)(?{print $^N})/;')
$ MY_NAME=fc$MY_RLSE
$ wget -O $MY_NAME.iso https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/$MY_RLSE/Workstation/x86_64/iso/$MY_LIVE
```

The above commands download the Fedora-Workstation-Live-x86_64-27-1.6.iso Fedora Live image and save it as fc27.iso. Change the value of MY_RLSE to download other archived versions. Or you can browse to <https://getfedora.org/> to download the latest Fedora live image. Versions prior to 21 used different naming conventions, and must be [downloaded manually here][5]. If you download a Live CD image manually, set the MY_NAME variable to the basename of the file without the extension. That way the commands in the following sections will reference the correct file.

### Convert the Live CD Image

Use the livecd-iso-to-disk tool to convert the ISO file to a disk image and add the netroot parameter to the embedded kernel command line:

```
$ sudo dnf install -y livecd-tools
$ MY_SIZE=$(du -ms $MY_NAME.iso | cut -f 1)
$ dd if=/dev/zero of=$MY_NAME.img bs=1MiB count=0 seek=$(($MY_SIZE+512))
$ MY_SRVR=server-01.example.edu
$ MY_RVRS=$(echo $MY_SRVR | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_SRVR})
$ MY_LOOP=$(sudo losetup --show --nooverlap --find $MY_NAME.img)
$ sudo livecd-iso-to-disk --format --extra-kernel-args netroot=iscsi:$MY_SRVR:::1:iqn.$MY_RVRS:$MY_NAME $MY_NAME.iso $MY_LOOP
$ sudo losetup -d $MY_LOOP
```

### Upload the Live Image to your Server

Create a directory on your iSCSI server to store your live images and then upload your modified image to it.

**For releases 21 and greater:**

```
$ MY_FLDR=/images
$ scp $MY_NAME.img $MY_SRVR:$MY_FLDR/
```

**For releases prior to 21:**

```
$ MY_FLDR=/images
$ MY_LOOP=$(sudo losetup --show --nooverlap --find --partscan $MY_NAME.img)
$ sudo tune2fs -O ^has_journal ${MY_LOOP}p1
$ sudo e2fsck ${MY_LOOP}p1
$ sudo dd status=none if=${MY_LOOP}p1 | ssh $MY_SRVR "dd of=$MY_FLDR/$MY_NAME.img"
$ sudo losetup -d $MY_LOOP
```

### Define the iSCSI Target

Run the following commands on your iSCSI server:

```
$ sudo -i
# MY_NAME=fc27
# MY_FLDR=/images
# MY_SRVR=`hostname`
# MY_RVRS=$(echo $MY_SRVR | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_SRVR})
# cat << END > /etc/tgt/conf.d/$MY_NAME.conf
<target iqn.$MY_RVRS:$MY_NAME>
 backing-store $MY_FLDR/$MY_NAME.img
 readonly 1
 allow-in-use yes
</target>
END
# tgt-admin --update ALL
```

### Create a Bootable USB Drive

The [iPXE][4] boot loader has a [sanboot][6] command you can use to connect to and start the live images hosted on your iSCSI server. It can be compiled in many different [formats][7]. The format that works best depends on the type of hardware you’re running. As an example, the following instructions show how to [chain load][8] iPXE from [syslinux][9] on a USB drive.

First, download iPXE and build it in its lkrn format. This should be done as a normal user on a workstation:

```
$ sudo dnf install -y git
$ git clone http://git.ipxe.org/ipxe.git $HOME/ipxe
$ sudo dnf groupinstall -y "C Development Tools and Libraries"
$ cd $HOME/ipxe/src
$ make clean
$ make bin/ipxe.lkrn
$ cp bin/ipxe.lkrn /tmp
```

Next, prepare a USB drive with a MSDOS partition table and a FAT32 file system. The below commands assume that you have already connected the USB drive to be formatted. **Be careful that you do not format the wrong drive!**

```
$ sudo -i
# dnf install -y parted util-linux dosfstools
# echo; find /dev/disk/by-id ! -regex '.*-part.*' -name 'usb-*' -exec readlink -f {} \; | xargs -i bash -c "parted -s {} unit MiB print | perl -0 -ne '/^Model: ([^(]*).*\n.*?([0-9]*MiB)/i && print \"Found: {} = \$2 \$1\n\"'"; echo; read -e -i "$(find /dev/disk/by-id ! -regex '.*-part.*' -name 'usb-*' -exec readlink -f {} \; -quit)" -p "Drive to format: " MY_USB
# umount $MY_USB?
# wipefs -a $MY_USB
# parted -s $MY_USB mklabel msdos mkpart primary fat32 1MiB 100% set 1 boot on
# mkfs -t vfat -F 32 ${MY_USB}1
```

Finally, install syslinux on the USB drive and configure it to chain load iPXE:

```
# dnf install -y syslinux-nonlinux
# syslinux -i ${MY_USB}1
# dd if=/usr/share/syslinux/mbr.bin of=${MY_USB}
# MY_MNT=$(mktemp -d)
# mount ${MY_USB}1 $MY_MNT
# MY_NAME=fc27
# MY_SRVR=server-01.example.edu
# MY_RVRS=$(echo $MY_SRVR | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_SRVR})
# cat << END > $MY_MNT/syslinux.cfg
ui menu.c32
default $MY_NAME
timeout 100
menu title SYSLINUX
label $MY_NAME
 menu label ${MY_NAME^^}
 kernel ipxe.lkrn
 append dhcp && sanboot iscsi:$MY_SRVR:::1:iqn.$MY_RVRS:$MY_NAME
END
# cp /usr/share/syslinux/menu.c32 $MY_MNT
# cp /usr/share/syslinux/libutil.c32 $MY_MNT
# cp /tmp/ipxe.lkrn $MY_MNT
# umount ${MY_USB}1
```

You should be able to use this same USB drive to netboot additional iSCSI targets simply by editing the syslinux.cfg file and adding additional menu entries.

This is just one method of loading iPXE. You could install syslinux directly on your workstation. Another option is to compile iPXE as an EFI executable and place it directly in your [ESP][10]. Yet another is to compile iPXE as a PXE loader and place it on your TFTP server to be referenced by DHCP. The best option depends on your environment.

### Final Notes

  * You may want to add the –filename \EFI\BOOT\grubx64.efi parameter to the sanboot command if you compile iPXE in its EFI format.
  * It is possible to create custom live images. Refer to [Creating and using live CD][11] for more information.
  * It is possible to add the –overlay-size-mb and –home-size-mb parameters to the livecd-iso-to-disk command to create live images with persistent storage. However, if you have multiple concurrent users, you’ll need to set up your iSCSI server to manage separate per-user writeable overlays. This is similar to what was shown in the “[How to Build a Netboot Server, Part 4][12]” article.
  * The live images support a persistenthome option on their kernel command line (e.g. persistenthome=LABEL=HOME). Used together with CHAP-authenticated iSCSI targets, the persistenthome option provides an interesting alternative to NFS for centralized home directories.




--------------------------------------------------------------------------------

via: https://fedoramagazine.org/netboot-a-fedora-live-cd/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Live_CD
[2]: https://en.wikipedia.org/wiki/Live_CD#Uses
[3]: https://en.wikipedia.org/wiki/ISCSI
[4]: https://ipxe.org/
[5]: https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/https://dl.fedoraproject.org/pub/archive/fedora/linux/releases/
[6]: http://ipxe.org/cmd/sanboot/
[7]: https://ipxe.org/appnote/buildtargets#boot_type
[8]: https://en.wikipedia.org/wiki/Chain_loading
[9]: https://www.syslinux.org/wiki/index.php?title=SYSLINUX
[10]: https://en.wikipedia.org/wiki/EFI_system_partition
[11]: https://docs.fedoraproject.org/en-US/quick-docs/creating-and-using-a-live-installation-image/#proc_creating-and-using-live-cd
[12]: https://fedoramagazine.org/how-to-build-a-netboot-server-part-4/
