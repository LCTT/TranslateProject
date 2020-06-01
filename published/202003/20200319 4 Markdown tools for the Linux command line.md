[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12048-1.html)
[#]: subject: (4 Markdown tools for the Linux command line)
[#]: via: (https://opensource.com/article/20/3/markdown-apps-linux-command-line)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

4 个 Linux 命令行下的 Markdown 工具
======

> 命令行 Markdown 工具快速、强大、灵活。以下是 4 个值得试一下的工具。

![](https://img.linux.net.cn/data/attachment/album/202003/29/112110pbd22dku6b2g6ku6.jpg)

（在 Linux 上）在处理 [Markdown][2] 格式的文件时，命令行工具会占据主导地位。它们轻巧、快速、强大、灵活，它们大多数都遵循 Unix 哲学只做好一件事。

看一下这四个程序，它们可以帮助你在命令行中更有效地处理 Markdown 文件。

### mdless

如果你使用过一段时间的 Linux 命令行，那么你可能对名为 [less][3] 的文本查看器很熟悉。当然，你可以使用 `less` 查看 Markdown 文件，但结果有点枯燥。如何在终端中查看 Markdown 文件效果更好一点？来使用 [mdless][4]。

![mdless][5]

你可以使用键盘上的箭头键四处移动，并且 `mdless` 提供了很好的搜索功能。

`mdless` 不仅会显示文本，而且还会渲染标题、粗体和斜体等格式。它还可以显示表格并语法高亮代码块。你还可以创建一个或多个主题文件来[定制][6] `mdless` 的外观。

### Markdown lint 工具

你在快速输入时会犯错误。如果你在使用 Markdown（或其他任何标记语言）时丢失了一些格式，那么在将文件转换为另一种格式时可能会有问题。

程序员通常使用名为 linter 的工具来检查语法是否正确。你可以使用 [Markdown lint 工具][7]对 Markdown 执行相同的操作。

在你对 Markdown 文件运行该工具时，它会根据[规则集][8]检查格式。这些规则控制着文档的结构，包括标题级别的顺序、不正确的缩进和间距、代码块问题、文件中存在 HTML 等等。

![Markdown lint tool][9]

规则可能有点严格。但是，在将文件转换为其他格式之前对文件运行 Markdown lint 工具可以防止由于格式错误或不一致引起的麻烦。

### mdmerge

合并任何类型的文件可能会很痛苦。例如，我在整理一本电子书。它是一篇文章集，最初发布在我的[每周邮件][10]中。这些文章都放在单独的文件中，作为受虐狂，我以凌乱、手动的方式将它们组合在一起。

我希望在开始这个项目之前就知道 [mdmerge][11]。这样我可以节省很多时间和精力。

`mdmerge`，你可能已经从名称中猜到了它的作用，它将两个或多个 Markdown 文件合并为一个文件。你无需在命令行中输入文件名。相反，你可以将它们添加到名为 `book.txt` 的文件中，并将其用作 `mdmerge` 的输入文件。

这并不是 `mdmerge` 能做的一切。你可以添加对另一个文档的引用（使用 Markdown 格式引用或一段源代码），然后将其放入主文档中。这样一来，你就可以创建针对特定受众定制的[主文档][12]。

`mdmerge` 不会是你经常使用的程序。但当你需要时，你会很高兴硬盘上有它。

### bashblog

严格说 [bashblog][13] 并不是 Markdown 工具。它获取 Markdown 文件，并使用它们来构建简单的博客或网站。你可以将 bashblog 视为[静态站点生成器][14]，但是它没有很多脆弱的依赖关系。一切几乎都在一个不到 50KB 的 shell 脚本中。

要使用 bashblog，只需在计算机上安装 Markdown 处理器即可。在此，你可以编辑 Shell 脚本添加有关博客的信息，例如标题、名字、社交媒体链接等。然后运行该脚本。之后会在默认文本编辑器中新建一篇文章。开始输入。

保存文章后，你可以发布它或将其另存为草稿。如果你选择发布文章，那么 bashblog 会将你的博客、文章和所有内容生成为一组 HTML 文件，你可以将它们上传到 Web 服务器。

它开箱即用，你的博客或许会平淡无奇，但可以使用。你可以根据自己喜好编辑站点的 CSS 文件来改变外观。

![bashblog][15]

### Pandoc 如何？

当然，Panddoc 是一个非常强大的工具，可以将 Markdown 文件转换为其他标记语言。但是，在命令行上使用 Markdown 要比 Pandoc 多。

如果你需要 Pandoc，请查看我们发布的文章：

* [在命令行使用 Pandoc 进行文件转换][16]
* [使用 Pandoc 将你的书转换成网页和电子书][17]
* [用 Pandoc 生成一篇调研论文][18]
* [使用 pandoc 将 Markdown 转换为格式化文档][19]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/markdown-apps-linux-command-line

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl (A person working.)
[2]: https://opensource.com/article/19/9/introduction-markdown
[3]: https://opensource.com/article/18/4/using-less-view-text-files-command-line
[4]: https://github.com/ttscoff/mdless
[5]: https://opensource.com/sites/default/files/uploads/mdless.png (mdless)
[6]: https://github.com/ttscoff/mdless#customization
[7]: https://github.com/markdownlint/markdownlint
[8]: https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md
[9]: https://opensource.com/sites/default/files/uploads/mdl.png (Markdown lint tool)
[10]: https://buttondown.email/weeklymusings
[11]: https://github.com/JeNeSuisPasDave/MarkdownTools
[12]: https://help.libreoffice.org/6.2/en-US/text/swriter/guide/globaldoc.html
[13]: https://github.com/cfenollosa/bashblog
[14]: https://en.wikipedia.org/wiki/Web_template_system#Static_site_generators
[15]: https://opensource.com/sites/default/files/uploads/bashblog.png (bashblog)
[16]: https://linux.cn/article-10228-1.html
[17]: https://linux.cn/article-10287-1.html
[18]: https://linux.cn/article-10179-1.html
[19]: https://linux.cn/article-11160-1.html
