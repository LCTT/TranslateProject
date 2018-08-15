Convert file systems with Fstransform
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/converting-filesystems-816x345.jpg)

Few people know that they can convert their filesystems from one type to another without losing data, i.e. non-destructively. It may sound like magic, but [Fstransform][1] can convert an ext2, ext3, ext4, jfs, reiserfs or xfs partition to another type from the list in almost any combination. More importantly, it does so in-place, without formatting or copying data anywhere. Atop of all this goodness, there is a little bonus: Fstransform can also handle ntfs, btrfs, fat and exfat partitions as well.

### Before you run it

There are certain caveats and limitations in Fstransform, so it is strongly advised to back up before attempting a conversion. Additionally, there are some limitations to be aware of when using Fstransform:

  * Both the source and target filesystems must be supported by your Linux kernel. Sounds like an obvious thing and exposes zero risk in case you want to use ext2, ext3, ext4, reiserfs, jfs and xfs partitions. Fedora supports all of that just fine.
  * Upgrading ext2 to ext3 or ext4 does not require Fstransform. Use the Tune2fs utility instead.
  * The device with source file system must have at least 5% of free space.
  * You need to be able to unmount the source filesystem before you begin.
  * The more data your source file system stores, the longer the conversion will last. The actual speed depends on your device, but expect it to be around one gigabyte per minute. The large amount of hard links can also slow down the conversion.
  * Although Fstransform is proved to be stable, please back up data on your source filesystem.



### Installation instructions

Fstransform is already a part of Fedora. Install with the command:
```
sudo dnf install fstransform

```

### Time to convert something

![][2]

The syntax of the fstransform command is very simple: fstransform <source device> <target file system>. Keep in mind that it needs root privileges to run, so don’t forget to add sudo in the beginning. Here goes an example:
```
sudo fstransform /dev/sdb1 ext4

```

Note that it is not possible to convert a root file system, which is a security measure. Use a test partition or an experimental thumb drive instead. In the meantime, Fstransform will through a lot of auxiliary output in the console. The most useful part is the estimated time of completion, which keep you informed about how long the process will take. Again, few small files on an almost empty drive will make Fstransform do its job in a minute or so, whereas more real-world tasks may involve hours of wait time.

### More file systems are supported

As mentioned above, it is possible to try Fstransform with ntfs, btrfs, fat and exfat partitions. These types are very experimental, and nobody can guarantee that the converion will flow perfect. Still, there are many success stories, and you can add your own by testing Fstransform with a sample data set on a test partition. Those additional file systems can be enabled by the use of the –force-untested-file-systems parameter:
```
sudo fstransform /dev/sdb1 ntfs --force-untested-file-systems

```

Sometimes the process may iterrupt with an error. Feel free to repeat the command again — it may eventually complete the conversion from second or third attempt.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/transform-file-systems-in-linux/

作者：[atolstoy][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/atolstoy/
[1]:https://github.com/cosmos72/fstransform
[2]:https://fedoramagazine.org/wp-content/uploads/2018/08/Screenshot_20180805_230116.png
