在 Linux 中安装 Darkstat：基于网页的流量分析器
================================================================================

Darkstat是一个简易的，基于网页的流量分析程序。它可以在主流的操作系统如Linux、Solaris、MAC、AIX上工作。它以守护进程的形式持续工作在后台，不断地嗅探网络数据，以简单易懂的形式展现在它的网页上。它可以为主机生成流量报告，识别特定的主机上哪些端口是打开的，它兼容IPv6。让我们看下如何在Linux中安装和配置它。

### 在Linux中安装配置Darkstat ###

** 在Fedora/CentOS/RHEL中安装Darkstat：**

要在Fedora/RHEL和CentOS中安装，运行下面的命令。

    sudo yum install darkstat

**在Ubuntu/Debian中安装Darkstat：**

运行下面的命令在Ubuntu和Debian中安装。

    sudo apt-get install darkstat

恭喜你，Darkstat已经在你的Linux中安装了。

### 配置 Darkstat ###

为了正确运行这个程序，我们需要执行一些基本的配置。运行下面的命令用gedit编辑器打开/etc/darkstat/init.cfg文件。

    sudo gedit /etc/darkstat/init.cfg

![](http://linuxpitstop.com/wp-content/uploads/2015/08/13.png)

*编辑 Darkstat*

修改START_DARKSTAT这个参数为yes，并在“INTERFACE”中提供你的网络接口。确保取消了DIR、PORT、BINDIP和LOCAL这些参数的注释。如果你希望绑定Darkstat到特定的IP，在BINDIP参数中提供它。

### 启动Darkstat守护进程 ###

安装并配置完Darkstat后，运行下面的命令启动它的守护进程。

    sudo /etc/init.d/darkstat start

![Restarting Darkstat](http://linuxpitstop.com/wp-content/uploads/2015/08/23.png)

你可以用下面的命令来在开机时启动Darkstat：

    chkconfig darkstat on

打开浏览器并打开**http://localhost:666**，它会显示Darkstat的网页界面。使用这个工具来分析你的网络流量。

![Darkstat](http://linuxpitstop.com/wp-content/uploads/2015/08/32.png)

### 总结 ###

它是一个占用很少内存的轻量级工具。这个工具流行的原因是简易、易于配置使用。这是一个对系统管理员而言必须拥有的程序。

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/install-darkstat-on-ubuntu-linux/

作者：[Aun][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linuxpitstop.com/author/aun/
