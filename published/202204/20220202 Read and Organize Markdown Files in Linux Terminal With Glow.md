[#]: subject: "Read and Organize Markdown Files in Linux Terminal With Glow"
[#]: via: "https://itsfoss.com/glow-cli-tool-markdown/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14457-1.html"

用 Glow 在 Linux 终端阅读和管理 Markdown 文件
======

![](https://img.linux.net.cn/data/attachment/album/202204/11/151437wdzjaetardciedt1.jpg)

> Glow 是一个能让你在 Linux 终端渲染 Markdown 文件的命令行工具。你也可以用它来管理 Markdown 文件。

我喜欢 Markdown。虽然我不是一个专业的 Markdown 用户，但我几乎用 Markdown 写我的大部分文章。

如果你是我们的常客，你可能已经看到过 [Markdown 指南][1]、编辑器以及 Obsidian 之类的工具。我将再加个工具到这个名单中，它叫做 [Glow][2]，并且不像之前涵盖的程序，Glow 能够让你在终端里阅读 Markdown 文件。

等等！难道不能在终端里使用 [阅读文本文件的常规 Linux 命令][3]，如 `cat`、`less`，甚至是像 Vim 之类的编辑器来阅读 Markdown 文件吗？

当然可以。但它会原样显示所有的代码来显示原始的 Markdown 文件，而不是显示正确的格式化文本。

![Glow renders the Markdown file][4]

注意：Glow 不是一个编辑器。你不能用它去编写 Markdown 文本。

### Markdown 爱好者将会喜欢 Glow 的功能

Glow 可以用两种格式来使用：[命令行界面和终端用户界面][5]。

简单的对一个 Markdown 文件使用 Glow 命令将在屏幕上显示整个渲染后的内容。

```
glow markdown_file
```

![Markdown display with Glow][6]

这是很不错，但是 Glow 可以做的更好。它有额外的参数打开<ruby>终端用户界面<rt>terminal user interface</rt></ruby>（TUI）模式，并且允许你用它来做更多的事情。

你可以使用页面参数（`-p`）来在页面模式下显示渲染后的文本（类似 `less` 命令显示文本没有弄乱屏幕一样）。

```
glow -p markdown_file
```

在页面视图中，你可以使用 `less` 命令相同的方法，使用 `/` 键来搜索特定的文本。你可以按下`q` 键退出这个视图。

![Pager view similar to the less command][7]

不止这些。你可以使用 `-a` 选项，它将查找当前目录及子目录中的所有 Markdown 文件。

```
glow -a
```

你可以用方向键在屏幕上滚动文件。上下键向上和向下移动，左右键按照页数移动。

![With -a option, Glow finds and displays all Markdown files in current directory][8]

你可以查看显示在底部的帮助选项。在这个视图中，查找选项允许你根据文件名查找文件（不是它们的内容）。

![You can search files by their name][9]

这里也有标签。当然，你可以通过 `Tab` 键在标签中来回移动。

<ruby>隐藏<rt>stashed</rt></ruby>标签像一个书签。当你浏览文件或是查看它们的内容时，你可以按下 `s` 键来创建一个隐藏标签（书签）。这个书签将只会在当前目录下可见。

你可以按下 `x` 键来移除书签（不是文件）或者按下 `m` 键来添加一个备注。

![You can bookmark files by stashing them with s key][10]

<ruby>新闻<rt>news</rt></ruby>标签显示更新日志和来自 Glow 开发者（们）的其他消息。

![The news tab shows messages from the developers][11]

当你已经找到你想找的文件，你可以通过按下回车键来查看它们。因为你在终端用户界面模式，所以你这里会有额外的键盘选项。可以通过按下 `?` 键来显示选项。

![You can view keyboard shortcuts by pressing the ? key][12]

### 在 Linux 上安装 Glow

Glow 可以在 Linux 和 macOS 上使用。你可以在 macOS 和 [Linux 上使用 Homebrew][13] 来安装它，然而，我建议你在这里使用 Linux 安装包。

Glow 在 Void、Solus 和 Arch Linux 的仓库里是可用的。你可以用它们的包管理器来安装它们。

在基于 Arch 的发行版上，使用：

```
sudo pacman -S glow
```

对于 Ubuntu、Debian、Fedora 和 SUSE，它们有用于在各种架构的 .DEB 和 .RPM 二进制包，你可以在它们的发布页找到它们。

> [下载用于其它 Linux 发行版的 Glow][14]

### 总结

总之，Glow 是在终端里的一个美化视图和管理 Markdown 的便利工具。像许多其他的命令行工具一样，它不是每个人都适合。如果你经常在终端，并喜欢 Markdown 文件，你可以尝试使用一下。当你用过后，请在评论区里分享你使用它的体验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/glow-cli-tool-markdown/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/markdown-guide/
[2]: https://github.com/charmbracelet/glow
[3]: https://linuxhandbook.com/view-file-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/markdown-display-with-cat.png?resize=1572%2C962&ssl=1
[5]: https://itsfoss.com/gui-cli-tui/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/markdown-display-with-glow.png?resize=800%2C490&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/pager-view-with-glow.png?resize=800%2C451&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/glow-collection.png?resize=800%2C451&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/find-files-in-glow.png?resize=800%2C451&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/stash-feature-glow.png?resize=800%2C374&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/glow-news-tab.png?resize=800%2C451&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/display-help-in-file-view-in-glow.png?resize=800%2C490&ssl=1
[13]: https://itsfoss.com/homebrew-linux/
[14]: https://github.com/charmbracelet/glow/releases
