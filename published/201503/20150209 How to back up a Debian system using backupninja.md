如何使用 backupninja 来备份 Debian 系统
================================================================================
小心谨慎或灾难体验会让每一个系统管理都认识到频繁的系统备份的重要性。你可以通过编写管用的旧式 shell 脚本，或使用一个（或几个）适合这项工作的备份工具来完成备份任务。因此，当你要实施一个备份解决方案时，你了解的备份工具越多，你做出的决策就会越明智。

在这篇文章中，我们将为你介绍 [backupninja][2] ，这是一个轻量且易于配置的系统备份工具。在诸如 **rdiff-backup**, **duplicity**, **mysqlhotcopy** 和 **mysqldump** 等程序的帮助下， Backupninja 可以提供常用的备份功能，如执行远程的、安全的和增量式的文件系统备份，加密备份以及 MySQL/MariaDB 数据库备份。你可以选择性地开启使用 Email 状态报告功能，也可以对一般的硬件和系统的信息进行备份。 backupninja 的一个关键功能是它拥有一个内建的基于控制台的向导程序（被称为 **ninjahelper**），而后者允许你为不同的备份情景轻松地创建配置文件。

如果非要说的话，backupninja 的缺点是：为了充分使用其所有的功能，它要求安装一些其他“助手”程序。尽管 backupninja 有针对基于 Red Hat（红帽）的发行版本的 RPM 安装包，但 backupninja 针对 Debian 及其衍生发行版本的依赖进行了优化。所以不建议在基于 Red Hat 的系统上尝试 backupninja 。

在这篇教程中，我们将介绍如何在基于 Debian 的发行版本上安装 backupninja 。

### 安装 Backupninja ###
 
以 root 账户来运行下面的命令：

    # aptitude install backupninja 

在安装的过程中，有几个文件和目录将被创建：

- **/usr/sbin/backupninja** 是个 bash shell 的主脚本；
- **/etc/cron.d/backupninja**， 默认情况下，设置 cron 任务来每隔一个小时运行上面的主脚本；
- **/etc/logrotate.d/backupninja** 截断由 backupninja 程序产生的日志；
- **/etc/backup.d/** 是备份操作的配置文件驻留的目录；
- **/etc/backupninja.conf** 是包含一般选项的主配置文件。这个文件带有良好的注释且详细解释了每个选项的含义；
- **/usr/share/backupninja** 是那些 backupninja 所使用的脚本所处的目录。这些脚本文件负责执行实际的工作。在这个目录中，你还可以找到 `.helper` 文件，它们可以被用来配置和设定 ninjahelper 的菜单；
- **/usr/share/doc/backupninja/examples** 含有操作配置文件（即通过 ninjahelper 产生的文件）的模板。

### 首次运行 Ninjahelper ###

当我们尝试启动 ninjahelper 时，我们可以看到可能需要一个内部依赖程序。假如系统进行了提示，请输入 “yes” 并敲下回车键来安装 dialog（一个用于从 shell 脚本中显示友好对话框的工具）。

