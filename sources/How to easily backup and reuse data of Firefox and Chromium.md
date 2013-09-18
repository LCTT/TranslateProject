如何方便地备份和再利用Firefox 和Chromium 浏览器的数据
================================================================================
网络及网络中的网站、音乐、视频、图片、文件和书籍等内容在一个用户的IT生活中扮演着一个非常重要的角色。
在Ubuntu系统中，用户可以很轻松地安装开源的Chromium (apt://chromium-browser)浏览器，这个与Ubuntu默认的Firefox一起打包的Chromium浏览器提供了强大可靠的方式来吸收网络上的内容。
然而很多情况下，用户会遇到不得不移动Firefox和Chromium产生的数据的情况，例如为了能在其它的Ubuntu设备或其它的电脑（放在其它地方而没有放在家里的电脑）上使用这些数据，或者为了在出现意外情况时（硬盘损坏、电脑丢失等）保护数据。 
你可以使用有许多基于同步的备份服务和备份工具，下面介绍的方法提供了一个快捷、可靠并且以随时可存取的方式来即时地（再）利用Firefox和Chromium的数据（这些数据有网站历史记录、密码、下载历史、书签等基本上所有你使用Firefox和Chromium时产生的数据）。
方法如下（同样适用于在U盘里存储数据）：
- 跳转到home文件夹下，然后按“Ctrl+H”键，显示出隐藏的文件夹。 
- 将`.mozilla`文件夹复制到U盘中。

![](http://iloveubuntu.net/pictures_me/mozilla%20wed%20data%20backup.png)

- 将`.config`文件夹中的`chromium`文件夹复制到U盘。

![](http://iloveubuntu.net/pictures_me/chromium%20web%20data%20backup.png)

现在你的U盘中就有`.mozilla`和`chromium`这两个文件夹了。

从U盘中将`.mozilla`和`chromium`这两个文件夹复制到新的（或旧的）Ubuntu设备中的相应位置（`.mozilla`在home目录下，`chromium` 在 `.config`目录下,--删除旧的将要被替换的`.mozilla` 和`chromium`文件夹--）打开Firefox和Chromium允许用户使用它们所有的网络数据，至此，你就可以摆脱那些同步的服务，高级复杂的方法和潜在的不可用性等问题了。
你也可以用一个硬盘的分区来代替U盘作为不愉快状况发生时的备份。

via: http://iloveubuntu.net/how-easily-backup-and-reuse-data-firefox-and-chromium

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者: [Linchenguang][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://iloveubuntu.net/how-easily-backup-and-reuse-data-firefox-and-chromium
Commit summary: Extended description: (optional)
Linchenguang 1215412538@qq.com
