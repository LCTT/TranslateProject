[#]: subject: "Why Mark Text is my favorite markdown editor"
[#]: via: "https://opensource.com/article/21/10/mark-text-markdown-editor"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13926-1.html"

Mark Text：我最喜欢的 Markdown 编辑器
======

> Mark Text 拥有的工具使得撰写 Markdown 变得容易，同时又提供了一个不会打扰我的简单的界面。

![](https://img.linux.net.cn/data/attachment/album/202110/27/141244m9os557ss7au6oas.jpg)

几年前，当我开始使用 Jupyter 笔记本时，我接触到了 Markdown 格式。许多作者都知道 Markdown，但这是我不熟悉的一种技能。

Markdown 是一种标准的文本写作方式，在这种方式中，你可以用精简的符号来标记你想要的文本样式。例如，你不用点击一个按钮来使一个词变粗体，而是用两个星号（`**word**`）包围这个词。这有两种效果：

  * 当作为纯文本查看时，视觉上显示出强调的文本
  * 如果有一个好的文本转换器或渲染器（如 Pandoc 或一个好的 Markdown 文本编辑器），就会显示为加粗。

Markdown 最大的优点之一是它的大部分符号都是直观的，并且来自我们大多数人已有的习惯。它使得用星号强调单词，用字符标记标题以区分它们等等变得很自然。

每个人都对它评价很高，但我不确定为什么我需要学习和使用 Markdown。然而，我是一个好奇的人，我开始探索 Markdown，以及它如何在我的写作中发挥作用。

### 学习 Markdown

我很喜欢在学习时使用 [Markdown 速查表][2]。我发现 Markdown 是一个很好的工具，可以写任何内容，而且我很喜欢甚至不需要一个专门的 Markdown 编辑器这一点。任何文本编辑器都可以写 Markdown，因为 Markdown 使用标准文本来表示样式。我开始使用简单的编辑器，如 Vim 或 gedit（或任何其他编辑器），并查阅这个速查表以记住简单的格式化规则。

今年我一直在写日记，作为组织我的想法和学习更多关于 Markdown 的方法。我最近尝试了 [Ghostwriter][3] 文本编辑器，这是一个优秀的编辑器，有一些额外的 Markdown 特定功能。Markdown 现在已经变得非常流行了，许多编辑器都加入了语法高亮、提示和其他使 Markdown 编写变得容易的功能，或者将其作为重点。它们不是必须的功能，但当你拥有它们时，还是很好的。 

### 尝试 Mark Text

在阅读一个博客时，我发现了 [Mark Text][4]。Mark Text 使写 Markdown 变得很容易，同时提供了一个简单的界面，而且又不影响我。Mark Text 有六个主题，三个浅色和三个深色主题。深色主题对我来说更容易使用。它的 [用户文档][5] 非常好，而且也提供了 Markdown 的 [语法帮助][6]。 

###  Markdown 的实时预览

Mark Text 以简洁的界面提供了实时预览功能。它支持 [Commonmark][7] 规范、Github 风格的 Markdown 规范，以及 Pandoc Markdown。据其网站说，Mark Text 还支持 KaTex、front matter 和 emoji 等 Markdown 扩展。它还可以输出 HTML 和 PDF 文件。 

Mark Text 有各种编辑模式，如打字模式、源代码模式和专注模式。添加图片是一件很容易的事，因为你可以简单地从剪贴板上复制和粘贴它们。

在 Mark Text 窗口的左上方有一个弹出窗口，显示迄今为止输入的字符和段落数量。作为一个作家，这真的很有帮助。

从 Mark Text 窗口左上方的菜单或使用 `Ctrl+S` 保存文件很容易。事实上，Mark Text 的菜单对任何习惯于基本文本编辑器或文字处理器的人来说都是友好和熟悉的。

![Mark Text 文件菜单][8] 

我喜欢 Mark Text 用简单的快捷键支持各种格式，包括表格块、图表、行内格式、数学公式块和其他代码块。

你可以从以下链接中为你的操作系统下载 Mark Text：

  * [Linux][10]
  * [macOS][11]
  * [Windows][12]

Mark Text 以 [MIT][13] 许可证开源。你可以随时 [下载][14] 最新的版本。

另外，你可以用 `brew install --cask mark-text` 在 macOS 上安装 Mark Text，在 Windows 上用 [Chocolatey][15] 输入 `choco install marktext` 来安装它。

Mark Text 一直在寻找赞助商和开发者。该项目有一个给贡献者的 [指南][16]。此外，你可以在 Patreon 和 Open Collective 上支持该项目。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/mark-text-markdown-editor

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriterkeys-3.png?itok=NyBwMdK_ (Typewriter keys in multicolor)
[2]: https://opensource.com/downloads/cheat-sheet-markdown
[3]: https://wereturtle.github.io/ghostwriter/
[4]: https://marktext.app/
[5]: https://github.com/marktext/marktext/blob/master/docs/README.md
[6]: https://github.com/marktext/marktext/blob/master/docs/MARKDOWN_SYNTAX.md
[7]: https://commonmark.org/
[8]: https://opensource.com/sites/default/files/uploads/mark-test-file-menu.png (Mark Text file menu)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://github.com/marktext/marktext/releases/latest/download/marktext-x86_64.AppImage
[11]: https://github.com/marktext/marktext/releases/latest/download/marktext.dmg
[12]: https://github.com/marktext/marktext/releases/latest/download/marktext-setup.exe
[13]: https://github.com/marktext/marktext/blob/develop/LICENSE
[14]: https://github.com/marktext/marktext/releases
[15]: https://chocolatey.org/
[16]: https://github.com/marktext/marktext/blob/develop/CONTRIBUTING.md
