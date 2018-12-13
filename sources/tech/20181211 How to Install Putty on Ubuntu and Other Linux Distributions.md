[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Putty on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/putty-linux/)
[#]: author: (Abhishek Prakash  https://itsfoss.com/author/abhishek/)

How to Install Putty on Ubuntu and Other Linux Distributions
======

If I am not wrong, [Putty][1] is perhaps the most popular SSH client for Windows.

In IT companies, the development environment is usually on a remote Linux system while the developers use Windows as their local system. Putty is used for connecting to the remote Linux system from the Windows machine.

Putty is not limited to Windows only. You can also use this open source software on Linux and macOS.

But wait! Why would you use a separate SSH client on Linux when you already have the ‘real’ Linux terminal with you? There are several reasons why you would want to use Putty on Linux.

  * You have used Putty for so long on Windows that you are more comfortable with it.
  * You find it difficult to manually edit SSH config file to save the various SSH sessions. You prefer Putty’s graphical way of storing SSH connection.
  * You want to debug by connecting to raw sockets and serial ports.



Whatever may be the reason, if you want to use Putty on Ubuntu or any other Linux, you can certainly do so. Let me show you how to do that.

### Installing Putty on Ubuntu Linux

![Installing Putty on Linux][2]

The good news for the Ubuntu users is that Putty is available in the universe repository of Ubuntu.

To install Putty on Ubuntu, you should first make sure that the universe repository is enabled.

```
sudo add-apt-repository universe
```

Once you have the universe repository enabled, you should update Ubuntu with this command:

```
sudo apt update
```

After this, you can install Putty with this command:

```
sudo apt install putty
```

Once installed, you can start Putty by finding it in the menu.

As you can see in the screenshot below, the Linux version of Putty looks the same as the Windows version. That’s a relief because you won’t have to fiddle around trying to find your way through a new and changed settings.

![Putty in Linux][3]

When you enter the remote system’s [hostname][4] or IP address and connect to it, Putty will utilize the already saved SSH keys in your home directory.

![Using Putty in Ubuntu Linux][5]

### Installing Putty on other Linux distributions

[Putty is available for Debian][6] so you just need to use apt-get or aptitude for installing it.

```
sudo apt-get install putty
```

Putty is also available for Fedora/Red Hat and can be installed using the default package manager.

```
sudo dnf install putty
```

You can also easily install Putty in Arch Linux based distributions.

```
sudo pacman -S putty
```

Remember that Putty is an open source software. You can also install it via source code if you really want to. You can get the source code of Putty from the link below.

[Download Putty Source Code][8]

I would always prefer the native Linux terminal over an SSH client like Putty. I feel more at home with the GNOME terminal or [Terminator][7]. However, it’s up to an individual’s choice to use the default terminal or Putty in Linux

What do you use for managing multiple SSH connections on Linux?

--------------------------------------------------------------------------------

via: https://itsfoss.com/putty-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:  https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.putty.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/Putty-linux.png?resize=800%2C450&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/putty-interface-ubuntu.jpeg?resize=800%2C503&ssl=1
[4]: https://itsfoss.com/change-hostname-ubuntu/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/putty-interface-ubuntu-1.jpeg?resize=800%2C430&ssl=1
[6]: https://packages.debian.org/jessie/putty
[7]: https://launchpad.net/terminator
[8]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
