FSSlc translating

Install uGet Download Manager 2.0 in Debian, Ubuntu, Linux Mint and Fedora
================================================================================
After a long development period, which includes more than 11 developement releases, finally uGet project team pleased to announce the immediate availability of the latest stable version of uGet 2.0. The latest version includes numerous attractive features, such as a new setting dialog, improved BitTorrent and Metalink support added in the aria2 plugin, as well as better support for uGet RSS messages in the banner, other features include:

- A new “Check for Updates” button informs you about new released versions.
- Added new languages & updated existing languages.
- Added a new “Message Banner” that allows developers to easily provide uGet related information to all users.
- Enhanced the Help Menu by including links to the Documentation, to submit Feedback & Bug Reports and more.
- Integrated uGet download manager into the two major browsers on the Linux platform, Firefox and Google Chrome.
- Improved support for Firefox Addon ‘FlashGot’.

### What is uGet ###

uGet (formerly known ad UrlGfe) is an open source, free and very powerful multi-platform GTK based download manager application was written in C language, that released and licensed under GPL. It offers large collection of features such as resuming downloads, multiple download support, categories support with an independent configuration, clipboard monitoring, download scheduler, import URLs from HTML files, integrated Flashgot plugin with Firefox and download torrent and metalink files using aria2 (a command-line download manager) that integrated with uGet.

I have listed down all the key features of uGet Download Manager in detailed explanation.

#### Key Features of uGet Download Manager ####

- Downloads Queue: Place all your downloads into a Queue. As downloads finishes, the remaining queue files will automatically start downloading.
- Resume Downloads: If in case, your network connection disconnected, don’t worry you can start or resume download where it was left.
- Download Categories: Support for unlimited categories to manage downloads.
- Clipboard Monitor: Add the types of files to clipboard that automatically prompt you to download copied files.
- Batch Downloads: Allows you to easily add unlimited number of files at once for downloading.
- Multi-Protocol: Allows you to easily download files through HTTP, HTTPS, FTP, BitTorrent and Metalink using arial2 command-line plugin.
- Multi-Connection: Support for up to 20 simultaneous connections per download using aria2 plugin.
- FTP Login & Anonymous FTP: Added support for FTP login using username and password, as well as anonymous FTP.
- Scheduler: Added support for scheduled downloads, now you can schedule all your downloads.
- FireFox Integration via FlashGot: Integrated FlashGot as an independent supported Firefox extension that handles single or massive selection of files for downloading.
- CLI / Terminal Support: Offers command line or terminal option to download files.
- Folder Auto-Creation: If you have provided the save path for the download, but the save path doesn’t exist, uget will automatically create them.
- Download History Management: Keeps a track of finished download and recycled entries, per list 9,999 files. Entries which are older than the custom limit will be deleted automatically.
- Multi-Language Support: By default uGet uses English, but it support more than 23 languages.
- Aria2 Plugin: uGet integrated with Aria2 plugin to give more user friendly GUI.

If you want to know a complete list of available features, see the official uGet [features page][1].

### Install uGet in Debian, Ubuntu, Linux Mint and Fedora ###

The uGet developers added latest version in various repos throughout the Linux platform, so you can able to install or upgrade uGet using supported repository under your Linux distribution.

Currently, a few Linux distributions are not up-to-date, but you can get the status of your distribution by going to the [uGet Download page][2] and selecting your preferred distro from there for more details.

#### On Debian ####

In Debian Testing (Jessie) and Debian Unstable (Sid), you can easily install and update using the official repository on a fairly reliable basis.

    $ sudo apt-get update
    $ sudo apt-get install uget

#### On Ubuntu & Linux Mint ####

In Ubuntu and Linux Mint, you can install and update uGet using official PPA repository ‘ppa:plushuang-tw/uget-stable‘. By using this PPA, you automatically be kept up-to-date with the latest versions.

    $ sudo add-apt-repository ppa:plushuang-tw/uget-stable
    $ sudo apt-get update
    $ sudo apt-get install uget

#### On Fedora ####

In Fedora 20 – 21, latest version of uGet (2.0) available from the official repositories, installing from these repo is fairly reliable.

    $ sudo yum install uget

**Note**: On older versions of Debian, Ubuntu, Linux Mint and Fedora, users can also install uGet. but the available version is 1.10.4. If you are looking for updated version (i.e. 2.0) you need to upgrade your system and add uGet PPA to get latest stable version.

### Installing aria2 plugin ###

[aria2][3] is a excellent command-line download utility, that is used by uGet as a aria2 plugin to add even more great functionality such as downloading torrent files, metalinks, multi-protocol & multi-source download.

By default uGet uses CURL as backend in most of the today’s Linux systems, but the aria2 Plugin replaces CURL with aria2 as the backend.

aria2 is a separate package that needs to be installed separately. You can easily install latest version of aria2 using supported repository under your Linux distribution or you can also use [downloads-aria2][4] that explains how to install aria2 on each distro.

#### On Debian, Ubuntu and Linux Mint ####

Use the official aria2 PPA repository to install latest version of aria2 using the following commands.

    $ sudo add-apt-repository ppa:t-tujikawa/ppa
    $ sudo apt-get update
    $ sudo apt-get install aria2

#### On Fedora ####

Fedora’s official repositories already added aria2 package, so you can easily install it using the following yum command.

    $ sudo yum install aria2

#### Starting uGet ####

To start uGet application, from the desktop “Menu” on search bar type “uget“. Refer below screenshot.

![Start uGet Download Manager](http://www.tecmint.com/wp-content/uploads/2014/03/Start-uGet.gif)
Start uGet Download Manager

![uGet Version: 2.0](http://www.tecmint.com/wp-content/uploads/2014/03/uGet-Version.gif)
uGet Version: 2.0

#### Activate aria2 Plugin in uGet ####

To active the aria2 plugin, from the uGet menu go to Edit –> Settings –> Plug-in tab, from the drop-down select “arial2“.

![Enable Aria2 Plugin for uGet](http://www.tecmint.com/wp-content/uploads/2014/03/Enable-Aria2-Plugin.gif)
Enable Aria2 Plugin for uGet

### uGet 2.0 Screenshot Tour ###

![Download Files Using Aria2](http://www.tecmint.com/wp-content/uploads/2014/03/Download-Files-Using-Aria2.gif)
Download Files Using Aria2

![Download Torrent File Using uGet](http://www.tecmint.com/wp-content/uploads/2014/03/Download-Torrent-File.gif)
Download Torrent File Using uGet

![Batch Downloads Using uGet](http://www.tecmint.com/wp-content/uploads/2014/03/Batch-Download-Files.gif)
Batch Downloads Using uGet

uGet source files and RPM packages also available for other Linux distributions and Windows at [download page][5].

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-uget-download-manager-in-linux/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://uget.visuex.com/features
[2]:http://ugetdm.com/downloads
[3]:http://www.tecmint.com/install-aria2-a-multi-protocol-command-line-download-manager-in-rhel-centos-fedora/
[4]:http://ugetdm.com/downloads-aria2
[5]:http://ugetdm.com/downloads
