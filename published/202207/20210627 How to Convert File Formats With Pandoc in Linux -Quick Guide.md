[#]: subject: (How to Convert File Formats With Pandoc in Linux [Quick Guide])
[#]: via: (https://itsfoss.com/pandoc-convert-file/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14785-1.html)

如何在 Linux 中使用 Pandoc 转换文件格式
======

在之前的一篇文章中，我介绍了 [使用 pandoc 将少量 Markdown 文件批量转换为 HTML 的过程][1]。在那篇文章中，我创建了多个 HTML 文件，但 Pandoc 可以做的更多。它被称为文档转换的“瑞士军刀” —— 这是有充分理由的。很少有它做不到的事情。

[Pandoc][2] 可以将 .docx、.odt、.html、.epub、LaTeX、DocBook 等格式互相转换，或者转换为其他格式，例如 JATS、TEI Simple、AsciiDoc 等。

是的，这意味着 Pandoc 可以将 .docx 文件转换为 .pdf 和 .html 文件，但你可能会想：“Word 也可以将文件导出为 .pdf 和 .html。为什么我需要 Pandoc 呢？”

嗯，本来呢，你这个说法也没错，但考虑到 Pandoc 可以转换这么多格式，它很可能成为你所有转换任务的首选工具。例如，我们中的许多人都知道 [Markdown 编辑器][3] 可以将其 Markdown 文件导出为 .html。而使用 Pandoc 文件也可以转换为许多其他格式。

我很少将 Markdown 导出为 HTML。我通常让 Pandoc 来做这件事。

### 使用 Pandoc 转换文件格式

![][4]

本文中，我会将 Markdown 文件转换成几种不同的格式。我几乎所有的写作都使用 Markdown 语法，但我经常需要转换为另一种格式：学校作业通常需要的 .docx 格式；我创建的网页通常需要的 .html 格式；工作需要的 .epub 格式；传单和讲义需要的 .pdf 格式；甚至包括一个大学数字人文项目偶尔需要的 TEI Simple 格式。Pandoc 可以轻松处理所有这些格式，甚至更多。

首先，你需要 [安装 pandoc][5]。此外，要创建 .pdf 文件，还需要 LaTeX。我最喜欢的套件是 [TeX Live][6]。

**注意**：如果你想在安装前试用 pandoc，这里有一个在线试用页面：<http://pandoc.org/try/>。

#### 安装 pandoc 和 texlive

Ubuntu 和其他 Debian 发行版的用户可以在终端中输入以下命令：

```
sudo apt-get update
sudo apt-get install pandoc texlive
```

请注意第二行，你将一次性安装 `pandoc` 和 `texlive`。[apt-get 命令][7] 支持你这样做。不过，我建议你先去喝杯咖啡，因为这可能需要几分钟的时间。

#### 开始转换

安装完成 `pandoc` 和 `texlive` 后，你就可以尝试用它们来完成一些工作了！

该项目的示例文档将是一篇文章，该文章于 1894 年 12 月首次发表在《北美评论》上，标题为“如何击退火车劫匪”。我将使用的 Markdown 文件是前一段时间创建的，该文章的一个恢复项目的一部分（LCTT 译注：这是篇一百多年前发表的文章，这是一个数字化“恢复”项目）。

我把这篇文章保存为 `how_to_repel_train_robbers.md`，它位于我的 `Documents` 目录下，名为 `samples` 的子目录中。它在 Ghostwriter 中看起来是这样的：

![在 Ghostwriter 中查看原始的 Markdown 文件][8]

我想创建此文件的 .docx、.pdf 和 .html 版本。

#### 第一次转换

首先，我将制作一个 .pdf 副本，因为我在安装 LaTeX 包时遇到了些麻烦。

在 `~/Documents/samples/` 目录中，我输入以下，以创建一个 .pdf 文件：

```
pandoc -o htrtr.pdf how_to_repel_train_robbers.md
```

上述命令将基于 `how_to_repel_train_robbers.md` 文件，创建一个名为 `htrtr.pdf` 的文件。我使用 `htrtr` 作为名称的原因是：嗯，它比 `how_to_repel_train_robbers` 短。`htrtr` 其实是长标题中的单词首字母排列。

这是 .pdf 文件制作完成后的一个截图：

![在 Ocular 中查看的转换后的 PDF 文件][9]

#### 第二次转换

接下来，我想创建一个 .docx 文件。该命令与我用来创建 .pdf 的命令几乎相同，它是：

```
pandoc -o htrtr.docx how_to_repel_train_robbers.md
```

很快，一个 .docx 文件就创建好了。这是它在 Libre Writer 中的样子：

![在 Libre Writer 中查看转换后的 DOCX 文件][10]

#### 第三次转换

我可能会想在网上发布这个，所以再多一个支持网页的格式也不错。我将使用以下命令创建一个 .html 文件：

```
pandoc -o htrtr.html how_to_repel_train_robbers.md
```

同样，创建它的命令与前两次转换非常相似。这是该 .html 文件在浏览器中的样子：

![在 Firefox 中查看的转换后的 HTML 文件][11]

#### 注意到什么了吗？

让我们再看看之前的命令。它们是：

```
pandoc -o htrtr.pdf how_to_repel_train_robbers.md
pandoc -o htrtr.docx how_to_repel_train_robbers.md
pandoc -o htrtr.html how_to_repel_train_robbers.md
```

这三个命令唯一不同的是 `htrtr` 后的扩展名。这提示你 pandoc 会依赖于你提供的输出文件扩展名（来决定目标转换格式）。

### 总结

Pandoc 可以做的远不止这里完成的三个小转换。如果你选择使用一个首选格式编写文件，但时不时又需要将文件转换为另一种格式，pandoc 很大概率都能为你完成。

现在，既然你已经学会了，你会用它做什么呢？你会把它自动化吗？如果你有一个网站，想供读者下载文章怎么办？你可以修改这些小命令，把它们编写成一个脚本，你的读者可以决定他们想要哪种格式。你可以提供 .docx、.pdf、.odt、.epub 或更多格式。你的读者只需要选择一种格式，然后对应的转换脚本就会执行，最后，你的读者下载他们想要的文件。这是完全可以做到的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/pandoc-convert-file/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/convert-markdown-files/
[2]: https://pandoc.org/
[3]: https://itsfoss.com/best-markdown-editors-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/pandoc-quick-guide.png?resize=800%2C450&ssl=1
[5]: https://pandoc.org/installing.html
[6]: https://www.tug.org/texlive/
[7]: https://itsfoss.com/apt-get-linux-guide/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_ghostwriter.png?resize=800%2C516&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_ocular.png?resize=800%2C509&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_libre_writer.png?resize=800%2C545&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/convert_with_pandoc_firefox.png?resize=800%2C511&ssl=1
