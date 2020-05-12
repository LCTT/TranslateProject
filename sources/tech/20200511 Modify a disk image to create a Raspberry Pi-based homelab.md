[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Modify a disk image to create a Raspberry Pi-based homelab)
[#]: via: (https://opensource.com/article/20/5/disk-image-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Modify a disk image to create a Raspberry Pi-based homelab
======
Create a "private cloud at home" with a Raspberry Pi or other
single-board computer.
![Science lab with beakers][1]

Building a [homelab][2] can be a fun way to entertain yourself while learning new concepts and experimenting with new technologies. Thanks to the popularity of single-board computers (SBCs), led by the [Raspberry Pi][3], it is easier than ever to build a multi-computer lab right from the comfort of your home. Creating a "private cloud at home" is also a great way to get exposure to cloud-native technologies for considerably less money than trying to replicate the same setup with a major cloud provider.

This article explains how to modify a disk image for the Raspberry Pi or another SBC, pre-configure the host for SSH (secure shell), and disable the service that forces interaction for configuration on first boot. This is a great way to make your devices "boot and go," similar to cloud instances. Later, you can do more specialized, in-depth configurations using automated processes over an SSH connection.

Also, as you add more Pis to your lab, modifying disk images lets you just write the image to an SD card, drop it into the Pi, and go!

![Multiple Raspberry Pi computers, a switch, and a power bank][4]

### Decompress and mount the image

For this project, you need to modify a server disk image. I used the [Fedora Server 31 ARM][5] image during testing. After you download the disk image and [verify its checksum][6], you need to decompress and mount it to a location on the host computer's file system so you can modify it as needed.

You can use the **[xz][7]** command to decompress the Fedora Server image by using the **\--decompress** argument:


```
`xz --decompress Fedora-Server-armhfp-X-y.z-sda.raw.xz`
```

This leaves you with a raw, decompressed disk image (which automatically replaces the **.xz** compressed file). This raw disk image is just what it sounds like: a file containing all the data that would be on a formatted and installed disk. That includes partition information, the boot partition, the root partition, and any other partitions. You need to mount the partition you intend to work in, but to do that, you need information about where that partition starts in the disk image and the size of the sectors on the disk, so you can mount the file at the right sector.

Luckily, you can use the [**fdisk**][8] command on a disk image just as easily as on a real disk and use the **\--list** or **-l** argument to view the list of partitions and their information:


```
# Use fdisk to list the partitions in the raw image:
$ fdisk -l Fedora-Server-armhfp-31-1.9-sda.raw
Disk Fedora-Server-armhfp-X-y.z-sda.raw: 3.2 GiB, 3242196992 bytes, 6332416 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xdaad9f57

Device                               Boot   Start     End Sectors  Size Id Type
Fedora-Server-armhfp-X-y.z-sda.raw1         8192  163839  155648   76M  c W95 F
Fedora-Server-armhfp-X-y.z-sda.raw2 *     163840 1163263  999424  488M 83 Linux
Fedora-Server-armhfp-X-y.z-sda.raw3      1163264 6047743 4884480  2.3G 83 Linux
```

All the information you need is available in this output. Line 3 indicates the sector size, both logical and physical: (512 bytes / 512 bytes).

The list of devices shows the partitions inside the raw disk image. The first one, **Fedora-Server-armhfp-X-y.z-sda.raw1** is no doubt the bootloader partition because it is the first, small (only 76MB), and type W95 FAT32 (LBA), as identified by the Id "c," a FAT32 partition for booting off the SD card.

The second partition is not very large either, just 488MB. This partition is a Linux native-type partition (Id 83), and it probably is the Linux boot partition containing the kernel and [initramfs][9].

The third partition is what you probably want: it is 2.3GB, so it should have the majority of the distribution on it, and it is a Linux-native partition type, which is expected. This should contain the partition and data you want to modify.

The third partition starts on sector 1163264 (indicated by the "Start" column in the output of **fdisk**), so your mount offset is **595591168**, calculated by multiplying the sector size (512) by the start sector (1163264) (i.e., **512 * 1163264**). This means you need to mount the file with an offset of 595591168 to be in the right place at the mount point.

ARMed (see what I did there?) with this information, you can now mount the third partition to a directory in your homedir:


```
$ mkdir ~/mnt
$ sudo mount -o loop,offset=595591168 Fedora-Server-armhfp-X-y.z-sda.raw ~/mnt
$ ls ~/mnt
```

### Work directly within the disk image

Once the disk image has been decompressed and mounted to a spot on the host computer, it is time to start modifying the image to suit your needs. In my opinion, the easiest way to make changes to the image is to use **chroot** to change the working root of your session to that of the mounted image. There's a tricky bit, though.

When you change root, your session will use the binaries from the new root. Unless you are doing all of this from an ARM system, the architecture of the decompressed disk image will not be the same as the host system you are using. Even inside the **chroot**, the host system will not be able to make use of binaries with a different architecture. At least, not natively.

Luckily, there is a solution: **qemu-user-static**. From the [Debian Wiki][10]:

> "[qemu-user-static] provides the user mode emulation binaries, built statically. In this mode QEMU can launch Linux processes compiled for one CPU on another CPU… If binfmt-support package is installed, qemu-user-static package will register binary formats which the provided emulators can handle, so that it will be possible to run foreign binaries directly."

This is exactly what you need to be able to work in the non-native architecture inside your chroot. If the host system is Fedora, install the **qemu-user-static** package with DNF, and restart **systemd-binfmt.service**:


```
# Enable non-native arch chroot with DNF, adding new binary format information
# Output suppressed for brevity
$ dnf install qemu-user-static
$ systemctl restart systemd-binfmt.service
```

With this, you should be able to change root to the mounted disk image and run the **uname** command to verify that everything is working:


```
sudo chroot ~/mnt/ /usr/bin/uname -a -r
Linux marvin 5.5.16-200.fc31.x86_64 #1 SMP Wed Apr 8 16:43:33 UTC 2020 armv7l armv7l armv7l GNU/Linux
```

Running **uname** from within the changed root shows **armv7l** in the output—the architecture of the raw disk image—and not the host machine. Everything is working as expected, and you can continue on to modify the image.

### Modify the disk image

Now that you can change directly into the ARM-based disk image and work in that environment, you can begin to make changes to the image itself. You want to set up the image so it can be booted and immediately accessed without having to do any additional setup directly on the Raspberry Pi. To do this, you need to install and enable sshd (the OpenSSH daemon) and add the authorized keys for SSH access.

And to make this behave more like a cloud environment and realize the dream of a private cloud at home, add a local user, give that user **sudo** rights, and (to be just like the cloud heavyweights) allow that user to use **sudo** without a password.

So, your to-do list is:

  * Install and enable SSHD (SSHD is already installed and enabled in the Fedora ARM image, but you may need to do this manually for your distribution)
  * Set up a local user
  * Allow the local user to use sudo (without a password, optional)
  * Add authorized keys
  * Allow root to SSH with the authorized keys (optional)



I use the GitHub feature that allows you to upload your public SSH keys and make them available at **[https://github.com/&lt;your_github_username&gt;.keys][11]**. I find this to be a convenient way to distribute public keys, although I am paranoid enough that I always check that the downloaded keys match what I am expecting. If you don't want to use this method, you can copy your public keys into the **chroot** directly from your host computer, or you can host your keys on a web server that you control in order to use the same workflow.

To start modifying the disk image, **chroot** into the mounted disk image again, this time starting a shell so multiple commands can be run:


```
# Output of these commands (if any) are omitted for brevity
$ sudo chroot ~/mnt /bin/bash

# Install openssh-server and enable it (already done on Fedora)
$ dnf install -y openssh-server
$ systemctl enable sshd.service

# Allow root to SSH with your authorized keys
$ mkdir /root/.ssh

# Download, or otherwise add to the authorized_keys file, your public keys
# Replace the URL with the path to your own public keys
$ curl <https://github.com/clcollins.keys> -o /root/.ssh/authorized_keys
$ chmod 700 /root/.ssh
$ chmod 600 /root/.ssh/authorized_keys

# Add a local user, and put them in the wheel group
# Change the group and user to whatever you desire
groupadd chris
useradd -g chris -G wheel -m -u 1000 chris

# Download or add your authorized keys
# Change the homedir and URL as you've done above
mkdir /home/chris/.ssh
curl <https://github.com/clcollins.keys> -o /home/chris/.ssh/authorized_keys
chmod 700 /home/chris/.ssh
chmod 600 /home/chris/.ssh/authorized_keys
chown -R chris.chris /home/chris/.ssh/

# Allow the wheel group (with your local user) to use suso without a password
echo "%wheel ALL=(ALL) NOPASSWD:ALL" &gt;&gt; /etc/sudoers.d/91-wheel-nopasswd
```

This is all that generally needs to be done to set up SSH into a Raspberry Pi or other single-board computer on first boot. However, each distribution has its own quirks. For example, Rasbian already includes a local user, **pi**, and does not use the **wheel** group. So for Raspbian, it may be better to use the existing user or to delete the **pi** user and replace it with another.

In the case of Fedora ARM, the image prompts you to finish setup on first boot. This defeats the purpose of the changes you made above, especially since it blocks startup entirely until setup is complete. Your goal is to make the Raspberry Pi function like part of a private cloud infrastructure, and that workflow includes setting up the host remotely via SSH when it starts up.  Disable the initial setup, controlled by the service **initial-setup.service**:


```
# Disable the initial-setup.service for both the multi-user and graphical targets
unlink /etc/systemd/system/multi-user.target.wants/initial-setup.service
unlink /etc/systemd/system/graphical.target.wants/initial-setup.service
```

While you are in the change root, you can make any other changes you might want for your systems or just leave it at that and follow the cloud-native workflow of configuration over SSH after first boot.

### Recompress and install the modified image

With these changes to your system completed, all that is left is to recompress the disk image and install it on an SD card for your Raspberry Pi.

Make sure to exit the chroot, then unmount the disk image:


```
`$ sudo umount ~/mnt/`
```

Just as you decompressed the image initially, you can use the **xz** command again to compress the image. By using the **\--keep** argument, **xz** will leave the raw image rather than cleaning it up. While this uses more disk space, leaving the uncompressed image allows you to make incremental changes to the images you are working with without needing to decompress them each time. This is great for saving time while testing and tweaking images to your liking:


```
# Compress the raw disk image to a .xz file, but keep the raw disk image
xz --compress Fedora-Server-armhfp-31-1.9-sda.raw --keep
```

The compression takes a while, so take this time to stand up, stretch, and get your blood flowing again.

Once the compression is done, the new, modified disk image can be copied to an SD card to use with a Raspberry Pi. The standard **dd** method to copy the image to the SD card works fine, but I like to use Fedora's **arm-image-installer** because of the options it provides when working with unedited images. It also works great for edited images and is a little more user-friendly than the **dd** command.

Make sure to check which disk the SD card is on and use that for the **\--media** argument:


```
# Use arm-image-installer to copy the modified disk image to the SD card
arm-image-installer --image=Fedora-Server-armhfp-X-y.z-sda.raw.xz --target=rpi3 --media=/dev/sdc --norootpass --resizefs -y
```

Now you are all set with a new, modified Fedora Server ARM image for Raspberry Pis or other single board computers, ready to boot and immediately SSH into with your modifications. This method can also be used to make other changes, and you can use it with other distributions' raw disk images if you prefer them to Fedora. This is a good base to start building a private-cloud-at-home homelab. In future articles, I will guide you through setting up a homelab using cloud technologies and automation.

### Further reading

A lot of research went into learning how to do the things in this article. Two of the most helpful sources I found for learning how to customize disk images and work with non-native architectures are listed below. They were extremely helpful in rounding the corner from "I have no idea what I'm doing" to "OK, I can do this!"

  * [How to modify a raw disk image of your custom Linux distro][12]
  * [Using DNF wiki][13]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/disk-image-raspberry-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/article/19/3/home-lab
[3]: https://opensource.com/resources/raspberry-pi
[4]: https://opensource.com/sites/default/files/uploads/raspberrypi_homelab.jpg (Multiple Raspberry Pi computers, a switch, and a power bank)
[5]: https://arm.fedoraproject.org/
[6]: https://arm.fedoraproject.org/verify.html
[7]: https://tukaani.org/xz/
[8]: https://en.wikipedia.org/wiki/Fdisk
[9]: https://wiki.debian.org/initramfs
[10]: https://wiki.debian.org/RaspberryPi/qemu-user-static
[11]: https://github.com/%3Cyour_github_username%3E.keys
[12]: https://www.linux.com/news/how-modify-raw-disk-image-your-custom-linux-distro/
[13]: https://wiki.mageia.org/en/Using_DNF#Setting_up_a_container_for_a_non-native_architectur
