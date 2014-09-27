[su-kaiyao]翻译中

How To Reset Root Password On CentOS 7
================================================================================
The way to reset the root password on centos7 is totally different to Centos 6. Let me show you how to reset root password in CentOS 7.

1 – In the boot grub menu select option to edit.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_003.png)

2 – Select Option to edit (e).

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_005.png)

3 – Go to the line of Linux 16 and change ro with rw init=/sysroot/bin/sh.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_006.png)

4 – Now press Control+x to start on single user mode.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/Selection_007.png)

5 – Now access the system with this command.

    chroot /sysroot

6 – Reset the password.

    passwd root

7 – Update selinux information

    touch /.autorelabel

8 – Exit chroot

    exit

9 – Reboot your system

    reboot

That’s it. Enjoy.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/reset-root-password-centos-7/

作者：M.el Khamlichi
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
