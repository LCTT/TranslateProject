在Ubuntu 14.04 上使用Bacula和Webmin设置备份服务器
================================================================================
**Bacula**是一个开源网络备份解决方案，允许你在本地或者远程计算机组上备份或者还原数据。配置与安装很容易，并支持许多高级存储管理特性。

本教程中，让我们来学习一下如何在Ubuntu 14.04服务器上安装和配置Bacula。我的机器的IP是**192.168.1.250/24**，主机名是**server.unixmen.local**。现在让我们进入教程吧。

### 安装 Bacula ###

Bacula使用SQL数据库管理它的信息。我们可以使用MySQL或者PostgreSQL数据库。本篇教程中，我使用MySQL。

输入下面的命令安装MySQL服务器。

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install mysql-server

在安装MySQL的过程中，可能提示需要输入数据库管理员密码。输入密码后按下OK。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0012.png)

重新输入密码：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0021.png)

现在使用下面的命令安装bacula：

    sudo apt-get install bacula-server bacula-client

Bacula默认使用Postfix MTA。安装过程中，你会被要求配置Postfix。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0031.png)

选择Internet站点并点击OK。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0041.png)

输入服务器完整域名（FQDN）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0051.png)

现在输入yes用dbconfig-common来配置Bacula数据库。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_006.png)

输入MySQL数据库管理员密码：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0071.png)

设置数据库的bacula-director-mysql用户的密码。如果留空不输入，会生成一个随机密码。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0081.png)

重新输入密码：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sk@server-_0091.png)

### 创建备份与还原目录 ###

现在，让我们创建备份与还原目录。

    sudo mkdir -p /mybackup/backup /mybackup/restore

设置上面目录的权限与所属用户/组：

    sudo chown -R bacula:bacula /mybackup/
    sudo chown -R 700 /mybackup/

### 配置 Bacula ###

Bacula有很多配置文件需要我们配置。

**更新 Bacula Director 配置:**

    sudo vi /etc/bacula/bacula-dir.conf

找到下面的字段，并更新还原路径。本篇中，** /mybackup/restore**是我的还原位置。

    [...]
    Job {
      Name = "RestoreFiles"
      Type = Restore
      Client=server-fd
      FileSet="Full Set"
      Storage = File
      Pool = Default
      Messages = Standard
      Where = /mybackup/restore
    }
    [...]

滚动到“list of files to be backed up”字段，并设置备份的目录。本篇教程中，我希望备份“**/home/sk**”目录。所以我把这个目录包含进了“File”参数中。

    [...]
     
    #  By default this is defined to point to the Bacula binary
    #    directory to give a reasonable FileSet to backup to
    #    disk storage during initial testing.
    #
        File = /home/sk
      }
    [...]

继续向下滚动，找到**Exclude** 字段，设置排除在备份目录外的目录列表。这里，我排除了目录**/mybackup**。

    [...]
     
    # If you backup the root directory, the following two excluded
    #   files can be useful
    #
      Exclude {
        File = /var/lib/bacula
        File = /nonexistant/path/to/file/archive/dir
        File = /proc
        File = /tmp
        File = /.journal
        File = /.fsck
        File = /mybackup
      }
    }
    [...]

保存并关闭文件。

**更新 Bacula 存储守护进程设置：**

编辑 **/etc/bacula/bacula-sd.conf**，

    sudo vi /etc/bacula/bacula-sd.conf

设置备份目录位置，也就是本篇中的**/mybackup/backup**。

    [...]
     
    Device {
      Name = FileStorage
      Media Type = File
      Archive Device = /mybackup/backup
      LabelMedia = yes;                   # lets Bacula label unlabeled media
      Random Access = Yes;
      AutomaticMount = yes;               # when device opened, read it
      RemovableMedia = no;
      AlwaysOpen = no;
    }
    [...]

现在如下检查是否所有的配置是有效的。如果下面的命令没有显示，那么配置就是有效的。

    sudo bacula-dir -tc /etc/bacula/bacula-dir.conf
    sudo bacula-sd -tc /etc/bacula/bacula-sd.conf

一旦你完成所有的设置，重启所有的bacula服务。

    sudo /etc/init.d/bacula-director restart
    sudo /etc/init.d/bacula-fd restart
    sudo /etc/init.d/bacula-sd restart

就是这样。现在，bacula已经成功安装与配置了。

### 使用Webmin 管理 Bacula ###

使用命令行管理Bacula是有点困难的。所以我们使用一个图形化的管理工具“webmin”来简化我们的任务。

使用下面的命令在Ubuntu 14.04上安装Webmin。

- [在 Ubuntu 14.04 LTS上安装Webmin][1]

现在使用URL https://ip-address:10000进入Webmin界面。在左边的窗格中进入系统标签并点击模块配置链接。如果在系统下没有找到它，在未使用模块一栏中查找。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Webmin-1.690-on-server.unixmen.local-Ubuntu-Linux-14.04-Mozilla-Firefox_002.png)

在数据库一栏中选择MySQL数据库。输入MySQL管理员密码，并点击保存。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Webmin-1.690-on-server.unixmen.local-Ubuntu-Linux-14.04-Mozilla-Firefox_003.png)

就是这样。现在你可以在webmin中简单地配置Bacula了。开始加入备份客户端，磁盘卷和计划任务吧。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Webmin-1.690-on-server.unixmen.local-Ubuntu-Linux-14.04-Mozilla-Firefox_004.png)

干杯!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/setup-backup-server-using-bacula-webmin-ubuntu-14-04/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-3113-1.html