![](https://farm8.staticflickr.com/7537/15700597667_6618fbc142_z.jpg)

当你在键入 yes 后再敲回车键时，backupninja 将会安装 dialog，一旦安装完成，将呈现出下面的截屏：

![](https://farm8.staticflickr.com/7469/15884374871_29f1c9acf1_z.jpg)

#### 案例 1: 备份硬件和系统信息 ####

在启动了 ninjahelper 之后，我们将创建一个新的备份操作：

![](https://farm9.staticflickr.com/8637/15885715132_eb3156678e_z.jpg)

如果必要的助手程序没有被安装，下面的截屏将会呈现在我们眼前。假如这些软件包已经在你的系统上安装了，请跳过这一步。

![](https://farm8.staticflickr.com/7508/15700315139_4c6117ef32_z.jpg)

接下来的一步需要你选取相关条目来作为此次备份任务的一部分。前四个条目已经默认被选上了，但你可以通过在条目上按空格键来撤消选择。

![](https://farm8.staticflickr.com/7507/15699051870_65abaf52e5_z.jpg)

一旦你完成了上面的步骤，按 OK 选项来继续。接着你将能够选择是愿意使用默认的配置文件(/etc/backup.d/10.sys)来完成这次备份操作，还是创建一个新的配置文件。若为后者，一个含有与默认配置文件内容相同的文件将会在相同的目录下被创建，但它被命名为 11.sys，后续的备份操作将会创建类似的文件（注：只不过命名的序号不同）。需要说明的是一旦这个新的配置文件被创建，你便可以使用你喜爱的文本编辑器来编辑该文件。

![](https://farm9.staticflickr.com/8654/15885715072_1e6126e929_o.png)

#### 案例 2: 一个远程目录的增量式 Rsync 拉取备份 ####

正如你最有可能知道的那样， rsync 被广泛地用于通过网络同步文件或文件夹。在接下来的例子中，我们将讨论一个使用硬链接来为一个远程目录做增量式拉取备份的方法，它被用来保存历史数据以及在我们本地的文件服务器中恢复这些历史数据。这个方法将帮助我们节省空间并增强位于服务器端的安全性。

**步骤 1**：编写一个带有如下内容的自定义脚本，放在 `/etc/backup.d`，并将它的权限设置为 600 。需要说明的是，除了一般的配置文件，这个目录可能还包含当 backupninja 执行时你想运行的一些脚本文件，它们可以发挥出位于主配置文件中的变量的优势。

    # REMOTE USER
    user=root
    # REMOTE HOST
    host=dev1
    # REMOTE DIRECTORY
    remotedir=/home/gacanepa/
    # LOCAL DIRECTORY
    localdir=/home/gacanepa/backup.0
    # LOCAL DIRECTORY WHERE PREVIOUS BACKUP WAS STORED
    localdirold=/home/gacanepa/backup.1
    mv $localdir $localdirold
    # RSYNC
    rsync -av --delete --recursive --link-dest=$localdirold $user@$host:$remotedir $localdir

在上面的配置中， rsync 的 ‘--link-dest’ 选项的作用是为位于 $localdir-old 目录中那些没有改变的文件(包含所有属性) 硬链接到目标目录（$localdir）。

**步骤 2**：在 backupninja 第一次运行之前，上层目录（这个例子中指的是 /home/gacanepa） 是空的。第一次我们执行下面的命令：

    # backupninja -n 

backup.0 目录就被创建了，并在接下来的过程中，它的名称将会被更改为 backup.1。

当我们第二次运行 backupninja 时， backup.0 将会被重新创建，而 backup.1 保持不动。

![](https://farm8.staticflickr.com/7581/15700597497_0e0cd89ab9.jpg)

**步骤 3**： 确保 backup.1 里面的文件硬链接到 backup.0 里的文件，我们可以通过比较文件的 inode（i 节点）数和目录的大小来达到此目的。

![](https://farm9.staticflickr.com/8636/15700315029_e922ce771b.jpg)

### 总结 ###

Backupninja 不仅是一个经典的备份工具，它也是一个易于配置的实用程序。你可以通过编写你自己的控制脚本，用放在 `/etc.backup.d` 中的不同的配置文件来运行 backupninja 。甚至你还可以为 ninjahelper 编写助手程序，并将其包括在 ninjahelper 的主界面上。

例如，假如你在 `/usr/share/backupninja`目录中创建了一个名为 xmodulo 的控制脚本，它将自动运行那些位于 `/etc/backup.d` 目录中以 .xmodulo 为后缀的每个文件。如果你决定添加你的 xmodulo 控制脚本到 ninjahelper 中， 你可以编写相应的助手程序，即 xmodulo.helper 。另外，假如你想 让 backupninja 运行其它的脚本，只需把它添加到 `/etc/backup.d` 目录中就可以了。

欢迎使用下面的评论框来留下你的评论、问题或建议。听到你的回应将会使我们很高兴。

--------------------------------------------------------------------------------

via: http://xmodulo.com/backup-debian-system-backupninja.html

作者：[Gabriel Cánepa][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/recommend/sysadminbook
[2]:https://labs.riseup.net/code/projects/backupninja
