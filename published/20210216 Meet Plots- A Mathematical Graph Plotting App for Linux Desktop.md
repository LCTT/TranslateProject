[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13151-1.html)
[#]: subject: (Meet Plots: A Mathematical Graph Plotting App for Linux Desktop)
[#]: via: (https://itsfoss.com/plots-graph-app/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

认识 Plots：一款适用于 Linux 桌面的数学图形绘图应用
======

![](https://img.linux.net.cn/data/attachment/album/202102/25/140338su2fju6016t5q2tz.jpg)

Plots 是一款图形绘图应用，它可以轻松实现数学公式的可视化。你可以用它来绘制任意三角函数、双曲函数、指数函数和对数函数的和与积。

### 在 Linux 上使用 Plots 绘制数学图形

[Plots][1] 是一款简单的应用，它的灵感来自于像 [Desmos][2] 这样的 Web 图形绘图应用。它能让你绘制不同数学函数的图形，你可以交互式地输入这些函数，还可以自定义绘图的颜色。

Plots 是用 Python 编写的，它使用 [OpenGL][3] 来利用现代硬件。它使用 GTK 3，因此可以很好地与 GNOME 桌面集成。

![][4]

使用 Plots 非常直白。要添加一个新的方程，点击加号。点击垃圾箱图标可以删除方程。还可以选择撤销和重做。你也可以放大和缩小。

![][5]

你输入方程的文本框是友好的。菜单中有一个“帮助”选项可以访问文档。你可以在这里找到关于如何编写各种数学符号的有用提示。你也可以复制粘贴方程。

![][6]

在深色模式下，侧栏公式区域变成了深色，但主绘图区域仍然是白色。我相信这也许是这样设计的。

你可以使用多个函数，并将它们全部绘制在一张图中：

![][7]

我发现它在尝试粘贴一些它无法理解的方程时崩溃了。如果你写了一些它不能理解的东西，或者与现有的方程冲突，所有图形都会消失，去掉不正确的方程就会恢复图形。

不幸的是，没有导出绘图或复制到剪贴板的选项。你可以随时 [在 Linux 中截图][8]，并在你要添加图像的文档中使用它。

### 在 Linux 上安装 Plots

Plots 为各种发行版提供了不同的安装方式。

Ubuntu 20.04 和 20.10 用户可以[使用 PPA][11]：

```
sudo add-apt-repository ppa:apandada1/plots
sudo apt update
sudo apt install plots
```

对于其他基于 Debian 的发行版，你可以使用 [这里][13] 的 [deb 文件安装][12]。

我没有在 AUR 软件包列表中找到它，但是作为 Arch Linux 用户，你可以使用 Flatpak 软件包或者使用 Python 安装它。

- [Plots Flatpak 软件包][14]

如果你感兴趣，可以在它的 GitHub 仓库中查看源代码。如果你喜欢这款应用，请考虑在 GitHub 上给它 star。

- [GitHub 上的 Plots 源码][1]

### 结论

Plots 主要用于帮助学生学习数学或相关科目，但它在很多其他场景下也能发挥作用。我知道不是每个人都需要，但肯定会对学术界和学校的人有帮助。

不过我倒是希望能有导出图片的功能。也许开发者可以在未来的版本中加入这个功能。

你知道有什么类似的绘图应用吗？Plots 与它们相比如何？

--------------------------------------------------------------------------------

via: https://itsfoss.com/plots-graph-app/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://github.com/alexhuntley/Plots/
[2]: https://www.desmos.com/
[3]: https://www.opengl.org/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/fourier-graph-plots.png?resize=800%2C492&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/plots-app-linux-1.png?resize=800%2C518&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/plots-app-linux.png?resize=800%2C527&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/multiple-equations-plots.png?resize=800%2C492&ssl=1
[8]: https://itsfoss.com/take-screenshot-linux/
[10]: https://itsfoss.com/keenwrite/
[11]: https://itsfoss.com/ppa-guide/
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://launchpad.net/~apandada1/+archive/ubuntu/plots/+packages
[14]: https://flathub.org/apps/details/com.github.alexhuntley.Plots
