[#]: collector: (lujun9972)
[#]: translator: (tt67wq)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13402-1.html)
[#]: subject: (Manage startup using systemd)
[#]: via: (https://opensource.com/article/20/5/manage-startup-systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

使用 systemd 来管理启动项
======

> 了解 systemd 是怎样决定服务启动顺序，即使它本质上是个并行系统。

![](https://img.linux.net.cn/data/attachment/album/202105/18/105928u3r3593k3z38ly5k.jpg)

最近在设置 Linux 系统时，我想知道如何确保服务和其他单元的依赖关系在这些依赖于它们的服务和单元启动之前就已经启动并运行了。我需要更多 systemd 如何管理启动程序的相关知识，特别是在本质上是一个并行的系统中如何是决定服务启动顺序的。

你可能知道 SystemV（systemd 的前身，我在这个系列的 [第一篇文章][2] 中解释过）通过 Sxx 前缀命名启动脚本来决定启动顺序，xx 是一个 00-99 的数字。然后 SystemV 利用文件名来排序，然后按照所需的运行级别执行队列中每个启动脚本。

但是 systemd 使用单元文件来定义子程序，单元文件可由系统管理员创建或编辑，这些文件不仅可以用于初始化时也可以用于常规操作。在这个系列的 [第三篇文章][3] 中，我解释了如何创建一个挂载单元文件。在第五篇文章中，我解释了如何创建一种不同的单元文件 —— 在启动时执行一个程序的服务单元文件。你也可以修改单元文件中某些配置，然后通过 systemd 日志去查看你的修改在启动序列中的位置。

### 准备工作

先确认你已经在 `/etc/default/grub` 文件中的 `GRUB_CMDLINE_LINUX=` 这行移除了 `rhgb` 和 `quiet`，如同我在这个系列的 [第二篇文章][4] 中展示的那样。这让你能够查看 Linux 启动信息流，你在这篇文章中部分实验中需要用到。

### 程序

在本教程中，你会创建一个简单的程序让你能够在主控台和后续的 systemd 日志中查看启动时的信息。

创建一个 shell 程序 `/usr/local/bin/hello.sh` 然后添加下述内容。你要确保执行结果在启动时是可见的，可以轻松的在 systemd 日志中找到它。你会使用一版携带一些方格的 “Hello world” 程序，这样它会非常显眼。为了确保这个文件是可执行的，且为了安全起见，它需要 root 的用户和组所有权和 [700 权限][5]。


```
#!/usr/bin/bash
# Simple program to use for testing startup configurations
# with systemd.
# By David Both
# Licensed under GPL V2
#
echo "###############################"
echo "######### Hello World! ########"
echo "###############################"
```

在命令行中执行这个程序来检查它能否正常运行。

```
[root@testvm1 ~]# hello.sh
###############################
######### Hello World! ########
###############################
[root@testvm1 ~]#
```

这个程序可以用任意脚本或编译语言实现。`hello.sh` 程序可以被放在 [Linux 文件系统层级结构][6]（FHS）上的任意位置。我把它放在 `/usr/local/bin` 目录下，这样它可以直接在命令行中执行而不必在打命令的时候前面带上路径。我发现我创建的很多 shell 程序需要从命令行和其他工具（如 systemd）运行。

### 服务单元文件

创建服务单元文件 `/etc/systemd/system/hello.service`，写入下述内容。这个文件不一定是要可执行的，但是为了安全起见，它需要 root 的用户和组所有权和 [644][7] 或 [640][8] 权限。

```
# Simple service unit file to use for testing
# startup configurations with systemd.
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=My hello shell script

[Service]
Type=oneshot
ExecStart=/usr/local/bin/hello.sh

[Install]
WantedBy=multi-user.target
```

通过查看服务状态来确认服务单元文件能如期运行。如有任何语法问题，这里会显示错误。

```
[root@testvm1 ~]# systemctl status hello.service
● hello.service - My hello shell script
     Loaded: loaded (/etc/systemd/system/hello.service; disabled; vendor preset: disabled)
     Active: inactive (dead)
[root@testvm1 ~]#
```

你可以运行这类 “oneshot”（单发）类型的服务多次而不会有问题。此类服务适用于服务单元文件启动的程序是主进程，必须在 systemd 启动任何依赖进程之前完成的服务。

共有 7 种服务类型，你可以在 [systemd.service(5)][9] 的手册页上找到每一种（以及服务单元文件的其他部分）的详细解释。（你也可以在文章末尾的 [资料][10] 中找到更多信息。）

出于好奇，我想看看错误是什么样子的。所以我从 `Type=oneshot` 这行删了字母 “o”，现在它看起来是这样 `Type=neshot`，现在再次执行命令：

```
[root@testvm1 ~]# systemctl status hello.service
● hello.service - My hello shell script
     Loaded: loaded (/etc/systemd/system/hello.service; disabled; vendor preset: disabled)
     Active: inactive (dead)

May 06 08:50:09 testvm1.both.org systemd[1]: /etc/systemd/system/hello.service:12: Failed to parse service type, ignoring: neshot
[root@testvm1 ~]#
```

执行结果明确地告诉我错误在哪，这样解决错误变得十分容易。

需要注意的是即使在你将 `hello.service` 文件保存为它原来的形式之后，错误依然存在。虽然重启机器能消除这个错误，但你不必这么做，所以我去找了一个清理这类持久性错误的方法。我曾遇到有些错误需要 `systemctl daemon-reload` 命令来重置错误状态，但是在这个例子里不起作用。可以用这个命令修复的错误似乎总是有一个这样的声明，所以你知道要运行它。

然而，每次修改或新建一个单元文件之后执行 `systemctl daemon-reload` 确实是值得推荐的做法。它提醒 systemd 有修改发生，而且它可以防止某些与管理服务或单元相关的问题。所以继续去执行这条命令吧。

在修改完服务单元文件中的拼写错误后，一个简单的 `systemctl restart hello.service` 命令就可以清除错误。实验一下，通过添加一些其他的错误至 `hello.service` 文件来看看会得到怎样的结果。

### 启动服务

现在你已经准备好启动这个新服务，通过检查状态来查看结果。尽管你可能之前已经重启过，你仍然可以启动或重启这个单发服务任意次，因为它只运行一次就退出了。

继续启动这个服务（如下所示），然后检查状态。你的结果可能和我的有区别，取决于你做了多少试错实验。

```
[root@testvm1 ~]# systemctl start hello.service
[root@testvm1 ~]# systemctl status hello.service
● hello.service - My hello shell script
     Loaded: loaded (/etc/systemd/system/hello.service; disabled; vendor preset: disabled)
     Active: inactive (dead)

May 10 10:37:49 testvm1.both.org hello.sh[842]: ######### Hello World! ########
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
[root@testvm1 ~]#
```

从状态检查命令的输出中我们可以看到，systemd 日志表明 `hello.sh` 启动然后服务结束了。你也可以看到脚本的输出。该输出是根据服务的最近调用的日志记录生成的，试试看多启动几次这个服务，然后再看状态命令的输出就能理解我所说的。

你也应该直接查看日志内容，有很多种方法可以实现。一种办法是指定记录类型标识符，在这个例子中就是 shell 脚本的名字。它会展示前几次重启和当前会话的日志记录。如你所见，我已经为这篇文章做了挺长一段时间的研究测试了。

```
[root@testvm1 ~]# journalctl -t hello.sh
<剪去>
-- Reboot --
May 08 15:55:47 testvm1.both.org hello.sh[840]: ###############################
May 08 15:55:47 testvm1.both.org hello.sh[840]: ######### Hello World! ########
May 08 15:55:47 testvm1.both.org hello.sh[840]: ###############################
-- Reboot --
May 08 16:01:51 testvm1.both.org hello.sh[840]: ###############################
May 08 16:01:51 testvm1.both.org hello.sh[840]: ######### Hello World! ########
May 08 16:01:51 testvm1.both.org hello.sh[840]: ###############################
-- Reboot --
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org hello.sh[842]: ######### Hello World! ########
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
[root@testvm1 ~]#
```

为了定位 `hello.service` 单元的 systemd 记录，你可以在 systemd 中搜索。你可以使用 `G+Enter` 来翻页到日志记录
记录的末尾，然后用回滚来找到你感兴趣的日志。使用 `-b` 选项仅展示最近启动的记录。

```
[root@testvm1 ~]# journalctl -b -t systemd
<剪去>
May 10 10:37:49 testvm1.both.org systemd[1]: Starting SYSV: Late init script for live image....
May 10 10:37:49 testvm1.both.org systemd[1]: Started SYSV: Late init script for live image..
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:37:50 testvm1.both.org systemd[1]: Starting D-Bus System Message Bus...
May 10 10:37:50 testvm1.both.org systemd[1]: Started D-Bus System Message Bus.
```

我拷贝了一些其他的日志记录，让你对你可能找到的东西有所了解。这条命令喷出了所有属于 systemd 的日志内容 —— 当我写这篇时是 109183 行。这是一个需要整理的大量数据。你可以使用页面的搜索功能，通常是 `less` 或者你可以使用内置的 `grep` 特性。`-g`（ 或 `--grep=`）选项可以使用兼容 Perl 的正则表达式。
```
[root@testvm1 ~]# journalctl -b -t systemd -g "hello"
[root@testvm1 ~]# journalctl -b -t systemd -g "hello"
-- Logs begin at Tue 2020-05-05 18:11:49 EDT, end at Sun 2020-05-10 11:01:01 EDT. --
May 10 10:37:49 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
[root@testvm1 ~]#
```

你可以使用标准的 GNU `grep` 命令，但是这不会展示日志首行的元数据。

如果你只想看包含你的 `hello` 服务的日志记录，你可以指定时间来缩小范围。举个例子，我将在我的测试虚拟机上以 `10:54:00` 为开始时间，这是上述的日志记录开始的分钟数。注意 `--since=` 的选项必须加引号，这个选项也可以写成 `-S "某个时间"`。

日期和时间可能在你的机器上有所不同，所以确保使用能匹配你日志中的时间的时间戳。

```
[root@testvm1 ~]# journalctl --since="2020-05-10 10:54:00"
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=54 op=LOAD
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=55 op=LOAD
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd"'
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/"'
May 10 10:56:00 testvm1.both.org NetworkManager[840]: <error> [1589122560.0633] dhcp4 (enp0s3): error -113 dispatching events
May 10 10:56:00 testvm1.both.org NetworkManager[840]: <info>  [1589122560.0634] dhcp4 (enp0s3): state changed bound -> fail
<剪去>
```

`since` 选项跳过了指定时间点的所有记录，但在此时间点之后仍有大量你不需要的记录。你也可以使用 `until` 选项来裁剪掉你感兴趣的时间之后的记录。我想要事件发生时附近的一分钟，其他的都不用：

```
[root@testvm1 ~]# journalctl --since="2020-05-10 10:54:35" --until="2020-05-10 10:55:00"
-- Logs begin at Tue 2020-05-05 18:11:49 EDT, end at Sun 2020-05-10 11:04:59 EDT. --
May 10 10:54:35 testvm1.both.org systemd[1]: Reloading.
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=27 op=UNLOAD
May 10 10:54:35 testvm1.both.org audit: BPF prog-id=26 op=UNLOAD
<剪去>
ay 10 10:54:35 testvm1.both.org audit: BPF prog-id=55 op=LOAD
May 10 10:54:45 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:54:45 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd>
May 10 10:54:45 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/>
lines 1-46/46 (END)
```

如果在这个时间段中仍然有大量的活动的话，你可以使用这些选项组合来进一步缩小结果数据流：

```
[root@testvm1 ~]# journalctl --since="2020-05-10 10:54:35" --until="2020-05-10 10:55:00" -t "hello.sh"
-- Logs begin at Tue 2020-05-05 18:11:49 EDT, end at Sun 2020-05-10 11:10:41 EDT. --
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ######### Hello World! ########
May 10 10:54:45 testvm1.both.org hello.sh[1380]: ###############################
[root@testvm1 ~]#
```

你的结果应该与我的相似。你可以从这一系列的实验中看出，这个服务运行的很正常。

### 重启 —— 还是走到这一步

到目前为止，你还没有重启过安装了服务的机器。所以现在重启吧，因为毕竟这个教程是关于启动阶段程序运行的情况。首先，你需要在启动序列中启用这个服务。

```
[root@testvm1 ~]# systemctl enable hello.service
Created symlink /etc/systemd/system/multi-user.target.wants/hello.service → /etc/systemd/system/hello.service.
[root@testvm1 ~]#
```

注意到这个软链接是被创建在 `/etc/systemd/system/multi-user.target.wants` 目录下的。这是因为服务单元文件指定了服务是被 `multi-user.target` 所“需要”的。

重启机器，确保能在启动阶段观察数据流，这样你能看到 “Hello world” 信息。等等……你看见了么？嗯，我看见了。尽管它很快被刷过去了，但是我确实看到 systemd 的信息显示它启动了 `hello.service` 服务。

看看上次系统启动后的日志。你可以使用页面搜索工具 `less` 来找到 “Hello” 或 “hello”。我裁剪了很多数据，但是留下了附近的日志记录，这样你就能感受到和你服务有关的日志记录在本地是什么样子的：

```
[root@testvm1 ~]# journalctl -b
<剪去>
May 10 10:37:49 testvm1.both.org systemd[1]: Listening on SSSD Kerberos Cache Manager responder socket.
May 10 10:37:49 testvm1.both.org systemd[1]: Reached target Sockets.
May 10 10:37:49 testvm1.both.org systemd[1]: Reached target Basic System.
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Modem Manager...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Network Manager...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
May 10 10:37:49 testvm1.both.org systemd[1]: Condition check resulted in Secure Boot DBX (blacklist) updater being skipped.
May 10 10:37:49 testvm1.both.org systemd[1]: Starting My hello shell script...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting IPv4 firewall with iptables...
May 10 10:37:49 testvm1.both.org systemd[1]: Started irqbalance daemon.
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=irqbalance comm="systemd" exe="/usr/lib/sy>"'
May 10 10:37:49 testvm1.both.org systemd[1]: Starting LSB: Init script for live image....
May 10 10:37:49 testvm1.both.org systemd[1]: Starting Hardware Monitoring Sensors...
<剪去>
May 10 10:37:49 testvm1.both.org systemd[1]: Starting NTP client/server...
May 10 10:37:49 testvm1.both.org systemd[1]: Starting SYSV: Late init script for live image....
May 10 10:37:49 testvm1.both.org systemd[1]: Started SYSV: Late init script for live image..
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=livesys-late comm="systemd" exe="/usr/lib/>"'
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org hello.sh[842]: ######### Hello World! ########
May 10 10:37:49 testvm1.both.org hello.sh[842]: ###############################
May 10 10:37:49 testvm1.both.org systemd[1]: hello.service: Succeeded.
May 10 10:37:49 testvm1.both.org systemd[1]: Finished My hello shell script.
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd>"'
May 10 10:37:49 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/>
May 10 10:37:50 testvm1.both.org audit: BPF prog-id=28 op=LOAD
<剪去>
```

你可以看到 systemd 启动了 `hello.service` 单元，它执行了 `hello.sh` 脚本并将输出记录在日志中。如果你能在启动阶段抓到它，你也应该能看见，systemd 信息表明了它正在启动这个脚本，另外一条信息表明了服务成功。通过观察上面数据流中第一条 systemd 消息，你会发现 systemd 在到达基本的系统目标后很快就启动了你的服务。

但是我想看见信息在启动阶段也被打印出来。有一种方法可以做到：在 `hello.service` 文件的 `[Service]` 段中加入下述行：

```
StandardOutput=journal+console
```

现在 `hello.service` 文件看起来像这样：

```
# Simple service unit file to use for testing
# startup configurations with systemd.
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=My hello shell script

[Service]
Type=oneshot
ExecStart=/usr/local/bin/hello.sh
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
```

加上这一行后，重启系统，并在启动过程中观察显示屏上滚动的数据流。你应该在它的小方框中看到信息。在启动序列完成后，你可以查看最近的启动日志，然后定位到你新服务的日志记录。

### 修改次序

现在你的服务已经可用了，你可以看看它在启动序列中哪个位置启动的，尝试下修改它。需要牢记的是 systemd 倾向于在每个主要目标（`basic.target`、`multi-user.target` 和 `graphical.**target`）中并行启动尽可能多的服务和其他的单元类型。你应该刚刚看过最近一次开机的日志记录，它应该和上面我的日志看上去类似。

注意，systemd 在它到达到基本系统目标（`basic.target`）后不久就启动了你的测试服务。这正是你在在服务单元文件的 `WantedBy` 行中指定的，所以它是对的。在你做出修改之前，列出 `/etc/systemd/system/multi-user.target.wants` 目录下的内容，你会看到一个指向服务单元文件的软链接。服务单元文件的 `[Install]` 段指定了哪一个目标会启动这个服务，执行 `systemctl enable hello.service` 命令会在适当的 `targets.wants` 路径下创建软链接。

```
hello.service -> /etc/systemd/system/hello.service
```

某些服务需要在 `basic.target` 阶段启动，其他则没这个必要，除非系统正在启动 `graphical.target`。这个实验中的服务不会在 `basic.target` 期间启动 —— 假设你直到 `graphical.target` 阶段才需要它启动。那么修改 `WantedBy` 这一行：

```
WantedBy=graphical.target
```

一定要先禁用 `hello.service` 再重新启用它，这样可以删除旧链接并且在 `graphical.targets.wants` 目录下创建一个新的链接。我注意到如果我在修改服务需要的目标之前忘记禁用该服务，我可以运行 `systemctl disable` 命令，链接将从两个 `targets.wants` 目录中删除。之后我只需要重新启用这个服务然后重启电脑。

启动 `graphical.target` 下的服务有个需要注意的地方，如果电脑启动到 `multi-user.target` 阶段，这个服务不会自动启动。如果这个服务需要 GUI 桌面接口，这或许是你想要的，但是它同样可能不是你想要的。

用 `-o short-monotonic` 选项来查看 `graphical.target` 和 `multi-user.target` 的日志，展示内核启动几秒后的日志，精度为微秒级别：

```
[root@testvm1 ~]# journalctl -b -o short-monotonic
```

`multi-user.target` 的部分日志：

```
[   17.264730] testvm1.both.org systemd[1]: Starting My hello shell script...
[   17.265561] testvm1.both.org systemd[1]: Starting IPv4 firewall with iptables...
<剪去>
[   19.478468] testvm1.both.org systemd[1]: Starting LSB: Init script for live image....
[   19.507359] testvm1.both.org iptables.init[844]: iptables: Applying firewall rules: [  OK  ]
[   19.507835] testvm1.both.org hello.sh[843]: ###############################
[   19.507835] testvm1.both.org hello.sh[843]: ######### Hello World! ########
[   19.507835] testvm1.both.org hello.sh[843]: ###############################
<剪去>
[   21.482481] testvm1.both.org systemd[1]: hello.service: Succeeded.
[   21.482550] testvm1.both.org smartd[856]: Opened configuration file /etc/smartmontools/smartd.conf
[   21.482605] testvm1.both.org systemd[1]: Finished My hello shell script.
```

还有部分 `graphical.target` 的日志：

```
[   19.436815] testvm1.both.org systemd[1]: Starting My hello shell script...
[   19.437070] testvm1.both.org systemd[1]: Starting IPv4 firewall with iptables...
<剪去>
[   19.612614] testvm1.both.org hello.sh[841]: ###############################
[   19.612614] testvm1.both.org hello.sh[841]: ######### Hello World! ########
[   19.612614] testvm1.both.org hello.sh[841]: ###############################
[   19.629455] testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   19.629569] testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   19.629682] testvm1.both.org systemd[1]: hello.service: Succeeded.
[   19.629782] testvm1.both.org systemd[1]: Finished My hello shell script.
```

尽管单元文件的 `WantedBy` 部分包含了 `graphical.target`，`hello.service` 单元在启动后大约 19.5 或 19.6 秒后运行。但是 `hello.service` 在 `multi-user.target` 中开始于 17.24 秒，在 `graphical target` 中开始于 19.43 秒。

这意味着什么呢？看看 `/etc/systemd/system/default.target` 这个链接。文件内容显示 systemd 先启动了默认目标 `graphical.target`，然后 `graphical.target` 触发了 `multi-user.target`。

```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes
[root@testvm1 system]#
```

不管是用 `graphical.target` 还是 `multi-user.target` 启动服务，`hello.service` 单元都在启动后的 19.5 或 19.6 秒后启动。基于这个事实和日志结果(特别是使用单调输出的日志)，你就知道这些目标是在并行启动。再看看日志中另外一件事：


```
[   28.397330] testvm1.both.org systemd[1]: Reached target Multi-User System.
[   28.397431] testvm1.both.org systemd[1]: Reached target Graphical Interface.
```

两个目标几乎是同时完成的。这是和理论一致的，因为 `graphical.target` 触发了 `multi-user.target`，在 `multi-user.target` 到达（即完成）之前它是不会完成的。但是 `hello.service` 比这个完成的早的多。

这一切表明，这两个目标几乎是并行启动的。如果你查看日志，你会发现各种目标和来自这类主要目标的服务大多是平行启动的。很明显，`multi-user.target` 没有必要在 `graphical.target` 启动前完成。所以，简单的使用这些主要目标来并不能很好地排序启动序列，尽管它在保证单元只在它们被 `graphical.target` 需要时启动这方面很有用。

在继续之前，把 `hello.service` 单元文件回滚至 `WantedBy=multi-user.target`（如果还没做的话）。

### 确保一个服务在网络运行后启动

一个常见的启动问题是保证一个单元在网络启动运行后再启动。Freedesktop.org 的文章《[在网络启动后运行服务][11]》中提到，目前没有一个真正的关于网络何时算作“启动”的共识。然而，这篇文章提供了三个选项，满足完全可用网络需求的是 `network-online.target`。需要注意的是 `network.target` 是在关机阶段使用的而不是启动阶段，所以它对你做有序启动方面没什么帮助。

在做出任何改变之前，一定要检查下日志，确认 `hello.service` 单元在网络可用之前可以正确启动。你可以在日志中查找 `network-online.target` 来确认。

你的服务并不真的需要网络服务，但是你可以把它当作是需要网络的。

因为设置 `WantedBy=graphical.target` 并不能保证服务会在网络启动可用后启动，所以你需要其他的方法来做到这一点。幸运的是，有个简单的方法可以做到。将下面两行代码加入 `hello.service` 单元文件的 `[Unit]` 段：

```
After=network-online.target                                                                            
Wants=network-online.target
```

两个字段都需要才能生效。重启机器，在日志中找到服务的记录：

```
[   26.083121] testvm1.both.org NetworkManager[842]: <info>  [1589227764.0293] device (enp0s3): Activation: successful, device activated.
[   26.083349] testvm1.both.org NetworkManager[842]: <info>  [1589227764.0301] manager: NetworkManager state is now CONNECTED_GLOBAL
[   26.085818] testvm1.both.org NetworkManager[842]: <info>  [1589227764.0331] manager: startup complete
[   26.089911] testvm1.both.org systemd[1]: Finished Network Manager Wait Online.
[   26.090254] testvm1.both.org systemd[1]: Reached target Network is Online.
[   26.090399] testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-wait-online comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? termina>"'
[   26.091991] testvm1.both.org systemd[1]: Starting My hello shell script...
[   26.095864] testvm1.both.org sssd[be[implicit_files]][1007]: Starting up
[   26.290539] testvm1.both.org systemd[1]: Condition check resulted in Login and scanning of iSCSI devices being skipped.
[   26.291075] testvm1.both.org systemd[1]: Reached target Remote File Systems (Pre).
[   26.291154] testvm1.both.org systemd[1]: Reached target Remote File Systems.
[   26.292671] testvm1.both.org systemd[1]: Starting Notify NFS peers of a restart...
[   26.294897] testvm1.both.org systemd[1]: iscsi.service: Unit cannot be reloaded because it is inactive.
[   26.304682] testvm1.both.org hello.sh[1010]: ###############################
[   26.304682] testvm1.both.org hello.sh[1010]: ######### Hello World! ########
[   26.304682] testvm1.both.org hello.sh[1010]: ###############################
[   26.306569] testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   26.306669] testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=hello comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   26.306772] testvm1.both.org systemd[1]: hello.service: Succeeded.
[   26.306862] testvm1.both.org systemd[1]: Finished My hello shell script.
[   26.584966] testvm1.both.org sm-notify[1011]: Version 2.4.3 starting
```

这样证实了 `hello.service` 单元会在 `network-online.target` 之后启动。这正是你想要的。你可能也看见了 “Hello World” 消息在启动阶段出现。还需要注意的是，在启动时记录出现的时间戳比之前要晚了大约 6 秒。

### 定义启动序列的最好方法

本文章详细地探讨了 Linux 启动时 systemd 和单元文件以及日志的细节，并且发现了当错误被引入单元文件时候会发生什么。作为系统管理员，我发现这类实验有助于我理解程序或者服务出故障时的行为，并且在安全环境中有意破坏是一种学习的好方法。

文章中实验结果证明，仅将服务单元添加至 `multi-user.target` 或者 `graphical.target` 并不能确定它在启动序列中的位置。它仅仅决定了一个单元是否作为图形环境一部分启动。事实上，启动目标 `multi-user.target` 和 `graphical.target` 和所有它们的 `Wants` 以及 `Required` 几乎是并行启动的。确保单元在特定位置启动的最好方法是确定它所依赖的单元，并将新单元配置成 `Want` 和 `After` 它的依赖。


### 资源

网上有大量的关于 systemd 的参考资料，但是大部分都有点简略、晦涩甚至有误导性。除了本文中提到的资料，下列的网页提供了跟多可靠且详细的 systemd 入门信息。

Fedora 项目有一篇切实好用的 systemd 入门，它囊括了几乎所有你需要知道的关于如何使用 systemd 配置、管理和维护 Fedora 计算机的信息。

Fedora 项目也有一个不错的 备忘录，交叉引用了过去 SystemV 命令和 systemd 命令做对比。

关于 systemd 的技术细节和创建这个项目的原因，请查看 Freedesktop.org 上的 systemd 描述。

Linux.com 的“更多 systemd 的乐趣”栏目提供了更多高级的 systemd 信息和技巧。

此外，还有一系列深度的技术文章，是由 systemd 的设计者和主要开发者 Lennart Poettering 为 Linux 系统管理员撰写的。这些文章写于 2010 年 4 月至 2011 年 9 月间，但它们现在和当时一样具有现实意义。关于 systemd 及其生态的许多其他好文章都是基于这些文章：

  * [Rethinking PID 1][18]
  * [systemd for Administrators，Part I][19]
  * [systemd for Administrators，Part II][20]
  * [systemd for Administrators，Part III][21]
  * [systemd for Administrators，Part IV][22]
  * [systemd for Administrators，Part V][23]
  * [systemd for Administrators，Part VI][24]
  * [systemd for Administrators，Part VII][25]
  * [systemd for Administrators，Part VIII][26]
  * [systemd for Administrators，Part IX][27]
  * [systemd for Administrators，Part X][28]
  * [systemd for Administrators，Part XI][29]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/manage-startup-systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[tt67wq](https://github.com/tt67wq)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://linux.cn/article-12214-1.html
[3]: https://opensource.com/article/20/5/systemd-units
[4]: https://opensource.com/article/20/5/systemd-startup
[5]: https://chmodcommand.com/chmod-700/
[6]: https://opensource.com/life/16/10/introduction-linux-filesystems
[7]: https://chmodcommand.com/chmod-644/
[8]: https://chmodcommand.com/chmod-640/
[9]: http://man7.org/linux/man-pages/man5/systemd.service.5.html
[10]: tmp.bYMHU00BHs#resources
[11]: https://www.freedesktop.org/wiki/Software/systemd/NetworkTarget/
[12]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[13]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[14]: http://Freedesktop.org
[15]: http://www.freedesktop.org/wiki/Software/systemd
[16]: http://Linux.com
[17]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[18]: http://0pointer.de/blog/projects/systemd.html
[19]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[20]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[21]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[22]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[23]: http://0pointer.de/blog/projects/three-levels-of-off.html
[24]: http://0pointer.de/blog/projects/changing-roots
[25]: http://0pointer.de/blog/projects/blame-game.html
[26]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[27]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[28]: http://0pointer.de/blog/projects/instances.html
[29]: http://0pointer.de/blog/projects/inetd.html
