在Ubuntu中安装Unity 8桌面预览版
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/06/Unity_8.jpeg)

如果你一直关注新闻，那么就知道Ubuntu将会切换到带有[Unity 8][2]桌面的[Mir显示服务器][1]。然而，在尚未确定运行在 Mir 上的Unity 8是否会出现在[Ubuntu 15.10 Willy Werewolf][3]之前，有了一个Unity 8的预览版本可供你体验和测试。通过官方PPA，可以很容易地**安装Unity 8到Ubuntu 14.04,14.10和15.04中**。

到目前为止，开发者已经可以通过[ISO][4]（主要途径）获得该Unity 8预览来进行测试。不过Canonical也通过[LXC容器][5]发布了它。通过该方法，你可以使用Unity 8桌面会话，让它像其它桌面环境一样运行在Mir显示服务器上。就像你[在Ubuntu中安装Mate桌面][6]，然后从LightDm登录屏幕选择桌面会话一样。

想要试试Unity 8？让我们来看怎样安装它吧。

**注意： 它是一个实验性预览，可能不是所有人都可以让它正确工作的。**

### 安装Unity 8桌面到Ubuntu ###

下面是安装并使用Unity 8的步骤：

#### 步骤 1： 安装Unity 8到Ubuntu 12.04和14.04 ####

如果你正运行着Ubuntu 12.04和14.04，那么你必须使用官方PPA来安装Unity 8。使用以下命令进行安装：

    sudo apt-add-repository ppa:unity8-desktop-session-team/unity8-preview-lxc
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install unity8-lxc

#### 步骤 1： 安装Unity 8到Ubuntu 14.10和15.04 ####

如果你正运行着Ubuntu 14.10或15.04，那么Unity 8 LXC已经在源中准备好。你只需要运行以下命令：

    sudo apt-get update
    sudo apt-get install unity8-lxc

#### 步骤 2： 设置Unity 8桌面预览LXC ####

安装Unity 8 LXC后，该对它进行设置，下面的命令就可达到目的：

    sudo unity8-lxc-setup

它将花费一些时间来设置，所以，耐心点。它会下载ISO，然后解压缩，接着完成最后一些必要的设置来让它工作。它也会安装一个LightDM的轻度修改版本。这一切都搞定后，需要重启。

#### 步骤 3： 选择Unity 8 ####

重启后，在登录屏幕，点击你的登录旁边的Ubuntu图标：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Change_Desktop_Environment_Ubuntu.jpeg)

你应该可以在这看到Unity 8的选项，选择它：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/06/Select_Unity8.jpeg)

### 卸载Unity 8 LXC ###

如果你发现Unity 8毛病太多，或者你不喜欢它，那么你可以以相同的方式切换回默认Unity版本。此外，你也可以通过下面的命令移除Unity 8：

    sudo apt-get remove unity8-lxc

该命令会将Unity 8选项从LightDM屏幕移除，但是配置仍然保留着。

以上就是你在Ubuntu中安装带有Mir的Unity 8的全部过程，试玩后请分享你关于Unity 8的想法哦！

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-unity-8-desktop-ubuntu/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://en.wikipedia.org/wiki/Mir_%28software%29
[2]:https://wiki.ubuntu.com/Unity8Desktop
[3]:http://itsfoss.com/ubuntu-15-10-codename/
[4]:https://wiki.ubuntu.com/Unity8DesktopIso
[5]:https://wiki.ubuntu.com/Unity8inLXC
[6]:http://itsfoss.com/install-mate-desktop-ubuntu-14-04/
