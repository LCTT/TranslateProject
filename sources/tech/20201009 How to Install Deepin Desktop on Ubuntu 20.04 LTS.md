[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Deepin Desktop on Ubuntu 20.04 LTS)
[#]: via: (https://itsfoss.com/install-deepin-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

How to Install Deepin Desktop on Ubuntu 20.04 LTS
======

_**This tutorial shows you the proper steps to install the Deepin desktop environment on Ubuntu. Removal steps are also mentioned.**_

Deepin is undoubtedly a [beautiful Linux distribution][1]. The recently released [Deepin version 20][2] makes it even more beautiful.

Now, [Deepin Linux][3] is based on [Debian][4] and the default repository mirrors are too slow. If you would rather stay with Ubuntu, you have the Deepin variant of Ubuntu in the form [UbuntuDDE Linux distribution][5]. It is not one of the [official Ubuntu flavors][6] yet.

[Reinstalling a new distribution][7] is a bit of annoyances for you would lose the data and you’ll have to reinstall your applications on the newly installed UbuntuDDE.

A simpler option is to install Deepin desktop environment on your existing Ubuntu system. After all you can easily install more than one [desktop environment][8] in one system.

Fret not, it is easy to do it and you can also revert the changes if you do not like it. Let me show you how to do that.

### Installing Deepin Desktop on Ubuntu 20.04

![][9]

The UbuntuDDE team has created a PPA for their distribution and you can use the same PPA to install Deepin desktop on Ubuntu 20.04. Keep in mind that this PPA is only available for Ubuntu 20.04. Please read about [using PPA in Ubuntu][10].

No Deepin version 20

The Deepin desktop you’ll be installing using the PPA here is NOT the new Deepin desktop version 20 yet. It will probably be there after Ubuntu 20.10 release but we cannot promise anything.

Here are the steps that you need to follow:

**Step 1**: You need to first add the [official PPA by Ubuntu DDE Remix team][11] by typing this on the terminal:

```
sudo add-apt-repository ppa:ubuntudde-dev/stable
```

**Step 2**: Once you have added the repository, proceed with installing the Deepin desktop.

```
sudo apt install ubuntudde-dde
```

![][12]

Now, the installation will start and after a while, you will be asked to choose the display manager.

![][13]

You need to select “**lightdm**” if you want Deepin desktop themed lock screen. If not, you can set it as “**gdm3**“.

In case you don’t see this option, you can get it by typing the following command and then select your preferred display manager:

```
sudo dpkg-reconfigure lightdm
```

**Step 3:** Once done, you have to log out and log in again by choosing the “**Deepin**” session or just reboot the system.

![][14]

And, that is it. Enjoy the Deepin experience on your Ubuntu 20.04 LTS system in no time!

![][15]

### Removing Deepin desktop from Ubuntu 20.04

In case, you don’t like the experience or of it is buggy for some reason, you can remove it by following the steps below.

**Step 1:** If you’ve set “lightdm” as your display manager, you need to set the display manager as “gdm3” before uninstalling Deepin. To do that, type in the following command:

```
sudo dpkg-reconfigure lightdm
```

![Select gdm3 on this screen][13]

And, select **gdm3** to proceed.

Once you’re done with that, you can simply enter the following command to remove Deepin completely:

```
sudo apt remove startdde ubuntudde-dde
```

You can just reboot to get back to your original Ubuntu desktop. In case the icons become unresponsive, you just open the terminal (**CTRL + ALT + T**) and type in:

```
reboot
```

**Wrapping Up**

It is good to have different [choices of desktop environments][16]. If you really like Deepin desktop interface, this could be a way to experience Deepin on Ubuntu.

If you have questions or if you face any issues, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-deepin-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/beautiful-linux-distributions/
[2]: https://itsfoss.com/deepin-20-review/
[3]: https://www.deepin.org/en/
[4]: https://www.debian.org/
[5]: https://itsfoss.com/ubuntudde/
[6]: https://itsfoss.com/which-ubuntu-install/
[7]: https://itsfoss.com/reinstall-ubuntu/
[8]: https://itsfoss.com/what-is-desktop-environment/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/ubuntu-20-with-deepin.jpg?resize=800%2C386&ssl=1
[10]: https://itsfoss.com/ppa-guide/
[11]: https://launchpad.net/~ubuntudde-dev/+archive/ubuntu/stable
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-desktop-install.png?resize=800%2C534&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-display-manager.jpg?resize=800%2C521&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-session-ubuntu.jpg?resize=800%2C414&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/ubuntu-20-with-deepin-1.png?resize=800%2C589&ssl=1
[16]: https://itsfoss.com/best-linux-desktop-environments/
