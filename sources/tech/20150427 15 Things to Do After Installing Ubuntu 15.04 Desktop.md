Translating by ZTinoZ
15 Things to Do After Installing Ubuntu 15.04 Desktop
================================================================================
This tutorial is intended for beginners and covers some basic steps on what to do after you have installed Ubuntu 15.04 “Vivid Vervet” Desktop version on your computer in order to customize the system and install basic programs for daily usage.

![Things to Do After Installing Ubuntu 15.04](http://www.tecmint.com/wp-content/uploads/2015/04/things-to-do-after-installing-ubuntu-15.04.jpeg)
15 Things to Do After Installing Ubuntu 15.04

### 1. Enable Ubuntu Extra Repositories and Update the System ###

The first thing you should take care of after a fresh installation of Ubuntu is to enable Ubuntu Extra Repositories provided by official Canonical Partners and keep an up-to-date system with the last security patches and software updates.

In order to accomplish this step, open from the left Launcher System Settings -> Software and Updates utility and check all Ubuntu Software and Other Software (Canonical Partners) repositories. After you finish hit the Close button and wait for the utility to Reload the cache sources tree.

![Software Updates](http://www.tecmint.com/wp-content/uploads/2015/04/Software-Updates.jpg)
Software Updates

![Other Software (Canonical Partners)](http://www.tecmint.com/wp-content/uploads/2015/04/Other-Software.jpg)
Other Software (Canonical Partners)

For a fast and smooth update process, open a Terminal and issue the following command in order to update the system using the new software repositories:

    $ sudo apt-get update
    $ sudo apt-get upgrade

![Ubuntu Upgrade](http://www.tecmint.com/wp-content/uploads/2015/04/Ubuntu-Upgrade.jpg)
Ubuntu Upgrade

### 2. Install Additional Drivers ###

In order for the system to scan and install additional hardware proprietary drivers, open Software and Updates utility from System Settings, go to Additional Drivers tab and wait for the utility to scan for drivers.

If some drivers matching your hardware are found, check the drivers you want to install and hit the Apply Changes button to install it. In case the proprietary drivers are not working as expected, uninstall them using the Revert button or check Do not use the device and Apply Changes.

![Install Drivers in Ubuntu](http://www.tecmint.com/wp-content/uploads/2015/04/install-drivers.jpg)
Install Drivers

### 3. Install Synaptic and Gdebi Package Tools ###

Besides Ubuntu Software Center, Synaptic is a Graphical utility for apt command line through which you can manage repositories or install, remove, search, upgrade and configure software packages. Similar way, Gdebi has the same functionality for local .deb packages. To install this two package managers on your system issue the following command on Terminal:

    $ sudo apt-get install synaptic gdebi

![Install Synaptic and Gdebi](http://www.tecmint.com/wp-content/uploads/2015/04/install-synaptic-gdebi.jpg)
Install Synaptic and Gdebi

![Synaptic Package Manager](http://www.tecmint.com/wp-content/uploads/2015/04/synaptic-package-manager.jpg)
Synaptic Package Manager

### 4. Change System Appearance and Behavior ###

If you want to change Desktop Background or Launcher Icon Size, open System Settings –> Appearance –> Look and personalize the desktop. To move the menu to window title bar, enable workspaces and desktop icons or auto-hide the Launcher visit Behavior tab.

![System Appearances](http://www.tecmint.com/wp-content/uploads/2015/04/system-appearance.jpg)
System Appearances

### 5. Improve System Security and Privacy ###

![System Security Enhancement](http://www.tecmint.com/wp-content/uploads/2015/04/system-security-1.jpg)
System Security Enhancement

![System Security Options](http://www.tecmint.com/wp-content/uploads/2015/04/system-security-2.jpg)
System Security Options

### 5. Disable Unneeded Startup Applications ###

To improve system login speed, reveal hidden Startup Applications by issuing the below command on Terminal, open Startup Applications utility by searching it in Dash and uncheck the unneeded applications during login process.

    $ sudo sed -i ‘s/NoDisplay=true/NoDisplay=false/g’ /etc/xdg/autostart/*.desktop

![Disable Unwanted Applications](http://www.tecmint.com/wp-content/uploads/2015/04/disable-unwanted-applications.jpg)
Disable Unwanted Applications

### 6. Add Extended Multimedia Support ###

By default, Ubuntu comes with a minimal support for media files. In order to play various media formats or manipulate video files, install the following multimedia applications:

- VLC
- Smplayer
- Audacious
- QMMP
- Mixxx
- XBMC
- Handbrake
- Openshot

Use the following command line to install all with one shot:

    $ sudo apt-get install vlc smplayer audacious qmmp mixxx xbmc handbrake openshot

![Install Media Players](http://www.tecmint.com/wp-content/uploads/2015/04/install-media-players.jpg)
Install Media Players

![Media Player Playlist](http://www.tecmint.com/wp-content/uploads/2015/04/media-playllist.jpg)
Media Player Playlist

Besides this multimedia players also install ubuntu-restricted-extras and Java support packages in order to decode and support other restricted media formats.

    $ sudo apt-get install ubuntu-restricted-extras openjdk-8-jdk

![Install Ubuntu Extras](http://www.tecmint.com/wp-content/uploads/2015/04/install-ubuntu-extras.jpg)
Install Ubuntu Extras

To enable DVD Playback and other multimedia codecs issue the following command on Terminal:

    $ sudo apt-get install ffmpeg gstreamer0.10-plugins-bad lame libavcodec-extra
    $ sudo /usr/share/doc/libdvdread4/install-css.sh

![Enable Video Codes](http://www.tecmint.com/wp-content/uploads/2015/04/enable-video-playbacks.jpg)
Enable Video Codes

### 7. Install Image Applications ###

If you are a photography enthusiast and you want to handle and manipulate images on Ubuntu, probably you want to install the following imaging programs:

- GIMP (alternative for Adobe Photoshop)
- Darktable
- Rawtherapee
- Pinta
- Shotwell
- Inkscape (alternative for Adobe Illustrator)
- Digikam
- Cheese

This applications can be installed from Ubuntu Software Center or all at once by using the following command line on Terminal:

    $ sudo apt-get install gimp gimp-plugin-registry gimp-data-extras darktable rawtherapee pinta shotwell inkscape

![Install Image Applications](http://www.tecmint.com/wp-content/uploads/2015/04/install-image-applications.jpg)
Install Image Applications

![Rawtherapee Tool](http://www.tecmint.com/wp-content/uploads/2015/04/rawtherapee.jpg)
Rawtherapee Tool

### 8. Install Media Burners ###

To mount ISO images or burn a CDs or a DVD, you can choose and install from the following software:

- Brasero Disk Burner
- K3b
- Xfburn
- Furius ISO Mount

    $ sudo apt-get install brasero
    $ sudo apt-get install k3b
    $ sudo apt-get install xfburn
    $ sudo apt-get install furiusisomount

![Install Media Burners](http://www.tecmint.com/wp-content/uploads/2015/04/install-media-burners.jpg)
Install Media Burners

### 9. Install Archive Applications ###

To handle most of archive formatted files (zip, tar.gz, zip, 7zip rar etc) install the following packages by issuing the below command:

    $ sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

![Install Archive Applications](http://www.tecmint.com/wp-content/uploads/2015/04/install-archive-apps.jpg)
Install Archive Applications

### 10. Install Chat Application ###

If you want to talk to people all over the world, here is a list of the most popular chat applications for Linux:

- Pidgin
- Skype
- Xchat
- Telegram
- aMSN
- Viber

You can install most of them from Ubuntu Software Center or by using the command line:

    $ sudo apt-get install pidgin
    $ sudo apt-get install skype
    $ sudo apt-get install xchat
    $ sudo apt-get install amsn
    $ sudo add-apt-repository ppa:atareao/telegram -y
    $ sudo apt-get update
    $ sudo apt-get install telegram

![Install Chat Applications](http://www.tecmint.com/wp-content/uploads/2015/04/install-chat-apps.jpg)
Install Chat Applications

To install Viber application on Ubuntu visit [Viber official webpage][1], download the Debian package locally and install the viber.deb application using Gdebi package manager (left click – > Open with -> GDebi Package Installer).

![Install Viber in Ubuntu](http://www.tecmint.com/wp-content/uploads/2015/04/install-viber.jpg)
Install Viber

### 11. Install Torrent Software ###

The most popular torrent applications and peer-to-peer file sharing programs for Ubuntu are:

- Deluge
- Transmission
- Qbittorrent
- LinuxDC++

To install your favorite peer-to-peer file sharing application on Ubuntu issue the following command on Terminal.

    $ sudo apt-get install deluge
    $ sudo apt-get install transmission
    $ sudo apt-get install qbittorrent
    $ sudo apt-get install linuxdcpp

![Install Torrent](http://www.tecmint.com/wp-content/uploads/2015/04/install-torrent.jpg)
Install Torrent

### 12. Install Windows Emulator -Wine and Gaming Support – Steam ###

Wine emulator allows you to install and run Windows applications on Linux. On the other hand, Steam is a popular gaming platform for Linux based systems developed by Valve. To install both of them on your machine issue the following command on Terminal or use Ubuntu Software Center.

    $ sudo apt-get install steam wine winetricks

![Install Wine](http://www.tecmint.com/wp-content/uploads/2015/04/install-wine.jpg)
Install Wine

### 13. Install Cairo-Dock and Enable Desktop Visual Effects ###

Cairo-Dock is a beautiful and flexible launcher bar for Linux desktops similar to the Mac OS X dock. To install it on Ubuntu, run the following command on Terminal.

    $ sudo apt-get install cairo-dock cairo-dock-plug-ins 

![Install Cairo Dock](http://www.tecmint.com/wp-content/uploads/2015/04/install-cairo-dock.jpg)
Install Cairo Dock

![Add Cairo Dock at Startup](http://www.tecmint.com/wp-content/uploads/2015/04/add-cairo-dock-startup.jpg)
Add Cairo Dock at Startup

To enable a set of Desktop Effects, such as Cube effect, install Compiz package with the following command:

    $ sudo apt-get install compiz compizconfig-settings-manager compiz-plugins-extra

To activate the Desktop Cube effect, search for ccsm on Dash, open CompizConfig Settings Manager, go to General Options – > Desktop Size and set Horizontal Virtual Size value to 4 and Vertical Virtual Size to 1. Then go back and check Desktop Cube (Disable Desktop Wall) and Rotate Cube boxes (Resolve Conflicts ->Disable Switch to Viewport 1) and press Ctrl+Alt+Left Mouse Click to view the cube effect.

![Enable Compiz](http://www.tecmint.com/wp-content/uploads/2015/04/enable-compiz.jpg)
Enable Compiz

![Compiz Settings](http://www.tecmint.com/wp-content/uploads/2015/04/compiz-settings.jpg)
Compiz Settings

![Compiz Settings Addons](http://www.tecmint.com/wp-content/uploads/2015/04/compiz-settings-1.jpg)
Compiz Settings Addons

![Desktop Window Rotating](http://www.tecmint.com/wp-content/uploads/2015/04/desktop-cube.jpg)
Desktop Window Rotating

### 14. Add Extra Browser Support ###

Ubuntu 15.04 comes by default with Mozilla Firefox Web Browser. To install other browsers such as Google Chrome or Opera, visit their official web pages, download the provided .deb packages and install them on your system using the Gdebi Package Installer.

![Enable Browser Support](http://www.tecmint.com/wp-content/uploads/2015/04/enable-browser-support.jpg)
Enable Browser Support

![Opera Browser Support](http://www.tecmint.com/wp-content/uploads/2015/04/opera.jpg)
Opera Browser Support

To install Chromium Open Source browser issue the following command on Terminal.

    $ sudo apt-get install chromium-browser

### 15. Install Tweak Tools ###

Want extra applications for customizing Ubuntu? Then install Unity Tweak Tool and Gnome Tweak Tool by issuing the following commands on Terminal.

    $ sudo apt-get install unity-tweak-tool gnome-tweak-tool

![Install Tweak Tool](http://www.tecmint.com/wp-content/uploads/2015/04/install-tweak-tool.jpg)
Install Tweak Tool

![Tweak Tool Settings](http://www.tecmint.com/wp-content/uploads/2015/04/tweak-settings.jpg)
Tweak Tool Settings

Another interesting tweak tool is represented by the Ubuntu Tweak package which can be obtained and installed by visiting the webpage: [http://ubuntu-tweak.com/][2].

![Tweak Tool: System Information](http://www.tecmint.com/wp-content/uploads/2015/04/tweak-system-info.jpg)
Tweak Tool: System Information

After you have installed all this bunch of software, you might want to clean your system in order to free some space on the hard drive, by issuing the following commands:

    $ sudo apt-get -y autoremove 
    $ sudo apt-get -y autoclean 
    $ sudo apt-get -y clean

This are just a few tweaks and programs that an average user might install and use on Ubuntu 15.04 Desktop for daily basic utilization. For more advanced programs, features and utilities use Ubuntu Software Center or consult Ubuntu Wiki webpage.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-installing-ubuntu-15-04-desktop/

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.viber.com/en/products/linux
[2]:http://ubuntu-tweak.com/
