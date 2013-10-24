Ubuntu每日贴士——保护你的Home文件夹
================================================================================
几天之前，我们向大家展示了如何在Ubuntu中改变您的home文件夹，以便只有授权用户才能够看到您文件夹中的内容。我们说过，“adduser”命令创建的用户目录，目录里面内容是所有人可读的。这意味着：默认情况下，您的机器上所有有帐号的用户，都能够浏览您home文件夹里面的内容。
要想阅读之前的文章，[请点击这里][2].在那篇文章中，我们还介绍了如何设置权限，可以让您的home文件夹不被任何人浏览。
这篇博客中提到，还可以通过加密文件目录的方式来获得同样的效果。当home文件夹被加密后，未经授权的用户将既不能看到也不能访问该目录。

加密home文件夹并不是在每个环境中对每个人都适用，所以在实际使用该功能之前，请确信自己真的需要它。
要加密home目录，请登录到Ubuntu并运行以下命令。
 
    sudo apt-get install ecryptfs-utils

当加密当前home文件夹时，你是无法进行系统登录的，必须创建一个临时账户并登录进去。之后再运行下面这些命令，来加密你的home文件夹。
使用你当前的账户名代替USERNAME。

    sudo ecryptfs-migrate-home -u USERNAME

当以临时用户的身份登录时,由于你的帐号拥有root或admin权限，就需要运行**su**+用户名，以自己的身份运行命令。系统会提示你输入密码。

    su USERNAME

使用具有root或admin权限的帐号代替USERNAME。

在这之后，运行**ecryptfs-migrate-home –u USERNAME**命令加密home文件夹。

要想在Ubuntu创建一个用户，运行下面的命令。

    sudo adduser USERNAME

要想在Ubuntu中删除的用户，运行下面的命令。

    sudo deluser USERNAME

登录后，你将会看到如下截图的界面，包含更多关于加密home文件夹的信息。
![](http://www.liberiangeek.net/wp-content/uploads/2013/09/encrypthomedirectory.png)

要创建带有加密home目录的用户，运行下面的命令：
    adduser –encrypt-home USERNAME

试试看吧!
--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-protect-home-folders/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[rogetfan](https://github.com/rogetfan) 校对：[jasminepeng](https://github.com/jasminepeng)

[1]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/
[2]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/
