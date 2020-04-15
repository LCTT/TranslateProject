[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Open Files and Folders as Administrator in Nautilus File Manager in Linux)
[#]: via: (https://itsfoss.com/open-nautilus-as-administrator/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Open Files and Folders as Administrator in Nautilus File Manager in Linux
======

_**Learn to add an “Open as Administrator” option in the right click context menu in Nautilus file manager in Ubuntu and other Linux distributions.**_

If you want to open or edit a file as root, you can always do that in the terminal. I know a few people don’t feel too comfortable with the command line.

The desktop Linux often provides ways to avoid the command line for terminal-fearing people.

If you are in a situation where you have to access a folder as root or edit a file with root privilege, you can do that graphically in [Nautilus file manager][1].

A neat Nautilus hack allows you to open a files and folders as administrator i.e. root. Let me show you how.

**Recommended Read:**

![][2]

#### [Root User in Ubuntu: Important Things You Should Know][3]

Root user is essential to any Linux distribution. Learn why Ubuntu locks the root user and how can you use it in this Ubuntu beginner series.

### Add ‘open as administrator’ option in right click context menu in Nautilus file manager

_**A word of warning! Please don’t go around opening and editing random files as root as you might mess up with wrong files and end up with a broken system. Use it only in the cases where it is required.**_

I am showing the installation steps for Ubuntu. You can change it as per your distribution’s package manager.

You’ll have to use terminal (even if you don’t like it) for installing the Nautilus plugin. Please [make sure that you have the universe repository enabled][4]:

```
sudo apt install nautilus-admin
```

Close and open Nautilus file manager again to see the changes in effect.

![Right clock to see the “Open as Administrator” option][5]

You can also edit files as root the same way. Just select the file, right click on it and choose the “Edit as Administrator” option.

![Edit Files As Root Ubuntu][6]

In both cases, you’ll be prompted to enter your account’s password:

![You need to enter your password, of course][7]

That’s pretty much it. You can enjoy the comfort of GUI.

In case you don’t want to run Nautilus as root anymore, you can remove this plugin. It’s always good to remove additional things you installed but you don’t use anymore.

In the terminal (yes, again), use the following command to remove the Nautilus plugin.

```
sudo apt remove nautilus-admin
```

By the way, if you are using [Ubuntu MATE][8], you can use caja-admin, instead of nautilus-admin. Other file managers may or may not provide such a feature.

I hope you find this quick tip helpful. Questions and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-nautilus-as-administrator/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Files
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/root_user_ubuntu.png?fit=800%2C450&ssl=1
[3]: https://itsfoss.com/root-user-ubuntu/
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/open-folder-as-administrator-ubuntu.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/edit-files-as-root-ubuntu.jpg?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/authentication-pop-up-ubuntu.png?ssl=1
[8]: https://ubuntu-mate.org/
