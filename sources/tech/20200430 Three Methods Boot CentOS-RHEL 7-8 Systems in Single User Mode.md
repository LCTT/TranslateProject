[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Three Methods Boot CentOS/RHEL 7/8 Systems in Single User Mode)
[#]: via: (https://www.2daygeek.com/boot-centos-7-8-rhel-7-8-single-user-mode/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Three Methods Boot CentOS/RHEL 7/8 Systems in Single User Mode
======

Single user mode, also referred to as maintenance mode, which allows a single super user to recover/repair system problems.

Generally, these problems cannot be solved in a multi-user environment. The system can boot but will not function properly or you will not be able to log in.

It uses `runlevel1.target` or `rescue.target` on **[Red Hat][1]** (RHEL) 7/8 based systems.

In this mode, the system mount all local file systems, but does not activate network interfaces.

It only enables certain services and minimal functionality to repair the system.

This method is mostly useful when you want to run fsck to fix corrupted file systems, or to reset a forgotten root password, or to fix a mount point issue on the system.

You can boot **[CentOS][2]**/**[RHEL][3]** 7/8 systems in single user mode using the below three methods.

  * **Method-1:** Boot CentOS/RHEL 7/8 systems in single user mode by adding the “rd.break” parameter to the kernel
  * **Method-2:** Boot CentOS/RHEL 7/8 systems in single user mode by replacing the “rhgb quiet” word with the “init=/bin/bash or init=/bin/sh” parameter in the kernel
  * **Method-3:** Boot CentOS/RHEL 7/8 systems in single user mode by replacing the “ro” word with the “rw init=/sysroot/bin/sh” parameter in the kernel



### Method-1: Boot CentOS/RHEL 7/8 systems in single user mode by adding the “rd.break” parameter to the kernel

Reboot your system, on the GRUB2 boot screen, press the `"e"` key to edit the selected kernel. You need to select the first line, the first one is the latest kernel whereas you can select the different one if you would like to boot your system with the older kernel.

![][4]

Depending on your RHEL/CentOS version, find the word **“linux16”** or **“linux”**, press the “End” button on the keyboard, go to the end of the line, and add the keyword **“rd.break”** as shown below in the screenshot, then press **“Ctrl+x”** or **“F10”** to boot into single-user mode.

You need to find the word **`linux16`** for RHEL/CentOS 7 systems, while **`linux`** for RHEL/CentOS 8 systems.

![][4]

This change mount your root file system into **“read only (RO)”** mode. You can check this by running the command below. Also, the output below clearly shows that you are in **“Emergency Mode”**.

```
# mount | grep root
```

![][4]

To make changes to the **“sysroot”** file system you need to remount it with READ and WRITE (RW) mode.

```
# mount -o remount,rw /sysroot
```

Run the below command to change the environment, commonly known as “jailed directory” or “chroot jail”.

```
# chroot /sysroot
```

![][4]

Now, single-user mode is completely ready for use. Once you have fixed your problem to exit single user mode, perform the following steps.

CentOS/RHEL 7/8 uses SELinux by default, so create the following hidden file, which will automatically perform a relabel of all files on next boot.

```
# touch /.autorelabel
```

Finally, run the below command to restart the system. Alternatively, type “exit” command twice to restart your system.

```
# reboot -f
```

### Method-2: Boot CentOS/RHEL 7/8 systems in single user mode by replacing the “rhgb quiet” word with the “init=/bin/bash or init=/bin/sh” parameters in the kernel

Reboot your system, on the GRUB2 boot screen, press the `"e"` key to edit the selected kernel parameters.

![][4]

Find the word **“rhgb quiet”** and replace it with **“init=/bin/bash”** or **“init=/bin/sh”**, then press **“Ctrl+x”** or **“F10”** to boot in single user mode.

Screenshot for **`init=/bin/bash`**.

![][4]

Screenshot for **`init=/bin/sh`**.

![][4]

By default, this will mount your “/” partition in read-only (RO) mode, so you will need to remount the “/” file system with READ and WRITE (RW) mode to make changes.

```
# mount -o remount,rw /
```

![][4]

You can now perform any task that you want. When you are done, run the following command to enable SELinux relabeling on reboot.

```
# touch /.autorelabel
```

Finally reboot the system.

```
# exec /sbin/init 6
```

### Method-3: Boot CentOS/RHEL 7/8 systems in single user mode by replacing the “ro” word with the “rw init=/sysroot/bin/sh” parameter in the kernel

To interrupt the automatic boot, reboot your system and press any key on the GRUB2 splash screen.

This will display the list of kernels available on your system and select the latest kernel and press the **`"e"`** key to edit the selected kernel parameters.

Find the line that starts with the word **“linux”** or **“linux16”** and replace **“ro”** with **“rw init=/sysroot/bin/sh”**. When finished, press **“Ctrl+x”** or **“F10”** to boot in single user mode.

Change the environment to “chroot jail” by running the below command.

```
# chroot /sysroot
```

Make any necessary changes to the system. Once done, run the below command to enable SELinux relabeling on reboot.

```
# touch /.autorelabel
```

Finally reboot the system.

```
# reboot -f
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/boot-centos-7-8-rhel-7-8-single-user-mode/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/red-hat/
[2]: https://www.2daygeek.com/category/centos/
[3]: https://www.2daygeek.com/category/rhel/
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
