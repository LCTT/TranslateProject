FSSlc Translating

Backup with these DeDuplicating Encryption Tools
================================================================================
Data is growing both in volume and value. It is becoming increasingly important to be able to back up and restore this information quickly and reliably. As society has adapted to technology and learned how to depend on computers and mobile devices, there are few that can deal with the reality of losing important data. Of firms that suffer the loss of data, 30% fold within a year, 70% cease trading within five years. This highlights the value of data.

With data growing in volume, improving storage utilization is pretty important. In computing, data deduplication is a specialized data compression technique for eliminating duplicate copies of repeating data. This technique therefore improves storage utilization.

Data is not only of interest to its creator. Governments, competitors, criminals, snoopers may be very keen to access your data. They might want to steal your data, extort money from you, or see what you are up to. Enryption is essential to protect your data.

So the solution is a deduplicating encrypting backup software.

Making file backups is an essential activity for all users, yet many users do not take adequate steps to protect their data. Whether a computer is being used in a corporate environment, or for private use, the machine's hard disk may fail without any warning signs. Alternatively, some data loss occurs as a result of human error. Without regular backups being made, data will inevitably be lost even if the services of a specialist recovery organisation are used.

This article provides a quick roundup of 6 deduplicating encryption backup tools. 

----------

### Attic ###

Attic is a deduplicating, encrypted, authenticated and compressed backup program written in Python. The main goal of Attic is to provide an efficient and secure way to backup data. The data deduplication technique used makes Attic suitable for daily backups since only the changes are stored. 

Features include: 

- Easy to use
- Space efficient storage variable block size deduplication is used to reduce the number of bytes stored by detecting redundant data
- Optional data encryption using 256-bit AES encryption. Data integrity and authenticity is verified using HMAC-SHA256
- Off-site backups with SDSH
- Backups mountable as filesystems

Website: [attic-backup.org][1]

----------

### Borg ###

Borg is a fork of Attic. It is a secure open source backup program designed for efficient data storage where only new or modified data is stored.

The main goal of Borg is to provide an efficient and secure way to backup data. The data deduplication technique used makes Borg suitable for daily backups since only the changes are stored. The authenticated encryption makes it suitable for backups to not fully trusted targets.

Borg is written in Python. Borg was created in May 2015 in response to the difficulty of getting new code or larger changes incorporated into Attic.

Features include:

- Easy to use
- Space efficient storage variable block size deduplication is used to reduce the number of bytes stored by detecting redundant data
- Optional data encryption using 256-bit AES encryption. Data integrity and authenticity is verified using HMAC-SHA256
- Off-site backups with SDSH
- Backups mountable as filesystems

Borg is not compatible with Attic.

Website: [borgbackup.github.io/borgbackup][2]

----------

### Obnam ###

Obnam (OBligatory NAMe) is an easy to use, secure Python based backup program. Backups can be stored on local hard disks, or online via the SSH SFTP protocol. The backup server, if used, does not require any special software, on top of SSH.

Obnam performs de-duplication by splitting up file data into chunks, and storing those individually. Generations are incremental backups; Every backup generation looks like a fresh snapshot, but is really incremental. Obnam is developed by Lars Wirzenius.

Features include:

- Easy to use
- Snapshot backups
- Data de-duplication, across files, and backup generations
- Encrypted backups, using GnuPG
- Backup multiple clients to a single repository
- Backup checkpoints (creates a "save" every 100MBs or so)
- Number of options for performance tuning including lru-size and/or upload-queue-size
- MD5 checksum algorithm for recognising duplicate data chunks
- Store backups to a server via SFTP
- Supports both push (i.e. Run on the client) and pull (i.e. Run on the server) methods

Website: [obnam.org][3]

----------

### Duplicity ###

Duplicity incrementally backs up files and directory by encrypting tar-format volumes with GnuPG and uploading them to a remote (or local) file server. To transmit data it can use ssh/scp, local file access, rsync, ftp, and Amazon S3.

Because duplicity uses librsync, the incremental archives are space efficient and only record the parts of files that have changed since the last backup. As the software uses GnuPG to encrypt and/or sign these archives, they will be safe from spying and/or modification by the server.

Currently duplicity supports deleted files, full unix permissions, directories, symbolic links, fifos, etc.

The duplicity package also includes the rdiffdir utility. Rdiffdir is an extension of librsync's rdiff to directories; it can be used to produce signatures and deltas of directories as well as regular files.

Features include:

- Simple to use
- Encrypted and signed archives (using GnuPG)
- Bandwidth and space efficient, using the rsync algorithm
- Standard file format
- Choice of remote protocol
    - Local storage
    - scp/ssh
    - ftp
    - rsync
    - HSI
    - WebDAV
    - Amazon S3

Website: [duplicity.nongnu.org][4]

----------

### ZBackup ###

ZBackup is a versatile globally-deduplicating backup tool.

Features include:

- Parallel LZMA or LZO compression of the stored data. You can mix LZMA and LZO in a repository
- Built-in AES encryption of the stored data
- Possibility to delete old backup data
- Use of a 64-bit rolling hash, keeping the amount of soft collisions to zero
- Repository consists of immutable files. No existing files are ever modified
- Written in C++ only with only modest library dependencies
- Safe to use in production
- Possibility to exchange data between repos without recompression
- Uses a 64-bit modified Rabin-Karp rolling hash

Website: [zbackup.org][5]

----------

### bup ###

bup is a program written in Python that backs things up. It's short for "backup". It provides an efficient way to backup a system based on the git packfile format, providing fast incremental saves and global deduplication (among and within files, including virtual machine images).

bup is released under the LGPL version 2 license.

Features include:

- Global deduplication (among and within files, including virtual machine images)
- Uses a rolling checksum algorithm (similar to rsync) to split large files into chunks
- Uses the packfile format from git
- Writes packfiles directly offering fast incremental saves
- Can use "par2" redundancy to recover corrupted backups
- Mount your bup repository as a FUSE filesystem

Website: [bup.github.io][6]

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150628060000607/BackupTools.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://attic-backup.org/
[2]:https://borgbackup.github.io/borgbackup/
[3]:http://obnam.org/
[4]:http://duplicity.nongnu.org/
[5]:http://zbackup.org/
[6]:https://bup.github.io/
