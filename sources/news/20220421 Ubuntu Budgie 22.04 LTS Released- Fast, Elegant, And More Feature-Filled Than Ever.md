[#]: subject: "Ubuntu Budgie 22.04 LTS Released: Fast, Elegant, And More Feature-Filled Than Ever"
[#]: via: "https://news.itsfoss.com/ubuntu-budgie-22-04-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Budgie 22.04 LTS Released: Fast, Elegant, And More Feature-Filled Than Ever
======

Since its initial release in 2016, I’ve been an admirer of Ubuntu Budgie. With its sleek visuals, fluid animations, and solid Ubuntu base, it covers all my needs.

Although it is relatively new compared to other Ubuntu flavors, it has already managed to gain a significant following.

Now, with Ubuntu Budgie 22.04 LTS, this level of polish has been brought to a whole new level.

### What’s New?

![][1]

As to be expected, there are vast numbers of improvements compared to the previous 20.04 LTS release. Some changes include:

  * The newly released [Budgie 10.6][2]
  * budgie-applications-menu-applet improvements
  * New hot corners “delay” and “pressure” options
  * Panel spacing improvements
  * RISCV64 support
  * Theme updates from upstream
  * New Chrome OS-like layout



You can expect updates for Ubuntu Budgie 22.04 up until 2025.

#### Budgie 10.6 Desktop

![][3]

Ubuntu Budgie 22.04 now ships with Budgie 10.6. As I highlighted in [our coverage][2] of the release, it is the first one under its new organization. In short, Joshua Strobl left the Solus distribution but still wanted to work on Budgie.

![][4]

To facilitate this, he forked the Budgie repository and formed the **Buddies of Budgie** organization, which now maintains and develops budgie.

Due to all of these changes, Budgie 10.6 wasn’t a massive release, although it did bring a new notification system, alongside some minor code reformatting. As a result, other Budgie components can now use the notification system, opening up some interesting future options.

![][5]

Of course, Ubuntu Budgie 22.04 inherits these changes, and it will be interesting to see what they do with them in future releases.

#### App Menu Improvements

![][6]

Ubuntu Budgie 22.04 also has a few improvements to the application menu. One of my favorite features of the app menu is its fast search, which has now been improved. This comes in the form of the availability of the app context menu in the search results.

Additionally, the menu now also supports the non-default GPU flag from .desktop files. This is particularly useful for laptop users, as it allows simpler apps to use significantly less power. This is extended with a new context menu option, which allows users to easily change this option in the GUI.

Finally, the categories should now be more inclusive, meaning, fewer apps end up in the “**Other**” category.

As a laptop user, I have really been enjoying the extra battery life these changes have afforded me, and I’m sure many of you will appreciate these changes too.

#### RISC-V Support

This improvement is extremely exciting. For those of you that are unaware, RISC-V is a fully open-source CPU architecture (think x86 and ARM) that is slowly becoming quite popular. As such, it is only a matter of time before we find these CPUs making their way into desktops and laptops (like what we have seen with ARM chips).

For this, Ubuntu Budgie now has support for this exciting architecture, although there is no pre-built disk image available. Instead, Ubuntu Server must be installed first, with the user than installing the `ubuntu-budgie-desktop` package.

Although the installation process is not for new users, this addition paves the way for support for the next generation of CPUs.

#### Theme Updates

![][7]

Another major highlight in Ubuntu Budgie 22.04 is the numerous theme updates. Firstly, the beautiful Arc theme has been updated with GTK 4 support, ready for apps transitioning from GTK 3. Of course, this doesn’t affect Libadwaita apps, which you can read about why in our [in-depth coverage][8].

![][9]

The WhiteSur GTK and icon themes have been updated for macOS fans, with support for more apps and more accurate visuals.

Finally, the default Pocillo theme has been updated with more app icons.

You can learn more about the technical changes in the [official release notes][10].

### Getting Ubuntu Budgie 22.04

For the first time, you might want to try Ubuntu Budgie 22.04 on a virtual machine to see how it goes.

If you already have Ubuntu Budgie installed, upgrading is extremely simple. Simply copy the following command into the terminal, and follow the on-screen prompts. You may have to wait for a few days if the upgrade isn’t available yet.

```

    sudo do-release-upgrade -d -f DistUpgradeViewGtk3

```

For new users, just download the ISO file from the button below.

[Get Ubuntu Budgie 22.04 LTS][11]

Overall, Ubuntu Budgie is a great upgrade to an already awesome distro. Between the updated budgie version, RISC V support, and theme updates, Ubuntu Budgie continues to be a competitive alternative to other Ubuntu flavors.

_What are your thoughts on this release? Feel free to share them in the comments section below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-budgie-22-04-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY4MSIgd2lkdGg9IjEzNDciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[2]: https://news.itsfoss.com/budgie-10-6-release/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY3NSIgd2lkdGg9IjEyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI3NyIgd2lkdGg9IjQ5OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxNiIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY4MSIgd2lkdGg9IjEzNTUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgd2lkdGg9IjgwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://news.itsfoss.com/gnome-libadwaita-library/
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxNyIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[10]: https://ubuntubudgie.org/2022/03/ubuntu-budgie-22-04-lts-release-notes/
[11]: https://ubuntubudgie.org/downloads/
