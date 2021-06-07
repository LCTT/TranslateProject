[#]: collector: (lujun9972)
[#]: translator: (tt67wq)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13307-1.html)
[#]: subject: (Use systemd timers instead of cronjobs)
[#]: via: (https://opensource.com/article/20/7/systemd-timers)
[#]: author: (David Both https://opensource.com/users/dboth)

使用 systemd 定时器代替 cron 作业
======

> 定时器提供了比 cron 作业更为细粒度的事件控制。

![](https://img.linux.net.cn/data/attachment/album/202104/18/104406dgszkj3eeibkea55.jpg)

我正在致力于将我的 [cron][2] 作业迁移到 systemd 定时器上。我已经使用定时器多年了，但通常来说，我的学识只足以支撑我当前的工作。但在我研究 [systemd 系列][3] 的过程中，我发现 systemd 定时器有一些非常有意思的能力。

与 cron 作业类似，systemd 定时器可以在特定的时间间隔触发事件（shell 脚本和程序），例如每天一次或在一个月中的特定某一天（或许只有在周一生效），或在从上午 8 点到下午 6 点的工作时间内每隔 15 分钟一次。定时器也可以做到 cron 作业无法做到的一些事情。举个例子，定时器可以在特定事件发生后的一段时间后触发一段脚本或者程序去执行，例如开机、启动、上个任务完成，甚至于定时器调用的上个服务单元的完成的时刻。

### 操作系统维护的计时器

当在一个新系统上安装 Fedora 或者是任意一个基于 systemd 的发行版时，作为系统维护过程的一部分，它会在 Linux 宿主机的后台中创建多个定时器。这些定时器会触发事件来执行必要的日常维护任务，比如更新系统数据库、清理临时目录、轮换日志文件，以及更多其他事件。

作为示例，我会查看一些我的主要工作站上的定时器，通过执行 `systemctl status *timer` 命令来展示主机上的所有定时器。星号的作用与文件通配相同，所以这个命令会列出所有的 systemd 定时器单元。

```
[root@testvm1 ~]# systemctl status *timer
● mlocate-updatedb.timer - Updates mlocate database every day
     Loaded: loaded (/usr/lib/systemd/system/mlocate-updatedb.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 00:00:00 EDT; 15h left
   Triggers: ● mlocate-updatedb.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Updates mlocate database every day.

● logrotate.timer - Daily rotation of log files
     Loaded: loaded (/usr/lib/systemd/system/logrotate.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 00:00:00 EDT; 15h left
   Triggers: ● logrotate.service
       Docs: man:logrotate(8)
             man:logrotate.conf(5)

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Daily rotation of log files.

● sysstat-summary.timer - Generate summary of yesterday's process accounting
     Loaded: loaded (/usr/lib/systemd/system/sysstat-summary.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 00:07:00 EDT; 15h left
   Triggers: ● sysstat-summary.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Generate summary of yesterday's process accounting.

● fstrim.timer - Discard unused blocks once a week
     Loaded: loaded (/usr/lib/systemd/system/fstrim.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Mon 2020-06-08 00:00:00 EDT; 3 days left
   Triggers: ● fstrim.service
       Docs: man:fstrim

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Discard unused blocks once a week.

● sysstat-collect.timer - Run system activity accounting tool every 10 minutes
     Loaded: loaded (/usr/lib/systemd/system/sysstat-collect.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Thu 2020-06-04 08:50:00 EDT; 41s left
   Triggers: ● sysstat-collect.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Run system activity accounting tool every 10 minutes.

● dnf-makecache.timer - dnf makecache --timer
     Loaded: loaded (/usr/lib/systemd/system/dnf-makecache.timer; enabled; vendor preset: enabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Thu 2020-06-04 08:51:00 EDT; 1min 41s left
   Triggers: ● dnf-makecache.service

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started dnf makecache –timer.

● systemd-tmpfiles-clean.timer - Daily Cleanup of Temporary Directories
     Loaded: loaded (/usr/lib/systemd/system/systemd-tmpfiles-clean.timer; static; vendor preset: disabled)
     Active: active (waiting) since Tue 2020-06-02 08:02:33 EDT; 2 days ago
    Trigger: Fri 2020-06-05 08:19:00 EDT; 23h left
   Triggers: ● systemd-tmpfiles-clean.service
       Docs: man:tmpfiles.d(5)
             man:systemd-tmpfiles(8)

Jun 02 08:02:33 testvm1.both.org systemd[1]: Started Daily Cleanup of Temporary Directories.
```

每个定时器至少有六行相关信息：

  * 定时器的第一行有定时器名字和定时器目的的简短介绍
  * 第二行展示了定时器的状态，是否已加载，定时器单元文件的完整路径以及预设信息。
  * 第三行指明了其活动状态，包括该定时器激活的日期和时间。
  * 第四行包括了该定时器下次被触发的日期和时间和距离触发的大概时间。
  * 第五行展示了被定时器触发的事件或服务名称。
  * 部分（不是全部）systemd 单元文件有相关文档的指引。我虚拟机上输出中有三个定时器有文档指引。这是一个很好（但非必要）的信息。
  * 最后一行是计时器最近触发的服务实例的日志条目。

你也许有一些不一样的定时器，取决于你的主机。

### 创建一个定时器

尽管我们可以解构一个或多个现有的计时器来了解其工作原理，但让我们创建我们自己的 [服务单元][4] 和一个定时器去触发它。为了保持简单，我们将使用一个相当简单的例子。当我们完成这个实验之后，就能更容易理解其他定时器的工作原理以及发现它们正在做什么。

首先，创建一个运行基础东西的简单的服务，例如 `free` 命令。举个例子，你可能想定时监控空余内存。在 `/etc/systemd/system` 目录下创建如下的 `myMonitor.server` 单元文件。它不需要是可执行文件：

```
# This service unit is for testing timer units
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=Logs system statistics to the systemd journal
Wants=myMonitor.timer

[Service]
Type=oneshot
ExecStart=/usr/bin/free

[Install]
WantedBy=multi-user.target
```

这大概是你能创建的最简单的服务单元了。现在我们查看一下服务状态同时测试一下服务单元确保它和我们预期一样可用。


```
[root@testvm1 system]# systemctl status myMonitor.service
● myMonitor.service - Logs system statistics to the systemd journal
     Loaded: loaded (/etc/systemd/system/myMonitor.service; disabled; vendor preset: disabled)
     Active: inactive (dead)
[root@testvm1 system]# systemctl start myMonitor.service
[root@testvm1 system]#
```

输出在哪里呢？默认情况下，systemd 服务单元执行程序的标准输出（`STDOUT`）会被发送到系统日志中，它保留了记录供现在或者之后（直到某个时间点）查看。（在本系列的后续文章中，我将介绍系统日志的记录和保留策略）。专门查看你的服务单元的日志，而且只针对今天。`-S` 选项，即 `--since` 的缩写，允许你指定 `journalctl` 工具搜索条目的时间段。这并不代表你不关心过往结果 —— 在这个案例中，不会有过往记录 —— 如果你的机器以及运行了很长时间且堆积了大量的日志，它可以缩短搜索时间。

```
[root@testvm1 system]# journalctl -S today -u myMonitor.service
-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Thu 2020-06-11 09:40:47 EDT. --
Jun 11 09:12:09 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 11 09:12:09 testvm1.both.org free[377966]:               total        used        free      shared  buff/cache   available
Jun 11 09:12:09 testvm1.both.org free[377966]: Mem:       12635740      522868    11032860        8016     1080012    11821508
Jun 11 09:12:09 testvm1.both.org free[377966]: Swap:       8388604           0     8388604
Jun 11 09:12:09 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
[root@testvm1 system]#
```

由服务触发的任务可以是单个程序、一组程序或者是一个脚本语言写的脚本。通过在 `myMonitor.service` 单元文件里的 `[Service]` 块末尾中添加如下行可以为服务添加另一个任务：

```
ExecStart=/usr/bin/lsblk
```

再次启动服务，查看日志检查结果，结果应该看上去像这样。你应该在日志中看到两条命令的结果输出：

```
Jun 11 15:42:18 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 11 15:42:18 testvm1.both.org free[379961]:               total        used        free      shared  buff/cache   available
Jun 11 15:42:18 testvm1.both.org free[379961]: Mem:       12635740      531788    11019540        8024     1084412    11812272
Jun 11 15:42:18 testvm1.both.org free[379961]: Swap:       8388604           0     8388604
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: sda             8:0    0  120G  0 disk
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: ├─sda1          8:1    0    4G  0 part /boot
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: └─sda2          8:2    0  116G  0 part
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 11 15:42:18 testvm1.both.org lsblk[379962]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 11 15:42:18 testvm1.both.org lsblk[379962]: sr0            11:0    1 1024M  0 rom
Jun 11 15:42:18 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 11 15:42:18 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
```

现在你知道了你的服务可以按预期工作了，在 `/etc/systemd/system` 目录下创建 `myMonitor.timer` 定时器单元文件，添加如下代码：

```
# This timer unit is for testing
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=Logs some system statistics to the systemd journal
Requires=myMonitor.service

[Timer]
Unit=myMonitor.service
OnCalendar=*-*-* *:*:00

[Install]
WantedBy=timers.target
```

在 `myMonitor.timer` 文件中的 `OnCalendar` 时间格式，`*-*-* *:*:00`，应该会每分钟触发一次定时器去执行 `myMonitor.service` 单元。我会在文章的后面进一步探索 `OnCalendar` 设置。

到目前为止，在服务被计时器触发运行时观察与之有关的日志记录。你也可以跟踪计时器，跟踪服务可以让你接近实时的看到结果。执行 `journalctl` 时带上 `-f` 选项：

```
[root@testvm1 system]# journalctl -S today -f -u myMonitor.service
-- Logs begin at Mon 2020-06-08 07:47:20 EDT. --
```

执行但是不启用该定时器，看看它运行一段时间后发生了什么：

```
[root@testvm1 ~]# systemctl start myMonitor.service
[root@testvm1 ~]#
```

一条结果立即就显示出来了，下一条大概在一分钟后出来。观察几分钟日志，看看你有没有跟我发现同样的事情：

```
[root@testvm1 system]# journalctl -S today -f -u myMonitor.service
-- Logs begin at Mon 2020-06-08 07:47:20 EDT. --
Jun 13 08:39:18 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 13 08:39:18 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 13 08:39:19 testvm1.both.org free[630566]:               total        used        free      shared  buff/cache   available
Jun 13 08:39:19 testvm1.both.org free[630566]: Mem:       12635740      556604    10965516        8036     1113620    11785628
Jun 13 08:39:19 testvm1.both.org free[630566]: Swap:       8388604           0     8388604
Jun 13 08:39:18 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: sda             8:0    0  120G  0 disk
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: ├─sda1          8:1    0    4G  0 part /boot
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: └─sda2          8:2    0  116G  0 part
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 13 08:39:19 testvm1.both.org lsblk[630567]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 13 08:39:19 testvm1.both.org lsblk[630567]: sr0            11:0    1 1024M  0 rom
Jun 13 08:40:46 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 13 08:40:46 testvm1.both.org free[630572]:               total        used        free      shared  buff/cache   available
Jun 13 08:40:46 testvm1.both.org free[630572]: Mem:       12635740      555228    10966836        8036     1113676    11786996
Jun 13 08:40:46 testvm1.both.org free[630572]: Swap:       8388604           0     8388604
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: sda             8:0    0  120G  0 disk
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: ├─sda1          8:1    0    4G  0 part /boot
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: └─sda2          8:2    0  116G  0 part
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 13 08:40:46 testvm1.both.org lsblk[630574]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 13 08:40:46 testvm1.both.org lsblk[630574]: sr0            11:0    1 1024M  0 rom
Jun 13 08:40:46 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 13 08:40:46 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
Jun 13 08:41:46 testvm1.both.org systemd[1]: Starting Logs system statistics to the systemd journal...
Jun 13 08:41:46 testvm1.both.org free[630580]:               total        used        free      shared  buff/cache   available
Jun 13 08:41:46 testvm1.both.org free[630580]: Mem:       12635740      553488    10968564        8036     1113688    11788744
Jun 13 08:41:46 testvm1.both.org free[630580]: Swap:       8388604           0     8388604
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: sda             8:0    0  120G  0 disk
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: ├─sda1          8:1    0    4G  0 part /boot
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: └─sda2          8:2    0  116G  0 part
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-root 253:0    0    5G  0 lvm  /
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-swap 253:1    0    8G  0 lvm  [SWAP]
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-usr  253:2    0   30G  0 lvm  /usr
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-tmp  253:3    0   10G  0 lvm  /tmp
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   ├─VG01-var  253:4    0   20G  0 lvm  /var
Jun 13 08:41:47 testvm1.both.org lsblk[630581]:   └─VG01-home 253:5    0   10G  0 lvm  /home
Jun 13 08:41:47 testvm1.both.org lsblk[630581]: sr0            11:0    1 1024M  0 rom
Jun 13 08:41:47 testvm1.both.org systemd[1]: myMonitor.service: Succeeded.
Jun 13 08:41:47 testvm1.both.org systemd[1]: Finished Logs system statistics to the systemd journal.
```

别忘了检查下计时器和服务的状态。

你在日志里大概至少注意到两件事。第一，你不需要特地做什么来让 `myMonitor.service` 单元中 `ExecStart` 触发器产生的 `STDOUT` 存储到日志里。这都是用 systemd 来运行服务的一部分功能。然而，它确实意味着你需要小心对待服务单元里面执行的脚本和它们能产生多少 `STDOUT`。

第二，定时器并不是精确在每分钟的 :00 秒执行的，甚至每次执行的时间间隔都不是刚好一分钟。这是特意的设计，但是有必要的话可以改变这种行为（如果只是它挑战了你的系统管理员的敏感神经）。

这样设计的初衷是为了防止多个服务在完全相同的时刻被触发。举个例子，你可以用例如 Weekly，Daily 等时间格式。这些快捷写法都被定义为在某一天的 00:00:00 执行。当多个定时器都这样定义的话，有很大可能它们会同时执行。

systemd 定时器被故意设计成在规定时间附近随机波动的时间点触发，以避免同一时间触发。它们在一个时间窗口内半随机触发，时间窗口开始于预设的触发时间，结束于预设时间后一分钟。根据 `systemd.timer` 的手册页，这个触发时间相对于其他已经定义的定时器单元保持在稳定的位置。你可以在日志条目中看到，定时器在启动后立即触发，然后在每分钟后的 46 或 47 秒触发。

大部分情况下，这种概率抖动的定时器是没事的。当调度类似执行备份的任务，只需要它们在下班时间运行，这样是没问题的。系统管理员可以选择确定的开始时间来确保不和其他任务冲突，例如 01:05:00 这样典型的 cron 作业时间，但是有很大范围的时间值可以满足这一点。在开始时间上的一个分钟级别的随机往往是无关紧要的。

然而，对某些任务来说，精确的触发时间是个硬性要求。对于这类任务，你可以向单元文件的 `Timer` 块中添加如下声明来指定更高的触发时间跨度精确度（精确到微秒以内）：

```
AccuracySec=1us
```

时间跨度可用于指定所需的精度，以及定义重复事件或一次性事件的时间跨度。它能识别以下单位：

  * `usec`、`us`、`µs`
  * `msec`、`ms`
  * `seconds`、`second`、`sec`、`s`
  * `minutes`、`minute`、`min`、`m`
  * `hours`、`hour`、`hr`、`h`
  * `days`、`day`、`d`
  * `weeks`、`week`、`w`
  * `months`、`month`、`M`（定义为 30.44 天）
  * `years`、`year`、`y`（定义为 365.25 天）

所有 `/usr/lib/systemd/system` 中的定时器都指定了一个更宽松的时间精度，因为精准时间没那么重要。看看这些系统创建的定时器的时间格式：

```
[root@testvm1 system]# grep Accur /usr/lib/systemd/system/*timer
/usr/lib/systemd/system/fstrim.timer:AccuracySec=1h
/usr/lib/systemd/system/logrotate.timer:AccuracySec=1h
/usr/lib/systemd/system/logwatch.timer:AccuracySec=12h
/usr/lib/systemd/system/mlocate-updatedb.timer:AccuracySec=24h
/usr/lib/systemd/system/raid-check.timer:AccuracySec=24h
/usr/lib/systemd/system/unbound-anchor.timer:AccuracySec=24h
[root@testvm1 system]#
```

看下 `/usr/lib/systemd/system` 目录下部分定时器单元文件的完整内容，看看它们是如何构建的。

在本实验中不必让这个定时器在启动时激活，但下面这个命令可以设置开机自启：

```
[root@testvm1 system]# systemctl enable myMonitor.timer
```

你创建的单元文件不需要是可执行的。你同样不需要启用服务，因为它是被定时器触发的。如果你需要的话，你仍然可以在命令行里手动触发该服务单元。尝试一下，然后观察日志。

关于定时器精度、事件时间规格和触发事件的详细信息，请参见 systemd.timer 和 systemd.time 的手册页。

### 定时器类型

systemd 定时器还有一些在 cron 中找不到的功能，cron 只在确定的、重复的、具体的日期和时间触发。systemd 定时器可以被配置成根据其他 systemd 单元状态发生改变时触发。举个例子，定时器可以配置成在系统开机、启动后，或是某个确定的服务单元激活之后的一段时间被触发。这些被称为单调计时器。“单调”指的是一个持续增长的计数器或序列。这些定时器不是持久的，因为它们在每次启动后都会重置。

表格 1 列出了一些单调定时器以及每个定时器的简短定义，同时有 `OnCalendar` 定时器，这些不是单调的，它们被用于指定未来有可能重复的某个确定时间。这个信息来自于 `systemd.timer` 的手册页，有一些不重要的修改。

定时器 | 单调性 | 定义
---|---|---
`OnActiveSec=` | X | 定义了一个与定时器被激活的那一刻相关的定时器。
`OnBootSec=` | X | 定义了一个与机器启动时间相关的计时器。
`OnStartupSec=` | X | 定义了一个与服务管理器首次启动相关的计时器。对于系统定时器来说，这个定时器与 `OnBootSec=` 类似，因为系统服务管理器在机器启动后很短的时间后就会启动。当以在每个用户服务管理器中运行的单元进行配置时，它尤其有用，因为用户的服务管理器通常在首次登录后启动，而不是机器启动后。
`OnUnitActiveSec=` | X | 定义了一个与将要激活的定时器上次激活时间相关的定时器。
`OnUnitInactiveSec=` | X | 定义了一个与将要激活的定时器上次停用时间相关的定时器。
`OnCalendar=` |  | 定义了一个有日期事件表达式语法的实时（即时钟）定时器。查看 `systemd.time(7)` 的手册页获取更多与日历事件表达式相关的语法信息。除此以外，它的语义和 `OnActiveSec=` 类似。

_Table 1: systemd 定时器定义_

单调计时器可使用同样的简写名作为它们的时间跨度，即我们之前提到的 `AccuracySec` 表达式，但是 systemd 将这些名字统一转换成了秒。举个例子，比如你想规定某个定时器在系统启动后五天触发一次事件；它可能看起来像 `OnBootSec=5d`。如果机器启动于 `2020-06-15 09:45:27`，这个定时器会在 `2020-06-20 09:45:27` 或在这之后的一分钟内触发。

### 日历事件格式

日历事件格式是定时器在所需的重复时间触发的关键。我们开始看下一些 `OnCalendar` 设置一起使用的格式。

与 crontab 中的格式相比，systemd 及其计时器使用的时间和日历格式风格不同。它比 crontab 更为灵活，而且可以使用类似 `at` 命令的方式允许模糊的日期和时间。它还应该足够熟悉使其易于理解。

systemd 定时器使用 `OnCalendar=` 的基础格式是 `DOW YYYY-MM-DD HH:MM:SS`。DOW（星期几）是选填的，其他字段可以用一个星号（`*`）来匹配此位置的任意值。所有的日历时间格式会被转换成标准格式。如果时间没有指定，它会被设置为 `00:00:00`。如果日期没有指定但是时间指定了，那么下次匹配的时间可能是今天或者明天，取决于当前的时间。月份和星期可以使用名称或数字。每个单元都可以使用逗号分隔的列表。单元范围可以在开始值和结束值之间用 `..` 指定。

指定日期有一些有趣的选项，波浪号（`~`）可以指定月份的最后一天或者最后一天之前的某几天。`/` 可以用来指定星期几作为修饰符。

这里有几个在 `OnCalendar` 表达式中使用的典型时间格式例子。

日期事件格式 | 描述
---|---
`DOW YYYY-MM-DD HH:MM:SS` |
`*-*-* 00:15:30` | 每年每月每天的 0 点 15 分 30 秒
`Weekly` | 每个周一的 00:00:00
`Mon *-*-* 00:00:00` | 同上
`Mon` | 同上
`Wed 2020-*-*` | 2020 年每个周三的 00:00:00
`Mon..Fri 2021-*-*` | 2021 年的每个工作日（周一到周五）的 00:00:00
`2022-6,7,8-1,15 01:15:00` | 2022 年 6、7、8 月的 1 到 15 号的 01:15:00
`Mon *-05~03` | 每年五月份的下个周一同时也是月末的倒数第三天
`Mon..Fri *-08~04` | 任何年份 8 月末的倒数第四天，同时也须是工作日
`*-05~03/2` | 五月末的倒数第三天，然后 2 天后再来一次。每年重复一次。注意这个表达式使用了波浪号（`~`）。
`*-05-03/2` | 五月的第三天，然后每两天重复一次直到 5 月底。注意这个表达式使用了破折号（`-`）。

_Table 2: `OnCalendar` 事件时间格式例子_


### 测试日历格式

systemd 提供了一个绝佳的工具用于检测和测试定时器中日历时间事件的格式。`systemd-analyze calendar` 工具解析一个时间事件格式，提供标准格式和其他有趣的信息，例如下次“经过”（即匹配）的日期和时间，以及距离下次触发之前大概时间。

首先，看看未来没有时间的日（注意 `Next elapse` 和 `UTC` 的时间会根据你当地时区改变）:

```
[student@studentvm1 ~]$ systemd-analyze calendar 2030-06-17
  Original form: 2030-06-17                
Normalized form: 2030-06-17 00:00:00        
    Next elapse: Mon 2030-06-17 00:00:00 EDT
       (in UTC): Mon 2030-06-17 04:00:00 UTC
       From now: 10 years 0 months left    
[root@testvm1 system]#
```

现在添加一个时间，在这个例子中，日期和时间是当作无关的部分分开解析的：

```
[root@testvm1 system]# systemd-analyze calendar 2030-06-17 15:21:16
  Original form: 2030-06-17                
Normalized form: 2030-06-17 00:00:00        
    Next elapse: Mon 2030-06-17 00:00:00 EDT
       (in UTC): Mon 2030-06-17 04:00:00 UTC
       From now: 10 years 0 months left    

  Original form: 15:21:16                  
Normalized form: *-*-* 15:21:16            
    Next elapse: Mon 2020-06-15 15:21:16 EDT
       (in UTC): Mon 2020-06-15 19:21:16 UTC
       From now: 3h 55min left              
[root@testvm1 system]#
```

为了把日期和时间当作一个单元来分析，可以把它们包在引号里。你在定时器单元里 `OnCalendar=` 时间格式中使用的时候记得把引号去掉，否则会报错：

```
[root@testvm1 system]# systemd-analyze calendar "2030-06-17 15:21:16"
Normalized form: 2030-06-17 15:21:16        
    Next elapse: Mon 2030-06-17 15:21:16 EDT
       (in UTC): Mon 2030-06-17 19:21:16 UTC
       From now: 10 years 0 months left    
[root@testvm1 system]#
```

现在我们测试下 Table2 里的例子。我尤其喜欢最后一个：

```
[root@testvm1 system]# systemd-analyze calendar "2022-6,7,8-1,15 01:15:00"
  Original form: 2022-6,7,8-1,15 01:15:00
Normalized form: 2022-06,07,08-01,15 01:15:00
    Next elapse: Wed 2022-06-01 01:15:00 EDT
       (in UTC): Wed 2022-06-01 05:15:00 UTC
       From now: 1 years 11 months left
[root@testvm1 system]#
```

让我们看一个例子，这个例子里我们列出了时间表达式的五个经过时间。

```
[root@testvm1 ~]# systemd-analyze calendar --iterations=5 "Mon *-05~3"
  Original form: Mon *-05~3                
Normalized form: Mon *-05~03 00:00:00      
    Next elapse: Mon 2023-05-29 00:00:00 EDT
       (in UTC): Mon 2023-05-29 04:00:00 UTC
       From now: 2 years 11 months left    
       Iter. #2: Mon 2028-05-29 00:00:00 EDT
       (in UTC): Mon 2028-05-29 04:00:00 UTC
       From now: 7 years 11 months left    
       Iter. #3: Mon 2034-05-29 00:00:00 EDT
       (in UTC): Mon 2034-05-29 04:00:00 UTC
       From now: 13 years 11 months left    
       Iter. #4: Mon 2045-05-29 00:00:00 EDT
       (in UTC): Mon 2045-05-29 04:00:00 UTC
       From now: 24 years 11 months left    
       Iter. #5: Mon 2051-05-29 00:00:00 EDT
       (in UTC): Mon 2051-05-29 04:00:00 UTC
       From now: 30 years 11 months left    
[root@testvm1 ~]#
```

这些应该为你提供了足够的信息去开始测试你的 `OnCalendar` 时间格式。`systemd-analyze` 工具可用于其他有趣的分析，我会在这个系列的下一篇文章来探索这些。

### 总结

systemd 定时器可以用于执行和 cron 工具相同的任务，但是通过按照日历和单调时间格式去触发事件的方法提供了更多的灵活性。

虽然你为此次实验创建的服务单元通常是由定时器调用的，你也可以随时使用 `systemctl start myMonitor.service` 命令去触发它。可以在一个定时器中编写多个维护任务的脚本；它们可以是 Bash 脚本或者其他 Linux 程序。你可以通过触发定时器来运行所有的脚本来运行服务，也可以按照需要执行单独的脚本。

我会在下篇文章中更加深入的探索 systemd 时间格式的用处。

我还没有看到任何迹象表明 cron 和 at 将被废弃。我希望这种情况不会发生，因为至少 `at` 在执行一次性调度任务的时候要比 systemd 定时器容易的多。

### 参考资料

网上有大量的关于 systemd 的参考资料，但是大部分都有点简略、晦涩甚至有误导性。除了本文中提到的资料，下列的网页提供了跟多可靠且详细的 systemd 入门信息。

  * Fedora 项目有一篇切实好用的 [systemd 入门][5]，它囊括了几乎所有你需要知道的关于如何使用 systemd 配置、管理和维护 Fedora 计算机的信息。
  * Fedora 项目也有一个不错的 [备忘录][6]，交叉引用了过去 SystemV 命令和 systemd 命令做对比。
  * 关于 systemd 的技术细节和创建这个项目的原因，请查看 [Freedesktop.org][7] 上的 [systemd 描述][8]。
  * [Linux.com][9] 的“更多 systemd 的乐趣”栏目提供了更多高级的 systemd [信息和技巧][10]。

此外，还有一系列深度的技术文章，是由 systemd 的设计者和主要实现者 Lennart Poettering 为 Linux 系统管理员撰写的。这些文章写于 2010 年 4 月至 2011 年 9 月间，但它们现在和当时一样具有现实意义。关于 systemd 及其生态的许多其他好文章都是基于这些文章：

  * [Rethinking PID 1][11]
  * [systemd for Administrators，Part I][12]
  * [systemd for Administrators，Part II][13]
  * [systemd for Administrators，Part III][14]
  * [systemd for Administrators，Part IV][15]
  * [systemd for Administrators，Part V][16]
  * [systemd for Administrators，Part VI][17]
  * [systemd for Administrators，Part VII][18]
  * [systemd for Administrators，Part VIII][19]
  * [systemd for Administrators，Part IX][20]
  * [systemd for Administrators，Part X][21]
  * [systemd for Administrators，Part XI][22]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/systemd-timers

作者：[David Both][a]
选题：[lujun9972][b]
译者：[tt67wq](https://github.com/tt67wq)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/article/17/11/how-use-cron-linux
[3]: https://opensource.com/users/dboth
[4]: https://opensource.com/article/20/5/manage-startup-systemd
[5]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[6]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[7]: http://Freedesktop.org
[8]: http://www.freedesktop.org/wiki/Software/systemd
[9]: http://Linux.com
[10]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[11]: http://0pointer.de/blog/projects/systemd.html
[12]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[13]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[14]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[16]: http://0pointer.de/blog/projects/three-levels-of-off.html
[17]: http://0pointer.de/blog/projects/changing-roots
[18]: http://0pointer.de/blog/projects/blame-game.html
[19]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[20]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[21]: http://0pointer.de/blog/projects/instances.html
[22]: http://0pointer.de/blog/projects/inetd.html
