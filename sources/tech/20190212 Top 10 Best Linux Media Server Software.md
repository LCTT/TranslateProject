[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 10 Best Linux Media Server Software)
[#]: via: (https://itsfoss.com/best-linux-media-server)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Top 10 Best Linux Media Server Software
======

Did someone tell you that Linux is just for programmers? That is so wrong! You have got a lot of great tools for [digital artists][1], [writers][2] and musicians.

We have covered such tools in the past. Today it’s going to be slightly different. Instead of creating new digital content, let’s talk about consuming it.

You have probably heard of media servers? Basically these software (and sometimes gadgets) allow you to view your local or cloud media (music, videos etc) in an intuitive interface. You can even use it to stream the content to other devices on your network. Sort of your personal Netflix.

In this article, we will talk about the best media software available for Linux that you can use as a media player or as a media server software – as per your requirements.

Some of these applications can also be used with Google’s Chromecast and Amazon’s Firestick.

### Best Media Server Software for Linux

![Best Media Server Software for Linux][3]

The mentioned Linux media server software are in no particular order of ranking.

I have tried to provide installation instructions for Ubuntu and Debian based distributions. It’s not possible to list installation steps for all Linux distributions for all the media servers mentioned here. Please take no offence for that.

A couple of software in this list are not open source. If that’s the case, I have highlighted it appropriately.

### 1\. Kodi

![Kodi Media Server][4]

Kod is one of the most popular media server software and player. Recently, Kodi 18.0 dropped in with a bunch of improvements that includes the support for Digital Rights Management (DRM) decryption, game emulators, ROMs, voice control, and more.

It is a completely free and open source software. An active community for discussions and support exists as well. The user interface for Kodi is beautiful. I haven’t had the chance to use it in its early days – but I was amazed to see such a good UI for a Linux application.

It has got great playback support – so you can add any supported 3rd party media service for the content or manually add the ripped video files to watch.

#### How to install Kodi

Type in the following commands in the terminal to install the latest version of Kodi via its [official PPA][5].

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi
```

To know more about installing a development build or upgrading Kodi, refer to the [official installation guide][6].

### 2\. Plex

![Plex Media Server][7]

Plex is yet another impressive media player or could be used as a media server software. It is a great alternative to Kodi for the users who mostly utilize it to create an offline network of their media collection to sync and watch across multiple devices.

Unlike Kodi, **Plex is not entirely open source**. It does offer a free account in order to use it. In addition, it offers premium pricing plans to unlock more features and have a greater control over your media while also being able to get a detailed insight on who/what/how Plex is being used.

If you are an audiophile, you would love the integration of Plex with [TIDAL][8] music streaming service. You can also set up Live TV by adding it to your tuner.

#### How to install Plex

You can simply download the .deb file available on their official webpage and install it directly (or using [GDebi][9])

### 3\. Jellyfin

![Emby media server][10]

Yet another open source media server software with a bunch of features. [Jellyfin][11] is actually a fork of Emby media server. It may be one of the best out there available for ‘free’ but the multi-platform support still isn’t there yet.

You can run it on a browser or utilize Chromecast – however – you will have to wait if you want the Android app or if you want it to support several devices.

#### How to install Jellyfin

Jellyfin provides a [detailed documentation][12] on how to install it from the binary packages/image available for Linux, Docker, and more.

You will also find it easy to install it from the repository via the command line for Debian-based distribution. Check out their [installation guide][13] for more information.

### 4\. LibreELEC

![libreELEC][14]

LibreELEC is an interesting media server software which is based on Kodi v18.0. They have recently released a new version (9.0.0) with a complete overhaul of the core OS support, hardware compatibility and user experience.

Of course, being based on Kodi, it also has the DRM support. In addition, you can utilize its generic Linux builds or the special ones tailored for Raspberry Pi builds, WeTek devices, and more.

#### How to install LibreELEC

You can download the installer from their [official site][15]. For detailed instructions on how to use it, please refer to the [installation guide][16].

### 5\. OpenFLIXR Media Server

![OpenFLIXR Media Server][17]

Want something similar that compliments Plex media server but also compatible with VirtualBox or VMWare? You got it!

OpenFLIXR is an automated media server software which integrates with Plex to provide all the features along with the ability to auto download TV shows and movies from Torrents. It even fetches the subtitles automatically giving you a seamless experience when coupled with Plex media software.

You can also automate your home theater with this installed. In case you do not want to run it on a physical instance, it supports VMware, VirtualBox and Hyper-V as well. The best part is – it is an open source solution and based on Ubuntu Server.

#### How to install OpenFLIXR

The best way to do it is by installing VirtualBox – it will be easier. After you do that, just download it from the [official website][18] and import it.

### 6\. MediaPortal

![MediaPortal][19]

MediaPortal is just another open source simple media server software with a decent user interface. It all depends on your personal preference – event though I would recommend Kodi over this.

You can play DVDs, stream videos on your local network, and listen to music as well. It does not offer a fancy set of features but the ones you will mostly need.

It gives you the option to choose from two different versions (one that is stable and the second which tries to incorporate new features – could be unstable).

#### How to install MediaPotal

Depending on what you want to setup (A TV-server only or a complete server setup), follow the [official setup guide][20] to install it properly.

### 7\. Gerbera

![Gerbera Media Center][21]

A simple implementation for a media server to be able to stream using your local network. It does support transcoding which will convert the media in the format your device supports.

If you have been following the options for media server form a very long time, then you might identify this as the rebranded (and improved) version of MediaTomb. Even though it is not a popular choice among the Linux users – it is still something usable when all fails or for someone who prefers a straightforward and a basic media server.

#### How to install Gerbera

Type in the following commands in the terminal to install it on any Ubuntu-based distro:

```
sudo apt install gerbera
```

For other Linux distributions, refer to the [documentation][22].

### 8\. OSMC (Open Source Media Center)

![OSMC Open Source Media Center][23]

It is an elegant-looking media server software originally based on Kodi media center. I was quite impressed with the user interface. It is simple and robust, being a free and open source solution. In a nutshell, all the essential features you would expect in a media server software.

You can also opt in to purchase OSMC’s flagship device. It will play just about anything up to 4K standards with HD audio. In addition, it supports Raspberry Pi builds and 1st-gen Apple TV.

#### How to install OSMC

If your device is compatible, you can just select your operating system and download the device installer from the official [download page][24] and create a bootable image to install.

### 9\. Universal Media Server

![][25]

Yet another simple addition to this list. Universal Media Server does not offer any fancy features but just helps you transcode / stream video and audio without needing much configuration.

It supports Xbox 360, PS 3, and just about any other [DLNA][26]-capable devices.

#### How to install Universal Media Center

You can find all the packages listed on [FossHub][27] but you should follow the [official forum][28] to know more about how to install the package that you downloaded from the website.

### 10\. Red5 Media Server

![Red5 Media Server][29]Image Credit: [Red5 Server][30]

A free and open source media server tailored for enterprise usage. You can use it for live streaming solutions – no matter if it is for entertainment or just video conferencing.

They also offer paid licensing options for mobiles and high scalability.

#### How to install Red5

Even though it is not the quickest installation method, follow the [installation guide on GitHub][31] to get started with the server without needing to tinker around.

### Wrapping Up

Every media server software listed here has its own advantages – you should pick one up and try the one which suits your requirement.

Did we miss any of your favorite media server software? Let us know about it in the comments below!


--------------------------------------------------------------------------------

via: https://itsfoss.com/best-linux-media-server

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-graphic-design-software/
[2]: https://itsfoss.com/open-source-tools-writers/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/best-media-server-linux.png?resize=800%2C450&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/kodi-18-media-server.jpg?fit=800%2C450&ssl=1
[5]: https://itsfoss.com/ppa-guide/
[6]: https://kodi.wiki/view/HOW-TO:Install_Kodi_for_Linux
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/plex.jpg?fit=800%2C368&ssl=1
[8]: https://tidal.com/
[9]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/emby-server.jpg?fit=800%2C373&ssl=1
[11]: https://jellyfin.github.io/
[12]: https://jellyfin.readthedocs.io/en/latest/
[13]: https://jellyfin.readthedocs.io/en/latest/administrator-docs/installing/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/libreelec.jpg?resize=800%2C600&ssl=1
[15]: https://libreelec.tv/downloads_new/
[16]: https://libreelec.wiki/libreelec_usb-sd_creator
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/openflixr-media-server.jpg?fit=800%2C449&ssl=1
[18]: http://www.openflixr.com/#Download
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/mediaportal.jpg?ssl=1
[20]: https://www.team-mediaportal.com/wiki/display/MediaPortal1/Quick+Setup
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/gerbera-server-softwarei.jpg?fit=800%2C583&ssl=1
[22]: http://docs.gerbera.io/en/latest/install.html
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/osmc-server.jpg?fit=800%2C450&ssl=1
[24]: https://osmc.tv/download/
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/universal-media-server.jpg?ssl=1
[26]: https://en.wikipedia.org/wiki/Digital_Living_Network_Alliance
[27]: https://www.fosshub.com/Universal-Media-Server.html?dwl=UMS-7.8.0.tgz
[28]: https://www.universalmediaserver.com/forum/viewtopic.php?t=10275
[29]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/red5.jpg?resize=800%2C364&ssl=1
[30]: https://www.red5server.com/
[31]: https://github.com/Red5/red5-server/wiki/Installation-on-Linux
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/best-media-server-linux.png?fit=800%2C450&ssl=1
