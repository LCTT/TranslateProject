在Ubuntu14.04上安装UberWriterMarkdown编辑器
================================================================================
这是一篇快速教程指导我们如何通过官方的PPA源在Ubuntu14.04上安装UberWriter编辑器。

[UberWriter][1]是一款Ubuntu下的Markdown编辑器，它简洁的界面能让我们更致力于编辑文字。UberWriter利用了[pandoc][3](一个格式转换器)。但由于UberWriter的UI是基于GTK3的，因此不能完全兼容Unity桌面系统。以下是对UberWriter功能的列举：

- 简洁的界面
- 使用pandoc转换markdown
- 可预览
- 免打扰模式
- 拼写检查
- 语法高亮，能在html和pdf中出现数学公式
- 支持导出到PDF，HTML，ODT等

### 在Ubuntu14.04上安装UberWriter ###

UberWriter可以在[Ubuntu软件中心][4]中找到但是安装需要支付5刀。如果你真的喜欢这款编辑器并想为开发者提供一些资金支持的话，我很建议你购买它。

除此之外，UberWriter也能通过官方的PPA源来免费安装。通过如下命令：

    sudo add-apt-repository ppa:w-vollprecht/ppa
    sudo apt-get update
    sudo apt-get install uberwriter

安装完毕之后，你可以通过Unity的Dash运行使用。如你所见，它支持markdown的语法高亮:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/UberWriter_Ubuntu.jpeg)

你可以使用预览功能来查看你的文档：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/UberWriter_Ubuntu_1.jpeg)

我尝试导出到PDF的时候被提示安装texlive。 

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/UberWriter_Ubuntu_PDF_Export.png)

虽然导出到HTML和ODT格式是好的。

在Linux下还有一些其他的markdown编辑器。[Remarkable][5]是一款能够实时预览的编辑器，UberWriter却不能，不过总的来说它是一款很不错的应用。如果你在寻找文本编辑器的话，你可以试试[Texmaker LaTeX editor][6]。

系统这个教程能够帮你在Ubuntu14.04上成功安装UberWriter。我猜想UberWriter在Ubuntu12.04，Linux Mint 17，Elementary OS和其他在Ubuntu的基础上的Linux发行版上也能成功安装。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-uberwriter-markdown-editor-ubuntu-1404/

作者：[Abhishek][a]
译者：[John](https://github.com/johnhoow)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://uberwriter.wolfvollprecht.de/
[2]:http://en.wikipedia.org/wiki/Markdown
[3]:http://johnmacfarlane.net/pandoc/
[4]:apt://uberwriter
[5]:http://itsfoss.com/remarkable-markdown-editor-linux/
[6]:http://itsfoss.com/install-latex-ubuntu-1404/
