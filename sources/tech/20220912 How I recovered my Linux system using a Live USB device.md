[#]: subject: "How I recovered my Linux system using a Live USB device"
[#]: via: "https://opensource.com/article/22/9/recover-linux-system-live-usb"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I recovered my Linux system using a Live USB device
======
The Fedora Live USB distribution provides an effective solution to boot and enter a recovery mode.

![USB drive][1]

Image by: Photo by [Markus Winkler][2] on [Unsplash][3]

I have a dozen or so physical computers in my home lab and even more VMs. I use most of these systems for testing and experimentation. I frequently write about using automation to make sysadmin tasks easier. I have also written in multiple places that I learn more from my own mistakes than I do in almost any other way.

I have learned a lot during the last couple of weeks.

I created a major problem for myself. Having been a sysadmin for years and written hundreds of articles and five books about Linux, I really should have known better. Then again, we all make mistakes, which is an important lesson: You're never too experienced to make a mistake.

I'm not going to discuss the details of my error. It's enough to tell you that it was a mistake and that I should have put a lot more thought into what I was doing before I did it. Besides, the details aren't really the point. Experience can't save you from every mistake you're going to make, but it can help you in recovery. And that's literally what this article is about: Using a Live USB distribution to boot and enter a recovery mode.

### The problem

First, I created the problem, which was essentially a bad configuration for the `/etc/default/grub` file. Next, I used Ansible to distribute the misconfigured file to all my physical computers and run `grub2-mkconfig`. All 12 of them. Really, really fast.

All but two failed to boot. They crashed during the very early stages of Linux startup with various errors indicating that the `/root` filesystem could not be located.

I could use the root password to get into "maintenance" mode, but without `/root` mounted, it was impossible to access even the simplest tools. Booting directly to the recovery kernel did not work either. The systems were truly broken.

### Recovery mode with Fedora

The only way to resolve this problem was to find a way to get into recovery mode. When all else fails, Fedora provides a really cool tool: The same Live USB thumb drive used to install new instances of Fedora.

After setting the BIOS to boot from the Live USB device, I booted into the Fedora 36 Xfce live user desktop. I opened two terminal sessions next to each other on the desktop and switched to root privilege in both.

I ran `lsblk` in one for reference. I used the results to identify the `/` root partition and the `boot` and `efi` partitions. I used one of my VMs, as seen below. There is no `efi` partition in this case because this VM does not use UEFI.

```
# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0           7:0    0  1.5G  1 loop
loop1           7:1    0    6G  1 loop
├─live-rw     253:0    0    6G  0 dm   /
└─live-base   253:1    0    6G  1 dm   
loop2           7:2    0   32G  0 loop
└─live-rw     253:0    0    6G  0 dm   /
sda             8:0    0  120G  0 disk
├─sda1          8:1    0    1G  0 part
└─sda2          8:2    0  119G  0 part
  ├─vg01-swap 253:2    0    4G  0 lvm  
  ├─vg01-tmp  253:3    0   10G  0 lvm  
  ├─vg01-var  253:4    0   20G  0 lvm  
  ├─vg01-home 253:5    0    5G  0 lvm  
  ├─vg01-usr  253:6    0   20G  0 lvm  
  └─vg01-root 253:7    0    5G  0 lvm  
sr0            11:0    1  1.6G  0 rom  /run/initramfs/live
zram0         252:0    0    8G  0 disk [SWAP]
```

The `/dev/sda1` partition is easily identifiable as `/boot`, and the root partition is pretty obvious as well.

In the other terminal session, I performed a series of steps to recover my systems. The specific volume group names and device partitions such as `/dev/sda1` will differ for your systems. The commands shown here are specific to my situation.

The objective is to boot and get through startup using the Live USB, then mount only the necessary filesystems in an image directory and run the `chroot` command to run Linux in the chrooted image directory. This approach bypasses the damaged GRUB (or other) configuration files. However, it provides a complete running system with all the original filesystems mounted for recovery, both as the source of the tools required and the target of the changes to be made.

Here are the steps and related commands:

1. Create the directory `/mnt/sysimage` to provide a location for the `chroot` directory.

2. Mount the root partition on `/mnt/sysimage:`

```
# mount /dev/mapper/vg01-root /mnt/sysimage
```

3. Make `/mnt/sysimage` your working directory:

```
# cd /mnt/sysimage
```

4. Mount the `/boot` and `/boot/efi` filesystems.

5. Mount the other main filesystems. Filesystems like `/home` and `/tmp` are not needed for this procedure:

```
# mount /dev/mapper/vg01-usr usr

# mount /dev/mapper/vg01-var var
```

6. Mount important but already mounted filesystems that must be shared between the chrooted system and the original Live system, which is still out there and running:

```
# mount --bind /sys sys

# mount --bind /proc proc
```

7. Be sure to do the `/dev` directory last, or the other filesystems won't mount:

```
# mount --bind /dev dev
```

8. Chroot the system image:

```
# chroot /mnt/sysimage
```

The system is now ready for whatever you need to do to recover it to a working state. However, one time I was able to run my server for several days in this state until I could research and test real fixes. I don't really recommend that, but it can be an option in a dire emergency when things just need to get up and running–now!

### The solution

The fix was easy once I got each system into recovery mode. Because my systems now worked just as if they had booted successfully, I simply made the necessary changes to `/etc/default/grub` and `/etc/fstab` and ran the `grub2-mkconfig > boot/grub2/grub.cfg` command. I used the `exit` command to exit from chroot and then rebooted the host.

Of course, I could not automate the recovery from my mishap. I had to perform this entire process manually on each host—a fitting bit of karmic retribution for using automation to quickly and easily propagate my own errors.

### Lessons learned

Despite their usefulness, I used to hate the "Lessons Learned" sessions we would have at some of my sysadmin jobs, but it does appear that I need to remind myself of a few things. So here are my "Lessons Learned" from this self-inflicted fiasco.

First, the ten systems that failed to boot used a different volume group naming scheme, and my new GRUB configuration failed to consider that. I just ignored the fact that they might possibly be different.

* Think it through completely.
* Not all systems are alike.
* Test everything.
* Verify everything.
* Never make assumptions.

Everything now works fine. Hopefully, I am a little bit smarter, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/recover-linux-system-live-usb

作者：[David Both][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/markus-winkler-usb-unsplash.jpg
[2]: https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/usb?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
