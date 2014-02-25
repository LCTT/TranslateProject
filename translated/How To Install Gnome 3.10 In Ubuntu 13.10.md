如何在Ubuntu 13.10中安装Gnome 3.10
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Install_Gnome_310_Ubuntu_1310.jpeg)

Unity无聊或者就是简单地讨厌它？为何不**在Ubuntu 13.10中安装Gnome 3.10**？安装一个新的桌面环境师为数不多的[安装Ubuntu 13.10后要做的事][1]之一，如果你喜欢尝试。在这篇快速教程中我们将会分享**如何在Ubuntu 13.10中安装Gnome 3.10**。

### 在Ubuntu 13.10中安装Gnome 3.10： ###

我们将使用几个PPAS来安装Gnome 3.10和分配升级，将需要一段时间才能完成。我相信你有很好的上网速度，如果没有，你可以使用一些[小技巧来提高Ubuntu13.10的系统性能][2]。

#### 第一步：安装GDM [可选] ####

第一步是安装[GDM][3]以及默认的[LightDM][4]。这是可选的，但是还是建议各位如很多人提醒的LightDM问题。打开终端（Ctrl+Alt+T），并使用下面的命令：

    sudo apt-get install gdm

#### 第二步：添加PPAs并升级系统 ####

现在是时候添加Gnome 3.10 PPAs。使用以下命令添加PPAs将需要一些时间并下载200 MB的数据。

    sudo add-apt-repository ppa:gnome3-team/gnome3-next
    sudo add-apt-repository ppa:gnome3-team/gnome3-staging
    sudo apt-get update
    sudo apt-get dist-upgrade

#### 第三步：安装Gnome shell ####

一旦升级已经完成，可以使用下面的命令在Ubuntu中安装Gnome3.10。

    sudo apt-get install gnome-shell

#### 第四步：安装Gnome特定的应用程序 [可选] ####

这一步是可选的。你可能想安装一些Gnome特定的应用程序以达到Gnome 3.10在Ubuntu中得完整体验。你也许会面对一些这些应用程序的问题。

    sudo apt-get install gnome-weather gnome-music gnome-maps gnome-documents gnome-boxes gnome-shell-extensions gnome-tweak-tool gnome-clocks

这将是所有你需要做的。重新启动计算机，在登录时，通过点击齿轮标志选择Gnome。这里是我的Gnome 3.10在我的笔记本电脑上的效果：

![](http://itsfoss.com/wp-content/uploads/2014/01/Gnome_310_Ubuntu_1310.jpeg)

### 卸载Gnome 3.10: ###

不再喜欢Gnome 3.10？不用担心，通过[deleting PPA][5]卸载他们。要做到这一点，你需要安装PPA Purge（如果尚未安装）。使用下面的命令：

    sudo apt-get install ppa-purge

之后，安装你所安装的PPAs：

    sudo ppa-purge ppa:gnome3-team/gnome3-staging
    sudo ppa-purge ppa:gnome3-team/gnome3-next
 
在Ubuntu13.10版本库中是可以恢复Gnome 3.10到Gnome 3.8。要完全删除的Gnome3，使用以下命令：

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

当然，你应该删除任何你专为Gnome 3.10安装的应用程序。

我希望本教程能帮助你在Ubuntu 13.10中安装Gnome 3.10。你有没有尝试Gnome 3.10了？您想了解更多，Gnome或Unity？

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-gnome-3-ubuntu-1310/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-13-10/
[2]:http://itsfoss.com/speed-up-ubuntu-1310/
[3]:https://wiki.gnome.org/Projects/GDM
[4]:http://en.wikipedia.org/wiki/LightDM
[5]:http://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
