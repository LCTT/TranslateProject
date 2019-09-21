[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10584-1.html)
[#]: subject: (Two graphical tools for manipulating PDFs on the Linux desktop)
[#]: via: (https://opensource.com/article/19/2/manipulating-pdfs-linux)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

两款 Linux 桌面中的图形化操作 PDF 的工具
======

> PDF-Shuffler 和 PDF Chain 是在 Linux 中修改 PDF 的绝佳工具。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4)

由于我谈论和写作了些 PDF 及使用它们的工具的文章，有些人认为我喜欢这种格式。其实我并不是，由于各种原因，我不会深入它。

我不会说 PDF 是我个人和职业生活中的一个躲不开的坏事 - 而实际上它们不是那么好。通常即使有更好的替代方案来交付文档，通常我也必须使用 PDF。

当我使用 PDF 时，通常是在白天工作时在其他的操作系统上使用，我使用 Adobe Acrobat 进行操作。但是当我必须在 Linux 桌面上使用 PDF 时呢？我们来看看我用来操作 PDF 的两个图形工具。

### PDF-Shuffler

顾名思义，你可以使用 [PDF-Shuffler][1] 在 PDF 文件中移动页面。它可以做得更多，但该软件的功能是有限的。这并不意味着 PDF-Shuffler 没用。它有用，很有用。

你可以将 PDF-Shuffler 用来：

  * 从 PDF 文件中提取页面
  * 将页面添加到文件中
  * 重新排列文件中的页面

请注意，PDF-Shuffler 有一些依赖项，如 pyPDF 和 python-gtk。通常，通过包管理器安装它是最快且最不令人沮丧的途径。

假设你想从 PDF 中提取页面，也许是作为你书中的样本章节。选择 “File > Add”打开 PDF 文件。

![](https://opensource.com/sites/default/files/uploads/pdfshuffler-book.png)

要提取第 7 页到第 9 页，请按住 `Ctrl` 并单击选择页面。然后，右键单击并选择 “Export selection”。

![](https://opensource.com/sites/default/files/uploads/pdfshuffler-export.png)

选择要保存文件的目录，为其命名，然后单击 “Save”。

要添加文件 —— 例如，要添加封面或重新插入已扫描的且已签名的合同或者应用 - 打开 PDF 文件，然后选择 “File > Add” 并找到要添加的 PDF 文件。单击 “Open”。

PDF-Shuffler 有个不好的地方就是添加页面到你正在处理的 PDF 文件末尾。单击并将添加的页面拖动到文件中的所需位置。你一次只能在文件中单击并拖动一个页面。

![](https://opensource.com/sites/default/files/uploads/pdfshuffler-move.png)

### PDF Chain

我是 [PDFtk][2] 的忠实粉丝，它是一个可以对 PDF 做一些有趣操作的命令行工具。由于我不经常使用它，我不记得所有 PDFtk 的命令和选项。

[PDF Chain][3] 是 PDFtk 命令行的一个很好的替代品。它可以让你一键使用 PDFtk 最常用的命令。无需使用菜单，你可以：

* 合并 PDF（包括旋转一个或多个文件的页面）
* 从 PDF 中提取页面并将其保存到单个文件中
* 为 PDF 添加背景或水印
* 将附件添加到文件

![](https://opensource.com/sites/default/files/uploads/pdfchain1.png)

你也可以做得更多。点击 “Tools” 菜单，你可以：

* 从 PDF 中提取附件
* 压缩或解压缩文件
* 从文件中提取元数据
* 用外部[数据][4]填充 PDF 表格
* [扁平化][5] PDF
* 从 PDF 表单中删除 [XML 表格结构][6]（XFA）数据

老实说，我只使用 PDF Chain 或 PDFtk 提取附件、压缩或解压缩 PDF。其余的对我来说基本没听说。

### 总结

Linux 上用于处理 PDF 的工具数量一直让我感到吃惊。它们的特性和功能的广度和深度也是如此。无论是命令行还是图形，我总能找到一个能做我需要的。在大多数情况下，PDF Mod 和 PDF Chain 对我来说效果很好。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/manipulating-pdfs-linux

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://savannah.nongnu.org/projects/pdfshuffler/
[2]: https://en.wikipedia.org/wiki/PDFtk
[3]: http://pdfchain.sourceforge.net/
[4]: http://www.verypdf.com/pdfform/fdf.htm
[5]: http://pdf-tips-tricks.blogspot.com/2009/03/flattening-pdf-layers.html
[6]: http://en.wikipedia.org/wiki/XFA
