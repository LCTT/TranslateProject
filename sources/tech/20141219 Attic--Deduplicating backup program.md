Attic – Deduplicating backup program
================================================================================
Attic is a deduplicating backup program written in Python. The main goal of Attic is to provide an efficient and secure way to backup data. The data deduplication technique used makes Attic suitable for daily backups since only the changes are stored.

### Attic Features ###

#### Space efficient storage ####

Variable block size deduplication is used to reduce the number of bytes stored by detecting redundant data. Each file is split into a number of variable length chunks and only chunks that have never been seen before are compressed and added to the repository.

#### Optional data encryption ####

All data can be protected using 256-bit AES encryption and data integrity and authenticity is verified using HMAC-SHA256.

#### Off-site backups ####

Attic can store data on any remote host accessible over SSH as long as Attic is installed.

#### Backups mountable as filesystems ####

Backup archives are mountable as userspace filesystems for easy backup verification and restores.

#### Install attic on ubuntu 14.10 ####

Open the terminal and run the following command

    sudo apt-get install attic

### Using Attic ###

#### A step by step example ####

Before a backup can be made a repository has to be initialized:

    $ attic init /somewhere/my-repository.attic

Backup the ~/src and ~/Documents directories into an archive called Monday:

    $ attic create /somwhere/my-repository.attic::Monday ~/src ~/Documents

The next day create a new archive called Tuesday:

    $ attic create --stats /somwhere/my-repository.attic::Tuesday ~/src ~/Documents

This backup will be a lot quicker and a lot smaller since only new never before seen data is stored. The --stats option causes Attic to output statistics about the newly created archive such as the amount of unique data (not shared with other archives):

Archive name: Tuesday
Archive fingerprint: 387a5e3f9b0e792e91ce87134b0f4bfe17677d9248cb5337f3fbf3a8e157942a
Start time: Tue Mar 25 12:00:10 2014
End time: Tue Mar 25 12:00:10 2014
Duration: 0.08 seconds
Number of files: 358
Original size Compressed size Deduplicated size
This archive: 57.16 MB 46.78 MB 151.67 kB
All archives: 114.02 MB 93.46 MB 44.81 MB

List all archives in the repository:

    $ attic list /somewhere/my-repository.attic

Monday Mon Mar 24 11:59:35 2014
Tuesday Tue Mar 25 12:00:10 2014

List the contents of the Monday archive:

    $ attic list /somewhere/my-repository.attic::Monday

drwxr-xr-x user group 0 Jan 06 15:22 home/user/Documents
-rw-r--r-- user group 7961 Nov 17 2012 home/user/Documents/Important.doc

Restore the Monday archive:

    $ attic extract /somwhere/my-repository.attic::Monday

Recover disk space by manually deleting the Monday archive:

    $ attic delete /somwhere/my-backup.attic::Monday

Check the [Attic Documentation][1] for more details 

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/attic-deduplicating-backup-program.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:https://attic-backup.org/index.html