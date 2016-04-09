如何轻松备份及恢复Firefox和Chromium的浏览器数据
================================================================================

网络及网络中的网站、音乐、视频、图片、文件和书籍等内容在用户的IT生活中扮演着一个至关重要的角色。

在Ubuntu系统中，用户可以很轻松地安装开源的Chromium (apt://chromium-browser)浏览器，它与Ubuntu所带的默认浏览器Firefox一起，为用户提供了一种非常可靠的方式来访问网络上的内容。

然而很多情况下，用户会遇到不得不移动Firefox和Chromium产生的数据的情况，例如为了能在其它的Ubuntu设备或其它的电脑（放在其它地方而没有放在家里的电脑）上使用这些数据，或者为了在出现意外情况时（硬盘损坏、电脑丢失等）保护数据。 

有几种基于远程同步的备份服务及工具，下面介绍一种方法，它可以提供快捷、可靠并且以随时可存取的方式来即时地（再）使用Firefox和Chromium的数据（这些数据包括网站历史记录、密码、下载历史、书签等基本上所有你使用Firefox和Chromium时产生的数据）。

这个方法是（在U盘里存储数据）：

- 跳转到home文件夹下，然后按“Ctrl+H”键，显示出隐藏的文件夹。 

- 将`.mozilla`文件夹复制到U盘中。

![](http://iloveubuntu.net/pictures_me/mozilla%20wed%20data%20backup.png)

- 将`.config`文件夹中的`chromium`文件夹复制到U盘。

![](http://iloveubuntu.net/pictures_me/chromium%20web%20data%20backup.png)

现在你的U盘中就有`.mozilla`和`chromium`这两个文件夹了。

从U盘中将`.mozilla`和`chromium`这两个文件夹复制到新的（或旧的）Ubuntu设备中的相应位置（`.mozilla`在home目录下，`chromium` 在 `.config`目录下,——删除旧的将要被替换的`.mozilla` 和`chromium`文件夹——）打开Firefox和Chromium，用户就可以使用他们所有的网络数据了，至此，你就可以摆脱那些同步服务，高级复杂的方法和潜在的不可用性等问题了。

以防意外状况发生，你也可以用一个硬盘的分区来代替U盘备份。

via: http://iloveubuntu.net/how-easily-backup-and-reuse-data-firefox-and-chromium

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者: [Linchenguang][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[Caroline]:http://linux.cn/space/14763

[1]:http://iloveubuntu.net/how-easily-backup-and-reuse-data-firefox-and-chromium


Linchenguang 1215412538@qq.com
