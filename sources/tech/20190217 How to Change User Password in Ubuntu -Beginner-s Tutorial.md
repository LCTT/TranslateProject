[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Change User Password in Ubuntu [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/change-password-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Change User Password in Ubuntu [Beginner’s Tutorial]
======

**Want to change root password in Ubuntu? Learn how to change the password for any user in Ubuntu Linux. Both terminal and GUI methods have been discussed.**

When do you need to change the password in Ubuntu? Let me give you a couple of scenarios.

When you install [Ubuntu][1], you create a user and set a password for it. It could be a weak password or perhaps a bit too complicated and you want to change it.

If you are a sysadmin, you may need to change the password for other users on your system.

You may have a few other reasons for doing this. Now the question comes, how to change the password for a user in Ubuntu or Linux?

In this quick tutorial, I’ll show you the command line and the GUI ways of changing passwords in Ubuntu.

### Change user password in Ubuntu [Command Line]

![How to change user password in Ubuntu Linux][2]

Changing user password in Ubuntu is dead simple. In fact, it’s the same with any Linu distribution because you use the generic Linux command called passwd for this purpose.

If you want to change your current password, simply run this command in a terminal:

```
passwd
```

You’ll be asked to enter your current password and the new password twice.

You won’t see anything on the screen while typing the password. This is perfectly normal behavior for UNIX and Linux.

```
passwd

Changing password for abhishek.

(current) UNIX password:

Enter new UNIX password:

Retype new UNIX password:

passwd: password updated successfully
```

Since this is your admin account, you just changed the sudo password in Ubuntu without even realizing it.

![Change user password in Linux command line][3]

If you want to change password for some other user, you can do that as well with the passwd command. But in this case, you’ll have to use sudo.

```
sudo passwd <user_name>
```

If you changed your password and forgot it later, don’t worry. You can [easily reset Ubuntu password][4].

### Change root password in Ubuntu

By default, the root user in Ubuntu doesn’t have a password. Don’t be surprised. You don’t use the root user in Ubuntu all the time. Confused? Let me explain it to you quickly.

While [installing Ubuntu][5], you are forced to create a user. This user has admin access. This admin user can gain root access using the sudo command. But it uses its own password, not the root account’s password (because there is none).

You can set or change root password using the **passwd** command. However, in most cases, you don’t need it and you shouldn’t be doing it.

You’ll have to use sudo (with an account with admin privileges). If the root password has no password set up previously, it will ask you to set it up. Else, you can change it using the existing root password.

```
sudo password root
```

### Change Ubuntu password using GUI

I have used GNOME desktop with Ubuntu 18.04 here. The steps should be more or less the same for other desktop environments and Ubuntu versions.

Go to Menu (press Windows/Super key) and search for Settings.

In the Settings, scroll down a bit and go to Details.

![Go to details in Ubuntu GNOME settings][6]

In here, click on Users to access all the available users on your system.

![Users settings in Ubuntu][7]

You can select any user you want, including your main admin account. You need to unlock the users first and then click the password field.

![Changing user password in Ubuntu][8]

You’ll be asked to set the password. If you are changing your own password, you’ll have to enter your current password as well.

![Changing user password in Ubuntu][9]

Once done, click on the Change button on the top. That’s it. You have successfully changed user password in Ubuntu.

I hope this quick little tip helped you to change user password in Ubuntu. If you have questions or suggestions, please leave a comment below.


--------------------------------------------------------------------------------

via: https://itsfoss.com/change-password-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-password-ubuntu-linux.png?resize=800%2C450&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-linux-1.jpg?resize=800%2C253&ssl=1
[4]: https://itsfoss.com/how-to-hack-ubuntu-password/
[5]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-2.jpg?resize=800%2C484&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-3.jpg?resize=800%2C488&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-4.jpg?resize=800%2C555&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-user-password-ubuntu-gui-1.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/change-password-ubuntu-linux.png?fit=800%2C450&ssl=1
