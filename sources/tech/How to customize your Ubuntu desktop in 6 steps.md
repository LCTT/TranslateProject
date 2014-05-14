How to customize your Ubuntu desktop in 6 steps
================================================================================
![](http://www.muktware.com/wp-content/uploads/2014/05/ubuntu-customize-1.jpg)

Ubuntu is a great Linux distribution for users who want an easy-to-use interface and is arguably the best distribution for a user new to the Linux world. Some side effects of this is that, in terms of interface and appearance, many arbitrary choices have been made for the user by Canonical, particularly in the form of the Unity desktop environment.

These are not set in stone, however. Below are a few tips on how to feel more at home in Ubuntu. For a glimpse of some of the things you can customize in Ubuntu, you can see above what my desktop looks like using Unity in Ubuntu 14.04, compared to the default setup.

Let’s break down what is needed to do this.

### 1. Install the Unity Tweak Tool ###

Before you can make any significant changes to the appearance of Ubuntu, you will have to install the [Unity Tweak Tool][1], This is a special settings manager for the Unity desktop environment, and allows you to implement things like alternate icon sets and themes. It can be downloaded from the Ubuntu software center, or if you prefer, from the terminal with the following commands:

    sudo apt-get install unity-tweak-tool

If you are using Gnome desktop environment, then you might want to try the Gnome Tweak Tool, which can also can be installed from the Ubuntu software center or with the command

    sudo apt-get install gnome-tweak-tool

### 2. Install a GTK theme ###

There are many custom themes for Ubuntu, which affect the way applications and windows look. The theme I use is the Numix GTK+ theme. You can find out more about the Numix themes and icons at [http://numixproject.org/][2] . You can install the the Numix theme by opening the terminal and entering:

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update && sudo apt-get install numix-gtk-theme

o enable the theme, open the Unity Tweak Tool and select “Theme”, located under the “Appearance” header and select the theme, which should now be an option listed under “Available Themes”. This process can be repeated for any other theme, provided the repository package name is known. Many themes are available for perusal at [Gnome-Look.org][3]. One very similar set of themes to Numix are available is Moka at [http://mokaproject.com/][4].

### 3. Install an icon set ###

The icons used in the screenshot are also from Numix, the Numix Circle icons. These icons can be installed by entering into the terminal the commands:

    sudo apt-add-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install numix-icon-theme-circle

To enable the icons, select “Icons” in the Unity Tweak Tool and highlight the icon set. Once again, this is possible for any of the multitudes of icon sets available. Moka also offers very nice icon sets that bring colorful, consistent design to your desktop.

### 4. Install Conky system monitor ###

Conky is a lightweight desktop system monitor. By itself, it is quite plain, but it is completely hackable, which opens the door to complete customization of the application, which can be used to display a variety of useful information. You can install Conky by with these commands

    sudo apt-get install conky conky-all

You will also need to install Curl with the command

    sudo apt-get install curl

The Conky theme shown in the screenshot is [Harmattan][5], which displays time, weather and system processes in 15 different themes. To install this theme, you can download the .zip file from [deviantART][6], then extract its contents. Move the .conky-weather folder (you may have to hit Ctrl + H to view these files) into the home folder, as well as the .conkyrc file from the folder containing the theme of your choice (the Harmattan theme is nicely organized into folders for different types of themes). There are [hundreds of themes][7] of Conky, and all you need to try them is to replace the .conkyrc file in the home folder with the .conkyrc file for that theme.

### 5. Install some indicator applets ###

There are many third-party indicator applets that you can use to monitor information on your desktop. There are applets for weather, system performance, and more. The ones I use are quite simple. Because weather and performance are already in Conky, I haven’t installed these, but you can install them by entering the following commands in the terminal:

    sudo apt-get install indicator-weather
    sudo apt-get install indicator-multiload

The two applets I use are the Keys Lock applet and the Touchpad controller, because my laptop does not have an indicator light for caps lock or the touchpad disable hotkey. You can install these with the commands

    sudo add-apt-repository ppa:tsbarnes/indicator-keylock
    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install indicator-keylock
    sudo apt-get install touchpad-indicator

You may have to re-login to your user in order to launch these applets.

### 6. Get advanced with CompizConfig Settings Manager ###

If Unity Tweak Tool is not powerful enough for you, you can try installing the [CompizConfig Settings Manager][8].

### Warning: ###

CompizConfig may damage your system if the wrong settings are applied. Use with caution. You can enable settings hidden in all corners of Ubuntu, and you can install in from the Ubuntu Software Center or from the terminal with these commands:

    sudo apt-get install compiz compizconfig-settings-manager compiz-fusion-plugins-extra compiz-fusion-plugins-main compiz-plugins

Your Ubuntu desktop is now supercharged! All of these steps have thousands of other options attached to them, so customizability is endless. Now go out and try them!

--------------------------------------------------------------------------------

via: http://www.muktware.com/2014/05/customize-ubuntu-desktop-6-steps/26750

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://apps.ubuntu.com/cat/applications/unity-tweak-tool/
[2]:http://numixproject.org/
[3]:http://gnome-look.org/?xcontentmode=100
[4]:http://mokaproject.com/
[5]:http://zagortenay333.deviantart.com/art/Conky-Harmattan-426662366
[6]:http://www.deviantart.com/art/Conky-Harmattan-426662366
[7]:http://www.deviantart.com/?qh=&section=&global=1&q=conky
[8]:https://apps.ubuntu.com/cat/applications/compizconfig-settings-manager/