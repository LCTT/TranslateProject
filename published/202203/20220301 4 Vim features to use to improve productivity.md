[#]: subject: "4 Vim features to use to improve productivity"
[#]: via: "https://opensource.com/article/22/3/vim-features-productivity"
[#]: author: "Hunter Coleman https://opensource.com/users/hunterc"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14325-1.html"

4 个用于提高生产力的 Vim 功能
======

> Vim 有很多技巧，即使是用过它很多年的人仍然可以学习新东西。

![](https://img.linux.net.cn/data/attachment/album/202203/04/102118tgy1i7albn6ndiri.jpg)

Vim 总在那里。Vim 是当今最流行的文本编辑器之一。这在很大程度上是因为它随处可见。当你通过 SSH 连接到另一个系统时，你可能找不到 [Emacs][2]、[Nano][3] 或 [VSCodium][4]，但你可以放心，Vim 就在那里。

在本文中，我介绍了一些你可以用 Vim 做的中级事情，以加快你的工作流程并通常让你的一天更轻松。本文假设你以前使用过 Vim，已经了解编辑器的基础知识，并希望将你的 Vim 技能提高一个档次。Vim 充满了有用的技巧，没有人真正掌握它，但本文中的五个技巧可以提高你的技能，并希望让你更加爱上最受欢迎和喜爱的文本编辑器之一。

### Vim 书签

Vim 提供了一种在文本中添加书签的简单方法。假设你正在编辑一个大文件，并且当前的编辑会话要求你在文件中不同位置的两段文本之间来回跳转。

首先，你输入 `m`（用于标记）为当前位置设置一个书签，然后为其命名。例如，如果我正在编辑的文件中有一个名称列表，我想稍后再跳回，我可以使用 `mn`（n 表示名称）为文件的该部分添加书签。

稍后，在编辑文件的另一部分并希望跳回该名称列表时，我有两个选项。我可以输入 \``n`（反引号 n）转到书签的位置，或者我可以键入 `'n`（单引号 n）转到书签所在行的开头。

当我不再需要书签时，我可以使用 `:delmarks n` 将其删除。`:marks` 会显示我所有的书签。

请注意，我使用小写字母来命名我的书签。这是故意的。你可以使用小写字母作为本地书签，使用大写字母来使书签在多个文件中具有全局性。

### Vim 用户定义的缩写

如果你正在处理的文本有一个长词或短语多次出现，那么每次都完整地输入它会很快变得烦人。幸运的是，Vim 提供了一种创建缩写的简单方法。

要将 `Acme Painted Fake Roadways, Inc.` 的用户定义缩写设置为 `apfr`， 你需要输入 `:ab apfr Acme Painted Fake Roadways, Inc.`。现在当在编辑模式时，当你在输入 `apfr` 后面更上空格，就会变成 `Acme Painted Fake Roadways, Inc.`。

当你关闭 Vim 会话时，你使用 `:ab` 设置的任何缩写都会丢失。如果你想在此之前取消设置缩写，你可输入 `:una apfr`。

### Vim 自动补全

许多人没有意识到 Vim 带有自动补全功能。如果你在文件中输入以前使用过的长词，这是一个方便的工具。

假设你正在撰写一篇文章，多次使用 `Antarctica` 一词。使用一次后，下次你可以只输入前几个字母。例如，你输入 `Ant` 然后按下 `Ctrl+P`。 Vim 要么补全单词（如果只有一个选项），要么为你提供可以用箭头键选择的单词列表，继续输入以进一步缩小搜索范围并使用 `Tab` 键选择单词。

### Vim 范围选择

使用 Vim，你可以轻松地对文件中的一系列行执行操作。你可以通过起始行号、逗号和结束行号（包括）来指示范围。除了文字行号之外，你还可以使用句点（`.`）表示当前行，使用美元符号 （`$`） 表示文件缓冲区中的最后一行，以及使用百分号（`%`）表示整个文件。

这里举几个例子来说明。

如果要删除第 2 到 10 行，请输入（在命令模式下）：

```
:2,10d
```

要删除从第 25 行到文件末尾的每一行：

```
:25,$d
```

你可以使用以下命令删除每一行：

```
:%d
```

要将第 5 到 10 行复制（或转移）到第 15 行之后：

```
:5,10t 15
```

要将第 5 行到第 10 行移动到第 15 行之后（而不是复制）：

```
:5,10m 15
```

### Vim 提高生产力

我希望这篇文章教会了你一些关于 Vim 文本编辑器的新知识。 Vim 有很多技巧，即使是使用了多年的人仍然可以学习新事物。总有一些新的和有用的东西可以学习。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/vim-features-productivity

作者：[Hunter Coleman][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hunterc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/3/getting-started-emacs
[3]: https://opensource.com/article/20/12/gnu-nano
[4]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
