[#]: subject: "How to Install FFmpeg in Ubuntu and Other Linux"
[#]: via: "https://www.debugpoint.com/2022/06/install-FFmpeg-ubuntu/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Ubuntu 等 Linux 发行版上安装 FFmpeg
======
本教程介绍了 FFmpeg 在 Ubuntu 及其他 Linux 发行版上的安装步骤。

FFmpeg 是一套处理多媒体文件的软件库。凭借这些强大的库，FFmpeg 能够转换格式、推流以及处理音频和视频文件。许多 Linux 的前端应用都使用 FFmpeg 作为后端支持，所以这些应用对 FFmpeg 的依赖度非常高。举个例子，录屏软件可能会用到 FFmpeg 将录屏转换为 gif 动图。

VLC 多媒体播放器、YouTube、Blender、Kodi、Shotcut 和 Handbrake 等流行的应用与服务都在使用 FFmpeg。

趣事：NASA 火星 2020 计划的探测器“毅力”号在将图像和视频发送到地球之前，会先使用 FFmpeg 对其进行处理。

### 关于 FFmpeg

[FFmpeg][1] 本身是一款非常强大的命令行实用程序，在 Linux 发行版、Windows 以及 macOS 等系统上均可运行，支持多种架构。FFmpeg 是用 C 语言和汇编语言编写的，性能强大，提供跨平台支持。

#### 核心

FFmpeg 的核心是命令行实用程序，既可在命令行上使用，也可以经由任何程序语言调用。比如，你可以在 Shell 程序或 python 脚本中使用 FFmpeg。

* FFmpeg: 用于转换音视频格式，包括视频直播资源。
* ffplay: FFmpeg 配套使用的媒体播放器
* ffprobe: 显示媒体文件信息的命令行工具，可将信息输出为 csv、xml、json 等格式。

### FFmpeg 安装

在 Ubuntu 等 Linux 发行版上， FFmpeg 的安装比较简单。打开终端，运行以下命令安装即可。

#### Ubuntu 及与其相似的发行版

```
sudo apt install FFmpeg
```

#### Fedora

在 Fedora Linux 上安装 FFmpeg，你需要添加 [RPM Fusion 仓库][2]，因为 Fedora 官方仓库没有 FFmpeg 软件包。

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-
```

```
sudo dnf install FFmpeg
```

#### Arch Linux

```
pacman -S FFmpeg
```

安装完成后，可输入以下命令查看安装是否成功。

```
FFmpeg --version
```

![FFmpeg installed in Ubuntu Linux][3]

### 案例：FFmpeg 的基本操作

首先，我们先来看看 FFmpeg 语法的一个简单例子。如下，该语法可以将 mp4 文件转换为 mkv 文件。

1. 视频文件格式转换

```
FFmpeg -i big_buck_bunny.mp4 big_buck_bunny.mkv
```

当然，这种写法最为简单易懂，但它并不完整，因为没有输入 <ruby>比特率<rt>bit rate</rt></ruby>、<ruby>分辨率<rt>resolution</rt></ruby> 以及其他的视频文件属性。

2. 音频文件格式转换

第二，输入与上面相似的命令可以转换音频文件的格式。

```
FFmpeg -i sunny_day.ogg sunny_day.mp3
```

3. 使用音视频 codec 执行格式转换

最后，在下面的例子中，我们可以使用特定的 <ruby>编解码器<rt>codec</rt></ruby> 来转换视频格式。参数 `-c` 搭配 `a` 或者 `v`，可以分别定义音频和视频文件。以下转换命令使用 `libvpx` 视频编解码器和 `libvorbis` 音频编解码器。

```
FFmpeg -i big_buck_bunny.mp4 -c:v libvpx -c:a libvorbis big_buck_bunny.webm
```

### 如何确定自己系统中有哪些编码器和解码器？

#### 显示所有编解码器

输入以下命令，打印所有编解码器。

```
FFmpeg -codecs
```

该命令可以打印出所有可用的编解码器，并显示每个编解码器对应的功能信息，比如是否支持解码或编码。此外，如以下输出结果所示，打印出来的信息还会按照首字母顺序标注出每个编码器和解码器的位置。

```
D..... = Decoding supported.E.... = Encoding supported..V... = Video codec..A... = Audio codec..S... = Subtitle codec...I.. = Intra frame-only codec....L. = Lossy compression.....S = Lossless compression
```

![FFmpeg Codec list][4]

#### 显示所有编码器

输入下列命令，打印出所有编码器

```
FFmpeg -encoders
```

#### 显示所有解码器

同样，输入下列命令，打印出所有解码器。

```
FFmpeg -decoders
```

#### 更多信息

输入参数 `-h`，获取更多关于编码器或解码器的信息。

```
FFmpeg -h decoder=mp3
```

### 总结

我希望这篇文章可以帮助你了解 FFmpeg 的基本知识及基本命令。若要了解更多信息，可前往 FFmpeg 官方网站，浏览 [<ruby>帮助文章<rt>Documentation</rt></ruby>][5]。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/install-FFmpeg-ubuntu/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://FFmpeg.org/
[2]: https://www.debugpoint.com/2020/07/enable-rpm-fusion-fedora-rhel-centos/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/FFmpeg-installed-in-Ubuntu-Linux.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/FFmpeg-Codec-list.jpg
[5]: https://FFmpeg.org/documentation.html
