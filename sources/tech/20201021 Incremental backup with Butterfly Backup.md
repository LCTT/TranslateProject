[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Incremental backup with Butterfly Backup)
[#]: via: (https://fedoramagazine.org/butterfly-backup/)
[#]: author: (Matteo Guadrini https://fedoramagazine.org/author/matteoguadrini/)

Incremental backup with Butterfly Backup
======

![][1]

### Introduction

This article explains how to make incremental or differential backups, with a catalog available to restore (or export) at the point you want, with [Butterfly Backup][2].

#### Requirements

Butterfly Backup is a simple wrapper of rsync written in python; the first requirement is **[python3.3][3]** or higher (plus module [cryptography][4] for _init_ action). Other requirements are **[openssh][5]** and **[rsync][6]** (version 2.5 or higher). Ok, let’s go!

[Editors note: rsync version 3.2.3 is already installed on Fedora 33 systems]

```
$ sudo dnf install python3 openssh rsync git
$ sudo pip3 install cryptography
```

### Installation

After that, installing Butterfly Backup is very simple by using the following commands to clone the repository locally, and set up Butterfly Backup for use:

```
$ git clone https://github.com/MatteoGuadrini/Butterfly-Backup.git
$ cd Butterfly-Backup
$ sudo python3 setup.py
$ bb --help
$ man bb
```

To upgrade, you would use the same commands too.

### Example

Butterfly Backup is a server to client tool and is installed on a server (or workstation). The restore process restores the files into the specified client. This process shares some of the options available to the backup process.

Backups are organized accord to precise catalog; this is an example:

```
$ tree destination/of/backup
.
├── destination
│   ├── hostname or ip of the PC under backup
│   │   ├── timestamp folder
│   │   │   ├── backup folders
│   │   │   ├── backup.log
│   │   │   └── restore.log
│   │   ├─── general.log
│   │   └─── symlink of last backup
│
├── export.log
├── backup.list
└── .catalog.cfg
```

Butterfly Backup has six main operations, referred to as **actions**, you can get information about them with the _–help_ command.

```
$ bb --help
usage: bb [-h] [--verbose] [--log] [--dry-run] [--version]
          {config,backup,restore,archive,list,export} ...

Butterfly Backup

optional arguments:
  -h, --help            show this help message and exit
  --verbose, -v         Enable verbosity
  --log, -l             Create a log
  --dry-run, -N         Dry run mode
  --version, -V         Print version

action:
  Valid action

  {config,backup,restore,archive,list,export}
                        Available actions
    config              Configuration options
    backup              Backup options
    restore             Restore options
    archive             Archive options
    list                List options
    export              Export options
```

#### Configuration

Configuration mode is straight forward; If you’re already familiar with the exchange keys and OpenSSH, you probably won’t need it. First, you must create a configuration (rsa keys), for instance:

```
$ bb config --new
SUCCESS: New configuration successfully created!
```

After creating the configuration, the keys will be installed (copied) on the hosts you want to backup:

```
$ bb config --deploy host1
Copying configuration to host1; write the password:
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/arthur/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
arthur@host1's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'arthur@host1'"
and check to make sure that only the key(s) you wanted were added.

SUCCESS: Configuration copied successfully on host1!
```

#### Backup

There are two backup modes: _single_ and _bulk_.
The most relevant features of the two backup modes are the parallelism and retention of old backups. See the two parameters _–parallel_ and _–retention_ in the [documentation][7].

##### Single backup

The backup of a single machine consists in taking the files and folders indicated in the command line, and putting them into the cataloging structure indicated above. In other words, copy all file and folders of a machine into a path.

This is an examples:

```
$ bb backup --computer host1 --destination /mnt/backup --data User Config --type Unix
Start backup on host1
SUCCESS: Command rsync -ah --no-links arthur@host1:/home :/etc /mnt/backup/host1/2020_09_19__10_28
```

##### Bulk backup

Above all, bulk mode backups share the same options as single mode, with the difference that they accept a file containing a list of hostnames or ips. In this mode backups will performed in parallel (by default 5 machines at a time). Above all, if you want to run fewer or more machines in parallel, specify the _–parallel_ parameter.

Incremental of the previous backup, for instance:

```
$ cat /home/arthur/pclist.txt
host1
host2
host3
$ bb backup --list /home/arthur/pclist.txt --destination /mnt/backup --data User Config --type Unix
ERROR: The port 22 on host2 is closed!
ERROR: The port 22 on host3 is closed!
Start backup on host1
SUCCESS: Command rsync -ahu --no-links --link-dest=/mnt/backup/host1/2020_09_19__10_28 arthur@host1:/home :/etc /mnt/backup/host1/2020_09_19__10_50
```

There are four backup modes, which you specify with the _–mode_ flag: **Full** (backup all files) , **Mirror** (backup all files in mirror mode), **Differential** (is based on the latest _Full_ backup) and **Incremental** (is based on the latest backup).
The default mode is _Incremental_; _Full_ mode is set by default when the flag is not specified.

#### Listing catalog

The first time you run backup commands, the catalog is created. The catalog is used for future backups and all the restores that are made through Butterfly Backup. To query this catalog use the list command.
First, let’s query the catalog in our example:

```
$ bb list --catalog /mnt/backup

BUTTERFLY BACKUP CATALOG

Backup id: aba860b0-9944-11e8-a93f-005056a664e0
Hostname or ip: host1
Timestamp: 2020-09-19 10:28:12

Backup id: dd6de2f2-9a1e-11e8-82b0-005056a664e0
Hostname or ip: host1
Timestamp: 2020-09-19 10:50:59
```

Press _q_ for exit and select a backup-id:

```
$ bb list --catalog /mnt/backup --backup-id dd6de2f2-9a1e-11e8-82b0-005056a664e0
Backup id: dd6de2f2-9a1e-11e8-82b0-005056a664e0
Hostname or ip: host1
Type: Incremental
Timestamp: 2020-09-19 10:50:59
Start: 2020-09-19 10:50:59
Finish: 2020-09-19 11:43:51
OS: Unix
ExitCode: 0
Path: /mnt/backup/host1/2020_09_19__10_50
List: backup.log
etc
home
```

To export the catalog list use it with an external tool like _cat_, include the _–_–_log_ flag:

```
$ bb list --catalog /mnt/backup --log
$ cat /mnt/backup/backup.list
```

#### Restore

The restore process is the exact opposite of the backup process. It takes the files from a specific backup and push it to the destination computer.
This command perform a restore on the same machine of the backup, for instance:

```
$ bb restore --catalog /mnt/backup --backup-id dd6de2f2-9a1e-11e8-82b0-005056a664e0 --computer host1 --log
Want to do restore path /mnt/backup/host1/2020_09_19__10_50/etc? To continue [Y/N]? y
Want to do restore path /mnt/backup/host1/2020_09_19__10_50/home? To continue [Y/N]? y
SUCCESS: Command rsync -ahu -vP --log-file=/mnt/backup/host1/2020_09_19__10_50/restore.log /mnt/backup/host1/2020_09_19__10_50/etc arthur@host1:/restore_2020_09_19__10_50
SUCCESS: Command rsync -ahu -vP --log-file=/mnt/backup/host1/2020_09_19__10_50/restore.log /mnt/backup/host1/2020_09_19__10_50/home/* arthur@host1:/home
```

> Without specifying the “_type_” flag that indicates the operating system on which the data are being retrieved, Butterfly Backup will select it directly from the catalog via the backup-id.

#### Archive old backup

Archive operations are used to store backups by saving disk space.

```
$ bb archive --catalog /mnt/backup/ --days 1 --destination /mnt/archive/ --verbose --log
INFO: Check archive this backup f65e5afe-9734-11e8-b0bb-005056a664e0. Folder /mnt/backup/host1/2020_09_18__17_50
INFO: Check archive this backup 4f2b5f6e-9939-11e8-9ab6-005056a664e0. Folder /mnt/backup/host1/2020_09_15__07_26
SUCCESS: Delete /mnt/backup/host1/2020_09_15__07_26 successfully.
SUCCESS: Archive /mnt/backup/host1/2020_09_15__07_26 successfully.
$ ls /mnt/archive
host1
$ ls /mnt/archive/host1
2020_09_15__07_26.zip
```

After that, look in the catalog and see that the backup was actually archived:

```
$ bb list --catalog /mnt/backup/ -i 4f2b5f6e-9939-11e8-9ab6-005056a664e0
Backup id: 4f2b5f6e-9939-11e8-9ab6-005056a664e0
Hostname or ip: host1
Type: Incremental
Timestamp: 2020-09-15 07:26:46
Start: 2020-09-15 07:26:46
Finish: 2020-09-15 08:43:45
OS: Unix
ExitCode: 0
Path: /mnt/backup/host1/2020_09_15__07_26
Archived: True
```

### Conclusion

Butterfly Backup was born from a very complex need; this tool provides superpowers to rsync, automates the backup and restore process. In addition, the catalog allows you to have a system similar to a “time machine”.

In conclusion, Butterfly Backup is a lightweight, versatile, simple and scriptable backup tool.

One more thing; Easter egg: _**bb** -Vv_

Thank you for reading my post.

Full documentation: [https://butterfly-backup.readthedocs.io/][7]
Github: <https://github.com/MatteoGuadrini/Butterfly-Backup>

* * *

_Photo by [Manu M][8] on [Unsplash][9]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/butterfly-backup/

作者：[Matteo Guadrini][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/matteoguadrini/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/09/butterfly-backup-816x345.jpg
[2]: https://matteoguadrini.github.io/Butterfly-Backup/
[3]: https://fedoramagazine.org/help-port-python-packages-python-3/
[4]: https://cryptography.io/en/latest/
[5]: https://fedoramagazine.org/open-source-ssh-clients/
[6]: https://fedoramagazine.org/scp-users-migration-guide-to-rsync/
[7]: https://butterfly-backup.readthedocs.io/en/latest/
[8]: https://unsplash.com/@leocub?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[9]: https://unsplash.com/s/photos/butterfly?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
