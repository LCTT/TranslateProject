在Ubuntu中使用终端删除应用程序
================================================================================

作为一个Linux（Ubuntu)用户，你每次从终端安装应用程序的时候都会用到**apt-get**这条命令。

虽然可以使用图形化界面来安装删除应用程序，但是命令行依然被认为是功能强大的方式。在安装了许多大大小小的应用程序以后，你会需要更多的磁盘空间来安装其他的应用程序，或者有些程序对你不再有用了。

大多数人，尤其是初学者，通过在查阅资料后，能够从终端安装一个程序，但是却很难删除它。我也曾经有过这样的经历。

这是一个简单的教程，指导你如何删除已经安装的软件包。

a. 打开终端（ctrl + alt + t）

b. 输入

    $ dpkg --list

（这条命令会显示所有已安装的包）

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/list_.png)

或者

    $ dpkg --list | less

（这样可以轻松的使用用户密钥来导航）

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/dpkg_list.png)

或者

如果你知道软件包的名字，你可以使用管道命令**grep**来查找，使用下面的语句：

    $ dpkg --list|grep -i  'packagename'

以**VLC**播放器为例。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/vlc_grep.png)

c. 查找要删除的包名字，这里我要使用**sox**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/remove_SoX.png)

d. 只删除一个软件包，使用下面的命令：

    $ sudo apt-get remove <packagename>

比如，删除一个叫**sox**的软件包，输入：

    $ sudo apt-get remove sox

输入y来确认卸载。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/sox2.png)

e. 要删除一个包以及它的配置文件，输入：

    $ sudo apt-get --purge remove <packagename>

比如，删除一个叫sox的包以及其所有的配置文件：

    $ sudo apt-get --purge remove sox


via: http://www.unixmen.com/removing-applications-using-terminal-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[markvv][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[markvv]:http://linux.cn/space/markvv
[Caroline]:http://linux.cn/space/14763
