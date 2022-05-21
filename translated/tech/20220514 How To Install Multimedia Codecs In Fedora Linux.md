[#]: subject: "How To Install Multimedia Codecs In Fedora Linux"
[#]: via: "https://ostechnix.com/how-to-install-multimedia-codecs-in-fedora-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Fedora Linux 中安装多媒体编码器 
======
在新安装 Fedora后，安装多媒体编码器来播放音频和视频是第一件要事。在这篇简单的教程中，我们将看到如何在 Fedora 36 workstation 中从 RPM Fusion 软件包存储库中安装多媒体编码器。

### 序言

很多多媒体编码器要么是闭源的，要么是非自由的，因此出于法律的原因，它们没有包含在 Fedora Linux 的默认存储库中。

幸运的是，一些第三方存储库提供了受限的和非自由的多媒体编码器、软件包和库。一个流行的社区驱动的第三方存储库是 **RPM Fusion**。

如果你想在你的 Fedora 桌面环境中播放大多数的音频或视频格式的文件，你应该从 RPM  Fusion 中安装必要的多媒体编码器，如下所述。

### 在 Fedora Linux 中安装多媒体编码器

确保你已经在你的 Fedora 机器中安装了 RPM Fusion 存储库。如果你尚未添加它，参考下面的链接来在 Fedora 中启用 RPM Fusion 存储库：

* [如何在 Fedora、RHEL 中启用 RPM Fusion 存储库][1]

在启用 RPM Fusion 存储库后，在你的 Fedora 系统中依次运行下面的命令来安装多媒体编码器：

```
$ sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
```

如果上面的命令不工作，尝试下面的命令：

```
$ sudo dnf install gstreamer1-plugins-{bad-*,good-*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
```

```
$ sudo dnf install lame* --exclude=lame-devel
```

```
$ sudo dnf group upgrade --with-optional Multimedia
```

这三个命令安装了非常多的东西，可以在你的 Fedora 系统中播放所有的音频和视频格式的文件。

#### 安装多媒体播放器

一些流行的媒体播放器，诸如 VLC、Celluloid、SMplayer 和 Plex-media-palyer 等等，将提供所有需要是编码器。你不需要将它们全部都安装，只要任意一两个就足够了。下面给出安装这些播放器的命令：

```
$ sudo dnf install vlc
```

VLC 预装在很多 Linux 发行版中，它是一个标准的用于播放各种媒体类型文件的媒体播放器。

SMplayer 是 Mplayer 的前端，它被认为是 VLC 的最佳替代品。 

```
$ sudo dnf install smplayer
```

如果你想要更强大是多媒体体验，安装 Plex-media-player。

```
$ sudo dnf install plex-media-player
```

这将不仅为你提供 h264、h265、vp8 和 vp9 编码器 (均带硬件支持)，它也将启用一种更高效的编码器 av1 (又名 av01)。你可以使用 [AV1 Beta Launch Playlist][2]来测试你的浏览器是否支持这个编码器。

它们中的一些播放器也可以作为 **flatpak** 格式的应用程序来使用的。如果与传统的软件包管理器相比，你更喜欢 flatpak 格式的应用程序，你可以安装它们。现在大多数的 Linux 发行版都支持开箱即用的 flatpak 格式的应用程序

为安装 VLC 的 flatpak 版本，运行：

```
$ flatpak install vlc
```

#### 可选 - 安装 FFmpeg

**FFmpeg** 是一个功能强大的多媒体框架，它可用于编码、解码、转码、mux, demux, record, stream, filter, 以及播放各种类型的媒体文件。你可以通过在你的系统上安装 FFmpeg 来获取相应的解码器。

* [如何在 Linux 中安装 FFmpeg][3]

希望这有帮助。

**相关阅读:**

* [在 Fedora Silverblue 中的 Chromium 和 Firefox 上启用 H264][4]
* [如何在 OpenSUSE 中安装多媒体解码器][5]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-install-multimedia-codecs-in-fedora-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-enable-rpm-fusion-repository-in-fedora-rhel/
[2]: https://www.youtube.com/playlist?list=PLyqf6gJt7KuHBmeVzZteZUlNUQAVLwrZS
[3]: https://ostechnix.com/install-ffmpeg-linux/
[4]: https://ostechnix.com/enable-h264-on-chromium-and-firefox-in-fedora-silverblue/
[5]: https://ostechnix.com/how-to-install-multimedia-codecs-in-opensuse/

