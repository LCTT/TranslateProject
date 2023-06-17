[#]: subject: (Zathura: A Minimalist Document Viewer for Keyboard Shortcut Pros)
[#]: via: (https://itsfoss.com/zathura-document-viewer/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (tanloong)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Zathura: 使用键盘操作的极简文档查看器
======

文档查看器是每个 Linux 发行版的必备软件，用来阅读 PDF 等格式的文件。

Ubuntu 等发行版上的文档查看器一般是 [GNOME 中的 Evince][1] (LCTT 译注：[/ɪˈvɪns/][14])。Evince 支持多种文件格式，非常方便。

但是除了 Evince，还有很多其他的文档阅读应用。比如 Linux 上优秀的电子书阅读应用 [Foliate][2] (LCTT 译注：[/ˈfəʊlɪɪt/][15])。

最近我又发现了另一个文档查看器：Zathura。

### 用 Zathura 获得摆脱鼠标的阅读体验

[Zathura][4] 是一个高度可定制的文档查看器，基于 [girara 用户界面][5] 等库。girara 实现了一个简单、最小的用户界面。

Zathura 的加载速度极快。它极其简约，没有侧边栏、菜单栏等元素。(LCTT 译注：其实 Zathura 的界面没有那么单一，按 `Tab` 键可以显示索引页；Zathura 有一个 guioptions 选项来设置是否显示命令行、状态栏、水平滚动条、垂直滚动条等 GUI 元素。)

![Zathura 文档查看器界面][6]

按 `:` 键可以打开 Zathura 的命令行提示符，按 `Esc` 键可以退出命令行。

如果要新建书签，可以输入 `:bmark` 后面跟想要对这个书签设置的索引号。

![Zathura 中的书签][7]

按 `F` 键可以高亮所有链接，每条链接附带一个序号，并且界面底部会显示命令行提示符。在命令行中输入链接对应的序号，按下回车可以用系统默认的浏览器打开该链接。

![高亮及打开文档中的链接][8]

Zathura 还支持自动重载。如果文件被其他应用修改 (LCTT 译注：比如在修改 LaTeX 源文件并重新编译得到新的 PDF 之后)， Zathura 会自动重载修改后的文件。

你还可以安装 [插件][17] 来扩展 Zathura 的功能，比如阅读 <ruby>漫画<rt>comics</rt></ruby> 或 PostScript 文件。

但 Zathura 有一个问题，它的界面上没有任何文档或帮助选项，初次使用会有点困难。

你可以从其 Zathura 的 [手册页][9] 获取默认键盘快捷键信息。以下是其中的一部分：

  * R：旋转
  * D：在单页和双页查看模式之间切换
  * F：高亮当前屏幕内的链接
  * HJKL：使用 Vim 类型键移动 (LCTT 译注：HJKL 分别为左、下、上、右)
  * 上下左右键或 PgUp/PgDown 或鼠标/触摸板：上下移动
  * /：搜索文本，按 n 或 N 移动到下一个或上一个搜索 (类似于 less 命令)
  * Q：关闭

Zathura 的项目网站提供了 [如何配置该软件的文档][16]，不过我觉得写得不太清晰。(LCTT 译注：安装 Zathura 之后，可以使用 `man zathurarc` 查看本地的 Zathura 配置手册。)

### 在 Linux 上安装 Zathura

大多数 Linux 发行版的软件仓库都包含了 Zathura，比如 Ubuntu、Fedora、Arch 和 Debian (查找自 [pkgs.org 网站][10])。你可以使用你的发行版上的包管理器或软件中心来安装它。

在 Debian 和 Ubuntu 系发行版上可以使用下面的命令安装 Zathura：

```
sudo apt install zathura
```

在 Fedora 上可以使用:

```
sudo dnf install zathura
```

[在 Arch Linux 上使用 pacman 安装 Zathura][12]:

```
sudo pacman -Sy zathura
```

如果你想查看 Zathura 的源代码，可以访问它在 GitLab 上的软件仓库：

[Zathura 源代码][13]

### 总结

坦诚地说，我并不喜欢不使用鼠标的工具，所以我更喜欢 Nano 而不是 Vim，因为我记不住 Vim 上数不清的快捷键。(LCTT 译注：其实 Zathura 对鼠标是有一定支持的，单击鼠标左键可以打开链接，按住鼠标左键可以选中并复制文本，按住鼠标中键可以拖动视图，`Ctrl`+滚动滑轮可以缩放视图。)

我知道有很多人坚信键盘比鼠标更高效。但我并不愿意专门学习如何配置文档查看器，主要是因为我在桌面上很少阅读大量文档，当我偶尔需要查看 PDF 时，默认的应用已经够用了。

当然，我不是说 Zathura 没有用处。如果你需要处理大量 PDF 或 LaTeX 等的文档，而且偏爱于键盘操作，Zathura 可能会成为你下一个最喜爱的工具。

--------------------------------------------------------------------------------

via: https://itsfoss.com/zathura-document-viewer/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[tanloong](https://github.com/tanloong)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Evince
[2]: https://itsfoss.com/foliate-ebook-viewer/
[3]: https://itsfoss.com/best-ebook-readers-linux/
[4]: https://pwmt.org/projects/zathura/
[5]: https://git.pwmt.org/pwmt/girara
[6]: https://itsfoss.com/content/images/wordpress/2021/07/Zathura-Document-Viewer-Interface.png 
[7]: https://itsfoss.com/content/images/wordpress/2021/07/bookmarking-in-zathura.png 
[8]: https://itsfoss.com/content/images/wordpress/2021/07/Follow-link-in-Zathura.png 
[9]: https://itsfoss.com/linux-man-page-guide/
[10]: https://pkgs.org/
[11]: https://itsfoss.com/package-manager/
[12]: https://itsfoss.com/pacman-command/
[13]: https://git.pwmt.org/pwmt/zathura
[14]:https://en.wiktionary.org/wiki/evince
[15]: https://en.wiktionary.org/wiki/foliate
[16]: https://pwmt.org/projects/zathura/documentation/
[17]: https://pwmt.org/projects/zathura/plugins/
