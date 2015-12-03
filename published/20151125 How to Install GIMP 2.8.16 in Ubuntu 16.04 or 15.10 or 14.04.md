如何在 Ubuntu 16.04，15.10，14.04 中安装 GIMP 2.8.16
================================================================================
![GIMP 2.8.16](http://ubuntuhandbook.org/wp-content/uploads/2015/11/gimp-icon.png)

GIMP 图像编辑器 2.8.16 版本在其20岁生日时发布了。下面是如何安装或升级 GIMP 在 Ubuntu 16.04, Ubuntu 15.10, Ubuntu 14.04, Ubuntu 12.04 及其衍生版本中，如 Linux Mint 17.x/13, Elementary OS Freya。

GIMP 2.8.16 支持 OpenRaster 文件中的层组，修复了 PSD 中的层组支持以及各种用户界面改进，修复了 OSX 上的构建系统，以及更多新的变化。请阅读 [官方声明][1]。

![GIMP image editor 2.8,16](http://ubuntuhandbook.org/wp-content/uploads/2014/08/gimp-2-8-14.jpg)

### 如何安装或升级: ###

多亏了 Otto Meier，[Ubuntu PPA][2] 中最新的 GIMP 包可用于当前所有的 Ubuntu 版本和其衍生版。

**1. 添加 GIMP PPA**

从 Unity Dash 中打开终端，或通过 Ctrl+Alt+T 快捷键打开。在它打开它后，粘贴下面的命令并回车：

    sudo add-apt-repository ppa:otto-kesselgulasch/gimp

![add GIMP PPA](http://ubuntuhandbook.org/wp-content/uploads/2015/11/gimp-ppa.jpg)

输入你的密码，密码不会在终端显示，然后回车继续。

**2. 安装或升级编辑器**

在添加了 PPA 后，启动 **Software Updater**(在 Mint 中是 Software Manager)。检查更新后，你将看到 GIMP 的更新列表。点击 “Install Now” 进行升级。

![upgrade-gimp2816](http://ubuntuhandbook.org/wp-content/uploads/2015/11/upgrade-gimp2816.jpg)

对于那些喜欢 Linux 命令的，按顺序执行下面的命令，刷新仓库的缓存然后安装 GIMP：

    sudo apt-get update
    
    sudo apt-get install gimp

**3. (可选的) 卸载**

如果你想卸载或降级 GIMP 图像编辑器。从软件中心直接删除它，或者按顺序运行下面的命令来将 PPA 清除并降级软件：

    sudo apt-get install ppa-purge
    
    sudo ppa-purge ppa:otto-kesselgulasch/gimp

就这样。玩的愉快！

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/how-to-install-gimp-2-8-16-in-ubuntu-16-04-15-10-14-04/

作者：[Ji m][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)
 
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://www.gimp.org/news/2015/11/22/20-years-of-gimp-release-of-gimp-2816/
[2]:https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp
