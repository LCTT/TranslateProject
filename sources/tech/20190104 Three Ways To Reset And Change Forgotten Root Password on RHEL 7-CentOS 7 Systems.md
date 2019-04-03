[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Three Ways To Reset And Change Forgotten Root Password on RHEL 7/CentOS 7 Systems)
[#]: via: (https://www.2daygeek.com/linux-reset-change-forgotten-root-password-in-rhel-7-centos-7/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

Three Ways To Reset And Change Forgotten Root Password on RHEL 7/CentOS 7 Systems
======

If you are forget to remember your root password for RHEL 7 and CentOS 7 systems and want to reset the forgotten root password?

If so, don’t worry we are here to help you out on this.

Navigate to the following link if you want to **[reset forgotten root password on RHEL 6/CentOS 6][1]**.

This is generally happens when you use different password in vast environment or if you are not maintaining the proper inventory.

Whatever it is. No issues, we will help you through this article.

It can be done in many ways but we are going to show you the best three methods which we tried many times for our clients.

In Linux servers there are three different users are available. These are, Normal User, System User and Super User.

As everyone knows the Root user is known as super user in Linux and Administrator is in Windows.

We can’t perform any major activity without root password so, make sure you should have the right root password when you perform any major tasks.

If you don’t know or don’t have it, try to reset using one of the below method.

  * Reset Forgotten Root Password By Booting into Single User Mode using `rd.break`
  * Reset Forgotten Root Password By Booting into Single User Mode using `init=/bin/bash`
  * Reset Forgotten Root Password By Booting into Rescue Mode



### Method-1: Reset Forgotten Root Password By Booting into Single User Mode

Just follow the below procedure to reset the forgotten root password in RHEL 7/CentOS 7 systems.

To do so, reboot your system and follow the instructions carefully.

**`Step-1:`** Reboot your system and interrupt at the boot menu by hitting **`e`** key to modify the kernel arguments.
![][3]

**`Step-2:`** In the GRUB options, find `linux16` word and add the `rd.break` word in the end of the file then press `Ctrl+x` or `F10` to boot into single user mode.
![][4]

**`Step-3:`** At this point of time, your root filesystem will be mounted in Read only (RO) mode to /sysroot. Run the below command to confirm this.

```
# mount | grep root
```

![][5]

**`Step-4:`** Based on the above output, i can say that i’m in single user mode and my root file system is mounted in read only mode.

It won’t allow you to make any changes on your system until you mount the root filesystem with Read and write (RW) mode to /sysroot. To do so, use the following command.

```
# mount -o remount,rw /sysroot
```

![][6]

**`Step-5:`** Currently your file systems are mounted as a temporary partition. Now, your command prompt shows **switch_root:/#**.

Run the following command to get into a chroot jail so that /sysroot is used as the root of the file system.

```
# chroot /sysroot
```

![][7]

**`Step-6:`** Now you can able to reset the root password with help of `passwd` command.

```
# echo "CentOS7$#123" | passwd --stdin root
```

![][8]

**`Step-7:`** By default CentOS 7/RHEL 7 use SELinux in enforcing mode, so create a following hidden file which will automatically perform a relabel of all files on next boot.

It allow us to fix the context of the **/etc/shadow** file.

```
# touch /.autorelabel
```

![][9]

**`Step-8:`** Issue `exit` twice to exit from the chroot jail environment and reboot the system.
![][10]

**`Step-9:`** Now you can login to your system with your new password.
![][11]

### Method-2: Reset Forgotten Root Password By Booting into Single User Mode

Alternatively we can use the below procedure to reset the forgotten root password in RHEL 7/CentOS 7 systems.

**`Step-1:`** Reboot your system and interrupt at the boot menu by hitting **`e`** key to modify the kernel arguments.
![][3]

**`Step-2:`** In the GRUB options, find `rhgb quiet` word and replace with the `init=/bin/bash` or `init=/bin/sh` word then press `Ctrl+x` or `F10` to boot into single user mode.

Screenshot for **`init=/bin/bash`**.
![][12]

Screenshot for **`init=/bin/sh`**.
![][13]

**`Step-3:`** At this point of time, your root system will be mounted in Read only mode to /. Run the below command to confirm this.

```
# mount | grep root
```

![][14]

**`Step-4:`** Based on the above ouput, i can say that i’m in single user mode and my root file system is mounted in read only (RO) mode.

It won’t allow you to make any changes on your system until you mount the root file system with Read and write (RW) mode. To do so, use the following command.

```
# mount -o remount,rw /
```

![][15]

**`Step-5:`** Now you can able to reset the root password with help of `passwd` command.

```
# echo "RHEL7$#123" | passwd --stdin root
```

![][16]

**`Step-6:`** By default CentOS 7/RHEL 7 use SELinux in enforcing mode, so create a following hidden file which will automatically perform a relabel of all files on next boot.

It allow us to fix the context of the **/etc/shadow** file.

```
# touch /.autorelabel
```

![][17]

**`Step-7:`** Finally `Reboot` the system.

```
# exec /sbin/init 6
```

![][18]

**`Step-9:`** Now you can login to your system with your new password.
![][11]

### Method-3: Reset Forgotten Root Password By Booting into Rescue Mode

Alternatively, we can reset the forgotten Root password for RHEL 7 and CentOS 7 systems using Rescue mode.

**`Step-1:`** Insert the bootable media through USB or DVD drive which is compatible for you and reboot your system. It will take to you to the below screen.

Hit `Troubleshooting` to launch the `Rescue` mode.
![][19]

**`Step-2:`** Choose `Rescue a CentOS system` and hit `Enter` button.
![][20]

**`Step-3:`** Here choose `1` and the rescue environment will now attempt to find your Linux installation and mount it under the directory `/mnt/sysimage`.
![][21]

**`Step-4:`** Simple hit `Enter` to get a shell.
![][22]

**`Step-5:`** Run the following command to get into a chroot jail so that /mnt/sysimage is used as the root of the file system.

```
# chroot /mnt/sysimage
```

![][23]

**`Step-6:`** Now you can able to reset the root password with help of **passwd** command.

```
# echo "RHEL7$#123" | passwd --stdin root
```

![][24]

**`Step-7:`** By default CentOS 7/RHEL 7 use SELinux in enforcing mode, so create a following hidden file which will automatically perform a relabel of all files on next boot.
It allow us to fix the context of the /etc/shadow file.

```
# touch /.autorelabel
```

![][25]

**`Step-8:`** Remove the bootable media then initiate the reboot.

**`Step-9:`** Issue `exit` twice to exit from the chroot jail environment and reboot the system.
![][26]

**`Step-10:`** Now you can login to your system with your new password.
![][11]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-reset-change-forgotten-root-password-in-rhel-7-centos-7/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-reset-change-forgotten-root-password-in-rhel-6-centos-6/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-2.png
[4]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-3.png
[5]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-5.png
[6]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-6.png
[7]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-8.png
[8]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-10.png
[9]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-10a.png
[10]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-11.png
[11]: https://www.2daygeek.com/wp-content/uploads/2018/12/reset-forgotten-root-password-on-rhel-7-centos-7-12.png
[12]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-1.png
[13]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-1a.png
[14]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-3.png
[15]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-4.png
[16]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-5.png
[17]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-6.png
[18]: https://www.2daygeek.com/wp-content/uploads/2018/12/method-reset-forgotten-root-password-on-rhel-7-centos-7-7.png
[19]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-1.png
[20]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-2.png
[21]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-3.png
[22]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-4.png
[23]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-5.png
[24]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-6.png
[25]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-7.png
[26]: https://www.2daygeek.com/wp-content/uploads/2018/12/rescue-reset-forgotten-root-password-on-rhel-7-centos-7-8.png
