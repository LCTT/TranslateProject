How to Add Beautiful Fonts to Any Linux Distribution
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Add-Beautiful-Fonts-to-Any-Linux-Distribution-434835-2.jpg)

**The following tutorial will teach all Linux users how to easily add beautiful fonts to their operating systems. We’ve written detailed instructions for Debian, Arch Linux, openSUSE, Slackware, and Fedora distributions.**

As many of you already know, the major drawback of almost all Linux-based operating systems is that the default selection of fonts is not satisfactory for end users, especially those who migrate from Windows or Mac OS X OSes.

Except for Ubuntu, which uses its own set of fonts that looks quite beautiful from the get-go, all the other Linux distributions suffer from ugly font disease. Because of this, many users tried to create new methods for improving text rendering in various distros.

This is the case of the Infinality project, whose main purpose is to add various patches in order to provide users with some of the nicest font renderings on any Linux-based operating system.

### Infinality for Arch Linux ###

1. Add the infinality-bundle, infinality-bundle-multilib (for 64-bit users) and infinality-bundle-fonts repositories to your /etc/pacman.conf:

    [infinality-bundle]
    Server = http://bohoomil.com/repo/$arch

    [infinality-bundle-multilib]
    Server = http://bohoomil.com/repo/multilib/$arch

    [infinality-bundle-fonts]
    Server = http://bohoomil.com/repo/fonts

2. Execute the sudo pacman -Syu command to refresh the repositories, then run the `sudo pacman -S infinality-bundle infinality-bundle-multilib ibfonts-meta-extended` (for 64-bit systems) or `sudo pacman -S infinality-bundle ibfonts-meta-extended` (for 32-bit systems).

3. Answer YES when asked if you want to replace freetype2 of fontconfig packages. Reboot your computer when finished.

### Infinality for Fedora ###

1. Execute the following commands in a terminal window:

    sudo rpm -Uvh http://www.infinality.net/fedora/linux/infinality-repo-1.0-1.noarch.rpm
    sudo yum install freetype-infinality fontconfig-infinality

2. Reboot your machine.

### Infinality for openSUSE ###

1. Add the official Infinality repository `http://download.opensuse.org/repositories/home:/namtrac:/subpixel/openSUSE_13.1/`, open the Repositories tab in YaST, select the namtrac:subpixel repository, and click on “Switch system packages to the versions in this repository.”

2. Mark for installation all the packages from the namtrac:subpixel that are not installed, then install the fontconfig-infinality package from the official openSUSE repositories.

3. Set the Subpixel Hinting option to “Use system settings” in the font configuration options, or set it to RGB order with Slight hinting. Reboot your system.

### Infinality for Slackware ###

Detailed installation instructions are provided at [http://someslack.wordpress.com/infinality-on-slackware/][1]

### Infinality for Debian ###

1. Execute the following commands in a terminal (one by one, hitting Enter after each one):

    echo “deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu raring main” | sudo tee /etc/apt/sources.list.d/infinality.list
    echo “deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu raring main” | sudo tee -a /etc/apt/sources.list.d/infinality.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B

2. Run the following commands to update your system and install the Infinality packages:

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install fontconfig-infinality

3. Restart your computer.

For any other Linux distribution that is not listed above, please use the official instructions provided at [https://github.com/Infinality/fontconfig-infinality/tree/master/infinality][2]. As usual, do not hesitate to drop a comment below if you encounter any issues with this tutorial.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Add-Beautiful-Fonts-to-Any-Linux-Distribution-434835.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://someslack.wordpress.com/infinality-on-slackware/
[2]:https://github.com/Infinality/fontconfig-infinality/tree/master/infinality