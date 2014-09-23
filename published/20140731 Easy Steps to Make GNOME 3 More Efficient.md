轻而易举提升GNOME 3效率
================================================================================
极少Linux桌面像GNOME 3一样饱受争议。自发布以来，它被奚落，被挖苦，还被痛恨。事情是，它实际上是一个很不错的桌面。它牢固、可靠、稳定、优雅、简洁……而且带有一些小的调整和附加的东西，它可以做成市面上最高效、最友好的桌面之一。

当然，什么才是高效而又/或者是用户友好的桌面呢？那取决于观念——每个人都有的东西。归根到底，我的目标是帮助你快速访问你要用到的应用和文件。简单吧。不管你信不信，将GNOME 3一步一步变成更为高效而又用户友好的世界是一项十分容易的任务——你只需要知道哪里去查看以及做些什么即可。在这里，我会引领你去往正确的方向。

我决定从这里开始着手这个事情，首先安装一个干净的[Ubuntu GNOME][1]发行版开始，该安装包含有一个GNOME 3.12桌面。在以GNOME为中心的桌面准备好后，就该开始对它进行微调了。

### 添加窗口按钮 ###

出于一些未知的原因，GNOME的开发者们决定对标准的窗口按钮（关闭，最小化，最大化）不屑一顾，而支持只有单个关闭按钮的窗口了。我缺少了最大化按钮（虽然你可以简单地拖动窗口到屏幕顶部来将它最大化），而且也可以通过在标题栏右击选择最小化或者最大化来进行最小化/最大化操作。这种变化仅仅增加了操作步骤，因此缺少最小化按钮实在搞得人云里雾里。所幸的是，有个简单的修复工具可以解决这个问题，下面说说怎样做吧：

默认情况下，你应该安装了GNOME优化工具（GNOME Tweak Tool）。通过该工具，你可以打开最大化或最小化按钮（图1）。

<center>![图 1: Adding the minimize button back to the GNOME 3 windows.](http://www.linux.com/images/stories/41373/gnome3-max-min-window.png)

*图 1: 添加回最小化按钮到GNOME 3窗口*</center>

添加完后，你就可以看到最小化按钮了，它在关闭按钮的左边，等着为你服务呢。你的窗口现在管理起来更方便了。

同样在这个优化工具中，你也可以对GNOME进行大量其它有帮助的配置：

- 设置窗口聚焦模式
- 设置系统字体
- 设置GNOME主题
- 添加启动应用
- 添加扩展

### 添加扩展 ###

GNOME 3的最佳特性之一，就是shell扩展，这些扩展为GNOME带来了各种类别的有用特性。关于shell扩展，没必要从包管理器去安装。你可以访问[GNOME Shell扩展][2]站点，搜索你想要添加的扩展，点击扩展列表，点击打开按钮，然后扩展就安装完成了；或者你也可以从GNOME优化工具中添加它们（你在网站上会找到更多可用的扩展）。

注：你可能需要在浏览器中允许扩展安装。如果出现这样的情况，你会在第一次访问GNOME Shell扩展站点时见到警告信息。当出现提示时，只要点击允许即可。

令人印象更为深刻的（而又得心应手的）扩展之一，就是[Dash to Dock][3]。

该扩展将Dash移出应用程序概览，并将它转变为相当标准的停靠栏（图2）。

<center>![图 2: Dash to Dock adds a dock to GNOME 3.](http://www.linux.com/images/stories/41373/gnome3-dash.png)

*图 2: Dash to Dock添加一个停靠栏到GNOME 3*</center>

当你添加应用程序到Dash后，他们也将被添加到Dash to Dock。你也可以通过点击Dock底部的6点图标访问应用程序概览。

还有大量其它扩展致力于将GNOME 3打造成一个更为高效的桌面，在这些不错的扩展中，包括以下这些：

- [最近项目][4]: 添加一个最近使用项目的下拉菜单到面板。
- [Firefox书签搜索][5]: 从概览搜索（并启动）书签。
- [跳转列表][6]: 添加一个跳转列表弹出菜单到Dash图标（该扩展可以让你快速打开和程序关联的新文档，甚至更多）
- [待办列表][7]: 添加一个下拉列表到面板，它允许你添加项目到该列表。
- [网页搜索框][8]: 允许你通过敲击Ctrl+空格来快速搜索网页并输入一个文本字符串（结果在新的浏览器标签页中显示）。

### 添加一个完整停靠栏 ###

如果Dash to dock对于你而言功能还是太有限（你想要“通知区域”，甚至更多），那么向你推荐我最喜爱的停靠栏之一[Cairo Dock][9]（图3）。

<center>![图 3: Cairo Dock ready for action.](http://www.linux.com/images/stories/41373/gnome3-Cairo-dock.png)

*图 3: Cairo Dock待命*</center>

在将Cairo Dock添加到GNOME 3后，你的体验将成倍地增长。从你的发行版的包管理器中安装这个优秀的停靠栏吧。

不要将GNOME 3看作是一个效率不高的，用户不友好的桌面。只要稍作调整，GNOME 3可以成为和其它可用的桌面一样强大而用户友好的桌面。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/781916-easy-steps-to-make-gnome-3-more-efficient

作者：[Jack Wallen][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[ wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/93
[1]:http://ubuntugnome.org/
[2]:https://extensions.gnome.org/
[3]:https://extensions.gnome.org/extension/307/dash-to-dock/
[4]:https://extensions.gnome.org/extension/72/recent-items/
[5]:https://extensions.gnome.org/extension/149/search-firefox-bookmarks-provider/
[6]:https://extensions.gnome.org/extension/322/quicklists/
[7]:https://extensions.gnome.org/extension/162/todo-list/
[8]:https://extensions.gnome.org/extension/549/web-search-dialog/
[9]:http://glx-dock.org/index.php
