Gedit插件：Embedded Terminal，让你在编辑器内使用命令行终端
===============================================================

有时候在Linux上使用基于GUI的程序，你必须在程序窗口和命令行窗口之间切换。这会消耗一些时间。将一个终端窗口嵌入到程序窗口内部是个很好的解决方案。我不知道在其他程序是否可以，但是，如果你为gedit寻找一个这样的解决方案，那么这儿有一个插件-- **Embedded Terminal** -- 能让你从gedit窗口内部访问命令行终端。

**NOTE** -- 这篇文章中使用UbUntu 13.04作为例子。

###简短教程  

安装了这个插件后，可以让用户很容易地在编辑文件的同时访问命令行。

这是插件启用后的gedit窗口截图：  

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-embedded-terminal-colored.png)

如上，你可以看到在gedit窗口内部命令行操作与编辑文本文件集成到了一起。

###下载/安装

通过以下步骤来正确地在gedit下载安装和配置embedded terminal插件。

**步骤1**

通过命令安装gedit插件：

	sudo apt-get install gedit-plugins

**步骤2**  

现在，在gedit窗口里，转到Edit（编辑）-->Preferences（首选项）-->Plugins（插件）并且启动Embedded Terminal插件。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-embedded-terminal-enable.png)

**步骤3**  

在gedit窗口中点击View（视图）-->Bottom Panel（底部面板）

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-view-bottom-panel.png)

你将在gedit窗口的底部面板看到一个嵌入式终端呈现出来。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-default-embedded-terminal.png)

唯一的问题是色调搭配不是很好，比如，白色的命令提示符在淡灰色背景下几乎看不清。接下来的步骤去修改色调搭配。

**步骤4**  

打开dconf-editor，如果没有安装，通过命令来安装它：

	sudo apt-get install dconf-tools

安装后，用下面命令来执行：

	dconf-editor

在dconf editor窗口中，转到org-->gnome-->gedit-->plugins-->terminal并且取消选定use-theme-colors选项。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-dconf-settings.png)

**步骤5**  

重启gedit

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-embedded-terminal-colored.png)

可以看到，在浅色背景下的黑色的命令提示符。

**优点**  

- 从gedit窗口内部轻松访问终端
- 作为一个插件，它能节约任何时间

**缺点**  

- 在初始化配置里色调搭配问题是个主要问题（译注，估计插件作者使用的深色配色方案的Gedit，因此没有意识到这个问题，期待以后的更新版本会解决这个问题）

**总结**  

无论如何，在Linux中工作总是难以避开命令行。所以，在你常用的程序窗口中嵌入一个终端是一个好多的方法。这个gedit插件是个不错的小工具，它可以帮你节省一些时间。尝试它，它值得你安装。

---

via: http://mylinuxbook.com/embedded-terminal-a-gedit-plugin/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[wxy]:http://linux.cn/space/wxy
