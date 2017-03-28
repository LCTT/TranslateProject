LaTeXila 简介：Linux 上的一个多语言 LaTeX 编辑器 
============================================================

LaTeXila 是一个多语言 LaTeX 编辑器，专为那些偏爱 GTK+ 外观的 Linux 用户设计。这个软件简单，但又足够强大，可定制性良好，所以如果你对 LaTeX 感兴趣，那么你就应该尝试一下这个工具。在下面的快速指南中，我将展示如何使用 LaTeXila 并介绍其主要功能。但在开始之前你可能要问：

### 为何选择使用 LaTeX?

假如我想创建一个文本文档，为什么我不使用 LibreOffice 或者 Abiword 这些常规的工具呢？原因是相比于常规的文本编辑器，LaTeX 编辑器一般来说都会提供更多功能强大的格式化工具，让你在写作期间专注于文档的内容。LaTeX 是一个文档准备系统，目的是简化大多数常见出版物的处理过程，例如书籍或者科学报告，它们通常都包含很多数学公式，多语言排版元素，交叉引用及引文，参考文献等等需要处理的元素。尽管上面的那些元素也可以用 LibreOffice 来处理，使用 LaTeXila 要相对简单一些，同时处理得当的话你最后得到的会是一份高质量的文档。

### 在一个新文档上开始工作并设定文章结构

首先，我们需要在 LaTeXila 中创建一个新文件，这个可以通过点击位于左上角的 “新建文件” 图标来实现，接着它将打开一个对话框，让我们选择一个模板从而快速地开始写作。

[
 ![打开 LaTex 编辑器](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_1.png) 
][6]

在这里假设我将写一本书，所以我选择一个书籍模板，像下面的截图那样在相应的括号中添上标题和作者：

[
 ![打开书籍模板](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_2.png) 
][7]

现在就让我来解释一些关于文章结构的事情。我知道这看起来就像编代码，如果你是一位作家而非程序员，那么像下面那样工作或许很是奇怪，但请先容我讲完，我将对此进行解释。

在第一行和第九行之间，我们已经写好了书写整个文档所需的所有基本要素。例如在第一行中，我们可以通过修改 `[a4paper,11pt]` 来定义纸张和字体的大小，在这个方括号中，我们可以添加更多的选项，选项之间以英文逗号来分隔。

在第二行和第四行之间，我们可以看到一些条目，它们都以 `\userpackage` 打头，紧接着的是用方括号包裹的选项和用括号包裹的命令。这些命令都是一些增强宏包，LaTeXila 默认已经安装它们到我们的系统上了，并且在大多数模板中都将使用它们。需要特别注意的是字体编码，字符编码和字体的类型。

紧接着让我们看看 `\maketitle` 这一行，这里我们可以添加一个单独的标题页，且默认情况下标题的内容将被放置在第一页的顶部。类似的，包含 `\tableofcontents` 的那行将会自动生成书籍的目录。

最后，我们可以自己命名章节的名称，这可以通过在 `\chapter` 后的括号中添加章节名称来实现。第一个章节将会被自动地标记为第一章。你可以在接下来的行中添加内容，一直到下一个以 `\chapter` 开头的新行为止，这些都将是这个章节的内容。新的章节将会被自动地标记为第二章，以此类推。

[
 ![LaTex 的格式](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_3.png) 
][8]

章节之间还可以用命令 `\section` 来划分为更小的块，甚至还可以使用 `\subsection` 来划分为更小的部分。各个小节和章都将被 `\tableofcontents` 自动检测到，并将使用它们的标题和页码来填充目录的内容。看看下面的截图就可以看到章和小节是如何在你的书中被排版的。

[
 ![LaTex 预览](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_4.png) 
][9]

假如你想浏览结构，你可以将左边的工具栏更换到<ruby>“结构”<rt>Structure</rt></ruby>选项，并确保所有的结构与预期相符。在这里，你还可以控制各小节中的任意数据表格和图片。

[
 ![LaTex 结构](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_5.png) 
][10]

讲到这里，有人或许想将表格和图片的位置也包含在目录中。要达到此目的，你需要将下面的两行添加到 `\tableofcontents` 之后：

```
\listoffigures
\listoftables
```

最后标志着书籍结束的信号是 `\end{document}`。你的布局应该总是以此为结尾。

### LaTeXila 简单易用，公式齐全

LaTeX 是一个基于命令的文档生成系统，它与使用的编辑器没有多少关联。这里需要强调的是　LaTeXila 提供了一系列强大的工具，使得在你书写报告或书籍时能够节省一些时间和精力。例如对于 LaTex 命令，它提供了自动补全功能，这个功能将在你每次开始输入命令时被激活。

[
 ![LaTeX 中的数学公式](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_6.png) 
][11]

LaTeXila 还集成有基于 gspell 的拼写检测系统，你可以在最上面的“工具”菜单中设定合适的语言。最上面的工具栏里几乎包含了你要用到的所有按钮。从左到右，你可以完成添加章节，交叉引用，调整字符的大小，格式化被选取的部分，添加无序列表和数学函数等等。这些都可以手动地输入，但通过点击相应按钮来完成或许更加方便。

对于生成数学公式，结合侧边栏上的工具栏选项，你只需轻轻一点就可以添加相应的数学符号。点击位于左边的侧边栏中<ruby>“符号”<rt>Symbols</rt></ruby>框，你就可以看到相关的符号分类，例如“关系运算符”，“希腊字母”，“运算符”等等。下面的截图就是一些符号的示例：

[
 ![希腊字母和算子符号](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_7.png) 
][12]

这些符号的图形化列表使得公式和数学表达式的生成犹如在公园中散步那样舒适。

### 将 .tex 文件转换为 .rtf 文件

默认情况下，LaTeXila 会将你的文档保存为标准的 `.tex` 文档，而我们可以使用 `.tex` 文档来生成一个<ruby>“富文本”<rt>rich text format</rt></ruby>文档，这些富文本文档可以使用像 LibreOffice 那样的文本编辑器打开。要达到此目的，我们需要安装一个名为 `latex2rtf` 的工具，它在所有的 Linux 发行版本中都可以被获取到。在文本所在的目录打开虚拟终端， 并输入 `latex2rtf 文件名称`，如下所示 ：

[
 ![由 LaTeX 文档生成 RTF 文档](https://www.howtoforge.com/images/introduction-to-latexila/big/pic_8.png) 
][13]

当然 LaTeXila 也提供了它自己的构建工具，这些工具可以在上面的工具栏或者最上面的面板（构建）中看到。但我向你推荐 latex2rtf 是以防它们在其他的操作系统上出现某些意想不到的问题，比如在我的系统上就不能正常工作。

### 结论

假如上面的介绍激发了你探索 LaTeX 的兴趣，那就再好不过了。我写这篇文章的目的是向新手介绍一款简单易用且适合他们写作的工具。要是 LaTeXila 还带有实时预览的双屏模式的话，它就更加完美了...

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/

作者：[Bill Toulas][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/
[1]:https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/#why-latex
[2]:https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/#starting-work-on-a-new-document-and-setting-up-the-structure
[3]:https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/#latexila-ease-of-use-and-mathematics
[4]:https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/#from-tex-to-rtf
[5]:https://www.howtoforge.com/tutorial/introduction-to-latexila-latex-editor/#conclusion
[6]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_1.png
[7]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_2.png
[8]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_3.png
[9]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_4.png
[10]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_5.png
[11]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_6.png
[12]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_7.png
[13]:https://www.howtoforge.com/images/introduction-to-latexila/big/pic_8.png
