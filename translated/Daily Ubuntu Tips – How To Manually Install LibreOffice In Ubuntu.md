Ubuntu 每日小贴士 – 在Ubuntu中如何手动安装LibreOffice
================================================================================
这个简短的教程将告诉你如何在Ubuntu中手动安装LibreOffice。正如你已经知道的那样，LibreOffice已经预装Ubuntu中了。

这个版本是Ubuntu的定制版本，能够在Ubuntu里面更好的工作。它也集成了Ubuntu的应用菜单和其他设置。

LibreOffice在它的[下载页面][1]的官方版本和你从Ubuntu获得的默认版本是不同的。你并不是获得了一个非标准版本，但它定制了一下再加入到Ubunut软件库中。

如果你想使用LibreOffice的官方标准版，你必须从[下载页面][1]手动下载。这意味着，完全卸载当前版本并从官方下载页面下载.deb包。

要做到这一点你必须先完全从Ubuntu的清除的LibreOffice。

### 从Ubuntu中卸载LibreOffice ###

要在Ubuntu中手动安装LibreOffice的官方版本，必须先卸载当前版。在Ubuntu中要卸载的LibreOffice，运行下面的命令。

    sudo apt-get remove --purge libreoffice* && sudo apt-get autoremove

运行以上命令之后，重启你的电脑。当你再次登录以后，从[下载页面][1]下载LibreOffice的.deb包。

### 在Ubuntu中手动安装LibreOffice ###

下载.deb包后，打开终端，在你的home目录进入Downloads文件夹。默认情况下，Firefox下载的文件保存在。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/libreofficemanualinstall.png)

然后运行下面的命令来提取下载文件中的.tar.gz文件。

    tar -xvf LibreOffice_*.tar.gz

解压.tar.gz文件后，你会在Downloads文件夹下看到一个新的LibreOffice Deb文件夹。要开始手动安装LibreOffice，运行下面的命令。

    sudo dpkg -i LibreOffice_*/DEBS/*.deb

运行上面的命令后，LibreOffice将被安装并可以使用了。
 
接下来，进入Unity Dash并启动LibreOffice。这就是你如何在Ubuntu中手动安装LibreOffice。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/libreofficemanualinstall1.png)

如果在Ubuntu中手动安装LibreOffice，你将很有可能每次有新版本时手动更新。

Or you may just want Canonical (Ubuntu parent company) handle LibreOffice installation and patch / updates management via its repository.

或者你仅仅希望Canonical（Ubuntu母公司）通过它的储存库进行LibreOffice的安装和补丁/更新管理。

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-how-to-manually-install-libreoffice-in-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.libreoffice.org/download/
