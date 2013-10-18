Ubuntu 每日小贴士：将电脑还原到之前的状态
================================================================================

当我们比较windows和ubuntu时，会发现他们各有千秋。在还原到之前状态的能力方面，Windows有时可以很好的还原到Windows XP的状态，这节省了用户很多时间。与此不同的是，Ubuntu并不能让整个系统还原到之前的状态，但是你可以对自己的个人文件或文件夹进行还原。



还好多亏了[TimeShift][1]，你现在可以像Windows一样将整个Ubuntu系统还原到之前的状态，TimeShift也许没有提供Windows上还原的所有功能，但至少很接近了。


TimeShift是一款开源应用，它提供和Windows上还原系统、Mac上时间机器相同的功能。它会在预定时间对系统进行保存快照处理，并通过撤销掉快照之后的所有操作来实现还原


要安装TimeShift，你需要使用如下命令来添加其PPA包 

    sudo apt-add-repository -y ppa:teejee2008/ppa

然后执行下面的命令来升级系统和安装TimeShift.

    sudo apt-get update && sudo apt-get install timeshift

安装完之后在Dash中搜索到TimeShift，第一次启动会花费很长时间来扫描你电脑中的文件和可用空间便于备份。

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/timeshiftubuntu.png)

启动后可以进行偏好设置，当然你可以保留默认设置如果你喜欢的话，如果你需要备份时可以直接点击菜单上的“备份按钮”，当然你也可以使用这个APP对整个电脑进行还原操作。

来试试手吧！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-restore-machine-previous-state/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Timeszoro](https://github.com/Timeszoro) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://teejeetech.blogspot.com/2013/10/introducing-timeshift.html
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
