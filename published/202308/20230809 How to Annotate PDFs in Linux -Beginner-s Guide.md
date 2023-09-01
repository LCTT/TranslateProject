[#]: subject: "How to Annotate PDFs in Linux [Beginner's Guide]"
[#]: via: "https://itsfoss.com/annotate-pdf-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16133-1.html"

如何在 Linux 中注释 PDF
======

![][0]

> 你不需要专门的 PDF 编辑器来添加注释和高亮文本。下面介绍如何在 Linux 中使用 GNOME 的文档查看器来注释 PDF。

阅读一些 PDF 格式的有趣内容，并觉得需要添加评论或高亮显示某些文本？也许你在 PDF 文档上留一些反馈？

[Linux 用户可以使用多种 PDF 编辑器][1]。但你不需要专门的 PDF 编辑器来完成这个简单的任务。

大多数 PDF 阅读器都具有内置注释功能，你可以使用它来快速轻松地高亮显示文本并添加注释。

我最近在审阅 O'Reilly 即将出版的第四版 [《Linux Pocket Guide》一书][2]时“发现”了它。出版商请求对 PDF 文件本身提出建议。

让我分享一下如何在 Linux 中使用 Evince（GNOME 中的默认 PDF 阅读器）对 PDF 进行注释。使用 Okular（KDE 中默认的 PDF 阅读器）也可以实现同样的效果。

大多数 Linux 发行版都应该附带上述工具之一。如果没有，你可以轻松安装它们。我不会介绍安装过程。请在你的发行版的软件管理器中查找它们。

### 使用 Evince 文档查看器注释 PDF

使用 Evince（在 GNOME 中也称为“<ruby>文档查看器<rt>Document Viewer</rt></ruby>”）打开所需的 PDF 文件。

你将在文档查看器的左上角看到一个“编辑”选项。点击它会出现以下两个选项：

  * 备注文本（用于添加评论）
  * 高亮显示文本（用于高亮显示选定的文本）

![][3]

让我详细介绍这是如何工作的。

#### 在 PDF 中添加注释

要添加评论，单击 “<ruby>注释文本<rt>Note text</rt></ruby>” 选项。

你会注意到光标变成了 “+” 号。你可以单击文档中的任意位置，它会立即添加注释图标并打开另一个窗口以添加注释。

![][4]

我建议单击该行的末尾，以便注释图标位于空白区域，并且不会遮挡文件的实际文本。

添加所需注释后，你可以 **单击注释区域的 “X” 按钮来关闭** 注释文本窗口。

> 💡 你可以通过在屏幕上拖动注释图标来移动注释图标。

#### 在 PDF 中高亮显示文本

同样，你可以选择 “<ruby>高亮显示文本<rt>Highlight text</rt></ruby>” 选项来高亮显示 PDF 文件中的特定文本。

之后，只需选择要高亮显示的文本即可。当你开始移动光标，它就会开始高亮显示。

![][5]

> 💡 你还可以在高亮显示的文本上添加注释，以提供有关高亮显示的一些上下文。要添加文本，请单击高亮显示的文本（现在它可点击了）。

#### 保存带注释的文件

你可能已在 PDF 上添加注释，但更改尚未保存。

保存更改很简单。按 `Ctrl+S` 键，你可以选择保存文件的位置。

你可以覆盖现有 PDF 文件或将其另存为新文件。

![][6]

> 📋 注释、评论和高亮被附加到 PDF 文件中，即使你使用其他可以读取注释的工具打开 PDF 文件，它们也应该可以看到。

#### 阅读注释

要阅读文本注释或评论，只需将鼠标悬停在注释图标或高亮显示的文本上即可。它将立即显示注释。

![][7]

不要单击图标来阅读文本。单击将打开它进行编辑。

#### 编辑现有注释

假设你注意到需要向现有笔记添加更多详细信息。你所要做的就是单击“注释”图标。

它将打开添加的文本。你可以阅读它，如果你愿意，也可以编辑它。对于高亮显示的文本部分中的注释也是如此。

但是，编辑高亮显示的文本时它不是很完善。如果你认为必须高亮显示现有文本周围的更多文本，那么它会起作用。但如果你想缩短高亮显示的文本，那就不行了。

为此，你必须删除高亮显示并再次添加。

#### 删除现有注释

删除注释非常简单，只需右键单击注释并选择 “<ruby>删除注释<rt>Remove Annotation</rt></ruby>” 选项即可。

![][8]

这对于高亮显示的文本也同样有效。

#### 修改注释的外观

不喜欢默认的黄色或注释图标？这一切都是可以改变的。

右键单击现有注释并选择 “<ruby>注释属性<rt>Annotation Properties...</rt></ruby>” 选项。

![][9]

你可以更改评论的作者、注释的颜色和不透明度。你还可以更改注释的图标和高亮显示的标记类型（删除线、下划线等）。

![][10]

这仅适用于现有注释。我找不到一种方法来更改所有未来注释的默认属性。

### 更多 PDF 编辑选项

如果你需要的不仅仅是简单的文本注释和高亮显示，可以使用专门的 PDF 编辑器。

> **[11 最好的 Linux 上的 PDF 编辑器][11]**

这些工具可能允许你重新排列或合并 PDF 文件。

> **[如何在 Linux 上合并 PDF 文件][11A]**

如果需要，你还可以 [压缩 PDF 文件][12]。

> **[如何在 Linux 上压缩 PDF 文件][12]**

PDF 编辑永无止境。我希望你喜欢这篇有关 Linux 中 PDF 注释的初学者技巧。

KDE 的 Okular 还提供 PDF 注释选项。也许我可以写一篇关于 Okul 的类似文章。

请在评论栏留下你的反馈。

*（题图：MJ/a5318540-0b82-4ef6-a0bb-532505a17458）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/annotate-pdf-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pdf-editors-linux/
[2]: https://www.oreilly.com/library/view/linux-pocket-guide/9780596806347/?ref=itsfoss.com
[3]: https://itsfoss.com/content/images/2023/08/annotate-pdf-with-gnome-document-viewer-in-linux.png
[4]: https://itsfoss.com/content/images/2023/08/adding-comments-to-pdf-linux.png
[5]: https://itsfoss.com/content/images/2023/08/highlight-text-pdf-linux.png
[6]: https://itsfoss.com/content/images/2023/08/save-annotated-file.png
[7]: https://itsfoss.com/content/images/2023/08/reading-annotations-pdf-linux-1.png
[8]: https://itsfoss.com/content/images/2023/08/remove-annotations-from-pdf-in-linux.png
[9]: https://itsfoss.com/content/images/2023/08/change-annotation-design-pdf.png
[10]: https://itsfoss.com/content/images/2023/08/changing-annotation-properties.png
[11]: https://itsfoss.com/pdf-editors-linux/
[11A]: https://itsfoss.com/merge-pdf-linux/
[12]: https://itsfoss.com/compress-pdf-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202308/27/141000pelw8wgggqlenwx8.jpg