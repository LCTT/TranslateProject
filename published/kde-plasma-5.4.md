KDE Plasma 5.4.0 发布，八月特色版
=============================

![Plasma 5.4](https://www.kde.org/announcements/plasma-5.4/plasma-screen-desktop-2-shadow.png)

2015 年 8 月 25 ，星期二，KDE 发布了 Plasma 5 的一个特色新版本。

此版本为我们带来了许多非常棒的感受，如优化了对高分辨率的支持，KRunner 自动补全和一些新的 Breeze 漂亮图标。这还为不久以后的技术预览版的 Wayland 桌面奠定了基础。我们还带来了几个新组件，如声音音量部件，显示器校准工具和测试版的用户管理工具。

###新的音频音量程序

![The new Audio Volume Applet](https://www.kde.org/announcements/plasma-5.4/plasma-screen-audiovolume-shadows.png)

新的音频音量程序直接工作于 PulseAudio (Linux 上一个非常流行的音频服务) 之上 ，并且在一个漂亮的简约的界面提供一个完整的音量控制和输出设定。

###替代的应用控制面板起动器

![he new Dashboard alternative launcher](https://www.kde.org/announcements/plasma-5.4/plasma-screen-dashboard-2-shadow.png)

Plasma 5.4 在 kdeplasma-addons 软件包中提供了一个全新的全屏的应用控制面板，它具有应用菜单的所有功能，还支持缩放和全空间键盘导航。新的起动器可以像你目前所用的“最近使用的”或“收藏的文档和联系人”一样简单和快速地查找应用。

###丰富的艺术图标

![Just some of the new icons in this release](https://kver.files.wordpress.com/2015/07/image10430.png)

Plasma 5.4 提供了超过 1400 个的新图标，其中不仅包含 KDE 程序的，而且还为 Inkscape， Firefox 和 Libreoffice 提供 Breeze 主题的艺术图标，可以体验到更加一致和本地化的感觉。

###KRunner 历史记录

![KRunner](https://www.kde.org/announcements/plasma-5.4/plasma-screen-krunner-shadow.png)

KRunner 现在可以记住之前的搜索历史并根据历史记录进行自动补全。

###Network 程序中实用的图形展示

![Network Graphs](https://www.kde.org/announcements/plasma-5.4/plasma-screen-nm-graph-shadow.png)

Network 程序现在可以以图形形式显示网络流量了，同时也支持两个新的 VPN 插件：通过 SSH 连接或通过 SSTP 连接。

###Wayland 技术预览

随着 Plasma 5.4 ，Wayland 桌面发布了第一个技术预览版。在使用自由图形驱动（free graphics drivers）的系统上可以使用 KWin（Plasma 的 Wayland 合成器和 X11 窗口管理器）通过[内核模式设定][1]来运行 Plasma。现在已经支持的功能需求来自于[手机 Plasma 项目][2]，更多的面向桌面的功能还未被完全实现。现在还不能作为替换那些基于 Xorg 的桌面，但可以轻松地对它测试和贡献，以及观看令人激动视频。有关如何在 Wayland 中使用 Plasma 的介绍请到：[KWin 维基页][3]。Wlayland 将随着我们构建的稳定版本而逐步得到改进。

###其他的改变和添加

 - 优化对高 DPI 支持
 - 更少的内存占用
 - 桌面搜索使用了更快的新后端
 - 便笺增加拖拉支持和键盘导航
 - 回收站重新支持拖拉
 - 系统托盘获得更快的可配置性
 - 文档重新修订和更新
 - 优化了窄小面板上的数字时钟的布局
 - 数字时钟支持 ISO 日期
 - 切换数字时钟 12/24 格式更简单
 - 日历显示第几周
 - 任何项目都可以收藏进应用菜单（Kicker），支持收藏文档和 Telepathy 联系人
 - Telepathy 联系人收藏可以展示联系人的照片和实时状态
 - 优化程序与容器间的焦点和激活处理
 - 文件夹视图中各种小修复：更好的默认尺寸，鼠标交互问题以及文本标签换行
 - 任务管理器更好的呈现起动器默认的应用图标
 - 可再次通过将程序拖入任务管理器来添加启动器
 - 可配置中间键点击在任务管理器中的行为：无动作，关闭窗口，启动一个相同的程序的新实例
 - 任务管理器现在以列排序优先，无论用户是否更倾向于行优先;许多用户更喜欢这样排序是因为它会使更少的任务按钮像窗口一样移来移去
 - 优化任务管理器的图标和缩放边
 - 任务管理器中各种小修复：垂直下拉，触摸事件处理现在支持所有系统，组扩展箭头的视觉问题
 - 提供可用的目的框架技术预览版，可以使用 QuickShare Plasmoid，它可以让许多 web 服务分享文件更容易
 - 增加了显示器配置工具
 - 增加的 kwallet-pam 可以在登录时打开 wallet
 - 用户管理器现在会同步联系人到 KConfig 的设置中，用户账户模块被丢弃了
 - 应用程序菜单（Kicker）的性能得到改善
 - 应用程序菜单（Kicker）各种小修复：隐藏/显示程序更加可靠，顶部面板的对齐修复，文件夹视图中 “添加到桌面”更加可靠，在基于 KActivities 的最新模块中有更好的表现
 - 支持自定义菜单布局 （kmenuedit）和应用程序菜单（Kicker）支持菜单项目分隔
 - 当在面板中时，改进了文件夹视图，参见 [blog][4]
 - 将文件夹拖放到桌面容器现在会再次创建一个文件夹视图
 
[完整的 Plasma 5.4 变更日志在此](https://www.kde.org/announcements/plasma-5.3.2-5.4.0-changelog.php)
 
###Live 镜像

尝鲜的最简单的方式就是从 U 盘中启动，可以在 KDE 社区 Wiki 中找到 各种 [带有 Plasma 5 的 Live 镜像][5]。
  
###下载软件包

各发行版已经构建了软件包，或者正在构建，wiki 中的列出了各发行版的软件包名：[软件包下载维基页][6]。
  
###源码下载

可以直接从源码中安装 Plasma 5。KDE 社区 Wiki 已经介绍了[怎样编译][7]。

注意，Plasma 5 与 Plasma 4 不兼容，必须先卸载旧版本，或者安装到不同的前缀处。


- [源代码信息页][8]
 
---

via: https://www.kde.org/announcements/plasma-5.4.0.php

译者：[Locez](http://locez.com) 校对：[wxy](http://github.com/wxy)
 
[1]:https://en.wikipedia.org/wiki/Direct_Rendering_Manager
[2]:https://dot.kde.org/2015/07/25/plasma-mobile-free-mobile-platform
[3]:https://community.kde.org/KWin/Wayland#Start_a_Plasma_session_on_Wayland
[4]:https://blogs.kde.org/2015/06/04/folder-view-panel-popups-are-list-views-again
[5]:https://community.kde.org/Plasma/LiveImages
[6]:https://community.kde.org/Plasma/Packages
[7]:http://community.kde.org/Frameworks/Building
[8]:https://www.kde.org/info/plasma-5.4.0.php