[#]: subject: "Scheduling tasks with cron"
[#]: via: "https://fedoramagazine.org/scheduling-tasks-with-cron/"
[#]: author: "Darshna Das https://fedoramagazine.org/author/climoiselle/"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 cron 调度任务
======

![][1]

Photo by [Yomex Owo][2] on [Unsplash][3]

Cron 是一个调度守护进程，它以指定的时间间隔执行任务，这些任务称为 _corn_ 作业，主要用于自动执行系统维护或管理任务。例如，你可以设置一个 _cron_ 作业来自动执行重复的任务，比如备份数据库或数据，使用最新的安全补丁更新系统，检查磁盘空间使用情况，发送电子邮件等等。 _cron_ 作业可以按分钟、小时、日、月、星期或它们的任意组合运行。

### **cron 的一些优点**

以下是使用 _cron_ 作业的一些优点：

  * 你可以更好地控制作业的运行时间。例如，你可以精确到分钟、小时、天等。
  * 它消除了为循环任务逻辑而去写代码的需要，当你不再需要执行任务时，可以直接关闭它。
  * 作业在不执行时不会占用内存，因此你可以节省内存分配。
  * 如果一个作业执行失败并由于某种原因退出，它将在指定的时间再次运行。

### 安装 cron 守护进程

幸运的是，Fedora Linux 预先配置了运行重要的系统任务来保持系统更新，有几个实用程序可以运行任务例如 _cron_、_anacorn_、_at_ 和 _batch_ 。本文只关注 _cron_ 实用程序的安装。Cron 和 _cronie_ 包一起安装，cronie 包也提供 _cron_ 服务。

要确定软件包是否已经存在，使用 rpm 命令：

```bash
$ rpm -q cronie
 Cronie-1.5.2-4.el8.x86_64
```

如果安装了 _cronie_ ，它将返回 _cronie_ 包的全名。如果你的系统中没有安装，则会显示未安装。

使用以下命令安装：

```bash
$ dnf install cronie
```

### 运行 cron 守护进程

一个 _cron_ 作业由 _crond_ 服务来执行，它会读取配置文件中的信息。在将作业添加到配置文件之前，必须启动 _crond_ 服务，或者安装它。什么是 _crond_ 呢？_Crond_ 是 cron 守护程序的简称。要确定 _crond_ 服务是否正在运行，输入以下命令：

```bash
$ systemctl status crond.service
● crond.service - Command Scheduler
      Loaded: loaded (/usr/lib/systemd/system/crond.service; enabled; vendor pre>
      Active: active (running) since Sat 2021-03-20 14:12:35 PDT; 1 day 21h ago
    Main PID: 1110 (crond)
```

如果你没有看到类似的内容 "Active: active (running) since…"，你需要启动 _crond_ 守护进程。要在当前会话中运行 _crond_ 服务，输入以下命令：

```bash
$ systemctl run crond.service
```

将其配置为开机自启动，输入以下命令：

```bash
$ systemctl enable crond.service
```

如果出于某种原因，你希望停止 _crond_ 服务，按以下方式使用 _stop_ 命令：

```bash
$ systemctl stop crond.service
```

要重新启动它，只需使用 _restart_ 命令：

```bash
$ systemctl restart crond.service
```

### **定义 cron 工作**

#### **cron 配置**

以下是一个 _cron_ 作业的配置细节示例。它定义了一个简单的 _cron_ 作业，将 _git_ master 分支的最新更改拉取到克隆的仓库中：

```shell
*/59 * * * * username cd /home/username/project/design && git pull origin master
```

主要有两部分：

  * 第一部分是 “*/59 * * * *”。这表明计时器设置为每 59 分钟一次。
  * 该行的其余部分是命令，因为它将从命令行运行。
    在此示例中，命令本身包含三个部分：
    * 作业将以用户 ”username“ 的身份运行
    * 它将切换到目录 `/home/username/project/design`
    * 运行 git 命令拉取 master 分支中的最新更改

#### **时间语法**

如上所述，时间信息是 _cron_ 作业字符串的第一部分，如上所属。它决定了 cron 作业运行的频率和时间。它按以下顺序包括 5 个部分：

  * 分钟
  * 小时
  * 一个月中的某天
  * 月份
  * 一周中的某天

下面是一种更图形化的方式来解释语法：

```bash
  .---------------- 分钟 (0 - 59)
 |  .------------- 小时 (0 - 23)
 |  |  .---------- 一月中的某天 (1 - 31)
 |  |  |  .------- 月份 (1 - 12) 或 jan,feb,mar,apr …
 |  |  |  |  .---- 一周中的某天 (0-6) (Sunday=0 or 7)
 |  |  |  |  |            或 sun,mon,tue,wed,thr,fri,sat
 |  |  |  |  |               
 *  *  *  *  *  user-name  command-to-be-executed 
```

#### **星号**的使用

星号（*）可以用来替代数字，表示该位置的所有可能值。例如，分钟位置上的星号会使它每分钟运行一次。以下示例可能有助于更好地理解语法。

这个 cron 作业将每分钟运行一次：

```bash
* * * * [command]
```

斜杠表示分钟数。下面的示例将每小时运行 12 次，即每 5 分钟运行一次：

```bash
*/5 * * * * [command]
```

下一个示例将每月的第二天午夜（例如 1 月 2 日凌晨 12:00，2 月 2 日凌晨 12:00 等等）：

```bash
0 0 2 * * [command]
```

#### 使用 crontab 创建一个 cron 作业

Cron 作业会在后台运行，它会不断检查 _/etc/crontab_ 文件和 _/etc/cron.*/_ 以及 _/var/spool/cron/_ 目录。每个用户在 _/var/spool/cron/_  中都有一个唯一的 crontab 文件。

不应该直接编辑这些 _cron_ 文件。_crontab_ 命令是用于创建、编辑、安装、卸载和列出 cron 作业的方法。

更酷的是，在创建新文件或编辑现有文件后，你无需重新启动 cron。

```bash
$ crontab -e
```

这将打开你现有的 _crontab_ 文件，或者创建一个。调用 _crontab -e_ 时，默认情况下会使用 _vi_ 编辑器。注意：使用 Nano 编辑 _crontab_ 文件，可以选择设置 **EDITOR**=nano 环境变量。

使用 -l 选项列出所有 cron 作业。如果需要，使用 -u 选项指定一个用户。

```bash
$ crontab -l
$ crontab -u username -l
```

使用以下命令删除所有 _cron_ 作业：

```bash
$ crontab -r
```

要删除特定用户的作业，你必须以 _root 用户_ 身份运行以下命令：

```bash
$ crontab -r -u username
```

感谢你的阅读。_cron_ 作业看起来可能只是系统管理员的工具，但它实际上与许多 Web 应用程序和用户任务有关。

#### 参考

Fedora Linux 文档的[自动化任务][4]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/scheduling-tasks-with-cron/

作者：[Darshna Das][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/climoiselle/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/schedule_with_cron-816x345.jpg
[2]: https://unsplash.com/@yomex4life?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/clock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.fedoraproject.org/en-US/Fedora/12/html/Deployment_Guide/ch-autotasks.html