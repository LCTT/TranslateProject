[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10538-1.html)
[#]: subject: (How To Display Thumbnail Images In Terminal)
[#]: via: (https://www.ostechnix.com/how-to-display-thumbnail-images-in-terminal/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何在终端显示图像缩略图
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-720x340.png)

不久前，我们讨论了 [Fim][1]，这是一个轻量级的命令行图像查看器应用程序，用于从命令行显示各种类型的图像，如 bmp、gif、jpeg 和 png 等。今天，我偶然发现了一个名为 `lsix` 的类似工具。它类似于类 Unix 系统中的 `ls` 命令，但仅适用于图像。`lsix` 是一个简单的命令行实用程序，旨在使用 Sixel 图形格式在终端中显示缩略图。对于那些想知道的人来说，Sixel 是<ruby>六像素<rt>six pixels</rt></ruby>的缩写，是一种位图图形格式。它使用 ImageMagick，因此几乎所有 imagemagick 支持的文件格式都可以正常工作。

### 功能

关于 `lsix` 的功能，我们可以列出如下：

* 自动检测你的终端是否支持 Sixel 图形格式。如果你的终端不支持 Sixel，它会通知你启用它。
* 自动检测终端背景颜色。它使用终端转义序列来试图找出终端应用程序的前景色和背景色，并清楚地显示缩略图。
* 如果目录中有更多图像（通常大于 21 个），`lsix` 将一次显示这些图像，因此你无需等待创建整个蒙太奇图像（LCTT 译注：拼贴图）。
* 可以通过 SSH 工作，因此你可以轻松操作存储在远程 Web 服务器上的图像。
* 它支持非位图图形，例如 .svg、.eps、.pdf、.xcf 等。
* 用 Bash 编写，适用于几乎所有 Linux 发行版。

### 安装 lsix

由于 `lsix` 使用 ImageMagick，请确保已安装它。它在大多数 Linux 发行版的默认软件库中都可用。 例如，在 Arch Linux 及其变体如 Antergos、Manjaro Linux 上，可以使用以下命令安装ImageMagick：

```
$ sudo pacman -S imagemagick
```

在 Debian、Ubuntu、Linux Mint：

```
$ sudo apt-get install imagemagick
```

`lsix` 并不需要安装，因为它只是一个 Bash 脚本。只需要下载它并移动到你的 `$PATH` 中。就这么简单。

从该项目的 GitHub 主页下载最新的 `lsix` 版本。我使用如下命令下载 `lsix` 归档包：

```
$ wget https://github.com/hackerb9/lsix/archive/master.zip
```

提取下载的 zip 文件：

```
$ unzip master.zip
```

此命令将所有内容提取到名为 `lsix-master` 的文件夹中。将 `lsix` 二进制文件从此目录复制到 `$PATH` 中，例如 `/usr/local/bin/`。

```
$ sudo cp lsix-master/lsix /usr/local/bin/
```

最后，使 `lsix` 二进制文件可执行：

```
$ sudo chmod +x /usr/local/bin/lsix
```

如此，现在是在终端本身显示缩略图的时候了。

在开始使用 `lsix` 之前，请确保你的终端支持 Sixel 图形格式。

开发人员在 vt340 仿真模式下的 Xterm 上开发了 `lsix`。 然而，他声称 `lsix` 应该适用于任何Sixel 兼容终端。

Xterm 支持 Sixel 图形格式，但默认情况下不启用。

你可以从另外一个终端使用命令来启动一个启用了 Sixel 模式的 Xterm：

```
$ xterm -ti vt340
```

或者，你可以使 vt340 成为 Xterm 的默认终端类型，如下所述。

编辑 `.Xresources` 文件（如果它不可用，只需创建它）：

```
$ vi .Xresources
```

添加如下行：

```
xterm*decTerminalID    :   vt340
```

按下 `ESC` 并键入 `:wq` 以保存并关闭该文件。

最后，运行如下命令来应用改变：

```
$ xrdb -merge .Xresources
```

现在，每次启动 Xterm 就会默认启用 Sixel 图形支持。

### 在终端中显示缩略图

启动 Xterm（不要忘记以 vt340 模式启动它）。以下是 Xterm 在我的系统中的样子。

![](https://www.ostechnix.com/wp-content/uploads/2019/01/xterm-1.png)

就像我已经说过的那样，`lsix` 非常简单实用。它没有任何命令行选项或配置文件。你所要做的就是将文件的路径作为参数传递，如下所示。

```
$ lsix ostechnix/logo.png
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-4.png)

如果在没有路径的情况下运行它，它将显示在当前工作目录中的缩略图图像。我在名为 `ostechnix` 的目录中有几个文件。

要显示此目录中的缩略图，只需运行：

```
$ lsix
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-1.png)

看到了吗？所有文件的缩略图都显示在终端里。

如果使用 `ls` 命令，则只能看到文件名，而不是缩略图。

![][3]

你还可以使用通配符显示特定类型的指定图像或一组图像。

例如，要显示单个图像，只需提及图像的完整路径，如下所示。

```
$ lsix girl.jpg
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-2.png)

要显示特定类型的所有图像，例如 PNG，请使用如下所示的通配符。

```
$ lsix *.png
```

![][4]

对于 JEPG 类型，命令如下：

```
$ lsix *jpg
```

缩略图的显示质量非常好。我以为 `lsix` 会显示模糊的缩略图。但我错了，缩略图清晰可见，就像在图形图像查看器上一样。

而且，这一切都是唾手可得。如你所见，`lsix` 与 `ls` 命令非常相似，但它仅用于显示缩略图。如果你在工作中处理很多图像，`lsix` 可能会非常方便。试一试，请在下面的评论部分告诉我们你对此实用程序的看法。如果你知道任何类似的工具，也请提出建议。我将检查并更新本指南。

更多好东西即将到来。敬请关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-display-thumbnail-images-in-terminal/

作者：[SK][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/how-to-display-images-in-the-terminal/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2019/01/ls-command-1.png
[4]: http://www.ostechnix.com/wp-content/uploads/2019/01/lsix-3.png
