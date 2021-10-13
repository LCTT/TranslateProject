[#]: subject: "Resize an image from the Linux terminal"
[#]: via: "https://opensource.com/article/21/9/resize-image-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13779-1.html"

在 Linux 终端调整图像的大小
======

> 用 ImageMagick 的转换命令从你的终端缩放一张图像。

![](https://img.linux.net.cn/data/attachment/album/202109/12/235041ohsppv1hg1m26y1m.jpg)

ImageMagick 是一个方便的多用途命令行工具，它能满足你所有的图像需求。ImageMagick 支持各种图像类型，包括 JPG 照片和 PNG 图形。

### 调整图像大小

我经常在我的 Web 服务器上使用 ImageMagick 来调整图像大小。例如，假设我想在我的个人网站上发一张我的猫的照片。我手机里的照片非常大，大约 4000x3000 像素，有 3.3MB。这对一个网页来说太大了。我使用 ImageMagick 转换工具来改变照片的大小，这样我就可以把它放在我的网页上。ImageMagick 是一套完整的工具，其中最常用的是 `convert` 命令。

ImageMagick 的 `convert` 命令使用这样的一般语法：

```
convert {input} {actions} {output}
```

要将一张名为 `PXL_20210413_015045733.jpg` 的照片调整到一个更容易管理的 500 像素宽度，请输入:

```
$ convert PXL_20210413_015045733.jpg -resize 500x sleeping-cats.jpg
```

现在新图片的大小只有 65KB。

![Sleeping cats][2]

你可以用 `-resize` 选项同时提供宽度和高度尺寸。但是，如果只提供宽度，ImageMagic 就会为你做计算，并通过调整输出图像的高度比例来自动保留长宽比。

### 在 Linux 上安装 ImageMagick

在 Linux 上，你可以使用你的包管理器安装 ImageMagick。例如，在 Fedora 或类似系统上：

```
$ sudo dnf install imagemagick
```

在 Debian 和类似系统上：

```
$ sudo apt install imagemagick
```

在 macOS 上，使用 [MacPorts][4] 或 [Homebrew][5]。

在 Windows 上，使用 [Chocolatey][6] 即可。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/resize-image-linux

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-blue.png?itok=AsIMZ9ga (Old camera blue)
[2]: https://opensource.com/sites/default/files/sleeping-cats.jpg (Sleeping cats)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
