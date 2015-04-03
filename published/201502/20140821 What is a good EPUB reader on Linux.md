Linux版EPUB阅读器
================================================================================

如果说用平板电脑看书尚属主流的话，那么在电脑上读书就非常少见了。专注阅读16世纪的书是非常困难的了，没人希望后台蹦出QQ聊天窗口。但是如果你非要在电脑上打开电子书的话，那么你需要一个电子书阅读软件。大多数出版物支持使用EPUB格式的电子书（电子出版物）。幸运的是，linux上从不缺乏EPUB阅读器类的软件。以下是一些Linux上不错的EPUB阅读软件。

### 1. Calibre ###

![](https://farm6.staticflickr.com/5577/14975176155_0989766bb3_z.jpg)

先从列表中最有名的软件开始： [Calibre][1]。Calibre 不仅仅是个阅读器，它还是个电子图书馆。软件支持几乎所有的格式，集成了阅读器、管理器、一个可以从互联网下载书籍封面的元数据编辑器、一个EPUB编辑器、新闻阅读器和一个用来下载电子书的搜索引擎。可喜的是，界面丝毫不逊色专业的阅读软件。唯一的缺点是如果你只想要一个EPUB阅读器的话，这个软件还是太大了。

### 2. FBReader ###

![](https://farm4.staticflickr.com/3900/14975176165_f2e4afd2fa_o.jpg)

[FBReader][2] 也是一个图书馆管理软件，但是比Calibre小。界面简洁分为两个部分：左边是文件管理、元数据编辑和下载新书等功能；右边是阅读区。如果你喜欢简洁，这个软件挺不错。我个人非常喜欢这类直观标记书籍和分类的做法。

### 3. Cool Reader ###

![](https://farm6.staticflickr.com/5594/14975176195_ac46952150.jpg)

对于那些只想想看EPUB书内容的用户，我推荐 [Cool Reader][5]。遵循Linux应用程序的文化，Cool Reader 做了优化，每次只打开一个EPUB文件，可以使用简单的快捷键进行阅读和导航。由于程序书基于Qt开发的，所以他也遵循Qt的风格，需要大量的设置项。

### 4. Okular ###

![](https://farm6.staticflickr.com/5559/14788504729_5a2ec2c11b_z.jpg)

除了Qt应用程序，如果安装了EPUB库的话，KDE的文档阅读器[Okular][3] 也能打开EPUB文件。尽管如此，如果你不是个KDE用户的话，不推荐这个软件。

### 5. pPub ###

![](https://farm4.staticflickr.com/3835/14788504789_e7c742fa20_z.jpg)

[pPub][4]是个老项目，Github上可以找到这个项目，它最后的更新已经是在两年前了。尽管如此，这个软件还是值得使用的，pPub是用Python编写的，基于GTK3和WebKit，是个简单轻量的软件。界面可能需要一些更新，不够简洁，但是内部却非常好。软件支持JavaScript。所以，谁来捡起这个项目呢？

### 6. epub ###

![](https://farm4.staticflickr.com/3871/14788844378_16fb51a1b9_z.jpg)

如果你只是想快速简单的查看EPUB文件的内容，不关心任何图形化界面功能的话，最好使用命令行模式打开EPUB。[epub][6] 是一个用Python编写的阅读器，可以在终端环境读取EPUB文件的内容。软件可以在章节、页面间切换，没有其他的功能。这是最简洁的EPUB阅读器了。

### 7. Sigil ###

![](https://farm4.staticflickr.com/3921/14788640417_7940627871_z.jpg)

最后介绍的这个实际上不是个EPUB阅读器，应该是个独立的编辑器。[Sigil][7] 可以提取EPUB文件的内容并将其分离成其他格式：xhtml文本、图像、css，及其他的内容比如音频等。界面比基本的阅读器复杂，但是功能还是比较丰富的。我很喜它的标签体系，如果你对网页比较熟悉的话，这个软件是很好使用的。

总结，有很多的开源的EPUB阅读器，有一些只有最基本的功能， 另外一些功能却太多了。一般来说，我建议你选择一个最合适的使用。如果你有更好的EPUB阅读器，请在评论里告诉我们！

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/good-epub-reader-linux.html

作者：[Adrien Brochard][a]
译者：[shipsw](https://github.com/shipsw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://calibre-ebook.com/
[2]:http://fbreader.org/
[3]:http://okular.kde.org/
[4]:https://github.com/sakisds/pPub
[5]:http://crengine.sourceforge.net/
[6]:https://github.com/rupa/epub
[7]:https://github.com/user-none/Sigil
