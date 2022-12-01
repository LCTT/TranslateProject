[#]: subject: (5 reasons sysadmins love systemd)
[#]: via: (https://opensource.com/article/21/4/sysadmins-love-systemd)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15296-1.html)

系统管理员喜欢 systemd 的 5 个理由
======

> systemd 的速度和易用性使其成为管理现代 Linux 系统的流行方式。

![][0]

系统管理员知道，在一台运行着的**现代计算机**上会发生很多事情：应用程序在后台运行、预定事件等待在特定时间被触发、事件写入日志文件、发送状态报告。在以前，不同的进程可以通过一系列 Unix 工具，来进行有效地管理和监控。然而，现代的计算机运作更为复杂了：本地服务与容器化应用程序一同运行、能够轻松访问云及其运行的集群、实时进程、以及有比以往都多的数据。

拥有统一的管理方法不但是用户想要的，也是忙碌的系统管理员所迫切渴望的。为了完成这项重要的任务，<ruby>系统守护进程<rt> system daemon </rt></ruby> （**systemd**） 被开发出来，并迅速被所有主要的 Linux 发行版所采用了。

当然，systemd 并不是管理 Linux 系统的唯一方式，还有许多其他可供选择的初始化系统，包括 sysvinit、OpenRC、runit、s6 和 BusyBox，但 systemd 将 Linux 视为一个统一的数据集，意味着 systemd 能用强大的工具对 Linux 进行一致的操作和查询。对于忙碌的系统管理员和许多用户来说，systemd 的速度和易用性是一个重要的特性。有以下的五个原因。

### 启动管理

启动 Linux 计算机可能是一件非常罕见的事情。**服务器**的正常运行时间通常以 _年_ 来计算，而不是月或周。**笔记本电脑和台式机**可能会频繁地关闭和启动，但更多的时候它们是被挂起或休眠了。无论哪种类型，**最近一次开机的时刻**都可用于检查一段时间内的计算机健康情况，因为当你在监视系统或诊断问题时，这一时刻能够限制查看的数据量大小，从而让你快速地找到问题所在。

如果你不记得上次启动计算机的时间，你可以使用 systemd 的日志记录工具 `journalctl`，来列出计算机的所有启动会话：

```
$ journalctl --list-boots
-42 7fe7c3... Fri 2020-12-04 05:13:59 - Wed 2020-12-16 16:01:23
-41 332e99... Wed 2020-12-16 20:07:39 - Fri 2020-12-18 22:08:13
[...]
-1 e0fe5f... Mon 2021-03-29 20:47:46 - Mon 2021-03-29 21:59:29
 0 37fbe4... Tue 2021-03-30 04:46:13 - Tue 2021-03-30 10:42:08
```

最近一次启动会话输出在结果列表的底部，因此你可以通过管道将输出传输到 `tail`，来查看最近一次启动会话。

左侧的数字（在本例中为 42、41、1 和 0）是每个启动会话的索引号。换句话说，如果你要查看某一特定启动会话的日志，你可以使用这个索引号作为参数。

### 日志检查

查看日志是推断系统信息的一种重要方法。日志提供了计算机运行的大部分事件的历史记录，这些记录都是在没有你直接监督的情况下生成的。通过日志，你可以知道某一服务何时启动、定时任务何时运行、哪些服务在后台运行、哪些事件运行失败等等信息。故障排除的初始步骤是使用 systemd 的 `journalctl` 来查看日志：

```
$ journalctl --pager-end
```

`--pager-end` 选项（简写为 `-e`）会从 `journalctl` 的输出末尾开始查看日志，因此要查看更早发生的日志，你需要向上滚动。

systemd 维护一个错误信息的“目录”，错误信息包含错误记录、可能的解决方案、支持论坛的链接和开发人员文档。这个错误信息的“目录”能为日志事件提供重要的上下文，否则它可能会成为海量日志中的一个令人困惑的信息，或者更糟的是，错误信息可能会完全被忽视。要将错误消息与日志中的解释性文本放在一起输出，你可以使用 `--catalog` 选项（简写为 `-x`）：

```
$ journalctl --pager-end --catalog
```

要进一步限定日志输出，你可以指定要查看哪个启动会话的日志。因为每个启动会话都有索引，所以你可以使用 `--boot` 选项，来指定某个启动会话，并仅查看该启动会话的日志：

```
$ journalctl --pager-end --catalog --boot 42
```

你还可以查看特定 systemd 单元的日志。例如，要解决 SSH 服务的问题，你可以指定 `--unit sshd` 选项，来仅查看适用于 `sshd` 守护程序的日志：

```
$ journalctl --pager-end \
    --catalog --boot 42 \
    --unit sshd
```

### 服务管理

systemd 的第一个任务就是启动你的计算机，systemd 会迅速、高效且有效地执行这一任务。但 systemd 一直需要管理的任务是服务管理，因为 systemd 需要确保你要运行的服务确实在你的会话期间启动，并继续运行。systemd 的这一功能非常稳健，因为理论上即使是一个崩溃的服务也可以在没有你干预的情况下重新启动。

你可以通过使用 `systemctl` 命令来让 systemd 管理服务，并能查看定义服务的 <ruby>单元文件<rt> unit file </rt></ruby>：

```
$ systemctl cat sshd
# /usr/lib/systemd/system/sshd.service
[Unit]
Description=OpenSSH server daemon
Documentation=man:sshd(8) man:sshd_config(5)
After=network.target sshd-keygen.target
Wants=sshd-keygen.target

[Service]
Type=notify
EnvironmentFile=-/etc/crypto-policies/back-ends/opensshserver.config
EnvironmentFile=-/etc/sysconfig/sshd
ExecStart=/usr/sbin/sshd -D $OPTIONS $CRYPTO_POLICY
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=42s

[Install]
WantedBy=multi-user.target
```

大多数单元文件都在 `/usr/lib/systemd/system/` 目录下，但是你也可以用局部更改来修改配置，请使用以下的方式：

```
$ systemctl edit sshd
```

你可以通过 `is-active` 选项，来查看某一服务当前是否处于活动状态：

```
$ systemctl is-active sshd
active
$ systemctl is-active foo
inactive
```

同样地，你可以通过 `is-failed` 选项，来查看某一服务是否运行失败了。

```
$ systemctl is-failed sshd
```

使用以下命令，来启动或者停止某一服务：

```
$ systemctl stop sshd
$ systemctl start sshd
```

使用以下命令，让某一服务在开机时自启动：

```
$ systemctl enable sshd
```

添加 `--now` 选项，让某一服务在开机时启动并在当前会话中立即启动。

### 定时器管理

在以前，当你想在 Linux 上自动执行一项任务时，你可以使用的工具是 `cron`。如今，`cron` 命令仍能使用，但对于在 Linux 上自动执行一项任务，也有一些其他好用的替代方案。例如，[anacron 命令][2] 是一个多功能的、类似于 `cron` 的系统，它能够运行在停机期间可能会错过的任务。

计划的事件就是在特定时间需要激活的服务。systemd 管理一个名为 [定时器][3] 的工具，它类似 cron 的功能。你可以使用以下命令，来列出活动中的定时器：

```
$ systemctl list-timers
NEXT                          LEFT      
Tue 2021-03-30 12:37:54 NZDT  16min left [...]
Wed 2021-03-31 00:00:00 NZDT  11h left [...]
Wed 2021-03-31 06:42:02 NZDT  18h left [...]

3 timers listed.
Pass --all to see loaded but inactive timers, too.
```

你可以使用以下命令，来像启用服务一样启用定时器：

```
$ systemctl enable myMonitor.timer
```

### 目标管理

<ruby>目标<rt>target</rt></ruby> 是 systemd 的最后一个主要组成部分。像服务和定时器一样，目标也是一个单元文件，也可以以相同的方式启动和启用。目标的独特之处在于它们可以将其他单元文件任意分组。例如，你可能希望开机启动到文本控制台界面而不是图形桌面，因此有一个 `multi-user` 目标。但是，`multi-user` 目标只是没有包括桌面单元文件的 `graphical` 目标。

简而言之，目标是一种将服务、定时器甚至其他的目标集合在一起，以表示机器的预期状态的简单方法。

事实上，在 systemd 中，重启、关机或关闭操作只是一个目标而已。

你可以使用 `list-unit-files` 选项，用 `--type` 选项将其限制为 `target` 来列出所有可用的目标：

```
$ systemctl list-unit-files --type target
```

### 使用 systemd 对计算机进行控制管理

现代的 Linux 使用 systemd 进行服务管理和日志检查。从个人的 Linux 系统到企业服务器，systemd 都能提供有效的监控，并且十分易于维护。你越频繁地使用 systemd，systemd 对你而言就会变得越容易预测和直观，你就会明白系统的不同部分是如何相互关联的。

为了更好地熟悉 systemd，请现在就开始使用它吧。请 [下载关于 systemd 相关命令的备忘录][4]，你可以在实际使用 systemd 中经常参考这个备忘录，这样你就能更快熟悉使用 systemd 啦！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/sysadmins-love-systemd

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://opensource.com/article/21/2/linux-automation
[3]: https://opensource.com/article/20/7/systemd-timers
[4]: https://opensource.com/downloads/linux-systemd-cheat-sheet
[0]: https://img.linux.net.cn/data/attachment/album/202211/28/085754t9sztkt26452ys4s.png