translation by strugglingyouth
Install Qmmp 0.9.0 Winamp-like Audio Player in Ubuntu
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2015/01/qmmp-icon-simple.png)

Qmmp, Qt-based audio player with winamp or xmms like user interface, now is at 0.9.0 release. PPA updated for Ubuntu 15.10, Ubuntu 15.04, Ubuntu 14.04, Ubuntu 12.04 and derivatives.

Qmmp 0.9.0 is a big release with many new features, improvements and some translation updates. It added:

- audio-channel sequence converter;
- 9 channels support to equalizer;
- album artist tag support;
- asynchronous sorting;
- sorting by file modification date;
- sorting by album artist;
- multiple column support;
- feature to hide track length;
- feature to disable plugins without qmmp.pri modification (qmake only)
- feature to remember playlist scroll position;
- feature to exclude cue data files;
- feature to change user agent;
- feature to change window title;
- feature to reset fonts;
- feature to restore default shortcuts;
- default hotkey for the “Rename List” action;
- feature to disable fadeout in the gme plugin;
- Simple User Interface (QSUI) with the following changes:
	- added multiple column support;
	- added sorting by album artist;
	- added sorting by file modification date;
	- added feature to hide song length;
	- added default hotkey for the “Rename List” action;
	- added “Save List” action to the tab menu;
	- added feature to reset fonts;
	- added feature to reset shortcuts;
	- improved status bar;

It also improved playlist changes notification, playlist container, sample rate converter, cmake build scripts, title formatter, ape tags support in the mpeg plugin, fileops plugin, reduced cpu usage, changed default skin (to Glare) and playlist separator.

![qmmp-090](http://ubuntuhandbook.org/wp-content/uploads/2015/09/qmmp-090.jpg)

### Install Qmmp 0.9.0 in Ubuntu: ###

New release has been made into PPA, available for all current Ubuntu releases and derivatives.

1. To add the [Qmmp PPA][1].

Open terminal from the Dash, App Launcher, or via Ctrl+Alt+T shortcut keys. When it opens, run command:

    sudo add-apt-repository ppa:forkotov02/ppa

![qmmp-ppa](http://ubuntuhandbook.org/wp-content/uploads/2015/09/qmmp-ppa.jpg)

2. After adding the PPA, upgrade Qmmp player through Software Updater. Or refresh system cache and install the software via below commands:

    sudo apt-get update
    
    sudo apt-get install qmmp qmmp-plugin-pack

That’s it. Enjoy!

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/09/qmmp-0-9-0-in-ubuntu/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://launchpad.net/~forkotov02/+archive/ubuntu/ppa
