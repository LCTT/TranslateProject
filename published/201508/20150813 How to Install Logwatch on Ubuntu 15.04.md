如何在 Ubuntu 15.04 系统中安装 Logwatch
================================================================================

大家好，今天我们会讲述在 Ubuntu 15.04 操作系统上如何安装 Logwatch 软件，它也可以在各种 Linux 系统和类 Unix 系统上安装。Logwatch 是一款可定制的日志分析和日志监控报告生成系统，它可以根据一段时间的日志文件生成您所希望关注的详细报告。它具有易安装、易配置、可审查等特性，同时对其提供的数据的安全性上也有一些保障措施。Logwatch 会扫描重要的操作系统组件像 SSH、网站服务等的日志文件，然后生成用户所关心的有价值的条目汇总报告。

### 预安装设置 ###

我们会使用 Ubuntu 15.04 版本的操作系统来部署 Logwatch，所以安装 Logwatch 之前，要确保系统上邮件服务设置是正常可用的。因为它会每天把生成的报告通过日报的形式发送邮件给管理员。您的系统的源库也应该设置可用，以便可以从通用源库来安装 Logwatch。

然后打开您 ubuntu 系统的终端，用 root 账号登陆，在进入 Logwatch 的安装操作前，先更新您的系统软件包。

    root@ubuntu-15:~# apt-get update

### 安装 Logwatch ###

只要你的系统已经更新和已经满足前面说的先决条件，那么就可以在您的机器上输入如下命令来安装 Logwatch。

    root@ubuntu-15:~# apt-get install logwatch

在安装过程中，一旦您按提示按下“Y”键同意对系统修改的话，Logwatch 将会开始安装一些额外的必须软件包。

在安装过程中会根据您机器上的邮件服务器设置情况弹出提示对 Postfix 设置的配置界面。在这篇教程中我们使用最容易的 “仅本地（Local only）” 选项。根据您的基础设施情况也可以选择其它的可选项，然后点击“确定”继续。

![Potfix Configurations](http://blog.linoxide.com/wp-content/uploads/2015/08/21.png)

随后您得选择邮件服务器名，这邮件服务器名也会被其它程序使用，所以它应该是一个完全合格域名/全称域名（FQDN）。

![Postfix Setup](http://blog.linoxide.com/wp-content/uploads/2015/08/31.png)

一旦按下在 postfix 配置提示底端的 “OK”，安装进程就会用 Postfix 的默认配置来安装，并且完成 Logwatch 的整个安装。 

![Logwatch Completion](http://blog.linoxide.com/wp-content/uploads/2015/08/41.png)

您可以在终端下发出如下命令来检查 Logwatch 状态，正常情况下它应该是激活状态。

    root@ubuntu-15:~# service postfix status

![Postfix Status](http://blog.linoxide.com/wp-content/uploads/2015/08/51.png)

要确认 Logwatch 在默认配置下的安装信息，可以如下示简单的发出“logwatch” 命令。

    root@ubuntu-15:~# logwatch

上面执行命令的输出就是终端下编制出的报表展现格式。

![Logwatch Report](http://blog.linoxide.com/wp-content/uploads/2015/08/61.png)

### 配置 Logwatch ###

在成功安装好 Logwatch 后，我们需要在它的配置文件中做一些修改，配置文件位于如下所示的路径。那么，就让我们用文本编辑器打开它，然后按需要做些变动。

    root@ubuntu-15:~# vim /usr/share/logwatch/default.conf/logwatch.conf

**输出/格式化选项**

默认情况下 Logwatch 会以无编码的文本打印到标准输出方式。要改为以邮件为默认方式，需设置“Output = mail”，要改为保存成文件方式，需设置“Output = file”。所以您可以根据您的要求设置其默认配置。

    Output = stdout

如果使用的是因特网电子邮件配置，要用 Html 格式为默认出格式，需要修改成如下行所示的样子。

    Format = text

现在增加默认的邮件报告接收人地址，可以是本地账号也可以是完整的邮件地址，需要的都可以在这行上写上

    MailTo = root
    #MailTo = user@test.com

默认的邮件发送人可以是本地账号，也可以是您需要使用的其它名字。

    # complete email address.
    MailFrom = Logwatch

对这个配置文件保存修改，至于其它的参数就让它保持默认，无需改动。

**调度任务配置**

现在编辑在 “daily crons” 目录下的 “00logwatch” 文件来配置从 logwatch 生成的报告需要发送的邮件地址。

    root@ubuntu-15:~# vim /etc/cron.daily/00logwatch

在这儿您需要作用“--mailto user@test.com”来替换掉“--output mail”,然后保存文件。

![Logwatch Cronjob](http://blog.linoxide.com/wp-content/uploads/2015/08/71.png)

### 生成报告 ###

现在我们在终端中执行“logwatch”命令来生成测试报告，生成的结果在终端中会以文本格式显示出来。

    root@ubuntu-15:~#logwatch

生成的报告开始部分显示的是执行的时间和日期。它包含不同的部分，每个部分以开始标识开始而以结束标识结束，中间显示的是该部分的完整信息。

这儿显示的是开始的样子，它以显示系统上所有安装的软件包的部分开始，如下所示：

![dpkg status](http://blog.linoxide.com/wp-content/uploads/2015/08/81.png)

接下来的部分显示的日志信息是关于当前系统登录会话、rsyslogs 和当前及最近的 SSH 会话信息。

![logwatch report](http://blog.linoxide.com/wp-content/uploads/2015/08/9.png)

Logwatch 报告最后显示的是安全方面的 sudo 日志及根目录磁盘使用情况，如下示：

![Logwatch end report](http://blog.linoxide.com/wp-content/uploads/2015/08/10.png)

您也可以打开如下的文件来查看生成的 logwatch 报告电子邮件。

    root@ubuntu-15:~# vim /var/mail/root

您会看到发送给你配置的用户的所有已生成的邮件及其邮件递交状态。

### 更多详情 ###

Logwatch 是一款很不错的工具，可以学习的很多很多，所以如果您对它的日志监控功能很感兴趣的话，也以通过如下所示的简短命令来获得更多帮助。

    root@ubuntu-15:~# man logwatch

上面的命令包含所有关于 logwatch 的用户手册，所以仔细阅读，要退出手册的话可以简单的输入“q”。

关于 logwatch 命令的使用，您可以使用如下所示的帮助命令来获得更多的详细信息。

    root@ubuntu-15:~# logwatch --help

### 结论 ###

教程结束，您也学会了如何在 Ubuntu 15.04 上对 Logwatch 的安装、配置等全部设置指导。现在您就可以自定义监控您的系统日志，不管是监控所有服务的运行情况还是对特定的服务在指定的时间发送报告都可以。所以，开始使用这工具吧，无论何时有问题或想知道更多关于 logwatch 的使用的都可以给我们留言。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-use-logwatch-ubuntu-15-04/

作者：[Kashif Siddique][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
