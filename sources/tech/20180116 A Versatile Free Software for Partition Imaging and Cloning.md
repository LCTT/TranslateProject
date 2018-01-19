Partclone – A Versatile Free Software for Partition Imaging and Cloning
======

![](https://www.fossmint.com/wp-content/uploads/2018/01/Partclone-Backup-Tool-For-Linux.png)

**[Partclone][1]** is a free and open-source tool for creating and cloning partition images brought to you by the developers of **Clonezilla**. In fact, **Partclone** is one of the tools that **Clonezilla** is based on.

It provides users with the tools required to backup and restores used partition blocks along with high compatibility with several file systems thanks to its ability to use existing libraries like **e2fslibs** to read and write partitions e.g. **ext2**.

Its best stronghold is the variety of formats it supports including ext2, ext3, ext4, hfs+, reiserfs, reiser4, btrfs, vmfs3, vmfs5, xfs, jfs, ufs, ntfs, fat(12/16/32), exfat, f2fs, and nilfs.

It also has a plethora of available programs including **partclone.ext2** (ext3  & ext4), partclone.ntfs, partclone.exfat, partclone.hfsp, and partclone.vmfs (v3 and v5), among others.

### Features in Partclone

  * **Freeware:** **Partclone** is free for everyone to download and use.
  * **Open Source:** **Partclone** is released under the GNU GPL license and is open to contribution on [GitHub][2].
  * **Cross-Platform** : Available on Linux, Windows, MAC, ESX file system backup/restore, and FreeBSD.
  * An online [Documentation page][3] from where you can view help docs and track its GitHub issues.
  * An online [user manual][4] for beginners and pros alike.
  * Rescue support.
  * Clone partitions to image files.
  * Restore image files to partitions.
  * Duplicate partitions quickly.
  * Support for raw clone.
  * Displays transfer rate and elapsed time.
  * Supports piping.
  * Support for crc32.
  * Supports vmfs for ESX vmware server and ufs for FreeBSD file system.



There are a lot more features bundled in **Partclone** and you can see the rest of them [here][5].

[__Download Partclone for Linux][6]

### How to Install and Use Partclone

To install Partclone on Linux.
```
$ sudo apt install partclone [On Debian/Ubuntu]
$ sudo yum install partclone [On CentOS/RHEL/Fedora]

```

Clone partition to image.
```
# partclone.ext4 -d -c -s /dev/sda1 -o sda1.img

```

Restore image to partition.
```
# partclone.ext4 -d -r -s sda1.img -o /dev/sda1

```

Partition to partition clone.
```
# partclone.ext4 -d -b -s /dev/sda1 -o /dev/sdb1

```

Display image information.
```
# partclone.info -s sda1.img

```

Check image.
```
# partclone.chkimg -s sda1.img

```

Are you a **Partclone** user? I wrote on [**Deepin Clone**][7] just recently and apparently, there are certain tasks Partclone is better at handling. What has been your experience with other backup and restore utility tools?

Do share your thoughts and suggestions with us in the comments section below.

--------------------------------------------------------------------------------

via: https://www.fossmint.com/partclone-linux-backup-clone-tool/

作者：[Martins D. Okoi;View All Posts;Peter Beck;Martins Divine Okoi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://partclone.org/
[2]:https://github.com/Thomas-Tsai/partclone
[3]:https://partclone.org/help/
[4]:https://partclone.org/usage/
[5]:https://partclone.org/features/
[6]:https://partclone.org/download/
[7]:https://www.fossmint.com/deepin-clone-system-backup-restore-for-deepin-users/
