(runningwater翻译中)Top Things To Do After Installing Ubuntu 13.10 ‘Saucy Salamander’
================================================================================
**Ubuntu 13.10 Saucy Salamander** will be released on coming **October 17th** with many new salient features, updates and significant performance improvements. In this brief how-to let us discuss how we can enhance Ubuntu 13.10 further for day to day activities. This post we will share some interesting insight and ideas about what you can and should do after a successful installation.

If you have already a previous release of Ubuntu, and want to upgrade to the latest 13.10 version, then please follow our step by step guide [upgrade to Ubuntu 13.10 Saucy Salamander][1].

First of all, after fresh installation of Ubuntu 13.10 Saucy, check the following few things first.

**A. If sound is working, if not, [check our previous post to resolve the issue][2].

B. If wifi connection speed is normal or if it is too slow, [check our previous post to resolve the issue][3].**

## 1. Update System ##

After install the Ubuntu 13.10 Saucy, the first and important thing to do is update/upgrade software repositories and make sure your systems contains latest versions of all softwares.

    $ sudo apt-get update && sudo apt-get upgrade

## 2. Ubuntu Tweak ##

**Ubuntu Tweak** is a must have application for Ubuntu and it’s derivatives. It is an application to config Ubuntu easier for everyone. It provides many useful desktop and system options that the default desktop environment doesn’t provide. Using Ubuntu Tweak you can install all needed applications with a simple click, you can change the window buttons from Left to right…etc.

**Read our [Interview with Ding Zhou of Ubuntu Tweak][4].**

**Install Ubuntu Tweak via PPA**

**Note**: Ubuntu-Tweak Stable PPA is not ready yet. But there is an another PPA is available to install Ubutun-Tweak from the team.

Open terminal and enter the following commands:

    $ sudo add-apt-repository ppa:tualatrix/next
    $ sudo apt-get update 
    $ sudo apt-get install ubuntu-tweak

Most of the applications listed in this post, can be installed from Ubuntu Tweak Center with one click.

If you want to learn how to use [Ubuntu Tweak, read our previous post][5].

## 3. Desktop Environments ##

**Don’t like Unity in Ubuntu 13.10, why don’t you give a try to Cinnamon or Gnome?**

Cinnamon is a GNOME 3 fork that allow you to have a panel at the bottom with a classic Menu, this is useful for people that want to use Ubuntu with a classic Bottom Menu. Cinnamon is available in the default repositories of Ubuntu 13.10, therefore you can install it with the following command.

If you want to install the most recent version of cinnamon, then add the follow the steps below.

    sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
    sudo apt-get update
    sudo apt-get install cinnamon

Logout from the current session and select Cinnamon as your desktop session at the user login prompt. Now you’ll able to get the Cinnamon Desktop Environment.

**Warning**: Latest version of Cinnamon corrupts Unity both on Ubuntu 13.04 and 13.10. Hope this bug will be fixed soon before the Ubuntu 13.10 stable release. For more information please refer this [link][7].

**Install GNOME 3 in Ubuntu 13.10**

To install GNOME 3 in Ubuntu 13.10, enter the following command:

    sudo apt-get install gnome-shell ubuntu-gnome-desktop

During installation, the installer will ask you to select the login manager of your choice (LightDM is the default Unity manager and GDM is the GNOME default — Both will work).

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_001.png)

## 4. Accounts Configuration ##

**Configure UbuntuOne Account**

**UbuntuOne** enables users to store files online and sync them between computers and mobile devices, as well as stream audio and music from cloud to mobile devices. If you have already an account, you will need top sing in, setup a folder in your computer and start synchronizing your data, contacts, photos …etc.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Ubuntu-One_005.png)

Also you can run **UbuntuOne** from the left side unity launcher:

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Selection_004.png)

**Configure Online Accounts**

One of the top things you need to do is to setup your online accounts (Facebook, twitter…). To do that click on the **gear** button on the top right corner and select **System Settings**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Menu_007.png)

Then select Online Accounts (see below).

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/System-Settings_008.png)

Now setup your online accounts and get notifications in Ubuntu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Online-Accounts_010.png)

## 5. System Monitoring & Eye Candy Tools ##

**Install Conky for Ubuntu 13.10**

