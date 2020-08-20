[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12183-1.html)
[#]: subject: (16 Things to do After Installing Ubuntu 20.04)
[#]: via: (https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

安装完 Ubuntu 20.04 后要做的 16 件事
======

> 以下是安装 Ubuntu 20.04 之后需要做的一些调整和事项，它将使你获得更流畅、更好的桌面 Linux 体验。

[Ubuntu 20.04 LTS（长期支持版）带来了许多新的特性][1]和观感上的变化。如果你要安装 Ubuntu 20.04，让我向你展示一些推荐步骤便于你的使用。

### 安装完 Ubuntu 20.04 LTS “Focal Fossa” 后要做的 16 件事 

![][2]

我在这里提到的步骤仅是我的建议。如果一些定制或调整不适合你的需要和兴趣，你可以忽略它们。

同样的，有些步骤看起来很简单，但是对于一个 Ubuntu 新手来说是必要的。

这里的一些建议适用于启用 GNOME 作为默认桌面 Ubuntu 20.04，所以请检查 [Ubuntu 版本][3]和[桌面环境][4]。

以下列表便是安装了代号为 Focal Fossa 的 Ubuntu 20.04 LTS 之后要做的事。

#### 1、通过更新和启用额外的软件仓库来准备你的系统

安装 Ubuntu 或任何其他 Linux 发行版之后，你应该做的第一件事就是更新它。Linux 的运作是建立在本地的可用软件包数据库上，而这个缓存需要同步以便你能够安装软件。

升级 Ubuntu 非常简单。你可以运行软件更新从菜单（按 `Super` 键并搜索 “software updater”):

![Ubuntu 20.04 的软件升级器][5]

你也可以在终端使用以下命令更新你的系统:

```
sudo apt update && sudo apt upgrade
```

接下来，你应该确保启用了 [universe（宇宙）和 multiverse（多元宇宙）软件仓库][6]。使用这些软件仓库，你可以访问更多的软件。我还推荐阅读关于 [Ubuntu 软件仓库][6]的文章，以了解它背后的基本概念。

在菜单中搜索 “Software & Updates”：

![软件及更新设置项][7]

请务必选中软件仓库前面的勾选框：

![启用额外的软件仓库][8]

#### 2、安装媒体解码器来播放 MP3、MPEG4 和其他格式媒体文件

如果你想播放媒体文件，如 MP3、MPEG4、AVI 等，你需要安装媒体解码器。由于各个国家的版权问题， Ubuntu 在默认情况下不会安装它。

作为个人，你可以[使用 Ubuntu Restricted Extra 安装包][9]很轻松地安装这些媒体编解码器。这将[在你的 Ubuntu 系统安装][10]媒体编解码器、Adobe Flash 播放器和微软 True Type 字体等。

你可以通过[点击这个链接][11]来安装它（它会要求在软件中心打开它），或者使用以下命令:

```
sudo apt install ubuntu-restricted-extras
```

如果遇到 EULA 或许可证界面，请记住使用 `tab` 键在选项之间进行选择，然后按回车键确认你的选择。

![按 tab 键选择 OK 并按回车键][12]

#### 3、从软件中心或网络上安装软件

现在已经设置好了软件仓库并更新了软件包缓存，应该开始安装所需的软件了。

在 Ubuntu 中安装应用程序有几种方法，最简单和正式的方法是使用软件中心。

![Ubuntu 软件中心][14]

如果你想要一些关于软件的建议，请参考这个[丰富的各种用途的 Ubuntu 应用程序列表][15]。

一些软件供应商提供了 .deb 文件来方便地安装他们的应用程序。你可以从他们的网站获得 .deb 文件。例如，要[在 Ubuntu 上安装谷歌 Chrome][16]，你可以从它的网站上获得 .deb 文件，双击它开始安装。

#### 4、享受 Steam Proton 和 GameModeEnjoy 上的游戏

[在 Linux 上进行游戏][17]已经有了长足的发展。你不再受限于自带的少数游戏。你可以[在 Ubuntu 上安装 Steam][18]并享受许多游戏。

[Steam 新的 Proton 项目][19]可以让你在 Linux 上玩许多只适用于 Windows 的游戏。除此之外，Ubuntu 20.04 还默认安装了 [Feral Interactive 的 GameMode][20]。

GameMode 会自动调整 Linux 系统的性能，使游戏具有比其他后台进程更高的优先级。

这意味着一些支持 GameMode 的游戏（如[古墓丽影·崛起][21]）在 Ubuntu 上的性能应该有所提高。

#### 5、管理自动更新（适用于进阶用户和专家）

最近，Ubuntu 已经开始自动下载并安装对你的系统至关重要的安全更新。这是一个安全功能，作为一个普通用户，你应该让它保持默认开启。

但是，如果你喜欢自己进行配置更新，而这个自动更新经常导致你[“无法锁定管理目录”错误][22]，也许你可以改变自动更新行为。

你可以选择“立即显示”，这样一有安全更新就会立即通知你，而不是自动安装。

![管理自动更新设置][23]

#### 6、控制电脑的自动挂起和屏幕锁定

如果你在笔记本电脑上使用 Ubuntu 20.04，那么你可能需要注意一些电源和屏幕锁定设置。

如果你的笔记本电脑处于电池模式，Ubuntu 会在 20 分钟不活动后休眠系统。这样做是为了节省电池电量。就我个人而言，我不喜欢它，因此我禁用了它。

类似地，如果你离开系统几分钟，它会自动锁定屏幕。我也不喜欢这种行为，所以我宁愿禁用它。

![Ubuntu 20.04 的电源设置][24]

#### 7、享受夜间模式

[Ubuntu 20.04 中最受关注的特性][25]之一是夜间模式。你可以通过进入设置并在外观部分中选择它来启用夜间模式。

![开启夜间主题 Ubuntu][26]

你可能需要做一些[额外的调整来获得完整的 Ubuntu 20.04 夜间模式][27]。

#### 8、控制桌面图标和启动程序

如果你想要一个最简的桌面，你可以禁用桌面上的图标。你还可以从左侧禁用启动程序，并在顶部面板中禁用软件状态栏。

所有这些都可以通过默认的新 GNOME 扩展来控制，该程序默认情况下已经可用。

![禁用 Ubuntu 20 04 的 Dock][28]

顺便说一下，你也可以通过“设置”->“外观”来将启动栏的位置改变到底部或者右边。

#### 9、使用表情符和特殊字符，或从搜索中禁用它

Ubuntu 提供了一个使用表情符号的简单方法。在默认情况下，有一个专用的应用程序叫做“字符”。它基本上可以为你提供表情符号的 [Unicode][29]。

不仅是表情符号，你还可以使用它来获得法语、德语、俄语和拉丁语字符的 unicode。单击符号你可以复制 unicode，当你粘贴该代码时，你所选择的符号便被插入。

![Ubuntu 表情符][30]

你也能在桌面搜索中找到这些特殊的字符和表情符号。也可以从搜索结果中复制它们。

![表情符出现在桌面搜索中][31]

如果你不想在搜索结果中看到它们，你应该禁用搜索功能对它们的访问。下一节将讨论如何做到这一点。

#### 10、掌握桌面搜索

GNOME 桌面拥有强大的搜索功能，大多数人使用它来搜索已安装的应用程序，但它不仅限于此。

按 `Super` 键并搜索一些东西，它将显示与搜索词匹配的任何应用程序，然后是系统设置和软件中心提供的匹配应用程序。

![桌面搜索][32]

不仅如此，搜索还可以找到文件中的文本。如果你正在使用日历，它也可以找到你的会议和提醒。你甚至可以在搜索中进行快速计算并复制其结果。

![Ubuntu搜索的快速计算][33]

你可以进入“设置”中来控制可以搜索的内容和顺序。

![][34]

#### 11、使用夜灯功能，减少夜间眼睛疲劳

如果你在晚上使用电脑或智能手机，你应该使用夜灯功能来减少眼睛疲劳。我觉得这很有帮助。

夜灯的特点是在屏幕上增加了一种黄色的色调，比白光少了一些挤压感。

你可以在“设置”->“显示”切换到夜灯选项卡来开启夜光功能。你可以根据自己的喜好设置“黄度”。

![夜灯功能][35]

#### 12、使用 2K/4K 显示器？使用分辨率缩放得到更大的图标和字体

如果你觉得图标、字体、文件夹在你的高分辨率屏幕上看起来都太小了，你可以利用分辨率缩放。

启用分辨率缩放可以让你有更多的选项来从 100% 增加到 200%。你可以选择适合自己喜好的缩放尺寸。

![在设置->显示中启用高分缩放][36]

#### 13、探索 GNOME 扩展功能以扩展 GNOME 桌面可用性

GNOME 桌面有称为“扩展”的小插件或附加组件。你应该[学会使用 GNOME 扩展][37]来扩展系统的可用性。

如下图所示，天气扩展顶部面板中显示了天气信息。不起眼但十分有用。你也可以在这里查看一些[最佳 GNOME 扩展][38]。不需要全部安装，只使用那些对你有用的。

![天气扩展][39]

#### 14、启用“勿扰”模式，专注于工作

如果你想专注于工作，禁用桌面通知会很方便。你可以轻松地启用“勿扰”模式，并静音所有通知。

![启用“请勿打扰”清除桌面通知][40]

这些通知仍然会在消息栏中，以便你以后可以阅读它们，但是它们不会在桌面上弹出。

#### 15、清理你的系统

这是你安装 Ubuntu 后不需要马上做的事情。但是记住它会对你有帮助。

随着时间的推移，你的系统将有大量不再需要的包。你可以用这个命令一次性删除它们:

```
sudo apt autoremove
```

还有其他[清理 Ubuntu 以释放磁盘空间的方法][41]，但这是最简单和最安全的。

#### 16、根据你的喜好调整和定制 GNOME 桌面

我强烈推荐[安装 GNOME 设置工具][42]。这将让你可以通过额外的设置来进行定制。

![Gnome 设置工具][43]

比如，你可以[以百分比形式显示电池容量][44]、[修正在触摸板右键问题][45]、改变 Shell 主题、改变鼠标指针速度、显示日期和星期数、改变应用程序窗口行为等。

定制是没有尽头的，我可能仅使用了它的一小部分功能。这就是为什么我推荐[阅读这些][42]关于[自定义 GNOME 桌面][46]的文章。

你也可以[在 Ubuntu 中安装新主题][47]，不过就我个人而言，我喜欢这个版本的默认主题。这是我第一次在 Ubuntu 发行版中使用默认的图标和主题。

#### 安装 Ubuntu 之后你会做什么?

如果你是 Ubuntu 的初学者，我建议你[阅读这一系列 Ubuntu 教程][48]开始学习。

这就是我的建议。安装 Ubuntu 之后你要做什么？分享你最喜欢的东西，我可能根据你的建议来更新这篇文章。

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12146-1.html
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/things-to-do-after-installing-ubuntu-20-04.jpg?ssl=1
[3]: https://linux.cn/article-9872-1.html
[4]: https://linux.cn/article-12124-1.html
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updater-ubuntu-20-04.jpg?ssl=1
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updates-settings-ubuntu-20-04.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/extra-repositories-ubuntu-20.jpg?ssl=1
[9]: https://linux.cn/article-11906-1.html
[10]: https://linux.cn/article-12074-1.html
[11]: //ubuntu-restricted-extras/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/installing_ubuntu_restricted_extras.jpg?ssl=1
[13]: https://itsfoss.com/remove-install-software-ubuntu/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-center-ubuntu-20.png?resize=800%2C509&ssl=1
[15]: https://itsfoss.com/best-ubuntu-apps/
[16]: https://itsfoss.com/install-chrome-ubuntu/
[17]: https://linux.cn/article-7316-1.html
[18]: https://itsfoss.com/install-steam-ubuntu-linux/
[19]: https://linux.cn/article-10054-1.html
[20]: https://github.com/FeralInteractive/gamemode
[21]: https://en.wikipedia.org/wiki/Rise_of_the_Tomb_Raider
[22]: https://itsfoss.com/could-not-get-lock-error/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/auto-updates-ubuntu.png?resize=800%2C361&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/power-settings-ubuntu-20-04.png?fit=800%2C591&ssl=1
[25]: https://www.youtube.com/watch?v=lpq8pm_xkSE
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-dark-theme-ubuntu.png?ssl=1
[27]: https://linux.cn/article-12098-1.html
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/disable-dock-ubuntu-20-04.png?ssl=1
[29]: https://en.wikipedia.org/wiki/List_of_Unicode_characters
[30]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/emoji-ubuntu.jpg?ssl=1
[31]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/emojis-desktop-search-ubuntu.jpg?ssl=1
[32]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-desktop-search-1.jpg?ssl=1
[33]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/quick-calculations-ubuntu-search.jpg?ssl=1
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/search-settings-control-ubuntu.png?resize=800%2C534&ssl=1
[35]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/nightlight-ubuntu-20-04.png?ssl=1
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/fractional-scaling-ubuntu.jpg?ssl=1
[37]: https://itsfoss.com/gnome-shell-extensions/
[38]: https://itsfoss.com/best-gnome-extensions/
[39]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/weather-extension-ubuntu.jpg?ssl=1
[40]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/do-not-distrub-option-ubuntu-20-04.png?ssl=1
[41]: https://itsfoss.com/free-up-space-ubuntu-linux/
[42]: https://itsfoss.com/gnome-tweak-tool/
[43]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/gnome-tweaks-tool-ubuntu-20-04.png?fit=800%2C551&ssl=1
[44]: https://itsfoss.com/display-battery-ubuntu/
[45]: https://itsfoss.com/fix-right-click-touchpad-ubuntu/
[46]: https://itsfoss.com/gnome-tricks-ubuntu/
[47]: https://itsfoss.com/install-themes-ubuntu/
[48]: https://itsfoss.com/getting-started-with-ubuntu/
