如何在ubuntu14.04上安装轻量级的Budgie桌面(v8)
================================================================================
Budgie是为Linux发行版定制的旗舰桌面，也是一个定制工程。为思想前卫的用户设计，致力于简单和简洁。它的一个巨大优势是它不是别的项目的fork版本，是从都到尾都独立的。

[Budgie桌面][1]与GNOME栈紧密结合，使用先进的技术从而提供一个可选择的桌面体验。出于开源理念，这个桌面之后也能在别的Linux发行版中看到。

现在Budgie能够通过面板的设置达到和GNOME2桌面相似的使用体验。

### 0.8版的特点 ###

- 任务栏：支持应用锁定到任务栏
- 任务栏：使用.desktop文件来配置quicklists菜单
- 任务栏：使用.desktop文件来配置图标分辨率
- 任务栏：支持有通知时蓝色闪烁
- 面板：支持默认深色主体
- 添加菜单条的小组件
- 面板：自动隐藏菜单条和工具条(这配置为手动)
- 面板：支持屏幕边缘处阴影
- 面板：动态支持gnome面板主题
- 运行对话框：虚拟刷新
- Budgie菜单: 增加紧凑模式，并默认采用
- Budgie菜单: 按照使用顺序排列菜单项
- Budgie菜单: 移除旧的电源选项
- 编辑器: 在UI中增加所有的菜单选项
- 支持从GNOME 3.10 升级到3.16
- wm: 关闭工作区的动画(v8之后)
- wm: 改变壁纸时更好的动画

### 重要信息 ###

- Budgie [0.8版发行版][2]目前只是beta
- 无本地网络管理；可以通过使用ubuntu的小组件解决
- Budgie 是为Evolve OS设计的，因此这个PPA可能会有bug
- GNOME 主题比Ubuntu本地的主题效果更好
- Ubuntu的滚动栏将不在工作
- 如果你想了解的更多可以访问Evolve OS网站

### 安装 ###

现在，我们将在Ubuntu14.04 LTS中安装我们自己的轻量级Budgie桌面。首先，我们要把PPA源添加到我们的Ubuntu中。执行以下命令：

    $ sudo add-apt-repository ppa:evolve-os/ppa

![添加Budgie的ppa源](http://blog.linoxide.com/wp-content/uploads/2015/01/budgie-desktop-ppa.png)

添加完ppa之后，运行下面的命令更新本地软件仓库。

    $ sudo apt-get update

然后只要执行下面的命令安装

    $ sudo apt-get install budgie-desktop

![安装 Budgie Desktop](http://blog.linoxide.com/wp-content/uploads/2015/02/install-budgie-desktop.png)

**注意点**

这是一个活跃的开发版本，一些主要的特点可能还不是特别的完善，如:网络管理器，为数不多的控制组件，无通知系统斌并且无法将app锁定到任务栏。

作为工作区你能够禁用滚动栏，通过设置一个默认的主题并且通过下面的命令退出当前的会话

    $ gnome-session-quit

![退出 Gnome 会话](http://blog.linoxide.com/wp-content/uploads/2015/02/gnome-seesion-quit.png)

### 登录Budgie会话 ###

安装完成之后，我们能在登录时选择机进入budgie桌面。

![选择桌面会话](http://blog.linoxide.com/wp-content/uploads/2015/02/session-select.png)

### Budgie 桌面环境 ###

![Budgie 桌面环境](http://blog.linoxide.com/wp-content/uploads/2015/02/budgie-desktop.png)

### 注销当前用户 ###

    $ budgie-sessioon --logout

### 结论 ###

Hurray! We have successfully installed our Lightweight Budgie Desktop Environment in our Ubuntu 14.04 LTS "Trusty" box. As we know, Budgie Desktop is still underdevelopment which makes it a lot of stuffs missing. Though it’s based on Gnome’s GTK3, it’s not a fork. The desktop is written completely from scratch, and the design is elegant and well thought out. If you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy Budgie Desktop 0.8 :-)
Budgie桌面当前正在开发过程中，因此有目前有很多功能的缺失。虽然它是基于Gnome，但不是完全的复制。Budgie是完全从零开始实现，它的设计是优雅的并且正在不断的完善。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-lightweight-budgie-v8-desktop-ubuntu/

作者：[Arun Pyasi][a]
译者：[johnhoow](https://github.com/johnhoow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://evolve-os.com/budgie/
[2]:https://evolve-os.com/2014/11/16/courageous-budgie-v8-released/
