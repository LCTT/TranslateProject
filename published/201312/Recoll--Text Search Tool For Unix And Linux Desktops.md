Recoll:Unix和Linux桌面的文本搜索工具
===
[Recoll][1]是一个Unix和Linux桌面的文本搜索工具。Recoll可以搜索文件名和文件内的关键字。

Recoll可以为你做到以下这些。
 
 - 它可以搜索任何格式的文件
 - 支持通配符
 - 可以依据文件的作者、类型、大小和格式等条件进行搜索
 - 可以搜索存储在任何位置的文件，例如文件、归档文件、邮件附件等
 - 支持桌面和网站集成
 - 具备火狐插件，可索引web页的历史
 - 点击一下搜索结果就可以在本地编辑器内打开或者显示文本预览
 - 它是免费的开源的，在GPL许可下发布

###在Ubuntu/Linux Mint上安装Recoll

Recoll在Ubuntu仓库里可以找到。然而，最好添加Recoll的仓库以便安装最新版本。

使用以下命令添加Recoll仓库：

	sudo add-apt-repository

使用命令更新软件列表：

	sudo apt-get update

现在就可以使用下面的命令安装Recoll。

    sudo apt-get install recoll

对于其它的发行版，可以去[下载页面][2]下载源代码并编译安装。

###启动Recoll

Recoll可以从Dash或者菜单中启动。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Menu_0014.jpg)

第一次启动时，你需要索引整个home目录。依据你 home 目录里储存的东西的多少,需要的时间不等。按下**Start indexing now**按钮开始索引。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Recoll_002.jpg)

假如你想更多的自定义索引，可以调整索引配置和索引计划。要做到这一点，只需要点击一下**Indexing configuration**或者**Indexing schedule**链接。假如你要稍后再去配置，你可以在Preferences(首选项)菜单里配置这些选项。

一旦索引完成，你就可以搜索文件/文件夹了。结果将根据相关性展现，并显示匹配的一小部分内容。

###配置

正如上面提到的，假如你想更多的控制索引的细节，你可以调节Recoll的索引功能。
在Recoll的工具中有两个配置项

1. 索引配置
2. 索引计划

让我们来看一下上面这两个的简短描述。

**索引配置**可以让你索引时决定包含哪些目录以及排除哪些目录。默认情况下索引时将包含整个home目录。你可以在这儿从索引中添加或移除目录。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/home-sk-.recoll-_003.jpg)

你也可以定义web历史队列以及储存web页面的最大容量。

**index schedule**则是可以让制定一个计划以便于进行自动索引或者当你登陆系统后就进行实时索引。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Index-scheduling-setup_004.jpg)

Recoll支持两种索引计划：

**Cron任务** - 决定什么时候开始运行以及写入Crontab键值。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Cron-Dialog_006.jpg)

以上这个屏幕截图中，Recoll的cron任务会在每天上午12点的时候执行。设置完cron任务后，点击enable键激活它就可以咯。

**启动时实时索引** - 决定是否当你登陆入系统时进行实时索引。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Real-time-indexing-automatic-start_007.jpg)

激活这一选项，recoll的守护程序都会随系统启动。要注意的是这一选项只有在默认索引设置的情况下才可用。

###基本搜索

现在你已经对Recoll了解的足够多了。是时候去搜索一下文件或者文件夹了。这个应用的美妙之处就在于它既可以搜索文件名还可以搜索文件内的关键词。

在Recoll的用户界面中，在顶部右边的搜索栏中键入要搜索的关键字，然后点击Search按钮。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Recoll_008.jpg)

如你在上图所见，精确相关的内容将会显示还能预览到一小部分内容。你可以点击Open按钮直接打开搜索到的文件，或者在打开它之前使用预览按钮预览它。

你还可以过滤搜索结果，使用分类例如媒体、消息、其它、演示文档、电子表格或者文本等。更重要的是，你还可以选择匹配任一项、全部项、文件名或者语言等的搜索结果。

###高级搜索

点击菜单栏中的高级搜索图标或者前往**Tools->Advanced Search**。这将打开一个新的对话窗口。在这儿你可以附加更多的限制条件来进行搜索。例如我可以搜索文件内容里含有关键字“hp”以及文件名含有“storage”的文件。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Recoll_008.jpg)

这将找到并显示文件内含有关键字“hp”且文件名含有“storage”的文件。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Recoll_012.jpg)

###Unity桌面以及网站集成

这个应用支持桌面集成以及网站集成。假如你要把它集成到你的Ubuntu的Unity桌面中去，你可以用下面的命令安装**recoll-lens**。

	sudo apt-get install recoll-lens

请注意，lens限制显示结果最多显示20条。假如你要显示更多数目的搜索结果，编辑**rclsearch.py**，修改“**if actual_results >= 20:**”这一行就可以咯。

假如你使用火狐浏览器，要去搜索你每天访问的浏览历史，你可以使用这个[火狐扩展][3]。这个火狐扩展可以和Recoll一起工作去索引你全天浏览的网站。在安装完这个扩展之后，在Recoll的索引配置中从web历史标签页中激活它就可以咯。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/home-sk-.recoll-_013.jpg)

所有的Linux都在他们的文件管理器中内建了搜索功能，以便于尽可能容易的搜索文件/文件夹。对于那些不满足于内置搜索功能并想寻找更高级文本搜索工具的人来说，Recoll是个值得一试的工具。我认为，这真是个容易使用且功能强大的工具，对基本搜索如此，对高级搜索也是如此.

欢呼吧！

如有问题，请参考我们的Q/A论坛 : http://ask.unixmen.com/ 。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/recoll-text-searching-tool-linux-desktops/

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.recoll.org/
[2]:http://www.lesbonscomptes.com/recoll/download.html
[3]:http://sourceforge.net/projects/recollfirefox/