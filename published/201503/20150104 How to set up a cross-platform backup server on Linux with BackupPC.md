如何在 Linux 上使用 BackupPC 来架设跨平台的备份服务器
================================================================================
也许你没有从我先前关于 [backupninja][1] 和 [backup-manager][2] 的两篇文章中发现，我是一个超级备“粉”。当提到备份，我宁愿备份的太多而不希望备份不足，因为如果我们有需要的话，你将会感激你为重要数据生成额外的拷贝所付出的时间和精力。

在这篇文章中，我将向你介绍 [BackupPC][3]，一个跨平台的备份服务器软件，它可以通过网络为 Linux，Windows 和 MacOS 等系统上的客户端主机拉取备份。BackupPC 添加了一系列的特点使得管理备份变为一件快乐的事。

### BackupPC 的特点 ###

BackupPC 自带有一个健壮的 Web 界面，允许你以集中化的方式来收集和管理其他远程客户端主机上的备份。通过使用它的 Web 界面，你可以检查日志和配置文件、为其他远程主机启动/取消/安排备份任务以及可视化备份任务的当前状态。你也可以非常容易地浏览归档的文件以及从备份的归档中恢复单个文件或整个备份。要恢复单个文件，你可以直接通过 Web 界面来下载任何先前备份的文件。不仅如此，客户端主机并不需要安装特别的客户端软件。在 Windows 客户端上， 使用的是原生的 SMB 协议，而对于 *nix 客户端，你将使用 `rsync` 或 通过 SSH, RSH 或 NFS 来使用 `tar` 。

### 安装 BackupPC ###

在 Debian，Ubuntu 和它们的衍生版本上，运行下面的命令：

    # aptitude install backuppc 

在 Fedora上， 使用 `yum` 命令。请注意软件包名字对大小写敏感。

在 CentOS/RHEL 6 上，首先要启用 [EPEL 软件仓库][4]。在 CentOS/RHEL 7 上，请替代启用 [Nux Dextop][5] 软件仓库。然后接着使用 `yum` 命令：

    # yum install BackupPC 

同往常一样，这两种包管理系统都会自动解决依赖问题。另外，作为安装过程中的一部分，你可能需要新配置或修改配置用于图形用户界面的 Web 服务器。下面的截图来自于 Debian 系统：

