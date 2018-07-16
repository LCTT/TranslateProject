集成命令提示符、堪称“多才多艺”的命令行文件管理器 - CLEX
=============================================

作为一名系统管理员亦或是一名普通的命令行用户，在文件管理器和命令行之间频繁切换是否时常令你感到沮丧。总有一天，你会倾向于使用一些命令行来代替你所用的图形文件管理器。

也许，偶尔你会找到一款不错的命令行管理器，但即使如此，你仍然需要在你的文件管理器和命令行窗口之间来回切换。所以，这个问题并没有真正解决。那么，是否有一款文件管理器能将文件浏览和命令提示符集成在同一个窗口里呢？答案是肯定的，它就是 **CLEX** 。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-main.png)

###CLEX - 命令行文件管理器

CLEX是一款基于命令行的文件管理器，它拥有一个漂亮轻巧的用户界面，提供了非常多的文件管理选项。这款文件管理器的最大优势是它还集成提供了一个命令提示符（在同一个窗口中哦~），通过这个命令提示符，你可以运行常规命令。

**注**  ： 下文中的所有例子均测试于Ubuntu 13.04。

###简易教程

下图是在我机器上第一次执行CLEX的用户界面

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-1.png)

可以看到，窗口的上半部分列出了当前工作路径(本例中 **/home/himanshu/** )下的所有的文件和目录。你可以使用上下方向键选择一个文件或目录，接着按下回车进入一个目录。

在窗口的下半部分，CLEX提供了一个命令行提示符(在我的测试中为bash)，在这里你可以执行任意已经安装好的命令。

举个例子，想要打开下图中的图片文件Ubuntu.png，首先，使用方向键选中它：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-2.png)

然后，Ubuntu.png作为参数，使用命令提示符启动一个已安装好的图片查看器（我机器上装的是gthumb）

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-3.png)

上述命令执行的同时，图片查看器程序gthumb将图片显示了出来。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-4.png)

除此以外，CLEX还提供了一系列很好用的快捷键组合，可以按下Alt+M查看。 

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-5.png)

可以看到，这些快捷键包括改变当前工作路径，添加书签，查看历史命令，文件名排序，比较目录文件夹等等。

下图为查看历史命令的截图：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-6.png)

比葫芦画瓢，每次根据不同需要，你可以选用相应的快捷键组合。

**注** ： 退出CLEX的快捷键是Alt+q。

###下载/安装

下面列出了一些CLEX文件管理器的相关链接：

- [主页](http://www.clex.sk/about.html)
- [下载](http://www.clex.sk/download/)
- [文档](http://www.clex.sk/help/file_intro.html)

Ubuntu用户可以直接通过Ubuntu软件中心下载安装。本文中的示例使用的版本是3.15。

###优点

- 在同一个窗口中整合了文件浏览与命令提示符
- 提供大量快捷键。包括文件夹比较，文件名排序，查看历史命令等等。
- 出色的在线文档

###缺点

- 依赖于CURSES库，需要宽字符集支持。因此通过源码安装的时候可能会导致一些问题。
- 启动时不稳定，我每次启动时都会出现下图中的警告：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-warning.png)

###结论

CLEX确实是一款特性丰富的命令行文件管理器。集成命令提示符是它的独特卖点。尽管有些小毛病，但瑕不掩瑜。经过一段时间的适应后，CLEX仍是一款省时高效的工具。


via:http://mylinuxbook.com/clex-a-versatile-command-line-file-manager/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[Caroline]:http://linux.cn/space/14763

[1]:http://mylinuxbook.com/clex-a-versatile-command-line-file-manager/
[2]:http://www.clex.sk/about.html
[3]:http://www.clex.sk/download/
[4]:http://www.clex.sk/help/file_intro.html 
