在Ubuntu Unity 14.04中添加Windows风格的底部任务栏
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/05/Windows_Taskbar_ubuntu.jpeg)

一些从Windows转到Ubuntu的新用户可能发现，在Ubuntu下默认的Unity界面占据了一切。大多数Windows用户，也包括一些非Gnome 3用户和一些非Unity Linux用户也许在Ubuntu中看不到底部任务栏。我们都知道，[Unity中的拖放操作][1]对用户不是很友好。

不管出于什么原因，如果你在Ubuntu中想要个底部面板，那么[tint][2]就是你的菜。

### 在Ubuntu 14.04中添加底部任务栏 ###
打开终端（Ctrl+Alt+T），然后输入下面的命令：

    sudo apt-get install tint2

这样就把tint2安装好了。你可以在终端中输入tint2来运行它了，但这不是我们想要干的活，因为我们的目的根本不在于此。在此，我们需要让tint2来开机启动，这样每次启动Ubuntu的时候，它都会在桌面底部恭候你了。

#### 怎样让tint2开机启动？ ####
打开Unity Dash（按下Windows键吧），然后搜索启动程序。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/01/Startup_Applications_Ubuntu.jpeg)

打开**启动程序**，在那儿猛戳**添加**按钮，你就可以添加一个新的开机启动程序了。你可以给它起个好认的名字，那命令那栏输入**tint2**，然后猛戳**添加**，然后继续猛戳**关闭**来保存。如果我说得不够清楚，还是看看下面的图片吧，它应该很直观了：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/05/Windows_Like_Taskbar_Ubuntu.jpeg)

好了。赶快注销并重新登录进去看看吧，任务栏会乖乖地在下面等着你了。第一张图片看到了吗？就是那个样子的。像[Conky][3]一样，tint2也能进行大量配置，但要进行深度配置，你得修改配置文件了。就算你很懒惰，安好了啥都不做，那它也会干得很好了。你已经试过了？你感觉tint2怎么样呢？

--------------------------------------------------------------------------------

via: http://itsfoss.com/add-windows-like-bottom-taskbar-in-ubuntu-unity-14-04/

译者：[GOLinux](https://github.com/GOLinux) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/drag-drop-files-ubuntu-1404-unity/
[2]:https://code.google.com/p/tint2/
[3]:http://conky.sourceforge.net/