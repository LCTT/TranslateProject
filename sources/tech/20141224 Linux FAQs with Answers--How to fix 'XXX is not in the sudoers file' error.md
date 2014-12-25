Linux有问必答时间--怎样解决“XXX is not in the sudoers file”错误
================================================================================
> **问题**:我想在我的Linux系统上使用sudo来运行一些特权命令，然而当我试图这么做时，我却得到了"[我的用户ID] is not in the sudoers file. This incident will be reported."的错误信息。我该怎么处理这种sudo错误呢？ 

sudo是一个允许特定的用户组用另一个用户(典型的代表是root)的特权来运行一个命令。sudo有详细的日志功能并且提供了细粒度控制 comes with detailed logging capability, and offers finer granular control over which user can type what commands via sudo.

### Sudo vs. Su ###

su命令也提供了同样的特权升级功能，两者不同的是它们认证过程和特权变化的粒度。su allows you to switch your login session to another user's, where you can then run any arbitrary programs with the user's privilege as many times as you want. You will have to know the target user's password to switch to the user though. On the other hand, sudo works on a per-command basis, allowing you to run a single command with root privilege. To use sudo, you don't have to know the root password, but enter your own password at sudo password prompt.

### Add a User to Sudoers List ###

As a new user, if you attempt to run sudo command, you will encounter the following error. This means that you are not in the sudoers list which contains a group of users who are authorized to use sudo.

    [my-user-id] is not in the sudoers file.  This incident will be reported.

There are two ways to add you to sudoers list.

### Metho One ###

The first method is to add you to the Linux group named sudo. This special Linux group is pre-configured to be able to use sudo. Thus once you are in the group, you can run sudo command.

The following command will add you to sudo Linux group. Make sure to run the command as the root.

    # adduser <username> sudo

Now confirm that your group membership has been updated. Use groups command to see a list of groups you currently belong to. The list must include sudo group.

    $ groups 

----------

    alice adm cdrom sudo dip plugdev fuse lpadmin netdev sambashare davfs2 libvirtd docker promiscuous

he group membership change (and sudo access) will be activated once you log out and log back in.

### Metho Two ###

The second method to enable you to use sudo is to add yourself to /etc/sudoers configuration file directly.

To change /etc/sudoers file, you can use a special sudo editor command called visudo. Simply invoke the following command as the root.

    # visudo 

This will open up /etc/sudoers file for editing. Append the following line to the end of the file, and press Ctrl+X. When prompted, save the change, and exit.

    <username> ALL=(ALL) ALL

This change will be effective immediately, and you will be able to use sudo right away.

![](https://farm8.staticflickr.com/7511/15866443418_e147329e1b_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-is-not-in-the-sudoers-file.html

译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
