[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10875-1.html)
[#]: subject: (Automate backups with restic and systemd)
[#]: via: (https://fedoramagazine.org/automate-backups-with-restic-and-systemd/)
[#]: author: (Link Dupont https://fedoramagazine.org/author/linkdupont/)

使用 restic 和 systemd 自动备份
======

![][1]

及时备份很重要。即使在 [Fedora Magazine][3] 中，[备份软件][2] 也是一个常见的讨论话题。本文演示了如何仅使用 systemd 以及 `restic` 来自动备份。

有关 `restic` 的介绍，请查看我们的文章[在 Fedora 上使用 restic 进行加密备份][4]。然后继续阅读以了解更多详情。

为了自动创建快照以及清理数据，需要运行两个 systemd 服务。第一个运行*备份*命令的服务需要以常规频率运行。第二个服务负责数据清理。

如果你根本不熟悉 systemd，那么这是个很好的学习机会。查看 [Magazine 上关于 systemd 的系列文章] [5]，从单元文件的这个入门开始：

- [systemd 单元文件基础][6]

如果你还没有安装 `restic`，请注意它在官方的 Fedora 仓库中。要安装它，请[带上 sudo][7] 运行此命令：

```
$ sudo dnf install restic
```

### 备份

首先，创建 `~/.config/systemd/user/restic-backup.service`。将下面的文本复制并粘贴到文件中以获得最佳效果。

```
[Unit]
Description=Restic backup service
[Service]
Type=oneshot
ExecStart=restic backup --verbose --one-file-system --tag systemd.timer $BACKUP_EXCLUDES $BACKUP_PATHS
ExecStartPost=restic forget --verbose --tag systemd.timer --group-by "paths,tags" --keep-daily $RETENTION_DAYS --keep-weekly $RETENTION_WEEKS --keep-monthly $RETENTION_MONTHS --keep-yearly $RETENTION_YEARS
EnvironmentFile=%h/.config/restic-backup.conf
```

此服务引用环境文件来加载密钥（例如 `RESTIC_PASSWORD`）。创建 `~/.config/restic-backup.conf`。复制并粘贴以下内容以获得最佳效果。此示例使用 BackBlaze B2 存储。请相应地调整 ID、密钥、仓库和密码值。

```
BACKUP_PATHS="/home/rupert"
BACKUP_EXCLUDES="--exclude-file /home/rupert/.restic_excludes --exclude-if-present .exclude_from_backup"
RETENTION_DAYS=7
RETENTION_WEEKS=4
RETENTION_MONTHS=6
RETENTION_YEARS=3
B2_ACCOUNT_ID=XXXXXXXXXXXXXXXXXXXXXXXXX
B2_ACCOUNT_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
RESTIC_REPOSITORY=b2:XXXXXXXXXXXXXXXXXX:/
RESTIC_PASSWORD=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

现在已安装该服务，请重新加载 systemd：`systemctl -user daemon-reload`。尝试手动运行该服务以创建备份：`systemctl -user start restic-backup`。

因为该服务类型是*一次性*，它将运行一次并退出。验证服务运行并根据需要创建快照后，设置计时器以定期运行此服务。例如，要每天运行 `restic-backup.service`，请按如下所示创建 `~/.config/systemd/user/restic-backup.timer`。再次复制并粘贴此文本：

```
[Unit]
Description=Backup with restic daily
[Timer]
OnCalendar=daily
Persistent=true
[Install]
WantedBy=timers.target
```

运行以下命令启用：

```
$ systemctl --user enable --now restic-backup.timer
```

### 清理

虽然主服务运行 `forget` 命令仅保留保留策略中的快照，但实际上并未从 `restic` 仓库中删除数据。 `prune` 命令检查仓库和当前快照，并删除与快照无关的所有数据。由于 `prune` 可能是一个耗时的过程，因此无需在每次运行备份时运行。这是第二个服务和计时器的场景。首先，通过复制和粘贴此文本来创建文件 `~/.config/systemd/user/restic-prune.service`：

```
[Unit]
Description=Restic backup service (data pruning)
[Service]
Type=oneshot
ExecStart=restic prune
EnvironmentFile=%h/.config/restic-backup.conf
```

与主 `restic-backup.service` 服务类似，`restic-prune` 也是一次性服务，并且可以手动运行。设置完服务后，创建 `~/.config/systemd/user/restic-prune.timer` 并启用相应的计时器：

```
[Unit]
Description=Prune data from the restic repository monthly
[Timer]
OnCalendar=monthly
Persistent=true
[Install]
WantedBy=timers.target
```

就是这些了！`restic` 将会每日运行并按月清理数据。

* * *

图片来自 [Unsplash][9] 由 [Samuel Zeller][8] 拍摄。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/automate-backups-with-restic-and-systemd/

作者：[Link Dupont][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/linkdupont/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/restic-systemd-816x345.jpg
[2]: https://restic.net/
[3]: https://fedoramagazine.org/?s=backup
[4]: https://fedoramagazine.org/use-restic-encrypted-backups/
[5]: https://fedoramagazine.org/series/systemd-series/
[6]: https://fedoramagazine.org/systemd-getting-a-grip-on-units/
[7]: https://fedoramagazine.org/howto-use-sudo/
[8]: https://unsplash.com/photos/JuFcQxgCXwA?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[9]: https://unsplash.com/search/photos/archive?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
