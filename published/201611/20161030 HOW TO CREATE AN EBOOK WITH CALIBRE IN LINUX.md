完整指南：在 Linux 上使用 Calibre 创建电子书
====

[![Guide to create an eBoook in Linux with Calibre](https://itsfoss.com/wp-content/uploads/2016/10/Create-an-eBook-in-Linux.jpg)][8]

摘要：这份初学者指南是告诉你如何在 Linux 上用 Calibre 工具快速创建一本电子书。

自从 Amazon（亚马逊）在多年前开始销售电子书，电子书已经有了质的飞跃发展并且变得越来越流行。好消息是电子书非常容易使用自由开源的工具来被创建。

在这个教程中，我会告诉你如何在 Linux 上创建一本电子书。

### 在 Linux 上创建一本电子书

要创建一本电子书，你可能需要两个软件：一个文本处理器（当然，我使用的是 [LibreOffice][7]）和 Calibre 。[Calibre][6] 是一个非常优秀的电子书阅读器，也是一个电子书库的程序。你可以使用它来[在 Linux 上打开 ePub 文件][5]或者管理你收集的电子书。（LCTT 译注：LibreOffice 是 Linux 上用来处理文本的软件，类似于 Windows 的 Office 软件)

除了这些软件之外，你还需要准备一个电子书封面（1410×2250）和你的原稿。

### 第一步

首先，你需要用你的文本处理器程序打开你的原稿。 Calibre 可以自动的为你创建一个书籍目录。要使用到这个功能，你需要在你的原稿中设置每一章的标题样式为 Heading 1，在 LibreOffice 中要做到这个只需要高亮标题并且在段落样式下拉框中选择“Heading 1”即可。

![ebook creation with Calibre](https://itsfoss.com/wp-content/uploads/2016/10/header1.png)

如果你想要有子章节，并且希望他们也被加入到目录中，只需要设置这些子章节的标题为 Heading 2。

做完这些之后，保存你的文档为 HTML 格式文件。

### 第二步

在 Calibre 程序里面，点击“添加书籍（Add books）”按钮。在对话框出现后，你可以打开你刚刚存储的 HTML 格式文件，将它加入到 Calibre 中。

![create ebooks with Calibre](https://itsfoss.com/wp-content/uploads/2016/10/calibre1.png)

### 第三步

一旦这个 HTML 文件加入到 Calibre 库中，选择这个新文件并且点击“编辑元数据（Edit Metadata）”按钮。在这里，你可以添加下面的这些信息：标题（Title)、 作者（Author）、封面图片（cover image）、 描述（description）和其它的一些信息。当你填完之后，点击“Ok”。

![creating ebooks with Calibre in Linux](https://itsfoss.com/wp-content/uploads/2016/10/calibre2.png)

### 第四步

现在点击“转换书籍（Covert books）”按钮。

在新的窗口中，这里会有一些可选项，但是你不会需要使用它们。

![creating ebooks with Calibre in Linux -2](https://itsfoss.com/wp-content/uploads/2016/10/calibre3.png)

在新窗口的右上部选择框中，选择 epub 文件格式。Calibre 也有创建 mobi 文件格式的其它选项，但是我发现创建那些文件之后经常出现我意料之外的事情。

![creating ebooks with Calibre in Linux -3](https://itsfoss.com/wp-content/uploads/2016/10/calibre4.png)

### 第五步

在左边新的对话框中，点击“外观（Look & Feel）”。然后勾选中“移除段落间空白（Remove spacing between paragraphs）”

![creating ebooks with Calibre in Linux - 4](https://itsfoss.com/wp-content/uploads/2016/10/calibre5.png)

接下来，我们会创建一个内容目录。如果不打算在你的书中使用目录，你可以跳过这个步骤。选中“内容目录(Table of Contents）”标签。接下来，点击“一级目录（Level 1 TOC (XPath expression））”右边的魔术棒图标。

![creating ebooks with Calibre in Linux - 5](https://itsfoss.com/wp-content/uploads/2016/10/calibre6.png)

在这个新的窗口中，在“匹配 HTML 标签（Match HTML tags with tag name）”下的下拉菜单中选择“h1”。点击“OK” 来关闭这个窗口。如果你有子章节，在“二级目录（Level 2 TOC (XPath expression)）”下选择“h2”。

![creating ebooks with Calibre in Linux - 6](https://itsfoss.com/wp-content/uploads/2016/10/calibre7.png)

在我们开始生成电子书前，选择输出 EPUB 文件。在这个新的页面，选择“插入目录（Insert inline Table of Contents）”选项。

![creating ebooks with Calibre in Linux - 7](https://itsfoss.com/wp-content/uploads/2016/10/calibre8.png)

现在你需要做的是点击“OK”来开始生成电子书。除非你的是一个大文件，否则生成电子书的过程一般都完成的很快。

到此为止，你就已经创建一本电子书了。

对一些特别的用户比如他们知道如何写 CSS 样式文件（LCTT 译注：CSS 文件可以用来美化 HTML 页面)，Calibre 给了这类用户一个选项来为文章增加 CSS 样式。只需要回到“外观（Look & Feel）”部分，选择“风格（styling）”标签选项。但如果你想创建一个 mobi 格式的文件，因为一些原因，它是不能接受 CSS 样式文件的。

![creating ebooks with Calibre in Linux - 8](https://itsfoss.com/wp-content/uploads/2016/10/calibre9.png)

好了，是不是感到非常容易？我希望这个教程可以帮助你在 Linux 上创建电子书。

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-ebook-calibre-linux/

作者：[John Paul][a]
译者：[chenzhijun](https://github.com/chenzhijun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:http://pinterest.com/pin/create/button/?url=https://itsfoss.com/create-ebook-calibre-linux/&description=How+To+Create+An+Ebook+With+Calibre+In+Linux+%5BComplete+Guide%5D&media=https://itsfoss.com/wp-content/uploads/2016/10/Create-an-eBook-in-Linux.jpg
[2]:https://www.linkedin.com/cws/share?url=https://itsfoss.com/create-ebook-calibre-linux/
[3]:https://twitter.com/share?original_referer=https%3A%2F%2Fitsfoss.com%2F&source=tweetbutton&text=How+To+Create+An+Ebook+With+Calibre+In+Linux+%5BComplete+Guide%5D&url=https%3A%2F%2Fitsfoss.com%2Fcreate-ebook-calibre-linux%2F&via=%40itsfoss
[4]:https://itsfoss.com/fix-updater-issue-pear-os-8/
[5]:https://itsfoss.com/open-epub-books-ubuntu-linux/
[6]:http://calibre-ebook.com/
[7]:https://www.libreoffice.org/
[8]:https://itsfoss.com/wp-content/uploads/2016/10/Create-an-eBook-in-Linux.jpg
