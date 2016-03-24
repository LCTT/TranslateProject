gcp – 源于CP的高级命令行文件拷贝工具
================================================================================
几周前，我们讨论了[高级拷贝][1](修改于cp命令，让其可以显示复制进度条)。一位读者在注释中指出其他实用工具不仅也提供了基本的cp命令功能，而且还提供cp不具有的高级功能。所以，这篇文章里，我们将会讨论非常相似的命令行工具－**gcp**。

### gcp – 高级命令行文件拷贝器 ###

根据操作手册介绍，gcp是一款高级命令行文件拷贝工具软件，其灵感来自于标准的 [cp命令][2]， 但它提供了像进度条显示、源文件列表、拷贝过程中出现错误文件不中断继续拷贝等cp所不具有的各项高级功能。

下面是部分功能列表：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-main.png)

### 测试环境###

- 操作系统 – Ubuntu 13.04
- Shell工具 – Bash 4.2.45
- 应用程序 – gcp 0.1.3

### 简短的教程 ###

下面是一些gcp命令的例子：

**1. 复制进度显示**

gcp命令提供了进度显示功能，以便用户能监控到复制操作的当前状态。

下面是例子：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-1.png)

可以看到，gcp命令显示了如文件大小、复制完成的百分比、传输速率和复制操作还需多久完成等细节。

**2. 使用-r选项递归拷贝目录**

要递归拷贝完整的目录，可以使用-r选项。

示例如下：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-2.png)

可以看到，gcp命令显示了完整文件夹复制情况的进度条。

**3. 精心设计的错误描述显示**

如遇到错误，gcp命令会显示拷贝失败的文件的错误信息。

示例如下：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-3.png)

可以看到，gcp命令列出了详细的错误消息，即**August Rush.avi**文件已经在目标目录中存在，拷贝失败。但这个错误并不会影响其它文件的正常拷贝操作。

**4. 使用-v选项输出详细信息**

详细选项-v参数可以用来跟踪gcp命令执行时的所有详细消息。

示例如下 ：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-4.png)

可以看到，使用-v选项可以输出很多细节信息。

**5. 创建和使用源列表**

gcp命令的一个很炫的功能就是可以创建源文件列表，以供以后再次使用。

例如，在下面的拷贝操作中，我使用**-sources-save**选项来保存一个源文件列表。

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-1.png)

本例中,列表名叫**SOURCES_SAVE**。你可以用**–sources-list**选项参数来确认已保存的列表。

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-3.png)

可以看到列表名**SOURCES_SAVE**已保存。

现在，删除我们在第一步中拷贝的文件：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-2.png)

重复第一步的操作，但不要加上源文件路径名，使用**–sources-load**选项参数来从**SOURCES_SAVE**列表文件中加载源文件名。

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-4.png)

可以看到,gcp命令从**SOURCES_SAVE**列表文件中读取源文件名，并且正常的执行了拷贝操作。

下面是关于源文件列表的其它选项参数：

![](http://mylinuxbook.com/wp-content/uploads/2013/10/gcp-5-5.png)

gcp命令还提供了各式名样的其它有用选项。要查看完整的选项，请阅读[gcp帮助主页][3]。

### 下载/安装/配置 ###

下面是关于gcp命令的一些主要链接站点：

- [主页][4]
- [下载链接][5]
- [另一篇很有用的gcp使用教程][6]

你可以通过使用像yum、apt-get等的命令行包管理工具来下载和安装gcp命令。Ubuntu用户也可以使用Ubuntu软件中心来下载和安装这个工具。

### 优点 ###

- 状态条显示和源文件列表是这个工具的核心。
- 跳过有问题的文件，不影响正常文件的复制操作。
- 跟标准的cp命令的用法很相似。

### 不足 ###

- 在复制文件夹的时候，要是能显示每个文件的复制状态，那就更好了。
- 在大多数Linux发行版本中没有预先安装。

### 结论 ###

如果您厌倦了使用标准cp命令拷贝大文件时的盲目等待，gcp命令是个不错的选择。系统管理员会喜欢上源文件列表的功能的。它是必备工具。

**你曾经使用过gcp或者类cp的高级命令行工具吗？可以把你的使用心得跟我们分享。**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/gcp-advanced-command-line-file-copier-inspired-by-cp/

译者：[runningwater](https://github.com/runningwater) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/advanced-copy-cp-command/
[2]:http://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/
[3]:http://manpages.ubuntu.com/manpages/precise/en/man1/gcp.1.html
[4]:http://wiki.goffi.org/wiki/Gcp/en
[5]:http://wiki.goffi.org/wiki/Gcp/en
[6]:http://www.hecticgeek.com/2012/03/gcp-command-line-file-copy-ubuntu-linux/

