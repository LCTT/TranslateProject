[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12620-1.html)
[#]: subject: (Design a book cover with an open source alternative to InDesign)
[#]: via: (https://opensource.com/article/20/9/open-source-publishing-scribus)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

用 InDesign 的开源替代方案 Scribus 设计书籍封面
======

> 使用开源的出版软件 Scribus 来制作你的下一本自出版书籍的封面。

![](https://img.linux.net.cn/data/attachment/album/202009/16/213714ppvfzm6idv9nnynp.jpg)

我最近写完了一本关于 [C 语言编程][2]的书，我通过 [Lulu.com][3] 自行出版。我已经用 Lulu 做了好几个图书项目，它是一个很棒的平台。今年早些时候，Lulu 做了一些改变，让作者在创作图书封面时有了更大的控制权。以前，你只需上传一对大尺寸图片作为书的封面和封底。现在，Lulu 允许作者上传完全按照你的书的尺寸定制的 PDF。

你可以使用 [Scribus][4] 这个开源页面布局程序来创建封面。下面是我的做法。

### 下载一个模板

当你在 Lulu 上输入图书的信息时，最终会进入<ruby>设计<rt>Design</rt></ruby>栏。在该页面的<ruby>设计封面<rt>Design Your Cover</rt></ruby>部分，你会发现一个方便的<ruby>下载模板<rt>Download Template</rt></ruby>按钮，它为你的图书封面提供了一个 PDF 模板。

![Lulu Design your Cover page][5]

下载此模板，它为你提供了在 Scribus 中创建自己的书籍封面所需的信息。

![Lulu's cover template][7]

最重要的细节是：

  * <ruby>文件总尺寸（含出血）<rt>Total Document Size (with bleed)</rt></ruby>
  * <ruby>出血区（从裁切边缘）<rt>Bleed area (from trim edge)</rt></ruby>
  * <ruby>书脊区<rt>Spine area</rt></ruby>

<ruby>出血<rt>Bleed</rt></ruby>是一个印刷术语，在准备“印刷就绪”文件时，这个术语很重要。它与普通文件中的页边距不同。打印文件时，你会为顶部、底部和侧面设置一个页边距。在大多数文档中，页边距通常为一英寸左右。

但在印刷就绪的文件中，文档的尺寸需要比成品书大一些，因为书籍的封面通常包括颜色或图片，一直到封面的边缘。为了创建这种设计，你要使颜色或图片超出你的边距，印刷厂就会把多余的部分裁切掉，使封面缩小到准确的尺寸。因此，“裁切”就是印刷厂将封面精确地裁剪成相应尺寸。而“出血区”就是印刷厂裁掉的多余部分。

如果你没有出血区，印刷厂就很难完全按照尺寸印刷封面。如果打印机只偏离了一点点，你的封面最终会在边缘留下一个微小的、白色的、没有印刷的边缘。使用出血和修剪意味着你的封面每次都能看起来正确。

### 在 Scribus 中设置书籍的封面文档

要在 Scribus 中创建新文档，请从定义文档尺寸的<ruby>新文档<rt>New Document</rt></ruby>对话框开始。单击<ruby>出血<rt>Bleeds</rt></ruby>选项卡，并输入 PDF 模板所说的出血尺寸。Lulu 图书通常在所有边缘使用 0.125 英寸的出血量。

对于 Scribus 中的文档总尺寸，你不能只使用 PDF 模板上的文档总尺寸。如果这样做，你的 Scribus 文档的尺寸会出现错误。相反，你需要做一些数学计算来获取正确的尺寸。

看下 PDF 模板中的<ruby>文件总尺寸（含出血）<rt>Total Document Size (with bleed)</rt></ruby>。这是将要发送给打印机的 PDF 的总尺寸，它包括封底、书脊和封面（包含出血）。要在 Scribus 中输入正确的尺寸，你必须从所有边缘中减去出血。例如，我最新的书的尺寸是<ruby>四开本<rt>Crown Quarto</rt></ruby>，装订后尺寸为 7.44" x 9.68"，书脊宽度为 0.411"。加上 0.125" 的出血量，文件总尺寸（含出血）是 15.541" × 9.93"。因此，我在 Scribus 中的文档尺寸是：

  * 宽：15.541-(2 x 0.125)=15.291"
  * 高：9.93-(2 x 0.125)=9.68"

![Scribus document setup][8]

这将设置一个新的适合我的书的封面尺寸的 Scribus 文档。新的 Scribus 文档尺寸应与 PDF 模板上列出的“文件总尺寸（含出血）”完全匹配。

### 从书脊开始

在 Scribus 中创建新的书籍封面时，我喜欢从书脊区域开始。这可以帮助我验证我是否在 Scribus 中正确定义了文档。

使用<ruby>矩形<rt>Rectangle</rt></ruby>工具在文档上绘制一个彩色方框，书脊需要出现在那里。你不必完全按照正确的尺寸和位置来绘制，只要大小差不多并使用<ruby>属性<rt>Properties</rt></ruby>来设置正确的值即可。在形状的属性中，选择左上角基点，然后输入书脊需要放在的 x、y 位置和尺寸。同样，你需要做一些数学计算，并使用 PDF 模板上的尺寸作为参考。

![Empty Scribus document][9]

例如，我的书的修边尺寸是 7.44"×9.68"，这是印刷厂修边后的封面和封底的尺寸。我的书的书脊大小是 0.411"，出血量是 0.125"。也就是说，书脊的左上角 X、Y 的正确位置是：

  * X 位置（出血量+裁剪宽度）：0.411+7.44=7.8510"
  * Y 位置（减去出血量）：-0.125"

矩形的尺寸是我的书封面的全高（包括出血）和 PDF 模板中标明的书脊宽度。

  * 宽度：0.411"
  * 高度：9.93"

将矩形的<ruby>填充<rt>Fill</rt></ruby>设置为你喜欢的颜色，将<ruby>笔触<rt>Stroke</rt></ruby>设置为<ruby>无<rt>None</rt></ruby>以隐藏边界。如果你正确地定义了 Scribus 文档，你应该最终得到一个矩形，它可以延伸到位于文档中心的图书封面的顶部和底部边缘。

![Book spine in Scribus][10]

如果矩形与文档不完全匹配，可能是你在创建 Scribus 文档时设置了错误的尺寸。由于你还没有在书的封面上花太多精力，所以可能最容易的做法是重新开始，而不是尝试修复你的错误。

### 剩下的就看你自己了

接下来，你可以创建你的书的封面的其余部分。始终使用 PDF 模板作为指导。封底在左边，封面在右边

我可以做一个简单的书籍封面，但我缺乏艺术能力，无法创造出真正醒目的设计。在自己设计了几个书的封面后，我对那些能设计出好封面的人产生了敬意。但如果你只是需要制作一个简单的封面，你可以通过开源软件自己动手。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/open-source-publishing-scribus

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_read_list_stack_study.png?itok=GZxb9OAv (Stack of books for reading)
[2]: https://opensource.com/article/20/8/c-programming-cheat-sheet
[3]: https://www.lulu.com/
[4]: https://www.scribus.net/
[5]: https://opensource.com/sites/default/files/uploads/lulu-download-template.jpg (Lulu Design your Cover page)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/lulu-pdf-template.jpg (Lulu's cover template)
[8]: https://opensource.com/sites/default/files/uploads/scribus-new-document.jpg (Scribus document setup)
[9]: https://opensource.com/sites/default/files/uploads/scribus-empty-document.jpg (Empty Scribus document)
[10]: https://opensource.com/sites/default/files/uploads/scribus-spine-rectangle.jpg (Book spine in Scribus)
