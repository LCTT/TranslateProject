[#]: subject: (Converseen for Batch Processing Images on Linux)
[#]: via: (https://itsfoss.com/converseen/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13617-1.html)

在 Linux 上批量处理图像的 Converseen
======

![](https://img.linux.net.cn/data/attachment/album/202107/25/215958jd5jl9q2jlzqvvg6.jpg)

Converseen 是一个用于批量图像转换的自由开源软件。有了这个工具，你可以一次将多张图片转换成另一种格式、调整大小、改变它们的长宽比、旋转或翻转它们。

对于像我这样的人来说，这是一个很方便的工具，我必须处理多个不同大小的截图，但在上传到网站之前必须调整它们的大小。

批量转换工具在这种情况下有很大的帮助。这可以在 Linux 命令行中用不错的 [ImageMagick][1] 来完成，但在这里使用 GUI 工具要容易得多。实际上，Converseen 在基于 Qt 的图形用户界面下使用 ImageMagick。

### 用 Converseen 批量处理图像

你可以用 [Converseen][2] 通过鼠标点击来转换、调整大小、旋转和翻转多个图像。

你有很多支持批量转换的选项。你可以在你的选择中添加更多的图片，或者删除其中的一些。你可以选择只转换你选择的几张图片。

在调整图像大小时，你可以选择保持长宽比。请记住，在宽度和高度中，你最后改变/输入的那个是控制长宽比的那个。所以，如果你想在保持长宽比的情况下调整大小，但要根据宽度来调整，不要修改高度栏。

![][3]

你也可以选择将转换后的图像以不同的名称保存在同一目录或其他位置，也可以覆盖现有的图像。

你不能添加文件夹，但你可以一次选择并添加多个图像。

你可以将图像转换为多种格式，如 JPEG、JPG、TIFF、SVG 等。

在改变格式的同时，还有一个选项可以给透明背景以某种颜色。你还可以设置压缩级别的质量。

![][4]

Converseen 还可以导入 PDF 文件，并将整个 PDF 或其中的一部分转换为图像。然而，在 Ubuntu 21.04 中，每次我试图转换一个 PDF 文件时，它就会崩溃。

### 在 Linux 上安装 Converseen

Converseen 是一个流行的应用。它在大多数 Linux 发行版仓库中都有。

你可以在你的发行版的软件中心搜索到它：

![][5]

当然，你也可以使用你的发行版的包管理器通过命令行来安装它。

在基于 Debian 和 Ubuntu 的发行版上，使用：

```
sudo apt install converseen
```

在 Fedora 上，使用：

```
sudo dnf install converseen
```

在 Arch 和 Manjaro 上，使用：

```
sudo pacman -Sy converseen
```

Converseen 也可在 Windows 和 FreeBSD 下使用。你可以在项目网站的下载页面获得相关说明。

- [下载 Converseen][6]

它的源码可在 GitHub 仓库 [获取][7]。

如果你正在寻找一个更简单的方法来调整一张图片的大小，你可以使用这个巧妙的技巧，[在 Nautilus 文件管理器中用右键菜单调整图片大小和旋转图片][8]。

总的来说，Converseen 是一个有用的用于批量图像转换的 GUI 工具。它并不完美，但在大多数情况下是有用的。你曾经使用过 Converseen 或者你使用类似的工具吗？你对它的体验如何？

--------------------------------------------------------------------------------

via: https://itsfoss.com/converseen/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://imagemagick.org/index.php
[2]: https://converseen.fasterland.net/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/converseen-interface.png?resize=800%2C400&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/converseen-features-overview_copy.png?resize=800%2C497&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/install-converseen-linux.jpeg?resize=800%2C527&ssl=1
[6]: https://converseen.fasterland.net/download/
[7]: https://github.com/Faster3ck/Converseen
[8]: https://itsfoss.com/resize-images-with-right-click/
