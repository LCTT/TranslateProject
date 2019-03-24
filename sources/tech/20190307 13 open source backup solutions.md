[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (13 open source backup solutions)
[#]: via: (https://opensource.com/article/19/3/backup-solutions)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

13 open source backup solutions
======
Readers suggest more than a dozen of their favorite solutions for protecting data.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8)

Recently, we published a [poll][1] that asked readers to vote on their favorite open source backup solution. We offered six solutions recommended by our [moderator community][2]—Cronopete, Deja Dup, Rclone, Rdiff-backup, Restic, and Rsync—and invited readers to share other options in the comments. And you came through, offering 13 other solutions (so far) that we either hadn't considered or hadn't even heard of.

By far the most popular suggestion was [BorgBackup][3]. It is a deduplicating backup solution that features compression and encryption. It is supported on Linux, MacOS, and BSD and has a BSD License.

Second was [UrBackup][4], which does full and incremental image and file backups; you can save whole partitions or single directories. It has clients for Windows, Linux, and MacOS and has a GNU Affero Public License.

Third was [LuckyBackup][5]; according to its website, "it is simple to use, fast (transfers over only changes made and not all data), safe (keeps your data safe by checking all declared directories before proceeding in any data manipulation), reliable, and fully customizable." It carries a GNU Public License.

[Casync][6] is content-addressable synchronization—it's designed for backup and synchronizing and stores and retrieves multiple related versions of large file systems. It is licensed with the GNU Lesser Public License.

[Syncthing][7] synchronizes files between two computers. It is licensed with the Mozilla Public License and, according to its website, is secure and private. It works on MacOS, Windows, Linux, FreeBSD, Solaris, and OpenBSD.

[Duplicati][8] is a free backup solution that works on Windows, MacOS, and Linux and a variety of standard protocols, such as FTP, SSH, and WebDAV, and cloud services. It features strong encryption and is licensed with the GPL.

[Dirvish][9] is a disk-based virtual image backup system licensed under OSL-3.0. It also requires Rsync, Perl5, and SSH to be installed.

[Bacula][10]'s website says it "is a set of computer programs that permits the system administrator to manage backup, recovery, and verification of computer data across a network of computers of different kinds." It is supported on Linux, FreeBSD, Windows, MacOS, OpenBSD, and Solaris and the bulk of its source code is licensed under AGPLv3.

[BackupPC][11] "is a high-performance, enterprise-grade system for backing up Linux, Windows, and MacOS PCs and laptops to a server's disk," according to its website. It is licensed under the GPLv3.

[Amanda][12] is a backup system written in C and Perl that allows a system administrator to back up an entire network of client machines to a single server using tape, disk, or cloud-based systems. It was developed and copyrighted in 1991 at the University of Maryland and has a BSD-style license.

[Back in Time][13] is a simple backup utility designed for Linux. It provides a command line client and a GUI, both written in Python. To do a backup, just specify where to store snapshots, what folders to back up, and the frequency of the backups. BackInTime is licensed with GPLv2.

[Timeshift][14] is a backup utility for Linux that is similar to System Restore for Windows and Time Capsule for MacOS. According to its GitHub repository, "Timeshift protects your system by taking incremental snapshots of the file system at regular intervals. These snapshots can be restored at a later date to undo all changes to the system."

[Kup][15] is a backup solution that was created to help users back up their files to a USB drive, but it can also be used to perform network backups. According to its GitHub repository, "When you plug in your external hard drive, Kup will automatically start copying your latest changes."

Thanks for sharing your favorite open source backup solutions in our poll! If there are still others that haven't been mentioned yet, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/backup-solutions

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/2/linux-backup-solutions
[2]: https://opensource.com/opensourcecom-team
[3]: https://www.borgbackup.org/
[4]: https://www.urbackup.org/
[5]: http://luckybackup.sourceforge.net/
[6]: http://0pointer.net/blog/casync-a-tool-for-distributing-file-system-images.html
[7]: https://syncthing.net/
[8]: https://www.duplicati.com/
[9]: http://dirvish.org/
[10]: https://www.bacula.org/
[11]: https://backuppc.github.io/backuppc/
[12]: http://www.amanda.org/
[13]: https://github.com/bit-team/backintime
[14]: https://github.com/teejee2008/timeshift
[15]: https://github.com/spersson/Kup