**[Conky][8]** is a free, light-weight system monitor for X, that displays any information on your desktop. There are many nice themes available for conky that can display clock, CPU usage, RAM usage, swap, disk, net and more. Check [our previous post for installation and configuration][9] of conky in Ubuntu 12.04, 12.10, 13.04 and Ubuntu 13.10.

**Don’t like the default icons, Wanna try some cool icons? **

Try the following cool Icon collections.

Want to change the default icons to something that match your taste? [Check this nice collection of icons for Ubuntu][10] (PPA included).

## 6. Multimedia ##

**- Players

1-VLC Media Player:**

[VLC][11] is the best media player for Linux it play almost everything, it has many features that you can not find in any other media player, read this post if you want to know what VLC can do: [25 things you can do with VLC Media player][12]!

You can install VLC from Ubuntu Software Center or via terminal by using the following command:

    sudo apt-get install vlc

Or install the most recent version 2.1.1 using the following PPA.

    sudo add-apt-repository ppa:videolan/stable-daily
    sudo apt-get update
    sudo apt-get install vlc

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/About_014.png)

**2- XMBC:**

**[XBMC][13]** is an award-winning free and open source (GPL) software media player and entertainment hub for digital media. XBMC is available for Linux, OS X, Windows, and the original Xbox. While XBMC functions very well as a standard media player application for your computer, it has been designed to be the perfect companion for your HTPC. Supporting an almost endless range of remote controls, and combined with its beautiful interface and powerful skinning engine, XBMC feels very natural to use from the couch and is the ideal solution for your home theater.

Open terminal and copy the following commands:

    sudo apt-get install xbmc

**- Video Editors

Openshot video editor:**

My favorite Video editor is [Openshot][14], the best existing actually for Linux. You can install Openshot from Ubuntu Software Center, but if you want to install the latest release, you can do that by adding the following repositories:

**Note**: PPA is not yet working in 13.10 at the time of writing this article. Hope it will be updated soon.

    sudo add-apt-repository ppa:openshot.developers/ppa
    sudo apt-get update
    sudo apt-get install openshot openshot-doc

Read also our [interview with Jonathan Thomas][15] the main developer of Openshot.

**- Video Encoders

Handbrake:**

Check our previous article to know about the powerful video encoder called “Handbrake”.

[Encode Movies And Videos Using Handbrake][16]

## 7. Install Common Codecs And Enable DVD playback ##

Perhaps installing a few common codecs might give you better sensibility of your system:

    sudo apt-get install gstreamer0.10-plugins-ugly gstreamer0.10-ffmpeg libxine1-ffmpeg gxine mencoder libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 gstreamer1.0-libav

To play encrypted DVDs, the libdvdcss2 package is essential. libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption.

    sudo /usr/share/doc/libdvdread4/./install-css.sh

## 8. Enable Flash Support On Browsers ##

**For Ubuntu 32 bit & 64 bit**: To be able to watch some videos and see flash website in your browser (Firefox/Chrome), you need to install flash plugin, go to **Ubuntu Software Center** and search word “**flash**” and install it.

Alternatively enter the following command to install flash plugins.

    sudo apt-get install flashplugin-installer

## 9. Torrent Softwares ##

**uTorrent:**

**uTorrent** is a lightweight and efficient BitTorrent client for Linux, Windows OS and Mac OS. The installation of uTorrent in Linux is different from Windows and Mac OS. In Linux, uTorrent runs as a web server. You will access uTorrent from your browser. You should start the uTorrent server in order to access it from your browser.

Check our previous article to know more about uTorrent.

[How To Install uTorrent Client in Ubuntu/Debian/Linux Mint][17]

**Deluge:**

The Deluge application was designed to be a full-featured torrent client. Deluge uses libtorrent in its back-end and PyGTK for its user interface and is currently usable on POSIX-compliant operating systems. It is intended to bring a native, full-featured client to GTK desktop environments such as GNOME and Xfce. An official Windows port is also available.

Open terminal and type the following commands:

    sudo apt-get install deluge

## 10. Messengers ##

Here is the list of recommended Messengers for your system. Don’t install everything. Install one by one and pick up the right one for your requirement and delete the rest.

[Pidgin][18],The best messenger client and 30 plugins, you can do voice and video chat with friends.

