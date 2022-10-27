[#]: subject: (Edit PDFs on the Linux command line)
[#]: via: (https://opensource.com/article/21/7/qpdf-command-line)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13581-1.html)

在 Linux 命令行上编辑 PDF
======

> 使用 qpdf 和 poppler-utils 来分割、修改和合并 PDF 文件。

![](https://img.linux.net.cn/data/attachment/album/202107/15/093249xh6dmg846py8bgbc.jpg)

你收到的许多文件都是 PDF 格式的。有时这些 PDF 需要进行处理。例如，可能需要删除或添加页面，或者你可能需要签署或修改一个特定的页面。

不管是好是坏，这就是我们所处的现实。

有一些花哨的图形用户界面工具可以让你编辑 PDF，但我一直对命令行感到最舒服。在这个任务的许多命令行工具中，当我想修改一个 PDF 时，我使用的是 `qpdf` 和 `poppler-utils`。

### 安装

在 Linux 上，你可以用你的包管理器（如 `apt` 或 `dnf`）来安装 `qpdf` 和 `poppler-utils`。比如在 Fedora 上：

```
$ sudo dnf install qpdf poppler-utils
```

在 macOS 上，使用 [MacPorts][2] 或 [Homebrew][3]。在 Windows 上，使用 [Chocolatey][4]。

### qpdf

`qpdf` 命令可以做很多事情，但我主要用它来：

  1. 将一个 PDF 分割成不同的页面
  2. 将多个 PDF 文件合并成一个文件

要将一个 PDF 分割成不同的页面：

```
qpdf --split-pages original.pdf split.pdf
```

这就会生成像 `split-01.pdf`、`split-02.pdf` 这样的文件。每个文件都是一个单页的 PDF 文件。

合并文件比较微妙：

```
qpdf --empty concatenated.pdf --pages split-*.pdf --
```

这就是 `qpdf` 默认的做法。`--empty` 选项告诉 qpdf 从一个空文件开始。结尾处的两个破折号（`--`）表示没有更多的文件需要处理。这是一个参数反映内部模型的例子，而不是人们使用它的目的，但至少它能运行并产生有效的 PDF！

### poppler-utils

这个软件包包含几个工具，但我用得最多的是 [pdftoppm][5]，它把 PDF 文件转换为可移植的像素图（`ppm`）文件。我通常在用 `qpdf` 分割页面后使用它，并需要将特定页面转换为我可以修改的图像。`ppm` 格式并不为人所知，但重要的是大多数图像处理方法，包括 [ImageMagick][6]、[Pillow][7] 等，都可以使用它。这些工具中的大多数也可以将文件保存为 PDF。

### 工作流程

我通常的工作流程是：

  * 使用 `qpdf` 将 PDF 分割成若干页。
  * 使用 `poppler-utils` 将需要修改的页面转换为图像。
  * 根据需要修改图像，并将其保存为 PDF。
  * 使用 `qpdf` 将各页合并成一个 PDF。

### 其他工具

有许多很好的开源命令来处理 PDF，无论你是 [缩小它们][8]、[从文本文件创建它们][9]、[转换文档][10]，还是尽量 [完全避免它们][11]。你最喜欢的开源 PDF 工具是什么？请在评论中分享它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/qpdf-command-line

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://www.xpdfreader.com/pdftoppm-man.html
[6]: https://opensource.com/article/17/8/imagemagick
[7]: https://opensource.com/article/20/8/edit-images-python
[8]: https://opensource.com/article/20/8/reduce-pdf
[9]: https://opensource.com/article/20/5/pandoc-cheat-sheet
[10]: https://opensource.com/article/21/3/libreoffice-command-line
[11]: https://opensource.com/article/19/3/comic-book-archive-djvu
