[#]: subject: "How to Install and Configure IceWM in Arch Linux"
[#]: via: "https://www.debugpoint.com/icewm-arch-linux-install/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install and Configure IceWM in Arch Linux
======
A simple tutorial explaining how you can easily install and configure the IceWM in Arch Linux systems.

![IceWM Looks Awesome][1]

### About IceWM & its features: Quick Highlights

IceWM is a lightweight window manager for the X Window system, written in C++. This window manager is more than two decades old (the first release was in 1997) and is still in active development!

The most sought-after feature of IceWM is its low system resource usage and simplicity. Although all the window managers are more-or-less lightweight than all the desktop environments.

Before installing IceWM, you should know its headline features.

* Lightweight and straightforward to use
* Low learning curve (for those coming from desktop environments)
* Dynamic menu
* Per-window Keybinding
* Alt+Tab support for window switching
* Multiple workspaces
* Mouse support (configurable)
* A vast collection of community-developed theme
* Multi-focus mode

You can learn more about its feature on the [official home page][2].

Now, let’s see how you can install it.

### How to Install IceWM in Arch Linux

#### 1. Install Base Arch Linux

Since you are trying to install it in Arch Linux, I assume you already have an Arch setup ready. If you don’t, you can read this guide on installing Arch Linux using a [simple and easy-to-use guide via archinstall][3].

Moreover, if you don’t want to install Arch, you can download EndeavourOS or any Arch-based distro ISO and install it.

And then, you can follow the below instructions to install IceWM on top of any DE such as KDE, Xfce, GNOME, etc.

#### 2. Set up Yay – Aur helper

The [main icewm package][4] is present in the Arch main repo. But the [associated packages][5], such as themes, etc., are present in Arch User Repository (AUR). So, let’s install an AUR helper (such as Yay).

You can refer to my guide to[install Yay][6], OR follow the below commands to install.

Use the following command in sequence to install the required packages and clone the GIT repo of Yay.

```
sudo pacman -S base-develsudo pacman -S gitcd /optsudo git clone https://aur.archlinux.org/yay.git
```

After the above commands are complete, change the owner of the source directory. Replace “debugpoint” with your user name. And follow the below commands in sequence.

```
sudo chown -R debugpoint:users ./yaycd yaymakepkg -si
```

This will complete the installation of Yay – AUR helper.

#### 3. Install IceWM

Firstly, install the icewm package & a file manager (optional) using the below command.

```
pacman -S icewm pcmanfm
```

![Install IceWm in Arch Linux][7]

Now install the following packages via Yay, which is for several themes, utilities and putting icons on the desktop.

```
yay -S icewm-themes idesk icewm-utils
```

If you are installing IceWM on a bare metal system, then install Xorg and display manager. This step is not required if you are installing on top of any Arch distro.

```
pacman -S xorg lightdm lightdm-gtk-greeter
systemctl enable lightdm
```

Now, as a final step you can reboot your system. After reboot, choose IceWM from the login screen.

And you should be greeted with a nice and sleek IceWM desktop.

#### Configuration

Since its not desktop environment, there are some additional configuration you may want to do. Here’s some of the important onces. Choose the items which best fit for your use case.

* Configuration for users: If you want to configure IceWM for a specific user, create a directory and them copy the config files to that newly created folder. You can achieve this using the following commands.

```
mkdir ~/.icewm/cp -R /usr/share/icewm/* ~/.icewm/
```

* Enabling USB automount: You can enable USB automount by installing the following package via Yay helper.

```
yay -S usbmount
```

* Wallpaper: Install feh utility using the following command to easily manage wallpaper in IceWM.

```
pacman -S feh
```

* IceWM Preferences: Most of the settings are available in the `~/.icewm/preferences` file. You can set or unset any value you want.
* Changing Themes: To change themes you can navigate via Launcher `Menu > Settings > Themes`.

### Wrapping Up

In this article, you learned how to install IceWM in Arch Linux (vanilla or on top of any distro). Also you learned the necessary configuration for IceWM. I hope this guide helps you to configure a nice and simple IceWM system in Arch for your daily use.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/icewm-arch-linux-install/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/IceWM-Looks-Awesome.jpg
[2]: https://ice-wm.org/
[3]: https://www.debugpoint.com/archinstall-guide/
[4]: https://archlinux.org/packages/community/x86_64/icewm/
[5]: https://aur.archlinux.org/packages?O=0&SeB=nd&K=icewm&outdated=&SB=p&SO=d&PP=50&submit=Go
[6]: https://www.debugpoint.com/install-yay-arch/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/10/Insall-IceWm-in-Arch-Linux.jpg