To install Pidgin, enter the following command:

    $ sudo apt-get install pidgin

[aMSN][19] is a free windows Live Messenger clone. aMSN attempts to emulate the look and feel of Windows Live Messenger, and supports many of its features.

aMSN has features not present in Windows Live Messenger. Users can set alarms, are able to see others who have removed them from their contact list, and are able to open many profiles at once. It is also very customizable, with extensions and themes available at the main site.

To install aMsn, enter the following command in your terminal.

    $ sudo apt-get install amsn

**Skype:**

If you’re want to install Skype, check our previous post: [How to install Skype in Ubuntu 13.04 ‘Raring Ringtail][20]’

**Jitsi:**

Jitsi is an open source and multi platform audio/video Internet phone and instant messenger written in Java. It supports some of the most popular instant messaging and telephony protocols such as SIP, Jabber/XMPP (and hence Facebook and Google Talk), AIM, ICQ, MSN, Yahoo! Messenger.

For details about Jitsi please check our previous article in the following link.

[Install Jitsi Instant Messenger in Ubuntu][21]

## 11. Gaming & Emulators ##

**Gaming made easy with Playdeb:**

If you are a grate fan of gaming so is important to add PlayDeb repositories to your Lucid Lynx. PlayDeb is a gaming repository for Ubuntu aimed to provide titles already available on getdeb.net in an easier to install and update format. You can install many games by a simple click.

[Click to install PlayDeb repositories][22]

**Wine**

Wine enables Linux, Mac, FreeBSD, and Solaris users to run Windows applications without a copy of Microsoft Windows. Wine is free software under constant development. Other platforms may benefit as well.

    sudo apt-get install wine

Or

Please follow instructions in our previous post : [How to install and configure games on WINE][23]

## 12. Sharing Files/Folders ##

**Samba:**

In order to share folders in **Raring Ringtail** with other Linux and windows machines in your network, you will need to install and configure Samba share, for instructions how to configure Samba in Ubuntu check our previous post : [Install and Configure Samba share in Ubuntu 13.04 ‘Raring Ringtail][24]’

**Gigola:**

Gigola is an another option to share files between Linux and Windows systems. Unlike Samba, we can use Gigola to send files between Linux-to-Linux and Linux-to-Windows systems.

Learn more about Gigola from the below link.

[How to Access Remote Linux and Windows Shares with Gigolo][25]

## 13. Extras & Miscellaneous ##

**- Install Archive Management Apps:**

Install the following packages will allow you to deal with almost all and any zip formated files.

    sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

**- Y PPA Manager:**

Y PPA Manager is a GUI tool to easily add PPAs, search a package in all [Launchpad PPAs][26], remove duplicate PPAs (only works with separate .list files), backup PPAs and other PPA-related tasks. Check out the Launchpad page for a complete features list.

    sudo add-apt-repository ppa:webupd8team/y-ppa-manager
    sudo apt-get update
    sudo apt-get install y-ppa-manager

Y-PPA-Manager can be launched either from Dash or Menu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Y-PPA-Manager_015.png)

**Install Java 7**

Java is fast, secure, and reliable programming and computing platform. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. To install java simply run the following command from your terminal.

    sudo apt-get install openjdk-7-jdk

If you want to try oracle-java 7, try the following steps.

First you need to remove OpenJDK for this run the following command from your terminal:

    sudo apt-get purge openjdk*

Now you can install Java 7 by adding the following repository:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer

To remove Java 7, run this in terminal:

    sudo apt-get remove oracle-java7-installer

**FileZilla:**

[Filezilla][27] is one of the best ftp client for Linux.

Install it via command line:

    sudo apt-get install filezilla

**Dropbox:**

Dropbox is a free service that lets you bring all your photos, docs, and videos anywhere. This means that any file you save to your Dropbox will automatically save to all your computers, phones and even the [Dropbox website][28]. Dropbox also makes it super easy to share with others, whether you’re a student or professional, parent or grandparent.

[Download the Dropbox package][29]

**Oracle VirtualBox:**

If you want to run another OS in a virtual machine, install Virtualbox.

For installation, [follow the instructions in our previous post][30].

**Cheese: Web Cam Software**

Cheese uses your webcam to take photos and videos, applies fancy special effects and lets you share the fun with others. To install cheese on your Ubuntu desktop, enter the following command:

