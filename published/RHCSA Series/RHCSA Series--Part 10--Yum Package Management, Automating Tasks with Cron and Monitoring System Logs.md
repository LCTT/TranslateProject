RHCSA 系列（九）: Yum 包管理、Cron 自动任务计划和监控系统日志
================================================================================

在这篇文章中，我们将回顾如何在 RHEL7 中安装，更新和删除软件包。我们还将介绍如何使用 cron 进行任务自动化，并完成如何查找和监控系统日志文件，以及为什么这些技能是系统管理员必备技能。

![Yum Package Management Cron Jobs Log Monitoring Linux](http://www.tecmint.com/wp-content/uploads/2015/05/Yum-Package-Management-Cron-Job-Log-Monitoring-Linux.jpg)

*RHCSA: Yum包管理、任务计划和系统监控 – Part 10*

### 使用yum 管理包 ###

要安装一个包以及所有尚未安装的依赖包，您可以使用：

    # yum -y install package_name(s)

package_name(s) 需要是至少一个真实的软件包名

例如，安装 httpd 和 mlocate（按顺序），输入。

    # yum -y install httpd mlocate

**注意**: 字符 y 表示绕过执行下载和安装前的确认提示。如果需要提示，你可以不用它。

默认情况下，yum 将安装与操作系统体系结构相匹配的包，除非通过在包名加入架构名。

例如，在 64 位系统上，`yum install package`将安装包的 x86_64 版本，而 `yum install package.x86`（如果有的话）将安装 32 位的。

有时，你想安装一个包，但不知道它的确切名称。`search all` 选项可以在当前启用的软件库中的包名称和包描述中搜索它，或者`search`选项可以在包名称中搜索。

比如，

    # yum search log

将搜索安装的软件库中名字和摘要与该词（log）类似的软件，而

    # yum search all log

也将在包描述和网址中寻找寻找相同的关键字。

一旦搜索返回包列表，您可能希望在安装前显示一些信息。这时 info 选项派上了用场：

    # yum info logwatch

![Search Package Information](http://www.tecmint.com/wp-content/uploads/2015/05/Search-Package-Information.png)

*搜索包信息*

您可以定期用以下命令检查更新：

    # yum check-update

上述命令将返回可以更新的所有已安装的软件包。在下图所示的例子中，只有 rhel-7-server-rpms 有可用更新：

![Check For Package Updates](http://www.tecmint.com/wp-content/uploads/2015/05/Check-For-Updates.png)

*检查包更新*

然后，您可以更新该包，

    # yum update rhel-7-server-rpms

如果有几个包可以一同更新，可以使用 ` yum update` 一次性更新所有的包。

当你知道一个可执行文件的名称，如 ps2pdf，但不知道那个包提供了它？你可以通过 `yum whatprovides “*/[executable]”`找到:

    # yum whatprovides “*/ps2pdf”

![Find Package Belongs to Which Package](http://www.tecmint.com/wp-content/uploads/2015/05/Find-Package-Information.png)

*查找文件属于哪个包*

当删除包时，你可以使用 `yum remove Package` ，很简单吧？Yum 是一个完整而强大的包管理器。

    # yum remove httpd

- 参见： [20 个管理 RHEL 7 软件包的 Yum 命令][1]

### 文本式 RPM 工具  ###

RPM（又名 RPM 包管理器，原意是 RedHat 软件包管理器）也可用于安装或更新独立的`rpm`格式的软件包。

往往使用 `-Uvh` 表明如果这个包没有安装就安装它，如果已存在就尝试更新。这里`-U`表示更新、`-v`表示显示详细输出，用`-h`显示进度条。例如

    # rpm -Uvh package.rpm

rpm 的另一个典型的使用方法是列出所有安装的软件包，

    # rpm -qa

![Query All RPM Packages](http://www.tecmint.com/wp-content/uploads/2015/05/Query-All-RPM-Packages.png)

*查询所有包*

- 参见： [20 个管理 RHEL 7 软件包的 RPM 命令][2]

### 使用 Cron 调度任务 ###

Linux 和 UNIX 类操作系统包括一个称为 Cron 的工具，允许你周期性调度任务（即命令或 shell 脚本）。cron 会每分钟定时检查 /var/spool/cron 目录中有在 /etc/passwd 帐户文件中指定用户名的文件。

执行命令时，命令输出是发送到该 crontab 的所有者（或者可以在 /etc/crontab，通过 MAILTO 环境变量中指定用户）。

crontab 文件（可以通过键入 `crontab -e`并按 Enter 键创建）的格式如下：

![Crontab Entries](http://www.tecmint.com/wp-content/uploads/2015/05/Crontab-Format.png)

*crontab条目*

因此，如果我们想在每个月第二天上午2:15更新本地文件数据库（用于按名字或通配模式定位文件），我们需要添加以下 crontab 条目：

    15 02 2 * * /bin/updatedb

以上的条目的意思是：”每年每月第二天的凌晨 2：15 运行 /bin/updatedb，无论是周几”，我想你也猜到了。星号作为通配符。

正如我们前面所提到的，添加一个 cron 任务后，你可以看到一个名为 root 的文件被添加在 /var/spool/cron。该文件列出了所有的 crond 守护进程应该运行的任务：

    # ls -l /var/spool/cron

![Check All Cron Jobs](http://www.tecmint.com/wp-content/uploads/2015/05/Check-All-Cron-Jobs.png)

*检查所有cron任务*

在上图中，显示当前用户的 crontab 可以使用 `cat /var/spool/cron` 或

    # crontab -l

如果你需要在一个更精细的时间上运行的任务（例如，一天两次或每月三次），cron 也可以做到。

例如，每个月1号和15号运行 /my/script 并将输出导出到 /dev/null （丢弃输出），您可以添加如下两个crontab 条目：

    01 00 1 * * /myscript > /dev/null 2>&1
    01 00 15 * * /my/script > /dev/null 2>&1

不过为了简单，你可以将他们合并：

    01 00 1,15 * *  /my/script > /dev/null 2>&1

跟着前面的例子，我们可以在每三个月的第一天的凌晨1：30运行 /my/other/script。

    30 01 1 1,4,7,10 * /my/other/script > /dev/null 2>&1

但是当你必须每隔某分钟、小时、天或月来重复某个任务时，你可以通过所需的频率来划分正确的时间。以下与前一个 crontab 条目具有相同的意义：

    30 01 1 */3 * /my/other/script > /dev/null 2>&1

或者也许你需要在一个固定的频率或系统启动后运行某个固定的工作，你可以使用下列五个字符串中的一个字符串来指示你想让你的任务计划工作的确切时间：

    @reboot    	仅系统启动时运行
    @yearly    	一年一次, 类似与 00 00 1 1 *
    @monthly   	一月一次, 类似与 00 00 1 * *
    @weekly    	一周一次, 类似与 00 00 * * 0
    @daily     	一天一次, 类似与 00 00 * * *
    @hourly    	一小时一次, 类似与 00 * * * *

- 参见：[11 个在 RHEL7 中调度任务的命令][3]

### 定位和查看日志###

系统日志存放（并轮转）在 /var/log 目录。根据 Linux 的文件系统层次标准（Linux Filesystem Hierarchy Standard），这个目录包括各种日志文件，并包含一些必要的子目录（如 audit、 httpd 或 samba ，如下图)，并由相应的系统守护进程操作：

    # ls /var/log

![Linux Log Files Location](http://www.tecmint.com/wp-content/uploads/2015/05/Linux-Log-Files.png)

*Linux 日志的位置*

其他感兴趣的日志比如 [dmesg][4]（包括了所有内核层缓冲区的消息），secure（记录要求用户认证的连接请求)，messages（系统级信息），和 wtmp（记录了所有用户的登录、登出）。

日志是非常重要的，它们让你可以看到任何时刻发生在你的系统的事情，以及已经过去的事情。他们是无价的工具，可以排错和监测一个 Linux 服务器，通常使用 `tail -f` 命令来实时显示正在发生和写入日志的事件。

举个例子，如果你想看你的内核相关的日志，你需要输入如下命令：

    # tail -f /var/log/dmesg

同样的，如果你想查看你的 Web 服务器日志，你需要输入如下命令：

    # tail -f /var/log/httpd/access.log

### 总结 ###

如果你知道如何有效的管理包、调度任务、以及知道在哪寻找系统当前和过去操作的信息，你可以放松工作而不会总被吓到。我希望这篇文章能够帮你学习或回顾这些基础知识。

如果你有任何问题或意见，请使用下面的表单反馈给我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/yum-package-management-cron-job-scheduling-monitoring-linux-logs/

作者：[Gabriel Cánepa][a]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[3]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[4]:http://www.tecmint.com/dmesg-commands/

