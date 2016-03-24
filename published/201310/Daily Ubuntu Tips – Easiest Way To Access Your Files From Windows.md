每日Ubuntu小技巧  —— 让Windows访问你文件的最简单的方法
==============================================

不管你是一个新手还是精通Ubuntu和Windows的大牛，让Windows访问Ubuntu文件的最好的方式都是使用Samba。通过许多第三方工具可以很轻松的安装和管理。

对于想要了解怎么从Windows快速访问Ubuntu文件的新用户或者新手来说，这篇短文将会告诉你该怎么做。我们的目标是要帮助新用户。我们尽量将这篇教程写得通俗易懂，以便让新手看懂而不会遇到太大的困难。

在这里我们不会太注重了解Samba是什么或者怎么将它配置加入域这类细节。我们要做的就是告诉你怎么在Ubuntu中安装和设置Samba，让Windows可以访问Ubuntu的文件。

如果你想要更多的了解Samba，我建议你Google一下，或者查询下Wikipedia。首先在Ubuntu下打开你的终端，然后运行如下命令安装Samba和其他相关的工具。

    sudo apt-get install samba cifs-utils

上面这条命令将会安装Samba和其他相关的工具。在旧版的Ubuntu中，你可能需要使用**smbfs**替代cifs-utils。如果上面命令能够使用就更好了。

然后，使用gedit（或者其他工具）打开Samba主配置文件，然后进行如下更改。可以使用如下命令打开主配置文件：

    sudo gedit /etc/samba/smb.conf

文件打开后，查找如下行并取消其注释（删掉行首的“;”）。它应该是这样的：

    security = user

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/sambausersubuntu.png)

然后，向下滚动文件，找到下面这行，同时取消行首注释。

    [homes]

这将会允许用户访问访问home目录中的文件夹及文件。比如说，如果你 **取消** 注释了[homes]，用户可以通过键入服务器名加用户名的方式访问home目录。

    \\192.168.0.2\username

然后，运行如下命令向Samba数据库添加你的账户信息。这样可以允许你使用Samba访问共享文件。

    sudo smbpasswd -a usernmame

用你自己的用户名替代上述的username。

当提示创建密码时，创建并确认即可。最后，重启Samba服务或者重启计算机。

通过Windows访问文件时，点击**开始 –> 运行**然后输入如下内容。或者打开资源管理器输入如下内容，如图。

    \\ubuntu_machine_IP\username

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/sambausersubuntu1.png)

Enjoy!

--------------------------------------------------------------------------------

来自: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-easiest-way-access-files-windows/

译者：[SCUSJS](https://github.com/scusjs) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

