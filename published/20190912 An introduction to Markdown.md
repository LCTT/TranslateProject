[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11402-1.html)
[#]: subject: (An introduction to Markdown)
[#]: via: (https://opensource.com/article/19/9/introduction-markdown)
[#]: author: (Juan Islas https://opensource.com/users/xislas)

一份 Markdown 简介
======

> 一次编辑便可将文本转换为多种格式。下面是如何开始使用 Markdown。

![](https://img.linux.net.cn/data/attachment/album/201909/29/123226bjte253n2h44cjjj.jpg)

在很长一段时间里，我发现我在 GitLab 和 GitHub 上看到的所有文件都带有 **.md** 扩展名，这是专门为开发人员编写的文件类型。几周前，当我开始使用 Markdown 时，我的观念发生了变化。它很快成为我日常工作中最重要的工具。

Markdown 使我的生活更简易。我只需要在已经编写的代码中添加一些符号，并且在浏览器扩展或开源程序的帮助下，即可将文本转换为各种常用格式，如 ODT、电子邮件（稍后将详细介绍）、PDF 和 EPUB。

### 什么是 Markdown?

来自 [维基百科][2]的友情提示:

> Markdown 是一种轻量级标记语言，具有纯文本格式语法。

这意味着通过在文本中使用一些额外的符号，Markdown 可以帮助你创建具有特定结构和格式的文档。当你以纯文本（例如，在记事本应用程序中）做笔记时，没有任何东西表明哪个文本应该是粗体或斜体。在普通文本中，你在写链接时需要将一个链接写为 “http://example.com”，或者写为 “example.com”，又或“访问网站（example.com）”。这样没有内在的一致性。

但是如果你按照 Markdown 的方式编写，你的文本就有了内在的一致性。计算机喜欢一致性，因为这使得它们能够遵循严格的指令而不用担心异常。

相信我；一旦你学会使用 Markdown，每一项写作任务在某种程度上都会比以前更容易、更好。让我们开始吧。

### Markdown 基础

以下是使用 Markdown 的基础语法。

1、创建一个以 **.md** 扩展名结尾的文本文件（例如，`example.md`）。你可以使用任何文本编辑器（甚至像 LibreOffice 或 Microsoft word 这样的文字处理程序亦可），只要记住将其保存为*文本*文件。

![Names of Markdown files][3]

2、想写什么就写什么，就像往常一样:

```
Lorem ipsum

Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

De Finibus Bonorum et Malorum

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
```

（LCTT 译注：上述这段“Lorem ipsum”，中文又称“乱数假文”，是一篇常用于排版设计领域的拉丁文文章，主要目的为测试文章或文字在不同字型、版型下看起来的效果。）

3、确保在段落之间留有空行。如果你习惯写商务信函或传统散文，这可能会觉得不自然，因为那里段落只有一行，甚至在第一个单词前还有一个缩进。对于 Markdown，空行（一些文字处理程序使用 `¶`，称为Pilcrow 符号）保证在创建一个新段落应用另一种格式（如 HTML）。

4、指定标题和副标题。对于文档的标题，在文本前面添加一个井号或散列符号（`#`）和一个空格（例如 `# Lorem ipsum`）。第一个副标题级别使用两个（`## De Finibus Bonorum et Malorum`），下一个级别使用三个（`### 第三个副标题`），以此类推。注意，在井号和第一个单词之间有一个空格。

```
# Lorem ipsum

Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## De Finibus Bonorum et Malorum

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
```

5、如果你想使用**粗体**字符，只需将字母放在两个星号之间，没有空格：`**对应的文本将以粗体显示**`。

![Bold text in Markdown][4]

6、对于**斜体**，将文本放在没有空格的下划线符号之间：`_我希望这个本文以斜体显示_`。（LCTT 译注：有的 Markdown 流派会将用下划线引起来的字符串视作下划线文本，而单个星号 `*` 引用起来的才视作斜体。从兼容性的角度看，使用星号比较兼容。）

![Italics text in Markdown][5]

7、要插入一个链接（像 [Markdown Tutorial][6]），把你想链接的文本放在括号里，URL 放在括号里，中间没有空格：`[Markdown Tutorial](<https://www.markdowntutorial.com/>)`。

![Hyperlinks in Markdown][7]

8、块引用是用大于号编写的（`>`）在你要引用的文本前加上大于符号和空格: `> 名言引用`。

![Blockquote text in Markdown][8]

### Markdown 教程和技巧

这些技巧可以帮助你上手 Markdown ，但它涵盖了很多功能，不仅仅是粗体、斜体和链接。学习 Markdown 的最好方法是使用它，但是我建议你花 15 分钟来学习这篇简单的 [Markdown 教程][6]，学以致用，勤加练习。

由于现代 Markdown 是对结构化文本概念的许多不同解释的融合，[CommonMark][9] 项目定义了一个规范，其中包含一组严格的规则，以使 Markdown 更加清晰。在编辑时手边准备一份[符合 CommonMark 的快捷键列表][10]可能会有帮助。

### 你能用 Markdown 做什么

Markdown 可以让你写任何你想写的东西，仅需一次编辑，就可以把它转换成几乎任何你想使用的格式。下面的示例演示如何将用 MD 编写简单的文本并转换为不同的格式。你不需要多种格式的文档-你可以仅仅编辑一次…然后拥有无限可能。

1、**简单的笔记**：你可以用 Markdown 编写你的笔记，并且在保存笔记时，开源笔记应用程序 [Turtl][11] 将解释你的文本文件并显示为对应的格式。你可以把笔记存储在任何地方!

![Turtl application][12]

2、**PDF 文件**：使用 [Pandoc][13] 应用程序，你可以使用一个简单的命令将 Markdown 文件转换为 PDF：

```
pandoc <file.md> -o <file.pdf>
```

![Markdown text converted to PDF with Pandoc][14]

3、**Email**：你还可以通过安装浏览器扩展 [Markdown Here][15] 将 Markdown 文本转换为 html 格式的电子邮件。要使用它，只需选择你的 Markdown 文本，在这里使用 Markdown 将其转换为 HTML，并使用你喜欢的电子邮件客户端发送消息。

![Markdown text converted to email with Markdown Here][16]

### 现在就开始上手吧

你不需要一个特殊的应用程序来使用 Markdown，你只需要一个文本编辑器和上面的技巧。它与你已有的写作方式兼容；你所需要做的就是使用它，所以试试吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/introduction-markdown

作者：[Juan Islas][a]
选题：[lujun9972][b]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/xislas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://en.wikipedia.org/wiki/Markdown
[3]: https://opensource.com/sites/default/files/uploads/markdown_names_md-1.png (Names of Markdown files)
[4]: https://opensource.com/sites/default/files/uploads/markdown_bold.png (Bold text in Markdown)
[5]: https://opensource.com/sites/default/files/uploads/markdown_italic.png (Italics text in Markdown)
[6]: https://www.markdowntutorial.com/
[7]: https://opensource.com/sites/default/files/uploads/markdown_link.png (Hyperlinks in Markdown)
[8]: https://opensource.com/sites/default/files/uploads/markdown_blockquote.png (Blockquote text in Markdown)
[9]: https://commonmark.org/help/
[10]: https://opensource.com/downloads/cheat-sheet-markdown
[11]: https://turtlapp.com/
[12]: https://opensource.com/sites/default/files/uploads/markdown_turtl_02.png (Turtl application)
[13]: https://opensource.com/article/19/5/convert-markdown-to-word-pandoc
[14]: https://opensource.com/sites/default/files/uploads/markdown_pdf.png (Markdown text converted to PDF with Pandoc)
[15]: https://markdown-here.com/
[16]: https://opensource.com/sites/default/files/uploads/markdown_mail_02.png (Markdown text converted to email with Markdown Here)
