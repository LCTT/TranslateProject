如何在 Ubuntu 13.10 中安装 Gnome 3.10
================================================================================

![](http://itsfoss.com/wp-content/uploads/2014/01/Install_Gnome_310_Ubuntu_1310.jpeg)

厌倦 Unity 了吗？或者说就是不喜欢它？为何不试试**在 Ubuntu 13.10 中安装 Gnome 3.10**？安装一个新的桌面环境是为数不多的[安装Ubuntu 13.10后要做的事][1]之一，如果你想要尝试一下。在这篇快速教程中我们将会分享**如何在 Ubuntu 13.10 中安装 Gnome 3.10**。

### 在 Ubuntu 13.10 中安装 Gnome 3.10： ###

我们将花费一些时间来使用几个 PPA 安装 Gnome 3.10 和分配升级。我假设你网速不错，如果不是的话，你可以使用一些[小技巧来提高 Ubuntu13.10 的系统性能][2]。

#### 第一步：安装 GDM [可选] ####

第一步是安装[GDM][3]以及默认的[LightDM][4]。这是可选的，但是还是建议各位如很多人提醒的LightDM问题（这句话不通顺，但是不太理解，还请组长看一下）。打开终端（Ctrl+Alt+T），并使用下面的命令：

    sudo apt-get install gdm

出现提示时选择 GDM。

#### 第二步：添加PPAs并升级系统 ####

现在是时候添加 Gnome 3.10 PPA 了。使用以下命令添加 PPA 将需要一些时间并下载 200 MB 的数据。

    sudo add-apt-repository ppa:gnome3-team/gnome3-next
    sudo add-apt-repository ppa:gnome3-team/gnome3-staging
    sudo apt-get update
    sudo apt-get dist-upgrade

#### 第三步：安装 Gnome shell ####

一旦升级已经完成，可以使用下面的命令在 Ubuntu 中安装 Gnome3.10。

    sudo apt-get install gnome-shell

#### 第四步：安装 Gnome 特定的应用程序 [可选] ####

这一步是可选的。你可能想安装一些 Gnome 特定的应用程序以达到 Gnome 3.10 在 Ubuntu 中得完美体验。你也许会遇到一些应用程序的相关问题。

    sudo apt-get install gnome-weather gnome-music gnome-maps gnome-documents gnome-boxes gnome-shell-extensions gnome-tweak-tool gnome-clocks

这些就是所有你需要做的。重新启动计算机，在登录时，通过点击齿轮标志选择 Gnome。这里是我的 Gnome 3.10 在我的笔记本电脑上的效果：

![](http://itsfoss.com/wp-content/uploads/2014/01/Gnome_310_Ubuntu_1310.jpeg)

### 卸载 Gnome 3.10: ###

不喜欢 Gnome 3.10 了？不用担心，通过[deleting PPA][5]卸载它们。要做到这一点，你需要安装 PPA Purge（如果尚未安装）。使用下面的命令：

    sudo apt-get install ppa-purge

之后，安装你所安装的 PPA：

    sudo ppa-purge ppa:gnome3-team/gnome3-staging
    sudo ppa-purge ppa:gnome3-team/gnome3-next
 
在 Ubuntu13.10 版本库中是可以恢复 Gnome 3.10 到 Gnome 3.8。要想完全删除 Gnome 3，使用以下命令：

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

当然，你应该删除任何你专为 Gnome 3.10 安装的应用程序。

我希望本教程能帮助你在 Ubuntu 13.10 中安装 Gnome 3.10。尝试 Gnome 3.10了吗？你更喜欢哪一个，Gnome 还是 Unity？

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-gnome-3-ubuntu-1310/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-13-10/
[2]:http://itsfoss.com/speed-up-ubuntu-1310/
[3]:https://wiki.gnome.org/Projects/GDM
[4]:http://en.wikipedia.org/wiki/LightDM
[5]:http://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
