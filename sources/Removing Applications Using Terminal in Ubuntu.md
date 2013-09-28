Removing Applications Using Terminal in Ubuntu
在Ubuntu中使用终端删除应用程序
================================================================================
You are a Linux user (Ubuntu). You always install applications from the terminal using **apt-get** install.

Even though you can add and remove applications using GUI (Synaptic Package Manager), it is always said that the command line is power. After installing a whole lot of applications both small and large in size. You now need disk space for other applications or you no longer want to see such applications on your system.

Most Ubuntu users, beginners specifically can install from the terminal after searching for how to install it. It becomes very difficult removing it. I also went through this.

This is a simple tutorial to guide you through how to remove packages installed.

1. Open Terminal (ctrl + alt + t)

2. Type

    $ dpkg --list

(this displays all installed packages at a go)

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/list_.png)

OR

    $ dpkg --list | less

(to easily navigate using the user keys)

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/dpkg_list.png)

OR

If you know the package name, you can pipe it with **grep** command to locate it using the syntax below:

    $ dpkg --list|grep -i  'packagename'

Example for **VLC** player.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/vlc_grep.png)

3. Locate the name of the package to be removed. Here am going to use **sox**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/remove_SoX.png)

4. To remove only a package use:

    $ sudo apt-get remove <packagename>

For example to remove package called **sox** , enter:

    $ sudo apt-get remove sox

Type y for Yes to uninstall.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/sox2.png)

5. To remove a package with it’s configuration files, enter:

    $ sudo apt-get --purge remove <packagename>

For example removing a package called sox  and all configuration files:

    $ sudo apt-get --purge remove sox


via: http://www.unixmen.com/removing-applications-using-terminal-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID
