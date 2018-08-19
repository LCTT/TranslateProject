75 Most Used Essential Linux Applications of 2018
======

**2018** has been an awesome year for a lot of applications, especially those that are both free and open source. And while various Linux distributions come with a number of default apps, users are free to take them out and use any of the free or paid alternatives of their choice.

Today, we bring you a [list of Linux applications][3] that have been able to make it to users’ Linux installations almost all the time despite the butt-load of other alternatives.

To simply put, any app on this list is among the most used in its category, and if you haven’t already tried it out you are probably missing out. Enjoy!

### Backup Tools

#### Rsync

[Rsync][4] is an open source bandwidth-friendly utility tool for performing swift incremental file transfers and it is available for free.
```
$ rsync [OPTION...] SRC... [DEST]

```

To know more examples and usage, read our article “[10 Practical Examples of Rsync Command][5]” to learn more about it.

#### Timeshift

[Timeshift][6] provides users with the ability to protect their system by taking incremental snapshots which can be reverted to at a different date – similar to the function of Time Machine in Mac OS and System restore in Windows.

![](https://www.fossmint.com/wp-content/uploads/2018/07/Timeshift-Create-Linux-Mint-Snapshot.png)

### BitTorrent Client

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Torrent-Clients.png)

#### Deluge

[Deluge][7] is a beautiful cross-platform BitTorrent client that aims to perfect the **μTorrent** experience and make it available to users for free.

Install **Deluge** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:deluge-team/ppa
$ sudo apt-get update
$ sudo apt-get install deluge

```

#### qBittorent

[qBittorent][8] is an open source BitTorrent protocol client that aims to provide a free alternative to torrent apps like μTorrent.

Install **qBittorent** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
$ sudo apt-get update
$ sudo apt-get install qbittorrent

```

#### Transmission

[Transmission][9] is also a BitTorrent client with awesome functionalities and a major focus on speed and ease of use. It comes preinstalled with many Linux distros.

Install **Transmission** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:transmissionbt/ppa
$ sudo apt-get update
$ sudo apt-get install transmission-gtk transmission-cli transmission-common transmission-daemon

```

### Cloud Storage

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Cloud-Storage.png)

#### Dropbox

The [Dropbox][10] team rebranded their cloud service earlier this year to provide an even better performance and app integration for their clients. It starts with 2GB of storage for free.

Install **Dropbox** on **Ubuntu** and **Debian** , using following commands.
```
$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf - [On 32-Bit]
$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - [On 64-Bit]
$ ~/.dropbox-dist/dropboxd

```

#### Google Drive

[Google Drive][11] is Google’s cloud service solution and my guess is that it needs no introduction. Just like with **Dropbox** , you can sync files across all your connected devices. It starts with 15GB of storage for free and this includes Gmail, Google photos, Maps, etc.

Check out: [5 Google Drive Clients for Linux][12]

#### Mega

[Mega][13] stands out from the rest because apart from being extremely security-conscious, it gives free users 50GB to do as they wish! Its end-to-end encryption ensures that they can’t access your data, and if you forget your recovery key, you too wouldn’t be able to.

[**Download MEGA Cloud Storage for Ubuntu][14]

### Commandline Editors

![](https://www.fossmint.com/wp-content/uploads/2018/07/Commandline-Editors.png)

#### Vim

[Vim][15] is an open source clone of vi text editor developed to be customizable and able to work with any type of text.

Install **Vim** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim

```

#### Emacs

[Emacs][16] refers to a set of highly configurable text editors. The most popular variant, GNU Emacs, is written in Lisp and C to be self-documenting, extensible, and customizable.

Install **Emacs** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:kelleyk/emacs
$ sudo apt update
$ sudo apt install emacs25

```

#### Nano

[Nano][17] is a feature-rich CLI text editor for power users and it has the ability to work with different terminals, among other functionalities.

Install **Nano** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:n-muench/programs-ppa
$ sudo apt-get update
$ sudo apt-get install nano

```

### Download Manager

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Download-Managers.png)

#### Aria2

[Aria2][18] is an open source lightweight multi-source and multi-protocol command line-based downloader with support for Metalinks, torrents, HTTP/HTTPS, SFTP, etc.

Install **Aria2** on **Ubuntu** and **Debian** , using following command.
```
$ sudo apt-get install aria2

```

#### uGet

[uGet][19] has earned its title as the **#1** open source download manager for Linux distros and it features the ability to handle any downloading task you can throw at it including using multiple connections, using queues, categories, etc.

Install **uGet** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:plushuang-tw/uget-stable
$ sudo apt update
$ sudo apt install uget

```

#### XDM

[XDM][20], **Xtreme Download Manager** is an open source downloader written in Java. Like any good download manager, it can work with queues, torrents, browsers, and it also includes a video grabber and a smart scheduler.

Install **XDM** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:noobslab/apps
$ sudo apt-get update
$ sudo apt-get install xdman

```

### Email Clients

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Email-Clients.png)

#### Thunderbird

[Thunderbird][21] is among the most popular email applications. It is free, open source, customizable, feature-rich, and above all, easy to install.

Install **Thunderbird** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
$ sudo apt-get update
$ sudo apt-get install thunderbird

```

#### Geary

[Geary][22] is an open source email client based on WebKitGTK+. It is free, open-source, feature-rich, and adopted by the GNOME project.

Install **Geary** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:geary-team/releases
$ sudo apt-get update
$ sudo apt-get install geary

```

#### Evolution

[Evolution][23] is a free and open source email client for managing emails, meeting schedules, reminders, and contacts.

Install **Evolution** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:gnome3-team/gnome3-staging
$ sudo apt-get update
$ sudo apt-get install evolution

```

### Finance Software

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-Accounting-Software.png)

#### GnuCash

[GnuCash][24] is a free, cross-platform, and open source software for financial accounting tasks for personal and small to mid-size businesses.

Install **GnuCash** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
$ sudo apt-get update
$ sudo apt-get install gnucash

```

#### KMyMoney

[KMyMoney][25] is a finance manager software that provides all important features found in the commercially-available, personal finance managers.

Install **KMyMoney** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:claydoh/kmymoney2-kde4
$ sudo apt-get update
$ sudo apt-get install kmymoney

```

### IDE Editors

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-IDE-Editors.png)

#### Eclipse IDE

[Eclipse][26] is the most widely used Java IDE containing a base workspace and an impossible-to-overemphasize configurable plug-in system for personalizing its coding environment.

For installation, read our article “[How to Install Eclipse Oxygen IDE in Debian and Ubuntu][27]”

#### Netbeans IDE

A fan-favourite, [Netbeans][28] enables users to easily build applications for mobile, desktop, and web platforms using Java, PHP, HTML5, JavaScript, and C/C++, among other languages.

For installation, read our article “[How to Install Netbeans Oxygen IDE in Debian and Ubuntu][29]”

#### Brackets

[Brackets][30] is an advanced text editor developed by Adobe to feature visual tools, preprocessor support, and a design-focused user flow for web development. In the hands of an expert, it can serve as an IDE in its own right.

Install **Brackets** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:webupd8team/brackets
$ sudo apt-get update
$ sudo apt-get install brackets

```

#### Atom IDE

[Atom IDE][31] is a more robust version of Atom text editor achieved by adding a number of extensions and libraries to boost its performance and functionalities. It is, in a sense, Atom on steroids.

Install **Atom** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install snapd
$ sudo snap install atom --classic

```

#### Light Table

[Light Table][32] is a self-proclaimed next-generation IDE developed to offer awesome features like data value flow stats and coding collaboration.

Install **Light Table** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:dr-akulavich/lighttable
$ sudo apt-get update
$ sudo apt-get install lighttable-installer

```

#### Visual Studio Code

[Visual Studio Code][33] is a source code editor created by Microsoft to offer users the best-advanced features in a text editor including syntax highlighting, code completion, debugging, performance statistics and graphs, etc.

[**Download Visual Studio Code for Ubuntu][34]

### Instant Messaging

![](https://www.fossmint.com/wp-content/uploads/2018/07/Linux-IM-Clients.png)

#### Pidgin

[Pidgin][35] is an open source instant messaging app that supports virtually all chatting platforms and can have its abilities extended using extensions.

Install **Pidgin** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:jonathonf/backports
$ sudo apt-get update
$ sudo apt-get install pidgin

```

#### Skype

[Skype][36] needs no introduction and its awesomeness is available for any interested Linux user.

Install **Skype** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt install snapd
$ sudo snap install skype --classic

```

#### Empathy

[Empathy][37] is a messaging app with support for voice, video chat, text, and file transfers over multiple several protocols. It also allows you to add other service accounts to it and interface with all of them through it.

Install **Empathy** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install empathy

```

### Linux Antivirus

#### ClamAV/ClamTk

[ClamAV][38] is an open source and cross-platform command line antivirus app for detecting Trojans, viruses, and other malicious codes. [ClamTk][39] is its GUI front-end.

Install **ClamAV/ClamTk** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install clamav
$ sudo apt-get install clamtk

```

### Linux Desktop Environments

#### Cinnamon

[Cinnamon][40] is a free and open-source derivative of **GNOME3** and it follows the traditional desktop metaphor conventions.

Install **Cinnamon** desktop on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:embrosyn/cinnamon
$ sudo apt update
$ sudo apt install cinnamon-desktop-environment lightdm

```

#### Mate

The [Mate][41] Desktop Environment is a derivative and continuation of **GNOME2** developed to offer an attractive UI on Linux using traditional metaphors.

Install **Mate** desktop on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt install tasksel
$ sudo apt update
$ sudo tasksel install ubuntu-mate-desktop

```

#### GNOME

[GNOME][42] is a Desktop Environment comprised of several free and open-source applications and can run on any Linux distro and on most BSD derivatives.

Install **Gnome** desktop on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt install tasksel
$ sudo apt update
$ sudo tasksel install ubuntu-desktop

```

#### KDE

[KDE][43] is developed by the KDE community to provide users with a graphical solution to interfacing with their system and performing several computing tasks.

Install **KDE** desktop on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt install tasksel
$ sudo apt update
$ sudo tasksel install kubuntu-desktop

```

### Linux Maintenance Tools

#### GNOME Tweak Tool

The [GNOME Tweak Tool][44] is the most popular tool for customizing and tweaking GNOME3 and GNOME Shell settings.

Install **GNOME Tweak Tool** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt install gnome-tweak-tool

```

#### Stacer

[Stacer][45] is a free, open-source app for monitoring and optimizing Linux systems.

Install **Stacer** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:oguzhaninan/stacer
$ sudo apt-get update
$ sudo apt-get install stacer

```

#### BleachBit

[BleachBit][46] is a free disk space cleaner that also works as a privacy manager and system optimizer.

[**Download BleachBit for Ubuntu][47]

### Linux Terminals

#### GNOME Terminal

[GNOME Terminal][48] is GNOME’s default terminal emulator.

Install **Gnome Terminal** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install gnome-terminal

```

#### Konsole

[Konsole][49] is a terminal emulator for KDE.

Install **Konsole** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install konsole

```

#### Terminator

[Terminator][50] is a feature-rich GNOME Terminal-based terminal app built with a focus on arranging terminals, among other functions.

Install **Terminator** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install terminator

```

#### Guake

[Guake][51] is a lightweight drop-down terminal for the GNOME Desktop Environment.

Install **Guake** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install guake

```

### Multimedia Editors

#### Ardour

[Ardour][52] is a beautiful Digital Audio Workstation (DAW) for recording, editing, and mixing audio professionally.

Install **Ardour** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:dobey/audiotools
$ sudo apt-get update
$ sudo apt-get install ardour

```

#### Audacity

[Audacity][53] is an easy-to-use cross-platform and open source multi-track audio editor and recorder; arguably the most famous of them all.

Install **Audacity** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:ubuntuhandbook1/audacity
$ sudo apt-get update
$ sudo apt-get install audacity

```

#### GIMP

[GIMP][54] is the most popular open source Photoshop alternative and it is for a reason. It features various customization options, 3rd-party plugins, and a helpful user community.

Install **Gimp** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:otto-kesselgulasch/gimp
$ sudo apt update
$ sudo apt install gimp

```

#### Krita

[Krita][55] is an open source painting app that can also serve as an image manipulating tool and it features a beautiful UI with a reliable performance.

Install **Krita** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:kritalime/ppa
$ sudo apt update
$ sudo apt install krita

```

#### Lightworks

[Lightworks][56] is a powerful, flexible, and beautiful tool for editing videos professionally. It comes feature-packed with hundreds of amazing effects and presets that allow it to handle any editing task that you throw at it and it has 25 years of experience to back up its claims.

[**Download Lightworks for Ubuntu][57]

#### OpenShot

[OpenShot][58] is an award-winning free and open source video editor known for its excellent performance and powerful capabilities.

Install **Openshot** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:openshot.developers/ppa
$ sudo apt update
$ sudo apt install openshot-qt

```

#### PiTiV

[Pitivi][59] is a beautiful video editor that features a beautiful code base, awesome community, is easy to use, and allows for hassle-free collaboration.

Install **PiTiV** on **Ubuntu** and **Debian** , using following commands.
```
$ flatpak install --user https://flathub.org/repo/appstream/org.pitivi.Pitivi.flatpakref
$ flatpak install --user http://flatpak.pitivi.org/pitivi.flatpakref
$ flatpak run org.pitivi.Pitivi//stable

```

### Music Players

#### Rhythmbox

[Rhythmbox][60] posses the ability to perform all music tasks you throw at it and has so far proved to be a reliable music player that it ships with Ubuntu.

Install **Rhythmbox** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:fossfreedom/rhythmbox
$ sudo apt-get update
$ sudo apt-get install rhythmbox

```

#### Lollypop

[Lollypop][61] is a beautiful, relatively new, open source music player featuring a number of advanced options like online radio, scrubbing support and party mode. Yet, it manages to keep everything simple and easy to manage.

Install **Lollypop** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:gnumdk/lollypop
$ sudo apt-get update
$ sudo apt-get install lollypop

```

#### Amarok

[Amarok][62] is a robust music player with an intuitive UI and tons of advanced features bundled into a single unit. It also allows users to discover new music based on their genre preferences.

Install **Amarok** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get update
$ sudo apt-get install amarok

```

#### Clementine

[Clementine][63] is an Amarok-inspired music player that also features a straight-forward UI, advanced control features, and the ability to let users search for and discover new music.

Install **Clementine** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:me-davidsansome/clementine
$ sudo apt-get update
$ sudo apt-get install clementine

```

#### Cmus

[Cmus][64] is arguably the most efficient CLI music player, Cmus is fast and reliable, and its functionality can be increased using extensions.

Install **Cmus** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:jmuc/cmus
$ sudo apt-get update
$ sudo apt-get install cmus

```

### Office Suites

#### Calligra Suite

The [Calligra Suite][65] provides users with a set of 8 applications which cover working with office, management, and graphics tasks.

Install **Calligra Suite** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install calligra

```

#### LibreOffice

[LibreOffice][66] the most actively developed office suite in the open source community, LibreOffice is known for its reliability and its functions can be increased using extensions.

Install **LibreOffice** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:libreoffice/ppa
$ sudo apt update
$ sudo apt install libreoffice

```

#### WPS Office

[WPS Office][67] is a beautiful office suite alternative with a more modern UI.

[**Download WPS Office for Ubuntu][68]

### Screenshot Tools

#### Shutter

[Shutter][69] allows users to take screenshots of their desktop and then edit them using filters and other effects coupled with the option to upload and share them online.

Install **Shutter** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository -y ppa:shutter/ppa
$ sudo apt update
$ sudo apt install shutter

```

#### Kazam

[Kazam][70] screencaster captures screen content to output a video and audio file supported by any video player with VP8/WebM and PulseAudio support.

Install **Kazam** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:kazam-team/unstable-series
$ sudo apt update
$ sudo apt install kazam python3-cairo python3-xlib

```

#### Gnome Screenshot

[Gnome Screenshot][71] was once bundled with Gnome utilities but is now a standalone app. It can be used to take screencasts in a format that is easily shareable.

Install **Gnome Screenshot** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get update
$ sudo apt-get install gnome-screenshot

```

### Screen Recorders

#### SimpleScreenRecorder

[SimpleScreenRecorder][72] was created to be better than the screen-recording apps available at the time of its creation and has now turned into one of the most efficient and easy-to-use screen recorders for Linux distros.

Install **SimpleScreenRecorder** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
$ sudo apt-get update
$ sudo apt-get install simplescreenrecorder

```

#### recordMyDesktop

[recordMyDesktop][73] is an open source session recorder that is also capable of recording desktop session audio.

Install **recordMyDesktop** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get update
$ sudo apt-get install gtk-recordmydesktop

```

### Text Editors

#### Atom

[Atom][74] is a modern and customizable text editor created and maintained by GitHub. It is ready for use right out of the box and can have its functionality enhanced and its UI customized using extensions and themes.

Install **Atom** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install snapd
$ sudo snap install atom --classic

```

#### Sublime Text

[Sublime Text][75] is easily among the most awesome text editors to date. It is customizable, lightweight (even when bulldozed with a lot of data files and extensions), flexible, and remains free to use forever.

Install **Sublime Text** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install snapd
$ sudo snap install sublime-text

```

#### Geany

[Geany][76] is a memory-friendly text editor with basic IDE features designed to exhibit shot load times and extensible functions using libraries.

Install **Geany** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get update
$ sudo apt-get install geany

```

#### Gedit

[Gedit][77] is famous for its simplicity and it comes preinstalled with many Linux distros because of its function as an excellent general purpose text editor.

Install **Gedit** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get update
$ sudo apt-get install gedit

```

### To-Do List Apps

#### Evernote

[Evernote][78] is a cloud-based note-taking productivity app designed to work perfectly with different types of notes including to-do lists and reminders.

There is no any official evernote app for Linux, so check out other third party [6 Evernote Alternative Clients for Linux][79].

#### Everdo

[Everdo][78] is a beautiful, security-conscious, low-friction Getting-Things-Done app productivity app for handling to-dos and other note types. If Evernote comes off to you in an unpleasant way, Everdo is a perfect alternative.

[**Download Everdo for Ubuntu][80]

#### Taskwarrior

[Taskwarrior][81] is an open source and cross-platform command line app for managing tasks. It is famous for its speed and distraction-free environment.

Install **Taskwarrior** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get update
$ sudo apt-get install taskwarrior

```

### Video Players

#### Banshee

[Banshee][82] is an open source multi-format-supporting media player that was first developed in 2005 and has only been getting better since.

Install **Banshee** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:banshee-team/ppa
$ sudo apt-get update
$ sudo apt-get install banshee

```

#### VLC

[VLC][83] is my favourite video player and it’s so awesome that it can play almost any audio and video format you throw at it. You can also use it to play internet radio, record desktop sessions, and stream movies online.

Install **VLC** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:videolan/stable-daily
$ sudo apt-get update
$ sudo apt-get install vlc

```

#### Kodi

[Kodi][84] is among the world’s most famous media players and it comes as a full-fledged media centre app for playing all things media whether locally or remotely.

Install **Kodi** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:team-xbmc/ppa
$ sudo apt-get update
$ sudo apt-get install kodi

```

#### SMPlayer

[SMPlayer][85] is a GUI for the award-winning **MPlayer** and it is capable of handling all popular media formats; coupled with the ability to stream from YouTube, Chromcast, and download subtitles.

Install **SMPlayer** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:rvm/smplayer
$ sudo apt-get update
$ sudo apt-get install smplayer

```

### Virtualization Tools

#### VirtualBox

[VirtualBox][86] is an open source app created for general-purpose OS virtualization and it can be run on servers, desktops, and embedded systems.

Install **VirtualBox** on **Ubuntu** and **Debian** , using following commands.
```
$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install virtualbox-5.2
$ virtualbox

```

#### VMWare

[VMware][87] is a digital workspace that provides platform virtualization and cloud computing services to customers and is reportedly the first to successfully virtualize x86 architecture systems. One of its products, VMware workstations allows users to run multiple OSes in a virtual memory.

For installation, read our article “[How to Install VMware Workstation Pro on Ubuntu][88]“.

### Web Browsers

#### Chrome

[Google Chrome][89] is undoubtedly the most popular browser. Known for its speed, simplicity, security, and beauty following Google’s Material Design trend, Chrome is a browser that web developers cannot do without. It is also free to use and open source.

Install **Google Chrome** on **Ubuntu** and **Debian** , using following commands.
```
$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
$ sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
$ sudo apt-get update
$ sudo apt-get install google-chrome-stable

```

#### Firefox

[Firefox Quantum][90] is a beautiful, speed, task-ready, and customizable browser capable of any browsing task that you throw at it. It is also free, open source, and packed with developer-friendly tools that are easy for even beginners to get up and running with.

Install **Firefox Quantum** on **Ubuntu** and **Debian** , using following commands.
```
$ sudo add-apt-repository ppa:mozillateam/firefox-next
$ sudo apt update && sudo apt upgrade
$ sudo apt install firefox

```

#### Vivaldi

[Vivaldi][91] is a free and open source Chrome-based project that aims to perfect Chrome’s features with a couple of more feature additions. It is known for its colourful panels, memory-friendly performance, and flexibility.

[**Download Vivaldi for Ubuntu][91]

That concludes our list for today. Did I skip a famous title? Tell me about it in the comments section below.

Don’t forget to share this post and to subscribe to our newsletter to get the latest publications from FossMint.


--------------------------------------------------------------------------------

via: https://www.fossmint.com/most-used-linux-applications/

作者：[Martins D. Okoi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.fossmint.com/author/dillivine/
[1]:https://plus.google.com/share?url=https://www.fossmint.com/most-used-linux-applications/ (Share on Google+)
[2]:https://www.linkedin.com/shareArticle?mini=true&url=https://www.fossmint.com/most-used-linux-applications/ (Share on LinkedIn)
[3]:https://www.fossmint.com/awesome-linux-software/
[4]:https://rsync.samba.org/
[5]:https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[6]:https://github.com/teejee2008/timeshift
[7]:https://deluge-torrent.org/
[8]:https://www.qbittorrent.org/
[9]:https://transmissionbt.com/
[10]:https://www.dropbox.com/
[11]:https://www.google.com/drive/
[12]:https://www.fossmint.com/best-google-drive-clients-for-linux/
[13]:https://mega.nz/
[14]:https://mega.nz/sync!linux
[15]:https://www.vim.org/
[16]:https://www.gnu.org/s/emacs/
[17]:https://www.nano-editor.org/
[18]:https://aria2.github.io/
[19]:http://ugetdm.com/
[20]:http://xdman.sourceforge.net/
[21]:https://www.thunderbird.net/
[22]:https://github.com/GNOME/geary
[23]:https://github.com/GNOME/evolution
[24]:https://www.gnucash.org/
[25]:https://kmymoney.org/
[26]:https://www.eclipse.org/ide/
[27]:https://www.tecmint.com/install-eclipse-oxygen-ide-in-ubuntu-debian/
[28]:https://netbeans.org/
[29]:https://www.tecmint.com/install-netbeans-ide-in-ubuntu-debian-linux-mint/
[30]:http://brackets.io/
[31]:https://ide.atom.io/
[32]:http://lighttable.com/
[33]:https://code.visualstudio.com/
[34]:https://code.visualstudio.com/download
[35]:https://www.pidgin.im/
[36]:https://www.skype.com/
[37]:https://wiki.gnome.org/Apps/Empathy
[38]:https://www.clamav.net/
[39]:https://dave-theunsub.github.io/clamtk/
[40]:https://github.com/linuxmint/cinnamon-desktop
[41]:https://mate-desktop.org/
[42]:https://www.gnome.org/
[43]:https://www.kde.org/plasma-desktop
[44]:https://github.com/nzjrs/gnome-tweak-tool
[45]:https://github.com/oguzhaninan/Stacer
[46]:https://www.bleachbit.org/
[47]:https://www.bleachbit.org/download
[48]:https://github.com/GNOME/gnome-terminal
[49]:https://konsole.kde.org/
[50]:https://gnometerminator.blogspot.com/p/introduction.html
[51]:http://guake-project.org/
[52]:https://ardour.org/
[53]:https://www.audacityteam.org/
[54]:https://www.gimp.org/
[55]:https://krita.org/en/
[56]:https://www.lwks.com/
[57]:https://www.lwks.com/index.php?option=com_lwks&view=download&Itemid=206
[58]:https://www.openshot.org/
[59]:http://www.pitivi.org/
[60]:https://wiki.gnome.org/Apps/Rhythmbox
[61]:https://gnumdk.github.io/lollypop-web/
[62]:https://amarok.kde.org/en
[63]:https://www.clementine-player.org/
[64]:https://cmus.github.io/
[65]:https://www.calligra.org/tour/calligra-suite/
[66]:https://www.libreoffice.org/
[67]:https://www.wps.com/
[68]:http://wps-community.org/downloads
[69]:http://shutter-project.org/
[70]:https://launchpad.net/kazam
[71]:https://gitlab.gnome.org/GNOME/gnome-screenshot
[72]:http://www.maartenbaert.be/simplescreenrecorder/
[73]:http://recordmydesktop.sourceforge.net/about.php
[74]:https://atom.io/
[75]:https://www.sublimetext.com/
[76]:https://www.geany.org/
[77]:https://wiki.gnome.org/Apps/Gedit
[78]:https://everdo.net/
[79]:https://www.fossmint.com/evernote-alternatives-for-linux/
[80]:https://everdo.net/linux/
[81]:https://taskwarrior.org/
[82]:http://banshee.fm/
[83]:https://www.videolan.org/
[84]:https://kodi.tv/
[85]:https://www.smplayer.info/
[86]:https://www.virtualbox.org/wiki/VirtualBox
[87]:https://www.vmware.com/
[88]:https://www.tecmint.com/install-vmware-workstation-in-linux/
[89]:https://www.google.com/chrome/
[90]:https://www.mozilla.org/en-US/firefox/
[91]:https://vivaldi.com/
