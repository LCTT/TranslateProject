[#]: subject: "Customizing GNOME with Just Perfection Extension"
[#]: via: "https://itsfoss.com/just-perfection-gnome-extension/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16230-1.html"

使用 Just Perfection 扩展定制 GNOME
======

![][0]

> 利用 Just Perfection GNOME 扩展为你的 Linux 桌面带来全新的个性化定制体验。

GNOME 在 Linux 界中备受喜爱，是 [最热门的桌面环境][1] 之一。

然而，讨论到 GNOME 的可定制程度，你会发现与 KDE 相比，可供选择的选项相对较少。

这并不意味着我们无法 [定制 GNOME][2]。图形化的界面工具 <ruby>[GNOME 调整][3]<rt>GNOME Tweaks</rt></ruby> 让你能轻松改变一些常规配置。而对于更深层次的设置更改，可以使用 [dconf 编辑器][4]，不过这对许多人可能略显复杂。

在此，我想向你推荐一款名叫 **Just Perfection** 的 GNOME 扩展，它帮助你一次性修改桌面的多种设置。

### Just Perfection，一款全能扩展 🌟

![][5]

如果 Just Perfection 扩展的名称是 “Do it all” 或许会更符合其特性。我在后续的功能介绍中会更详细地解释此扩展的用途。

通过使用这个扩展，你可以进行诸如设置 <ruby>停靠区<rt>Dock</rt></ruby>、通知面板、图标，以及调整与 GNOME 交互方式等一系列的微调。

Just Perfection 这款工具有以下一些核心特性：

  * 提供 4 个预设的用户配置文件
  * 可以启用/禁用 `super` 键、动画、面板、时钟、日历等功能
  * 可以启用/禁用应用菜单、面板通知、电源图标及活动状态的图标显示
  * 可以个性化调整面板、通知栏、OSD 位置（音量/亮度弹出）、窗口尺寸，以及在按下 `Alt + Tab` 时的应用程序预览
  * 可以调整工作空间预览的行为、是否展示工作空间切换器、应用网格的打开方式等等

这些功能听起来确实令人期待，对吗？

#### Just Perfection 的安装方法

Linux 上安装 GNOME 扩展有 [多种途径][6]。其中一个是通过网页浏览器来进行安装。

若要使用网页浏览器进行安装，请访问其官方下载页面：

> **[获取 Just Perfection][7]**

在完成安装之后，你可以在下载页面看到一个设置图标，点击它，就会弹出一个对话框，你可以在其中调整 Just Perfection 扩展的设置：

![][8]

### Just Perfection GNOME 扩展的使用方法

使用这款扩展最方便的方法，就是选择四个预先配置好的用户配置之一。

虽然这一步是可选的，我还是建议启用“覆盖 Shell 主题”的选项，这样可以让你的桌面更具视觉吸引力：

![][9]

一旦做了这个操作，它会自动切换到 `Custom` 用户配置，同时使停靠区背景变为透明。

关于各个用户配置文件的简述：

  * `Default`：默认文件，不会做出任何改变，但如果你启用了覆盖 Shell 的选项，它会稍微缩小面板和停靠区的尺寸。
  * `Custom`：在启用且覆盖 Shell 选项后生效，可将停靠区背景变为透明。
  * `Minimal`：减少停靠区和面板的尺寸，增加更多的屏幕工作区域。
  * `Super Minimal`：移除停靠区和面板，给予你一个干净的视野和最大的屏幕工作空间。

以下是在切换这些用户配置文件时的预期效果情况：

![][9A]

现在，你可以启用或禁用各种选项，来定制你理想的桌面环境。

### 使用 Just Perfection 创造简洁的桌面环境

在本节，我将展示如何实现一个由 Linux Mint 的 Cinnamon 桌面启发的简约桌面体验，其视觉效果如下：

![][10]

下图是在切换工作空间时的显示效果：

![][11]

为了使我的桌面看起来如上所示的简约，我进行了以下设定：

  * 透明的停靠区定位于右侧（可在系统菜单中设置）
  * 将面板位置调整到底部
  * 从面板中移除 <ruby>应用<rt>Application</rt></ruby> 菜单及 <ruby>活动<rt>Activities</rt></ruby>
  * 将时钟调整到左下角
  * 设置通知弹出位置为左下角
  * 启用工作区切换器
  * 增大工作区概览面板的半径

不过这些步骤可根据个人喜好进行跳过。

#### 1、将透明的停靠区定位在右侧

要实现透明的停靠区，你需要在 “<ruby>用户配置<rt>Profile</rt></ruby>” 菜单中选取 `Custom` 配置文件，并启用 “<ruby>Shell 主题<rt>Shell Theme</rt></ruby>” 选项即可：

![][12]

如果你使用的是 Ubuntu 的最新版本，你可以在系统菜单中找到调整停靠区位置的选项。

首先，在系统菜单中打开设置，然后进入 “<ruby>外观<rt>Appearance</rt></ruby>” 菜单。在 “<ruby>停靠区<rt>Dock</rt></ruby>” 部分，你会找到 “<ruby>在屏幕上的位置<rt>Position on screen</rt></ruby>” 选项。

在这里选择 “<ruby>右侧<rt>Right</rt></ruby>” 即可：

![][13]

对于使用较旧 GNOME 版本的用户，你可能无法找到这个菜单。

然而，不必担心，你可以 [安装名为 Dash to Dock 的扩展][14] 来获得相同的效果。

在此，你需进行以下两个设置：

  * 将屏幕上的位置选项设为 “<ruby>右侧<rt>Right</rt></ruby>”
  * 如果已经选中了面板模式，取消选中即可

![][15]

#### 2、将面板定位至底部

要将面板定位至底部，前往 “<ruby>定制<rt>Customize</rt></ruby>” 菜单，找到 “<ruby>面板位置<rt>Panel Position</rt></ruby>” 选项。

双击这个选项并选择 “<ruby>底部<rt>Bottom</rt></ruby>”：

![][16]

#### 3、将时钟位置设定在左下角

过去的六个月里我一直在以此方式使用时钟，这对我的工作流程帮助很大。简单说，你会更频繁地看时钟，以此更快地对时间有所感触。

这也让桌面看起来更好！

要更改时钟位置，进入 “定制” 菜单，然后找到 “<ruby>时钟菜单位置<rt>Clock Menu Position</rt></ruby>” 选项，选择 “<ruby>左侧<rt>Left</rt></ruby>”：

![][17]

#### 4、移除应用菜单和活动按钮

![][18]

我注意到用户中鲜有人使用这两个选项，因此移除它们不失为一种方式，这样可以使界面看上去更清晰简洁。

要达到目的，你需要前往 “<ruby>视觉<rt>Visibility</rt></ruby>” 菜单，然后取消以下两个选项：

  * 活动按钮
  * 应用菜单

![][19]

#### 5、将通知弹窗定位至右下角

因为面板自身已经被移动到底部，所以（至少对我来说）将弹窗放在顶部毫无意义。而且，相比从顶部，从底部阅读信息要更加方便。

为此，你需要做以下两步：

  * 前往 “定制” 菜单
  * 在 “<ruby>提示栏位置<rt>Notification Banner Position</rt></ruby>` 中选择 “<ruby>底部末端<rt>Bottom End</rt></ruby>”。

![][20]

#### 6、启用工作区切换器

当你在预览多个工作区的活动时，工作区切换器可以显示每个工作区的预览。

可能有些混淆？启用后的样子如下：

![][21]

这样，你只需要按下 `super` 键，就可以清楚地查看在每个工作区中发生的事情。

当然，你同样可以通过（按两下 `super` 键）打开系统菜单来获得相同的视角，但为何要浪费一次按键并打开系统菜单，而不是在预览窗口中就实现呢？

要启用这个功能，需要以下三步：

  * 前往 “<ruby>行为<rt>Behavior</rt></ruby>” 菜单并打开 “<ruby>始终显示工作区切换器<rt>Always Show Workspace Switcher</rt></ruby>”
  * 进入 “<ruby>定制<rt>Customize</rt></ruby>” 菜单
  * 为 “<ruby>工作区切换器大小<rt>Workspace Switcher Size</rt></ruby>” 选择 `11%`

![][22]

我增加工作区切换器大小的原因是，我觉得默认的视图尺寸相对较小。

#### 7、增大工作区概览面板的圆角半径

我非常喜欢圆角设计，尤其是当它应用在工作区概览面板上时，当壁纸与设置相得益彰时尤为如此。

这就是应用上述设置后的效果：

![][23]

要增加工作区概览面板圆角的半径，你需要：

  * 前往 “定制” 菜单
  * 在 “<ruby>工作区背景圆角尺寸<rt>Workspace Background Corner Size</rt></ruby>” 中选择 `60px` （这是最大的设置值）

![][24]

### 关于 GNOME 更深层次的自定义

如果你是 Ubuntu 的新手，那么我们有一份详细的指南，可以带你熟悉 [如何自定义 GNOME][2]：

> **[如何自定义 GNOME][2]**

下面会演示如何使用 GNOME Tweak 工具来提升 GNOME 的使用感受：

> **[在 Ubuntu 等 Linux 下安装和使用 GNOME 调整工具][25]**

我希望这篇指南能对你有所帮助。

*（题图：MJ/a7937194-0bf3-4626-99b6-4fbba1790314）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/just-perfection-gnome-extension/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lct/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-desktop-environments/
[2]: https://itsfoss.com/gnome-tricks-ubuntu/
[3]: https://itsfoss.com/gnome-tweak-tool/
[4]: https://wiki.gnome.org/Apps/DconfEditor
[5]: https://itsfoss.com/content/images/2023/08/just-perfection-extension-in-GNOME.png
[6]: https://itsfoss.com/gnome-shell-extensions/
[7]: https://extensions.gnome.org/extension/3843/just-perfection/
[8]: https://itsfoss.com/content/images/2023/08/how-to-use-gnome-extensions-after-installing-them.png
[9]: https://itsfoss.com/content/images/2023/08/override-shell-theme-in-just-perfection-extension.png
[9A]: https://img.linux.net.cn/data/attachment/album/202309/27/100959yhk99zaz4as3qah4.gif
[10]: https://itsfoss.com/content/images/2023/08/main-desktop-with-message.png
[11]: https://itsfoss.com/content/images/2023/08/activities-after-customisation.png
[12]: https://itsfoss.com/content/images/2023/08/Use-custom-profile-in-just-perfection-GNOME-extension.png
[13]: https://itsfoss.com/content/images/2023/08/change-position-of-dock-1.png
[14]: https://news.itsfoss.com/dash-to-dock-gnome-40/
[15]: https://itsfoss.com/content/images/2023/08/Change-dock-position-using-the-dask-to-dock-extension.png
[16]: https://itsfoss.com/content/images/2023/08/change-panel-to-bottom-in-GNOME.png
[17]: https://itsfoss.com/content/images/2023/08/change-clock-position-to-left.png
[18]: https://itsfoss.com/content/images/2023/08/Remove-Activities-and-App-menu-from-Ubuntu-GNOME.png
[19]: https://itsfoss.com/content/images/2023/08/disable-Activities-and-App-menu-from-Ubuntu-GNOME.png
[20]: https://itsfoss.com/content/images/2023/08/change-notification-pop-up-location-in-GNOME.png
[21]: https://itsfoss.com/content/images/2023/08/enable-workspace-switcher-in-GNOME-overview.png
[22]: https://itsfoss.com/content/images/2023/08/enable-always-show-workspace-switcher.png
[23]: https://itsfoss.com/content/images/2023/08/Change-corner-radius-of-workspace-switcher-pane-in-GNOME-ubuntu.png
[24]: https://itsfoss.com/content/images/2023/08/increse-radius-of-workspace-corners-in-GNOME-Ubuntu.png
[25]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[0]: https://img.linux.net.cn/data/attachment/album/202309/27/100446sz5yo50qzg49eqqo.jpg