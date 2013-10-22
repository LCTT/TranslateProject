Ubuntu每日贴士——保护你的Home文件夹
================================================================================
几天之前，我们向大家展示了如何在Ubuntu中定义文件夹，以便只有授权用户才能够看到你文件夹中的内容。我们说过，“adduser”命令创建一个用户目录，目录里面内容全部可读。这将意味着：一台机器上的所有用户，只要他有帐号就能够默认浏览你home里面的内容。
要想阅读之前的文章，[请点击这里][2].在那篇文章中，我们同样介绍了何种权限设置能够让你的home文件夹不被任何人看到。
在这篇博客中，你能够依靠加密文件目录来获得同样的效果。当加密你的home文件夹时，未经授权的用户将既不能看到也不能访问你的home目录。

加密你的home文件夹并不是在每个环境中对每个人都适用，所以在你实际使用该功能之前，确信自己真的需要它。
想要初始便加密你的home目录，登录到Ubuntu并运行一下命令。

    sudo apt-get install ecryptfs-utils

当加密当前home文件夹时，你是无法进行系统登录的，你必须创建一个临时账户并登录进去。之后再运行下面这些命令，来加密你的home文件夹。
使用你当前的账户名代替USERNAME。

    sudo ecryptfs-migrate-home -u USERNAME

When you login as the temporary user, run the **su** command plus your username to run commands as you, since your account has root / admin rights. You’ll be prompted for your password.
当你以临时用户的身份登录时,如果你的帐号拥有root或管理员权限，那么就运行**run**+用户名来表示以（这句不知道怎么翻译）。系统会提示你输出密码

    su USERNAME

使用具有root或管理员权限的帐号名称代替USERNAME。

在这之后，运行**ecryptfs-migrate-home –u USERNAME**命令加密你的文件夹。

要想在Ubuntu创建一个用户，运行下面的命令。

    sudo adduser USERNAME

要想在Ubuntu中删除的用户，运行下面的命令。

    sudo deluser USERNAME

当你登录的时候，你将会看到一幅包含更多关于你的加密home文件夹信息的截图。
![](http://www.liberiangeek.net/wp-content/uploads/2013/09/encrypthomedirectory.png)

要想创建一个带有加密home目录的用户，运行下面的命令
    adduser –encrypt-home USERNAME

Enjoy!
--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-protect-home-folders/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[rogetfan](https://github.com/rogetfan) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/
[2]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/