**sudo apt-get install cheese**

**digikam**

digiKam is an advanced digital photo management application for Linux, Windows, and Mac-OSX. It can be used by Photographers to view, manage, edit, enhance, organize, tag, and share photographs under Linux systems.

You can easily install it using command:

    sudo apt-get install digikam

**Gimp:**

Regardless of whether you need to edit images daily on a professional level or just a hobbyist, GIMP is an essential tool for all.

    sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras

**Install Compiz**

To install Compiz use the following command:

    sudo apt-get install compiz compizconfig-settings-manager compiz-plugins

## 14. Desktop Effects ##

Want to spice-up your desktop with awesome wallpapers, well you can use the following two programs to change your desktop wallpapers in a particular interval.

**a- Variety:**

Variety is a wallpaper changer for Ubuntu which is feature-full, yet slim and very easy to use. It can automatically download wallpapers from various online sources such as Flickr, Wallbase.cc, World sunlight map (a live wallpaper that changes as the day progresses), Wallpapers.net, NASA Astronomy Picture of the Day, Desktoppr.co etc. It allows rotating them on a regular interval or on demand, and provides easy to use ways to separate the great images from the junk.

To install it under Ubuntu follow our previous post instructions.

[Automatically Change the Desktop Wallpaper Using Variety on Ubuntu/Linux Mint][31]

**b- Wallch:**

Wallch is an application that can be used to change your Ubuntu (Ubuntu derivatives) desktop wallpapers automatically at a particular period of time. It supports Gnome and Unity. It also let you to stop/start wallch, change to next/previous wallpaper. You can adjust/change the wallpaper changing interval. Wallch supports live Earth wallpapers which updates automatically every half an hour, therefore you can set the live Earth wallpapers as your desktop background.

To install it under Ubuntu follow our previous post instructions.

[Change Ubuntu Systems Wallpaper Automatically With Wallch][32]

## 15. Other worth trying applications ##

**a- App Grid:**

App Grid is a light weight alternative for Ubuntu Software Center. It allows you to filter applications by installed, pending, categories, name and rating. It is released under proprietary license and is available for Ubuntu 12.04, 12.10, 13.04 and 13.10.

For more details about App Grid, check our previous article in the following link.

[App Grid: A New Alternative For Ubuntu Software Center][33]

**b- Boot UP Manager(BUM):**

Boot-Up Manager is a Perl-Gtk2 application to manage runlevels configuration of any Ubuntu/Debian derivative systems. Using this program we can easily start and stop boot-up scripts, without the necessity to handle through complex symbolic links and permissions.

For more details about BUM, check our previous article in the following link.

[Manage Startup Services With BUM (Boot-Up Manager) On Ubuntu/Debian][34]

**c- TLP: Improve Battery performance**

TLP is an advanced power management tool for Linux that gives the settings and tweaks to enhance your existing power management automatically without the need to know every technical details. It is purely a command-line tool and doesn’t have a GUI. It should work on almost all laptops.

For more details about TLP, check our previous article in the following link.

[How to Improve Laptop Battery Life and Usage in Linux Using TLP][35]

**d- BleachBit: Clean up your system**

BleachBit deletes the unnecessary files, free up cache, delete cookies, clear internet history, shred temporary files, delete logs, and discard junk you didn’t know was there. This tool can be used in both Windows OS and Linux systems. And it will support the following applications such as Firefox, Internet Explorer, Adobe Flash, Google Chrome, Opera, Safari and more. It not only deletes the files, but it includes some advanced features such as shredding files to prevent recovery, wiping free disk space to hide traces of files deleted by other applications, and vacuuming Firefox to make it faster.

For more details about BleachBit, check our previous article in the following link.

[Clean up your systems using BleachBit][36]

Also install the following useful software’s if you like. This is gonna help you some time.

[Opera][37]  – The fastest browser on Earth is even faster. But that is not all. Use Opera Turbo to double your page-download speed on slow connections.

[Google Chrome][38] – Web browser from Google

[Google Earth][39] – Travel to cities across the globe, dive into the depths of the ocean, explore remote islands or even fly to faraway galaxies.

