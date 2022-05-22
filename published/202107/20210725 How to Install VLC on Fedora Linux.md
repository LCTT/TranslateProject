[#]: subject: (How to Install VLC on Fedora Linux)
[#]: via: (https://itsfoss.com/install-vlc-fedora/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13637-1.html)

如何在 Fedora Linux 上安装 VLC
======

![](https://img.linux.net.cn/data/attachment/album/202107/31/215634thkmiihq1limel4i.jpg)

如果你刚刚安装了 Fedora，现在想在上面安装你最喜欢的视频播放器 VLC，你可能不会在软件中心找到它。至少不会立即找到。

出于只有它的开发者知道的原因，Fedora 既没有安装 [VLC][1]，也不包括在 Fedora 官方仓库中。

那么，你如何在 Fedora 上安装 VLC 呢？很简单。RPM Fusion 是你的朋友。让我告诉你详细的步骤。

### 在 Fedora Linux 上安装 VLC

在这里使用命令行会更容易。你也可以使用图形化的方法。我将在后面讨论它。

打开终端，使用下面的命令来添加和启用包含 VLC 包的 RPM Fusion 仓库：

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

当被要求确认添加新仓库时按 `Y`。接下来，使用 DNF 命令安装 VLC：

```
sudo dnf install vlc
```

它将在 Fedora 中从 RPM Fusion 仓库中安装 VLC，并从不同的仓库中安装一些额外的依赖项。

![Installing VLC in Fedora with DNF command][2]

安装后，你可以在应用程序菜单中搜索 VLC，或者在“活动区”中搜索它。

![Search for VLC][3]

点击、启动并享受它。

#### 替代方法：从软件中心安装 VLC

当你已经启用了 RPM Fusion 仓库，你可以在软件中心显示这个仓库的应用。要做到这一点，在终端使用以下命令：

```
sudo dnf groupupdate core
```

之后，打开软件中心，搜索 VLC 并从那里安装。

![VLC in Fedora software center][4]

如果你有添加 FlatHub 仓库，请避免安装 Flatpak 版本的 VLC，因为它的大小大约是 1GB。RPM 版本的大小要小得多。

我希望你觉得这个快速教程对在 Fedora 上安装 VLC 有帮助。享受吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vlc-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.videolan.org/
[2]: https://itsfoss.com/wp-content/uploads/2021/07/installing-vlc-fedora-800x422.webp
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/vlc-fedora.png?resize=799%2C223&ssl=1
[4]: https://itsfoss.com/wp-content/uploads/2021/07/vlc-in-fedora-software-center-800x486.webp