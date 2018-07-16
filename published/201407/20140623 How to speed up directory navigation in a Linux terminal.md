自动补完不算什么，一键直达目录才是终极神器！
================================================================================

在命令行中切换目录是最常用的操作，不过很少有比一遍又一遍重复“cd ls cd ls cd ls ……”更令人沮丧的事情了。如果你不是百分百确定你想要进入的下一个目录的名字，那么你不得不使用ls来确认，然后使用cd来进入你想要进的那一个。所幸的是，现在大量的终端和shell语言提供了强大的自动补全功能来处理该问题。但是，你仍然需要一直疯狂地敲击TAB键来干这事。如果你和我一样懒惰，你一定会对autojump感到惊喜。

autojump是一个命令行工具，它允许你可以直接跳转到你喜爱的目录，而不用管你现在身在何处。

### 在Linux上安装autojump ###

在Ubuntu或Debian上安装autojump：

    $ sudo apt-get install autojump

要在CentOS或Fedora上安装autojump，请使用yum命令。在CentOS上，你需要先[启用EPEL仓库][1]才行。

    $ sudo yum install autojump

在Archlinux上安装autojump：

    $ sudo pacman -S autojump

如果你找不到适合你的版本的包，你可以从[GitHub][2]上下载源码包来编译。

### autojump的基本用法 ###

autojump的工作方式很简单：它会在你每次启动命令时记录你当前位置，并把它添加进它自身的数据库中。这样，某些目录比其它一些目录添加的次数多，这些目录一般就代表你最重要的目录，而它们的“权重”也会增大。

现在不管你在哪个目录，你都可以使用下面的语法来直接跳转到这些目录：

    autojump [目录的名字或名字的一部分]

注意，你不需要输入完整的名称，因为autojump会检索它的数据库，并返回最可能的结果。

例如，假定我们正在下面的目录结构中工作。

![](https://farm4.staticflickr.com/3921/14276240117_9f56b42fec_z.jpg)

那么下面的命令将直接让你跳到/root/home/doc下，不管你当前位置在哪里。

    $ autojump do

如果你也很讨厌打字，那么我推荐你为autojump起个别名，或者使用默认的别名。

    $ j [目录的名字或名字的一部分]

另外一个引人注目的功能是，autojump支持zsh和自动补完。如果你不确认哪里是不是你要跳转的地方，敲击TAB键就会列出完整路径。

还是同样的例子，输入：

    $ autojump d

然后敲击tab键，将会返回/root/home/doc或者/root/home/ddl。

最后，对于高级用户，你可以访问目录数据库，并修改它的内容。可以使用下面的命令来手动添加一个目录：

    $ autojump -a [目录]

如果你突然想要把当前目录变成你的最爱和使用最频繁的文件夹，你可以在该目录通过命令的参数 i 来手工增加它的权重

    $ autojump -i [权重]

这将使得该目录更可能被选择跳转。相反的例子是在该目录使用参数 d 来减少权重：

    $ autojump -d [权重]

要跟踪所有这些改变，输入：

    $ autojump -s

这会显示数据库中的统计数据。而以下：

    $ autojump --purge

命令将会把不再存在的目录从数据库中移除。

简言之，autojump将会受到所有命令行高级用户的欢迎。不管你是在ssh进一台服务器，还是仅仅想要追随复古潮流，敲更少的键来减少导航时间总是件好事。如果你真的热衷于此类工具，你也肯定也想看看[Fasd][3]，它应该会给你一个惊喜，我们下次再介绍它。

你觉得autojump怎么样？你会经常用它么？发表一下你的评论吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/speed-up-directory-navigation-linux-terminal.html

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[2]:https://github.com/joelthelion/autojump
[3]:https://github.com/clvv/fasd
