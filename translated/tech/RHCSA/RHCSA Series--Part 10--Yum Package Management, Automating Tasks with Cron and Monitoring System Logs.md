[xiqingongzi translating]
RHCSA Series: Yum 包管理, 自动任务计划和系统监控日志 – Part 10
================================================================================
在这篇文章中，我们将回顾如何在REHL7中安装，更新和删除软件包。我们还将介绍如何使用cron任务的自动化，并完成如何查找和监控系统日志文件以及为什么这些技能是系统管理员必备技能

![Yum Package Management Cron Jobs Log Monitoring Linux](http://www.tecmint.com/wp-content/uploads/2015/05/Yum-Package-Management-Cron-Job-Log-Monitoring-Linux.jpg)

RHCSA: Yum包管理, 任务计划和系统监控 – 第十章

### 使用yum 管理包 ###

要安装一个包以及所有尚未安装的依赖包，您可以使用：

    # yum -y install package_name(s)

 package_name(s) 需要是一个存在的包名

例如，安装httpd和mlocate（按顺序），类型。

    # yum -y install httpd mlocate

**注意**: 字符y表示绕过执行下载和安装前的确认提示，如果需要，你可以删除它

默认情况下，yum将安装与操作系统体系结构相匹配的包，除非通过在包名加入架构名

例如，在64位系统上，使用yum安装包将安装包的x86_64版本，而package.x86 yum安装（如果有的话）将安装32位。

有时，你想安装一个包，但不知道它的确切名称。搜索可以在当前启用的存储库中去搜索包名称或在它的描述中搜索，并分别进行。

比如,

    # yum search log

将搜索安装的软件包中名字与该词类似的软件，而

    # yum search all log

也将在包描述和网址中寻找寻找相同的关键字

一旦搜索返回包列表，您可能希望在安装前显示一些信息。这时info选项派上用场：

    # yum info logwatch

![Search Package Information](http://www.tecmint.com/wp-content/uploads/2015/05/Search-Package-Information.png)

搜索包信息

您可以定期用以下命令检查更新：

    # yum check-update

上述命令将返回可以更新的所有安装包。在下图所示的例子中，只有rhel-7-server-rpms有可用更新：

![Check For Package Updates](http://www.tecmint.com/wp-content/uploads/2015/05/Check-For-Updates.png)
检查包更新

然后，您可以更新该包，

    # yum update rhel-7-server-rpms

如果有几个包，可以一同更新，yum update 将一次性更新所有的包

现在，当你知道一个可执行文件的名称，如ps2pdf，但不知道那个包提供了它？你可以通过 `yum whatprovides “*/[executable]”`找到:

    # yum whatprovides “*/ps2pdf”

![Find Package Belongs to Which Package](http://www.tecmint.com/wp-content/uploads/2015/05/Find-Package-Information.png)

查找文件属于哪个包

现在，当删除包时，你可以使用 yum remove Package ，很简单吧？Yum 是一个完整的强大的包管理器。

    # yum remove httpd

Read Also: [20 Yum Commands to Manage RHEL 7 Package Management][1]

### 文本式RPM工具  ###

RPM（又名RPM包管理器，或原本RedHat软件包管理器）也可用于安装或更新软件包来当他们在独立`rpm`包装形式。

往往使用`-Uvh` 表面这个包应该被安装而不是已存在或尝试更新。安装是`-U` ,显示详细输出用`-v`,显示进度条用`-h` 例如
    # rpm -Uvh package.rpm

另一个典型的使用rpm 是产生一个列表，目前安装的软件包的code > rpm -qa(缩写查询所有)

    # rpm -qa

![Query All RPM Packages](http://www.tecmint.com/wp-content/uploads/2015/05/Query-All-RPM-Packages.png)

查询所有包

Read Also: [20 RPM Commands to Install Packages in RHEL 7][2]

### Cron任务计划 ###

Linux和UNIX类操作系统包括其他的工具称为Cron允许你安排任务（即命令或shell脚本）运行在周期性的基础上。每分钟定时检查/var/spool/cron目录中有在/etc/passwd帐户文件中指定名称的文件。

执行命令时，输出是发送到crontab的所有者（或者在/etc/crontab，在MailTO环境变量中指定的用户，如果它存在的话）。

crontab文件（这是通过键入crontab e和按Enter键创建）的格式如下：

![Crontab Entries](http://www.tecmint.com/wp-content/uploads/2015/05/Crontab-Format.png)

crontab条目

因此，如果我们想更新本地文件数据库（这是用于定位文件或图案）每个初二日上午2:15，我们需要添加以下crontab条目：

    15 02 2 * * /bin/updatedb

以上的条目写着：”每年每月第二天的凌晨2：15运行 /bin/updatedb“ 无论是周几”，我想你也猜到了。星号作为通配符

添加一个cron作业后，你可以看到一个文件名为root被添加在/var/spool/cron，正如我们前面所提到的。该文件列出了所有的crond守护进程运行的任务：

    # ls -l /var/spool/cron

![Check All Cron Jobs](http://www.tecmint.com/wp-content/uploads/2015/05/Check-All-Cron-Jobs.png)

检查所有cron工作

在上图中，显示当前用户的crontab可以使用 cat /var/spool/cron 或

    # crontab -l

如果你需要在一个更精细的时间上运行的任务（例如，一天两次或每月三次），cron也可以帮助你。

例如，每个月1号和15号运行 /my/script 并将输出导出到 /dev/null，您可以添加如下两个crontab条目：

    01 00 1 * * /myscript > /dev/null 2>&1
    01 00 15 * * /my/script > /dev/null 2>&1

不过为了简单，你可以将他们合并

    01 00 1,15 * *  /my/script > /dev/null 2>&1
在前面的例子中，我们可以在每三个月的第一天的凌晨1：30运行 /my/other/script .

    30 01 1 1,4,7,10 * /my/other/script > /dev/null 2>&1

但是当你必须每一个“十”分钟，数小时，数天或数月的重复某个任务时，你可以通过所需的频率来划分正确的时间。以下为前一个crontab条目具有相同的意义：

    30 01 1 */3 * /my/other/script > /dev/null 2>&1

或者也许你需要在一个固定的时间段或系统启动后运行某个固定的工作，例如。你可以使用下列五个字符串中的一个字符串来指示你想让你的任务计划工作的确切时间：

    @reboot    	仅系统启动时运行.
    @yearly    	一年一次, 类似与 00 00 1 1 *.
    @monthly   	一月一次, 类似与 00 00 1 * *.
    @weekly    	一周一次, 类似与 00 00 * * 0.
    @daily     	一天一次, 类似与 00 00 * * *.
    @hourly    	一小时一次, 类似与 00 * * * *.

Read Also: [11 Commands to Schedule Cron Jobs in RHEL 7][3]

### 定位和查看日志###

系统日志存放在 /var/log 目录.根据Linux的文件系统层次标准，这个目录包括各种日志文件，并包含一些必要的子目录(如 audit, httpd, 或 samba ,如下图)，并由相应的系统守护进程操作

    # ls /var/log

![Linux Log Files Location](http://www.tecmint.com/wp-content/uploads/2015/05/Linux-Log-Files.png)

Linux 日志定位

其他有趣的日志比如 [dmesg][4](包括了所有内核缓冲区的信息)，安全(用户认证尝试链接)，信息(系统信息)，和wtmp(记录了所有用户的登录登出)

日志是非常重要的，他们让你可以看到是任何时刻发生在你的系统的事情，甚至是已经过去的事情。他们是无价的工具，解决和监测一个Linux服务器，并因此经常使用的 “tail -f command ”来实时显示正在发生并实时写入的事件。

举个例子，如果你想看你的内核的日志，你需要输入如下命令

    # tail -f /var/log/dmesg

同样的，如果你想查看你的网络服务器日志，你需要输入如下命令

    # tail -f /var/log/httpd/access.log

### 总结 ###

如果你知道如何有效的管理包，安排任务，以及知道在哪寻找系统当前和过去操作的信息，你可以放心你将不会总是有太多的惊喜。我希望这篇文章能够帮你学习或回顾这些基础知识。

如果你有任何问题或意见，请使用下面的表格反馈给我们。
--------------------------------------------------------------------------------

via: http://www.tecmint.com/yum-package-management-cron-job-scheduling-monitoring-linux-logs/

作者：[Gabriel Cánepa][a]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[3]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[4]:http://www.tecmint.com/dmesg-commands/

