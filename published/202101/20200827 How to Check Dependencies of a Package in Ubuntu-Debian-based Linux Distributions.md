[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12987-1.html)
[#]: subject: (How to Check Dependencies of a Package in Ubuntu/Debian-based Linux Distributions)
[#]: via: (https://itsfoss.com/check-dependencies-package-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在基于 Ubuntu 或 Debian 的 Linux 发行版中查看一个软件包的依赖
======

![](https://img.linux.net.cn/data/attachment/album/202101/06/112738sv0dmjojmjokpxt0.jpg)

在 Ubuntu 或 Debian 中通过命令行来安装应用是一件很简单的事，你只需要执行 `apt install package_name` 就可以了。

但如果你想在安装一个软件包之前或之后知晓这个软件包的依赖，那该怎么办呢？

在本教程中，我将向你展示多种方法来在 Ubuntu 或其他使用 [APT 包管理器][1] 的 Debian 系 Linux 发行版中查看一个软件包的依赖。

### 什么是 Ubuntu 中的包依赖？

当你在 Linux 中安装一个软件包，有时这个软件包还需要其他的软件包来使它工作正常。这些额外的软件包就叫作这个包的依赖。假如这些软件包之前没有在系统中被安装，那么这些依赖在安装这个软件包的同时会被自动安装上。

举个例子，用来转换视频格式的 GUI 工具 [HandBrake][2] 需要 [FFmpeg][3]、[GStreamer][4] 软件包。所以对于 HandBrake 来说， FFmpeg 和 GStreamer 就是它的包依赖。

假如在你的系统上这些软件包没有被安装，则当你 [在 Ubuntu 上安装 HandBrake][5] 时，就会自动安装上它们。

### 在 Ubuntu 和基于 Debian 的发行版中查看一个软件包的依赖

正如在 Linux 上经常发生的那样，有多种方法来达到相同的目标。下面让我们一起瞧瞧查看一个软件包依赖的多种方法。

#### 使用 apt show 来查看依赖

你可以使用 [apt show 命令][6] 来展示一个包的详细信息。其中依赖信息就是其中一部分，你可以在以 “Depends” 打头的那些行中看到它们。 

例如，下面展示的是使用 `apt show` 展示 [ubuntu-restricted-extras][7] 这个包的详细信息：

```
abhishek@itsfoss:~$ apt show ubuntu-restricted-extras 
Package: ubuntu-restricted-extras
Version: 67
Priority: optional
Section: multiverse/metapackages
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 14.3 kB
Depends: ubuntu-restricted-addons
Recommends: libavcodec-extra, ttf-mscorefonts-installer, unrar
Download-Size: 3,200 B
APT-Manual-Installed: yes
APT-Sources: http://us.archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages
Description: Commonly used media codecs and fonts for Ubuntu
 This collection of packages includes:
  - MP3 and other audio codec software to play various audio formats
    (GStreamer plugins)
  - software to install the Microsoft Web fonts
  - the Adobe Flash plugin
  - LAME, software to create compressed audio files.
 .
 This software does not include libdvdcss2, and will not let you play
 encrypted DVDs. For more information, see
 https://help.ubuntu.com/community/RestrictedFormats/PlayingDVDs
 .
 These software packages are from the Multiverse channel, restricted by
 copyright or legal issues in some countries. For more information, see
 http://www.ubuntu.com/ubuntu/licensing
```

如你所见，`ubuntu-restricted-extras` 包依赖于 `ubuntu-restricted-addons` 这个软件包。

但你得小心的是依赖包还可能依赖于其他包，这样一直循环往复直到尽头。但幸好 APT 包管理器可以为你处理这些复杂的依赖关系，自动地安装所有的依赖（大多数情况下）。

> **什么是推荐包？**
>
> 你注意到了上面结果输出中以 “Recommends” 开头的那些行了吗？
>
> 推荐包不是软件包的直接依赖，但它们可以开启软件包的一些额外功能。
>
> 正如你上面看到的那样， `ubuntu-restricted-extras` 包有 `ttf-mscorefonts-installer` 这个推荐包，用来在 Ubuntu 上安装 Microsoft 的字体。
>
> 这些推荐包也会默认被一同安装上，假如你想显式地禁止这些推荐包的安装，你可以像下面这样使用 `–-no-install-recommends` 选项。
>
> ```
> sudo apt install --no-install-recommends package_name
> ```

#### 使用 apt-cache 来直接获取依赖信息

上面通过 `apt show` 的方式会获取到大量信息，假如你想在脚本中获取到依赖信息，那么 `apt-cache` 命令将会给你一个更好且更简洁的输出结果。

```
apt-cache depends package_name
```

下面的输出看起来更加干净，不是吗？

![][8]

#### 使用 dpkg 来查看一个 DEB 文件的依赖

`apt` 和 `apt-cache` 都作用于软件仓库中的软件包，但假如你下载了一个 DEB 文件，那么这两个命令就不起作用了。

在这种情形下，你可以使用 `dpkg` 命令的 `-I` 或 `--info` 选项。 

```
dpkg -I path_to_deb_file
```

依赖信息就可以在以 “Depends” 开头的那些行中找到。

![][9]

#### 使用 apt-rdepends 来查看依赖及依赖的依赖

假如你想查看更多关于依赖的信息，那么你可以使用 `apt-rdepends` 工具。这个工具可以创建完整的依赖树。这样你就可以得到一个软件包的依赖以及这些依赖的依赖。

它不是一个常规的 `apt` 命令，所以你需要从 universe 软件仓库中安装上它：

```
sudo apt install apt-rdepends
```

这个命令的输出通常很多，取决于依赖树的大小。

```
Reading package lists... Done
Building dependency tree
Reading state information... Done
shutter
  Depends: procps
  Depends: xdg-utils
imagemagick
  Depends: imagemagick-6.q16 (>= 8:6.9.2.10+dfsg-2~)
imagemagick-6.q16
  Depends: hicolor-icon-theme
  Depends: libc6 (>= 2.4)
  Depends: libmagickcore-6.q16-6 (>= 8:6.9.10.2)
  Depends: libmagickwand-6.q16-6 (>= 8:6.9.10.2)
hicolor-icon-theme
libc6
  Depends: libcrypt1 (>= 1:4.4.10-10ubuntu4)
  Depends: libgcc-s1
libcrypt1
  Depends: libc6 (>= 2.25)
```

`apt-rdepends` 工具的功能非常多样，它还可以用来计算反向依赖。这意味着你可以查看某个特定的包被哪些软件包依赖。

```
apt-rdepends -r package_name
```

输出可能会非常多，因为它将打印出反向依赖树。

```
abhishek@itsfoss:~$ apt-rdepends -r ffmpeg
Reading package lists... Done
Building dependency tree       
Reading state information... Done
ffmpeg
  Reverse Depends: ardour-video-timeline (>= 1:5.12.0-3ubuntu4)
  Reverse Depends: deepin-screen-recorder (5.0.0-1build2)
  Reverse Depends: devede (4.15.0-2)
  Reverse Depends: dvd-slideshow (0.8.6.1-1)
  Reverse Depends: green-recorder (>= 3.2.3)
```

我希望这个快速的教程可以帮助你提高一点儿你的命令行知识。为了知晓更多类似小知识点，请保持关注。

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-dependencies-package-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/Apt
[2]: https://itsfoss.com/handbrake/
[3]: https://ffmpeg.org/
[4]: https://gstreamer.freedesktop.org/
[5]: https://itsfoss.com/install-handbrake-ubuntu/
[6]: https://itsfoss.com/apt-search-command/
[7]: https://itsfoss.com/install-media-codecs-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/apt-check-dependencies-ubuntu.png?resize=800%2C297&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/check-dpendencies-of-deb-package.png?resize=800%2C432&ssl=1
