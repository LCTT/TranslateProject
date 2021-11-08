[#]: subject: "4 ways to edit photos on the Linux command line"
[#]: via: "https://opensource.com/article/21/11/edit-photos-linux-command-line"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13964-1.html"

在 Linux 命令行上编辑照片的 4 种方法
======

![](https://img.linux.net.cn/data/attachment/album/202111/08/114427mq12hqvqiixv1j1b.jpg)

> 这里有一些我最喜欢的 ImageMagick 技巧，以及如何在没有 GUI 的情况下使用它们。

Linux 对摄影师和图形艺术家很有用。它提供了许多工具来编辑包括照片在内的不同类型的图像文件和格式。这表明你甚至不需要一个图形界面来处理你的照片。这里有四种你可以在命令行中编辑图像的方法。

### 给你的图片应用效果

几年前，Seth Kenlon 写过一篇文章，[4 个有趣的（半无用的）Linux 玩具][2]，其中包括对 ImageMagick 编辑工具套件的介绍。在 2021 年的今天，ImageMagick 甚至更有意义。

这篇文章让我们了解了 Fred 的 ImageMagick 脚本，这些脚本真的很有用。Fred Weinhaus 维护着 200 多个脚本，用于对你的图像文件应用各种效果。Seth 向我们展示了 Fred 的 `vintage3` 脚本的一个例子，该脚本使图像变得怀旧。

### 创建照片拼贴画

今年，Jim Hall 用他的文章 [从 Linux 命令行创建照片拼贴][3] 向我们展示了如何从照片中创建拼贴画。

拼贴画在小册子和手册中使用得很多。它们是一种在一张照片中展示几张图片的有趣方式。可以应用效果来将它们进一步融合在一起。事实上，我以他的文章为指导，创造了上面的图片拼贴。这是我小时候的样子。以下是我使用的命令：

```
$ montage Screenshot-20211021114012.png \
  Screenshot-20211021114220.png \
  Screenshot-20211021114257.png \
  Screenshot-20211021114530.png \
  Screenshot-20211021114639.png \
  Screenshot-20211021120156.png \
  -tile 3x2 -background black \
  screenshot-montage.png
```

### 调整图像大小

Jim 发表了另一篇文章，[从 Linux 终端调整图像的大小][4]。这个教程演示了如何使用 ImageMagick 改变一个图像文件的尺寸并将其保存为一个新的文件。例如，上面的 `montage` 命令所产生的拼贴画没有达到要求的尺寸。学习如何调整尺寸，使我能够调整宽度和高度，从而使它能够被包括在内。这是我用来调整这张图片大小的命令。

![Montage of Alan as a Kid][1]

```
$ convert screenshot-montage.png -resize 520x292\! alanfd-kid-montage.png
```

### 自动化图像处理

最近，我决定自己看一下 ImageMagick 套件。这一次，我把它的工具组合成一个 Bash 脚本。文章的题目是 [用这个 bash 脚本自动处理图像][5]。这个例子是一个简单的脚本，可以自动为我的文章制作图片。它是根据 Opensource.com 上的要求定制的。如果你想使用这个脚本，我在文章中提供了一个 Git 仓库连接。它很容易修改和扩展，可以满足任何人的需要。

### 总结

我希望你喜欢这些文章并在你的艺术创作中使用 Linux。如果你想看看更多的 Linux 图像软件，可以看看 Fedora [Design Suite][6] Spin。它是一个完整的操作系统，包括许多不同的开源多媒体制作和发布工具，例如：

  * GIMP
  * Inkscape
  * Blender
  * Darktable
  * Krita
  * Scribus
  * 等等

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/edit-photos-linux-command-line

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/alanfd-kid-montage.png?itok=r1kgXpLc (Montage of Alan as a Kid)
[2]: https://opensource.com/life/16/6/fun-and-semi-useless-toys-linux
[3]: https://opensource.com/article/21/9/photo-montage-imagemagick
[4]: https://opensource.com/article/21/9/resize-image-linux
[5]: https://opensource.com/article/21/10/image-processing-bash-script
[6]: https://labs.fedoraproject.org/en/design-suite/
