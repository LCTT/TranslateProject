如何从Ubuntu13.04 升级到Ubuntu13.10 Saucy Salamander
==================================================

**Ubuntu 13.10 Saucy**已于**10月17日**发布。希望它比Ubuntu 13.04 Raring版本或以前的版本有很大的改进及增加更多功能。大家都好奇地等着，想看看Ubuntu13.10将给Ubuntu爱好者带来些什么。

如果你的系统是Ubuntu的13.04、12.10、12.04 Precise Pangolin或者更早的版本的话，你愿意升级到这最新的发行版本吗？我知道你愿意。只需要按照下面所示的简单几步，不管你用的是桌面版本还是服务器版本，都能轻松地从Ubuntu13.04版本升级到Ubuntu 13.10 Saucy版本。

**注意**：在升级前，确保对你的 **数据做一次全备份**，备份存储到外部设备（USB记忆棒或CD/ DVD）。

###桌面版升级

在升级前，我们首先得更新系统，按下快捷键打开终端输入如下命令。

    sudo apt-get update && sudo apt-get dist-upgrade

然后就可以升级到最新的发行版本了。

    sudo update-manager -d

Software Updater将会打开并且搜索新的发布版本。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Software-Updater_001.png)

几秒钟以后，你会看到如下所示，标有“**However, Ubuntu 13.10 is available now (you have 13.04)**”字样的窗口。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Software-Updater_002.png)

然后点击**Upgrade**按钮。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Release-Notes_003.png)

Software Updater会让你确认是否仍要升级。点击**Start Upgrade**就真正开始安装Ubuntu 13.10了。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Untitled-window_005.png)

现在Software Updater就会获取文件包并进行安装。这将需要一段时间，具体时间长短取决于你的网络连接速度。坐下来放松片刻吧。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Distribution-Upgrade_006.png)

过一会儿，你将被询问是否删除不必要的应用程序。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Untitled-window_008.png)

最后，点击重启完成升级。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Untitled-window_009.png)

现在你的系统就是最新的Ubuntu 13.10发布版本了。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Details_010.png)

###服务器版升级

要从Ubuntu 13.10服务器版升级到Ubuntu 13.04服务器版本，请按下面步骤操作。

如果还没有安装 **update-manager-core** 软件包，请先安装它：

    sudo apt-get install update-manager-core

打开 **/etc/update-manager/release-upgrades** 文件，

    sudo nano /etc/update-manager/release-upgrades

按如下所示进行编辑，设置 **Prompt=normal**。

    # Default behavior for the release upgrader.
    
    [DEFAULT]
    # Default prompting behavior, valid options:
    #
    #  never  - Never check for a new release.
    #  normal - Check to see if a new release is available.  If more than one new
    #       release is found, the release upgrader will attempt to upgrade to
    #       the release that immediately succeeds the currently-running
    #       release.
    #  lts- Check to see if a new LTS release is available.  The upgrader
    #       will attempt to upgrade to the first LTS release available after
    #       the currently-running one.  Note that this option should not be
    #       used if the currently-running release is not itself an LTS
    #       release, since in that case the upgrader won't be able to
    #       determine if a newer release is available.
    Prompt=normal

现在就可以把系统升级到最新服务器版本了，使用下面的命令：

    sudo do-release-upgrade -d

按照屏幕上的指示一步一步操作。大功告成！！

已经成功的升级到Ubuntu 13.10了，现在该做些什么呢？看看我们的新文章“[安装Ubuntu13.10后最应该做的几件事][1]”。现在你的系统已经很完善了。庆祝吧！！


--------------------------------------------------------------------------------

via: http://www.unixmen.com/upgrade-ubuntu-13-04-raring-ubuntu-13-10-saucy-salamander/ 

译者：[runningwater](https://github.com/runningwater) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.unixmen.com/top-things-installing-ubuntu-13-10/ 
