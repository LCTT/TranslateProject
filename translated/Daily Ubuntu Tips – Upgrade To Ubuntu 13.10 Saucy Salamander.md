Ubuntu每日小秘技 - 升级到Ubuntu 13.10 Saucy Salamander

================================================================================

在几个星期以后,Ubuntu将会发布13.10,有些人想升级到最新的版本尝鲜.对于新用户想升级的话,这个简洁的帖子将会引导你如何轻松的从13.04升级到13.10.

有很多方式升级到最新的Ubuntu版本.有人喜欢通过DVD来升级,但如果有稳定的网络连接,也有人更偏爱直接通过网络升级.通过网络渠道是最方便最快的方式,因为你不需要在升级之前等待DVD送达.

如果你没有很好的网络宽带,那么请通过DVD盘片升级你的系统吧.这个帖子将会给你展如何通过网络渠道升级你的系统.

对于有很好的网络连接的人,请通过运行下列代码来升级你现在的版本.这个命令将会安装所有的更新包,同时也删除不再需要的包和内核头文件.离开这些命令将会造成升级出现问题.

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

完成所有包更新后,重启你的计算机.当你重新登入,按**Alt + F2**键.等命令框打开,键入下面的命令并按回车键.

    update-manager -d

Ubuntu 软件更新器将会打开,从这里点击升级按钮开始升级.

在升级之前,请确认你的机子已经禁用或删除所有额外的PPA源.也可以在升级前先备份你的机子.

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/updatemanagerubuntu1310.png)

一旦你升级并重启你的机子后,验证一下是否都运行正常.

乐在其中!!!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-upgrade-ubuntu-13-10-saucy-salamander/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)
