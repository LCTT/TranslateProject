命令行下使用 Mop 监视股票价格
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-featured-new.jpg)

有一份隐性收入通常很不错，特别是当你可以轻松的协调业余和全职工作。如果你的日常工作使用了联网的电脑，交易股票就是一个获取额外收入的很流行的选项。

但是目前只有很少的股票监视软件可以运行在 linux 上，其中大多数还是基于图形界面的。如果你是一个 Linux 专家，并且大量的工作时间是在没有图形界面的电脑上呢？你是不是就没办法了？不，还是有一些命令行下的股票追踪工具，包括Mop，也就是本文要聊一聊的工具。

### Mop ###

Mop，如上所述，是一个命令行下连续显示和更新美股和独立股票信息的工具。使用 GO 语言实现的，是 Michael Dvorkin 的智慧结晶。

### 下载安装 ###

因为这个项目使用 GO 实现的，所以你要做的第一步是在你的计算机上安装这种编程语言，下面就是在 Debian 系的系统，比如 Ubuntu 上安装 GO 的步骤：

    sudo apt-get install golang
    mkdir ~/workspace
    echo 'export GOPATH="$HOME/workspace"' >> ~/.bashrc
    source ~/.bashrc

GO 安装好后的下一步是安装 Mop 工具和配置环境，你要做的是运行下面的命令：

    sudo apt-get install git
    go get github.com/michaeldv/mop
    cd $GOPATH/src/github.com/michaeldv/mop
    make install
    export PATH="$PATH:$GOPATH/bin"

完成之后就可以运行下面的命令执行 Mop：

    cmd

### 特性 ###

当你第一次运行 Mop 时，你会看到类似下面的输出信息：

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-first-run.jpg)

如你所见，这些输出信息—— 周期性自动刷新 ——包含了主要几个交易所和个股的信息。

### 添加删除股票 ###

Mop 允许你轻松的从输出列表上添加/删除个股信息。要添加，你全部要做的是按“+”和输入股票名称。举个例子，下图就是添加 Facebook (FB) 到列表里。

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-add-stock.png)

我按下了“+”键，就出现了包含文本“Add tickers：”的一列，提示我添加股票名称—— 我添加了 FB 然后按下回车。输出列表更新了，我添加的新股票也出现在列表了：

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-stock-added.png)

类似的，你可以使用“-”键和提供股票名称删除一个股票。

#### 根据价格分组 ####

还有一个把股票分组的办法：依据他们的股价升跌，你所要做的就是按下“g”键。接下来，股票会分组显示：升的在一起使用绿色字体显示，而下跌的股票会黑色字体显示。

如下所示：

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-group-stocks-profit-loss.png)

#### 列排序 ####

Mop 同时也允许你根据不同的列类型改变排序规则。这种用法需要你按下“o”（这个命令默认使用第一列的值来排序），然后使用左右键来选择你要排序的列。完成之后按下回车对内容重新排序。

举个例子，下面的截图就是根据输出内容的第一列、按照字母表排序之后的结果。

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-change-order.png)

**注意**: 为了更好的理解，和前面的截屏对比一下。

#### 其他选项 ####

其它的可用选项包括“p”：暂停市场和股票信息更新，“q”或者“esc” 来退出命令行程序，“?”显示帮助页。

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-help.png)

### 结论 ###

Mop 是一个基础的股票监控工具，并没有提供太多的特性，只提供了它所声称的功能。很明显，这个工具并不是为专业股票交易者提供的，而仅仅为你在只有命令行的机器上得体的提供了一个跟踪股票信息的选择。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/monitor-stock-prices-ubuntu-command-line/

作者：[Himanshu Arora][a]
译者：[oska874](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
