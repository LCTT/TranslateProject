[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11920-1.html)
[#]: subject: (Screenshot your Linux system configuration with Bash tools)
[#]: via: (https://opensource.com/article/20/1/screenfetch-neofetch)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

使用 Bash 工具截屏 Linux 系统配置
======

> 使用 ScreenFetch 和 Neofetch 与其他人轻松分享你的 Linux 环境。

![](https://img.linux.net.cn/data/attachment/album/202002/23/124525yiiqs18ll736oro8.jpg)

你可能有很多原因想要与他人分享你的 Linux 配置。你可能正在寻求帮助来对系统上的问题进行故障排除，或者你对所创建的环境感到非常自豪，因此想向其他开源爱好者展示。

你可以在 Bash 提示符下使用 `cat /proc/cpuinfo` 或 `lscpu` 命令获取某些信息。但是，如果你想共享更多详细信息，例如你的操作系统、内核、运行时间、shell 环境，屏幕分辨率等，那么可以选择两个很棒的工具：screenFetch 和 Neofetch。

### screenFetch

[screenFetch][2] 是 Bash 命令行程序，它可以产生非常漂亮的系统配置和运行时间的截图。这是方便的与它人共享系统配置的方法。

在许多 Linux 发行版上安装 screenFetch 很简单。

在 Fedora 上，输入：

```
$ sudo dnf install screenfetch
```

在 Ubuntu 上，输入：

```
$ sudo apt install screenfetch
```

对于其他操作系统，包括 FreeBSD、MacOS 等，请查阅 screenFetch 的 wiki [安装页面][3]。安装 screenFetch 后，它可以生成详细而彩色的截图，如下所示：

![screenFetch][4]

ScreenFetch 还提供各种命令行选项来调整你的结果。例如，`screenfetch -v` 返回详细输出，逐行显示每个选项以及上面的显示。

`screenfetch -n` 在显示系统信息时消除了操作系统图标。

![screenfetch -n option][5]

其他选项包括 `screenfetch -N`，它去除所有输出的颜色。`screenfetch -t`，它根据终端的大小截断输出。`screenFetch -E`，它可抑制错误输出。

请检查手册页来了解其他选项。screenFetch 在 GPLv3 许可证下的开源，你可以在它的 [GitHub 仓库][6]中了解有关该项目的更多信息。

### Neofetch

[Neofetch][7] 是创建系统信息截图的另一个工具。它是用 Bash 3.2 编写的，在 [MIT 许可证][8]下开源。

根据项目网站所述，“Neofetch 支持近 150 种不同的操作系统。从 Linux 到 Windows，一直到 Minix、AIX 和 Haiku 等更晦涩的操作系统。”

![Neofetch][9]

该项目维护了一个 wiki，其中包含用于各种发行版和操作系统的出色的[安装文档][10]。

如果你使用的是 Fedora、RHEL 或 CentOS，那么可以在 Bash 提示符下使用以下命令安装 Neofetch：

```
$ sudo dnf install neofetch
```

在 Ubuntu 17.10 及更高版本上，你可以使用：

```
$ sudo apt install neofetch
```

首次运行时，Neofetch 将 `~/.config/neofetch/config.conf` 文件写入主目录（`.config/config.conf`），它让你可以[自定义和控制][11] Neofetch 输出的各个方面。例如，你可以配置 Neofetch 使用图像、ASCII 文件、你选择的壁纸，或者完全不使用。config.conf 文件还让与它人分享配置变得容易。

如果 Neofetch 不支持你的操作系统或不提供所需选项，请在项目的 [GitHub 仓库][12]中打开一个问题。

### 总结

无论为什么要共享系统配置，screenFetch 或 Neofetch 都应该能做到。你是否知道在 Linux 上提供此功能的另一个开源工具？请在评论中分享你的最爱。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/screenfetch-neofetch

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://github.com/KittyKatt/screenFetch
[3]: https://github.com/KittyKatt/screenFetch/wiki/Installation
[4]: https://opensource.com/sites/default/files/uploads/screenfetch.png (screenFetch)
[5]: https://opensource.com/sites/default/files/uploads/screenfetch-n.png (screenfetch -n option)
[6]: http://github.com/KittyKatt/screenFetch
[7]: https://github.com/dylanaraps/neofetch
[8]: https://github.com/dylanaraps/neofetch/blob/master/LICENSE.md
[9]: https://opensource.com/sites/default/files/uploads/neofetch.png (Neofetch)
[10]: https://github.com/dylanaraps/neofetch/wiki/Installation
[11]: https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
[12]: https://github.com/dylanaraps/neofetch/issues
