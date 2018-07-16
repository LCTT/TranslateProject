每日Ubuntu小技巧——安装Ubuntu后做什么
==================================

许多Windows用户开始使用Ubuntu时都感到束手无策。Ubuntu与Windows截然不同，想要轻松驾驭Ubuntu可不是一件简单的事情。Ubuntu的使用方式不同于Windows。许多用户对命令行、文件系统的布局和应用程序的名称都感到陌生。但是不用担心，我们会提供帮助的。

如果你以前是Windows或者Mac OS X用户现在想学Ubuntu，那你来对地方了。我们正努力帮助新用户开始Ubuntu之旅。我们的口号理所当然就是“**菜鸟教程**”。

我们的教程大多不是针对专业人士的，而是面向刚开始学习Windows和Ubuntu的新手。所以，在Ubuntu上遇到了任何困扰，都可以回来转转。

好了，言归正传。几天前一个读者问了我们一个问题，如下：

> 安装好Ubuntu后首先要做什么？

很简单，第一次安装Ubuntu时，你可能有很多事情想做。但是最重要的是让它正常工作。不要担心遇到难题，这些你很快就会明白。

这里有一些安装好Ubuntu之后你最初想要做的事。可能你想做的比这还多，但这些是比较重要的。

- 更新系统 －首先更新你的系统。系统更新可以让你安装比较新的软件包和一些其它程序的修正。使用Ubuntu时你可以使用下面的命令正确地进行系统更新。

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

- 安装好Ubuntu后要做的另外一件事就是运行下面的命令。这条命令能帮助你安装编解码器和因法律原因而排除在Ubuntu外的软件包。Ubuntu并未预装这些比较重要的程序。而没有这些程序你可能无法听音乐、看电影或者做其它的事情。所以，如果你安装了Ubuntu但是不能播放DVD或者听音乐CD，那就运行下面的命令吧。

    sudo apt-get install ubuntu-restricted-extras


以上这些命令并非你将在Ubuntu运行的全部的命令，但它们是安装好Ubuntu后你首先要运行的。希望这些能帮助到你。

使用愉快！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tipsthings-to-do-after-installing-ubuntu/


译者：[Linchenguang](https://github.com/Linchenguang) 校对：[Caroline](https://github.com/carolinewuyan) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
