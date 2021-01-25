[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12997-1.html)
[#]: subject: (Use the Markdown Editor app in Nextcloud)
[#]: via: (https://opensource.com/article/20/12/nextcloud-markdown)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Nextcloud 中的 Markdown 编辑器应用
======

> Nextcloud 拥有流行的 Markdown 文件的最流畅的编辑器之一，它有很多方便和直观的功能。

![](https://img.linux.net.cn/data/attachment/album/202101/09/164849mofte5zy5ryuewax.jpg)

纯文本的好处是，没有额外的针对计算机的信息会杂乱无章地出现在原本供人类阅读的文字中。计算机的好处是它们是可编程的，因此只要我们人类同意在写作时遵循非常特定的惯例，我们就可以对计算机进行编程，将人类可读的文本解释为秘密指令。例如，我们在一个词的周围打上两个星号，不仅可以给人类一个视觉上的提示，说明这个词很重要，我们还可给计算机编程让它用**粗体**显示这个词。

这正是 [Markdown][2] 背后的理论和实践，这种流行的纯文本格式向作者们承诺，只要_他们_使用特定的纯文本约定，那么他们的文本就会以特定的风格呈现。

传统中，这意味着作者用纯文本写作，直到文本被传给转换器应用（最初是 `markdown.pl`），才会看到漂亮的样式，但 Nextcloud 的 Markdown 编辑器应用改变了这一点。

通过 Nextcloud 的 Markdown 编辑器，你可以一边输入纯文本，一边看到它渲染后的样式。这对于那些要努力记住 Markdown 有时令人困惑的符号的作者们无异于是救星（方括号是在小括号中的超链接之前还是之后？）。而且更好的是，它运行在 Nextcloud 中，所以你可以在任何地方使用它。

### 安装

要使用 Nextcloud 的 Markdown 编辑器，你必须安装 Nextcloud。好消息是，Nextcloud 非常_容易_安装。我已经在树莓派、共享服务器、甚至作为一个本地应用安装了它（这是愚蠢的，不要这样做）。如果你不相信自己的能力，你甚至可以依靠 [Turnkey Linux][3] 来帮你完成这些难关，否则就直接从 [Nextcloud.com][4] 购买托管服务。在你安装 Nextcloud 后，添加应用就很简单了。点击 Nextcloud 界面右上角的用户图标，选择 **Apps**。找到 **Office and Text** 类别，点击安装并启用 **Markdown Editor**。

![Nextcloud app store showing Markdown Editor installer][5]

### 启动

激活后，Markdown 编辑器会与 Nextcloud 文件中任何以 .md 结尾的文件相关联，当你打开一个 Markdown 文件时，你就会启动 Markdown 编辑器。

### 使用 Markdown 编辑器

Markdown 编辑器包含了一个大的文本区域供你输入，以及一个沿着顶部的工具栏。

![Example markdown file][6]

工具栏包含了文字处理器的基本功能：用粗体、斜体和删除线设计文本样式、创建标题和段落、列表等等。

如果你了解 Markdown，这些功能中的许多可以在你输入时自动调用。如果你不熟悉 Markdown，那么工具栏或常用的键盘快捷键（`Ctrl+B` 表示粗体，`Ctrl+I` 表示斜体等等）可以帮助你设计文本的样式。

Markdown 编辑器的工作方式的最好的一点是，它真正做到了使人人满意：如果你想以 Markdown 格式输入，那么它就会接受它并立即将其转化为视觉样式；如果你不想操心 Markdown 语法，那么当你使用键盘快捷键或工具栏按钮时，它就会为你生成样式。无论哪种方式，你永远不会看到 Markdown 语法格式，但你也永远不会失去它。这是一个完美的折中方案。

它也是一个非常聪明的编辑器。当你选择一个单词时，它会为你创建一个超链接，它能快速流畅地自动转换 Markdown，而且它知道一些不同“风格”的 Markdown 语法（主要是 Commonmark，但也有传统的 Markdown、Github Markdown，等等）。

![black text on white background, word highlighted in blue to create an automatic link][7]

### 尝试 Nextcloud

我用过几个 Markdown 预览应用，Nextcloud 的 Markdown 编辑器是最流畅的一个。它尊重用户，并为显示 Markdown 做了最基本的工作，所以它的转换速度很快，也很准确。因为它是 Nextcloud 中的一个应用，你还可以获得这样的好处：你的作品可以即时保存在自己的私有的开源云上，并进行版本控制。没有比这更好的文本编辑器了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/nextcloud-markdown

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://opensource.com/article/19/9/introduction-markdown
[3]: https://www.turnkeylinux.org/nextcloud
[4]: http://nextcloud.com
[5]: https://opensource.com/sites/default/files/uploads/nextcloud-app-install-31_days-markdown-opensource.jpg (Nextcloud app store showing Markdown Editor installer)
[6]: https://opensource.com/sites/default/files/uploads/nextcloud-markdown-31-days-opensource.jpg (Example markdown file )
[7]: https://opensource.com/sites/default/files/uploads/nextcloud-link-31_days_markdown-opensource.jpg (black text on white background, word highlighted in blue to create an automatic link)
