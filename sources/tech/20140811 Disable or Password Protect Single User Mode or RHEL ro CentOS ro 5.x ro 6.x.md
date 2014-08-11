Disable / Password Protect Single User Mode / RHEL / CentOS / 5.x / 6.x
================================================================================
Hello All,

If you have not protected Single User Mode with Password then it is big risk for your Linux Server, So protecting Single User Mode with Password is very important when it comes to security,

Today in this article i will show you how you can protect Single User Mode with Password on RHEL / CentOS 5.x and RHEL / CentOS 6.x.

Please execute given commands carefully else your system will not boot properly. First i would request you to read full procedure and then try to follow. Do it at your own risk :-) 

![Password Protect](http://www.tejasbarot.com/wp-content/uploads//password-300x140.jpg)
Password Protect

### 1. For RHEL / CentOS 5.x ###

#### 1.1 Before doing anything please take backup of your /etc/inittab ####

    cp /etc/inittab /etc/inittab.backup

**To Disable and Make Single User Mode Password Protected, Execute below command as root :-**

    [root@tejas-barot-linux ~]$ sed -i '1i  su:S:wait:/sbin/sulogin'

**So It will look like below**

    su:S:wait:/sbin/sulogin
    # Default runlevel. The runlevels used by RHS are:
    # 0 - halt (Do NOT set initdefault to this)
    # 1 - Single user mode
    # 2 - Multiuser, without NFS (The same as 3, if you do not have networking)
    # 3 - Full multiuser mode
    # 4 - unused
    # 5 - X11
    # 6 - reboot (Do NOT set initdefault to this)
    #
    id:3:initdefault:

*NOTE: If you do not want to use sed command then You can always add “su:S:wait:/sbin/sulogin” at top in /etc/inittab*

### 2. For RHEL / CentOS 6.x ###

#### 2.1 Before doing anything please take backup of your /etc/inittab ####

    cp /etc/sysconfig/init /etc/sysconfig/init.backup

#### 2.2 To Disable and Make Single User Mode Password Protected, Execute below command as root :- ####

    [root@tejas-barot-linux ~]$#sed -i 's/SINGLE=\/sbin\/sushell/SINGLE=\/sbin\/sulogin/' /etc/sysconfig/init

**So It will look like below**

    SINGLE=/sbin/sulogin

*NOTE :- If you do not want to use sed command then You can always change to “SINGLE=/sbin/sulogin” in /etc/sysconfig/init*

Enjoy Linux :) Enjoy Open Source

--------------------------------------------------------------------------------

via: http://www.tejasbarot.com/2014/05/05/disable-password-protect-single-user-mode-rhel-centos-5-x-6-x/#axzz39oGCBRuX

作者：[Tejas Barot][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/+TejasBarot