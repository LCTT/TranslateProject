每日Ubuntu小技巧：解决VirtualBox中截屏时的黑屏故障
================================================================================

VirtualBox是一个可以让你在一台物理主机上运行多个系统的软件。它支持Windows,Mac OS X 和Linux 并且是Oracle公司在维护它。

我们在这里写了很多关于VirtualBox的文章，你可以做一个快速的查找来查看所有关于VirtualBox的文章。

现在，这里有一个故事：VirtualBox有一个功能，允许用户快速的截取虚拟机会话的屏幕截图。这些截图可以通过粘贴板和宿主机共享。

这就是我们这里要说的了。当某一个Ubuntu 虚拟机中的功能启用后，这项截图的功能就不能够正常的工作了。这种现象一直是一个痛点，直到最近我们偶然发现了这个解决方法。

如果不采取我们发现的这个方法，当你在Ubuntu的虚拟机里面截完屏幕之后，截屏的图片将会被存储成全黑的文件，这样的文件会毫无用处。

我一直在苦苦寻找解决方法，但是一直都没有好运气，直到刚刚。

要开启Ubuntu下的虚拟机和宿主机之间的双向黏贴板的话，请在Ubuntu虚拟机上面点击 “设置”，之后找到“普通->高级标签”，选择这个功能来开启它。

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/virtualboxsharedclipboard.png)

现在，理论上，当你开启Ubuntu的虚拟机之后，按下“截屏键”，或者按下“Ctrl+截屏键”，虚拟机就应该为当前的桌面会话来张截屏。

之后你就可以通过在宿主机上面使用粘贴板的功能来看到那些图片了。

**但是！**如果你同时启用了Ubuntu虚拟机中的“3D 加速”功能，那些图片将会变得漆黑一片。

为了解决这个问题，你必须关闭Ubuntu虚拟机的3D加速功能！

关闭3D加速功能可以这样做：在Ubuntu虚拟机种点击“设置”，之后找到“系统->显示->显卡”标签，关闭3D加速

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/virtualboxsharedclipboard1.png)

现在你必须在Ubuntu的虚拟机中设置关闭3D加速才能让截屏正常工作。现在打开一个虚拟机尝试来截个屏幕吧。

希望这个方法能够帮到你！

希望你喜欢！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/02/daily-ubuntu-tips-fix-black-screen-in-ubuntu-guest-with-virtualbox-screen-capture/

译者：[FineFan](https://github.com/译者ID) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
