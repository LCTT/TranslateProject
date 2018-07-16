SBackup: 一个Linux下的简单备份软件
================================================================================

**SBackup** 是一个简单易用的开源备份软件。它可以备份任意文件或者文件夹的一部分。所有的配置文件可以通过 Gnome 界面进行访问。文件和路径可以直接通过正则表达式进行添加和排除。它支持本地备份和远程备份。虽然它看起来简单，但是它有着许多常见的高级备份功能。

### 特点 ###

SBackup 可以完成以下工作

- 可以创建压缩和未压缩的备份
- 可以把未压缩的备份分割成多份文件
- 支持多份备份配置。每个人都可以根据自己的需求创建并修改自己的配置文件，但是不能删除默认配置文件
- 有多种选项，如日志、邮件通知、以状态图标的形式展现和提醒
- 支持计划任务备份和手动备份
- 可以备份到本地（如硬盘），也可以备份到远程（如通过 FTP 访问 NAS）

### 在 Ubuntu、Linux Mint 和 Debian 上安装 SBackup ###

SBackup 可在 Ubuntu、Linux Mint 和 Debian 的默认仓库中获得，所以只要运行以下命令即可安装

    sudo apt-get install sbackup

### 运行 SBackup ###

通过 Dash 或者 Menu 打开 SBackup

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Menu_0011.jpg)

将会看到如下界面

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_002.jpg)

### SBackup 配置 ###

最初的 SBackup 没有任何用户自定义的配置文件，只有默认的配置文件。需要注意的是，用户不能删除默认的配置文件。若要创建一个新的配置文件，点击 Tools -> Profile Manager，将看到如下窗口

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_003.jpg)

单击 Add 来创建新配置文件，例子的文件用“sk”来命名

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_004.jpg)

现在已经创建了新的配置文件。若要设置配置，先选择配置文件，再单击 Edit

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Configuration-Profile-Manager_005.jpg)

现在看到 SBackup 的配置文件已经被切换到“sk” 

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_006.jpg)

当然，也可以根据不同人的需求来修改默认配置文件

**注意事项**：如果你用普通用户运行 SBackup，计划任务备份不能生效，你需要用 root 用户来运行。如上图所示，因为我是以普通用户运行 Sbackup，所以 Schedule 选项是灰色不可选中状态。

在本教程中，我将以 root 权限运行 SBackup，并且使用的是**默认配置**

打开终端，运行以下命令来以 root 权限运行 SBackup

    sudo sbackup-config-gtk

上面的命令将以 root 权限打开默认配置的 SBackup

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_001.jpg)

#### General选项卡 ####

在 General 选项内，你可以选择多久进行一次完整备份，默认是7天。每7天 SBackup 将会进行一次完整的备份。你也可以选择备份的压缩格式。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0021.jpg)

#### Include选项卡 ####

这个选项不需要解释太多，你可以添加 SBackup 要备份的文件或目录。这里可以选择备份单独的文件或者完整的目录，我删除了所有的目录仅仅保留了“Resume”

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0031.jpg)

#### Exclude选项卡 ####

如同 Include 选项，我们可以选择备份时排除的文档和目录，只需要选择要排除的文档和目录的路径即可。在默认配置下，/media, /var/run/, /var/cache/, /var/spool/ 和 /vat/tmp/ 目录均被排除

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0041.jpg)

更进一步的是，你可以增加备份时排除文件的类型，像 mp3 和 avi 等等。在默认配置下，mp3, avi, mpeg, mkv, ogg 和 iso 是被排除不被备份的。如果你想备份这些文件，只要选中然后点击 remove。当然，如果要排除其他类型的文件，只需要点击 add 然后增加。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_005.jpg)

在默认配置下，SBackup 不会备份.gvfs, .thumbnails,  .Trash 和 .cache 这些文件夹

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0061.jpg)

同时你也可以在备份时根据文件大小来排除某些文档和文件夹，这里我排除了体积超过100MB 的文档和文件夹。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0071.jpg)

#### Destination选项卡 ####

在这里你可以选择备份存放的路径，正如我之前提到的，你可以把备份的文档或文件夹存放在硬盘或者远程的 FTP 或 NAS。这里我将把备份保存在 /home/sk/My Backup 目录下。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_019.jpg)

**提示:** 在备份前确认目录有足够的空间保存备份文件

#### Schedule选项卡 ####

在这个选项中，你可以设定具体的备份时间。点击 **Simple** 选项，可以按每小时、每日、每周、每月来设置你的计划备份时间。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_010.jpg)

如果你擅长使用命令行来计划任务，则可以使用 cron 来操作。当你开启每日备份计划时，cron 命令在 **/etc/cron.daily/** 目录中创建计划文件

    sudo ls -l /etc/cron.daily/sbackup

示例的输出显示

    lrwxrwxrwx 1 root root 33 Nov  8 15:34 /etc/cron.daily/sbackup -> /usr/share/sbackup/sbackup-launch

#### Purging选项卡 ####

在这个选项里，可以删除超过一定时间的备份文件。在默认配置下，超过30天的备份文件将被删除。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0111.jpg)

#### Report选项卡 ####

Report 是最后一个选项卡，在这里你可以设置接收备份完成通知的邮箱。输入你的邮箱ID、SMTP服务地址、邮箱用户名、密码后，点击 Test mail settings。需要留意的是，在测试邮箱设置前，点击工具栏中的Save Configuration按钮保存你的配置。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0121.jpg)

你将在完成测试邮箱设置后看到 “Test Successful” 字样。

### 开始备份 ###

点击 SBackup 工具栏上的 **Make Backup now button** 按钮立即开始备份。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Selection_015.jpg)

弹出一个窗口，点击 Yes 开始创建备份文件。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/sbackup-config-gtk_024.jpg)

现在备份的进程已经在后台开始运行，你可以通过在通知栏上的状态显示来监视备份的进程。

完成备份之后，关闭 SBackup ，并且确认备份文件保存在指定的目录。例子中我保存的目录是/home/sk/My Backup。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Selection_020.jpg)

### 恢复文件 ###

在终端中运行命令

    sudo sbackup-restore-gtk

在 SBackup 的恢复窗口，选择可用的备份日期和快照，在 Restoration Management 面板中选择任意一个要恢复的文件，单击 **restore** 保存到默认位置或者单击 **restore as** 保存到指定的位置。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_023.jpg)

现在文件已经从备份中恢复，就这么简单。

### 来源: ###

- [https://launchpad.net/sbackup][1]
- [http://sourceforge.net/projects/sbackup/][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-desktop-backup-made-easy-sbackup/

译者：[NearTan](https://github.com/NearTan) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/sbackup
[2]:http://sourceforge.net/projects/sbackup/
