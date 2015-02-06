How To Install KDE Plasma 5.2 In Ubuntu 14.10
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Plasma_Ubuntu_1410.jpg)

[KDE][1] Plasma 5.2 has been [released][2] and in this post we shall see how to install KDE Plasma 5.2 in Ubuntu 14.10.

Ubuntu’s default desktop environment Unity is beautiful and packs quite some feature. But if you ask any experienced Linux user about desktop customization, his answer will be KDE. KDE is boss when it comes to customization and its popularity can be guessed that Ubuntu has an official KDE flavor, known as [Kubuntu][3].

A good thing about Ubuntu (or any other Linux OS for that matter) is that it doesn’t bind you with one particular desktop environment. You can always install additional desktop environments and choose to switch between them while keeping several desktop environments at the same time. Earlier, we have seen the installation of following desktop environments:

- [How to install Mate desktop in Ubuntu 14.04][4]
- [How to install Cinnamon in Ubuntu 14.04][5]
- [How to install Budgie desktop in Ubuntu 14.04][6]
- [How to install GNOME Shell in Ubuntu 14.04][7]

And today we shall see how to install KDE Plasma in Ubuntu 14.10.

### Install KDE Plasma 5.2 in Ubuntu 14.04 ###

Before you go on installing Plasma on Ubuntu 14.10, you should know that it will download around one GB of data. So consider your network speed and data package (if any) before opting for KDE installation. The PPA we are going to use for installing Plasma is the official PPA provided by the KDE community. Use the commands below in terminal:

    sudo apt-add-repository ppa:kubuntu-ppa/next-backports
    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get install kubuntu-plasma5-desktop plasma-workspace-wallpapers

During the installation, it will as you to choose the default display manager. I chose the default LightDM. Once installed, restart the system. At the login, click on the Ubuntu symbol beside the login field. In here, select Plasma.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Select_Plasma_KDE_Ubuntu.jpeg)

You’ll be logged in to KDE Plasma now. Here is a quick screenshot of how KDE Plasma 5.2 looks like in Ubuntu 14.10:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/KDE_Plasma_Desktop.jpeg)

### Remove KDE Plasma from Ubuntu ###

If you want to revert the changes, use the following commands to get rid of KDE Plasma from Ubuntu 14.10.

    sudo apt-get install ppa-purge
    sudo apt-get remove kubuntu-plasma5-desktop
    sudo ppa-purge ppa:kubuntu-ppa/next

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-kde-plasma-ubuntu-1410/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://www.kde.org/
[2]:https://dot.kde.org/2015/01/27/plasma-52-beautiful-and-featureful
[3]:http://www.kubuntu.org/
[4]:http://itsfoss.com/install-mate-desktop-ubuntu-14-04/
[5]:http://itsfoss.com/install-cinnamon-24-ubuntu-1404/
[6]:http://itsfoss.com/install-budgie-desktop-ubuntu-1404/
[7]:http://itsfoss.com/how-to-install-gnome-in-ubuntu-14-04/