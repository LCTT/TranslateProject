Ranger – 给命令行用户一个基于文本的文件管理器
======================================

图形文件管理器是每个人日常电脑工作的一部分。多数用户都乐于使用默认的文件管理器，并且没有那么多困扰让他们去探索替代的文件管理器。但是，当使用命令行（CLI）的文件管理器，用户在找到一个最好的之前，可能有兴趣尝试各种可用的文件管理器，以适合他们的需求。在这篇文章中，我们将来看看Ranger，一个基于命令行的文件管理器。


![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-main.png "ranger-main")
**注释**：这篇文章中的所有示例和使用说明在ubuntu13.04上已通过测试。

###Ranger - 命令行文件管理器

Ranger是一个基于ncurses库的命令行文件管理器，有一个简单而简约的用户界面。它使用基本的vi式的导航键，能够预览文件和用默认程序打开它们。

###如何使用Ranger

只需在命令行里键入命令ranger去执行这个程序。这是在我系统上从/home/himanshu目录执行时的ranger快照。

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-1.png "ranger-1")

你可以看到在单独的列上ranger显示了目录，子目录和目录里的内容。例如，如上图所示，在窗口最左边一列，代表我的系统在/home/目录下有三个目录。在这三种目录里，himanhu目录是当前已被选择的。

第二列代表himanshu目录的子目录。这里，Pictures子目录是当前被选择的。同样的，第三列代表呈现在图片目录的所有文件。

**注释**：你可以使用左右键选择一个特定的列并且使用上下键穿梭于这些列中。

Ranger使用默认程序去显示不同类型的文件。例如，当我导航到第三列如之前的截图并且按下我选择的文件workspace_switcher.png。下面会出现：

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-2.png "ranger-2")

所以，你可以看到ranger在图像浏览器中打开文件。这个文件管理器另一个功能是，被选择的文件如果可能的话，可以在文件管理器中预览文件。

这是示例截图：

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-3.png "ranger-3")

所以你可以看到当CMS文件被选中时，预览它的内容被显示在窗口的右边。如果想要读取完整文件，只需点击右键头，文件将在vi/vim编辑器中打开。退出vi/vim编辑器使用：q 回到文件管理器。

注释 - 预览图片需要一些支持库。更多方面的信息：[可以看这里][1]阅读支持部分。

这是关于使用ranger的一些提示：

- 选择一个文件，按y复制它，然后导航到目标目录再按p粘贴。
- 提示：**delete键**去删除当前被选中的文件。 
- 在文件管理器里使用问号（？）打开ranger的man手册页并且按q回到文件管理器。
- 基于ncurses，可以很容易的通过鼠标上下滚动。

###下载/安装

这是相关ranger文件管理器的重要链接：

- [主页][2]
- [下载][3]

我通过apt-get在命令行下载并安装这个程序。Ubuntu用户也可以使用Ubuntu软件中心下载安装这个程序。本文使用的版本是1.5.4-1。

没有其他问题的话,下载和安装能够顺利完成。

**优点**

- 轻松导航
- 简约的UI
- 使用vi/vim风格命令控制

**缺点**

- 只适用于基本的文件管理操作
- 预览功能需要依赖关系被满足

**总结**

Ranger是一个很好的实用程序。我将推荐这个程序给那些工作在服务器上的用户（不含GUI）。如果你主要使用命令行，并且在寻找一个好的命令行管理器，Ranger可能是一个好的选择。如果你的期望不是太高，ranger不会使你失望。


via: http://mylinuxbook.com/ranger-command-line-file-manager/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/vito
[wxy]:http://linux.cn/space/wxy

[1]:http://ranger.nongnu.org/
[2]:http://ranger.nongnu.org/index.html
[3]:http://ranger.nongnu.org/download.html
