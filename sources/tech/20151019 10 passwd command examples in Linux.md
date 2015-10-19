10 passwd command examples in Linux
================================================================================
As the name suggest **passwd** command is used to change the password of system users. If the passwd command is executed by non-root user then it will ask for the current password and then set the new password of a user who invoked the command. When this command is executed by super user or root then it can reset the password for any user including root without knowing the current password.

In this post we will discuss passwd command with practical examples.

#### Syntax : ####

    # passwd {options} {user_name}

Different options that can be used in passwd command are listed below :

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-command-options.jpg)

### Example:1 Change Password of System Users ###

When you logged in as non-root user like ‘linuxtechi’ in my case and run passwd command then it will reset password of logged in user.

    [linuxtechi@linuxworld ~]$ passwd
    Changing password for user linuxtechi.
    Changing password for linuxtechi.
    (current) UNIX password:
    New password:
    Retype new password:
    passwd: all authentication tokens updated successfully.
    [linuxtechi@linuxworld ~]$

When you logged in as root user and run **passwd** command then it will reset the root password by default and if you specify the user-name after passwd command then it will change the password of that user.

    [root@linuxworld ~]# passwd
    [root@linuxworld ~]# passwd linuxtechi

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-command.jpg)

**Note** : System user’s password is stored in an encrypted form in /etc/shadow file.

### Example:2 Display Password Status Information. ###

To display password status information of a user , use **-S** option in passwd command.

    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 0 99999 7 -1 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

In the above output first field shows the user name and second field shows Password status ( **PS = Password Set , LK = Password locked , NP = No Password** ), third field shows when the password was changed and last & fourth field shows minimum age, maximum age, warning period, and inactivity period for the password

### Example:3 Display Password Status info for all the accounts ###

To display password status info for all the accounts use “**-aS**” option in passwd command, example is shown below :

    root@localhost:~# passwd -Sa

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-sa.jpg)

### Example:4 Removing Password of a User using -d option ###

In my case i am removing/ deleting the password of ‘**linuxtechi**‘ user.

    [root@linuxworld ~]# passwd -d linuxtechi
    Removing password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]#
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi NP 2015-09-20 0 99999 7 -1 (Empty password.)
    [root@linuxworld ~]#

“**-d**” option will make user’s password empty and will disable user’s account.

### Example:5 Set Password Expiry Immediately ###

Use ‘-e’ option in passwd command to expire user’s password immediately , this will force the user to change the password in the next login.

    [root@linuxworld ~]# passwd -e linuxtechi
    Expiring password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 1970-01-01 0 99999 7 -1 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

Now Try to ssh machine using linuxtechi user.

![](http://www.linuxtechi.com/wp-content/uploads/2015/09/passwd-expiry.jpg)

### Example:6 Lock the password of System User ###

Use ‘**-l**‘ option in passwd command to lock a user’s password, it will add “!” at starting of user’s password. A User can’t Change it’s password when his/her password is locked.

    [root@linuxworld ~]# passwd -l linuxtechi
    Locking password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi LK 2015-09-20 0 99999 7 -1 (Password locked.)
    [root@linuxworld ~]#

### Example:7 Unlock User’s Password using -u option ###

    [root@linuxworld ~]# passwd -u linuxtechi
    Unlocking password for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]#

### Example:8 Setting inactive days using -i option ###

-i option in passwd command is used to set inactive days for a system user. This will come into the picture when password of user ( in my case linuxtechi) expired and user didn’t change its password in ‘**n**‘ number of days ( i.e 10 days in my case)  then after that user will not able to login.

    [root@linuxworld ~]# passwd -i 10 linuxtechi
    Adjusting aging data for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]#
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 0 99999 7 10 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

### Example:9 Set Minimum Days to Change Password using -n option. ###

In the below example linuxtechi user has to change the password in 90 days. A value of zero shows that user can change it’s password in any time.

    [root@linuxworld ~]# passwd -n 90 linuxtechi
    Adjusting aging data for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 90 99999 7 10 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

### Example:10 Set Warning days before password expire using -w option ###

‘**-w**’ option in passwd command is used to set warning days for a user. It means a user will be warned for n number of days that his/her password is going to expire.

    [root@linuxworld ~]# passwd -w 12 linuxtechi
    Adjusting aging data for user linuxtechi.
    passwd: Success
    [root@linuxworld ~]# passwd -S linuxtechi
    linuxtechi PS 2015-09-20 90 99999 12 10 (Password set, SHA512 crypt.)
    [root@linuxworld ~]#

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/10-passwd-command-examples-in-linux/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/