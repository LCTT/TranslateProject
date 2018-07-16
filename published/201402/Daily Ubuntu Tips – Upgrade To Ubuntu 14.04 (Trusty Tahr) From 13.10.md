Ubuntu 每日贴士:从Ubuntu 13.10升级到14.04(Trusty Tahr) [值得信赖的塔尔羊]
================================================================================
虽然Ubuntu 14.04 按计划不会近期发布正式版，但那些想要尝试最新软件和系统的人现在可以从Ubuntu 13.10 就地升级到 14.04了。

Ubuntu 14.04 目前计划在2014.4.17发布，但是你不必等那么长的时间来升级尝试。这个简要的教程给你展示了如何就地从Ububtu 13.10 升级到 14.04。

就地升级是你在已存在的Ubuntu上运行update-manager命令来升级到下一版。它允许你保留你大多数的文档，设定和一些程序。

大多数就地升级依赖于一个可靠的网络连接。没有良好稳定的连接,可能无法使用这个方法升级Ubuntu。

如果你无法使用网络升级，你还可以通过CD/DVD盘来就地升级。这个方法允许你不通过网络连接离线升级Ubuntu。

### 升级到 Ubuntu 14.04 ###

为了升级到Ubuntu 14.04, 你首先要给你要升级的电脑做好准备工作。请运行下面的命令更新所有存在的包和内核。

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

完成上述更新后，你可能需要重启来在升级前应用新的包和内核。

接着，按下键盘上的**Alt+F2**键来打开Ubuntu上的命令窗口。当窗口打开后，输入下面的命令并按下**回车**。

    update-manager –d

Ubuntu接着应该带着升级选项会打开update-manager。按下**Upgrade** 开始升级你的机器。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/ubuntu1404upgrade.png)

就是这样!

等待Ubuntu完成下载并安装所有的更新包。当一切完成时,你会被提示重启计算机。

享受吧!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-upgrade-to-ubuntu-14-04-trusty-tahr-from-13-10/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
