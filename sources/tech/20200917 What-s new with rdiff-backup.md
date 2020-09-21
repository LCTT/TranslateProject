[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's new with rdiff-backup?)
[#]: via: (https://opensource.com/article/20/9/rdiff-backup-linux)
[#]: author: (Patrik Dufresne https://opensource.com/users/patrik-dufresne)

What's new with rdiff-backup?
======
The longstanding Linux backup solution's migration to Python 3 opens
opportunity to add many new features.
![Hand putting a Linux file folder into a drawer][1]

In March 2020, [rdiff-backup][2] advanced to version 2, 11 years after the last major release. The deprecation of Python 2 at the beginning of 2020 was the impetus for this update, but it gave the development team the opportunity to incorporate other features and benefits.

For about two decades, rdiff-backup has helped Linux users maintain full backups of their data locally or remotely without needlessly draining resources. This is because the open source solution does reverse incremental backups—backing up only the files that changed from the previous backup.

The revamp (or, as some are saying, rebirth) came thanks to the efforts of a new, self-organized development team (led by Eric Zolf and Patrik Dufresne from [IKUS Software][3] and Otto Kekäläinen from [Seravo][4]) that put heads and hands together for the benefit of all rdiff-backup users.

### New features in rdiff-backup

Along with the migration to Python 3, spearheaded by Eric, the project was migrated to a new, enterprise-free [repository][5] to welcome contributions. The team also incorporated all of the patches submitted over the years, including sparse file support and a fix for hard links.

#### Automation with Travis CI

Another huge improvement is the addition of a continuous integration/continuous delivery (CI/CD) pipeline using open source [Travis CI][6]. This permits rdiff-backup testing in various environments, which ensures that changes do not affect the solution's stability. The CI/CD pipeline includes integration of builds and binary distribution for all major platforms.

#### Easy installation with yum and apt

The new rdiff-backup solution runs on all major Linux distributions, including Fedora, Red Hat, Elementary, Debian, and many more. Frank and Otto worked arduously to provide open repositories to facilitate access and installation. You can install rdiff-backup using your package manager or follow the [step-by-step instructions][7] on the GitHub project page.

#### A new home

The team migrated the website from Savannah to GitHub Pages and is revamping the official [rdiff-backup.net][2] website to include new content and make the look and feel more on point.

### How to use rdiff-backup

If you're new to rdiff-backup, you might be surprised by how easy it is to use. A backup solution needs to be non-intimidating so that you feel comfortable with the backup and restoration processes.

#### Start a backup

To initiate a backup to a local drive, such as one attached by USB, enter the `rdiff-backup` command followed by the drive you want to back up and the target directory where you want to store the files.

For example, to back up to a local drive called `my_backup_drive`, enter:


```
`$ rdiff-backup /home/tux/ /run/media/tux/my_backup_drive/`
```

To back up your data to offsite storage, use the remote server's location followed by `::` to point to the backup drive's mount point:


```
`$ rdiff-backup /home/tux/ tux@example.com::/my_backup_drive/`
```

You may need to [set up SSH keys][8] to make this process effortless.

#### Restore files

The reason to make backups is that sometimes files go missing. To make recovery as simple as possible, you don't even need rdiff-backup to restore files (although using the `rdiff-backup` command provides some conveniences).

If you need to get a file from your backup drive, you can just copy it over from the backup drive to your local system using `cp` for a local drive or `scp` for a remote drive.

For a local drive, use:


```
`$ cp _run_media/tux/my_backup_drive/Documents/example.txt \ ~/Documents`
```

Or for a remote drive:


```
`$ scp tux@example.com::/my_backup_drive/Documents/example.txt \ ~/Documents`
```

However, using the `rdiff-backup` command provides other options, including the `--restore-as-of` option. This allows you to specify which version of your file you want to rescue.

For example, suppose you want to rescue a file as it appeared four days ago:


```
`$ rdiff-backup --restore-as-of 4D \ /run/media/tux/foo.txt ~/foo_4D.txt`
```

You can also use `rdiff-backup` to grab the latest version:


```
`$ rdiff-backup --restore-as-of now \ /run/media/tux/foo.txt ~/foo_4D.txt`
```

It's that easy. Also, rdiff-backup has many other options, e.g., you can exclude files from a list, back up from one remote to another remote, and more, which you can learn about in the [documentation][9].

### Back it up

Our development team hopes users will appreciate this revamped open source rdiff-backup solution, which is the culmination of our continuous efforts. We also appreciate our contributors, who truly demonstrate the power of open source.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/rdiff-backup-linux

作者：[Patrik Dufresne][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/patrik-dufresne
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://rdiff-backup.net/
[3]: https://www.ikus-soft.com/en/
[4]: https://seravo.fi/english
[5]: https://github.com/rdiff-backup/rdiff-backup
[6]: https://en.wikipedia.org/wiki/Travis_CI
[7]: https://github.com/rdiff-backup/rdiff-backup#installation
[8]: https://opensource.com/article/20/8/how-ssh
[9]: https://rdiff-backup.net/docs/examples.html
