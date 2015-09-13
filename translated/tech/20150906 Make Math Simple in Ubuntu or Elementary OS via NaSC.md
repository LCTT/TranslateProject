在 Ubuntu 和 Elementary 上使用 NaSC 做简单数学运算
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-icon.png)

NaSC（Not a Soulver Clone，并非 Soulver 的克隆品）是为 Elementary 操作系统进行数学计算而设计的一款开源软件。类似于 Mac 上的 [Soulver][1]。

> 它能使你像平常那样进行计算。它允许你输入任何你想输入的，智能识别其中的数学部分并在右边面板打印出结果。然后你可以在后面的等式中使用这些结果，如果结果发生了改变，等式中使用的也会同样变化。

用 NaSC，你可以：

- 自己定义复杂的计算
- 改变单位和值（英尺、米、厘米，美元、欧元等）
- 了解行星的表面积
- 解二次多项式
- 以及其它

![nasc-eos](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-eos.jpg)

第一次启动时，NaSC 提供了一个关于现有功能的教程。以后你还可以通过点击标题栏上的帮助图标再次查看。

![nasc-help](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-help.jpg)

另外，这个软件还允许你保存文件以便以后继续工作。还可以在一定时间内通过粘贴板共用。

### 在 Ubuntu 或 Elementary OS Freya 上安装 NaSC： ###

对于 Ubuntu 15.04，Ubuntu 15.10，Elementary OS Freya，从 Dash 或应用启动器中打开终端，逐条运行下面的命令：

1. 通过命令添加 [NaSC PPA][2]：

    sudo apt-add-repository ppa:nasc-team/daily

![nasc-ppa](http://ubuntuhandbook.org/wp-content/uploads/2015/09/nasc-ppa.jpg)

2. 如果安装了 Synaptic 软件包管理器，点击 ‘Reload’ 后搜索并安装 ‘nasc’。

或者运行下面的命令更新系统缓存并安装软件：

    sudo apt-get update
    
    sudo apt-get install nasc

3. **(可选)** 要卸载软件以及 NaSC，运行：

    sudo apt-get remove nasc && sudo add-apt-repository -r ppa:nasc-team/daily

对于不想添加 PPA 的人，可以直接从[该网页][3]获取 .deb 安装包。、

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/09/make-math-simple-in-ubuntu-elementary-os-via-nasc/

作者：[Ji m][a]
译者：[ictlyh](http://www.mutouxiaogui.cn/blog/)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://www.acqualia.com/soulver/
[2]:https://launchpad.net/~nasc-team/+archive/ubuntu/daily/
[3]:http://ppa.launchpad.net/nasc-team/daily/ubuntu/pool/main/n/nasc/