如何以 LaTex 创建文档
============================================================

> 学习以 LaTex 文本标记语言排版文档

![A introduction to creating documents in LaTeX](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/idea_innovation_kid_education.png?itok=jpetC9wJ "A introduction to creating documents in LaTeX")  

LaTeX（读作 `lay-tech` ）是使用纯文本创建文档的方法，使用与 HTML/CSS 或 Markdown 类似的标记标签进行风格化。 LaTeX 最常用于为学术界（如学术期刊）创建文档。 在 LaTeX 中，作者不必直接对文档进行风格化，就像在 Microsoft Word，LibreOffice Writer 或 Apple Pages 等文字处理程序中一样； 而是用纯文本编写代码，这些代码必须经过编译才能生成 PDF 文档。


![computer screen with LaTeX markup language](https://opensource.com/sites/default/files/u128651/intro.png "computer screen with LaTeX markup language")

### 起步

要想使用 LaTex 来书写文档，首先你必须要安装一个 LaTex 编辑器。我用的是一款自由开源软件（FOSS），其在学术界也是大受欢迎，叫做 [TexStudio][8]，它可以运行在 Windows、Unix/Linux、BSD 和 Mac OS X 上。同时你还需要安装一个 **Tex** 排版系统的分发版。因为我都是在 MacOS 上书写文档，所以我使用的分发版是 [MacTex 或 BasicTex][9]。对于 Windows 用户你可以使用 [MiKTex][10]，而且 Linux 用户也可以在软件库中找到它。

当你完成了 TexStudio 和某个 LaTex 的分发版的下载，你就可以开始对你的文档进行排版了。

### 创建你的第一个文档 

在这个简短的教程里，我们会创建一个简单的文章，包括一个大标题、一个子标题和两个段落。

在启动 TexStudio 后，保存一份新的文档。 （我将其保存为 `helloworld.tex` ，因为我正在编写本教程的 Hello，World！文档。这是编程的一个传统。）接下来，你需要在你的 `.tex` 文件顶部添加一些样板代码用于指定文档的类型和大小。 这与 HTML5 文件中使用的样板代码类似。

我的代码（如下方）将会把页面大小设置为 A4，文本大小设置为 12pt 。 你可以直接把这些代码放入 TexStudio，并指定你自己的页面大小、字体大小、名称、标题和其他详细信息进行编辑：

```
\documentclass[a4paper,12pt]{article}
\begin{document}
\title{Hello World! My first LaTeX document}
\author{Aaron Cocker}
\date{\today}
\maketitle

content will go here 

\end{document}
```

接下来，点击那个大的绿色箭头来编译该文档。就是下方截图中的中间的那个按钮。

![compile button in TexStudio](https://opensource.com/sites/default/files/u128651/compile.png "compile button in TexStudio")

如果这期间发生了什么错误，它将显示在底部的对话框里。

在你编译了这个文档之后，你可以看到它就像一个 PDF 一样显示在程序的 WYSIWYG （所见即所得）预览区域中。记住一旦你修改了代码就必须重新编译，就像我们在 C++ 中编程一样。

通过点击 **Tools > Commands > View PDF** 可以来预览你的文档，如下截图所示。

![Menu to view a PDF](https://opensource.com/sites/default/files/u128651/view_as_pdf.png "Menu to view a PDF")

PDF 的输出将会显示在右侧，就像这样：

![Viewing the LaTeX code as PDF](https://opensource.com/sites/default/files/u128651/pdf_output.png "Viewing the LaTeX code as PDF")

现在你可以添加一个段落。首先先通过 `\section{}` 命令来写一个子标题。在命令的大括号中输入你的子标题；我写的是 `Introduction`。

```
\section{Introduction}
```

现在你已经给你的段落标记了一个子标题，是时候来写一个段落了。在这个例子中，我使用了 Lipsum 的 [lorem ipsum 生成器][11]。要创建一个段落，要使用 `\paragraph{}` 命令， 将你的文本插入到 `\maketitle` 和 `\end{document}` 之间的 `\paragraph{}` 大括号下方，而不是中间。

以下就是我创建的段落的代码：

```
\section{Introduction}

\paragraph{}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas sollicitudin. 

\paragraph{}
Mauris efficitur vitae ex id egestas. Vestibulum ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non elementum leo. Nullam molestie congue placerat. Phasellus tempor et libero maximus commodo.
```

现在你的文档就已经完成了，你可以将其通过 **Save As** 选项导出并保存为一个 PDF 文档（和大多数程序一样）。

这是一个我已经完成的文档及其相应的代码：

![The finished document with code and the PDF output side-by-side](https://opensource.com/sites/default/files/u128651/finished_document.png "The finished document with code and the PDF output side-by-side")

本教程所有的代码如下所示：

```
\documentclass[a4paper,12pt]{article}
\begin{document}
\title{Hello World! My first LaTeX document}
\author{Aaron Cocker}
\date{\today}
\maketitle

\section{Introduction}

\paragraph{}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas sollicitudin. 

\paragraph{}
Mauris efficitur vitae ex id egestas. Vestibulum ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non elementum leo. Nullam molestie congue placerat. Phasellus tempor et libero maximus commodo.

\end{document}
```

### 更多

在 LaTeX 撰写的数以千计的优秀资源中，大多数大学制作的指南是可索引的，同时也可以在 Google 搜索中找到。 [普林斯顿大学][12] 提供了一个很好的扩展教程，为了更深入的了解，普林斯顿大学的导师 Donald Knuth 提供了 [The TexBook][13]，这是关于 LaTeX 的最好的教程。

（题图 : opensource.com）

--------------------------------------------------------------------------------

作者简介：

Aaron Cocker - 一名在英国上大学的计算机学士。我是一个有抱负的数据科学家。我最喜欢的语言是 Python。 你可以随时通过邮箱联系我 : aaron@aaroncocker.org.uk 或者访问我的个人网站 : https://aaroncocker.org.uk


---------------

via: https://opensource.com/article/17/6/introduction-latex

作者：[Aaron Cocker][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/aaroncocker
[1]:https://opensource.com/file/356521
[2]:https://opensource.com/file/356526
[3]:https://opensource.com/file/356541
[4]:https://opensource.com/file/356536
[5]:https://opensource.com/file/356531
[6]:https://opensource.com/article/17/6/introduction-latex?rate=n5CmhY55ZhQRMjd6n5-f2p9f7iGg0nAWh_Bi6jqMMyc
[7]:https://opensource.com/user/123226/feed
[8]:http://www.texstudio.org/
[9]:https://www.tug.org/mactex/morepackages.html
[10]:https://miktex.org/download
[11]:http://www.lipsum.com/feed/html
[12]:https://www.cs.princeton.edu/courses/archive/spr10/cos433/Latex/latex-guide.pdf
[13]:http://www.ctex.org/documents/shredder/src/texbook.pdf
[14]:https://opensource.com/users/aaroncocker
[15]:https://opensource.com/article/17/6/introduction-latex#comments
