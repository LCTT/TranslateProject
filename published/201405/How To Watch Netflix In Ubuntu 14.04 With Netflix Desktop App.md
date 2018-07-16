如何在Ubuntu 14.04中观看Netflix
================================================================================
在Windows中观看Netflix是很容易的。你可以使用网络浏览器或者桌面程序，但这在linux中并不同。这在linux中默认并不可行，这是因为Netflix需要[Microsoft Silverlight][1]，同时由于这是"微软"的，很明显这无法在Linux上使用。所以在Linux上就没法使用Netflix了么？当然有办法。本篇中我们就会看到如何在Ubuntu 14.04上观看Netflix(或许在老版本中如13.10和13.04等也可以)。

### 如何在Ubuntu 14.04 中观看Netflix: ###

我们需要用到[Pipelight][2]，一个通过[Wine][3]来在Linux上支持Silverlight的项目。这个项目仍在beta状态，但是已经工作的很好了。让我们看看如何在Ubuntu 14.04上安装Pipelight。

#### 在Ubuntu 14.04 上安装Pipelight ####

要感谢Pipelight团队的PPA，在Ubuntu14.04上安装Pipelight是很方便的。打开一个终端并且运行依次运行下面的命令：

    sudo apt-add-repository ppa:pipelight/stable
    sudo apt-get update
    sudo apt-get install pipelight-multi

安装包大概有450MB左右因此如果你的网络连接很慢的话可能会花费一些时间。同样，Pipelight在beta状态，因此到这里检查一下安装指令（以防将来有什么变化）。

#### 启用 Sliverlight 来播放 Netflix ####

通常Pipelight已经默认启用了silverlight插件，但是为了万无一失，使用下面的命令启用Silverlight:

    sudo pipelight-plugin --enable silverlight

这里要接受两个条件，一旦你做了，它会花费一些时间来安装Silverlight。

#### 在 Ubuntu 14.04 中安装Netflix桌面应用 ####

此时你应该可以在web浏览器中使用Netflix了。但是Pipelight项目还提供了更多。刚才我们使用的PPA同样还有对于Ubuntu的Netflix的桌面应用，使用下面的命令：

    sudo apt-get install netflix-desktop

安装完成后，你可以在Unity Dash中找到Netflix。

![](http://itsfoss.com/wp-content/uploads/2014/04/Netflix_Desktop_App_Ubuntu.png)

At first run, it will install some Wine related stuff. Let it do that. Afterwards, it should run fine:
第一次启动时，它会安装Wine相关的一些东西。让它自己做好了。在这之后，它就会正常运行了:

![](http://itsfoss.com/wp-content/uploads/2014/04/Netflix_desktop_app_Ubuntu_1404.jpeg)

### 在USA之外的Ubuntu上使用Netflix : ###

你注意到上面的Netflix桌面应用了么？它说Netflix不支持我所在的国家地区(也就是说，法国)。我不是Netflix的粉丝，不过我写了一篇[如何在美国之外轻松观看Netflix][4]。如果你想要在美国之外观看Netflix，你需要改变DNS设置才行。

文中提到的Tunlr是一个已经关闭的免费服务。作为替代，我还使用 [Unlocator][5]，在beta状态下还是免费的。很容易使用且体验良好。Unlocator现在不再免费了，但是如果你愿意每月花$5，[Unlocator][5]是一个很棒的DNS解锁服务器。

--------------------------------------------------------------------------------

via: http://itsfoss.com/netflix-ubuntu-1404-desktop-app/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.microsoft.com/silverlight/
[2]:http://fds-team.de/cms/articles/2013-08/pipelight-using-silverlight-in-linux-browsers.html
[3]:http://en.wikipedia.org/wiki/Wine_(software)
[4]:http://itsfoss.com/easiest-watch-netflix-hulu-usa/
[5]:http://goo.gl/QHT0oq
