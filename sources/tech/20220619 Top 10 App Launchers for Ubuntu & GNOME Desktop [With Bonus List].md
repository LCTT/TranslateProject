[#]: subject: "Top 10 App Launchers for Ubuntu & GNOME Desktop [With Bonus List]"
[#]: via: "https://www.debugpoint.com/2022/06/top-ubuntu-launcher-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Top 10 App Launchers for Ubuntu & GNOME Desktop [With Bonus List]
======
Here’s a list of the 10 best application launcher to boost your productivity and saves time. Try these in Ubuntu, Linux Mint and other distros.

### What is a Launcher

A launcher is an application that performs a search and launches any application in your desktop environment. Usually, it is kicked off by a keyboard combination and gives you available options to start. It can also perform specific actions such as browsing file systems and calculating a formula value.

In other terms, a traditional application menu is also a launcher. Because using a simple menu, you can also search and launch applications.

Most mainstream Linux distributions do not come with a dedicated launcher by default. Some particular ones feature them. For example, the KDE Plasma desktop in Kubuntu and other distros bring the awesome Krunner launcher. Similarly, there are other launchers as well which are exciting to try out.

This [Top 10 list][1] features some of the best App Launchers for Ubuntu and Linux distros.

### Top 10 App Launcher for Ubuntu and Other Linux Distros

#### 1. Ulauncher

Ulauncher is a classy and nice-looking App launcher for Ubuntu, Linux Mint and similar distros. It is written in Python and brings some exciting features. For example, Ulauncher support fuzzy search, i.e. your incorrect spellings also give you the exact result that you are looking for. In addition, it supports searching the file system, files, web browsing history and many such features.

Moreover, you can change the looks of the Ulauncher via several Themes to make it look great in your [desktop theme][2].

![Ulauncher showing fuzzy search][3]

![][4]

You can install Ulauncher via the below methods.

* [Directly download][5] the deb file for Ubuntu, Linux Mint and other similar distros. And then, using the Software, you can install it.

* For Fedora, run the below command from a terminal prompt to install.

```
sudo dnf install ulauncher
```

* After installation, you can press CTRL+space to launch Ulauncher.

* For more information, visit the [official website][6].

#### 2. Kupfer

Kupfer is a little different-looking launcher. Written in Python, it is an old application that brings up the applications’ icons when it matches the search values. Usually, it does not have a search box. However, you can type, and the possible matches are shown instantly. Moreover, it supports several plugins as well.

![Kupfer][7]

You can easily install Kupfer in Ubuntu and Linux Mint using the below command.

```
sudo apt install kupfer
```

You can find more details about this launcher on its [home page][8].

#### 3. Albert

Perhaps the most exciting app launcher on this list is Albert. Albert is a widely used launcher that brings app, file system and web search from its search box. Also, it shows you the path of the application or the shortcuts in the resulting drop-down so that you can choose the correct application. Other than that, you can also do basic mathematics calculations from the launcher itself.

In addition, Albert comes with several plugins to extend its functionality which is accessible from its settings window. When launched for the first time, you need to choose the Keybinding for the launcher.

![Albert Launcher][9]

Installation of Albert is terminal driven via openSUSE build service.

For Ubuntu and Linux Mint, you can install Albert using the following commands in sequence.

```
sudo apt install curlcurl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.listsudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"sudo apt updatesudo apt install albert
```

Alternatively, if you want the deb file, you can [get it here][10]. All the above commands are for [Ubuntu 22.04 LTS][11] only.

Similarly, for Fedora Linux, you can use the following command.

```
sudo rpm --import https://build.opensuse.org/projects/home:manuelschneid3r/public_keydnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_36/home:manuelschneid3r.repodnf install albert
```

To learn more about Albert, visit the [official website][12].

#### 4. GNOME Pie

GNOME Pie is a circular application launcher and looks different from the traditional launcher. It gives you a circular icon-based menu. See the below image.

![GNOME Pie – circular launcher][13]

The design may not go well with specific users, considering the modern user interface designs, but it’s very productive if you are familiar with it. GNOME Pie activates itself when you press the default keyboard combination CTRL+ALT+Space. Another interesting behaviour of GNOME Pie is it pops up at your mouse cursor position.

Installing GNOME Pie is easy in Ubuntu and other similar distributions. Open a terminal prompt and run the below command.

```
sudo apt install gnome-pie
```

After installation, press CTRL+ALT+space to activate. For more details, you may visit its official [home page][14].

#### 5. Cerebro

Another attractive launcher which I like to highlight is Cerebro. Cerebro is an electron-based launcher that may act as a single entry point to your “question” or “intent” of search. For example, you want to find out “how often you should wash your car”. Cerebro can show you possible results from Google. Moreover, the usual launcher functions such as finding an app and browsing the file system also work in this launcher.

![Cerebro | Image credit: Cerebro team][15]

Unfortunately, I could not run the AppImage of Cerebro in Ubuntu 22.04 LTS for a demo. It looks like there are some bugs.

But you may download AppImage or deb file from here and try it. **Note**: it has a dependency on `libcanberra-gtk-module` and `libfuse2`. Finally, its also available for Windows and macOS, and you may learn more about Cerebro at its official [homepage][16].

#### 6. Synapse

Synapse is a free and open-source launcher application with which you can quickly start applications and access files using the Zeitgeist engine. Written in Vala, Synapse is similar to the Ulauncher in this list.

In addition, it can search your playlists, give you options to shutdown and gives you a Tabbed view of the preliminary result window. Synapse is an excellent utility to have for your desktop.

![Synapse Launcher][17]

You can download the latest build deb file (amd64) in Launchpad using [this page][18] and install it using GDebi or dpkg or Software.

#### 7. Zazu

Zazu is another excellent launcher which you can try out. It is free and open-source and comes with a variety of features out of the box. For example, you can search and take actions on the system power menu and search in package manager and clipboard history using Zazu. In addition, you can also run the system commands and launch applications using this Ubuntu launcher.

![Zazu launcher | Image credit: Zazu team][19]

Zazu is available for Windows and Linux. You can get the deb file on [this page for Ubuntu Linux and other related distributions.][20] After downloading the deb file, you can install it using the Software or GDebi.

Visit the [official website][21] to learn more about its features.

#### 8. Rofi

If you are a long-time desktop Linux user, I am sure you heard about Rofi. Rofi is a clone of the window switcher “Simpleswitcher”. It is a versatile application launcher or swithers that brings several pre-made modes. For example, it features Window switcher mode, app launcher mode, file browsing mode and a unique SSH launcher mode.

In addition, it is designed to give you results based on your search history, which is sorted based on your search age. Moreover, it supports plugins and themes which you can choose to blend into your desktop design.

![Rofi in file browser more][22]

For more details, visit the Github [page][23].

Installation of Rofi is easy, as the packages are available in significant distribution repo. For Ubuntu Linux, you can run the below command to install.

```
sudo apt install rofi
```

For Fedora Linux, use:

```
sudo dnf install rofi
```

After installation, visit the Quickstart [guide][24] to run this launcher. Because running the Rofi launcher is a little different than others.

#### 9. GNOME Do

The ninth in this Ubuntu launcher list is “GNOME-Do”. [GNOME Do][25] an intelligent desktop launcher which helps you to perform several tasks. For example, you can launch operating system actions such as copy, move, and delete. In addition, you can efficiently perform the usual search of apps and file system data. GNOME Do also support several Themes and Plugins developed by the community for further customization.

![GNOME Do][26]

You can install the GNOME Do launcher in Ubuntu using the following PPA.

```
sudo add-apt-repository ppa:do-core/ppasudo apt updatesudo apt install gnome-do
```

#### 10. LightHouse

The final Ubuntu launcher in this list is LightHouse. Lighthouse is the most simple launcher with a minimal design. It has a single search box that expands based on the input parameter. For example, if you want to execute specific actions, you can type the proper keyword, showing you the available options.

Installing LightHouse is a little tricky in Ubuntu. It requires compilation which you can find on [this page][27]. For Arch Linux, you can [setup Yay AUR helper][28] and run `yay -S lighthouse-git` to install.

Learn more about LightHouse on its official [Github page][29].

### Bonus List

Finally, here are five more launchers which are stunning in their merit. But I have not added them to the above list because they are more like “application menu” than “pop-out launcher”. Semantically all the apps in the below is “launcher”, but I guess it’s better to term them as the extended application menu.

* [Arc Menu][30]
* [Plank][31]
* [DockBarX][32]
* [Docky][33]

### Closing Notes

I hope this list of best launchers for Ubuntu and Other Linux helps you pick one. In addition, you may try all of them and choose the one that suits best your workflow. Also, as many of them uses similar keyboard combination, try not to use all of them together.

Finally, which one of the Ubuntu launchers above is your favourite? Let me know in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/top-ubuntu-launcher-2022/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/top-10-list/
[2]: https://www.debugpoint.com/category/themes
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/Ulauncher-showing-fuzzy-search.jpg
[4]: 
[5]: https://github.com/Ulauncher/Ulauncher/releases/
[6]: https://ulauncher.io/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/06/Kupfer.jpg
[8]: https://github.com/kupferlauncher/kupfer
[9]: https://www.debugpoint.com/wp-content/uploads/2022/06/Albert-Launcher.jpg
[10]: http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/amd64/
[11]: https://www.debugpoint.com/tag/ubuntu-22-04-lts/
[12]: https://albertlauncher.github.io/
[13]: https://www.debugpoint.com/wp-content/uploads/2022/06/GNOME-Pie.jpg
[14]: http://schneegans.github.io/gnome-pie
[15]: https://www.debugpoint.com/wp-content/uploads/2022/06/Cerebro.jpg
[16]: https://cerebroapp.com/
[17]: https://www.debugpoint.com/wp-content/uploads/2022/06/Synapse-Launcher.jpg
[18]: https://launchpad.net/ubuntu/+source/synapse/0.2.99.4-3build1/+build/23235198
[19]: https://www.debugpoint.com/wp-content/uploads/2022/06/Zazu-launcher.jpg
[20]: https://github.com/bayleeadamoss/zazu/releases
[21]: http://zazuapp.org/
[22]: https://www.debugpoint.com/wp-content/uploads/2022/06/Rofi-in-file-browser-more.jpg
[23]: https://github.com/davatorium/rofi
[24]: https://github.com/davatorium/rofi#quickstart
[25]: http://do.cooperteam.net/
[26]: https://www.debugpoint.com/wp-content/uploads/2022/06/GNOME-Do.jpg
[27]: https://github.com/emgram769/lighthouse#installation
[28]: https://www.debugpoint.com/2021/01/install-yay-arch/
[29]: https://github.com/emgram769/lighthouse
[30]: https://gitlab.com/arcmenu/ArcMenu
[31]: https://launchpad.net/plank
[32]: https://github.com/M7S/dockbarx
[33]: https://launchpad.net/docky/
