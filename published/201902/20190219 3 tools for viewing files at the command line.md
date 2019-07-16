[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10573-1.html)
[#]: subject: (3 tools for viewing files at the command line)
[#]: via: (https://opensource.com/article/19/2/view-files-command-line)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

在命令行查看文件的 3 个工具
======

> 看一下 `less`、Antiword 和 `odt2xt` 这三个实用程序，它们都可以在终端中查看文件。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg)

我常说，你不需要使用命令行也可以高效使用 Linux —— 我知道许多 Linux 用户从不打开终端窗口，并且也用的挺好。然而，即使我不认为自己是一名技术人员，我也会在命令行上花费大约 20% 的计算时间，包括操作文件、处理文本和使用实用程序。

我经常在终端窗口中做的一件事是查看文件，无论是文本还是需要用到文字处理器的文件。有时使用命令行实用程序比启动文本编辑器或文字处理器更容易。

下面是我在命令行中用来查看文件的三个实用程序。

### less

[less][1] 的美妙之处在于它易于使用，它将你正在查看的文件分解为块（或页面），这使得它们更易于阅读。你可以使用它在命令行查看文本文件，例如 README、HTML 文件、LaTeX 文件或其他任何纯文本文件。我在[上一篇文章][2]中介绍了 `less`。

要使用 `less`，只需输入：

```
less file_name
```

![](https://opensource.com/sites/default/files/uploads/less.png)

通过按键盘上的空格键或 `PgDn` 键向下滚动文件，按 `PgUp` 键向上移动文件。要停止查看文件，按键盘上的 `Q` 键。

### Antiword

[Antiword][3] 是一个很好地实用小程序，你可以使用它将 Word 文档转换为纯文本。只要你想，还可以将它们转换为 [PostScript][4] 或 [PDF][5]。在本文中，让我们继续使用文本转换。

Antiword 可以读取和转换 Word 2.0 到 2003 版本创建的文件（LCTT 译注：此处疑为 Word 2000，因为 Word 2.0 for DOS 发布于 1984 年，而 WinWord 2.0 发布于 1991 年，都似乎太老了）。它不能读取 DOCX 文件 —— 如果你尝试这样做，Antiword 会显示一条错误消息，表明你尝试读取的是一个 ZIP 文件。这在技术上说是正确的，但仍然令人沮丧。

要使用 Antiword 查看 Word 文档，输入以下命令：

```
antiword file_name.doc
```

Antiword 将文档转换为文本并显示在终端窗口中。不幸的是，它不能在终端中将文档分解成页面。不过，你可以将 Antiword 的输出重定向到 `less` 或 [more][6] 之类的实用程序，一遍对其进行分页。通过输入以下命令来执行此操作：

```
antiword file_name.doc | less
```

如果你是命令行的新手，那么我告诉你 `|` 称为管道。这就是重定向。

![](https://opensource.com/sites/default/files/uploads/antiword.png)

### odt2txt

作为一个优秀的开源公民，你会希望尽可能多地使用开放格式。对于你的文字处理需求，你可能需要处理 [ODT][7] 文件（由诸如 LibreOffice Writer 和 AbiWord 等文字处理器使用）而不是 Word 文件。即使没有，也可能会遇到 ODT 文件。而且，即使你的计算机上没有安装 Writer 或 AbiWord，也很容易在命令行中查看它们。

怎样做呢？用一个名叫 [odt2txt][8] 的实用小程序。正如你猜到的那样，`odt2txt` 将 ODT 文件转换为纯文本。要使用它，运行以下命令：

```
odt2txt file_name.odt
```

与 Antiword 一样，`odt2txt` 将文档转换为文本并在终端窗口中显示。和 Antiword 一样，它不会对文档进行分页。但是，你也可以使用以下命令将 `odt2txt` 的输出管道传输到 `less` 或 `more` 这样的实用程序中：

```
odt2txt file_name.odt | more
```

![](https://opensource.com/sites/default/files/uploads/odt2txt.png)

你有一个最喜欢的在命令行中查看文件的实用程序吗？欢迎留下评论与社区分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/view-files-command-line

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/less/
[2]: https://opensource.com/article/18/4/using-less-view-text-files-command-line
[3]: http://www.winfield.demon.nl/
[4]: http://en.wikipedia.org/wiki/PostScript
[5]: http://en.wikipedia.org/wiki/Portable_Document_Format
[6]: https://opensource.com/article/19/1/more-text-files-linux
[7]: http://en.wikipedia.org/wiki/OpenDocument
[8]: https://github.com/dstosberg/odt2txt
