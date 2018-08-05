如何用 Scribus 和 Gedit 编辑 Adobe InDesign 文件
======

> 学习一下这些用开源工具编辑 InDesign 文件的方案。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open-indesign-scribus-gedit-graphic.jpg?itok=OPJaGdA5)

要想成为一名优秀的平面设计师，您必须善于使用各种各样专业的工具。现在，对大多数设计师来说，最常用的工具是 <ruby>Adobe 全家桶<rt>Adobe Creative Suite</rt></ruby>。

但是，有时候使用开源工具能够帮您摆脱困境。比如，您正在使用一台公共打印机打印一份用 Adobe InDesign 创建的文件。这时，您需要对文件做一些简单的改动（比如，改正一个错别字），但您无法立刻使用 Adobe 套件。虽然这种情况很少见，但电子杂志制作软件 [Scribus][1] 和文本编辑器 [Gedit][2] 等开源工具可以节约您的时间。

在本文中，我将向您展示如何使用 Scribus 和 Gedit 编辑 Adobe InDesign 文件。请注意，还有许多其他开源平面设计软件可以用来代替 Adobe InDesign 或者结合使用。详情请查看我的文章：[昂贵的工具（从来！）不是平面设计的唯一选择][3] 以及 [两个开源 Adobe InDesign 脚本][4].

在编写本文的时候，我阅读了一些关于如何使用开源软件编辑 InDesign 文件的博客，但没有找到有用的文章。我尝试了两个解决方案。一个是：在 InDesign 创建一个 EPS 并在文本编辑器 Scribus 中将其以可编辑文件打开，但这不起作用。另一个是：从 InDesign 中创建一个 IDML（一种旧的 InDesign 文件格式）文件，并在 Scribus 中打开它。第二种方法效果更好，也是我在下文中使用的解决方法。

### 编辑名片

我尝试在 Scribus 中打开和编辑 InDesign 名片文件的效果很好。唯一的问题是字母间的间距有些偏移，以及我用倒过来的  ‘J’ 来创建 “Jeff” 中的 ‘f’ 被翻转。其他部分，像样式和颜色等都完好无损。

![Business card in Adobe InDesign][6]

*图：在 Adobe InDesign 中编辑名片。*

![InDesign IDML file opened in Scribus][8]

*图：在 Scribus 中打开 InDesign IDML 文件。*

### 删除带页码的书籍中的副本

书籍的转换并不顺利。书籍的正文还 OK，但当我用 Scribus 打开 InDesign 文件，目录、页脚和一些首字下沉的段落都出现问题。不过至少，它是一个可编辑的文档。其中一个问题是一些块引用中的文字变成了默认的 Arial 字体，这是因为字体样式（似乎来自其原始的 Word 文档）的优先级比段落样式高。这个问题容易解决。

![Book layout in InDesign][10]

*图：InDesign 中的书籍布局。*

![InDesign IDML file of book layout opened in Scribus][12]

*图：用 Scribus 打开 InDesign IDML 文件的书籍布局。*

当我试图选择并删除一页文本的时候，发生了奇异事件。我把光标放在文本中，按下 `Command + A`（“全选”的快捷键）。表面看起来高亮显示了一页文本，但事实并非如此！

![Selecting text in Scribus][14]

*图：Scribus 中被选中的文本。*

当我按下“删除”键，整个文本（不只是高亮的部分）都消失了。

![Both pages of text deleted in Scribus][16]

*图：两页文本都被删除了。*

然后，更奇异的事情发生了……我按下 `Command + Z` 键来撤回删除操作，文本恢复，但文本格式全乱套了。

![Undo delete restored the text, but with bad formatting.][18]

*图：Command+Z (撤回删除操作) 恢复了文本，但格式乱套了。*

### 用文本编辑器打开 InDesign 文件

当您用普通的记事本（比如，Mac 中的 TextEdit）分别打开 Scribus 文件和 InDesign 文件，会发现 Scribus 文件是可读的，而 InDesign 文件全是乱码。

