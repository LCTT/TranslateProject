如何在Ubuntu 13.10中给菜单添加图标
================================================================================

通常，使用Ubuntu 13.10的用户会会对默认的程序、偏好和功能进行优化，才能得到更好的用户体验。

Ubuntu的用户体验是可以优化调整的，因此用户可以通过一些工具来修改和调整那些默认设置，比如使用Ubuntu Tweak。

默认情况下，Ubuntu禁用了内部菜单的图标，即，右键点击桌面打开右键菜单时，菜单中只包含文本而且没有相应的图标。

不过，在Ubuntu 13.10的菜单中添加图标是很简单的：

- 安装Ubuntu  Tweak 

    sudo add-apt-repository ppa:tualatrix/ppa
    
    sudo apt-get update

    sudo apt-get install ubuntu-tweak

- 启动Ubuntu Tweak，并导航到`Tweaks-->Miscellaneous`
- 选中 `Menus have icons` 

**结果**：现在右键点击桌面，图标就会在菜单中显示, 图标显示也会在其他软件的右键菜单出现(例如， Nautilus, Firefox, Gedit中的菜单等等)。

![](http://iloveubuntu.net/pictures_me/menu%20icon%203%20ubuntu%2013.10.png)

![](http://iloveubuntu.net/pictures_me/menu%20icons%20ubuntu%2013.10%201.png)

![](http://iloveubuntu.net/pictures_me/menu%20icons%20ubuntu%2013.10%202.png)

这样在最常用的右键菜单中加上新增的图标，菜单会更加清晰和美丽，特别是使用单色图标菜单显示图标时。

--------------------------------------------------------------------------------

via: http://iloveubuntu.net/how-add-icons-menus-ubuntu-1310

译者：[Yu-Fei](http://blog.csdn.net/u011459130) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出