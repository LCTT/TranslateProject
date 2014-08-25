如何安排你的Ubuntu 14.04自动关机[快速技巧]
===

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Schedule_Shutdown_Ubuntu.jpeg)

当你系统还在运行某些程序的时候，无法关闭计算机？但是你又不能让计算机跑个一整夜！可能你会发现你曾面临相似的处境：因为刚刚提到的问题，你需要在Ubuntu或者其余Linux系统下安排计算机关机

在这篇文章中，我们就来看看如何使用GUI或者在CLI下安排你的Ubuntu关机

### 使用EasyShutdown安排你的Ubuntu关机 ###

EasyShutdown是一个轻量级的应用程序，它提供给你简洁的GUI，你可以很容易就能安排你的Ubuntu关机。你可以在[EasyShutdown的launchpad页面下载.deb文件][1]。只要双击它，就可以安装了。默认情况下，它会打开Ubuntu Software Center

安装完成，从Unity Dash启动它。界面非常简单，你只需要提供你想关机的时间就可以了。举个例子：如果你想在03:30 AM关机，像下面那样操作：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Schedule_Shudown_Ubuntu.jpeg)

请注意：EasyShutdown并没有后台程序或者系统托盘，所以，你必须让它一直运行，否则将不能正常工作。但EasyShutdown的优点是：它会在你安排关机时间的前一分钟通知你，那样你就可以选择停止它

### 使用命令行安排Ubuntu关机 ###

使用命令行选项来**安排Ubuntu关机**同样很简单。你要做的就是使用“shutdown”命令。举个例子：想在03:30 AM关机，你可以使用下面的命令：

	sudo shutdown -h 03:30

注意，你必须一直运行这个命令。所以要么保持这个终端，要么在后台运行 

我希望这些快速技巧可以帮助你们,学会如何安排Ubuntu或者其余Linux系统比如Linux Mint自动关机。欢迎你们提出问题或者建议

---

via: http://itsfoss.com/schedule-shutdown-ubuntu/

作者：[Abhishek][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://launchpad.net/easyshutdown

