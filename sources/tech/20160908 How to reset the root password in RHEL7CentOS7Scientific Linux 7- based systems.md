### How to reset the root password in RHEL7/CentOS7/Scientific Linux 7- based systems

Contents

*   *   [1. Objective][9]
    *   [2. Requirements][10]
    *   [3. Difficulty][11]
    *   [4. Instructions][12]
        *   [4.1. Boot into the minimal mode][1]
        *   [4.2. Interrupt the boot process][2]
        *   [4.3. Remount the system so that it can read and write][3]
        *   [4.4. Make /sysroot your root][4]
        *   [4.5. Change the root password][5]
        *   [4.6. Load SELinux policy][6]
        *   [4.7. Set context type on /etc/shadow file][7]
        *   [4.8. Exit & reboot][8]

### Objective

Resetting the root password in RHEL7/CentOS7/Scientific Linux 7

### Requirements

RHEL7 / CentOS7 / Scientific Linux 7

### Difficulty

MODERATE

### Instructions

Things have changed in the RHEL7 world and so has the preferred way of resetting the root password. Although the old way of interrupting the boot process (init=/bin/bash) still works, it is no longer bulletproof and recommended. 'Systemd' uses 'rd.break' to interrupt the boot. Let's have a quick walk through the whole procedure. 

### Boot into the minimal mode

Reboot the system and press `e` while being on the kernel list page, before the autoboot starts the system automatically. You get into the edit mode.

### Interrupt the boot process

In the kernel string - at the end of the line starting `linux 16 /vmlinuz- ect` type `rd.break`. Then Ctrl+X to reboot. The system boots into the initial ram drive and it's mounted on /sysroot In this mode you are not required to type the password.

### Remount the system so that it can read and write

```
 switch_root:/# mount -o remount,rw /sysroot/
```

### Make /sysroot your root

```
 switch_root:/# chroot /sysroot 
```
The command line will change slightly.

### Change the root password

```
sh-4.2# passwd 
```

### Load SELinux policy

```
sh-4.2# load_policy -i 
```

### Set context type on /etc/shadow file

```
sh-4.2# chcon -t shadow_t /etc/shadow 
```
Note: You could bypass the last 2 steps by creating an autorelabel file instead, but autorelabeling might take a long time.
```
sh-4.2# touch /.autorelabel 
```
For that reason, and despite it is easier, it should be regarded as the 'lazy option', and is not recommended.

### Exit & reboot

Exit & reboot and log in with your new root password.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems

作者：[Rado Folwarczny][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems
[1]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-1-boot-into-the-minimal-mode
[2]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-2-interrupt-the-boot-process
[3]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-3-remount-the-system-so-that-it-can-read-and-write
[4]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-4-make-sysroot-your-root
[5]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-5-change-the-root-password
[6]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-6-load-selinux-policy
[7]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-7-set-context-type-on-etc-shadow-file
[8]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-8-exit-reboot
[9]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h1-objective
[10]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h2-requirements
[11]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h3-difficulty
[12]:https://linuxconfig.org/how-to-reset-the-root-password-in-rhel7-centos7-scientific-linux-7-based-systems#h4-instructions
