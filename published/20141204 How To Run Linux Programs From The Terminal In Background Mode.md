如何在终端下以后台模式运行Linux程序
===

![Linux Terminal Window.](http://0.tqn.com/y/linux/1/W/r/G/1/terminal.JPG)

*Linux终端窗口*

这是一个简短但是非常有用的教程：它向你展示从终端运行Linux应用程序的同时，如何保证终端仍然可以操作。

在Linux中有许多方式可以打开一个终端，这主要取决于你的发行版的选择和桌面环境。

使用Ubuntu的话，你可以使用CTRL + ALT + T组合键打开一个终端。你也可以点击超级键(Windows键)打开一个终端窗口。在键盘上，[打开Ubuntu Dash][1]，然后搜索"TERM"。点击"Term"图标将会打开一个终端窗口。

其他诸如XFCE, KDE, LXDE, Cinnamon和MATE的桌面环境，你将会在菜单中发现“终端”这个应用。还有一些发行版会把终端图标放在菜单项，或者在面板上放置终端启动器。

你可以在终端里面输入一个程序的名字来启动一个应用。举例，你可以通过输入"firefox"启动火狐浏览器。

从终端运行程序的好处是可以使用额外的选项。

举个例子，如果你输入下面的命令，一个新的火狐浏览器将会打开，而且默认的搜索引擎将会搜索引号之间的词语：

    firefox -search "Linux.About.Com"

你会发现，如果你运行火狐浏览器，应用程序打开后，控制权将会回到终端（重新出现了命令提示符），这将意味着你可以继续在终端工作。

通常情况下，如果你通过终端运行一个程序，程序打开后，并且直到那个程序关闭结束，你都将不会获得终端的控制权。这是因为你是在前台打开程序的。

想要从终端运行一个程序，并且立即将终端的控制权返回给你，你需要以后台进程的方式打开程序。

为了以后台进程的方式打开一个程序，只需要添加符号(&)到命令中，如下面所示：

    libreoffice &

在终端中仅仅提供程序的名字，应用程序可能运行不了。如果程序不存在于一个设置在PATH 环境变量的文件夹中，你需要指定完整的路径名来运行程序。

    /path/to/yourprogram &

如果你并不确定一个程序是否存在于Linux文件系统中，使用find或者locate命令来查找该应用程序。

找一个文件的语法如下：

    find /path/to/start/from -name programname

举个例子，可以使用下面的命令寻找Firefox的位置：

    find / -name firefox

输出会很快滚动出很多，所以你可以以管道的方式控制输出的多少：

    find / -name firefox | more
    
    find / -name firefox | less

find命令将会返回因权限拒绝而发生错误的文件夹数量，这些文件夹你没有权限去搜索。

你可以使用sudo命令提升你的权限。如果sudo没有安装，你需要切换到拥有权限的用户：

    sudo find / -name firefox | more

如果你知道你想寻找的文件在你的当前文件夹中，你可以一个点代替先前的斜线，如下：

    sudo find . -name firefox | more

你可能不需要sudo来提升权限。如果你在home文件夹中寻找文件，sudo就不需要。

一些应用程序需要提升用户权限来运行，你可能得到一个缺少权限的错误，除非你使用一个具有足够权限的用户，或者使用sudo提升你的权限。

下面是一个小花招。如果你运行一个程序，而且它需要提升权限来运行，输入下面命令来提升权限重新执行：

    sudo !!

---

via: http://linux.about.com/od/commands/fl/How-To-Run-Linux-Programs-From-The-Terminal-In-Background-Mode.htm

作者：[Gary Newell][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中>
国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://linux.about.com/od/howtos/fl/Learn-Ubuntu-The-Unity-Dash.htm
[2]:http://linux.about.com/od/commands/l/blcmdl1_locate.htm
[3]:http://linux.about.com/library/cmd/blcmdl1_less.htm
[4]:http://linux.about.com/library/cmd/blcmdl1_more.htm
[5]:http://linux.about.com/od/commands/l/blcmdl8_sudo.htm
