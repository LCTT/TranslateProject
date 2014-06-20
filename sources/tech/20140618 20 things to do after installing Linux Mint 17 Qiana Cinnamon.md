Translating by GOLinux
20 things to do after installing Linux Mint 17 Qiana Cinnamon
================================================================================
### Linux Mint 17 Qiana Cinnamon ###

Linux Mint 17 has been [released][1] and is named Qiana. Mint is one of the best linux distros that targets desktop users with focus on usability and simplicity. It comes in various flavors with different desktop environments like Mate and Cinnamon and different base distros like Ubuntu or Debian.

In this post we are playing with the cinnamon edition of Linux Mint 17. More information about the Cinnamon edition (including download links) can be found at - [http://blog.linuxmint.com/?p=2626][2]
Download the correct iso (32bit or 64bit) for your system, burn to a dvd or write to a usb drive and boot in. Once you install completes, its time to charge up the system with some tweaks and essential apps to get the best performance and experience.

### 1. Update the system ###

The first thing to do always is to make the system up-to-date. Run the following commands in a terminal.

    $ sudo apt-get update
    $ sudo apt-get upgrade

Or use the Update Manager (mintUpdate) that can be found in Menu > Administration.

![linux mint 17 qiana](http://www.binarytides.com/blog/wp-content/uploads/2014/06/linux-mint-17-qiana.png)

### 2. Get old wallpapers ###

Every release of Linux Mint comes with a new set of nice wallpapers. But you can also install wallpapers from the previous versions.

    $ sudo apt-get install mint-backgrounds-*

### 3. Get more browsers ###

Linux Mint 17 has firefox installed by default. You can get more browsers like Chromium and Google Chrome.

The chromium browser is available in the repositories.

    $ sudo apt-get install chromium-browser

For Google Chrome visit google.com/chrome and download the deb files and install them using gdebi.
Or run the following commands

    # 64 bit
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    $ sudo gdebi google-chrome-stable_current_amd64.deb
    
    # 32 bit
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
    $ sudo gdebi google-chrome-stable_current_i386.deb

### 4. Install Flash Player ###

The adobe flash plugin package (adobe-flashplugin) is installed by default on Mint so should be able to play flash games and videos inside Firefox.

Google Chrome now uses the Pepper API based flash player which comes inbuilt with it, so you don't need to do anything for Chrome either.

For Chromium however, the Pepper based flash player is not included (being a non-free component) and has to be installed manually.

Install the following package to install the pepper flash player for Chromium. It will download the pepper flash player from Google Chrome browser and put it inside Chromium.

    $ sudo apt-get install pepperflashplugin-nonfree

The above command should setup the flash player in Chromium. Incase it fails to download, redo the process with the following command

    $ sudo dpkg-reconfigure pepperflashplugin-nonfree

### 5. Install multimedia codecs ###

The restricted extras package would install most of the essential codecs for playing formats like mp3. It would also install the microsoft fonts.

    $ sudo apt-get install ubuntu-restricted-extras

To enable playback of encrypted dvds, install the following package.

    $ sudo apt-get install libdvdread4
    $ sudo /usr/share/doc/libdvdread4/install-css.sh

### 6. Install proprietory drivers ###

If you are having an nvidia or ati graphics card or broadcom wireless card, then install the proprietory drivers provided by the vendor. These drivers would get you the best hardware performance.

For installing nvidia drivers you can follow the previous post here

How to install the latest Nvidia drivers on Linux Mint

### 7. Install Dropbox ###

Linux mint repository already has the package for dropbox client, so you need not go elsewhere.

    $ sudo apt-get install dropbox python-gpgme

If you still prefer to download dropbox from the official website then head straigh to [https://www.dropbox.com/install?os=lnx][4] and follow the instructions and download the deb installers for Ubuntu.

Copy is another cloud storage solution that has a native Linux client. Check it out at [copy.com][5]. It also has a [ppa repository][6].

### 8. Skype ###

Skype is available in the Ubuntu canonical partner repositories.

    $ sudo apt-get install skype

### 9. Install rar and other archiving utilities ###

To be able to create rar archives from the context menu in file managers like Nemo, install the rar utility. Along with rar, install a few more packages to add support for other archive formats.

    $ sudo apt-get install unace p7zip-rar sharutils rar arj lunzip lzip

### 10. Install a clipboard manager ###

Clipboard managers allow you to maintain and access history of items that you copied in the past using Ctrl+C for example. There are many clipboard managers for gnome like diodon, clipit, glipper, parcellite.

Diodon seemd to have some issues on the cinnamon desktop, that scrollers would appear as the history list grows. Clipit and Glipper worked very well. You can install either

    $ sudo apt-get install glipper
    # or
    $ sudo apt-get install clipit

Then launch them from the Application menu and they should start everytime you login.

### 11. Tweak the desktop ###

#### 1. Fix the date format on the system tray ####

The time applet at the bottom right shows only the time. It can be made to show the date as well. Right click the date-time applet on the bottom right and click Configure

Check the box labelled "Use a custom date format" and fill in

    %B %e, %I:%M %p

This would show the month name, date and time in 12 hour format with AM/PM

#### 2. Install Themes, Extensions, Applets, Desklets ####

Get some goodies for your desktop. You have desklets for the desktop area, applets for the panel, extensions for desktop effects and themes for the desktop design.

Go to system settings, click on the specific icon and you would see a list to select from. Click the "Get more online" tab to download more such goodies.

#### 3. Change Firefox search engine ####

You might notice that Firefox has the Yahoo search engine selected by default and the search engine list does not have Google in it. Click "Manage Search Engines" > Get more search engines. It will take you to [http://www.linuxmint.com/searchengines.php][7].

Scroll down to the section of commercial search engines and find the Google logo and click on it. Once you are on the next page, click on the search engine list again and this time you would see an option "Add Google". Click on it and Google search engine would be available.

### 12. Optimise font rendering ###

Linux mint uses the Dejavu Sans fonts by default, which look very ordinary. You can get far more good looking fonts using the Droid and Noto fonts. Following our previous tutorial for step by step instructions on how to do it.

[How to get gorgeous looking fonts on Linux Mint][8]

### 13. Guake dropdown terminal ###

Dropdown terminals allow you to access terminals at the press of a single key. Guake is one such dropdown terminal for gtk based desktops. Dropdown terminals show/hide upon request and keep running so you do not need to open the terminal from the menu or launcher.
This is a must have tool for terminal addicts

    $ sudo apt-get install guake

Guake needs to be configured to start everytime on Logon. First find out the path to the guake command.

    $ which guake
    /usr/bin/guake

Now add it to the list of startup applications. Go to system settings > startup programs and click Add. Fill the dialog

> Name - Guake dropdown terminal
> Command - /usr/bin/guake

Click Add. Now Guake is in the list of running applications and would start automatically everytime.

### 14. Uget download manager ###

Uget is a simple and robust cross platform download manager and works very well on Linux. It lacks the ability to download files in multiple parts, but is still a very stable download manager.

    $ sudo apt-get install uget

### 15. Deluge BitTorrent client ###

Linux Mint comes with Transmission which is a simple and efficient torrent client. If you are looking for a more featureful torrent client, than you can try out the deluge or vuze (formerly azureus), or qbittorrent.

    $ sudo apt-get install deluge-torrent

### 16. Hardinfo - System information tool ###

Hardinfo is a very convenient gui tool that reports a whole lot of information about various hardware parts on your system. You can check information about processor, memory, storage device, network configuration, printers, usb devices, sound/video adapters etc all in one place. It also has features to test and measure the performance of your system

    $ sudo apt-get install hardinfo

17. Install MATE desktop environment

Apart from Cinnamon the other popular desktop environment that comes with Linux Mint is the MATE (Maatay) desktop. Install it if you want to try it.

    $ sudo apt-get install mint-meta-mate

Now you can select the MATE session at the login screen.

### 18. Make other partitions writable ###

If you have other ext partitions, to store and backup files for example, then you need to make them writable to avoid using root privileges every time.

First open the partition mount directory in a file manager using gksudo.

    $ gksudo nemo

Navigate to the partition directory. Right click and go to Properties > Permissions tab

Give "Folder access" - create and delete files to owner, group and others
Give "File access - read and write to owner, group and others.

For Ntfs partitions you do not need to do this.

### 19. Install Conky ###

Conky is a lightweight system monitor that displays statistics about various system resources like cpu, memory, network etc on the desktop using graphical widgets. Its not a necessary thing, but gets you some eye candy for the desktop.

    $ sudo apt-add-repository -y ppa:teejee2008/ppa
    $ sudo apt-get update
    $ sudo apt-get install conky-manager

Launch Conky Manager from the applications menu and add widgets to the desktop. Also check the option to start Conky on system startup.

### 20. Install some games ###

Linux does have some cool games that are quite entertaining and yet free. Note that some of these games like supertuxkart and 0ad require dedicated graphics processors for optimal performance.

    # 0ad - strategy game like age of empires
    $ aptitude search 0ad
    
    # supertuxkart - car racing game
    $ aptitude search supertuxkart
    
    # openarena
    $ aptitude search openarena

There are a lot more games in the repository that you can install. Alien arena, secret maryo chronicles, supertux, frozen bubbles etc.

### Cleanup ###

After everything, cleanup the system by removing unnecessary packages.

    $ sudo apt-get autoremove

### Notes ###

#### Support for Java applets on Google Chrome/Chromium ####

The "icedtea-plugin" is already installed which enables firefox to play java applets.

However Chrome and Chromium no longer support NPAPI based plugins. So java applets would not work in those browsers till a Pepper api based java plugin is available. More information [here][9].

#### More applications ####

If you are looking for still more applications for your Mint box, then here a small list of more good apps. All of them can be installed from Software Manager.

Opera - Web browser
Gnome Encfs Manager - Manager files and folders encrypted with Encfs
Smplayer - Multimedia player
Rhythmbox, Clementine - Music players
Openshot, Kdenlive - Video editor
Audacity - Audio editor
Inkscape - Graphics and image editing
Gparted - Partition editor
Gufw - Firewall configuration tool
qBittorrent, Vuze - Torrent clients
Gwenview - Image viewing
Team viewer - remote desktop
Tv-maxe - view tv channels
Grub Customizer - Modify GRUB boot menu settings
Linrunner TLP - Power management tool. Useful to save power on laptops
Virtualbox - Virtualization
Kazam, recordMyDesktop - Desktop recording/screencasting
Bleachbit - Free disk space by deleting old/temporary files.
Cheese - Take pictures using webcam
Shutter - Screenshot tool with loads of features

So grab your favorite ones and enjoy Linux Mint !!

### Resources ###

Download latest Linux Mint
[http://www.linuxmint.com/download.php][10]

Community Tutorials
[http://community.linuxmint.com/tutorial][11]

Linux Mint forums
[http://forums.linuxmint.com/][12]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/better-linux-mint-17-cinnamon/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blog.linuxmint.com/?p=2626
[2]:http://blog.linuxmint.com/?p=2626
[3]:http://www.binarytides.com/install-nvidia-drivers-linux-mint-16/
[4]:http://www.dropbox.com/install?os=lnx
[5]:http://copy.com/?r=DSwtSd
[6]:http://launchpad.net/~paolorotolo/+archive/copy
[7]:http://www.linuxmint.com/searchengines.php
[8]:http://www.binarytides.com/optimize-fonts-linux-mint/
[9]:http://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/1309508
[10]:http://www.linuxmint.com/download.php
[11]:http://community.linuxmint.com/tutorial
[12]:http://forums.linuxmint.com/
