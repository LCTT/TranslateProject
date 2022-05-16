[#]: subject: "How To Install Multimedia Codecs In Fedora Linux"
[#]: via: "https://ostechnix.com/how-to-install-multimedia-codecs-in-fedora-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Install Multimedia Codecs In Fedora Linux
======
One of the first thing to do after a fresh Fedora installation is to install multimedia codecs to play audio and video. In this brief tutorial, we will see how to install multimedia codecs in Fedora 36 workstation from RPM Fusion software repository.

### Introduction

Many multimedia codecs are either closed source or nonfree, so they are not included in the default repositories of Fedora Linux due to legal reasons.

Fortunately, some third party repositories provides the restricted and nonfree multimedia codecs, packages and libraries. One of the popular community-driven, third party repository is **RPM Fusion**.

If you want to play most audio or video formats in your Fedora desktop, you should install the necessary multimedia codecs from RPM Fusion as outlined below.

### Install Multimedia Codecs In Fedora Linux

Make sure you have installed RPM Fusion repository in your Fedora machine. If you haven't added it yet, refer the following link to enable RPM Fusion repository in Fedora:

* [How To Enable RPM Fusion Repository In Fedora, RHEL][1]

After enabling RPM Fusion, run the following commands one by one to install multimedia codecs in your Fedora system:

```
$ sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
```

If the above command doesn't work, try the following command instead:

```
$ sudo dnf install gstreamer1-plugins-{bad-*,good-*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
```

```
$ sudo dnf install lame* --exclude=lame-devel
```

```
$ sudo dnf group upgrade --with-optional Multimedia
```

These three commands installs pretty much everything to play all audio and video formats in your Fedora system.

#### Install Multimedia Players

Some popular media players such as VLC, Celluloid, SMplayer and Plex-media-palyer etc., will give all necessary codecs. You don't have install all of them. Any one or two are sufficient. The commands to install these players are given below:

```
$ sudo dnf install vlc
```

VLC comes pre-installed in many Linux distributions and it is a standard media player to play all kind of media files.

SMplayer is the front-end for Mplayer and it is considered as best alternative to VLC.

```
$ sudo dnf install smplayer
```

If you want more robust multimedia experience, install Plex media player.

```
$ sudo dnf install plex-media-player
```

This will not only provide you h264, h265, vp8 and vp9 codecs(all with hardware support), it will also enable av1 (aka av01) a more efficient codec. You can test if your browser supports this codec using the [AV1 Beta Launch Playlist][2].

Some of these players are available as **flatpak** applications as well. You can install them if you preferred flatpak over the traditional package manager. Most Linux distributions supports flatpak out of the box now.

To install VLC flatpak version, run:

```
$ flatpak install vlc
```

#### Optional - Install FFmpeg

**FFmpeg** is a powerful multimedia framework that can be used to encode, decode, transcode, mux, demux, record, stream, filter, and play any type of media files. You can get necessary codecs by installing FFmpeg suite on your system.

* [How To Install FFmpeg In Linux][3]

Hope this helps.

**Related read:**

* [Enable H264 On Chromium And Firefox In Fedora Silverblue][4]
* [How To Install Multimedia Codecs In OpenSUSE][5]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-install-multimedia-codecs-in-fedora-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-enable-rpm-fusion-repository-in-fedora-rhel/
[2]: https://www.youtube.com/playlist?list=PLyqf6gJt7KuHBmeVzZteZUlNUQAVLwrZS
[3]: https://ostechnix.com/install-ffmpeg-linux/
[4]: https://ostechnix.com/enable-h264-on-chromium-and-firefox-in-fedora-silverblue/
[5]: https://ostechnix.com/how-to-install-multimedia-codecs-in-opensuse/
