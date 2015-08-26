#KDE 发行 Plasma 5.4.0 , 8 月版本特性 

![Plasma 5.4](https://www.kde.org/announcements/plasma-5.4/plasma-screen-desktop-2-shadow.png)
2015 年 8 月 25 ，星期二，KDE发布了 Plasma 5 的一个新版本。
此版本为我们带来了许多非常棒的触感，如优化了对高 DPI 的支持，KRunner 自动补全和一些新的美观的 Breeze 图标。这还为不久以后的 Wayland 桌面奠定了基础。我们还发行了几个新组件，如声音部件，显示器校准工具和测试版的用户管理工具。

###新的音频音量程序
![The new Audio Volume Applet](https://www.kde.org/announcements/plasma-5.4/plasma-screen-audiovolume-shadows-wee.png)
新的音频音量程序直接与 PulseAudio (Linux 上一个非常流行的音频服务) 共同提供服务，并且在一个漂亮的简约的界面提供一个完全的音量控制和输出设定。

###应用控制面板起动器
![he new Dashboard alternative launcher](https://www.kde.org/announcements/plasma-5.4/plasma-screen-dashboard-2-shadow-wee.png)
Plasma 5.4 在 kdeplasma-addons 带来了一个全新的全屏应用控制面板，它具有应用菜单的所有功能还支持缩放和全空间键盘导航。新的起动器可以像你目前所用的最近使用的或收藏的文档和联系人一样简单和快速地查找应用。

###丰富的艺术图标
![Just some of the new icons in this release](https://kver.files.wordpress.com/2015/07/image10430.png)
Plasma 5.4 加入了 1400 多个新图标，其中不仅包含 KDE 程序的，而且还为 Inkscape， Firefox 和 Libreoffice 提供 Breeze 主题的艺术图标，可以体验到更加集成和本地化的感觉。

###KRunner 历史记录
![KRunner](https://www.kde.org/announcements/plasma-5.4/plasma-screen-krunner-shadow-wee.png)
KRunner 现在可以记住之前的搜索历史并根据历史记录进行自动补全。

###Network 程序中实用的图形展示
![Network Graphs](https://www.kde.org/announcements/plasma-5.4/plasma-screen-nm-graph-shadow-wee.png)
Network 程序现在可以以图形显示网络流量了，这也支持两个新的 VPN 插件，甚至是 SSH 或 SSTP。

###Wayland 技术预览
Plasma 5.4 ，这个第一个 Wayland 桌面技术预览版已经发布了。在使用开源驱动的系统上可以使用 KWin，Plasma 的 Wayland 复合器， X11 窗口管理器和通过内核设定来运行 Plasma。现在已经支持的功能需求来自于[手机 Plasma 项目](https://dot.kde.org/2015/07/25/plasma-mobile-free-mobile-platform)，更多的桌面原生功能还未被完全实现。现在还不能作为替换 Xorg 的基础桌面来使用，但可以轻松地测试它，贡献和观看感人的免费视频。有关如何在 Wayland 中使用 Plasma 的介绍请到：[KWin wiki pages](https://community.kde.org/KWin/Wayland#Start_a_Plasma_session_on_Wayland)。Wlayland 将会在我们构建一个稳定的版本的目标中得到改进。

###其他的改变和添加
 - 优化对高 DPI 支持
 - 更少的内存占用
 - 桌面搜索更新和更快的后端处理
 - 便笺添加拖拉和支持键盘导航
 - 回收站重新支持拖拉
 - 系统托盘获得更快的可配置性
 - 文档重新修订和更新
 - 优化数字时钟的布局
 - 数字时钟支持 ISO 日期
 - 更简单的方式切换数字时钟 12/24 格式
 - 日历显示第几周
 - 任何项目都可以收藏进应用菜单，支持收藏文档和 Telepathy 联系人
 - Telepathy 联系人收藏可以展示联系人的照片和实时状态
 - 优化程序与容器间的焦点和激活处理
 - 文件夹视图中各种小修复：更好的默认大喜哦，鼠标交互问题以及文本标签换行
 - 任务管理器更好的呈现起动器默认的应用图标
 - 可再次通过在任务管理器删除程序来添加起动器
 - 可配置中间点击在任务管理器中的行为：无动作，关闭窗口，起动一个相同的程序
 - 任务管理器现在以列排序优先无论用户是否更倾向于行优先;许多用户更喜欢这样排序是因为它会使更少的任务按钮像窗口一样移来移去
 - 优化任务管理器的图标和页边标度
 - 任务管理器中各种小修复：垂直下拉，触摸事件处理，组扩展箭头视觉问题
 - 提供可用的目的框架技术预览版，可以使用 QuickShare Plasmoid 在许多 web 服务分享文件
 - 添加 显示器配置工具
 - 添加 kwallet-pam 来在登陆时打开 wallet
 - 用户管理器现在已经接入到设置中，并且用户账户模块被舍弃
 - 应用程序菜单（Kicker）的性能得到改善
 - 应用程序菜单（Kicker）各种小修复：可用 隐藏/显示 程序更加可靠，顶部面板对齐修复，文件夹视图中 “添加到桌面”更加可靠，在 KActivities-based 最新的模块中有更好的表现
 - 支持自定义菜单布局 （kmenuedit）和应用程序菜单（Kicker）支持菜单项目分隔
 - 文件夹视图已经优化在面板中的模式 [blog](https://blogs.kde.org/2015/06/04/folder-view-panel-popups-are-list-views-again)
 - 在桌面容器中删除一个文件夹现在可在文件夹视图中恢复
 
 [Full Plasma 5.4 changelog](https://www.kde.org/announcements/plasma-5.3.2-5.4.0-changelog.php)
 
 ###Live 镜像
  偿鲜的最简单的方式就是从 U 盘中启动，可以在 KDE 社区 Wiki 中找到 各种 [ Live Images with Plasma 5](https://community.kde.org/Plasma/LiveImages)
  
  ###下载软件包
  各发行版已经构建了软件包，或者正在构建，wiki 中的列出了各发行版的软件包名：[Package download wiki page](https://community.kde.org/Plasma/Packages)
  
  ###源码下载
  可以直接从源码中安装 Plasma 5。KDE 社区 Wiki 已经介绍了怎样编译[instructions to compile](http://community.kde.org/Frameworks/Building)。
注意，Plasma 5 与 Plasma 4 不兼容，必须先卸载旧版本，或者安装到不同的前缀处。
 - [Source Info Page](https://www.kde.org/info/plasma-5.4.0.php)
 
 ---
 via:https://www.kde.org/announcements/plasma-5.4.0.php
 译者：[Locez](http://locez.com)