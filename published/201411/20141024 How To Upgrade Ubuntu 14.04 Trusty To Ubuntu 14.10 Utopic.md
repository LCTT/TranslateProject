如何将 Ubuntu14.04 安全的升级到14.10
================================================================================

如果想从Ubuntu14.04/13.10/13.04/12.10/12.04或者更老的版本升级到14.10，只要遵循下面给出的步骤。注意，你不能直接从13.10升级到14.10。你应该先将13.10升级到14.04在从14.04升级到14.10。下面是详细步骤。

下面的步骤不仅能用于14.10，也兼容于一些像Lubuntu14.10，Kubuntu14.10和Xubuntu14.10等的Ubuntu衍生版本

**重要**：在升级之前，保险起见，不要忘了将你的数据在U盘或外部硬盘上保存一下。

### 桌面升级 ###

在升级之前，我们要先更新系统。打开终端输入以下命令

    sudo apt-get update && sudo apt-get dist-upgrade

上面的命令会下载安装最新的包。

重启你的电脑以完成更新。

然后输入下面的命令来升级到新的可获得的版本

    sudo update-manager -d

软件更新器会出现并且搜索新的发行版。

几秒钟之后，你会在屏幕中看到如下字样：**ubuntu14.10现在可以获得(你现在是14.04系统)**。点击升级按钮开始升级。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Software-Updater_001.png)

软件更新器会提示你确定更新。点击开始更新开始安装14.10

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Release-Notes_002.png)

**请注意**：这是beta版本。不要在生产用的机器上安装。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Distribution-Upgrade_003.png)

几分钟之后，软件更新器会提醒你一些将被移除的和将被安装的软件包的详细信息。点击**开始升级**继续。确保你更新时在稳定的网络下。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Untitled-window_004.png)

现在，更新程序会开始获取新的软件包。获取速度取决于你的网速。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Distribution-Upgrade_005.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Distribution-Upgrade_001.png)

之后，你会被询问是否移除不必要的应用程序。最后，点击**重启**来完成整个升级过程。

这时侯，恭喜你已经成功的升级到了ubuntu14.10

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Details_002.png)

你可以开始使用新的ubuntu版本了。

### 服务器升级 ###

从ubuntu14.04的服务器升级到14.10的服务器，采用下面的步骤。

安装update-manager-core 这个包如果之前没唷安装的话：

    sudo apt-get install update-manager-core

编辑 /etc/update-manager/release-upgrades这个文件。

    sudo nano /etc/update-manager/release-upgrades

像下面那样设置Prompt=normal或者Prompt=lts

    # Default behavior for the release upgrader.
    
    [DEFAULT]
    # Default prompting behavior, valid options:
    #
    #  never  - Never check for a new release.
    #  normal - Check to see if a new release is available.  If more than one new
    #           release is found, the release upgrader will attempt to upgrade to
    #           the release that immediately succeeds the currently-running
    #           release.
    #  lts    - Check to see if a new LTS release is available.  The upgrader
    #           will attempt to upgrade to the first LTS release available after
    #           the currently-running one.  Note that this option should not be
    #           used if the currently-running release is not itself an LTS
    #           release, since in that case the upgrader won't be able to
    #           determine if a newer release is available.
    Prompt=normal

现在可以通过下面的命令来更新你的服务系统了。

    sudo do-release-upgrade -d

直到屏幕提示你已完成。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/upgrade-ubuntu-14-04-trusty-ubuntu-14-10-utopic/

作者：SK
译者：[johnhoow](https://github.com/johnhoow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.ubuntu.com/UtopicUnicorn/ReleaseSchedule
