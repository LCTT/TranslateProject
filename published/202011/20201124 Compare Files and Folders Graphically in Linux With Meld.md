[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12866-1.html)
[#]: subject: (Compare Files and Folders Graphically in Linux With Meld)
[#]: via: (https://itsfoss.com/meld-gui-diff/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

使用 Meld 在 Linux 中以图形方式比较文件和文件夹
======

![](https://img.linux.net.cn/data/attachment/album/202011/28/145914mr5zcl2wnns8rj5j.jpg)

如何比较两个相似的文件来检查差异？答案显而易见，就是[使用 Linux 中的 diff 命令][1]。

问题是，并不是每个人都能自如地在 Linux 终端中比较文件，而且 `diff` 命令的输出可能会让一些人感到困惑。

以这个 `diff` 命令的输出为例：

![][2]

这里肯定涉及到一个学习曲线。然而，如果你使用的是桌面 Linux，你可以使用 [GUI][3] 应用来轻松比较两个文件是否有任何差异。

有几个 Linux 中的 GUI 差异比较工具。我将在本周的 Linux 应用亮点中重点介绍我最喜欢的工具 Meld。

### Meld：Linux（及 Windows）下的可视化比较和合并工具

通过 [Meld][4]，你可以将两个文件并排比较。不仅如此，你还可以对文件进行相应的修改。这是你在大多数情况下想做的事情，对吗？

![File Comparison][5]

Meld 还能够比较目录，并显示哪些文件是不同的。它还会显示而文件是新的或是缺失的。

![Directory Comparison][6]

你也可以使用 Meld 进行三向比较。

![Three Way File Comparison][7]

图形化的并排比较在很多情况下都有帮助。如果你是开发人员，你可以用它来了解代码补丁。Meld 还支持版本控制系统，如 Git、[Mercurial][8]、[Subversion][9] 等。

### Meld 的功能

![][10]

开源的 Meld 工具具有以下主要功能：

  * 进行双向和三向差异比较
  * 就地编辑文件，差异比较立即更新
  * 在差异和冲突之间进行导航
  * 通过插入、更改和冲突相应地标示出全局和局部差异，使其可视化
  * 使用正则文本过滤来忽略某些差异
  * 语法高亮显示
  * 比较两个或三个目录，看是否有新增加、缺失和更改的文件
  * 将一些文件排除在比较之外
  * 支持流行的版本控制系统，如 Git、Mercurial、Bazaar 和 SVN
  * 支持多种国际语言
  * 开源 GPL v2 许可证
  * 既可用于 Linux，也可用于 Windows

### 在 Linux 上安装 Meld

Meld 是一个流行的应用程序，它在大多数 Linux 发行版的官方仓库中都有。

检查你的发行版的软件中心，看看 Meld 是否可用。

![Meld In Ubuntu Software Center][11]

另外，你也可以使用你的发行版的命令行包管理器来安装 Meld。在 [Ubuntu 上，它可以在 Universe 仓库中找到][12]，并且可以[使用 apt 命令安装][13]：

```
sudo apt install meld
```

你可以在 GNOME 的 GitLab 仓库中找到 Meld 的源码：

[Meld Source Code][14]

### 它值得使用吗？

我知道[大多数现代开源编辑器][15]都有这个功能，但有时你只是想要一个简单的界面，而不需要安装额外的附加软件来比较文件。Meld 就为你提供了这样的功能。

你是否使用一些其他工具来检查文件之间的差异？是哪种工具呢？如果你用过 Meld，你有什么经验？请在评论区分享你的意见。

--------------------------------------------------------------------------------

via: https://itsfoss.com/meld-gui-diff/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/diff-command/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/diff-command-complicated-output.png?resize=795%2C551&ssl=1
[3]: https://itsfoss.com/gui-cli-tui/
[4]: https://meldmerge.org
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/file-comaprison-in-Linux-with-meld.png?resize=800%2C498&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/directory-comparison-in-Linux-with_meld.png?resize=800%2C497&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/three-way-file-comaprison-with-meld-in-linux.png?resize=800%2C466&ssl=1
[8]: https://www.mercurial-scm.org/
[9]: https://subversion.apache.org/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/meld-visual-diff.png?resize=786%2C455&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/Meld-in-Ubuntu-Software-Center.png?resize=800%2C384&ssl=1
[12]: https://itsfoss.com/ubuntu-repositories/
[13]: https://itsfoss.com/apt-command-guide/
[14]: https://gitlab.gnome.org/GNOME/meld
[15]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
