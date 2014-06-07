Nuvola Player 2.4.0 Released – A Online Cloud Music Player for Linux
================================================================================
**Nuvola Player** is an open source player that runs cloud music services such as Amazon Cloud Player, Bandcamp, Deezer, 8tracks, Google Play Music, Grooveshark, Hyper Machine and Pandora in its own web interface and provides integration with a Linux desktop.

This application comes with lots of features in the form of plugins such as desktop notifications, system tray, multimedia keys, media player applets, dock menu, lyrics, last.fm and much more.

On **May 31st 2014**, A new version of **Nuvola Player 2.4.0** was released – which brings a few new features, including two new services such as Logitech Media Server and This is My Jam with numerous bug fixes.

### What’s new in this release ###

- Deleted broken Hide Google+ buttons option, because Google changes the code too regularly.
- Service settings are now applied quickly without reload.
- The pause and toggle play/pause behaviour have been fixed.
- Added a caution about compatibility problems with desktop notifications for Chrome.
- The in-page navigation buttons have been implemented (now users will find buttons in the top bar next to the Google Play logo).
- A new Logitech Media Server and This is My Jam services has been added.
- Included support for back/ forward mouse buttons.
- Fixed support for actionable notification in the GNOME lock screen.

For a complete list of features, visit at official release [announcement page][1].

### Installing Nuvola Player in Debian, Ubuntu and Linux Mint ###

The official Nuvola Player repository contains binary packages for **Ubuntu 14.04, 13.10, 12.10, 12.04** and **Linux Mint 17, 16, 15, 14.** You can install binary package ‘nuvolaplayer‘ by adding Nuvola Player repository under your system.

#### On Ubuntu and Linux Mint ####

Open a terminal and run the following series of commands in the terminal.

    $ sudo add-apt-repository ppa:nuvola-player-builders/stable
    $ sudo apt-get update
    $ sudo apt-get upgrade
    $ sudo apt-get install nuvolaplayer

**Note**: Please don’t skip system updates command ‘sudo apt-get upgrade‘. Otherwise, your apt-get may fail to install Flash plugin.

If you wish to install Nuvola Player without Flash plugin support, you can skip that system upgrade command and use the following command to install nuvolaplayer without Flash support.

    $ sudo apt-get --no-install-recommends install nuvolaplayer

#### On Debian ####

For **Debian Wheezy** and **Debian Sid** the stable Nuvola Player binary packages available from official repository. Using this repository, you can install latest stable version using the following bunch of commands.

Firstly, Open a terminal and import a public key, and then add the repository to ‘**sources.list**‘ file and then do a system update to install nuvolaplyer as shown below.

#### Debian Wheezy ####

    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 706C220A
    $ sudo sh -c 'echo "deb http://ppa.fenryxo.cz/nuvola-player/ wheezy main" >> /etc/apt/sources.list'
    $ sudo sh -c 'echo "deb-src http://ppa.fenryxo.cz/nuvola-player/ wheezy main" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install nuvolaplayer

#### Debian Sid ####

    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 706C220A
    $ sudo sh -c 'echo "deb http://ppa.fenryxo.cz/nuvola-player/ sid main" >> /etc/apt/sources.list'
    $ sudo sh -c 'echo "deb-src http://ppa.fenryxo.cz/nuvola-player/ sid main" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install nuvolaplayer

**Note**: Nuvola Player depend on wrapped Flash plugin, which is not installed by default due to conflicting libraries (**GTK+ 2** and **GTK+ 3**).

To workaround this problem, we enable component flash **PPA** to install package ‘**nuvolaplayer-flashplugin**‘ using the following commands.

    $ sudo sh -c 'echo "deb http://ppa.fenryxo.cz/nuvola-player/ sid main beta flash" >> /etc/apt/sources.list'
    $ sudo sh -c 'echo "deb-src http://ppa.fenryxo.cz/nuvola-player/ sid main beta flash" >> /etc/apt/sources.list'
    $ apt-get update
    $ apt-get install nuvolaplayer-flashplugin

Once you done with the installation, you will find the application in **Menu** to launch it. Keep in mind, you must have internet connection in order to listen music online.

### Nuvola Player Screen Shots ###

![Nuvola Player Services](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player.jpeg)
Select Music Services

![Grooveshark Music Service](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-01.jpeg)
Grooveshark Music Service

![Grooveshark Playing Music](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-02.jpeg)
Grooveshark Playing Music

![Nuvola Player Preferences](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-03.jpeg)
Nuvola Player Preferences

![Google Play Music](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-05.jpeg)
Google Play Music

![Rdio Music Service](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-06.jpeg)
Rdio Music Service

![About Nuvola Player](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-04.jpeg)
About Nuvola Player

For other Linux distributions, you can download source tarball packages at Nuvola Player [launchpad downloads][2] page.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-nuvola-player-in-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://nuvolaplayer.fenryxo.cz/releases/2.4.html
[2]:https://launchpad.net/nuvola-player/+download