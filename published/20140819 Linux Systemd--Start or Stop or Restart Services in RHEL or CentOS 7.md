Linux Systemd —— 在RHEL/CentOS 7中启动/停止/重启服务
================================================================================

RHEL/CentOS 7.0中一个最主要的改变，就是切换到了**systemd**。它用于替代红帽企业版Linux前任版本中的SysV和Upstart，对系统和服务进行管理。systemd兼容SysV和Linux标准组的启动脚本。

**Systemd**是一个Linux操作系统下的系统和服务管理器。它被设计成向后兼容SysV启动脚本，并提供了大量的特性，如开机时平行启动系统服务，按需启动守护进程，支持系统状态快照，或者基于依赖的服务控制逻辑。

先前的使用SysV初始化或Upstart的红帽企业版Linux版本中，使用位于/etc/rc.d/init.d/目录中的bash初始化脚本进行管理。而在RHEL 7/CentOS 7中，这些启动脚本被服务单元取代了。服务单元以.service文件扩展结束，提供了与初始化脚本同样的用途。要查看、启动、停止、重启、启用或者禁用系统服务，你要使用systemctl来代替旧的service命令。

> 注：为了向后兼容，旧的service命令在CentOS 7中仍然可用，它会重定向所有命令到新的systemctl工具。

### 使用systemctl来启动/停止/重启服务 ###

要启动一个服务，你需要使用如下命令：

    # systemctl start httpd.service

这会启动httpd服务，就我们而言，Apache HTTP服务器。

要停掉它，需要以root身份使用该命令：

    # systemctl stop httpd.service

要重启，你可以使用restart选项，如果服务在运行中，它将重启服务；如果服务不在运行中，它将会启动。你也可以使用try-start选项，它只会在服务已经在运行中的时候重启服务。同时，reload选项你也可以有，它会重新加载配置文件。

    # systemctl restart httpd.service
    # systemctl try-restart httpd.service
    # systemctl reload httpd.service

我们例子中的命令看起来会像下面这样：

![systemctl start-stop-restart](http://linoxide.com/wp-content/uploads/2014/08/systemctl-start-stop-restart.gif)

### 检查服务状态 ###

要检查服务状态，你可以使用status选项，看这里：

    # systemctl status httpd.service

输出结果就像这样：

![systemctl status](http://linoxide.com/wp-content/uploads/2014/08/systemctl-status.gif)

它会告诉你运行中的服务的方方面面。

### 使用启用/禁用服务来控制开机启动 ###

你也可以使用enable/disable选项来控制一个服务是否开机启动，命令如下：

    # systemctl enable httpd.service
    # systemctl disable httpd.service

输出结果看这里：

![systemctl-enable](http://linoxide.com/wp-content/uploads/2014/08/systemctl-enable.gif)

虽然在过去的几年中，对systemd的采用饱受争议，然而大多数主流发行版都已经逐渐采用或打算在下一个发行版中采用它。所以，它是一个有用的工具，我们需要好好熟悉它。 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/start-stop-services-systemd/

作者：[Adrian Dinu][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
