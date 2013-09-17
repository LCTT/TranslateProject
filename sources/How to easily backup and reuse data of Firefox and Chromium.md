How to easily backup and reuse data of Firefox and Chromium
如何方便地备份和再利用Firefox 和Chromium 浏览器的数据
================================================================================
The web and its content are playing a critical highly-relevant role in the users' IT lives, web containing websites, music, video, images, documents, books.

网络及网络中的网站、音乐、视频、图片、文件和书籍等内容在一个用户的IT生涯中扮演着一个非常重要的角色。

In Ubuntu, the user can hassle-free install the open-source [Chromium](apt://chromium-browser) web-browser, web-browser that, packed with Ubuntu's default Firefox, offer a powerful solid manner of digesting web content.

在Ubuntu中，用户可以很轻松地安装开源的Chromium (apt://chromium-browser)浏览器，这个与Ubuntu 默认的Firefox 一起打包的Chromium浏览器提供了强大而可靠的方式来整合网络上的内容。

There are numerous situations when the user must move the data gathered by Chromium and Firefox, in order to utilize it under other Ubuntu installations, other computers (located in different physical non-home locations), as well as to save the data, in oder to avoid faulty situations (harddisk damages, physical lost of one's computer, etc).

很多情况下，用户必须移动Firefox和Chromium产生的数据，这样做有时是为了能在其它的Ubuntu设备或其它的电脑（放在其它地方而没有放在家里的电脑）上使用这些数据，也有时是为了防止出现意外情况（硬盘损坏、电脑丢失等）而保护数据。 

While there are several sync-based services and tools, the below-presented method offers a quick, fast, reliable and always accessible manner of immediately (re)using the data gathered by Chromium and Firefox (data meaning web history, passwords, download history, bookmarks, etc, essentially, everything done with Chromium and Firefox).

有许多基于同步的备份服务和备份工具，下面介绍的方法提供了一个快捷、可信并且总是可存取的方式来即时地（再）利用Firefox和Chromium产生的数据（这些数据有网站历史记录、密码、下载历史、书签等基本上所有用Firefox和Chromium做过事）。

The method is (as applicable to saving data to a USB stick):

方法如下（同样适用于在U盘里存储数据）：

- navigate to the home folder and hit the `Ctrl+H` buttons, action that reveals the hidden folders

- 跳转到home文件夹下，然后按“Ctrl+H”键，显示出隐藏的文件夹。 

- copy the `.mozilla` folder to the USB stick

- 将`.mozilla`文件夹复制到U盘中。

![](http://iloveubuntu.net/pictures_me/mozilla%20wed%20data%20backup.png)

- inside the `.config` folder, copy the `chromium` folder to the USB stick

- 在`.config`文件夹中复制`chromium`文件夹到U盘。
![](http://iloveubuntu.net/pictures_me/chromium%20web%20data%20backup.png)

The result: a USB stick containing the `.mozilla` and `chromium` folders.
结果：U盘中有了`.mozilla`和`chromium`这两个文件夹。

Copying the from-the-stick `.mozilla` and `chromium` folders to a new Ubuntu installation (or old) in their locations (`.mozilla` under the home folder, `chromium` under `.config`,--delete the old about-to-be-replaced `.mozilla` and `chromium` folders--) and opening Firefox and Chromium **allow** the user to enjoy their full web data, therefore, removing sync services, advanced complicated methods, potential unavailabilities, etc.
从U盘中将`.mozilla`和`chromium`这两个文件夹复制到新的（或旧的）Ubuntu设备中的相应位置（`.mozilla`在home目录下，`chromium` 在 `.config`目录下,--删除旧的将要被替换的`.mozilla` 和`chromium`文件夹--）打开Firefox和Chromium允许用户使用他们所有的网络数据，至此，你就可以摆脱那些同步的服务，高级复杂的方法和潜在的不可用性等。

The USB stick can be replaced with a preferred disk partition, serving also as a backup for unwanted situations.
你也可以用一个硬盘的分区来代替U盘作为意外情况的备份。

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
