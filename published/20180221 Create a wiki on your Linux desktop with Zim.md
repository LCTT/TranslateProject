使用 Zim 在你的 Linux 桌面上创建一个维基
======

> 用强大而小巧的 Zim 在桌面上像维基一样管理信息。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_bees_network.png?itok=NFNRQpJi)

不可否认<ruby>维基<rt>wiki</rt></ruby>的用处，即使对于一个极客来说也是如此。你可以用它做很多事——写笔记和手稿，协作项目，建立完整的网站。还有更多的事。

这些年来，我已经使用了几个维基，要么是为了我自己的工作，要么就是为了我接到的各种合同和全职工作。虽然传统的维基很好，但我真的喜欢[桌面版维基][1] 这个想法。它们体积小，易于安装和维护，甚至更容易使用。而且，正如你可能猜到的那样，有许多可以用在 Linux 中的桌面版维基。

让我们来看看更好的桌面版的 维基 之一： [Zim][2]。

### 开始吧

你可以从 Zim 的官网[下载][3]并安装 Zim，或者通过发行版的软件包管理器轻松地安装。

安装好了 Zim，就启动它。

在 Zim 中的一个关键概念是<ruby>笔记本<rt>notebook</rt></ruby>，它们就像某个单一主题的维基页面的集合。当你第一次启动 Zim 时，它要求你为你的笔记本指定一个文件夹和笔记本的名称。Zim 建议用 `Notes` 来表示文件夹的名称和指定文件夹为 `~/Notebooks/`。如果你愿意，你可以改变它。我是这么做的。

![](https://opensource.com/sites/default/files/u128651/zim1.png)

在为笔记本设置好名称和指定好文件夹后，单击 “OK” 。你得到的本质上是你的维基页面的容器。

![](https://opensource.com/sites/default/files/u128651/zim2.png)

### 将页面添加到笔记本

所以你有了一个容器。那现在怎么办？你应该开始往里面添加页面。当然，为此，选择 “File > New Page”。

![](https://opensource.com/sites/default/files/u128651/zim3.png)

输入该页面的名称，然后单击 “OK”。从那里开始，你可以开始输入信息以向该页面添加信息。

![](https://opensource.com/sites/default/files/u128651/zim4.png)

这一页可以是你想要的任何内容：你正在选修的课程的笔记、一本书或者一片文章或论文的大纲，或者是你的书的清单。这取决于你。

Zim 有一些格式化的选项，其中包括：

  * 标题
  * 字符格式
  * 圆点和编号清单
  * 核对清单

你可以添加图片和附加文件到你的维基页面，甚至可以从文本文件中提取文本。

### Zim 的维基语法

你可以使用工具栏向一个页面添加格式。但这不是唯一的方法。如果你像我一样是个老派人士，你可以使用维基标记来进行格式化。

[Zim 的标记][4] 是基于在 [DokuWiki][5] 中使用的标记。它本质上是有一些小变化的 [WikiText][6] 。例如，要创建一个子弹列表，输入一个星号（`*`）。用两个星号包围一个单词或短语来使它加黑。

### 添加链接

如果你在笔记本上有一些页面，很容易将它们联系起来。有两种方法可以做到这一点。

第一种方法是使用 [驼峰命名法][7] 来命名这些页面。假设我有个叫做 “Course Notes” 的笔记本。我可以通过输入 “AnalysisCourse” 来重命名为我正在学习的数据分析课程。 当我想从笔记本的另一个页面链接到它时，我只需要输入 “AnalysisCourse” 然后按下空格键。即时超链接。

第二种方法是点击工具栏上的 “Insert link” 按钮。 在 “Link to” 中输入你想要链接到的页面的名称，从显示的列表中选择它，然后点击 “Link”。

![](https://opensource.com/sites/default/files/u128651/zim5.png)

我只能在同一个笔记本中的页面之间进行链接。每当我试图连接到另一个笔记本中的一个页面时，这个文件（有 .txt 的后缀名）总是在文本编辑器中被打开。

### 输出你的维基页面

也许有一天你会想在别的地方使用笔记本上的信息 —— 比如，在一份文件或网页上。你可以将笔记本页面导出到以下格式中的任何一种。而不是复制和粘贴（和丢失格式）：

* HTML
* LaTeX
* Markdown
* ReStructuredText

为此，点击你想要导出的维基页面。然后，选择 “File > Export”。决定是要导出整个笔记本还是一个页面，然后点击 “Forward”。

![](https://opensource.com/sites/default/files/u128651/zim6.png)

选择要用来保存页面或笔记本的文件格式。使用 HTML 和 LaTeX，你可以选择一个模板。 随便看看什么最适合你。 例如，如果你想把你的维基页面变成 HTML 演示幻灯片，你可以在 “Template” 中选择 “SlideShow s5”。 如果你想知道，这会产生由 [S5 幻灯片框架][8]驱动的幻灯片。

![](https://opensource.com/sites/default/files/u128651/zim7.png)

点击 “Forward”，如果你在导出一个笔记本，你可以选择将页面作为单个文件或一个文件导出。 你还可以指向要保存导出文件的文件夹。

![](https://opensource.com/sites/default/files/u128651/zim8.png)

### Zim 能做的就这些吗？

远远不止这些，还有一些 [插件][9] 可以扩展它的功能。它甚至包含一个内置的 Web 服务器，可以让你将你的笔记本作为静态的 HTML 文件。这对于在内部网络上分享你的页面和笔记本是非常有用的。

总的来说，Zim 是一个用来管理你的信息的强大而又紧凑的工具。这是我使用过的最好的桌面版维基，而且我一直在使用它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/create-wiki-your-linux-desktop-zim

作者：[Scott Nesbitt][a]
译者：[Auk7F7](https://github.com/Auk7F7)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/article/17/2/3-desktop-wikis
[2]:http://zim-wiki.org/
[3]:http://zim-wiki.org/downloads.html
[4]:http://zim-wiki.org/manual/Help/Wiki_Syntax.html
[5]:https://www.dokuwiki.org/wiki:syntax
[6]:http://en.wikipedia.org/wiki/Wikilink
[7]:https://en.wikipedia.org/wiki/Camel_case
[8]:https://meyerweb.com/eric/tools/s5/
[9]:http://zim-wiki.org/manual/Plugins.html
