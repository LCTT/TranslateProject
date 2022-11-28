[#]: subject: "The Ultimate Guide to Epic Games Store on Linux"
[#]: via: "https://itsfoss.com/epic-games-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Ultimate Guide to Epic Games Store on Linux
======
Epic Games Store is gaining more attention than ever, with some exclusive releases, and attractive discounts for PC gamers.

While I still prefer Steam to Epic Games Store (or EGS) because the client is superior, and it officially works on Linux without any workarounds.

Unfortunately, games like **Kena: Bridge of Spirits** and **Immortals Fenyx Rising** cannot be found on Steam. Sure, some are timed exclusives like **Hitman 3**, nevertheless, Epic Games Store has a good collection of games to play.

So, how do we get started using the Epic Games Store on Linux without official support?

### 3 Ways to Run Epic Games Store on Linux

Wine is a popular tool that lets you run Windows apps on Linux. You can use it to launch Epic Games Store, but we will not be focusing on it.

Instead, I will be highlighting options that utilize Wine and Steam’s Proton (or a compatibility layer) without making a lot of effort.

You should have no problem following the methods that I tried, considering they are focused on their ease of use.

I tried games like CONTROL, and a few indie titles that do not require anti-cheat services, and seemed to work pretty well.

The methods include:

* Using Heroic Games Launcher
* Using Lutris
* Using Bottles

### 1. Use Epic Games Store with Heroic Games Launcher

Heroic Games Launcher is one of the best ways to run Epic Games Store on Linux. You can also access the [GOG][1] library using it.

It lets you launch Epic Games Store using a free and open-source replacement for the Epic Games Launcher, i.e., [Legendary][2].

While Legendary is originally a command-line application, the Heroic Games Launcher provides a GUI to make it easy.

You get a native-like experience with this method, considering you get a lot of features using the GUI. Some of the features include:

* Uninstall/Install Games.
* Repair installed games.
* Update games.
* Move games to different folders.
* Launch games using default wine or custom wine configuration.
* Cloud sync save with Epic.
* Import installed game and Sync installed games with existing Epic Games installation.

#### Install Heroic Games Launcher on Linux

Heroic Games Launcher is available as a Flatpak, AppImage, .deb package, and a .rpm package. So, it can be installed on any Linux distribution, including Ubuntu, Arch, and Fedora.

You also get a third-party apt repository and can find it listed in AUR.

I recommend using the Flatpak package, which you can install it using the software center (or package manager) if you already have Flatpak enabled or enter the following command to proceed:

```
flatpak install flathub com.heroicgameslauncher.hgl
```

Refer to our [Flatpak guide][3], [AppImage guide][4], [deb installation guide][5], or the [rpm package guide][6] if you are new to Linux and need help to get it installed.

#### Steps to Launch Epic Games Store on Heroic Games Launcher

1. Once installed, you just need to launch the program and head to the **Stores** menu, and log in to your Epic Store account as shown in the image.

![epic game store heroic][7]

The log in will be web-based, so you will notice the usual login options for the Epic Games Store account.

Alternatively, you can click on “**Manage Accounts**” at the bottom left section of the screen and check if you have it signed in.

![heroic manage account][8]

2. When you are logged in, you can click on “**Library**” to access all your games. It can take a while to refresh. Here’s what it should look like:

3. In the library, you just have to click on the game you want to install, you will find the download/install size listed. In some cases, you can find the details only after you click on the “**Install**” button.

![heroic games install epic game][9]

Of course, Fall Guys is just an example of how it looks. It doesn’t work because it needs aan nti-cheat service.

4. To proceed, it will prompt you to select the installation path, wineprefix, and wine version you would like to make it work with.

![heroic game install][10]

If you are uncertain if the game works properly on Linux, you can head to the “**Tools**” option in the game listing screen, and click on “**Check compatibility**“. This will pull up any records of it from ProtonDB, which indicates if it works well on Linux.

5. Once you are certain, proceed with installing it, and launch the game when it is done.

As you can notice, it will use the recommended/default Wine version to run the game. But, if you want something specific, you can head to the “**Wine Manager**” option, and download a specific version that works with the game as per your requirements.

![heroic launcher epic game store][11]

### 2. Use Epic Games Store with Lutris

![lutris epic game store login][12]

Lutris is yet another client that helps you run Epic Games Store, GOG games, and more while utilizing Wine’s compatibility layer.

Unlike Heroic Launcher, you may not get a native-like Epic Games Store experience, but you can access Epic Launcher as you would on a Windows machine.

You can use the same to download/install games, and it just works. You do not get any extra fancy features here.

#### Install Lutris on Linux

For Ubuntu-based distros, you can simply add the PPA and get it installed. And, for Pop!_OS, you can find it listed in its software center.

The commands to add the PPA are:

```
sudo add-apt-repository ppa:lutris-team/lutris
```

For other Linux distributions, you can try the beta Flatpak repository to get it installed as per the [official instructions][13].

#### Steps to Use Epic Games Store on Lutris

1. Launch Lutris, and then look for the Epic Game Store as a source on the left side of the window.

![lutris epic game][14]

Click on it to proceed with the login.

If it does not show up in your case, you can head to the preferences and enable Epic Games Store from the sources available:

![lutris preference epic game enable][15]

You can also enable/disable other sources here.

2. Once you log in to the Epic account, you can find all your games listed. However, to proceed to install any of the games, it will prompt you to get the Epic Games Store wine package.

![install egs wine lutris][16]

You just need to follow the on-screen instructions to install everything it requires.

![install lutris wine dependencies][17]

3. When the installation is complete, it will automatically configure the wine configuration for you, and give you the option to launch the Epic Games Store.

![lutris game epic games][18]

All you have to do is look for a compatible game in your library, or purchase it, and install it. I tried **CONTROL**, and it works flawlessly.

### 3. Use Bottles to Access Epic Games Store

Bottles is yet another impressive program that lets you run Windows applications on Linux.

It is available as a [Flatpak][19] on [Flathub][20], which is the recommended method for installation.

You just need to create a Bottle for your use case, for instance, gaming in this case.

![A Video from YouTube][21]

You can refer to the official video above for the steps to create a Bottle. It should be self-explanatory, considering the application is very user-friendly.

Once you create the Bottle, you will have to find the installer for Epic Games Store and download it from within it. Similarly, you can install other game clients as well.

![bottles epic games installer][22]

Here’s what it should look like after you’re done. Just launch the Epic Games Store, and you can install/play games effortlessly!

![bottles gaming dark][23]

### Wrapping Up

I tested all these methods using Manjaro and Ubuntu 22.04 LTS, and it worked fine for a couple of games.

Of course, you need to be sure that the game you want runs well with the compatibility layers. So, make sure to head to ProtonDB before you purchase or download a game.

As with the current state, even if we do not get native support for Epic Games Store, it should not be an inconvenience.

Options like Heroic, Lutris, and Bottles have made running Windows-exclusive applications on Linux effortless. You just have to try one of them to get started.

[Gaming on Linux][24] has certainly come a long way. Don’t you think?

--------------------------------------------------------------------------------

via: https://itsfoss.com/epic-games-linux/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://www.gog.com/
[2]: https://github.com/derrod/legendary
[3]: https://itsfoss.com/flatpak-guide/
[4]: https://itsfoss.com/use-appimage-linux/
[5]: https://itsfoss.com/install-deb-files-ubuntu/
[6]: https://itsfoss.com/install-rpm-files-fedora/
[7]: https://itsfoss.com/wp-content/uploads/2022/07/epic-game-store-heroic.png
[8]: https://itsfoss.com/wp-content/uploads/2022/07/heroic-manage-account.jpg
[9]: https://itsfoss.com/wp-content/uploads/2022/07/heroic-games-install-epic-game.jpg
[10]: https://itsfoss.com/wp-content/uploads/2022/07/heroic-game-install.png
[11]: https://itsfoss.com/wp-content/uploads/2022/07/heroic-launcher-epic-game-store.png
[12]: https://itsfoss.com/wp-content/uploads/2022/07/lutris-epic-game-store-login.png
[13]: https://lutris.net/downloads
[14]: https://itsfoss.com/wp-content/uploads/2022/07/lutris-epic-game-800x520.png
[15]: https://itsfoss.com/wp-content/uploads/2022/07/lutris-preference-epic-game-enable.png
[16]: https://itsfoss.com/wp-content/uploads/2022/07/install-egs-wine-lutris.png
[17]: https://itsfoss.com/wp-content/uploads/2022/07/install-lutris-wine-dependencies.png
[18]: https://itsfoss.com/wp-content/uploads/2022/07/lutris-game-epic-games.jpg
[19]: https://itsfoss.com/what-is-flatpak/
[20]: https://flathub.org/apps/details/com.usebottles.bottles
[21]: https://youtu.be/0BQjFlEdSVA
[22]: https://itsfoss.com/wp-content/uploads/2022/07/bottles-epic-games-installer.png
[23]: https://itsfoss.com/wp-content/uploads/2022/07/bottles-gaming-dark.png
[24]: https://itsfoss.com/linux-gaming-guide/