![](https://farm8.staticflickr.com/7573/16163781711_6218b620ef_c.jpg)

通过空格键来确定你的选择，然后使用 tab 键移动到 Ok 选项并敲回车键。

接着类似于下面的截屏将会呈现在你眼前，通知你创建了一个用来管理 BackupPC 的名为 ‘backuppc’的管理员用户以及相应的密码（如果你需要，这个密码以后可以更改）。这里需要注意的是：这里创建了同样名为 ‘backuppc’的 HTTP 账户和常规的 Linux 账户，它们使用相同的密码。需要前者的目的是来访问受保护的 BackupPC 的 Web 界面，而后者则是为了通过 SSH 来使用 `rsync` 来执行备份任务。

![](https://farm8.staticflickr.com/7579/15979622809_25e734658d_c.jpg)

你可以使用下面的命令来更改 HTTP 账户 ‘backuppc’ 的默认密码：

    # htpasswd /path/to/hash/file backuppc 

至于常规的 ‘backuppc’ [Linux][6]账户，可以使用 `passwd`命令来更改它的默认密码：

    # passwd backuppc 

需要提及的是：安装过程中会自动创建 Web 和程序的配置文件。

### 启动 BackupPC 并设置备份 ###

首先，打开一个浏览器窗口并指向 http://\<服务器名称或 IP 地址>/backuppc/ 。当弹出提示框时，输入先前向你创建的默认 HTTP 用户凭据（注：即用户名 backuppc 和相应的默认密码）。假如认证成功，你就会被带入到 Web 界面的主页：

![](https://farm9.staticflickr.com/8601/15543330314_f6fdaa235e_z.jpg)

你想做的第一件事最有可能是通过新增一个客户端主机来备份。进入任务窗格中的 “编辑主机”选项。我们将添加两个客户端主机：

- Host #1: CentOS 7 [IP 192.168.0.17]
- Host #2: Windows 7 [IP 192.168.0.103] 

我们将通过 SSH 使用 `rsync`来备份 CentOS 主机，使用 SMB 来备份 Windows 主机。在执行备份之前，我们需要向我们的 CentOS 主机设置 [基于密钥认证][7] 以及在我们的 Windows 主机中设置一个共享目录。

下面是关于如何为一个远程 CentOS 主机设置基于密钥认证的指导。我们创建 ‘backuppc’ 用户的 RSA 密钥对，并将其公钥传输给 CentOS 主机上的 root 账户。

    # usermod -s /bin/bash backuppc
    # su - backuppc
    # ssh-keygen -t rsa
    # ssh-copy-id root@192.168.0.17 

当弹出提示框时，键入 yes 并为 192.168.0.17 键入 root 用户的密码：

![](https://farm8.staticflickr.com/7496/16164929932_8fc817125d_b.jpg)

你需要一个远程的 CentOS 主机的 root 权限，以获得在该主机中的文件系统中写权限，以防要恢复的备份文件或目录的所有者为 root 账户。

一旦 CentOS 和 Windows 主机都准备完毕，使用 Web 界面将它们添加到 BackupPC：

![](https://farm9.staticflickr.com/8586/15979622709_76c2dcf68c_z.jpg)

下一步更改每个主机的备份设置：

![](https://farm8.staticflickr.com/7461/16163781611_765c147f9f_z.jpg)

接下来的图片展示了 Windows 主机的备份设置：

![](https://farm8.staticflickr.com/7480/16139884676_bddfafed75_z.jpg)

而接着的截图展示了 CentOS 主机的备份设置：

![](https://farm8.staticflickr.com/7557/16139884666_34ff8fd858_z.jpg)

### 开始一个备份任务 ###

为了开始备份，到每个主机的设定选项，然后点击“开始全备份”：

![](https://farm8.staticflickr.com/7536/15978247428_458c023f4c.jpg)

在任何时候，你都可以通过点击如上图展示的每个主机的备份主页来查看备份任务的状态。假如因为某些原因备份失败，在主机菜单中将会出现一个指向包含错误信息的网页的链接。当一个备份任务成功完成后，在服务器的 /var/lib/backuppc/pc 目录下会创建一个命名为主机名或 IP 地址的目录。

![](https://farm8.staticflickr.com/7549/16165680115_196ee42a49_z.jpg)

我们也可以随意地在命令行中浏览这个目录中的文件，但存在一个更加简单的方式来查找和恢复这些文件。

### 恢复备份 ###

要浏览这些保存的文件，进入每个主机的主菜单下的 “浏览备份”选项，你可以一目了然地看到目录和文件，并选择那些你想恢复的文件。另外，你还可以通过点击文件来使用默认程序打开文件或右击文件并选择“另存为”来下载该文件到你当前的机器上：

![](https://farm8.staticflickr.com/7506/16165680105_bd5883e0da_c.jpg)

如若你想，你可以下载一个包含所有你想备份的内容的 zip 或 tar 文件：

![](https://farm8.staticflickr.com/7507/15978247398_18e81667cd_z.jpg)

或只是恢复文件：

![](https://farm8.staticflickr.com/7545/15545911003_2aca8a36fc_z.jpg)

### 总结 ###

有句俗话说，"越简单，越好"，而这正是 BackupPC 所提供的东西。在 BackupPC 中，你将不仅找到了一个备份工具，而且还找到了一个无需任何客户端应用来在几个不同的操作系统中管理你的备份的方法。我相信这就有足够的理由让你去尝试一下。

欢迎使用下面的评论框来留下你的评论和问题，假如你有的话。我总是乐于听取读者想说的话！

--------------------------------------------------------------------------------

via: http://xmodulo.com/backuppc-cross-platform-backup-server-linux.html

作者：[Gabriel Cánepa][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://linux.cn/article-5096-1.html
[2]:http://linux.cn/article-4586-1.html
[3]:http://backuppc.sourceforge.net/
[4]:http://linux.cn/article-2324-1.html
[5]:http://linux.cn/article-3889-1.html
[6]:http://xmodulo.com/recommend/linuxguide
[7]:http://xmodulo.com/how-to-enable-ssh-login-without.html
