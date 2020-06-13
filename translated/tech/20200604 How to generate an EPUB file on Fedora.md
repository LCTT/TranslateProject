[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to generate an EPUB file on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-generate-an-epub-file-on-fedora/)
[#]: author: (John Paul Wohlscheid https://fedoramagazine.org/author/johnblood/)

如何在 Fedora 上生成一个 EPUB 文件
======

![][1]

在智能手机上阅读内容中正在变得越来越流行。每一部手机都有它自己的电子书阅读器。不管相信与否，在 Fedora 创建你自己的电子书文件是非常容易的。

这篇展示使用两种不同的方法来创建一个 [EPUB][2] 文件。Epub 格式是最流行的格式之一，并且被很多开源软件所支持。

绝大数的人们将会询问 “在很容易创建 PDF 文件的情况下，为什么要花费时间和精力来创建 EPUB 文件?” 答案是: “你曾经尝试看过每次只能看到一张纸的一小部分的吗?”为阅读一个 PDF 文件，你不得不保持缩放和移动文档，或者将其缩放到一个小尺寸来适合屏幕。在另一方面，EPUB 文件被设计成适合很多不同的屏幕类型。

### 方法 1: ghostwriter 和 pandoc

第一种方法创建一个速成版的电子书文件。它使用一个名为 [ghostwriter][3] 的 Markdown 编辑器，和一个名为 [pandoc][4]的命令行文档转换工具。

你可以从软件中心搜查和安装它们，也可以从从终端中安装它们。如果你将使用终端来安装它们，运行这个命令: _sudo dnf install pandoc ghostwriter_ 。

对于那些不知道 [Markdown][5] 是什么的人们来说，在这里有一个速成版解释。它是一个大约在15年前创建的简单的标记语言它使用简单的语法来格式化纯文本。Markdown 文件可以随后转换成很多其它文档格式的文件。

![ghostwriter][6]

现在，对于工具来说。ghostwriter 是一个跨平台的易于使用的 Markdown 编辑器。pandoc 是一个非常易于使用的文档转换工具，可以处理数百种不同的格式。

为了创建你的电子书，打开 ghostwriter ，并开始编写你的文档。如果你以前使用过 Markdown ，您可能习惯于在文档标题1的前面放置一个 # 符号来制作标题。像这样: _# My Man Jeeves_。然而，pandoc 将不会识别其为标题，并将在你的电子书的顶部放置一个一个大的 UNTITLED 。相反地在你的标题前放置一个 _%_ 来制作标题。例如， _% My Man Jeeves_ 。章节应该被格式为标题2，例如， _## Leave It to Jeeves_。如果你有子章节，使用标题3 (_###_) 。

![][7]

在你的文档完成后，单击 _文件_ -> _导出_ (或按 _Ctrl_ + _E_ 键)。在对话框中，在 Markdown 转换器中的几个选项中进行选择。如果这是你第一次使用 ghostwriter ，将默认选择 Sundown 转换器。从对话框中，选择 pandoc 。接下来单击 _导出_ 。现在你的 EPUB 文件已经创建好了。

![ghostwriter 导出对话框][8]

注意: 如果你获取一个说明 pandoc 有问题的错误，关闭 _智能排版_ ，并再试一次。

### 方法 2: calibre

如果你想要一个更完美的电子书，这就是你正在苦苦追寻的方法。它采用更多的步骤，但是它是值得的。

![][9]

首先，安装一个名为 [calibre][10] 的应用程序。calibre 不仅仅是一个电子书阅读器，它也是一个电子书管理器系统。你可以从软件中心安装它，也可以从终端安装它，通过 _sudo dnf install calibre_ ：

在这个方法中，你可以在 LibreOffice ，ghostwriter，或者其它你选择的编辑器中编写你的文档。确保书籍的标题被格式为标题1，章节被格式为标题2，子章节被格式为标题3。

接下来，导出你的文档为一个 HTML 文件。

现在添加该文件到 calibre 。打开 calibre ，并单击 “_添加书籍_“。它将花费 calibre 几秒钟来添加文件。

![][11]

在文件导入后，通过单击“_编辑元数据_” 按钮来编辑文件的元数据。在这里你可以填写书的标题和作者的姓名。你也可以上传一个封面图片(如果你有的话)，或者 calibre 将为你生成一个封面。

![][12]

接下来，单击“_转换书籍_”按钮。在新的对话框中，选择“_界面外观_” 部分和“_布局_” 标签页。勾选 “_删除段间空行_” 选项。这将更加严格地缩进每一段的内容。

![][13]

现在，设置目录。选择 “_内容目录_” 部分。这里有三个需要注意的选项: Level 1 TOC, Level 2 TOC,和 Level 3 TOC。对于每一个选项来说，在其尾处的魔法棒按钮上单击来选择。在新的对话框中，选择应用于目录表项的 HTML 标记。例如，为 Level 1 TOC 选择 _h1_ 。

![][14]

接下来，告诉 calibre 包含内容目录。选择“_EPUB 输出_” 部分并勾选 “_插入内联目录_“。为了创建 epub 文件，单击“_确定_“。

![][15]

现在，你有一个看起来很专业的电子书文件。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-generate-an-epub-file-on-fedora/

作者：[John Paul Wohlscheid][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

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
