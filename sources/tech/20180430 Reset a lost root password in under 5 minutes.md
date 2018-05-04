translating---geekpi

Reset a lost root password in under 5 minutes
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum)

A system administrator can easily reset passwords for users who have forgotten theirs. But what happens if the system administrator forgets the root password, or leaves the company? This guide will show you how to reset a lost or forgotten root password on a Red Hat-compatible system, including Fedora and CentOS, in less than 5 minutes.

Please note, if the entire system hard disk has been encrypted with LUKS, you would need to provide the LUKS password when prompted. Also, this procedure is applicable to systems running systemd which has been the default init system since Fedora 15, CentOS 7.14.04, and Red Hat Enterprise Linux 7.0.

First, you need to interrupt the boot process, so you'll need to turn the system on or restart it if it’s already powered on. The first step is tricky because the GRUB menu tends to flash very quickly on the screen. You may need to try this a few times until you are able to do it.

Press **e** on your keyboard when you see this screen:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub0.png?itok=cz9nk5BT)

If you've done this correctly, you should see a screen similar to this one:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub1.png?itok=3ZY5uiGq)

Use your arrow keys to move to the Linux16 line:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub2_0.png?itok=8epRyqOl)

Using your **del** key or your **backspace** key, remove `rhgb quiet` and replace with the following:

`rd.break enforcing=0`

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/grub3.png?itok=JDdMXnUb)

Setting `enforcing=0` will allow you to avoid performing a complete system SELinux relabeling. Once the system is rebooted, you'll only have to restore the correct SELinux context for the `/etc/shadow` file. I'll show you how to do this too.

Press **Ctrl-x** to start.

**The system will now be in emergency mode.**

Remount the hard drive with read-write access:
```
# mount –o remount,rw /sysroot

```

Run `chroot` to access the system:
```
# chroot /sysroot

```

You can now change the root password:
```
# passwd

```

Type the new root password twice when prompted. If you are successful, you should see a message that reads " **all authentication tokens updated successfully**. "

Type **exit** twice to reboot the system.

Log in as root and restore the SELinux label to the `/etc/shadow` file.
```
# restorecon -v /etc/shadow

```

Turn SELinux back to enforcing mode:
```
# setenforce 1

```
--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/reset-lost-root-password

作者：[Curt Warfield][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rcurtiswarfield
