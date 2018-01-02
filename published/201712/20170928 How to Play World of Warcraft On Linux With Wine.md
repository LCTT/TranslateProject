如何使用 Wine 在 Linux 下玩魔兽世界
======

**目标：**在 Linux 中运行魔兽世界

**发行版：**适用于几乎所有的 Linux 发行版。

**要求：**具有 root 权限的 Linux 系统，搭配上比较现代化的显卡并安装了最新的图形驱动程序。

**难度：**简单

**约定：**

* `#` - 要求以 root 权限执行命令，可以直接用 root 用户来执行也可以使用 `sudo` 命令
* `$` - 使用普通非特权用户执行

### 简介

魔兽世界已经出现差不多有 13 年了，但它依然是最流行的 MMORPG。 不幸的是， 一直以来暴雪从未发布过官方的 Linux 客户端。 不过还好，我们有 Wine。

### 安装 Wine

你可以试着用一下普通的 Wine，但它在游戏性能方面改进不大。 Wine Staging 以及带 Gallium Nine 补丁的 Wine 几乎在各方面都要更好一点。 如果你使用了闭源的驱动程序， 那么 Wine Staging 是最好的选择。 若使用了 Mesa 驱动程序， 则还需要打上 Gallium Nine 补丁。

根据你使用的发行版，参考 [Wine 安装指南][6] 来安装。 

### Winecfg

打开 `winecfg`。确保第一个标签页中的 Windows 版本已经设置成了 `Windows 7`。 暴雪不再对之前的版本提供支持。 然后进入 “Staging” 标签页。 这里根据你用的是 staging 版本的 Wine 还是打了 Gallium 补丁的 Wine 来进行选择。

![Winecfg Staging Settings][1]

不管是哪个版本的 Wine，都需要启用 VAAPI 以及 EAX。 至于是否隐藏 Wine 的版本则由你自己决定。

如果你用的是 Staging 补丁，则启用 CSMT。 如果你用的是 Gallium Nine，则启用 Gallium Nine。 但是你不能两个同时启用。

### Winetricks

下一步轮到 Winetricks 了。如果你对它不了解，那我告诉你， Winetricks 一个用来为 Wine 安装各种 Windows 库以及组件以便程序正常运行的脚本。 更多信息可以阅读我们的这篇文章 [Winetricks 指南][7]：

![Winetricks Corefonts Installed][2]

要让 WoW 以及<ruby>战网启动程序<rt>Battle.net launcher</rt></ruby>工作需要安装一些东西。首先，在 “Fonts” 部分中安装 `corefonts`。 然后下面这一步是可选的， 如果你希望来自互联网上的所有数据都显示在战网启动程序中的话，就还需要安装 DLL 部分中的 ie8。

### Battle.net

现在你配置好了 Wine 了，可以安装 Battle.net 应用了。 Battle.net 应用用来安装和升级 WoW 以及其他暴雪游戏。 它经常在升级后会出现问题。 因此若它突然出现问题，请查看 [WineHQ 页面][8]。

毫无疑问，你可以从 [Blizzard 的官网上][9] 下载 Battle.net 应用。

下载完毕后，使用 Wine 打开 `.exe` 文件， 然后按照安装指引一步步走下去，就跟在 Windows 上一样。

![Battle.net Launcher With WoW Installed][3]

应用安装完成后，登录/新建帐号就会进入启动器界面。 你在那可以安装和管理游戏。 然后开始安装 WoW。 这可得好一会儿。

### 运行游戏

![WoW Advanced Settings][4]

在 Battle.net 应用中点击 “Play” 按钮就能启动 WoW 了。你需要等一会儿才能出现登录界面， 这个性能简直堪称垃圾。 之所以这么慢是因为 WoW 默认使用 DX11 来加速。 进入设置窗口中的 “Advanced” 标签页， 设置图像 API 为 DX9。 保存然后退出游戏。 退出成功后再重新打开游戏。

现在游戏应该可以玩了。请注意，游戏的性能严重依赖于你的硬件水平。 WoW 是一个很消耗 CPU 的游戏， 而 Wine 更加加剧了 CPU 的负担。 如果你的 CPU 不够强劲， 你的体验会很差。 不过 WoW 支持低特效，因此你可以调低画质让游戏更流畅。

#### 性能调优

![WoW Graphics Settings][5]

很难说什么样的设置最适合你。WoW 在基本设置中有一个很简单的滑动比例条。 它的配置应该要比在 Windows 上低几个等级，毕竟这里的性能不像 Windows 上那么好。

先调低最可能的罪魁祸首。像<ruby>抗锯齿<rt>anti-aliasing</rt></ruby>和<ruby>粒子<rt>particles</rt></ruby>就常常会导致低性能。 另外，试试对比一下窗口模式和全屏模式。 有时候这两者之间的差距还是蛮大的。

WoW 对 “Raid and Battleground” 有专门的配置项。这可以在 “Raid and Battleground” 实例中的内容创建更精细的画面。 有时间 WoW 在开放地图中表现不错， 但当很多玩家出现在屏幕中时就变得很垃圾了。

实验然后看看哪些配置最适合你的系统。这完全取决于你的硬件和你的系统配置。

### 最后结语

虽然从未发布过 Linux 版的魔兽世界，但它在 Wine 上已经运行很多年了。 事实上， 它几乎一直都工作的很好。 甚至有传言说暴雪的开发人员会在 Wine 上测试以保证它是有效的。

虽然有这个说法，但后续的更新和补丁还是会影响到这个古老的游戏， 所以请随时做好出问题的准备。 不管怎样， 就算出问题了，也总是早已有了解决方案， 你只需要找到它而已。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-play-world-of-warcraft-on-linux-with-wine

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:https://linuxconfig.org/images/wow-wine-staging.jpg
[2]:https://linuxconfig.org/images/wow-wine-corefonts.jpg
[3]:https://linuxconfig.org/images/wow-bnet.jpg
[4]:https://linuxconfig.org/images/wow-api.jpg
[5]:https://linuxconfig.org/images/wow-settings.jpg
[6]:https://linuxconfig.org/installing-wine
[7]:https://linuxconfig.org/configuring-wine-with-winetricks
[8]:https://appdb.winehq.org/objectManager.php?sClass=version&iId=28855&iTestingId=98594
[9]:http://us.battle.net/en/app/
