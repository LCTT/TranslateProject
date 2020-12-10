[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12317-1.html)
[#]: subject: (Using AppImage for Linux package management)
[#]: via: (https://opensource.com/article/20/6/appimages)
[#]: author: (David Clinton https://opensource.com/users/dbclinton)

使用 AppImage 进行 Linux 软件包管理
======

> AppImage 在自足的环境中分发应用, 它适用于任何 Linux 发行版。

![](https://img.linux.net.cn/data/attachment/album/202006/15/140050aazux37axew7e0xk.jpg)

管理 Linux 机器（尤其是远程机器）的一个重要分就是管理和安装软件。当本地应用程序出现问题时，或者文件系统上的某些文件损坏需要修复时，你通常会希望推送更新，而不必走很多路坐在物理屏幕前。正如我在 Pluralsight 课程《[Linux 系统维护和故障排除][2]》中所解释的那样，许多问题当然可以通过 Bash 脚本解决，但是仍有很多情况下，除了老式的二进制文件外，没有其他选择。

想象一下，你的某些远程系统需要安装新的应用程序，这样使用这些计算机的团队成员就能够执行某些业务。能够利用 Debian 或 RPM 之类的主要 Linux 仓库系统的集成和自动化，可以使你的管理任务变得更加容易。

正如 Linus Torvalds 永不厌倦地提醒我们的那样，太多的 Linux 软件管理系统的问题是 [Linux 软件管理系统太多了][3]。多年来，应用开发甚至是 Linux 的采用都变得愈加复杂起来，因为你为了提供你的软件（比如，放到 Debian 仓库）而投入的所有时间和工作，对于你想让它们进入 RPM 系统并没有什么帮助，对于 SUSE 的 Zypper 管理器也一样，没有什么帮助。

解决软件孤岛问题的一种有前途的方案是分发具有自足环境的应用，它们可以在任何 Linux 发行版上运行。在这个年轻且不断发展的领域中，选择之一是 [AppImage][4]。

### 使用 AppImage

我全面投入到了 AppImage。就像我提到的其他软件包管理系统一样，如果你需要的话，有很多复杂的功能可以使用。但是，从本质上讲，AppImage 非常简单。AppImage 不像大多数其他包管理器一样通过仓库工作，它使用单个、独立的文件，可以直接发送或通过网站共享。

下面是个展示它的美妙之处的例子。当我在用 AppImage 时，我在一个技术论坛上看到了一个很老的讨论，它让我找到了一个同样久远且废弃的 GitHub 项目以及相关的 YAML 和配方文件。它们旨在自动构建准备生成 AppImage 包所需的相当复杂的基础架构。尽管该基础架构全部是在 5 年前的 Ubuntu 版本上构建的，但是当我将它们放在一起并运行 `appimagetool` 命令时，它创建了一个 AppImage 文件，它可在我当前的桌面上无缝运行。我不认为有很多有五年历史的 GitHub 复杂项目可以使用其他技术运行，而无需认真重做。

但是这里我我不会介绍这个案例。相反，我将用一个简单的 Hello World 程序向你展示它是如何工作的。首先，请确保本地已安装 AppStream 包。

对于基于 Debian 的系统，运行：

```
$ sudo apt install appstream
```

对于 RPM 系统，请使用：

```
$ sudo dnf install appstream
```

克隆[这篇文章][5]中提及的 Git 仓库，我会基于它示例：

```
$ git clone <https://github.com/boolean-world/appimage-resources>
$ cd appimage-resources
$ ls hello-world-appimage
```

接下来，使用 `cd` 进入 Git 新创建的目录。这里有两个目录。请使用 `hello-world-appimage`。另一个是更复杂的项目，你也应该考虑尝试一下。

Linux GUI 系统会读取 `helloworld.desktop` 文件来知道如何呈现桌面图标。事实证明，当前的这个文件会在以后给你带来点麻烦，因此请进行一些小修改：添加 `Categories=`  这行并为其赋予值 `GNOME`。不要忘记最后的分号：


```
$ nano hello-world-appimage/helloworld.desktop
        add Categories=GNOME;
```

从 [AppImage GitHub 项目][6]下载 `appimagetool` 预编译的二进制文件。访问 GitHub 的原因之一：那里有很多出色的文档和资源。下载二进制文件后，使文件可执行，并将   `hello-world-appimage` 目录传给它。但是首先，你需要告诉它你想要的架构。由于某些原因，一个名字以 x86\_64 结尾的工具都不能自行确定是否该使用 x86\_64 来构建应用程序（我不知道这是怎么回事）。

```
$ wget <https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage>
$ chmod +x appimagetool-x86_64.AppImage
$ ARCH=x86_64 ./appimagetool-x86_64.AppImage hello-world-appimage
```

如果你没有看到任何错误消息，那么表示完成了，请运行：

```
$ ls
$ ./hello-world-appimage-x86_64.AppImage
```

### 总结

AppImage 是软件包管理的非常有效的选择。当你探索它时，我想你会发现它是 Linux 发行版默认软件包系统的很好的替代品。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/appimages

作者：[David Clinton][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dbclinton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://pluralsight.pxf.io/VMKQj
[3]: https://itsfoss.com/desktop-linux-torvalds/
[4]: https://appimage.org/
[5]: https://www.booleanworld.com/creating-linux-apps-run-anywhere-appimage/
[6]: https://github.com/AppImage/AppImageKit/releases
