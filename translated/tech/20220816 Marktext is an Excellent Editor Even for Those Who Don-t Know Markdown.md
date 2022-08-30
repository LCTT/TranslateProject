[#]: subject: "Marktext is an Excellent Editor Even for Those Who Don’t Know Markdown"
[#]: via: "https://itsfoss.com/marktext-editor/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " Chth0lly"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

即使对那些不知道Markdown的人来说Marktext也是一个绝佳的编辑器
======

又一个Markdown编辑器？我们见的Markdown编辑器还少吗？

我明白你的感受，如果你是个Markdown爱好者，你可能已经用过很多编辑器了，比如 [Joplin][1] 和 [Zettlr][2],。但如果你不是的话，你可能根本就不在乎。

Markdown是一个非常好的标记语言，特别是对那些在网络上写作的人来说。我不想在这里讲太多细节。但如果你有兴趣的话，我们有一个[非常棒的Markdown初学者教程][3]。

这次我想推荐给你（另一个）Markdown编辑器，它叫[Marktext][4]，并且它是用Electron制作的（我们都明白这什么意思，先别恨我）

我发现这将是一个很完美的编辑器。它运行起来和它看起来一样漂亮。下面是我这几天来的使用体验。

### Marktext: 人人可用的Markdown编辑器

尽管我很讨厌[Electron框架][5]但不得不承认基于Electron的应用都有一个干净，现代的界面。

![Marktext interface][6]

我更喜欢黑暗模式主题，除此之外官方还提供了5种其它主题。

![Marktext dark theme][7]

打开软件你就可以立刻进行写作，如果你不记得某个语法了，那也没有问题，输入@就可以得到语法提示，如：

* 标题
* 分隔线
* 表格
* Latex数学公式
* HTML块
* 代码块
* 引用
* 清单
* 用Vega-lite.js，Flowchart.js，JS序列和Plantuml制作的图表

* Diagrams using vega-lite.js, flowchart.js, js-sequence and PlantUML

![Use various document elements in the editor by pressing @][8]

选中文本你会得到一个格式选项框来改变文本为粗体，斜体，下划线，删除线等。你也可以用黄色背景高亮文本，并转换为行内块，行内公式或插入超链接。

![Text formatting options][9]

Marktext也支持图片。我们都知道图片不是markdown文件的一部分，它们是外部元素但是你可以选择将图片保存到md文件保存的目录下。

![Images are supported too][10]

通过在插入列表中添加图片非常容易。你可以通过选择文本并且从弹出的格式选择中添加图片或使用Ctrl+Shift+快捷键。但是不能为图片添加替换文本或图片说明，这点确实需要改进。

我喜欢Marktext的表格功能。你可以直接插入预先定义好大小的图表。如有需要，还可以很容易的改变大小。你可以只用鼠标移动列和行，而不用担心源代码。

![Tables are very well supported in Marktext][11]

您可以启用侧边栏视图。侧边栏为您有三个主要功能。您可以打开包含多个Markdown文件的文件夹，在打开的文件夹中的所有文件中执行全局搜索，并显示当前打开的文件的目录。大纲的目录是根据标题自动生成的。

![Sidebar view has three options: Show folder content, global search and table of content][12]

底部的齿轮按钮是主要设置。你可以改变主题，改变图片设置，开启自动保存等等。

![Configuration and settings][13]

### 如何安装Marktext

Marktext 是一个跨平台的开源应用程序。所以不止在Linux ，你还可以在 Windows 和 macOS安装。

在LInux上，你可以选择AppImage版或Flatpak版。从[这里][14]可以得到Marktext的Appimage包。

我选择了 Flatpak 版本，因为这样可以获得更好的系统集成。它运行良好，因为 Marktext 自动成为我的 Ubuntu 22.04 系统上 md 文件的默认编辑器。

请确保你有Flatpak并在你的系统上开启了，之后用以下方法添加上Flathub仓库。

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

在这之后，用以下命令安装Marktext到你的系统上：

```
flatpak install flathub com.github.marktext.marktext
```

如果用了一段时间后你不喜欢Marktext，用以下命令卸载：

```
fkatpak uninstall com.github.marktext.marktext
```

### 最后

Marktext有很多小功能，例如字数统计、Latex数学公式、拼写检查器或复制粘贴为Markdown或 HTML格式，我留给你们自己去尝试。

实话实说，尽管多年来一直使用 Markdown 来写文章，但我也总会忘掉一此语法。我记得常见的标题、列表、代码块等，但如果我必须创建一个表格，我不得不在网上搜索。

我已经[尝试了许多Markdown编辑器][15]，这其中确实有很多不错的。但是，我还是喜欢用 Marktext，它会在我的系统上存在很长时间。

如果你已经用过了话，请在评论区分享您的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/marktext-editor/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[Chth0lly](https://github.com/译者ID)
校对：[校对者ID](https://github.com/)

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
