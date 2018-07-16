Ubuntu下的三个好用的CD/DVD刻录工具
==============================

大约一周前，我的朋友向我寻求一些帮助，是关于在Ubuntu下有哪些好用的CD/DVD刻录软件。此人本是windows的用户，但是由于他使用的Windows软件花费太多了，超出他的承受能力，因此他开始计划尝试使用Linux系统了。为什么不用那些免费的软件来把你喜欢的电影和音乐刻录到光盘里呢？其实windows操作系统中也有免费的替代产品，但是既然我的朋友正在走向Linux世界，让我们给他一些信息，介绍三个可以在Ubuntu Linux系统下使用的免费CD/DVD刻录工具吧。

###Brasero Disc Burner

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/burning_tools1.png)

相信每个Ubuntu的用户都很熟悉Brasero Disc Burner，因为它就是Ubuntu Linux系统自带的默认应用程序。Brasero是一个在GPL协议下发布的免费刻录程序。这个软件的优点是，它可以支持CD和DVD两种格式。Brasero可以支持单次写入数据DVD、任何类型的CD，并能使用所有的能够被本地安装的Gstreamer处理的音频文件(ogg，flac，mp3，...)。

**功能特点**

**数据CD/DVD:**

- 支持对光盘内容的编辑 （在文件夹中删除/移动/重命名文件）
- 支持实时刻录CD/DVD数据
- 自动过滤掉不合适的文件 （隐藏文件，损坏/递归的链接文件，不符合Joliet标准的文件，...）
- 支持多区段刻录
- 支持Joliet扩展
- 能将光盘镜像写入到硬盘中
- 能够检查光盘文件完整性

**音频 CD:**

- 写入CD-TEXT信息（通过Gstreamer自动寻找）
- 支持编辑CD-TEXT信息
- 能够多区段刻录音频CD
- 能够使用所有可以被本地安装的Gstreamer所处理的音频文件(ogg，flac，mp3，...)。
- 能够在已删除的文件夹内查询音频文件
- 在曲目间完全无噪音的编辑

你可以在[这里][1]读到完整的功能列表。

###K3b

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/burning_tools2.png)

K3b是另一个能够完成大多数CD/DVD刻录任务的免费工具。这个功能丰富的软件有一个使用便捷的用户界面，并且能够处理蓝光或者高清DVD光盘。

该软件包含三个基本部分：

**项目：**

项目可以从文件菜单中创建，并且可以放入待刻录的数据

**工具：**

工具菜单内提供各种工具，比如CD复制或者DVD格式化。

**根据不同任务提供相关的媒体工具：**

当点击代表CD/DVD的驱动器图标时，K3b会展示出相关内容，并允许做一些更进一步的操作。比如翻录音频CD。

K3b能够把MP3和OGG的文件自动重命名为“艺术家-标题.mp3”这样的通用格式，可以通过托拽来刻录数据CD或者ISO镜像，可以创建eMovix格式的CD/DVD，能够把音频光碟翻录成任意CD数据库所支持的格式……这些还只是K3b的部分功能。你可以从[这里][2]阅读更多有关它的功能的资料。

###Xfburn

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/burning_tools3.png)

Xfburn是另一个能够刻录CD/DVD的工具，它可以很好的运行在Xfce桌面环境中。它非常快速，轻量级，能够刻录视频CD和DVD。如果你不想为了K3b而安装KDE桌面环境的话，它会是最好的选择。

**提醒**：Xfburn 目前还在开发中，因此一些功能尚不具备，但是对于刻录数据来讲，它已经是一个非常好的工具了。

----


via: http://www.unixmen.com/3-good-cd-dvd-burning-tools-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[markvv][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[markvv]:http://linux.cn/space/markvv
[Caroline]:http://linux.cn/space/14763

[1]:https://projects.gnome.org/brasero/
[2]:http://www.k3b.org/
