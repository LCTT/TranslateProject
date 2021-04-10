[#]: subject: (How to Install Steam on Fedora [Beginner’s Tip])
[#]: via: (https://itsfoss.com/install-steam-fedora/)
[#]: author: (John Paul https://itsfoss.com/author/john/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Steam on Fedora [Beginner’s Tip]
======

Steam is the best thing that could happen to Linux gamers. Thanks to Steam, you can play hundreds and thousands of games on Linux.

If you are not already aware of it, Steam is the most popular PC gaming platform. In 2013, it became available for Linux. [Steam’s latest Proton project][1] allows you to play games created for Windows platform on Linux. This enhanced Linux gaming library many folds.

![][2]

Steam provides a desktop client and you can use it to download or purchase games from the Steam store, install the game and play it.

We have discussed [installing Steam on Ubuntu][3] in the past. In this beginner’s tutorial, I am going to show you the steps for installing Steam on Fedora Linux.

### Installing Steam on Fedora

To get Steam on Fedora, you’ll have to use RMPFusion repository. [RPMFusion][4] is a series of third-party repos that contain software that Fedora chooses not to ship with their operating system. They offer both free (open source) and non-free (closed source) repos. Since Steam is in the non-free repo, you will only install that one.

I shall go over both the terminal and graphical installation methods.

#### Method 1: Install Steam via terminal

This is the easiest method because it requires the fewest steps. Just enter the following command to enable the free repo:

```
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

You will be asked to enter your password. You will then be asked to verify that you want to install these repos. Once you approve it, the installation of the repo will be completed.

To install Steam, simply enter the following command:

```
sudo dnf install steam
```

![Install Steam via command line][5]

Enter your password and press “Y” to accept. Once installed, open Steam and play some games.

#### Method 2: Install Steam via GUI

You can [enable the third-party repository on Fedora][6] from the Software Center. Open the Software Center application and click on the hamburger menu:

![][7]

In the Software Repositories window, you will see a section at the top that says “Third Party Repositories”. Click the Install button. Enter your password when you are prompted and you are done.

![][8]

Once you have installed RPM Fusion repository for Steam, update your system’s software cache (if needed) and search for Steam in the software center.

![Steam in GNOME Software Center][9]

Once that installation is complete, open up the GNOME Software Center and search for Steam. Once you locate the Steam page, click install. Enter your password when asked and you’re done.

After installing Steam, start the application, enter your Steam account details or register for it and enjoy your games.

### Using Steam as Flatpak

Steam is also available as a Flatpak. Flatpak is installed by default on Fedora. Before we can install Steam using that method, we have to install the Flathub repo.

![Install Flathub][10]

First, open the [Flatpak site][11] in your browser. Now, click the blue button marked “Flathub repository file”. The browser will ask you if you want to open the file in GNOME Software Center. Click okay. Once GNOME Software Center open, click the install button. You will be prompted to enter your password.

If you get an error when you try to install the Flathub repo, run this command in the terminal:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

With the Flathub repo installed, all you need to do is search for Steam in the GNOME Software Center. Once you find it, install it, and you are ready to go.

![Fedora Repo Select][12]

The Flathub version of Steam has several add-ons you can install, as well. These include a DOS compatibility tool and a couple of tools for [Vulkan][13] and Proton.

![][14]

I think this should help you with Steam on Fedora. Enjoy your games :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-steam-fedora/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/steam-play-proton/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2017/05/Steam-Store.jpg?resize=800%2C382&ssl=1
[3]: https://itsfoss.com/install-steam-ubuntu-linux/
[4]: https://rpmfusion.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/install-steam-fedora.png?resize=800%2C588&ssl=1
[6]: https://itsfoss.com/fedora-third-party-repos/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/software-meni.png?resize=800%2C672&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-third-party-repo-gui.png?resize=746%2C800&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gnome-store-steam.jpg?resize=800%2C434&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/flatpak-install-button.jpg?resize=800%2C434&ssl=1
[11]: https://www.flatpak.org/setup/Fedora/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/fedora-repo-select.jpg?resize=800%2C434&ssl=1
[13]: https://developer.nvidia.com/vulkan
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/steam-flatpak-addons.jpg?resize=800%2C434&ssl=1
