[#]: subject: "How to Install Discord on Manjaro and Other Arch Linux Derivatives"
[#]: via: "https://itsfoss.com/install-discord-arch-manjaro/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Discord on Manjaro and Other Arch Linux Derivatives
======

[Discord][1] is a cross-platform application that can be used for voice calling, video calling, text messaging, and sharing media and files.

It is extremely popular among gamers and streamers. Although, many open source projects have started using it for hosting their community discussion. You can find [official Discord servers][2] for such open source communities.

Discord can be accessed straight from your web browser. Installing the official desktop client gives you system notifications and focused communication rather than fumbling for the Discord tab among multiple opened tabs.

While Discord provides Deb files for Ubuntu, there is no such ready-to-use package for Arch Linux.

Fret not. In this tutorial, I will show you two methods to install Discord on [Arch Linux][3] and its derivatives.

* Installing Discord via [Pacman][4] (CLI method, valid for all Arch-based distributions)
* Installing Discord via [Pamac][5] (GUI method, valid for Manjaro and some other Arch-based distros that use Pamac tool)

### Method 1: Installing Discord via pacman command

First, update your system as it is a rolling release distribution and [do not support partial upgrades][6].

Enter the following [pacman command][7] in the terminal to [update your Arch Linux system][8].

```
sudo pacman -Syu
```

Now you can install Discord package via the following command.

```
sudo pacman -S discord
```

Once installed, just launch the application from the application menu and login to start using Discord.

![Discord client in Arch Linux][9]

**If you want to install the Nightly version of Discord** to test upcoming new features, use the following command. Do note that it may not be stable so think again if you want this version.

```
sudo pacman -S discord-canary
```

#### Removing Discord

If you want to remove Discord, use the command below to remove it along with its dependencies and configuration files:

```
sudo pacman -Rns discord
```

If you had opted for the Nightly version, remove it using:

```
sudo pacman -Rns discord-canary
```

That’s neat. Now for folks who dislike using the terminal, there is an alternative. I will discuss that in the next section.

### Method 2: Installing Discord via Pamac

If you are using Arch Linux derivatives like [Manjaro Linux][10], [Garuda Linux][11], etc you have a graphical software center called Pamac.

With this graphical tool, you can easily install new applications or remove existing ones without going into the terminal.

Launch Pamac (Add/Remove Software) from the application menu.

![pamac menu][12]

Click on Updates to update your system.

![pamac update][13]

Now click on Browse and search for discord using the search button on the top left. Then, select the package and click apply to install.

![Installing Discord from Pamac][14]

You can use Pamac to uninstall the package the same way you installed it.

I hope you find this quick tip on installing Discord on Arch-based Linux distros helpful. Let me know if you have any questions or suggestions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-discord-arch-manjaro/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://discord.com/
[2]: https://discord.com/open-source
[3]: https://archlinux.org/
[4]: https://archlinux.org/pacman/
[5]: https://gitlab.manjaro.org/applications/pamac
[6]: https://wiki.archlinux.org/title/System_maintenance#Partial_upgrades_are_unsupported
[7]: https://itsfoss.com/pacman-command/
[8]: https://itsfoss.com/update-arch-linux/
[9]: https://itsfoss.com/wp-content/uploads/2022/06/discord.png
[10]: https://manjaro.org/
[11]: https://garudalinux.org/
[12]: https://itsfoss.com/wp-content/uploads/2022/06/pamac-menu.png
[13]: https://itsfoss.com/wp-content/uploads/2022/06/pamac-update.png
[14]: https://itsfoss.com/wp-content/uploads/2022/06/pamac-discord.png
