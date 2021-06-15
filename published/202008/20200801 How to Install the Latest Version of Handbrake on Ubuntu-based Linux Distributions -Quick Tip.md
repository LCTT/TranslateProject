[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12515-1.html)
[#]: subject: (How to Install the Latest Version of Handbrake on Ubuntu-based Linux Distributions [Quick Tip])
[#]: via: (https://itsfoss.com/install-handbrake-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 上安装最新版本的 Handbrake
======

>  此快速教程介绍了如何使用在基于 Ubuntu 的发行版上使用官方 PPA 安装最新版本的 HandBrake。

![](https://img.linux.net.cn/data/attachment/album/202008/13/223818yghmgmagqggm2pa0.jpg)

[HandBrake][1] 是可用于 Linux、Windows 和 macOS 的最受欢迎的开源视频转换器之一。

此 GUI 应用让你只需单击几下即可将视频从一种格式转换为另一种格式。你还可以根据需要自定义输出视频。

[HandBrake][2] 存在于 [Ubuntu 的通用存储库][3]中，但它可能并不总是最新版本。让我向你展示如何在 Ubuntu 和其他基于 Ubuntu 的发行版（如 Linux Mint、Linux Lite、elementray OS 等）上获得最新的 HandBrake。

### 在基于 Ubuntu 的 Linux 发行版上安装最新的 HandBrake

HandBrake 的开发人员维护着一个[官方的 PPA][4]。[使用此 PPA][5]，你可以轻松地在基于 Ubuntu 的发行版中安装最新版本的 HandBrake。

打开终端，然后使用以下命令添加 PPA 仓库。需要时按下回车键：

```
sudo add-apt-repository ppa:stebbins/handbrake-releases
```

你可能需要更新本地软件包缓存（在 Ubuntu 18.04 和更高版本中不是必需的）：

```
sudo apt update
```

现在，使用以下命令安装最新版本的 HandBrake：

```
sudo apt-get install handbrake-gtk
```

这个方法最好的地方是会删除旧的 handbrake 软件包，从而避免安装两个不同版本的 handbrake。

![][6]

在你的 Linux 系统上享受最新最好的 HandBrake 并转换视频。

### 从系统中卸载 HandBrake

由于某些原因，如果你不喜欢 HandBrake 并希望将它删除，那么需要执行以下操作。

打开终端并使用以下命令卸载 HandBrake：

```
sudo apt remove handbrake-gtk
```

现在，你已经删除了该应用，如果你不再需要它，那么[删除它的 PPA][7] 是一个好主意。

```
sudo add-apt-repository -r ppa:stebbins/handbrake-releases
```

在询问时确认。

在这篇快速 Ubuntu 教程中，你学习了使用 PPA 安装最新的 HandBrake 的步骤。你还了解了正确删除它的步骤。

我希望你觉得这篇快速教程有用。如果你有任何问题或建议，请在下面发表评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-handbrake-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://handbrake.fr/
[2]: https://itsfoss.com/handbrake/
[3]: https://itsfoss.com/ubuntu-repositories/
[4]: https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
[5]: https://itsfoss.com/ppa-guide/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/install-handbrake-ubuntu.png?resize=800%2C498&ssl=1
[7]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
