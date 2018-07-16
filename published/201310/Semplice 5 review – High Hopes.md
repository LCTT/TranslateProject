寄予厚望——Semplice 5抢先看
=======================

有时，我会尝试一个看起来还不错的桌面发行版，因为我想看看它到底有多好，能否为Linux桌面世界带来些许新鲜空气。所以，这次我将目标瞄向了Semplice，一个基于Debian不稳定分支的桌面发行版。

据说它的名字源于“simple”，开发者们将其解释演绎为“KISS原则(KISS principle)”。（译者注，KISS原则，Keep It Simple, Stupid，直译为“保持简单、愚蠢”，你可以理解为“简约不简单”，囧）

当第一次面对以KISS原则设计的发行版时，我并没有感到太意外，因为它常常就意味着一个“皮包骨头系统”，用户得亲自矫正几乎每一个零件，才能让这种系统勉强工作。

所以，在本次短暂的“抢先看”中，我将带大家一起重点测试Semplice 5的安装过程，看看它是否值得我向我的新手用户读者们推荐，（本次测试使用2013年9月8日发布的最新版本）。

闲话少叙，开整！

**安装程序**拥有易于控制的图形化界面，风格与Ubuntu类似。支持自动分区和手动分区。如下图所示，可以看到分区这一步的两个选项。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall1-600x410.png)

选择自动分区，安装程序会自动创建两个分区，一个是Swap交换分区，另一个为主分区。如下图

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall3-600x419.png)

不幸的是，自动分区模式更像是半自动，因为在上图的步骤中，用户需要手动设置挂载点。虽然设置挂载点只是个很简单的工作，但这还是足以让我们在所谓的“自动分区”上标一个“囧”字。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall2-600x410.png)

下图中，设置用户账户时，可以看到是否允许使用传统root账户的选项。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall-600x413.png)

所有的选项步骤完成后，安装程序开始正式安装，接下来我们可以喝杯茶发发呆。整个安装程序比较简单，只是它并没有“高级选项”。而目前，“高级选项”已经成为Ubuntu安装程序的标准组成部分。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall5-600x435.png)

下图中，你可以选择是否打开某些功能。这些功能在安装完成后也可以随时修改。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall4-600x410.png)

对其中任意一项功能，你还可以进行更详细的自定义设置。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop4-600x442.png)

安装完成，系统重启后，你应该会看到下图中的登录界面。顺便一提，界面很漂亮，赞一个。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceLogin1-600x450.png)

登录之后，可以看到桌面使用的是Openbox窗口管理器，这是一款最轻量级的窗口管理器，对于新手用户来说可能并不是特别适应。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop-600x450.png)

默认情况下，在桌面或底部面板上点击鼠标右键可以呼出菜单栏。如下图所示，有4个桌面或者说工作台供用户选择。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop5-600x451.png)

由于遵循KISS原则，标准路径中的home目录是不存在的，你需要自己创建他们，汗~。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceFM-598x475.png)

再来看看应用程序，大部分用户都需要的一些标准应用程序默认已经安装好。默认安装的Web浏览器为Chromium。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceTaskM1-600x450.png)

Semplice 5 默认并不安装办公套件，因此需要我们自己安装一个，根据仓库中的记录，我们可以选择LibreOffice 4.1.1。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop8-600x450.png)

安装新程序或管理已有程序的时候，可以使用图形界面应用程序管理器 Synaptic Package Manager。它不像深度Linux软件中心那样有华丽的界面，但可以完成同样的工作。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop7-600x451.png)

系统还在菜单中提供了一些Web应用程序（例如Facebook和Twitter），你也可以通过该发行版提供的工具添加其他Web应用。只需要按照下图所示，在命令行中输入命令（oneslip-add-app gtk）就可以了。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceOneslip.png)

除了上面提到的两款管理器，系统还提供了其他图形化界面管理器。其中一个就是“服务设置管理器”，用户可以通过它来管理系统服务。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop6-354x475.png)

另外一个是“任务管理器”。目前绝大部分Linux发行版上都已经配备了标准的图形化任务管理器，很高兴在一款以KISS原则设计的Linux发行版上，我们同样也能看到。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceTaskM-546x475.png)

下图中，显示的是网络连接设置界面，用户可以为网络接口指定一个防火墙区域。但问题是提供该功能的防火墙程序FirewallD根本就没有安装，尽管用户可以从仓库中自行安装，也许是为了遵循KISS原则，但是默认连最基本的安全程序都没有，这样的发行版显然对安全问题非常不重视。

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceNM-468x475.png)

**Chakra**是我见到的第一个以KISS原则设计的Linux发行版，随着时间推移，开发者们已经渐渐改变立场，做出一些默认功能上的改进。这期间我学到的一件事就是，像Semplice这样的发行版并不是为新手用户而设计，它们更适合那些老用户——偏好资源友好、风格简约朴素的系统。

**相关源**
下载安装32位、64位系统ISO镜像点击[这里][1]。阅读发布公告点击[这里][2]。


--------------------------------------------------------------------------------

via: http://www.linuxbsdos.com/2013/09/27/semplice-5-review-high-hopes/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[wxy]:http://linux.cn/space/wxy

[1]:http://semplice-linux.org/download
[2]:http://semplice-linux.org/blog/2013/09/semplice-5-released