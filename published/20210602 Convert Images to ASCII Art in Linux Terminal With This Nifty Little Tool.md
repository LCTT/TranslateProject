[#]: subject: (Convert Images to ASCII Art in Linux Terminal With This Nifty Little Tool)
[#]: via: (https://itsfoss.com/ascii-image-converter/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13461-1.html)

在 Linux 终端将图像转换成 ASCII 艺术
======

![](https://img.linux.net.cn/data/attachment/album/202106/06/210732m5oo91ao9ws33757.png)

想在 Linux 终端中做一些有趣的事情吗？把一张普通的图片转换成 ASCII 艺术怎么样？

你知道 [什么是 ASCII][1] 么？它是一个标准，在 8 位码中的 256 个空位上分配字母、数字和其他字符。ASCII 艺术是一个由可打印的 ASCII 字符组成的图形。基本上，它是由一堆字母、数字和特殊字符组成的。

你可能见过有人 [以 ASCII 格式显示他们发行版的标志][2]，像这样：

![][3]

这很酷，对吗？把一张普通的图片转换成 ASCII 艺术怎么样？这就是在这篇文章中要探讨的问题。

### Ascii Image Converter

顾名思义，[Ascii Image Converter][4] 是一个将图片转换为 ASCII 艺术的工具。它是一个用 Go 语言编写的基于命令行的工具，它打印出提供给它的图片的ASCII版本。

你可能认不出我，但下面的图片中的 ASCII 版就是我。那是我的 8 位头像。

![][5]

该工具支持以下格式的输入图像：

* JPEG/JPG
* PNG
* BMP
* WEBP
* TIFF/TIF

让我们看看如何安装和使用它。

### 在 Linux 上安装 Ascii Image Converter

这个有趣的工具也可以在 Windows 上使用，但我不打算这么做。在本教程中，让我们坚持使用 Linux。

如果你的发行版中启用了 [Snap][6]，你可以用下面的命令轻松地安装它的 snap 包：

```
sudo snap install ascii-image-converter
```

你也可以从它的发布页面下载 Linux 的可执行文件，并把可执行文件放在 `/usr/local/bin/` 目录下。这样，你就能像普通的 Linux 命令一样运行它。如果你想知道为什么会这样，请了解一下 [Linux 目录层次结构][7]。

### 使用 Ascii Image Converter

使用很简单。安装后，你只需要提供你想转换的图像的路径。

```
ascii-image-converter path_to_image
```

你也可以提供图片的 URL，直接从网上把图片转换成 ASCII。

这是我的个人资料照片转换成 ASCII 格式。我把我的原始照片放在这里供大家参考。

![][8]

你也可以转换成彩色的 ASCII。

```
ascii-image-converter -C path_to_image
```

![][9]

你可以通过提供它们的路径将多个图像转换为 ASCII。它将在终端显示器上一个接一个地打印 ASCII 版本。

也有一个选项可以保存生成的 ASCII 艺术。在旧版本中，它只会被保存为文本文件，而不是图像。开发者 Zoraiz Hassan 发布了一个新版本，现在该工具默认将生成的 ASCII 图像保存为 PNG 格式。

```
ascii-image-converter path_to_image -s .
```

还有一些可用的选项，比如给输出一个特定的尺寸，使用更多的 ASCII 字符，或者使用你自己的字符集来打印 ASCII 艺术。你可以在 [项目的仓库][4] 上阅读相关内容。

### 喜欢它吗？

你喜欢更多的 ASCII 相关的东西吗？那么 [在 Linux 上玩 ASCII 游戏][10] 怎么样？是的，你完全可以这么做。

如果你喜欢在终端做实验，你可能会喜欢这个工具。虽然我不知道 ASCII 转换后的图像能有什么好的实际用途。有什么想法吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/ascii-image-converter/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.computerhope.com/jargon/a/ascii.htm
[2]: https://itsfoss.com/display-linux-logo-in-ascii/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-mate-focal-neofetch.png?resize=800%2C543&ssl=1
[4]: https://github.com/TheZoraiz/ascii-image-converter
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/abhishek-prakash-in-ascii.png?resize=800%2C445&ssl=1
[6]: https://itsfoss.com/enable-snap-support-linux-mint/
[7]: https://linuxhandbook.com/linux-directory-structure/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/abhishek-prakash-ascii-converted.png?resize=800%2C437&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/abhishek-colored-ascii.png?resize=800%2C429&ssl=1
[10]: https://itsfoss.com/best-ascii-games/
