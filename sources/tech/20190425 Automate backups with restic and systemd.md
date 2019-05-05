[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate backups with restic and systemd)
[#]: via: (https://fedoramagazine.org/automate-backups-with-restic-and-systemd/)
[#]: author: (Link Dupont https://fedoramagazine.org/author/linkdupont/)

Automate backups with restic and systemd
======

![][1]

Timely backups are important. So much so that [backing up software][2] is a common topic of discussion, even [here on the Fedora Magazine][3]. This article demonstrates how to automate backups with **restic** using only systemd unit files.

For an introduction to restic, be sure to check out our article [Use restic on Fedora for encrypted backups][4]. Then read on for more details.

Two systemd services are required to run in order to automate taking snapshots and keeping data pruned. The first service runs the _backup_ command needs to be run on a regular frequency. The second service takes care of data pruning.

If you’re not familiar with systemd at all, there’s never been a better time to learn. Check out [the series on systemd here at the Magazine][5], starting with this primer on unit files:

> [systemd unit file basics][6]

If you haven’t installed restic already, note it’s in the official Fedora repositories. To install use this command [with sudo][7]:

```
$ sudo dnf install restic
```

### Backup

First, create the _~/.config/systemd/user/restic-backup.service_ file. Copy and paste the text below into the file for best results.

```
[Unit]
Description=Restic backup service
[Service]
Type=oneshot
ExecStart=restic backup --verbose --one-file-system --tag systemd.timer $BACKUP_EXCLUDES $BACKUP_PATHS
ExecStartPost=restic forget --verbose --tag systemd.timer --group-by "paths,tags" --keep-daily $RETENTION_DAYS --keep-weekly $RETENTION_WEEKS --keep-monthly $RETENTION_MONTHS --keep-yearly $RETENTION_YEARS
EnvironmentFile=%h/.config/restic-backup.conf
```

This service references an environment file in order to load secrets (such as _RESTIC_PASSWORD_ ). Create the _~/.config/restic-backup.conf_ file. Copy and paste the content below for best results. This example uses BackBlaze B2 buckets. Adjust the ID, key, repository, and password values accordingly.

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

Now that the service is installed, reload systemd: _systemctl –user daemon-reload_. Try running the service manually to create a backup: _systemctl –user start restic-backup_.

Because the service is a _oneshot_ , it will run once and exit. After verifying that the service runs and creates snapshots as desired, set up a timer to run this service regularly. For example, to run the _restic-backup.service_ daily, create _~/.config/systemd/user/restic-backup.timer_ as follows. Again, copy and paste this text:

```
[Unit]
Description=Backup with restic daily
[Timer]
OnCalendar=daily
Persistent=true
[Install]
WantedBy=timers.target
```

Enable it by running this command:

```
$ systemctl --user enable --now restic-backup.timer
```

### Prune

While the main service runs the _forget_ command to only keep snapshots within the keep policy, the data is not actually removed from the restic repository. The _prune_ command inspects the repository and current snapshots, and deletes any data not associated with a snapshot. Because _prune_ can be a time-consuming process, it is not necessary to run every time a backup is run. This is the perfect scenario for a second service and timer. First, create the file _~/.config/systemd/user/restic-prune.service_ by copying and pasting this text:

```
[Unit]
Description=Restic backup service (data pruning)
[Service]
Type=oneshot
ExecStart=restic prune
EnvironmentFile=%h/.config/restic-backup.conf
```

Similarly to the main _restic-backup.service_ , _restic-prune_ is a oneshot service and can be run manually. Once the service has been set up, create and enable a corresponding timer at _~/.config/systemd/user/restic-prune.timer_ :

```
[Unit]
Description=Prune data from the restic repository monthly
[Timer]
OnCalendar=monthly
Persistent=true
[Install]
WantedBy=timers.target
```

That’s it! Restic will now run daily and prune data monthly.

* * *

_Photo by _[ _Samuel Zeller_][8]_ on _[_Unsplash_][9]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/automate-backups-with-restic-and-systemd/

作者：[Link Dupont][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
