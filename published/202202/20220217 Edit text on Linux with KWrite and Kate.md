[#]: subject: "Edit text on Linux with KWrite and Kate"
[#]: via: "https://opensource.com/article/22/2/edit-text-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14310-1.html"

用 KWrite 和 Kate 在 Linux 上编辑文本
======

> 两个 Linux KDE 文本编辑器。一个强大的 KTextEditor 库。

![](https://img.linux.net.cn/data/attachment/album/202202/27/144611kfsjnefsnlc2c9ee.jpg)

文本编辑器通常是一个很好的示例应用，可以展示一个编程框架能够产生什么。我自己在关于 [wxPython、PyQt][2] 和 [Java][3] 的文章中至少写过三个文本编辑器的例子。它们被视为容易创建的应用的原因是，这些框架提供了许多最难编写的代码。我认为这也是大多数操作系统提供简单的桌面文本编辑器的原因。它们对用户有用，对开发者也很容易开发。

在 KDE Plasma 桌面上，有两个文本编辑器可供选择：简陋的 KWrite 和强大的 Kate。它们之间共享一个来自 KDE 框架的名为 KTextEditor 的库，它提供了强大的文本编辑选项，所以无论你选择哪一个，你都拥有比你可能习惯的、由桌面提供的“基本”文本编辑器更多的功能。在不同的文本编辑器中使用相同的组件，意味着一旦你习惯了 KDE 中的文本编辑界面，你基本上就能熟悉它们了，如 KWrite、Kate、KDevelop 等。

### 安装 KWrite 或 Kate

KWrite 和 Kate 在同一个 [开发库][4] 中维护。

然而，它们是作为独立的应用发布的，并且有不同的使用场景。

如果你安装了 KDE Plasma 桌面，你可能已经安装了 KWrite，但你可能需要单独安装 Kate。

```
$ sudo dnf install kwrite kate
```

KWrite 可以从 [apps.kde.org/kwrite][5] 获得，而 Kate 可以从 [apps.kde.org/kate/][6] 获得。

两者都可以通过 KDE “<ruby>发现<rt>Discover</rt></ruby>” 安装，KWrite 可以 [作为 flatpak 安装][7]。

### KWrite，不那么基本的编辑器

开始使用 KWrite 很容易。你从你的应用菜单中启动它，然后开始打字。如果你在最基本的文本编辑器之外没有别的需求，那么你可以把它当作一个简单的电子记事本。

![The KWrite text editor][8]

所有通常的惯例都适用。在大文本区域输入文字，完成后点击保存按钮。

然而，KWrite 与标准的桌面编辑器不同的是，它使用 KTextEditor 库。

### 书签

当你在 KWrite 或 Kate 中工作时，你可以创建临时书签来帮助你找到文档中的重要位置。要创建一个书签，按 `Ctrl+B`。你可以通过在“<ruby>书签<rt>Bookmark</rt></ruby>”菜单中选择它来移动到书签。

书签不是永久性的元数据，它们也不会作为文档的一部分被存储，但当你在工作中需要在各部分之间来回移动时，它们是有用的工具。在其他文本编辑器中，我可以只是输入一些随机的词，比如 “foobar”，然后对这个字符串进行“<ruby>查找<rt>Find</rt></ruby>”，以返回到那个位置。书签是解决这个问题的一个更优雅的方案，而且它们不会有让你的文档充满占位符的风险，因为你可能忘记删除它们。

### 高亮显示

在 KWrite 和 Kate 中，你都可以激活语法高亮，这样你就可以深入了解你正在处理的文本。在其他文字处理程序中，你可能不会有意识地使用高亮显示，但如果你曾经使用过带有自动拼写和语法检查的编辑器，你就会看到一种高亮显示。在大多数现代文字处理程序中，拼写错误被标记的红色警告线就是一种语法高亮的形式。KWrite 和 Kate 可以同时通知你写作中的错误和成功。

要查看拼写错误，请进入“<ruby>工具<rt>Tools</rt></ruby>”菜单，选择“<ruby>拼写<rt>Spelling<rt></ruby>”。从子菜单中，激活“<ruby>自动拼写检查<rt>Automatic Spell Checking</rt></ruby>”。

要获得你以特定格式写的东西的视觉反馈，例如 [Markdown][11]、HTML 或像 [Python][12] 这样的编程语言，去“<ruby>工具<rt>Tools</rt></ruby>”菜单，选择“<ruby>模式<rt>Mode</rt></ruby>”。有很多模式，分为几个类别。找到你要写的格式并选择它。文档模式加载在高亮模式中。你可以通过选择“<ruby>高亮<rt>Highlighting</rt></ruby>”而不是“<ruby>模式<rt>Mode</rt></ruby>”来覆盖一个模式的高亮方案。

![Text highlighting][13]

我最喜欢的功能之一是窗口右侧的文档概览。它基本上是整个文档的一个非常细微的缩略图，所以你只需点击一下就可以滚动到特定区域。它可能看起来太小而无用，但它比人们想象的更容易确定一个章节的标题或文档中的一个近似区域，并通过点击就能接近它。

### Kate 的与众不同之处

由于 KWrite 和 Kate 使用相同的底层组件，你可能想知道为什么你需要从 KWrite 升级到 Kate。如果你决定试用 Kate，你不会因为文本编辑而这样做。所有影响你如何输入和与你的文本互动的功能在这两个应用程序之间都是一样的。然而，Kate 为编码者增加了很多功能。

![Coding in Kate][14]

Kate 有一个侧边栏，你可以查看你的文件系统或项目目录。值得注意的是，Kate 有项目的概念，所以它可以将一个代码文件与同一目录下的头文件联系起来，比如说。它还有一个弹出式终端（只需按下 `F4`），并能将你的文档中的文本通过管道传送到终端会话中。

它还有一个会话管理器，这样你就可以为不同的活动配置一个独特的 Kate。

### 选择你的 Linux 文本编辑器

我们很容易忽视 KWrite 和 Kate。因为它们都是与桌面一起出现的，所以很容易把它们视作开发者强制包含的简单文本编辑器的例子。但这远远不准确。KWrite 和 Kate 是 KDE 系列应用中的典范。它们例证了 KDE 框架所提供的内容，并为期待强大、有意义和有用的 KDE 应用奠定了基础。

了解一下 KWrite 和 Kate，看看哪一个适合你。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/edit-text-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/17/4/pyqt-versus-wxpython
[3]: https://opensource.com/article/20/12/write-your-own-text-editor
[4]: https://invent.kde.org/utilities/kate
[5]: http://apps.kde.org/kwrite
[6]: https://apps.kde.org/kate
[7]: https://opensource.com/article/21/11/install-flatpak-linux
[8]: https://opensource.com/sites/default/files/kwrite-ui.jpg (The KWrite text editor)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://www.gutenberg.org/cache/epub/41445/pg41445.txt
[11]: https://opensource.com/article/19/9/introduction-markdown
[12]: https://opensource.com/article/17/10/python-101
[13]: https://opensource.com/sites/default/files/kwrite-ui-mode.jpg (Text highlighting)
[14]: https://opensource.com/sites/default/files/kate-ui.jpg (Coding in Kate)
