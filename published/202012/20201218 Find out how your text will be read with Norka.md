[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12961-1.html)
[#]: subject: (Find out how your text will be read with Norka)
[#]: via: (https://opensource.com/article/20/12/norka)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

了解如何使用 Norka 编辑器阅读文本
======

> 这是一个素颜朝天的文本编辑器，旨在让你的写作能被更好地阅读和理解。

![](https://img.linux.net.cn/data/attachment/album/202012/28/003505f3h3pppkg7enpxi9.jpg)

有些文本编辑器是为编程而设计的，有些是为专门的文本格式而设计的，有些是为文档设计而设计的。Norka 文本编辑器是为阅读而设计的。创建一个为*阅读*而设计的文本编辑器似乎很奇怪，但实际上，如果你仔细想想，这是很有意义的。你的文字已经写了一次或三次，这取决于你个人对迭代的容忍度，但它的目的是为了在未来几年内被阅读。Norka 让你轻松地专注于你的文字如何被阅读。

### 安装

Norka 文本编辑器是 MIT 授权的，可以[作为 Flatpak 包安装在 Linux上][2]。它是开源的，所以如果你想尝试在不同的平台上安装它，你可以[克隆它的 Github 仓库][3]。

### Norka 的界面

Norka 的界面很简单。一个回到 Norka 文档集的按钮，一个导出按钮和一个偏好菜单。窗口的其余部分是供你写文字的空白空间，在右下角，有一个阅读时间计算器来帮助你了解读者可能需要多长时间才能看完你写的东西。

![Dark Norka terminal box with green and white text][4]

这几乎就是 Norka 的全部内容。没有分页符或行号，没有代码折叠或正则搜索。这是一个用于文字书写的编辑器，而不设置文档样式或跟踪复杂的数据模式。

当然，它还有一些额外的功能。如预期那样，可以使用 `Ctrl+C` 和 `Ctrl+V` 复制和粘贴。你可以用 `Ctrl+Z` 撤销，用 `Ctrl+F` 查找。你甚至可以用 `Ctrl+:` 插入表情符号。

![Norka terminal box with pop up box of emoji search menu][5]

#### 样式文本

虽然 Norka 绝对没有兴趣帮你设计，比如说，一本小册子或传单，但它确实有一些能力来指示你想要的文本样式。它通过 [Markdown][6] 来实现这一点，这是一个简单的纯文本书写的约定，但用特殊的符号来指示文本应该如何在 HTML、EPUB 或 PDF 或任何你的目标格式中呈现。

在大多数编辑器中，你必须知道 Markdown 才能使用 Markdown，但 Norka 翻译了常见的文字处理器键盘快捷键来为你生成 Markdown。例如，要使一个单词加粗，你可以按 `Ctrl+B`，它会在光标的两边插入四个星号。当你输入下一个单词时，它的两边都会有两个星号，这就是 Markdown 对粗体（默认为粗体）文本的标记。你可以在 Norka 窗口右上角的汉堡样式的菜单中查看所有的 Markdown 快捷方式。

#### 保存和导出

你可以把 Norka 想象成一个笔记本。你在 Norka 中打开的所有文档都会保留在 Norka 的内部数据库中，所有的文档都会默认自动保存。要在 Norka 外使用文件，你可以在打开的文件中点击右上角的**共享**按钮。另外，你也可以在 Norka 的文件视图中右击任何文件，选择**导出**。你可以将文档导出（或**共享**，Norka 可互换使用这两个术语）为**文本**、**HTML** 或 **Markdown**。

### 尝试 Norka

Norka 便于尝试，也易于使用。它通过保持界面简单，几乎到了受限的程度，帮助你专注于写作。但限制有时也是一种强大的创意工具。

Norka 可能不是你进行大量修改或文本处理的最佳选择。它没有让人激动的功能，比如大小写转换、集成 `sed` 命令、字符交换等等。它是一个为读者服务的文本编辑器。如果你觉得有用，那么你可能正是 Norka 正在寻找的受众。

感谢你花 2 分 39 秒阅读本文！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/norka

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/reading_book_selfcare_wfh_learning_education_520.png?itok=H6satV2u (Reading a book, selfcare)
[2]: https://flathub.org/apps/details/com.github.tenderowl.norka
[3]: https://github.com/TenderOwl/Norka
[4]: https://opensource.com/sites/default/files/uploads/norka-31_days-norka-opensource.png (Dark Norka terminal box with green and white text)
[5]: https://opensource.com/sites/default/files/uploads/norka_emoji-31_days-norka-opensource.png (Norka terminal box with pop up box of emoji search menu)
[6]: https://opensource.com/article/19/9/introduction-markdown
