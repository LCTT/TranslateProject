[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12948-1.html)
[#]: subject: (How to View Images from the Linux Terminal)
[#]: via: (https://www.2daygeek.com/how-to-view-display-images-from-linux-terminal/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 终端查看图像
======

![](https://img.linux.net.cn/data/attachment/album/202012/23/233513zcgmggmxfd0wf9g1.png)

Linux 有很多用于查看图像的 GUI 应用。但我从来没有尝试过用任何命令行应用来查看它。

幸运的是，在使用 [ImageMagick 工具][1]时，我得到了一个从终端查看图像的命令。命令名是 `“display`，它是 ImageMagick 工具的一部分。这是一个很好的工具，允许类 UNIX 用户从终端查看图像。

此外，我还为此用途得到了另一个很好的工具，叫做 FIM。

我们将向你展示如何安装并使用它从 Linux 终端查看图像。这些命令使用系统的<ruby>帧缓冲<rt>framebuffer</rt></ruby>直接从命令行显示图像。

### 如何使用 display 命令从终端查看图像

[ImageMagick][2] 是一个自由开源、功能丰富、基于命令行的图像处理工具。它用于创建、编辑、合成或转换位图图像。它可以读取和写入各种格式（超过 200 种）的图像，包括 PNG、JPEG、GIF、PDF、SVG 等。它可以调整图像的大小、镜像、旋转、转换图像、调整图像颜色、应用各种特殊效果等。它支持批处理，允许你一次处理所有图像。

### 如何安装 ImageMagick？

ImageMagick 软件包包含在大多数 Linux 发行版的官方仓库中。使用发行版软件包管理器来安装它。

**需要注意的是：**确保你的 Linux 系统上已经安装了 “[Development Tools][3]” 包，这是安装的前提条件。

对于 RHEL/CentOS 6/7 系统，请使用 [yum 命令][4] 安装 ImageMagick：

```
$ sudo yum install -y ImageMagick ImageMagick-devel
```

在 RHEL/CentOS 8 和 Fedora 系统，使用 [dnf 命令][5] 安装 ImageMagick：

```
$ sudo dnf install -y ImageMagick ImageMagick-devel
```

对于 Debian/Ubuntu 系统，使用 [apt 命令][6] 或 [apt-get 命令][7] 安装 ImageMagick：

```
$ sudo apt-get update
$ sudo apt-get install imagemagick
```

对于 openSUSE 系统，使用 [zypper 命令][8] 安装 ImageMagick：

```
$ sudo zypper install -y ImageMagick
```

要查看任何图像文件，请运行 `display` 命令，如下所示。你可以按下 `Esc`/`q` 按钮关闭图像：

```
$ display bird.jpg
```

![](https://www.2daygeek.com/wp-content/uploads/2020/12/how-to-view-display-images-from-linux-terminal-2.jpg)

如果你想用指定的窗口大小打开图像，请使用 `-geometry` 标志：

```
$ display -geometry 1000x600 ~/Downloads/bird.jpg
```

你也可以通过 `display` 命令输入图像的位置信息。下面的命令可以从桌面的距顶部 800 像素和据左上角 800 像素处打开图像：

```
$ display -geometry 1000x600+800+800 ~/Downloads/bird.jpg
```

如果你想用 `display` 命令调整图像的大小，请使用以下格式：

```
$ display -resize 600x400 ~/Downloads/bird.jp
```

另外，你也可以使用百分比来调整图片的大小：

```
$ display -resize 50% ~/Downloads/bird.jpg
```

### 如何使用 fim 命令从终端查看图像

[FIM][10] 是一个专门为 Linux 设计的轻量级全局图像查看器。但它并不局限于 Linux，它也可配置在其他操作系统上运行，如 MS-Windows。

对于熟悉 VIM 文本编辑器等软件的用户来说，它是高度可定制和可脚本化的图像查看器。它可以全屏显示图像，并且可以使用键盘快捷键轻松控制。它是一款非常轻量级的工具，因为它只依赖于某些库。

它可以打开许多文件格式，它可以在以下视频模式下显示图像：

  * 使用 Linux 帧缓冲设备图形化。
  * 在 X/Xorg 下，使用 SDL 库图形化
  * 在 X/Xorg 下，使用 Imlib2 库图形化。
  * 使用 AAlib 库，在任意文本控制台中以 ASCII 艺术形式呈现。

运行时自动检测或选择正确的视频模式，如果需要，可以在构建前配置时选择加入或去除。

FIM 是 “Fbi IMproved” 的缩写，是 Fbi Image Viewer 的复刻版本。

FIM 可以很容易地安装在基于 Debian/Ubuntu 的系统上，因为该软件包在发行版的官方仓库中是可用的。对于其他发行版，你可能需要从源码编译它：

```
$ sudo apt install fim
```

安装完毕后，你可以使用以下命令显示图像：

```
$ fim bird.jpg
```

你可以使用 `-a` 选项自动缩放图像：

```
$ fim -a bird.jpg
```

![](https://www.2daygeek.com/wp-content/uploads/2020/12/how-to-view-display-images-from-linux-terminal-3.jpg)

如果你要打开当前目录中的多个图像文件，请使用通配符将它们全部打开。使用 `PageUp`/`PageDown` 键盘快捷键移动到下一张或上一张图像：

```
$ fim -a *.jpg
```

要以 ASCII 格式查看图像，可以使用 `-t` 标志：

```
$ fim -t bird.jpg
```

下面的键盘快捷键可以让你控制图像：

  * `PageUp`/`PageDown`：上一张/下一张图片。
  * `+`/`-`：放大/缩小
  * `a`：自动缩放
  * `w`：适应宽度
  * `ESC`/`q`：退出

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-view-display-images-from-linux-terminal/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/resize-convert-images-from-linux-command-line/
[2]: https://imagemagick.org/
[3]: https://www.2daygeek.com/install-development-tools-on-ubuntu-debian-arch-linux-mint-fedora-centos-rhel-opensuse/
[4]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[5]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[6]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.nongnu.org/fbi-improved/#docs
