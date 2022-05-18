[#]: subject: "How To Reset Root Password In Fedora 36"
[#]: via: "https://ostechnix.com/reset-root-password-in-fedora/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Reset Root Password In Fedora 36
======
Reset Forgotten Root Password In Fedora

Have you forgotten the root password in Fedora? Or do you want to change the root user password in your Fedora system? No problem! This brief guide walks you through the steps to change or reset root password in Fedora operating systems.

**Note:** This guide has been officially tested on Fedora 36 and 35 versions. The steps provided below are same for resetting root password in Fedora Silverblue and older Fedora versions.

**Step 1** - Switch on your Fedora system and press **ESC** key until you see the GRUB boot menu. Once the GRUB menu is appeared, choose the Kernel you want to boot and hit **e** to edit the selected boot entry.

![Grub Menu In Fedora 36][1]

**Step 2** - In the next screen, you will see all boot parameters. Find the parameter named **ro**.

![Find ro Kernel Parameter In Grub Entry][2]

**Step 3** - Replace the **'ro'** parameter with **'rw init=/sysroot/bin/sh'**(without quotes, of course). Please mind the space between `"rw"` and "`init=/sysroot`...". After modifying it, the kernel parameter line should look like below.

![Modify Kernel Parameters][3]

**Step 4** - After changing the parameters as shown above, press **Ctrl+x** to enter into the emergency mode i.e. single user mode.

From the emergency mode, enter the following command to mount root (`/` ) file system in read/write mode.

```
chroot /sysroot/
```

![Mount Root Filesystem In Read, Write Mode In Fedora Linux][4]

**Step 5** - Now change the root password with `passwd` command:

```
passwd root
```

Enter the root password twice. I suggest you to use a strong password.

![Reset Or Change Root Password In Fedora][5]

**Step 6** - After resetting the root password, run the following command to enable SELinux relabeling on reboot :

```
touch /.autorelabel
```

![Enable SELinux Relabeling On Reboot In Fedora][6]

**Step 7** - Finally, exit the single user mode and reboot the Fedora system to normal mode by running the following command:

```
exit
```

```
reboot
```

Wait for SELinux relabeling process to complete. It will take a few minutes depending upon the filesystem's size and speed of your hard drive.

![SELinux Filesystem Relabeling In Progress][7]

**Step 8** - After the filesystem relabeling is completed, you can log in to your Fedora system with new root password.

![Login To Fedora As Root User][8]

As you can see, the steps to reset root password in Fedora 36 is fairly easy and exactly same as **[resetting root password in RHEL][9]** and its clones like CentOS, AlmaLinux and Rocky Linux.

--------------------------------------------------------------------------------

via: https://ostechnix.com/reset-root-password-in-fedora/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Grub-Menu-In-Fedora-36.png
[2]: https://ostechnix.com/wp-content/uploads/2021/11/Find-ro-Kernel-Parameter-In-Grub-Entry.png
[3]: https://ostechnix.com/wp-content/uploads/2022/05/Modify-Kernel-Parameters.png
[4]: https://ostechnix.com/wp-content/uploads/2022/05/Mount-Root-Filesystem-In-Read-Write-Mode-In-Fedora-Linux.png
[5]: https://ostechnix.com/wp-content/uploads/2022/05/Reset-Or-Change-Root-Password-In-Fedora.png
[6]: https://ostechnix.com/wp-content/uploads/2022/05/Enable-SELinux-Relabeling-On-Reboot-In-Fedora.png
[7]: https://ostechnix.com/wp-content/uploads/2021/11/SELinux-filesystem-relabeling-in-progress.png
[8]: https://ostechnix.com/wp-content/uploads/2022/05/Login-To-Fedora-As-Root-User.png
[9]: https://ostechnix.com/how-to-reset-root-user-password-in-centos-8-rhel-8/
