[#]: subject: "Obsidian is a Notion Alternative for Hardcore Markdown Users for Creating Knowledge Graph of Notes"
[#]: via: "https://itsfoss.com/obsidian-markdown-editor/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14230-1.html"

黑曜石：Markdown 硬核用户创建知识图谱的 Notion 替代品
======

![](https://img.linux.net.cn/data/attachment/album/202201/31/092728iergl6eayrrrwzuz.jpg)

我喜欢用 Markdown 来写文章和做笔记。我不确定我是否符合 “Markdown 硬核用户”的标准，但我觉得它对我的写作工作很方便。

我在 Linux 上试过几个 Markdown 编辑器。我最喜欢的是 [Joplin][1]，它可以用来做笔记和组织笔记，并在 Nextcloud 上保留备份。还有 [Zettlr][2]，它适合于研究人员。

最近，我遇到了另一个 Markdown 编辑器，它在文档整理方面意外的不错。你可以用它将你的文件相互连接起来，并以类似思维导图的图形方式显示出来。

![黑曜石 Markdown 编辑器][3]

这就是 <ruby>[黑曜石][4]<rt>Obsidian</rt></ruby> 的主要吸引力，你可以用图形的方式查看你的 Markdown 笔记，特别是当这些笔记需要相互连接的时候。当然，它也有其他的功能。

> 非 FOSS 警报！
>
> 最初，我以为黑曜石是一个开源软件。当我寻找他们的源代码库时（在我写完这篇文章后），我才意识到它是 [免费使用的应用程序][5]，但不是 FOSS（自由及开源软件）。这让我觉得惭愧，因为它实在是一个好应用，好到让我继续在这里介绍它。

### 黑曜石 Markdown 编辑器的功能

在黑曜石里，你会发现你期望从一个标准的 Markdown 编辑器得到的所有功能。它有一个侧边栏来显示文件夹结构，还有一个主窗格来显示你的文档。你可以选择在“编辑”和“阅读”视图之间切换。

![黑曜石 Markdown 编辑器的界面][6]

默认情况下，它只显示一个窗格，但你可以根据自己的喜好添加更多的窗格。例如，我添加了一个新的窗格来同时显示编辑和查看模式，这样就可以在同一时间编辑和预览文档。

![你可以垂直或水平地分割编辑器，以增加更多的窗格来并排查看][7]

你可以通过按 `[[` 键来创建现有笔记的内部链接。它可以打开一个文件搜索器，让你从同一项目（这里称为 “<ruby>金库<rt>vault</rt></ruby>”）中的现有笔记中选择。

![在黑曜石创建内部链接][8]

你可以切换到“图表视图”来显示同一个“金库”（项目）中的笔记之间的联系。我快速做了几个内部链接来进行测试，你可以看到它显示了文件之间的相互联系。

![黑曜石图表视图][9]

你可以图形化地进行搜索和替换。对笔记进行备注、合并文件、在笔记之间移动标题等等。

它还有一个命令模式（位于编辑器的左侧侧边栏），允许你控制编辑器的各个方面。其中一些“动作”也可以用键盘快捷键来完成。

![黑曜石命令调色板][10]

这还不是全部。黑曜石还有一个 [社区市场][11]，在那里你可以找到并安装插件来扩展其功能。例如，你可以下载看板插件，用黑曜石来管理项目和任务。

![黑曜石也有第三方的社区插件][12]

这里还有很多功能，我不可能把它们全部列出。即使是项目网站也没有一次性列出所有的功能，这是很无奈的。

### 安装黑曜石

黑曜石是一个跨平台的应用程序，它可用于 Linux、macOS、Windows、Android 和 iOS。

对于 Linux，你可以选择使用 AppImage、Snap 或 Flatpak。我使用 AppImage 版本进行测试。你可以在其下载页面找到相关信息和文件。

- [下载黑曜石][13]

### 它值得使用吗？

黑曜石有一个学习曲线。你当然需要了解 [Markdown 的基础知识][14]，但是除了编辑和显示 Markdown 文本之外的任何功能，你都需要在这里学习。

几乎任何应用程序都需要一些学习，但要想充分使用黑曜石，你需要付出比平常更多的努力。

但如果你是一个痴迷于 Markdown 的用户，并且有成吨的文档，这完全是值得的。这里的好处是它有 [丰富的文档][15] 来帮助你的学习过程。当你点击帮助按钮（显示为问号）时，这些文档也可以从应用界面中获得。

![访问黑曜石的文档][16]

黑曜石的界面让我觉得我在使用 VS Code，这并不是一件坏事。

如果你以 Markdown 为生，并且对正确管理你的文档很着迷，你应该考虑尝试一下黑曜石。

如果你足够喜欢它并开始定期使用它，也许你可以 [考虑捐赠][17] 或使用他们的高级产品以支持这个项目的发展。高级产品包括选择将你的笔记同步到他们的云端，或者将你的笔记发布到网站上。

黑曜石已经做得很专业和漂亮了。它就像 VS Code 的 Markdown 版，它有可能成为 [Notion][18] 等的真正替代品。

--------------------------------------------------------------------------------

via: https://itsfoss.com/obsidian-markdown-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/joplin/
[2]: https://itsfoss.com/zettlr-markdown-editor/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/obsidian.jpg?resize=800%2C424&ssl=1
[4]: https://obsidian.md/
[5]: https://obsidian.md/eula
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-Markdown-Editor-800x462.png?resize=800%2C462&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-multiple-pane.png?resize=800%2C462&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-Internal-Linking.webp?resize=800%2C450&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-Graph-View.png?resize=800%2C474&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-Command-Palette.png?resize=800%2C474&ssl=1
[11]: https://obsidian.md/plugins
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-Plugins.webp?resize=800%2C364&ssl=1
[13]: https://obsidian.md/download
[14]: https://itsfoss.com/markdown-guide/
[15]: https://help.obsidian.md/Obsidian/Index
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/Obsidian-Markdown-Editor-Help.png?resize=800%2C439&ssl=1
[17]: https://obsidian.md/pricing
[18]: https://www.notion.so/
