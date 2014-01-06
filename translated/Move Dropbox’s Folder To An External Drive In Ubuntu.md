在Ubuntu中移动Dropbox的文件夹到一个外部驱动器
=================================================================================

几个星期前，我们展示了如何[在Microsoft Windows中移动Dropbox文件夹到一个外部驱动器] [1]。该教程获得一致好评。对于使用Ubuntu操作系统的用户来说同样适用。

这个简短的教程将告诉你如何在Ubuntu下轻松地将Dropbox文件夹移动到另一个位置。

我写这些教程的原因是，几个月前我收到了一台全新的只有128GB SSD硬盘的惠普EliteBook笔记本电脑。我爱这台快速且性能良好的电脑。

它的缺点是，本地存储太小，无法处理我所有的东西。除了我的本地应用程序和数据，我在我的Dropbox也有GB的大小文件。

所以，当我同步我的Dropbox帐号并下载它的所有内容，我的HP EliteBook，完全消耗掉整个本地磁盘。

唯一的解决办法是，不使用本地存储磁盘直接将Dropbox文件夹移动到一个外部驱动器中。

如果你发现自己也有类似的情况，无论是使用Windows还是Ubuntu，请按照下列步骤，以腾出本地磁盘上的空间。在Ubuntu中开始移动Dropbox文件夹，首先插入外部存储器。

插入磁盘后，进入Unity Dash 并搜索Disks。打开它并选择你希望适用的外部驱动器，点击 **Tools –> Format**

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder3.png)

下一步，格式化驱动器的文件系统为**NTFS**格式。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder4.png)

格式化之后，选择 **Tools –> Mount Options**

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder5.png)

然后指定相应的选项，如下图所示...The Mount Point（Dropbox的文件夹的安装位置），文件系统类型，以及下面的图片中的其他选项。保存它时，你就大功告成了。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder6.png)

在此之后，退出Dropbox的服务并在默认位置（/home/username/Dropbox）删除当前的Dropbox文件夹。当您再次启动Dropbox的服务时，它会提醒你缺少的文件夹。点击重新链接按钮以指定新的位置。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder.png)

当提示选择安装类型，选择‘**Advanced’**并指定位置安装Dropbox文件夹。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder1.png)

设置完毕后，重新启动，如果Dropbox的不会提示你缺少文件夹，那么就成功了。

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/dropboxubuntumissingfolder2.png)

教程就是这样！

如果没有安装NTFS-3G，运行这个命令来安装它。

    sudo apt-get install ntfs-3g


--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/move-dropboxs-folder-to-an-external-drive-in-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2013/11/daily-windows-tips-move-dropbox-folder-to-external-drive/

