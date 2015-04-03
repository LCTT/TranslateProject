如何在终端使用后台运行模式启动一个Linux应用程序
========================================================================

![Linux终端窗口](http://f.tqn.com/y/linux/1/W/r/G/1/terminal.JPG)

这是一个篇幅不长但是十分有用的教程，可以帮助你在终端启动一个Linux应用程序，并且使终端窗口不会丢失焦点。

我们有很多可以在Linux系统中打开一个终端窗口的方法，这取决于你的选择以及你的桌面环境。

如果是使用Ubuntu的话，你可以利用CTRL+ALT+T组合键打开终端。当然你也可以使用超级键（Windows键）[打开Dash][1]，搜索“TERM”，然后点击“Term”图标来打开终端窗口。

对于其他的桌面环境来说，例如XFCE、KDE、LXDE、Cinnamon以及MATE，你可以在菜单中找到终端。有些环境会在停靠栏或者面板上面包含终端图标。

通常情况下，你可以在终端里面直接输入应用程序名来启动一个应用程序。比如说，你可以通过输入“firefox”来启动Firefox。

在终端启动应用程序的好处是，你可以包含一些额外的参数。

例如，你可以通过下列命令来打开一个Firefox浏览窗口，然后利用默认的搜索引擎搜索相关信息：

	firefox -search "linux.cn"

你可能会注意到，如果你启动Firefox，程序打开以后，回到了终端窗口控制，这就意味着你可以继续在终端进行工作。

通常情况下，如果你在终端启动了应用程序，控制会切换到新启动的应用程序，只有程序被关闭以后才会重新切换到终端控制。这是因为你在前台启动了这个程序。

如果要在Linux终端打开应用程序并且返回终端控制，那么你需要将应用程序启动为后台进程。

和下面所列的命令一样，我们可以通过增加一个（&）符号，将应用程序在后台启动。

	libreoffice &

>译者注：如果需要加参数的话，记得把&符号放在最后。

>译者注：一般情况下，关闭终端时，在这个终端启动的后台程序也会被终止，要使终端关闭以后，后台程序依然保持执行可以使用下列命令

>	nohup command [arg...] &

如果应用程序目录没有安装在PATH变量包含的目录里面的话，我们就没有办法直接通过应用程序名来启动程序，必须输入应用程序的整个路径来启动它。

	/path/to/yourprogram &

如果你不确定程序输入哪个Linux目录结构的话，可以使用[find][2]或者[location][3]命令来定位它。

可以输入下列符号来找到一个文件：

	find /path/to/start/from -name programname

例如，你可以输入下列命令来找到Firefox：

	find / -name firefox

命令运行的结果会嗖的一下输出一大堆，别担心，你也可以通过[less][4]或者[more][5]来进行分页查看。

	find / -name firefox | more

	find / -name firefox | less

当find命令查找到没有权限访问的文件夹时，会报出一条拒绝访问错误，

你可以通过[sudo命令来提示权限][6]。当然，如果你没有安装sudo的话，就只能切换到一个拥有权限的用户了。

	sudo find / -name firefox | more

如果你知道你要查找的文件在你的当前目录结构中，那么你可以使用点来代替斜杠：

	sudo find . -name firefox | more

你可能需要sudo来提升权限，也可能根本就不需要，如果这个文件在你的主目录里面，那么就不需要使用sudo。

有些应用程序则必须要提升权限才能运行，否则你就会得到一大堆拒绝访问错误，除非你使用一个具有权限的用户或者使用sudo提升权限。

这里有个小窍门。如果你运行了一个程序，但是它需要提升权限来操作，输入下面命令试试：

	sudo !!

via : http://linux.about.com/od/commands/fl/How-To-Run-Linux-Programs-From-The-Terminal-In-Background-Mode.htm

作者：[Gary Newell][a]
译者：[zhouj-sh](https://github.com/zhouj-sh)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://linux.about.com/od/howtos/fl/Learn-Ubuntu-The-Unity-Dash.htm
[2]:http://linux.about.com/od/commands/l/blcmdl1_find.htm
[3]:http://linux.about.com/od/commands/l/blcmdl1_locate.htm
[4]:http://linux.about.com/library/cmd/blcmdl1_less.htm
[5]:http://linux.about.com/library/cmd/blcmdl1_more.htm
[6]:http://linux.about.com/od/commands/l/blcmdl8_sudo.htm
