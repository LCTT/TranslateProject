Ubuntu——每日小贴士：Linux上的时光机
==============================

当我们比较windows和ubuntu时，会发现他们各有千秋。在还原到之前状态的能力方面，Windows做的很好，它可以很好的还原到Windows XP之前的状态，这可以让你在需要修复时节省了很多时间。

与此不同的是，Ubuntu并不能让整个系统还原到之前的状态，但是你可以对自己的个人文件或文件夹进行还原。

不过，还好现在有了[TimeShift][1]，你现在可以像Windows一样将整个Ubuntu系统还原到之前的状态，TimeShift也许没有提供Windows上还原功能的所有功能，但至少已经很接近了。

TimeShift是一款开源应用，它提供和Windows上还原系统、Mac上时间机器相同的功能。它会在预定时间内给系统保存快照，并在你需要时通过快照来实现还原。

要安装TimeShift，你需要使用如下命令来添加其PPA。

    sudo apt-add-repository -y ppa:teejee2008/ppa

然后执行下面的命令来升级系统和安装TimeShift。

    sudo apt-get update && sudo apt-get install timeshift

安装完之后在Dash中搜索到TimeShift，启动它并设置好首选项。第一次启动会一些时间来扫描你电脑中的可用空间和需要备份的文件。

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/timeshiftubuntu.png)

启动后可以进行偏好设置，当然你也可以保留默认设置。如果你需要立刻备份时，可以直接点击菜单上的“备份按钮”，当然你也可以在需要时使用它对整个电脑进行还原操作。

来试试手吧！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-restore-machine-previous-state/

译者：[Timeszoro](https://github.com/Timeszoro) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


[1]:http://teejeetech.blogspot.com/2013/10/introducing-timeshift.html