您可以用 TextEdit 对两者进行更改并成功保存，但得到的文件是损坏的。下图是当我用 InDesign 打开编辑后的文件时的报错。

![InDesign error message][20]

*图：InDesign 的报错。*

我在 Ubuntu 系统上用文本编辑器 Gedit 编辑 Scribus 时得到了更好的结果。我从命令行启动了 Gedit，然后打开并编辑 Scribus 文件，保存后，再次使用 Scribus 打开文件时，我在 Gedit 中所做的更改都成功显示在 Scribus 中。

![Editing Scribus file in Gedit][22]

*图：用 Gedit 编辑 Scribus 文件。*

![Result of the Gedit edit in Scribus][24]

*图：用 Scribus 打开 Gedit 编辑过的文件。*

当您正准备打印的时候，客户打来电话说有一个错别字需要更改，此时您不需要苦等客户爸爸发来新的文件，只需要用 Gedit 打开 Scribus 文件，改正错别字，继续打印。

### 把图像拖拽到 ID 文件中

我将 InDesign 文档另存为 IDML 文件，这样我就可以用 Scribus 往其中拖进一些 PDF 文档。似乎 Scribus 并不能像 InDesign 一样把 PDF 文档拖拽进去。于是，我把 PDF 文档转换成 JPG 格式的图片然后导入到 Scribus 中，成功了。但这么做的结果是，将 IDML 文档转换成 PDF 格式后，文件大小非常大。

![Huge PDF file][26]

*图：把 Scribus 转换成 PDF 时得到一个非常大的文件*。

我不确定为什么会这样——这个坑留着以后再填吧。

您是否有使用开源软件编辑平面图形文件的技巧？如果有，请在评论中分享哦。

------

via: https://opensource.com/article/18/7/adobe-indesign-open-source-tools

作者：[Jeff Macharyas][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[XiatianSummer](https://github.com/XiatianSummer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rikki-endsley
[1]: https://www.scribus.net/
[2]: https://wiki.gnome.org/Apps/Gedit
[3]: https://opensource.com/life/16/8/open-source-alternatives-graphic-design
[4]: https://opensource.com/article/17/3/scripts-adobe-indesign
[5]: /file/402516
[6]: https://opensource.com/sites/default/files/uploads/1-business_card_designed_in_adobe_indesign_cc.png "Business card in Adobe InDesign"
[7]: /file/402521
[8]: https://opensource.com/sites/default/files/uploads/2-indesign_.idml_file_opened_in_scribus.png "InDesign IDML file opened in Scribus"
[9]: /file/402531
[10]: https://opensource.com/sites/default/files/uploads/3-book_layout_in_indesign.png "Book layout in InDesign"
[11]: /file/402536
[12]: https://opensource.com/sites/default/files/uploads/4-indesign_.idml_file_of_book_opened_in_scribus.png "InDesign IDML file of book layout opened in Scribus"
[13]: /file/402541
[14]: https://opensource.com/sites/default/files/uploads/5-command-a_in_the_scribus_file.png "Selecting text in Scribus"
[15]: /file/402546
[16]: https://opensource.com/sites/default/files/uploads/6-deleted_text_in_scribus.png "Both pages of text deleted in Scribus"
[17]: /file/402551
[18]: https://opensource.com/sites/default/files/uploads/7-command-z_in_scribus.png "Undo delete restored the text, but with bad formatting."
[19]: /file/402556
[20]: https://opensource.com/sites/default/files/uploads/8-indesign_error_message.png "InDesign error message"
[21]: /file/402561
[22]: https://opensource.com/sites/default/files/uploads/9-scribus_edited_in_gedit_on_linux.png "Editing Scribus file in Gedit"
[23]: /file/402566
[24]: https://opensource.com/sites/default/files/uploads/10-scribus_opens_after_gedit_changes.png "Result of the Gedit edit in Scribus"
[25]: /file/402571
[26]: https://opensource.com/sites/default/files/uploads/11-large_pdf_size.png "Huge PDF file"

