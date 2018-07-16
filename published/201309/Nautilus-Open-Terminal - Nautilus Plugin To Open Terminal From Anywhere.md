Nautilus-Open-Terminal : 可随处打开终端的 Nautilus 插件
=====================================================

你工作中有在GUI和命令行之间切来切去吗？当你总是要在命令行中输入你要进入的目录的时候，你有沮丧无奈过吗？如果有的话，那么，你一定要试下这个nautilus插件 —— **nautilus-open-terminal**。

##Nautilus-Open-Terminal

Nautilus-Open-Terminal 是一个让你随处都可以打开终端的nautilus插件。尤其是当你想在一个包含子目录的目录中对某个特定目录做命令行操作的时候，它特别有用。如果你安装了这个插件，那么你只需要做的就是右键点击这个目录，然后选择菜单项**Open in Terminal**。

如下图所示：

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/open-terminal-main.png "open-terminal-main")

现在，当你点击**Open in Terminal**菜单项后，系统将会打开一个终端，以你刚刚右键所点击的目录作为终端的当前目录。

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/open-terminal-1.png "open-terminal-1")

因此，使用这个插件之后，从GUI到命令行就是如此简单。

###下载/安装

这里给出一些跟这个插件相关的链接：

- [在launchpad网站上找到该插件][1]
- [在Ubuntu Packages网站上找到该插件][2]

我第一次试着从Ubuntu软件中心下载安装这个插件的时候，报错说，我的系统中缺失一些依赖的软件包。然后又试着从命令行中下载安装，仍是相同的错误。于是，我先用命令 sudo apt-get -f install 去修复依赖关系，然后去Ubuntu软件中心下载和安装了这个插件。

**优势**

这个小插件能省掉你很多时间，再也不用在命令行和GUI间切来切去。

**劣势**

不得不在下载安装之前解决依赖缺失的错误。

**总结**

因为它很方便，所以我会向每个人去推荐这个插件。 一旦你使用了它，你就会发现它所带来的不同.


转自：http://mylinuxbook.com/nautilus-open-terminal-nautilus-plugin-to-open-terminal-from-anywhere/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[younel0925][] 校对：[wxy][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[younel0925]:http://linux.cn/space/younel0925
[wxy]:http://linux.cn/space/wxy
[1]:https://launchpad.net/ubuntu/+source/nautilus-open-terminal
[2]:http://packages.ubuntu.com/lucid/nautilus-open-terminal