Now you’ve reached the end of the article. At this stage, you’ll have a perfect and full fledged Ubuntu 13.10 Desktop. Cheers!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/top-things-installing-ubuntu-13-10/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.unixmen.com/upgrade-ubuntu-13-04-raring-ubuntu-13-10-saucy-salamander/
[2]:http://www.unixmen.com/2012003-howto-resolve-nosound-problem-on-ubuntu/
[3]:http://www.unixmen.com/resolve-slow-connexion-when-using-wifi-in-ubuntu-1104-natty-narwhal
[4]:http://www.unixmen.com/interview-with-ding-zhou-of-ubuntu-tweak/
[5]:http://www.unixmen.com/after-a-fresh-install-of-ubuntu-1010-maverick-meerkat-configuration-made-easy-with-ubuntu-tweak/
[6]:http://www.unixmen.com/lefebvre-clem-gives-new-cinnamon-de-for-the-good-old-gnome-2x-experience/
[7]:http://news.softpedia.com/news/Cinnamon-2-0-Corrupts-Unity-on-Ubuntu-13-10-390736.shtml
[8]:http://conky.sourceforge.net/
[9]:http://www.unixmen.com/configure-conky-lua-in-ubuntu-11-10-12-04-fedora-debian-and-linuxmint-howto-conky/
[10]:http://www.unixmen.com/nice-collection-of-iconsets-themes-for-your-linux-desktop-with-installation-instructions-ubuntu-ppa/
[11]:http://www.unixmen.com/042013-top-things-to-do-after-installing-ubuntu-13-04-raring-ringtail/www.videolan.org
[12]:http://www.unixmen.com/22-things-you-can-do-with-vlc/
[13]:http://www.unixmen.com/xbmc-11-0-eden-has-been-released-ppa-ubuntu/
[14]:http://www.openshotvideo.com/
[15]:http://www.unixmen.com/interview-with-jonathan-thomas-of-openshot/
[16]:http://www.unixmen.com/how-to-encode-moviesvideos-using-handbrake/
[17]:http://www.unixmen.com/how-to-install-utorrent-on-ubuntu-debian/
[18]:http://www.pidgin.im/
[19]:http://www.unixmen.com/042013-top-things-to-do-after-installing-ubuntu-13-04-raring-ringtail/www.amsn-project.net/
[20]:http://www.unixmen.com/howto-install-skype-in-ubuntu-12-04-precise-pangolin/
[21]:http://www.unixmen.com/top-things-installing-ubuntu-13-10/www.unixmen.com/install-jitsi-instant-messenger-ubuntu/
[22]:http://archive.getdeb.net/install_deb/playdeb_0.3-1%7Egetdeb1_all.deb
[23]:http://www.unixmen.com/install-and-configure-wine-to-play-latest-windows-games-in-linux-ubuntu-linuxmint-fedora/
[24]:http://www.unixmen.com/howto-install-and-configure-samba-share-in-ubuntu/
[25]:http://www.unixmen.com/how-to-access-remote-linux-and-windows-shares-with-gigolo/
[26]:https://launchpad.net/y-ppa-manager
[27]:http://www.filezilla-project.org/
[28]:http://www.dropbox.com/
[29]:https://www.dropbox.com/install?os=lnx
[30]:http://www.unixmen.com/virtualbox-4-1-12-has-been-released-ppa-ubuntu12-04-lts/
[31]:http://www.unixmen.com/automatically-change-the-desktop-wallpaper-using-variety-on-ubuntulinux-mint/
[32]:http://www.unixmen.com/change-ubuntu-systems-wallpaper-automatically-wallch/
[33]:http://www.unixmen.com/app-grid-a-new-alternative-for-ubuntu-software-center/
[34]:http://www.unixmen.com/manage-startup-services-with-bumboot-up-manager-on-ubuntudebian/
[35]:http://www.unixmen.com/how-to-improve-laptop-battery-life-and-usage-in-linux-using-tlp/
[36]:http://www.unixmen.com/clean-up-your-linux-systems-using-bleachbit/
[37]:http://www.opera.com/browser/
[38]:http://www.google.com/chrome/index.html?hl=en-GB&brand=CHMB&utm_campaign=nl&utm_source=nl-ha-emea-nl-bk&utm_medium=ha
[39]:http://www.unixmen.com/how-to-install-google-earth-in-linux/
