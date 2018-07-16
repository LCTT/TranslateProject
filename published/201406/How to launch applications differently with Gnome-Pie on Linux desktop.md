Linux桌面上的小饼饼，让启动应用分外不同！
================================================================================

最近，你能听到很多关于Ubuntu新的Unity界面的抱怨。我记得，当Unity开始兴起的时候，我正好离开Archlinux。然而，Unity间接地导致了一个后果：随着人们对它不满意，人们开始关注其他的桌面环境和Linux发行版。而如果你的系统支持Unity，没有人会反对将它弄得更顺眼些。

所以今天我向你推荐一个绝对原创的程序启动器： Gnome-Pie。你们可能会认为他的灵感来自魔兽世界插件"OPie"。因为他们有着相似的概念： 键盘快捷方式可以打开圆形"菜单"，您可以从中选择一个应用程序或命令来启动。这种设计背后的主要思想是用户不必记住命令，但需要记住他的方向和操作。它的饼形设计让指针可以用同样的距离启动每个应用程序。再加上我们还有如此多自定义组合键，极大的提高效率并且最大限度地实现了人机工程学。

### 安装Gnome-Pie ###

在Ubuntu上，Gnome-Pie 可以从universe仓库中获得, 但是，某些原因，这个版本不是很稳定，常常会崩溃。作为一个备选方案，我建议你从官方的源进行下载。

    $ sudo add-apt-repository ppa:simonschneegans/testing
    $ sudo apt-get update
    $ sudo apt-get install gnome-pie 

在Fedora, 你可以使用以下命令：

    $ sudo yum install gnome-pie 

对于Archlinux, 你可以在[AUR][1]找到它。

### Gnome-Pie的基本用法 ###

默认的，Gnome-Pie有一个比较可靠的初始配置。首先，你可以使用 **Ctrl + Alt + a** 调出，它将显示你的系统的基本应用程序。

![](https://farm3.staticflickr.com/2917/14040269128_6dc6544c14_z.jpg)

接下来， 按下 **Ctrl+Alt+b** 调出第二个圆，这将显示你的文件管理器的书签。

![](https://farm3.staticflickr.com/2903/14040269088_8de29edd18.jpg)

第三个，也许是最有用的，它会显示你的应用程序菜单，按下 **Ctrl + Alt + 空格** 可调出。

![](https://farm3.staticflickr.com/2903/14040345657_071f40b22f_z.jpg)

第四个，仅用于控制音乐播放器。你可以猜到，快捷键是 **Ctrl + Alt + m**。

![](https://farm3.staticflickr.com/2925/14226915065_8b0e3841c6_o.png)

第五个，你可以快速访问重新启动、 关机和注销命令 (**Ctrl + Alt + q**，我猜q是代表退出吧）。

![](https://farm3.staticflickr.com/2931/14040303600_5b3a517335_o.png)

最后，第六个，你可以用Pie来控制窗口，可以最小化、 规模、 关闭， 等等. 并且，快捷键是 **Ctrl+Alt+w**。

![](https://farm3.staticflickr.com/2904/14226699514_42d364a4d4_o.png)

虽然我发现这种默认设置已经是相当令人满意，几乎和预置的启动器一样好。然而，如果让我鸡蛋里找骨头，我会说一些快捷方式很难用一只手执行。大多数情况是，我们用两只手打开菜单，然后再回到鼠标以选择该选项。太不爽了。

然而，我们在用 Linux！谁会在乎默认设置？自定义才是王道。Gnome-Pie将为你提供优良的服务。通过配置，你可以编辑现有的Pie，改变程序图标，设计自己的Pie，改变主题，甚至将另外一个Pie菜单作为一个子菜单。

[![](https://farm6.staticflickr.com/5508/14247093043_1fe1188709_z.jpg)][2]

你甚至可以编辑它来访问 URL、 自由设置热键、运行你自己的命令。惟一的缺憾可能是它缺少Widgets。

![](https://farm3.staticflickr.com/2927/14040264609_b7aa66f078_z.jpg)

总之，相较于传统的基于文本的启动器，Gnome-Pie是一个相当有吸引力的可视化应用程序。我很喜欢他的自定义键盘和鼠标组合键，让我想起了我在War3或者LOL中的神级操作。如果玩家使用这种操作方式，它可以为你带来方便和高效。如果你想节约桌面空间，我甚至建议你不要将预置的启动器放到桌面上。总之，我甚至敢说它可以替代Gnome。

你觉得怎么样？你在所有相信世界上有这么好的东西吗？或者说，随着新的Gnome shell出现，Gnome-Pie开始失去竞争力？欢迎评论。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/launch-applications-differently-gnome-pie-linux-desktop.html

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://aur.archlinux.org/packages/gnome-pie/
[2]:https://www.flickr.com/photos/xmodulo/14247093043/
