[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Check storage performance with dd)
[#]: via: (https://fedoramagazine.org/check-storage-performance-with-dd/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Check storage performance with dd
======

![][1]

This article includes some example commands to show you how to get a _rough_ estimate of hard drive and RAID array performance using the _dd_ command. Accurate measurements would have to take into account things like [write amplification][2] and [system call overhead][3], which this guide does not. For a tool that might give more accurate results, you might want to consider using [hdparm][4].

To factor out performance issues related to the file system, these examples show how to test the performance of your drives and arrays at the block level by reading and writing directly to/from their block devices. **WARNING** : The _write_ tests will destroy any data on the block devices against which they are run. **Do not run them against any device that contains data you want to keep!**

### Four tests

Below are four example dd commands that can be used to test the performance of a block device:

  1. One process reading from $MY_DISK:

```
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

  2. One process writing to $MY_DISK:

```
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

  3. Two processes reading concurrently from $MY_DISK:

```
# (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache &); (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache skip=200 &)
```

  4. Two processes writing concurrently to $MY_DISK:

```
# (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct &); (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct skip=200 &)
```




– The _iflag=nocache_ and _oflag=direct_ parameters are important when performing the read and write tests (respectively) because without them the dd command will sometimes show the resulting speed of transferring the data to/from [RAM][5] rather than the hard drive.

– The values for the _bs_ and _count_ parameters are somewhat arbitrary and what I have chosen should be large enough to provide a decent average in most cases for current hardware.

– The _null_ and _zero_ devices are used for the destination and source (respectively) in the read and write tests because they are fast enough that they will not be the limiting factor in the performance tests.

– The _skip=200_ parameter on the second dd command in the concurrent read and write tests is to ensure that the two copies of dd are operating on different areas of the hard drive.

### 16 examples

Below are demonstrations showing the results of running each of the above four tests against each of the following four block devices:

  1. MY_DISK=/dev/sda2 (used in examples 1-X)
  2. MY_DISK=/dev/sdb2 (used in examples 2-X)
  3. MY_DISK=/dev/md/stripped (used in examples 3-X)
  4. MY_DISK=/dev/md/mirrored (used in examples 4-X)



A video demonstration of the these tests being run on a PC is provided at the end of this guide.

Begin by putting your computer into _rescue_ mode to reduce the chances that disk I/O from background services might randomly affect your test results. **WARNING** : This will shutdown all non-essential programs and services. Be sure to save your work before running these commands. You will need to know your _root_ password to get into rescue mode. The _passwd_ command, when run as the root user, will prompt you to (re)set your root account password.

```
$ sudo -i
# passwd
# setenforce 0
# systemctl rescue
```

You might also want to temporarily disable logging to disk:

```
# sed -r -i.bak 's/^#?Storage=.*/Storage=none/' /etc/systemd/journald.conf
# systemctl restart systemd-journald.service
```

If you have a swap device, it can be temporarily disabled and used to perform the following tests:

```
# swapoff -a
# MY_DEVS=$(mdadm --detail /dev/md/swap | grep active | grep -o "/dev/sd.*")
# mdadm --stop /dev/md/swap
# mdadm --zero-superblock $MY_DEVS
```

#### Example 1-1 (reading from sda)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 1)
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.7003 s, 123 MB/s
```

#### Example 1-2 (writing to sda)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 1)
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67117 s, 125 MB/s
```

#### Example 1-3 (reading concurrently from sda)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 1)
# (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache &); (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.42875 s, 61.2 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.52614 s, 59.5 MB/s
```

#### Example 1-4 (writing concurrently to sda)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 1)
# (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct &); (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct skip=200 &)
```

```
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.2435 s, 64.7 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.60872 s, 58.1 MB/s
```

#### Example 2-1 (reading from sdb)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 2)
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67285 s, 125 MB/s
```

#### Example 2-2 (writing to sdb)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 2)
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67198 s, 125 MB/s
```

#### Example 2-3 (reading concurrently from sdb)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 2)
# (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache &); (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.52808 s, 59.4 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.57736 s, 58.6 MB/s
```

#### Example 2-4 (writing concurrently to sdb)

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 2)
# (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct &); (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.7841 s, 55.4 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 3.81475 s, 55.0 MB/s
```

#### Example 3-1 (reading from RAID0)

```
# mdadm --create /dev/md/stripped --homehost=any --metadata=1.0 --level=0 --raid-devices=2 $MY_DEVS
# MY_DISK=/dev/md/stripped
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 0.837419 s, 250 MB/s
```

#### Example 3-2 (writing to RAID0)

```
# MY_DISK=/dev/md/stripped
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 0.823648 s, 255 MB/s
```

#### Example 3-3 (reading concurrently from RAID0)

```
# MY_DISK=/dev/md/stripped
# (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache &); (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.31025 s, 160 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.80016 s, 116 MB/s
```

#### Example 3-4 (writing concurrently to RAID0)

```
# MY_DISK=/dev/md/stripped
# (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct &); (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.65026 s, 127 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.81323 s, 116 MB/s
```

#### Example 4-1 (reading from RAID1)

```
# mdadm --stop /dev/md/stripped
# mdadm --create /dev/md/mirrored --homehost=any --metadata=1.0 --level=1 --raid-devices=2 --assume-clean $MY_DEVS
# MY_DISK=/dev/md/mirrored
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.74963 s, 120 MB/s
```

#### Example 4-2 (writing to RAID1)

```
# MY_DISK=/dev/md/mirrored
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.74625 s, 120 MB/s
```

#### Example 4-3 (reading concurrently from RAID1)

```
# MY_DISK=/dev/md/mirrored
# (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache &); (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67171 s, 125 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67685 s, 125 MB/s
```

#### Example 4-4 (writing concurrently to RAID1)

```
# MY_DISK=/dev/md/mirrored
# (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct &); (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct skip=200 &)
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 4.09666 s, 51.2 MB/s
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 4.1067 s, 51.1 MB/s
```

#### Restore your swap device and journald configuration

```
# mdadm --stop /dev/md/stripped /dev/md/mirrored
# mdadm --create /dev/md/swap --homehost=any --metadata=1.0 --level=1 --raid-devices=2 $MY_DEVS
# mkswap /dev/md/swap
# swapon -a
# mv /etc/systemd/journald.conf.bak /etc/systemd/journald.conf
# systemctl restart systemd-journald.service
# reboot
```

### Interpreting the results

Examples 1-1, 1-2, 2-1, and 2-2 show that each of my drives read and write at about 125 MB/s.

Examples 1-3, 1-4, 2-3, and 2-4 show that when two reads or two writes are done in parallel on the same drive, each process gets at about half the drive’s bandwidth (60 MB/s).

The 3-x examples show the performance benefit of putting the two drives together in a RAID0 (data stripping) array. The numbers, in all cases, show that the RAID0 array performs about twice as fast as either drive is able to perform on its own. The trade-off is that you are twice as likely to lose everything because each drive only contains half the data. A three-drive array would perform three times as fast as a single drive (all drives being equal) but it would be thrice as likely to suffer a [catastrophic failure][6].

The 4-x examples show that the performance of the RAID1 (data mirroring) array is similar to that of a single disk except for the case where multiple processes are concurrently reading (example 4-3). In the case of multiple processes reading, the performance of the RAID1 array is similar to that of the RAID0 array. This means that you will see a performance benefit with RAID1, but only when processes are reading concurrently. For example, if a process tries to access a large number of files in the background while you are trying to use a web browser or email client in the foreground. The main benefit of RAID1 is that your data is unlikely to be lost [if a drive fails][7].

### Video demo

Testing storage throughput using dd

### Troubleshooting

If the above tests aren’t performing as you expect, you might have a bad or failing drive. Most modern hard drives have built-in Self-Monitoring, Analysis and Reporting Technology ([SMART][8]). If your drive supports it, the _smartctl_ command can be used to query your hard drive for its internal statistics:

```
# smartctl --health /dev/sda
# smartctl --log=error /dev/sda
# smartctl -x /dev/sda
```

Another way that you might be able to tune your PC for better performance is by changing your [I/O scheduler][9]. Linux systems support several I/O schedulers and the current default for Fedora systems is the [multiqueue][10] variant of the [deadline][11] scheduler. The default performs very well overall and scales extremely well for large servers with many processors and large disk arrays. There are, however, a few more specialized schedulers that might perform better under certain conditions.

To view which I/O scheduler your drives are using, issue the following command:

```
$ for i in /sys/block/sd?/queue/scheduler; do echo "$i: $(<$i)"; done
```

You can change the scheduler for a drive by writing the name of the desired scheduler to the /sys/block/<device name>/queue/scheduler file:

```
# echo bfq > /sys/block/sda/queue/scheduler
```

You can make your changes permanent by creating a [udev rule][12] for your drive. The following example shows how to create a udev rule that will set all [rotational drives][13] to use the [BFQ][14] I/O scheduler:

```
# cat << END > /etc/udev/rules.d/60-ioscheduler-rotational.rules
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
END
```

Here is another example that sets all [solid-state drives][15] to use the [NOOP][16] I/O scheduler:

```
# cat << END > /etc/udev/rules.d/60-ioscheduler-solid-state.rules
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
END
```

Changing your I/O scheduler won’t affect the raw throughput of your devices, but it might make your PC seem more responsive by prioritizing the bandwidth for the foreground tasks over the background tasks or by eliminating unnecessary block reordering.

* * *

_Photo by _[ _James Donovan_][17]_ on _[_Unsplash_][18]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/check-storage-performance-with-dd/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/dd-performance-816x345.jpg
[2]: https://www.ibm.com/developerworks/community/blogs/ibmnas/entry/misalignment_can_be_twice_the_cost1?lang=en
[3]: https://eklitzke.org/efficient-file-copying-on-linux
[4]: https://en.wikipedia.org/wiki/Hdparm
[5]: https://en.wikipedia.org/wiki/Random-access_memory
[6]: https://blog.elcomsoft.com/2019/01/why-ssds-die-a-sudden-death-and-how-to-deal-with-it/
[7]: https://www.computerworld.com/article/2484998/ssds-do-die--as-linus-torvalds-just-discovered.html
[8]: https://en.wikipedia.org/wiki/S.M.A.R.T.
[9]: https://en.wikipedia.org/wiki/I/O_scheduling
[10]: https://lwn.net/Articles/552904/
[11]: https://en.wikipedia.org/wiki/Deadline_scheduler
[12]: http://www.reactivated.net/writing_udev_rules.html
[13]: https://en.wikipedia.org/wiki/Hard_disk_drive_performance_characteristics
[14]: http://algo.ing.unimo.it/people/paolo/disk_sched/
[15]: https://en.wikipedia.org/wiki/Solid-state_drive
[16]: https://en.wikipedia.org/wiki/Noop_scheduler
[17]: https://unsplash.com/photos/0ZBRKEG_5no?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[18]: https://unsplash.com/search/photos/speed?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
