[#]: subject: "Marktext is an Excellent Editor Even for Those Who Don’t Know Markdown"
[#]: via: "https://itsfoss.com/marktext-editor/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "Chth0lly"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14986-1.html"

即使对那些不知道 Markdown 的人来说，Marktext 也是一个绝佳的编辑器
======

![](https://img.linux.net.cn/data/attachment/album/202208/31/170837f0kx77ewii4hkih0.jpg)

又一个 Markdown 编辑器？我们见的 Markdown 编辑器还少吗？

我明白你的感受，如果你是个 Markdown 爱好者，你可能已经用过很多 Markdown 编辑器了，比如 [Joplin][1] 和 [Zettlr][2]。但如果你不是的话，你可能根本就不在乎。

Markdown 是一个非常好的标记语言，特别是对那些在网络上写作的人来说。我不想在这里讲太多细节，但如果你有兴趣的话，我们有一篇 [非常棒的 Markdown 初学者教程][3]。

这次我想推荐给你（另一个）Markdown 编辑器，它叫 [Marktext][4]，并且它是用 Electron 制作的（我们都明白这什么意思，先别急着埋怨我）。

我发现这将是一个很完美的编辑器。它很漂亮，而它运行起来也一样棒。下面是我这几天来的使用体验。

### Marktext: 人人可用的 Markdown 编辑器

尽管我很讨厌 [Electron 框架][5]，但不得不承认基于 Electron 的应用都有一个干净、现代的界面。

![Marktext interface][6]

我更喜欢深色模式主题，除此之外官方还提供了五种其它主题。

![Marktext dark theme][7]

打开软件你就可以立刻进行写作，如果你不记得某个语法了，那也没有问题，输入 `@` 就可以得到语法提示，如：

* 标题
* 分隔线
* 表格
* Latex 数学公式
* HTML 块
* 代码块
* 引用
* 列表
* 检查清单
* 用 Vega-lite.js、Flowchart.js、js-sequence-diagrams 和 PlantUML 制作的图表

![Use various document elements in the editor by pressing @][8]

选中文本你会得到一个格式选项框，来改变文本为粗体、斜体、下划线、删除线等。你也可以用黄色背景高亮文本、转换为内联代码、内联公式或插入超链接。

![Text formatting options][9]

Marktext 也支持图片。我们都知道图片不是 Markdown 文件的一部分，它们是外部元素，但是你可以选择将图片保存到 .md 文件所在的目录下。

![Images are supported too][10]

通过插入菜单来添加图片非常容易。你可以选择文本并且从弹出的格式选项中选择图片来添加，或使用 `Ctrl+Shift+I` 快捷键。但是不能为图片添加替换文本或图片说明，这点确实需要改进。

我喜欢 Marktext 的表格功能。你可以直接插入预先定义好大小的图表。如有需要，还可以很容易的改变大小。你可以只用鼠标移动列和行，而不用担心底层的代码。

![Tables are very well supported in Marktext][11]

你可以启用侧边栏视图。侧边栏有三个功能：你可以打开包含多个 Markdown 文件的文件夹，在打开的文件夹中的所有文件上执行全局搜索，并显示当前打开的文件的大纲目录。大纲目录是根据子标题自动生成的。

![Sidebar view has three options: Show folder content, global search and table of content][12]

底部的齿轮按钮是设置功能。你可以改变主题、改变图片设置、视图、开启自动保存等等。

![Configuration and settings][13]

### 如何安装 Marktext

Marktext 是一个跨平台的开源应用程序。所以不止在 Linux 上，你还可以在 Windows 和 macOS 安装。

在 Linux 上，你可以选择 AppImage 软件包或 Flatpak 软件包。从 [这里][14] 可以得到 Marktext 的 Appimage 软件包。

我选择了 Flatpak 版本，因为这样可以获得更好的系统集成。它运行良好，Marktext 自动成为我的 Ubuntu 22.04 系统上 .md 文件的默认编辑器。

请确保你启用了 Flatpak 支持，之后用以下方法添加上 Flathub 仓库：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

在这之后，用以下命令安装 Marktext 到你的系统上：

```
flatpak install flathub com.github.marktext.marktext
```

如果用了一段时间后你不喜欢 Marktext，可以用以下命令卸载：

```
fkatpak uninstall com.github.marktext.marktext
```

### 总结

Marktext 有很多小功能，例如字数统计、Latex 数学公式、拼写检查器、复制粘贴为 Markdown/HTML 格式，我留给你们自己去尝试。

实话实说，尽管多年来一直使用 Markdown 来写文章，但我也总会忘掉一些语法。我能记得常见的标题、列表、代码块等，但如果我必须创建一个表格，我不得不在网上搜索。

我已经 [尝试了许多 Markdown 编辑器][15]，这其中确实有很多不错的。但是，我还是喜欢用 Marktext，它会在我的系统上存在很长时间。

如果你已经用过了话，请在评论区分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/marktext-editor/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[Chth0lly](https://github.com/Chth0lly)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/joplin/
[2]: https://itsfoss.com/zettlr-markdown-editor/
[3]: https://itsfoss.com/markdown-guide/
[4]: https://github.com/marktext/marktext/
[5]: https://www.electronjs.org/
[6]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-interface.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-dark-theme.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-insert-options.png
[9]: https://itsfoss.com/wp-content/uploads/2022/08/text-formatting-options-marktext.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/images-in-marktext.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/tables-in-marktext.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/sidebar-view-marktext.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/marktext-settings.png
[14]: https://github.com/marktext/marktext/releases
[15]: https://itsfoss.com/best-markdown-editors-linux/
