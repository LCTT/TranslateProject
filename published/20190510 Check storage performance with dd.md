[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11195-1.html)
[#]: subject: (Check storage performance with dd)
[#]: via: (https://fedoramagazine.org/check-storage-performance-with-dd/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

使用 dd 检查存储性能
======

![][1]

本文包含一些示例命令，向你展示如何使用 `dd` 命令*粗略*估计硬盘驱动器和 RAID 阵列的性能。准确的测量必须考虑诸如[写入放大][2]和[系统调用开销][3]之类的事情，本指南不会考虑这些。对于可能提供更准确结果的工具，你可能需要考虑使用 [hdparm][4]。

为了分解与文件系统相关的性能问题，这些示例显示了如何通过直接读取和写入块设备来在块级测试驱动器和阵列的性能。**警告**：*写入*测试将会销毁用来运行测试的块设备上的所有数据。**不要对包含你想要保留的数据的任何设备运行这些测试！**

### 四个测试

下面是四个示例 `dd` 命令，可用于测试块设备的性能：

1、 从 `$MY_DISK` 读取的一个进程：

```
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

2、写入到 `$MY_DISK` 的一个进程：

```
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

3、从 `$MY_DISK` 并发读取的两个进程：

```
# (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache &); (dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache skip=200 &)
```

4、 并发写入到 `$MY_DISK` 的两个进程：

```
# (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct &); (dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct skip=200 &)
```

- 执行读写测试时，相应的 `iflag=nocache` 和 `oflag=direct` 参数非常重要，因为没有它们，`dd` 命令有时会显示从[内存][5]中传输数据的结果速度，而不是从硬盘。
-  `bs` 和 `count` 参数的值有些随意，我选择的值应足够大，以便在大多数情况下为当前硬件提供合适的平均值。
-  `null` 和 `zero` 设备在读写测试中分别用于目标和源，因为它们足够快，不会成为性能测试中的限制因素。
- 并发读写测试中第二个 `dd` 命令的 `skip=200` 参数是为了确保 `dd` 的两个副本在硬盘驱动器的不同区域上运行。

### 16 个示例

下面是演示，显示针对以下四个块设备中之一运行上述四个测试中的各个结果：

1. `MY_DISK=/dev/sda2`（用在示例 1-X 中）
2. `MY_DISK=/dev/sdb2`（用在示例 2-X 中）
3. `MY_DISK=/dev/md/stripped`（用在示例 3-X 中）
4. `MY_DISK=/dev/md/mirrored`（用在示例 4-X 中）

首先将计算机置于*救援*模式，以减少后台服务的磁盘 I/O 随机影响测试结果的可能性。**警告**：这将关闭所有非必要的程序和服务。在运行这些命令之前，请务必保存你的工作。你需要知道 `root` 密码才能进入救援模式。`passwd` 命令以 `root` 用户身份运行时，将提示你（重新）设置 `root` 帐户密码。

```
$ sudo -i
# passwd
# setenforce 0
# systemctl rescue
```

你可能还想暂时禁止将日志记录到磁盘：

```
# sed -r -i.bak 's/^#?Storage=.*/Storage=none/' /etc/systemd/journald.conf
# systemctl restart systemd-journald.service
```

如果你有交换设备，可以暂时禁用它并用于执行后面的测试：

```
# swapoff -a
# MY_DEVS=$(mdadm --detail /dev/md/swap | grep active | grep -o "/dev/sd.*")
# mdadm --stop /dev/md/swap
# mdadm --zero-superblock $MY_DEVS
```

#### 示例 1-1 （从 sda 读取）

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 1)
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.7003 s, 123 MB/s
```

#### 示例 1-2 （写入到 sda）

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 1)
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67117 s, 125 MB/s
```

#### 示例 1-3 （从 sda 并发读取）

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

#### 示例 1-4 （并发写入到 sda）

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

#### 示例 2-1 （从 sdb 读取）

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 2)
# dd if=$MY_DISK of=/dev/null bs=1MiB count=200 iflag=nocache
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67285 s, 125 MB/s
```

#### 示例 2-2 （写入到 sdb）

```
# MY_DISK=$(echo $MY_DEVS | cut -d ' ' -f 2)
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.67198 s, 125 MB/s
```

#### 示例 2-3 （从 sdb 并发读取）

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

#### 示例 2-4 （并发写入到 sdb）

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

#### 示例 3-1 （从 RAID0 读取）

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

#### 示例 3-2 （写入到 RAID0）

```
# MY_DISK=/dev/md/stripped
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 0.823648 s, 255 MB/s
```

#### 示例 3-3 （从 RAID0 并发读取）

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

#### 示例 3-4 （并发写入到 RAID0）

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

#### 示例 4-1 （从 RAID1 读取）

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

#### 示例 4-2 （写入到 RAID1）

```
# MY_DISK=/dev/md/mirrored
# dd if=/dev/zero of=$MY_DISK bs=1MiB count=200 oflag=direct
```

```
200+0 records in
200+0 records out
209715200 bytes (210 MB, 200 MiB) copied, 1.74625 s, 120 MB/s
```

#### 示例 4-3 （从 RAID1 并发读取）

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

#### 示例 4-4 （并发写入到 RAID1）

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

#### 恢复交换设备和日志配置

```
# mdadm --stop /dev/md/stripped /dev/md/mirrored
# mdadm --create /dev/md/swap --homehost=any --metadata=1.0 --level=1 --raid-devices=2 $MY_DEVS
# mkswap /dev/md/swap
# swapon -a
# mv /etc/systemd/journald.conf.bak /etc/systemd/journald.conf
# systemctl restart systemd-journald.service
# reboot
```

### 结果解读

示例 1-1、1-2、2-1 和 2-2 表明我的每个驱动器以大约 125 MB/s 的速度读写。

示例 1-3、1-4、2-3 和 2-4 表明，当在同一驱动器上并行完成两次读取或写入时，每个进程的驱动器带宽大约为一半（60 MB/s）。

3-X 示例显示了将两个驱动器放在 RAID0（数据条带化）阵列中的性能优势。在所有情况下，这些数字表明 RAID0 阵列的执行速度是任何一个驱动器能够独立提供的速度的两倍。相应的是，丢失所有内容的可能性也是两倍，因为每个驱动器只包含一半的数据。一个三个驱动器阵列的执行速度是单个驱动器的三倍（所有驱动器规格都相同），但遭受[灾难性故障][6]的可能也是三倍。

4-X 示例显示 RAID1（数据镜像）阵列的性能类似于单个磁盘的性能，除了多个进程同时读取的情况（示例4-3）。在多个进程读取的情况下，RAID1 阵列的性能类似于 RAID0 阵列的性能。这意味着你将看到 RAID1 的性能优势，但仅限于进程同时读取时。例如，当你在前台使用 Web 浏览器或电子邮件客户端时，进程会尝试访问后台中的大量文件。RAID1 的主要好处是，[如果驱动器出现故障][7]，你的数据不太可能丢失。

### 故障排除

如果上述测试未按预期执行，则可能是驱动器坏了或出现故障。大多数现代硬盘都内置了自我监控、分析和报告技术（[SMART][8]）。如果你的驱动器支持它，`smartctl` 命令可用于查询你的硬盘驱动器的内部统计信息：

```
# smartctl --health /dev/sda
# smartctl --log=error /dev/sda
# smartctl -x /dev/sda
```

另一种可以调整 PC 以获得更好性能的方法是更改 [I/O 调度程序][9]。Linux 系统支持多个 I/O 调度程序，Fedora 系统的当前默认值是 [deadline][11] 调度程序的 [multiqueue][10] 变体。默认情况下它的整体性能非常好，并且对于具有许多处理器和大型磁盘阵列的大型服务器，其扩展性极为出色。但是，有一些更专业的调度程序在某些条件下可能表现更好。

要查看驱动器正在使用的 I/O 调度程序，请运行以下命令：

```
$ for i in /sys/block/sd?/queue/scheduler; do echo "$i: $(<$i)"; done
```

你可以通过将所需调度程序的名称写入 `/sys/block/<device name>/queue/scheduler` 文件来更改驱动器的调度程序：

```
# echo bfq > /sys/block/sda/queue/scheduler
```

你可以通过为驱动器创建 [udev 规则][12]来永久更改它。以下示例显示了如何创建将所有的[旋转式驱动器][13]设置为使用 [BFQ][14] I/O 调度程序的 udev 规则：

```
# cat << END > /etc/udev/rules.d/60-ioscheduler-rotational.rules
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
END
```

这是另一个设置所有的[固态驱动器][15]使用 [NOOP][16] I/O 调度程序的示例：

```
# cat << END > /etc/udev/rules.d/60-ioscheduler-solid-state.rules
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
END
```

更改 I/O 调度程序不会影响设备的原始吞吐量，但通过优先考虑后台任务的带宽或消除不必要的块重新排序，可能会使你的 PC 看起来响应更快。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/check-storage-performance-with-dd/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

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
