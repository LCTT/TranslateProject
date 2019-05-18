[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installing Budgie Desktop on Ubuntu [Quick Guide])
[#]: via: (https://itsfoss.com/install-budgie-ubuntu/)
[#]: author: (Atharva Lele https://itsfoss.com/author/atharva/)

Installing Budgie Desktop on Ubuntu [Quick Guide]
======

_**Brief: Learn how to install Budgie desktop on Ubuntu in this step-by-step tutorial.**_

Among all the [various Ubuntu versions][1], [Ubuntu Budgie][2] is the most underrated one. It looks elegant and it’s not heavy on resources.

Read this [Ubuntu Budgie review][3] or simply watch this video to see what Ubuntu Budgie 18.04 looks like.

[Subscribe to our YouTube channel for more Linux Videos][4]

If you like [Budgie desktop][5] but you are using some other version of Ubuntu such as the default Ubuntu with GNOME desktop, I have good news for you. You can install Budgie on your current Ubuntu system and switch the desktop environments.

In this post, I’m going to tell you exactly how to do that. But first, a little introduction to Budgie for those who are unaware about it.

Budgie desktop environment is developed mainly by [Solus Linux team.][6] It is designed with focus on elegance and modern usage. Budgie is available for all major Linux distributions for users to try and experience this new desktop environment. Budgie is pretty mature by now and provides a great desktop experience.

Warning

Installing multiple desktops on the same system MAY result in conflicts and you may see some issue like missing icons in the panel or multiple icons of the same program.

You may not see any issue at all as well. It’s your call if you want to try different desktop.

### Install Budgie on Ubuntu

This method is not tested on Linux Mint, so I recommend that you not follow this guide for Mint.

For those on Ubuntu, Budgie is now a part of the Ubuntu repositories by default. Hence, we don’t need to add any PPAs in order to get Budgie.

To install Budgie, simply run this command in terminal. We’ll first make sure that the system is fully updated.

```
sudo apt update && sudo apt upgrade
sudo apt install ubuntu-budgie-desktop
```

When everything is done downloading, you will get a prompt to choose your display manager. Select ‘lightdm’ to get the full Budgie experience.

![Select lightdm][7]

After the installation is complete, reboot your computer. You will be then greeted by the Budgie login screen. Enter your password to go into the homescreen.

![Budgie Desktop Home][8]

### Switching to other desktop environments

![Budgie login screen][9]

You can click the Budgie icon next to your name to get options for login. From there you can select between the installed Desktop Environments (DEs). In my case, I see Budgie and the default Ubuntu (GNOME) DEs.

![Select your DE][10]

Hence whenever you feel like logging into GNOME, you can do so using this menu.

[][11]

Suggested read Get Rid of 'snapd returned status code 400: Bad Request' Error in Ubuntu

### How to Remove Budgie

If you don’t like Budgie or just want to go back to your regular old Ubuntu, you can switch back to your regular desktop as described in the above section.

However, if you really want to remove Budgie and its component, you can follow the following commands to get back to a clean slate.

_**Switch to some other desktop environments before using these commands:**_

```
sudo apt remove ubuntu-budgie-desktop ubuntu-budgie* lightdm
sudo apt autoremove
sudo apt install --reinstall gdm3
```

After running all the commands successfully, reboot your computer.

Now, you will be back to GNOME or whichever desktop environment you had.

**What you think of Budgie?**

Budgie is one of the [best desktop environments for Linux][12]. Hope this short guide helped you install the awesome Budgie desktop on your Ubuntu system.

If you did install Budgie, what do you like about it the most? Let us know in the comments below. And as usual, any questions or suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-budgie-ubuntu/

作者：[Atharva Lele][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/atharva/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/which-ubuntu-install/
[2]: https://ubuntubudgie.org/
[3]: https://itsfoss.com/ubuntu-budgie-18-review/
[4]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]: https://github.com/solus-project/budgie-desktop
[6]: https://getsol.us/home/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_install_select_dm.png?fit=800%2C559&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_homescreen.jpg?fit=800%2C500&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_install_lockscreen.png?fit=800%2C403&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/budgie_install_lockscreen_select_de.png?fit=800%2C403&ssl=1
[11]: https://itsfoss.com/snapd-error-ubuntu/
[12]: https://itsfoss.com/best-linux-desktop-environments/
