# 使用SystemBack备份你的Ubuntu/Linux Mint（系统还原）

系统还原对于任何一款允许用户还原电脑到之前状态（包括文件系统，安装的应用，以及系统设置）的操作系统来说，都是必备功能，可以处理系统故障以及其他的问题。有的时候安装一个程序或者驱动可能让你的系统黑屏。系统还原则让你电脑里面的系统文件（译者注：是系统文件，并非普通文件，详情请看**注意**部分）和程序恢复到之前工作正常时候的状态，进而让你远离那让人头痛的排障过程了。而且它也不会影响你的文件，照片或者其他数据。简单的系统备份还原工具[Systemback](https://launchpad.net/systemback)让你很容易地创建系统备份以及用户配置文件。如果遇到问题，你可以傻瓜式还原。它还有一些额外的特征包括系统复制，系统安装以及Live系统创建。

截图

![systemback](http://2.bp.blogspot.com/-2UPS3yl3LHw/VlilgtGAlvI/AAAAAAAAGts/ueRaAghXNvc/s1600/systemback-1.jpg)

![systemback](http://2.bp.blogspot.com/-7djBLbGenxE/Vlilgk-FZHI/AAAAAAAAGtk/2PVNKlaPO-c/s1600/systemback-2.jpg)

![](http://3.bp.blogspot.com/-beZYwKrsT4o/VlilgpThziI/AAAAAAAAGto/cwsghXFNGRA/s1600/systemback-3.jpg)

![](http://1.bp.blogspot.com/-t_gmcoQZrvM/VlilhLP--TI/AAAAAAAAGt0/GWBg6bGeeaI/s1600/systemback-5.jpg)

**注意**:使用系统还原不会还原你的文件，音乐，电子邮件或者其他任何类型的私人文件。对不同用户来讲，这既是优点又是缺点。坏消息是它不会还原你意外删除的文件，不过你可以通过一个文件恢复程序来解决这个问题。如果你的计算机上没有系统还原点，那么系统还原工具就不会奏效了。（最后一句没有太理解）

> > >适用于Ubuntu 15.10 Wily/16.04/15.04 Vivid/14.04 Trusty/Linux Mint 14.x/其他Ubuntu衍生版，打开终端，将下面这些命令复制过去：

终端命令：

```
sudo add-apt-repository ppa:nemh/systemback
sudo apt-get update
sudo apt-get install systemback

```

大功告成。

--------------------------------------------------------------------------------

via: http://www.noobslab.com/2015/11/backup-system-restore-point-your.html

译者：[DongShuaike](https://github.com/DongShuaike)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://launchpad.net/systemback
