[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13056-1.html)
[#]: subject: (3 plain text note-taking tools)
[#]: via: (https://opensource.com/article/21/1/plain-text)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

3 个纯文本记事工具
======

> 记笔记很重要，而纯文本是一种简单、中性的方式。这里有三个工具，你可以在不失去纯文本的简易和便携性的前提下，给你的笔记加点东西。

![](https://img.linux.net.cn/data/attachment/album/202101/27/153329o0waw16448hq0avf.jpg)

在前几年，这个年度系列涵盖了单个的应用。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第五天。

纯文本是最具弹性的文档格式。纯文本文档体积小，可以在机器之间快速传输，并且可以在*任意*设备上阅读。因此，在纯文本文档中做笔记是很有意义的。

然而，纯文本也仅是纯文本。我们生活在一个富文本世界中，我们仍然需要标题、列表以及区分一个章节和另一个章节的方法。幸运的是，我们有几种方法可以添加这些元素，而不需要在纯文本文档中添加复杂的标记。

### Markdown

![Markdown][2]

*Markdown （Kevin Sonney, [CC BY-SA 4.0][3]）*

由 Aaron Schwartz 和 John Gruber 创建的 [Markdown][4]，是我如今每天使用最多的格式。从读写 README 文件、文档、记笔记，甚至源代码注释，Markdown 让我可以在不牺牲轻松阅读文档的能力的情况下添加格式。

此外，Markdown 还有几个“扩展版本”，以允许那些不属于原始设计的项目。特别是，[GitHub 风格的 Markdown][5] 由于其在同名的源码控制网站中的使用而异常流行。

许多文件编辑器都支持 Markdown 高亮显示，不需要额外的附加组件或工作。

### AsciiDoc

![AsciiDoc][6]

*AsciiDoc （Kevin Sonney, [CC BY-SA 4.0][3]）*

由 Stuart Rackham 创建的 [AsciiDoc][7] 是向纯文本文档添加富文本元素的另一种方式。AsciiDoc 有许多生成文档、书籍和论文的功能。然而，这并不意味着它不能被用来做笔记。有很多环境（特别是在教育和研究领域），能够快速将笔记转换为更“正式”的格式是很有帮助的。

AsciiDoc 也有很多工具可以将文本转换为其他格式进行协作。还有一些附加组件可以从不同的源导入数据，并将其放入最终的文档中，或者处理特殊的格式，如 MathML 或 LaTeX。

### Org 模式

![ORG-Mode][8]

*ORG-Mode （Kevin Sonney, [CC BY-SA 4.0][3]）*

说到文本格式，我不能不提 [Org 模式][9]。它最初是为 [GNU Emacs][10] 设计的，现在已经成为笔记、待办事项、文档等常用的纯文本格式之一。Org 模式可以在包括 [Vim][11] 在内的众多文本编辑器中编写和使用。Org 模式简单、易学，是我最喜欢的笔记文本格式之一。

最后，选择 Markdown、AsciiDoc 或 Org 模式作为纯文本笔记，是确保它们可以在任何地方被阅读和更新的一种方式。如果你和我一样，你会发现自己在做纸质笔记的时候，也会使用同样的语法！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/plain-text

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/typewriter-hands.jpg?itok=oPugBzgv (Typewriter with hands)
[2]: https://opensource.com/sites/default/files/pictures/markdown.png (Markdown)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/19/9/introduction-markdown
[5]: https://guides.github.com/features/mastering-markdown/#GitHub-flavored-markdown
[6]: https://opensource.com/sites/default/files/pictures/asciidoc.png (AsciiDoc)
[7]: https://asciidoc.org/
[8]: https://opensource.com/sites/default/files/pictures/org-mode.png (ORG-Mode)
[9]: https://orgmode.org/
[10]: https://www.gnu.org/software/emacs/
[11]: https://opensource.com/article/19/1/productivity-tool-org-mode
