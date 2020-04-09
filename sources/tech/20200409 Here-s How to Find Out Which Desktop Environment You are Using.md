[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Here’s How to Find Out Which Desktop Environment You are Using)
[#]: via: (https://itsfoss.com/find-desktop-environment/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Here’s How to Find Out Which Desktop Environment You are Using
======

If you are a new Linux user and seeking help in one of the Linux forums, you may be asked this question:

_**“Which desktop environment are you using?”**_

You have an idea about what a desktop environment is but how do you know which one are you using? I’ll tell you how to find it out. I’ll show the command line method first because that is applicable to [all kind of Linux distributions][1]. I’ll also show the graphical way of getting this information.

### Check which desktop environment you are using

![][2]

You can [use the echo command in Linux][3] to display the value of XDG_CURRENT_DESKTOP variable in the terminal.

Open the terminal and copy paste this command:

```
echo $XDG_CURRENT_DESKTOP
```

For example, it shows that I am using [GNOME desktop][4] in [Ubuntu 20.04][5]:

```
[email protected]:~$ echo $XDG_CURRENT_DESKTOP
ubuntu:GNOME
```

While this command quickly tells you which desktop environment is being used, it doesn’t give any other information.

Knowing the version of desktop environment (also called DE) could be important in some cases. Each new version of a software brings new features or removes some. [GNOME 3.36][6] introduces a ‘Do Not Disturb’ option to toggle off all the desktop notifications.

Suppose you read about this new Do Not Disturb feature. You verify that you are using GNOME and yet you don’t see this option in your GNOME desktop. If you could check the GNOME desktop version you have installed on your system, that could make things clear for you.

I’ll show you the commands to check the desktop environment’s version first because you can use it in any Linux, running desktop environment.

### How to get desktop environment version

Unlike getting the name of desktop environment. getting its version number is not straightforward because there is no standard command or environment variable that could give this information.

One way to get the desktop environment information in Linux is by using a tool like [Screenfetch][7]. This [command line tool displays the logo of your Linux distribution in ascii format][8] along with a few basic system information. Desktop environment version is one of them.

In Ubuntu based distributions, you can install Screenfetch by [enabling Universe repository][9] and then using this command:

```
sudo apt install screenfetch
```

For other Linux distributions, please use your system’s package manager to install this program.

Once installed, simply type screenfetch in the terminal and it should show the desktop environment version along with other system information.

![Check Desktop Environment Version][10]

As you can see in the above image, my system is using GNOME 3.36.1 (basically GNOME 3.36). You can also [check the Linux kernel version][11] and other details here.

Please keep in mind that it is not necessary that Screenfetch will display the desktop environment version. I checked its source code and it has lots of if-else code to get the version information from a number of sources and parameters in various desktop environments. If it can find nothing on version, it just displays the DE name.

### Using GUI to check desktop environment version

Almost all desktop environments provide basic system details in their Settings-About section.

The one major problem is that most DEs look different and thus I cannot show the exact steps for each of them. I am going to show it for GNOME and I let you discover it in your desktop.

So, search for Settings in the menu (press Windows key and search):

![Search for Settings application][12]

In here, go to the bottom to find the About section. Click on it and you should have the desktop environment along with its version.

![Check Desktop Environment in Ubuntu][13]

As you can see, it shows that my system is using GNOME 3.36.

I hope you find this quick beginner tip useful. If you have questions or suggestions, please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/find-desktop-environment/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/check-desktop-environment.jpg?ssl=1
[3]: https://linuxhandbook.com/echo-command/
[4]: https://www.gnome.org/
[5]: https://itsfoss.com/ubuntu-20-04-release-features/
[6]: https://itsfoss.com/gnome-3-36-release/
[7]: https://github.com/KittyKatt/screenFetch
[8]: https://itsfoss.com/display-linux-logo-in-ascii/
[9]: https://itsfoss.com/ubuntu-repositories/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/check-desktop-environment-version.jpg?ssl=1
[11]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/applications_menu_settings.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/check-desktop-environment-ubuntu.jpg?ssl=1
