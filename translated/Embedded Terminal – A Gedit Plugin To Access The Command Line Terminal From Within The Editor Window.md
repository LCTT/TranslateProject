Embedded Terminal（嵌入式的终端） -- 一个Gedit插件由编辑器内部访问命令行终端
===

有时候在Linux上使用基于GUI的程序，你必须在程序窗口和命令行窗口之间切换。这会消耗一些时间。一个终端窗口嵌入到程序窗口内部对这个问题是个很好的解决方案。我不确信在其他程序上起作用，但是，如果你寻找gedit这样一个解决方案，那么这有一个插件-- **Embedded Terminal** -- 能让你从gedit窗口内部访问命令行终端。

**Gedit Embedded Terminal 插件**  

**NOTE** -- 这篇文章中UBUntu 13.04适用于所有例子。

**简短教程**  

一旦这个插件安装好，它使得用户非常容易编辑文件和同时访问命令行。

这是插件启用后的gedit窗口截图：  

![](https://github-camo.global.ssl.fastly.net/ac6452bd74d8c0fd02924032aef7aecc86ae97b0/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f67656469742d656d6265646465642d7465726d696e616c2d636f6c6f7265642e706e67)

所以，你可以看到在gedit窗口内部命令行操作与编辑文本文件相处融洽。

**下载/安装**  

下一步需要正确的在gedit下载安装配置embedded terminal插件。

**步骤1**  

通过命令安装gedit插件：

	sudo apt-get install gedit-plugins

**步骤2**  

现在，在gedit窗口里，转到Edit（编辑）-->Preferences（首选项）-->Plugins（插件）并且启动Embedded Terminal插件。

![](https://github-camo.global.ssl.fastly.net/db325b2b6f2aebefa8b82e736343aa16c1b6edc9/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f67656469742d656d6265646465642d7465726d696e616c2d656e61626c652e706e67)

**步骤3**  

在gedit窗口中点击View（视图）-->Bottom Panel（底部面板）

![](https://github-camo.global.ssl.fastly.net/536db94fb4cd44e2f16ae737c1b2d0707caac11e/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f67656469742d766965772d626f74746f6d2d70616e656c2e706e67)

你将在gedit窗口的底部面板看到一个嵌入式终端呈现出来、

![](https://github-camo.global.ssl.fastly.net/eaaee6ce531562c6521e2d73edda325f389e774a/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f67656469742d64656661756c742d656d6265646465642d7465726d696e616c2e706e67)

唯一的问题是色调搭配不是很好，也就是，白色命令风格在淡灰色背景下使得它几乎不能去工作。接下来的步骤去改变色调搭配。

**步骤4**  

打开dconf-editor，如果没有安装，通过命令来安装它：

	sudo apt-get install dconf-tools

安装后，用下面命令来执行：

	dconf-editor

在dconf editor窗口中，转到org-->gnome-->gedit-->plugins-->terminal并且取消选定use-theme-colors选项。

![](https://github-camo.global.ssl.fastly.net/4272431b181243e1b609d466c3e00e3490f9ce7e/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f67656469742d64636f6e662d73657474696e67732e706e67)

**步骤5**  

重启gedit

![](https://github-camo.global.ssl.fastly.net/ac6452bd74d8c0fd02924032aef7aecc86ae97b0/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f67656469742d656d6265646465642d7465726d696e616c2d636f6c6f7265642e706e67)

注意到，已经激活黑色命令风格色系超过淡色背景。

**优点**  

- 从gedit窗口内部轻松访问终端
- 作为一个插件，它能节约任何时间

**缺点**  

- 在初始化配置里色调搭配问题是个主要障碍

**总结**  

无论你怎样努力尝试，在Linux中工作难以避开命令行。所以，当你使用多了，它总是在程序窗口有好处的一个嵌入式终端。这个gedit插件是个不错的小工具，它能帮你在任何时间保存。尝试它，它值得你安装。

via: <http://mylinuxbook.com/embedded-terminal-a-gedit-plugin/>

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID