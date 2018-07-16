ncdu-基于Ncurses的磁盘实用工具
===

几天前，我们讨论了[gt5][1]（一个具有图形前端的磁盘实用工具）。接着上次，继续介绍这个命令系列：du替代命令，我们今天要讨论的是一个基于ncurese的磁盘实用工具，可以远程运行但没有图形环境。我们要介绍的这个命令行工具叫做**ncdu**。

###ncdu——基于Ncurses的du可选程序

这个命令行工具只是一个基于curses版本的标准du命令。它可帮助你在没有安装图形环境的情况下快速查看系统的磁盘使用统计。

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-main.png)

###检测环境
- 操作系统 – Ubuntu 13.04
- Shell – Bash 4.2.45
- 应用 – ncdu 1.9

###简明教程

以下是一些ncdu命令的例子：

**1. 默认输出**

执行以下**ncdu**命令，你会观察到，它会先扫描磁盘然后降序显示各个目录下的空间使用情况。

**> 扫描**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-0.png)

**> 输出**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-1.png)

你会看到在输出里显示了一个磁盘使用情况表。假如你要扫描整个文件系统，你可以在运行**ncdu**命令时加上**-x**选项。

**2. 按i可以得到选定目录的更多信息**

如你所见，第一项默认选中。想要知道选定项的更多信息，可以按**i**。

下面给出一个例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-2.png)

如你所见，显示了目录，类型，大小，实际占用空间等。项返回，再按一次**i**。

**3. 在ncdu的界面中删除目录**

在ncdu的界面中删除目录，只需要选中目录，然后按**d**。

下面给出一个例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-3.png)

如你所见，ncdu请求用户确认。假如你选择yes,目录将会从系统中删除。

**4. 显示每一个目录的磁盘使用占总的磁盘空间的百分比**

按**g**显示每个目录大小占总的磁盘空间的百分比。

下面给出一个例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-4.png)

如你所见，在输出结果的第二竖列显示了每个目录所占用的空间占总的磁盘空间的百分比。

**5. 获悉有关所有可使用快捷键的**

按**？**可获得相关快捷键、格式以及有关ncdu版本的信息。

下面给出一些例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-5-1.png)

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-5-2.png)

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-5-3.png)

想知道有关命令行选项以及其它信息，可前往[ncdu命令的Man页面][2]。

###下载/安装/配置

以下是一些有关ncdu命令的重要链接

 - [主页][3] 
 - [下载链接][4]

当然，你也可以通过命令方式下载安装，比如apt-get，yum等。另外，Ubuntu用户可使用Ubuntu软件中心下载安装这个工具。

###优点

 - 信息显示快速
 - 系统资源消耗小

###缺点

 - 在大多数Linux发行版中均没有预安装
 - 有一定的学习曲线

###结论

假如你不满足于标准的du工具，想去寻找一款快速的，基于ncurses的类du工具，那么你可以试试ncdu。它提供了许多自定义选项。你一定会喜欢它的。

**你使用过ncdu,gt5或者其他任何类du工具吗？欢迎和我们分享你的使用经验。**

---

via: http://mylinuxbook.com/ncdu-ncurses-based-disk-usage-utility/

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/gt5-a-graphical-alternative-to-du/
[2]:http://linux.die.net/man/1/ncdu
[3]:http://dev.yorhel.nl/ncdu
[4]:http://dev.yorhel.nl/ncdu
