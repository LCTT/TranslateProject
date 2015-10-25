
在 Linux 中 passwd 命令的10个示例
================================================================================

正如 **passwd** 命令的名称所示，其用于改变系统用户的密码。如果 passwd 命令由非 root 用户执行，那么它会询问当前用户的密码，然后设置调用命令用户的新密码。当此命令由超级用户 root 执行的话，就可以重新设置任何用户的密码，包括不知道当前密码的用户。

在这篇文章中，我们将讨论 passwd 命令实际的例子。

#### 语法 : ####

    # passwd {options} {user_name}

可以在 passwd 命令使用不同的选项，列表如下：

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-command-options.jpg)

### 例1：更改系统用户的密码 ###

当你使用非 root 用户登录时，像我使用 ‘linuxtechi’ 登录的情况下，运行 passwd 命令它会重置当前登录用户的密码。

    [linuxtechi@linuxworld ~]$ passwd
    Changing password for user linuxtechi.
    Changing password for linuxtechi.
    (current) UNIX password:
    New password:
    Retype new password:
    passwd: all authentication tokens updated successfully.
    [linuxtechi@linuxworld ~]$

当你作为 root 用户登录后并运行 **passwd** 命令时，它默认情况下会重新设置 root 的密码，如果你在 passwd 命令后指定了用户名，它会重置该用户的密码。

    [root@linuxworld ~]# passwd
    [root@linuxworld ~]# passwd linuxtechi

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-command.jpg)

**注意** : 系统用户的密码以加密的形式保存在 /etc/shadow 文件中。

### 例2：显示密码状态信息 ###

要显示用户密码的状态信息，请在 passwd 命令后使用 **-S** 选项。

    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 0 99999 7 -1 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

在上面的输出中，第一个字段显示的用户名，第二个字段显示密码状态（**PS = 密码设置，LK = 密码锁定，NP = 无密码**），第三个字段显示了当密码被改变，后面的字段分别显示了密码能更改的最小期限和最大期限，超过更改期能使用的最大期限，最后的为过期禁用天数。

### 例3：显示所有账号的密码状态信息 ###

为了显示所有用户密码的状态信息需要使用 “**-aS**”选项在passwd 命令中，示例如下所示：

    root@localhost:~# passwd -Sa

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-sa.jpg)

（LCTT译注：CentOS6.6 没有测试成功，但 Ubuntu 可以。）

### 例4：使用 -d 选项删除用户的密码 ###

就我而言，我删除 ‘**linuxtechi**‘ 用户的密码。

    [root@linuxworld ~]# passwd -d linuxtechi
    Removing password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]#
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi NP 2015-09-20 0 99999 7 -1 (Empty password.)
    [root@linuxworld ~]#

“**-d**” 选项将使用户的密码为空，并禁用用户登录。

### 例5：设置密码立即过期 ###

在 passwd 命令中使用 '-e' 选项会立即使用户的密码过期，这将强制用户在下次登录时更改密码。

    [root@linuxworld ~]# passwd -e linuxtechi
    Expiring password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 1970-01-01 0 99999 7 -1 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

现在尝试用 linuxtechi 用户 SSH 到主机。

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-expiry.jpg)

### 例6：锁定系统用户的密码 ###

在 passwd 命令中使用 ‘**-l**‘ 选项能锁定用户的密码，它会在密码的起始位置加上“！”。当他/她的密码被锁定时，用户将不能更改它的密码。

    [root@linuxworld ~]# passwd -l linuxtechi
    Locking password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi LK 2015-09-20 0 99999 7 -1 (Password locked.)
    [root@linuxworld ~]#

### 例7：使用 -u 选项解锁用户密码 ###

    [root@linuxworld ~]# passwd -u linuxtechi
    Unlocking password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]#

### 例8：使用 -i 选项设置非活动时间 ###

在 passwd 命令中使用 -i 选项用于设系统用户的非活动时间。当用户（我使用的是linuxtechi用户）密码过期后，用户再经过 ‘**n**‘ 天后（在我的情况下是10天）没有更改其密码，用户将不能登录。

    [root@linuxworld ~]# passwd -i 10 linuxtechi
    Adjusting aging data for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]#
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 0 99999 7 10 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

### 例9：使用 -n 选项设置密码更改的最短时间 ###

在下面的例子中，linuxtechi用户必须在90天内更改密码。0表示用户可以在任何时候更改它的密码。

    [root@linuxworld ~]# passwd -n 90 linuxtechi
    Adjusting aging data for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 90 99999 7 10 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

### 例10：使用 -w 选项设置密码过期前的警告期限 ###

‘**-w**’ 选项在 passwd 命令中用于设置用户的警告期限。这意味着，n天之后，他/她的密码将过期。

    [root@linuxworld ~]# passwd -w 12 linuxtechi
    Adjusting aging data for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 90 99999 12 10 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/10-passwd-command-examples-in-linux/

作者：[Pradeep Kumar][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
