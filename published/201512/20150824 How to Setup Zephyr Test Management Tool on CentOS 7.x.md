如何在 CentOS 7.x 上安装 Zephyr 测试管理工具 
================================================================================

测试管理（Test Management）指测试人员所需要的任何的所有东西。测试管理工具用来记录测试执行的结果、计划测试活动以及汇报质量控制活动的情况。在这篇文章中我们会向你介绍如何配置 Zephyr 测试管理工具，它包括了管理测试活动需要的所有东西，不需要单独安装测试活动所需要的应用程序从而降低测试人员不必要的麻烦。一旦你安装完它，你就看可以用它跟踪 bug 和缺陷，和你的团队成员协作项目任务，因为你可以轻松地共享和访问测试过程中多个项目团队的数据。

### Zephyr 要求 ###

安装和运行 Zephyr 要求满足以下最低条件。可以根据你的基础设施提高资源。我们会在 64 位 CentOS-7 系统上安装 Zephyr，几乎在所有的 Linux 操作系统中都有可用的 Zephyr 二进制发行版。

注：表格
<table width="669" style="height: 231px;">
<tbody>
<tr>
<td width="660" colspan="3"><strong>Zephyr test management tool</strong></td>
</tr>
<tr>
<td width="140"><strong>Linux OS</strong></td>
<td width="312">CentOS Linux 7 (Core), 64-bit</td>
<td width="209"></td>
</tr>
<tr>
<td width="140"><strong>Packages</strong></td>
<td width="312">JDK 7 或更高 ,&nbsp; Oracle JDK 6 update</td>
<td width="209">没有事先安装的  Tomcat 和 MySQL</td>
</tr>
<tr>
<td width="140"><strong>RAM</strong></td>
<td width="312">4 GB</td>
<td width="209">推荐 8 GB</td>
</tr>
<tr>
<td width="140"><strong>CPU</strong></td>
<td width="521" colspan="2">2.0 GHZ 或更高</td>
</tr>
<tr>
<td width="140"><strong>Hard Disk</strong></td>
<td width="521" colspan="2">30 GB , 至少 5GB </td>
</tr>
</tbody>
</table>

安装 Zephyr 要求你有超级用户（root）权限，并确保你已经正确配置了网络的静态 IP ，默认端口必须可用并允许通过防火墙。其中 tomcat 会使用 80/443、 8005、 8009、 8010 端口， Zephyr 内部使用 RTMP 协议的 flex 会使用 443 和 2099 号端口。

### 安装 Java JDK 7 ###

安装 Zephyr 首先需要安装 Java JDK 7，如果你的系统上还没有安装，可以按照下面的方法安装 Java 并设置 JAVA_HOME 环境变量。

输入以下的命令安装 Java JDK 7。

    [root@centos-007 ~]# yum install java-1.7.0-openjdk-1.7.0.79-2.5.5.2.el7_1

    [root@centos-007 ~]# yum install java-1.7.0-openjdk-devel-1.7.0.85-2.6.1.2.el7_1.x86_64

安装完 java 和它的所有依赖后，运行下面的命令设置 JAVA_HOME 环境变量。

    [root@centos-007 ~]# export JAVA_HOME=/usr/java/default
    [root@centos-007 ~]# export PATH=/usr/java/default/bin:$PATH

用下面的命令检查 java 版本以验证安装。

    [root@centos-007 ~]# java –version

    java version "1.7.0_79"
    OpenJDK Runtime Environment (rhel-2.5.5.2.el7_1-x86_64 u79-b14)
    OpenJDK 64-Bit Server VM (build 24.79-b02, mixed mode)

输出显示我们已经正确安装了 1.7.0_79 版本的 OpenJDK Java。

### 安装 MySQL 5.6.x ###

如果的机器上有其它的 MySQL，建议你先卸载它们并安装这个版本，或者升级它们的模式（schemas）到指定的版本。因为 Zephyr 前提要求这个指定的 5.6.x 版本的 MySQL ，要有 root 用户名。

可以按照下面的步骤在 CentOS-7.1 上安装 MySQL 5.6 ：

下载 rpm 软件包，它会为安装 MySQL 服务器创建一个 yum 库文件。

    [root@centos-007 ~]# yum install wget
    [root@centos-007 ~]# wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

然后用 rpm 命令安装下载下来的 rpm 软件包。

    [root@centos-007 ~]# rpm -ivh mysql-community-release-el7-5.noarch.rpm

安装完这个软件包后你会有两个和 MySQL 相关的新的 yum 库。然后使用 yum 命令安装 MySQL Server 5.6，它会自动安装所有需要的依赖。

    [root@centos-007 ~]# yum install mysql-server

安装过程完成之后，运行下面的命令启动 mysqld 服务并检查它的状态是否激活。

    [root@centos-007 ~]# service mysqld start
    [root@centos-007 ~]# service mysqld status

对于全新安装的 MySQL 服务器，MySQL root 用户的密码为空。为了安全起见，我们应该重置 MySQL root 用户的密码。用自动生成的空密码连接到 MySQL 并更改 root 用户密码。

    [root@centos-007 ~]# mysql
    mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('your_password');
    mysql> flush privileges;
    mysql> quit;

现在我们需要在 MySQL 默认的配置文件中配置所需的数据库参数。打开 "/etc/" 目录中的文件并按照下面那样更新。

    [root@centos-007 ~]# vi /etc/my.cnf

