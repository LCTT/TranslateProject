Linux中通过命令行监控股票报价
================================================================================

如果你是那些股票投资者或者交易者中的一员，那么监控证券市场将是你的日常工作之一。最有可能的是你会使用一个在线交易平台，这个平台有着一些漂亮的实时图表和全部种类的高级股票分析和交易工具。虽然这种复杂的市场研究工具是任何严肃的证券投资者了解市场的必备工具，但是监控最新的股票报价来构建有利可图的投资组合仍然有很长一段路要走。

如果你是一位长久坐在终端前的全职系统管理员，而证券交易又成了你日常生活中的业余兴趣，那么一个简单地显示实时股票报价的命令行工具会是给你的恩赐。

在本教程中，让我来介绍一个灵巧而简洁的命令行工具，它可以让你在Linux上从命令行监控股票报价。

这个工具叫做[Mop][1]。它是用GO编写的一个轻量级命令行工具，可以极其方便地跟踪来自美国市场的最新股票报价。你可以很轻松地自定义要监控的证券列表，它会在一个基于ncurses的便于阅读的界面显示最新的股票报价。

**注意**：Mop是通过雅虎金融API获取最新的股票报价的。你必须意识到，他们的的股票报价已知会有15分钟的延时。所以，如果你正在寻找0延时的“实时”股票报价，那么Mop就不是你的菜了。这种“现场”股票报价订阅通常可以通过向一些不开放的私有接口付费获取。了解这些之后，让我们来看看怎样在Linux环境下使用Mop吧。

### 安装 Mop 到 Linux ###

由于Mop是用Go实现的，你首先需要安装Go语言。如果你还没有安装Go，请参照[此指南][2]将Go安装到你的Linux平台中。请确保按指南中所讲的设置GOPATH环境变量。

安装完Go后，继续像下面这样安装Mop。

**Debian，Ubuntu 或 Linux Mint**

    $ sudo apt-get install git
    $ go get github.com/michaeldv/mop
    $ cd $GOPATH/src/github.com/michaeldv/mop
    $ make install

**Fedora，CentOS，RHEL**

    $ sudo yum install git
    $ go get github.com/michaeldv/mop
    $ cd $GOPATH/src/github.com/michaeldv/mop
    $ make install

上述命令将安装Mop到$GOPATH/bin。

现在，编辑你的.bashrc，将$GOPATH/bin写到你的PATH变量中。

    export PATH="$PATH:$GOPATH/bin"

----------

    $ source ~/.bashrc 

### 使用Mop来通过命令行监控股票报价 ###

要启动Mop，只需运行名为cmd的命令（LCTT 译注：这名字实在是……）。

    $ cmd 

首次启动，你将看到一些Mop预配置的证券行情自动收录器。

![](https://farm6.staticflickr.com/5749/20018949104_c8c64e0e06_c.jpg)

报价显示了像最新价格、交易百分比、每日低/高、52周低/高、股息以及年收益率等信息。Mop从[CNN][3]获取市场总览信息，从[雅虎金融][4]获得个股报价，股票报价信息它自己会在终端内周期性更新。

### 自定义Mop中的股票报价 ###

让我们来试试自定义证券列表吧。对此，Mop提供了易于记忆的快捷键：‘+’用于添加一只新股，而‘-’则用于移除一只股票。

要添加新股，请按‘+’，然后输入股票代码来添加（如MSFT）。你可以通过输入一个由逗号分隔的交易代码列表来一次添加多个股票（如”MSFT, AMZN, TSLA”）。

![](https://farm1.staticflickr.com/636/20648164441_642ae33a22_c.jpg)

从列表中移除股票可以类似地按‘-’来完成。

### 对Mop中的股票报价排序 ###

你可以基于任何栏目对股票报价列表进行排序。要排序，请按‘o’，然后使用左/右键来选择排序的基准栏目。当选定了一个特定栏目后，你可以按回车来对列表进行升序排序，或者降序排序。

![](https://farm1.staticflickr.com/724/20648164481_15631eefcf_c.jpg)

通过按‘g’，你可以根据股票当日的涨或跌来分组。涨的情况以绿色表示，跌的情况以白色表示。

![](https://c2.staticflickr.com/6/5633/20615252696_a5bd44d3aa_b.jpg)

如果你想要访问帮助页，只需要按‘?’。

![](https://farm1.staticflickr.com/573/20632365342_da196b657f_c.jpg)

### 尾声 ###

正如你所见，Mop是一个轻量级的，然而极其方便的证券监控工具。当然，你可以很轻松地从其它别的什么地方，从在线站点，你的智能手机等等访问到股票报价信息。然而，如果你在整天使用终端环境，Mop可以很容易地适应你的工作环境，希望没有让你过多地从你的工作流程中分心。只要让它在你其中一个终端中运行并保持市场日期持续更新，那就够了。

交易快乐！

--------------------------------------------------------------------------------

via: http://xmodulo.com/monitor-stock-quotes-command-line-linux.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://github.com/michaeldv/mop
[2]:http://ask.xmodulo.com/install-go-language-linux.html
[3]:http://money.cnn.com/data/markets/
[4]:http://finance.yahoo.com/
