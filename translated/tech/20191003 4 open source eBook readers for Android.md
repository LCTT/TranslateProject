[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12826-1.html)
[#]: subject: (4 open source eBook readers for Android)
[#]: via: (https://opensource.com/article/19/10/open-source-ereaders-android)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

四款安卓开源电子书阅读器
======

> 你在寻找新的电子书阅读软件吗？来看看这四款适用于安卓的可靠的开源电子书阅读器吧。

![](https://img.linux.net.cn/data/attachment/album/202011/16/135728ayhh1aiqwrva50zy.jpg)

谁不想有一个好的阅读体验？与其将时间浪费在社交媒体或[即时消息软件][2]上，不如在自己的安卓手机或平板上阅读一本书、杂志或其他文档。

要做到这一点，你需要的是一个适合的电子书阅读软件。接下来让我们来看一看四款可靠的、开源安卓电子书阅读器。

### Book Reader

那我们先从我最喜欢的一款开源安卓电子书阅读器开始：[Book Reader][3]。它基于现在专有的 FBReader 应用的开源老版本。像 FBReader 的早期版本一样，Book Reader 小而简单，但是好用。

**优点：**

  * 易于操作。
  * 该应用界面遵循安卓的 [Material Design 指南][4]，因此非常干净。
  * 你可以为电子书添加书签，并将文本分享至你设备上的其他应用。
  * 不断提供除英语外的其他语言的支持。

**缺点**

  * Book Reader 的自定义选项较少。
  * 没有内置词典或支持外部词典的功能。

**支持的电子书格式：**

Book Reader 支持 EPUB、.mobi、PDF、[DjVu][5]、HTML、纯文本、 Word 文档、RTF 和 [FictionBook][6]。

![Book Reader Android app][7]

Book Reader 的源码在 GNU GPL 3.0 下授权，你可以在[GitLab][8]中找到它。

### Cool Reader

[Cool Reader][9] 是一个灵活易用的电子书软件。虽然我觉得该软件的图标会让想起 Windows vista 中的图标，但它确实有一些好用的功能。

**优点**

  * 高度自定义，你可以更改字体、行宽、段间距、连字符、字体大小、页边距以及背景色。
  * 你可以覆盖书中的样式表。我发现这对于两三本将所有文本设置为小写字母的书很有用。
  * 它会在设备启动时自动搜寻设备中的新书资源。你也可以查阅[古腾堡计划][10]和[互联网档案馆][11]中的书籍。

**缺点**

  * Cool Reader 的界面并不是极简或者说最现代化的。
  * 虽然它开箱即用，但实际上你需要调整一些配置来更舒适地使用 Cool Reader。
  * 应用的默认词典是专有的，尽管你可以用[开源的词典][12]来替换掉它。

**支持的电子书格式：**

你可以使用 Cool Reader 来浏览 EPUB、小说、纯文本、RTF、HTML、[CHM][13] 和 TCR（Psion 系列掌上电脑的电子书格式）文件。

![Cool Reader Android app][14]

Cool Reader 的源码在 GNU GPL 2 下授权，你可以在 [Sourceforge][15] 中找到它。

### KOReader

[KOReader][16] 最初是为了 [E Ink][17] 电子书阅读器创建的，但后来发现它可用于安卓。在测试它时，我发现 KOReader 在同等程度下既有用又令人沮丧。很明显它绝不是一款不好的应用，但不会是我的首选。

**优点**

  * 高度自定义。
  * 支持多种语言。
  * 它允许你使用[词典][18]（若你已安装）或者 Wikipedia（若你已连接至网络）来查单词。

**缺点**

  * 每一本书你都需要改变设置。在你打开一本新书时，KOReader 不会记住相关设置
  * 它的界面会让人觉得是一款专门的电子书阅读器。该应用没有安卓的外形和感受。

**支持的电子书格式：**

你可以查阅 PDF、DjVu、CBT、以及 [CBZ][5] 电子书。它也支持 EPUB、小说、.mobi、Word 文档、文本文件和 [CHM][13] 文件。

![KOReader Android app][19]

Cool Reader 的源码在 GNU Affero GPL 3.0 下授权，你可以在 [GitHub][20] 上找到它。

### Booky McBookface

是的，这确实是[这款电子书阅读器][21]的名字。它是这篇文章中最基础的电子书阅读器，但不要因此（或者这个傻乎乎的名字）使你失望。Booky McBookface 易于使用，并且有一件事它做的很好。

**优点**

  * 没有多余的装饰。只有你和你的电子书。
  * 界面简洁。
  * 在安卓启动栏中的长按软件图标会弹出一个菜单，你可以从中打开正在阅读的最后一本书、获得未读书籍的列表、或者查找并打开设备上的一本书。

**缺点**

  * 软件中几乎没有配置选项——你可以更改字体大小和亮度，仅此而已。
  * 你需要使用屏幕底部的按钮浏览电子书。点击屏幕边缘无法操作。
  * 无法为电子书添加书签。

**支持的电子书格式**

你可以使用该软件阅读 EPUB 格式、HTML 文档，或纯文本格式的电子书。

![Booky McBookface Android app][22]

Booky McBookface 的源码在 GNU GPL 3.0 下授权，你可以在 [GitHub][23] 中找到它。

你有最喜欢的安卓开源电子书阅读器吗？在社区中留言分享一下吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/open-source-ereaders-android

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[chenmu-kk](https://github.com/chenmu-kk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_browser_program_books_read.jpg?itok=iNMWe8Bu (Computer browser with books on the screen)
[2]: https://opensource.com/article/19/3/open-messenger-client
[3]: https://f-droid.org/en/packages/com.github.axet.bookreader/
[4]: https://material.io/design/
[5]: https://opensource.com/article/19/3/comic-book-archive-djvu
[6]: https://en.wikipedia.org/wiki/FictionBook
[7]: https://opensource.com/sites/default/files/uploads/book_reader-book-list.png (Book Reader Android app)
[8]: https://gitlab.com/axet/android-book-reader/tree/HEAD
[9]: https://f-droid.org/en/packages/org.coolreader/
[10]: https://www.gutenberg.org/
[11]: https://archive.org
[12]: http://aarddict.org/
[13]: https://fileinfo.com/extension/chm
[14]: https://opensource.com/sites/default/files/uploads/cool_reader-icons.png (Cool Reader Android app)
[15]: https://sourceforge.net/projects/crengine/
[16]: https://f-droid.org/en/packages/org.koreader.launcher/
[17]: https://en.wikipedia.org/wiki/E_Ink
[18]: https://github.com/koreader/koreader/wiki/Dictionary-support
[19]: https://opensource.com/sites/default/files/uploads/koreader-lookup.png (KOReader Android app)
[20]: https://github.com/koreader/koreader
[21]: https://f-droid.org/en/packages/com.quaap.bookymcbookface/
[22]: https://opensource.com/sites/default/files/uploads/booky_mcbookface-menu.png (Booky McBookface Android app)
[23]: https://github.com/quaap/BookyMcBookface