----------

    [mysqld]
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock
    symbolic-links=0

    sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
    max_allowed_packet=150M
    max_connections=600
    default-storage-engine=INNODB
    character-set-server=utf8
    collation-server=utf8_unicode_ci

    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid
    default-storage-engine=INNODB
    character-set-server=utf8
    collation-server=utf8_unicode_ci

    [mysql]
    max_allowed_packet = 150M
    [mysqldump]
    quick

保存配置文件中的更新并重启 mysql 服务。

    [root@centos-007 ~]# service mysqld restart

### 下载 Zephyr 安装包 ###

我们已经安装完了安装 Zephyr 所需要的软件包。现在我们需要获取 Zephyr 二进制发布包和它的许可证密钥。到 Zephyr 官方下载链接 [http://download.yourzephyr.com/linux/download.php](http://download.yourzephyr.com/linux/download.php) 输入你的电子邮件 ID 并点击下载。

![下载 Zephyr](http://blog.linoxide.com/wp-content/uploads/2015/08/13.png)

然后确认你的电子邮件地址，你会获得 Zephyr 下载链接和它的许可证密钥链接。点击提供的链接从服务器中选择和你操作系统合适的版本下载二进制安装包以及许可证文件。

我们把它下载到 home 目录并更改它的权限为可执行。

![Zephyr 二进制包](http://blog.linoxide.com/wp-content/uploads/2015/08/22.png)

### 开始安装和配置 Zephyr ###

现在我们通过执行它的二进制安装脚本开始安装 Zephyr。

    [root@centos-007 ~]# ./zephyr_4_7_9213_linux_setup.sh –c

一旦你运行了上面的命令，它会检查是否正确配置了 Java 环境变量。如果配置不正确，你可能会看到类似下面的错误。

    testing JVM in /usr ...
    Starting Installer ...
    Error : Either JDK is not found at expected locations or JDK version is mismatched.
    Zephyr requires Oracle Java Development Kit (JDK) version 1.7 or higher.

如果你正确配置了 Java，它会开始安装 Zephyr 并要求你输入 “o” 继续或者输入 “c” 取消安装。让我们敲击 “o” 并输入回车键开始安装。

![安装 zephyr](http://blog.linoxide.com/wp-content/uploads/2015/08/32.png)

下一个选项是检查安装 Zephyr 所有的要求，输入回车进入下一个选项。

![zephyr 要求](http://blog.linoxide.com/wp-content/uploads/2015/08/42.png)

输入 “1” 并回车同意许可证协议。

    I accept the terms of this license agreement [1], I do not accept the terms of this license agreement [2, Enter]

我们需要选择安装 Zephyr 合适的目标位置以及默认端口，如果你想用默认端口之外的其它端口，也可以在这里配置。

![installation folder](http://blog.linoxide.com/wp-content/uploads/2015/08/52.png)

然后自定义 mysql 数据库参数并给出配置文件的正确路径。在这一步你可能看到类似下面的错误。

    Please update MySQL configuration. Configuration parameter max_connection should be at least 500 (max_connection = 500) and max_allowed_packet should be at least 50MB (max_allowed_packet = 50M).

要消除这个错误，你要确保在 mysql 配置文件中正确配置了 "max\_connection" 和 "max\_allowed\_packet" 参数。运行所示的命令连接到数据库确认这些设置。

![连接 mysql](http://blog.linoxide.com/wp-content/uploads/2015/08/62.png)

当你正确配置了 mysql 数据库，它会提取配置文件并完成安装。

![配置 mysql](http://blog.linoxide.com/wp-content/uploads/2015/08/72.png)

安装过程在你的计算机上成功的安装了 Zephyr 4.7。要启动 Zephyr 桌面，输入 “y” 完成 Zephyr 安装。

![启动 zephyr](http://blog.linoxide.com/wp-content/uploads/2015/08/82.png)

### 启动 Zephyr 桌面 ###

打开你的 web 浏览器并用你的本机 IP 地址启动 Zephyr 桌面，你会被导向 Zephyr 桌面。

    http://your_server_IP/zephyr/desktop/

![Zephyr 桌面](http://blog.linoxide.com/wp-content/uploads/2015/08/91.png)

从 Zephyr 仪表盘点击 "Test Manager" 并用默认的用户名和密码 "test.manager" 登录。

![Test Manage 登录](http://blog.linoxide.com/wp-content/uploads/2015/08/test_manager_login.png)

你登录进去后你就可以配置你的管理设置了。根据你的环境选择你想要的设置。

![Test Manage 管理](http://blog.linoxide.com/wp-content/uploads/2015/08/test_manage_admin.png)

完成管理设置后保存设置，资源管理和项目配置也类似，然后开始使用 Zephyr 作为你的测试管理工具吧。如图所示在 Department Dashboard Management 中检查和编辑管理设置状态。

![zephyr 仪表盘](http://blog.linoxide.com/wp-content/uploads/2015/08/dashboard.png)

### 总结 ###

好了！ 我们已经在 CentOS 7.1 上安装完了 Zephyr。我们希望你能更加深入了解 Zephyr 测试管理工具，它提供简化测试流程、允许快速访问数据分析、协作工具以及多个项目成员之间交流。如果在你的环境中遇到任何问题，欢迎和我们联系。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-zephyr-tool-centos-7-x/

作者：[Kashif Siddique][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/