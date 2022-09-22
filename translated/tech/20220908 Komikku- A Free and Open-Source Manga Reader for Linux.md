[#]: subject: "Komikku: A Free and Open-Source Manga Reader for Linux"
[#]: via: "https://itsfoss.com/komikku-manga-reader/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Komikku: 一个免费的、开源的 Linux 漫画（Manga）阅读器
======

喜欢阅读漫画书吗？有[大量可用于 Linux 的漫画阅读器][1]。

但是，为日本漫画（Manga）量身定做的东西呢？

我想我找到了一个适合阅读漫画的完美应用，它可以组织它们，也可以下载它们进行离线使用。我最近发现的这个应用叫做 **Kommiku**。

让我提一下这个应用的主要亮点，并帮助你在 Linux 上开始使用它。

### Komikku: 一个 Linux 专用的漫画阅读器

![Komikku UI][2]

Komikku 是一个开源的漫画阅读器，且仅有 Linux 应用。

它主要是为配合 GNOME 桌面环境而定制的，但你也可以在运行[其他桌面环境][3]的 Linux 发行版上使用它。

许多 PDF 或[电子书阅读器][4]如 Bookworm、Calibre 和 Foliate 都支持漫画书格式。

然而，Komikku 用户更多的有功能，以获得阅读漫画的良好体验。

![Komikku 在线服务器列表][5]

例如，Komikku 可在线和离线观看漫画。此外，你可以从支持的服务器上下载它。

### Komikku 的特点

![komikku reader][6]

Komikku的 一些最佳功能包括：

* 从几十个支持的服务器进行在线阅读。
* 从已下载的漫画离线阅读。
* 组织你的库的类别。
* 从右到左、从左到右、垂直和网络漫画阅读模式。
* 几种类型的导航（键盘方向键，通过鼠标左右滑动或点击（触摸板/触摸屏）、滚轮和滑动手势（触摸板和触摸屏）。
* 漫画的自动更新。
* 自动下载新的章节。
* 阅读历史。
* 浅色和深色主题。
* 自适应设计（能够从桌面工作站扩展到移动电话）。
* 键盘快捷键。

![Komikku 紧凑视图][7]

### 安装

Komikku 可在 [Flathub][8] 上找到。因此，你可以把它安装在任何 Linux 发行版上。

然而，你需要[在你的系统上设置 Flatpak 并启用 Flathub 仓库][9]。

当你在系统上设置了 Flatpak，你可以通过软件中心搜索它，或者从你的终端安装它。

![从 GNOME 软件中安装 Komikku][10]

要使用终端安装Komikku，请输入以下命令：

```
flatpak install flathub info.febvre.Komikku
```

Komikku 的原生包也可用于 Arch Linux 和 Fedora 等发行版。以下是安装它们的命令：

对于 Arch Linux（在 AUR 中可用）：

```
yay -Syu komikku
```

对于 Fedora（在官方仓库中可用）：

```
sudo dnf install komikku
```

查看 Komikku 的源代码以及在其 [GitLab 页面][11]上从源代码构建它的说明。前往其官方网页了解更多信息。

[下载 Komikku][12]

### 总结

我发现 Komikku 是非常直观和干净的。注意到在线服务器并不总是工作，可以预期会有一些小故障，但管理离线漫画和将你的收藏分类是毫不费力的。

所有这些都要感谢 **Valéry Febvre**（Komikku 的开发者），我们有了另一个有用的 Linux 应用。如果你喜欢这个应用，你可以考虑向该项目捐款。

*你使用哪种漫画书阅读器？你会尝试 Komikku 吗？请在下面的评论中告诉我你的想法*。

--------------------------------------------------------------------------------

via: https://itsfoss.com/komikku-manga-reader/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-comic-book-reader-linux/
[2]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-library.png
[3]: https://itsfoss.com/best-linux-desktop-environments/
[4]: https://itsfoss.com/best-ebook-readers-linux/
[5]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-online-servers.png
[6]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-reader.png
[7]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-mobile-view.png
[8]: https://flathub.org/apps/details/info.febvre.Komikku
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://itsfoss.com/wp-content/uploads/2022/09/install-komikku-gnome-software.png
[11]: https://gitlab.com/valos/Komikku
[12]: https://valos.gitlab.io/Komikku/
