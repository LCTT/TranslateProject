[#]: subject: "Gaphor: Open Source Graphical Modeling Tool"
[#]: via: "https://itsfoss.com/gaphor-modeling-tool/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14079-1.html"

Gaphor：开源的图形化建模工具
======

![](https://img.linux.net.cn/data/attachment/album/202112/13/231534fobo72taxam7f2ma.jpg)

Gaphor 是一个自由开源的建模应用，支持各种建模语言，如 UML、[SysML][1]、RAAML 和 C4。

不知道“<ruby>建模语言<rt>modeling language</rt></ruby>”这个词？基本上，它是一组可以用来创建设计和构造结构的指令。它可以是文字的，也可以是图形的。

图形化的更容易看，也更容易弄清楚项目的各个组成部分是如何相互关联的。

你见过流程图或顺序图吗？那些也是一种最简单形式的图形建模。

![Sequence diagram example][2]

有各种建模语言，它们被用于软件开发、系统工程、物理学、项目管理等方面。

### 用于 UML、SysML 等的 Gaphor

[Gaphor][3] 使用 UML、SysML 和 RAAML OMG 标准。它还包括对 C4 模型的支持，用于软件架构的可视化。

它不仅仅是一个 [绘图工具][4]。它实现了一个完全兼容的 UML 2 数据模型。你可以用 Gaphor 创建高度复杂的模型。

![][5]

用 Python 编写的 Gaphor 在 Apache 2 许可证下是完全开源的。你可以在 [其 GitHub 仓库][6] 找到它的所有源代码。它是一个跨平台的工具，可以安装在 Linux、Windows 和 macOS 上。

你可以以 PDF、PNG、SVG 和 XML 格式导出你的图表。你还可以插入一个代码生成器。

Gaphor 网站提到它有深色模式，但我在下载的 AppImage 版本中没有看到任何选项可以启用它。

### 在 Linux 上安装 Gaphor

![Gaphor user interface][7]

Arch 用户可以在 AUR 中找到 Gaphor。对于其他发行版，你可以选择 [AppImage][8] 和 Flatpak。

你可以从其 [下载页面][9] 下载 AppImage。

如果你想使用 Flatpak 版本，请先添加 Flathub 仓库：

```
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

然后再安装它：

```
flatpak install --user flathub org.gaphor.Gaphor
```

由于 Gaphor 本质上是一个 Python 应用，你也可以 [使用 Pip][10] 安装它。

```
pip install gaphor
```

当我还是一名软件工程师工作时，我使用 UML 和序列图。在过去的几年里，我没有使用它。看看 Gaphor，我认为如果你必须为你的项目创建 UML 和其他图表，它是一个相当不错的应用。

欢迎试一试，并在评论中分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gaphor-modeling-tool/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://sysml.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/sequence-diagram-example-800x364.png?resize=800%2C364&ssl=1
[3]: https://gaphor.org/
[4]: https://itsfoss.com/open-source-paint-apps/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/gaphor-uml-screenshot.jpg?resize=800%2C570&ssl=1
[6]: https://github.com/gaphor
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/gaphor-example-800x445.png?resize=800%2C445&ssl=1
[8]: https://itsfoss.com/use-appimage-linux/
[9]: https://gaphor.org/download.html#linux
[10]: https://itsfoss.com/install-pip-ubuntu/
