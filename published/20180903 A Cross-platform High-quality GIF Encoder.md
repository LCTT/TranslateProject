Gifski：一个跨平台的高质量 GIF 编码器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/gifski-720x340.png)

作为一名文字工作者，我需要在我的文章中添加图片。有时为了更容易讲清楚某个概念，我还会添加视频或者 gif 动图，相比于文字，通过视频或者 gif 格式的输出，读者可以更容易地理解我的指导。前些天，我已经写了篇文章来介绍针对 Linux 的功能丰富的强大截屏工具 [Flameshot][1]。今天，我将向你展示如何从一段视频或者一些图片来制作高质量的 gif 动图。这个工具就是 **Gifski**，一个跨平台、开源、基于 **Pngquant** 的高质量命令行 GIF 编码器。

对于那些好奇 pngquant 是什么的读者，简单来说 pngquant 是一个针对 PNG 图片的无损压缩命令行工具。相信我，pngquant 是我使用过的最好的 PNG 无损压缩工具。它可以将 PNG 图片最高压缩 **70%** 而不会损失图片的原有质量并保存了所有的阿尔法透明度。经过压缩的图片可以在所有的网络浏览器和系统中使用。而 Gifski 是基于 Pngquant 的，它使用 pngquant 的功能来创建高质量的 GIF 动图。Gifski 能够创建每帧包含上千种颜色的 GIF 动图。Gifski 也需要 **ffmpeg** 来将视频转换为 PNG 图片。

### 安装 Gifski 

首先需要确保你安装了 FFMpeg 和 Pngquant。

FFmpeg 在大多数的 Linux 发行版的默认软件仓库中都可以获取到，所以你可以使用默认的包管理器来安装它。具体的安装过程，请参考下面链接中的指导。

- [在 Linux 中如何安装 FFmpeg](https://www.ostechnix.com/install-ffmpeg-linux/)

Pngquant 可以从 [AUR][2] 中获取到。要在基于 Arch 的系统安装它，使用任意一个 AUR 帮助程序即可，例如下面示例中的 [Yay][3]：

```
$ yay -S pngquant
```

在基于 Debian 的系统中，运行：

```
$ sudo apt install pngquant
```

假如在你使用的发行版中没有 pngquant，你可以从源码编译并安装它。为此你还需要安装 `libpng-dev` 包。

```
$ git clone --recursive https://github.com/kornelski/pngquant.git
$ make
$ sudo make install
```

安装完上述依赖后，再安装 Gifski。假如你已经安装了 [Rust][4] 编程语言，你可以使用 **cargo** 来安装它：

```
$ cargo install gifski
```

另外，你还可以使用 [Linuxbrew][5] 包管理器来安装它：

```
$ brew install gifski
```

假如你不想安装 cargo 或 Linuxbrew，可以从它的 [发布页面][6] 下载最新的二进制程序，或者手动从源码编译并安装 gifski 。

### 使用 Gifski 来创建高质量的 GIF 动图

进入你保存 PNG 图片的目录，然后运行下面的命令来从这些图片创建 GIF 动图：

```
$ gifski -o file.gif *.png
```

上面的 `file.gif` 为最后输出的 gif 动图。

Gifski 还有其他的特性，例如：

  * 创建特定大小的 GIF 动图
  * 在每秒钟展示特定数目的动图
  * 以特定的质量编码
  * 更快速度的编码
  * 以给定顺序来编码图片，而不是以排序的结果来编码

为了创建特定大小的 GIF 动图，例如宽为 800，高为 400，可以使用下面的命令：

```
$ gifski -o file.gif -W 800 -H 400 *.png
```

你可以设定 GIF 动图在每秒钟展示多少帧，默认值是 **20**。为此，可以运行下面的命令：

```
$ gifski -o file.gif --fps 1 *.png
```

在上面的例子中，我指定每秒钟展示 1 帧。

我们还能够以特定质量（1-100 范围内）来编码。显然，更低的质量将生成更小的文件，更高的质量将生成更大的 GIF 动图文件。

```
$ gifski -o file.gif --quality 50 *.png
```

当需要编码大量图片时，Gifski 将会花费更多时间。如果想要编码过程加快到通常速度的 3 倍左右，可以运行：

```
$ gifski -o file.gif --fast *.png
```

请注意上面的命令产生的 GIF 动图文件将减少 10% 的质量，并且文件大小也会更大。

如果想让图片以某个给定的顺序（而不是通过排序）精确地被编码，可以使用 `--nosort` 选项。

```
$ gifski -o file.gif --nosort *.png
```

假如你不想让 GIF 循环播放，只需要使用 `--once` 选项即可：

```
$ gifski -o file.gif --once *.png
```

### 从视频创建 GIF 动图

有时或许你想从一个视频创建 GIF 动图。这也是可以做到的，这时候 FFmpeg 便能提供帮助。首先像下面这样，将视频转换成一系列的 PNG 图片：

```
$ ffmpeg -i video.mp4 frame%04d.png
```

上面的命令将会从 `video.mp4` 这个视频文件创建名为 “frame0001.png”、“frame0002.png”、“frame0003.png” 等等形式的图片（其中的 `%04d` 代表帧数），然后将这些图片保存在当前的工作目录。

转换好图片后，只需要运行下面的命令便可以制作 GIF 动图了：

```
$ gifski -o file.gif *.png
```

想知晓更多的细节，请参考它的帮助部分：

```
$ gifski -h
```

下面是使用 Gifski 创建的示例 GIF 动图文件。

![](https://gif.ski/jazz-chromecast-ultra.gif)

正如你看到的那样，GIF 动图的质量看起来是非常好的。

好了，这就是全部内容了。希望这篇指南对你有所帮助。更多精彩内容即将呈现，请保持关注！

干杯吧！

--------------------------------------------------------------------------------

    via: https://www.ostechnix.com/gifski-a-cross-platform-high-quality-gif-encoder/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://linux.cn/article-10180-1.html
[2]: https://aur.archlinux.org/packages/pngquant/
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://www.ostechnix.com/install-rust-programming-language-in-linux/
[5]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[6]: https://github.com/ImageOptim/gifski/releases
