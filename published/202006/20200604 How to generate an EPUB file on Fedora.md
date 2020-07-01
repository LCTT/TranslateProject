[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12313-1.html)
[#]: subject: (How to generate an EPUB file on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-generate-an-epub-file-on-fedora/)
[#]: author: (John Paul Wohlscheid https://fedoramagazine.org/author/johnblood/)

如何在 Fedora 上生成 EPUB 电子书
======

![][1]

在智能手机上阅读内容正在变得越来越流行。每一部手机都有它自己的电子书阅读器。可能你不知道，在 Fedora 创建你自己的电子书文件是非常容易的。

这篇文章展示了使用两种不同的方法来创建一个 [EPUB][2] 文件。EPUB 格式是最流行的格式之一，并且被很多开源软件所支持。

绝大数的人们将会询问 “在很容易创建 PDF 文件的情况下，为什么要花费时间和精力来创建 EPUB 文件?” 答案是: “你曾经尝试看过每次只能看到一张纸的一小部分的吗?”为阅读一个 PDF 文件，你不得不经常缩放和移动文档，或者将其缩放到一个小尺寸来适合屏幕大小。在另一方面，EPUB 文件则被设计成可以适合很多不同的屏幕类型。

### 方法 1: ghostwriter 和 pandoc

第一种方法创建一个速成版的电子书文件。它使用一个名为 [ghostwriter][3] 的 Markdown 编辑器，和一个名为 [pandoc][4] 的命令行文档转换工具。

你可以从软件中心搜查和安装它们，也可以从终端中安装它们。如果你使用终端来安装它们，运行这个命令: 

```
sudo dnf install pandoc ghostwriter
```

对于那些不知道 [Markdown][5] 是什么的人们来说，在这里有一个简要的解释：它是一个大约在 15 年前创建的简单的标记语言。它使用简单的语法来格式化纯文本。Markdown 文件可以随后转换成很多其它文档格式的文件。

![ghostwriter][6]

对于工具，ghostwriter 是一个跨平台的易于使用的 Markdown 编辑器。pandoc 是一个非常易于使用的文档转换工具，可以处理数百种不同的格式。

要创建你的电子书，打开 ghostwriter，开始编写你的文档。如果你以前使用过 Markdown，你可能习惯于在文档的“标题 1”的前面放置一个 `#` 符号来作为标题。像这样: `# My Man Jeeves`。然而，pandoc 将不会识别其为标题，并将在你的电子书的顶部放置一个一个大的 “UNTITLED” 。相反地在你的标题前放置一个 `%` 来作为标题。例如，`% My Man Jeeves` 。章节应该被格式为“标题 2”，例如，`## Leave It to Jeeves`。如果你有子章节，使用“标题 3”（`###`）。

![][7]

在你的文档完成后，单击“文件 -> 导出”（或按 `Ctrl+E` 键）。在对话框中，在几个 Markdown 转换器中进行选择。如果这是你第一次使用 ghostwriter ，默认选择的是 Sundown 转换器。从对话框中，选择 pandoc 。接下来单击“导出”。现在你的 EPUB 文件已经创建好了。

![ghostwriter 导出对话框][8]

注意: 如果你得到一个与 pandoc 有关的错误，关闭“智能排版”，并再试一次。

### 方法 2: calibre

如果你想要一个更完美的电子书，那这就是你正在寻找的方法。它需要更多的步骤，但是是值得的。

![][9]

首先，安装一个名为 [calibre][10] 的应用程序。calibre 不仅仅是一个电子书阅读器，它也是一个电子书管理器系统。你可以从软件中心安装它，也可以从终端安装它：

```
sudo dnf install calibre
```

在这个方法中，你可以在 LibreOffice、ghostwriter，或者其它你选择的编辑器中编写你的文档。确保书籍的标题被格式为“标题 1”，章节被格式为“标题 2”，子章节被格式为“标题 3”。

接下来，导出你的文档为一个 HTML 文件。

现在添加该文件到 calibre 。打开 calibre ，并单击 “添加书籍”。calibre 会用几秒钟来添加文件。

![][11]

在文件导入后，通过单击 “编辑元数据” 按钮来编辑文件的元数据。在这里你可以填写书的标题和作者的姓名。你也可以上传一个封面图片（如果你有的话），或者 calibre 将为你生成一个封面。

![][12]

接下来，单击 “转换书籍” 按钮。在新的对话框中，选择 “界面与外观” 部分的 “布局” 标签页。勾选 “删除段间空行” 选项。这将更加严格地缩进每一段的内容。

![][13]

现在，设置目录。选择 “内容目录” 部分。这里有三个需要注意的选项: “一级目录”、“二级目录” 和 “三级目录”。对于每一个选项点击其末尾处的魔法棒按钮。在新的对话框中，选择应用于目录表项的 HTML 标记。例如，为“一级目录”选择 “h1”。

![][14]

接下来，告诉 calibre 包含内容目录。选择 “输出 EPUB” 部分并勾选 “插入内联目录”。单击“确定“ 创建 epub 文件。

![][15]

现在，你有了一个看起来很专业的电子书文件。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-generate-an-epub-file-on-fedora/

作者：[John Paul Wohlscheid][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/johnblood/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/epub-how_to-816x345.png
[2]: https://en.wikipedia.org/wiki/EPUB
[3]: https://github.com/wereturtle/ghostwriter
[4]: https://pandoc.org/
[5]: https://fedoramagazine.org/applications-for-writing-markdown/
[6]: https://fedoramagazine.org/wp-content/uploads/2020/05/ghostwriter-1024x640.jpg
[7]: https://fedoramagazine.org/wp-content/uploads/2020/05/ghostwriter-menu-1024x640.jpg
[8]: https://fedoramagazine.org/wp-content/uploads/2020/05/ghostwriter-export-1024x640.jpg
[9]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-pre-1024x640.jpg
[10]: https://calibre-ebook.com/
[11]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-metadata-1024x640.jpg
[12]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-lookandfeel-1024x640.jpg
[13]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-toc2-1024x640.jpg
[14]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-epub-output-1024x640.jpg
[15]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-post-1024x640.jpg
