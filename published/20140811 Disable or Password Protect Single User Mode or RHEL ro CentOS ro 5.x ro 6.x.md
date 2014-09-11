在RHEL / CentOS / 5.x / 6.x上用密码保护单用户模式
================================================================================
大家好，如果您还没有使用密码保护单用户模式，这对你的Linux服务器会是一个很大的风险，所以在涉及到安全性时，使用密码保护单用户模式是非常重要的。

今天这篇文章我会向你展示如何在RHEL / CentOS 5.x 和 RHEL / CentOS 6.x上使用密码保护你的单用户模式。

请仔细地执行所给出的命令，不然你的系统将会无法正常启动。首先，我会请你先完整地读完，然后在尝试。请自己承担相应的后果:-) 

![Password Protect](http://www.tejasbarot.com/wp-content/uploads//password-300x140.jpg)

<small>Password Protect</small>

### 1. 对于 RHEL / CentOS 5.x ###

#### 1.1 开始之前请先备份你的 /etc/inittab ####

    cp /etc/inittab /etc/inittab.backup

**要使单用户模式受到密码保护，用root执行下面的命令 :-**

    [root@tejas-barot-linux ~]# sed -i '1i  su:S:wait:/sbin/sulogin' /etc/inittab

**这样你会看到像下面这样的**

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

*NOTE: 如果你不想使用sed命令你可以在/etc/inittab 顶部加入 “su:S:wait:/sbin/sulogin”*

### 2. 对于 RHEL / CentOS 6.x ###

#### 2.1 开始之前请先备份你的 /etc/inittab####

    cp /etc/sysconfig/init /etc/sysconfig/init.backup

#### 2.2 要使单用户模式受到密码保护，用root执行下面的命令 :- ####

    [root@tejas-barot-linux ~]# sed -i 's/SINGLE=\/sbin\/sushell/SINGLE=\/sbin\/sulogin/' /etc/sysconfig/init

**这样你会看到像下面这样的**

    SINGLE=/sbin/sulogin

*注意 :- 如果你不想使用sed你可以在 /etc/sysconfig/init 中直接改成 “SINGLE=/sbin/sulogin”*

享受Linux :) 享受开源

--------------------------------------------------------------------------------

via: http://www.tejasbarot.com/2014/05/05/disable-password-protect-single-user-mode-rhel-centos-5-x-6-x/

作者：[Tejas Barot][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/+TejasBarot