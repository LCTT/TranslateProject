[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12820-1.html)
[#]: subject: (How to Scan/Detect New LUNs and SCSI Disks on Linux)
[#]: via: (https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 上扫描/检测新的 LUN 和 SCSI 磁盘
======

![](https://img.linux.net.cn/data/attachment/album/202011/14/001530vgyym7779ys09y7m.jpg)

当 Linux 系统连接到 SAN（存储区域网络）后，你需要重新扫描 iSCSI 服务以发现新的 LUN。

要做到这一点，你必须向存储团队提供 Linux 主机的 WWN 号和所需的 LUN 大小。

这篇文章将帮助你[查找 Linux 主机的 WWN 号][1]。

当存储团队将 LUN 与给定的 Linux 主机进行了映射，他们将为你提供新的 LUN 详细信息。

LUN 在存储术语中被称为 LUN 的串行十六进制。

你需要扫描 SCSI 主机来寻找存储团队分配的新 LUN。

这可以通过两种方式进行，扫描每个 scsi 主机设备或运行 `rescan-scsi-bus.sh` 脚本来检测新磁盘。

扫描后可以在 `/dev/disk/by-id` 目录下找到它们。

```
# ll /dev/disk/by-id

total 0
lrwxrwxrwx 1 root root 10 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684b -> ../../sdah
lrwxrwxrwx 1 root root 9 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684c -> ../../sdw
.
.
lrwxrwxrwx 1 root root 10 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684d -> ../../sdjk
lrwxrwxrwx 1 root root 10 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684e -> ../../sdaa
lrwxrwxrwx 1 root root 9 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684f -> ../../sdh
```

另外，如果你已经用 `multipath` 配置了它们，那么可以用 `multipath` 命令找到。

`multipath 主要是配置到 Oracle 数据库服务器中，以提高性能。

```
# multipath -ll

60a98000486e542d4f5a2f47694d684b dm-37 NETAPP,LUN C-Mode
size=512G features='3 queue_if_no_path pg_init_retries 50' hwhandler='1 alua' wp=rw
|-+- policy='round-robin 0' prio=50 status=active
| |- 1:0:4:18 sdoe 128:416 active ready running
| |- 0:0:4:18 sdpq 131:256 active ready running
| |- 0:0:5:18 sdsr 135:496 active ready running
| `- 1:0:5:18 sdsq 135:480 active ready running
`-+- policy='round-robin 0' prio=10 status=enabled
|- 1:0:1:18 sdfw 131:32 active ready running
|- 1:0:0:18 sdci 69:96 active ready running
|- 0:0:1:18 sdbz 68:208 active ready running
|- 0:0:0:18 sds 65:32 active ready running
|- 1:0:3:18 sdmd 69:336 active ready running
|- 1:0:2:18 sdjj 8:464 active ready running
|- 0:0:3:34 sdjt 65:368 active ready running
`- 0:0:2:34 sdgi 131:224 active ready running
```

这个过程适用于基于 Red Hat 6.x、7.x 和 8.x（RHEL - Red Hat Enterprise Linux）的系统，如 CentOS 和 Oracle Linux。

### 方法 1：如何使用 /sys 类文件在 Linux 上扫描新的 LUN 和 SCSI 磁盘

sysfs 文件系统是一个伪文件系统，它为内核数据结构提供了一个接口。

sysfs 下的文件提供了关于设备、内核模块、文件系统和其他内核组件的信息。

sysfs 文件系统通常被挂载在 `/sys`。通常，它是由系统自动挂载的。

你可以使用 `echo` 命令来扫描每个 SCSI 主机设备，如下所示：

```
# echo "- - -" > /sys/class/scsi_host/host[n]/scan
```

当你运行上面的重新扫描所有的命令时，三个破折号（`- – -`）指的是通配符选项。这些值如下：

```
# echo "c t l" > /sys/class/scsi_host/host[n]/scan
```

这里：

* `c`：HBA 上的通道
* `t`：SCSI 目标 ID
* `l`：LUN ID
* `n`：HBA 编号

运行下面的命令来查找系统中所有的主机总线编号：

```
# ls /sys/class/scsi_host
host0 host1 host2
```

得到主机总线编号后，运行以下命令来发现新的磁盘：

```
# echo "- - -" > /sys/class/scsi_host/host0/scan
# echo "- - -" > /sys/class/scsi_host/host1/scan
# echo "- - -" > /sys/class/scsi_host/host2/scan
```

另外，还可以用 `for` 循环用一条命令进行扫描。

```
# for host in ls /sys/class/scsi_host/;do echo "- - -" >/sys/class/scsi_host/${host}/scan; done
```

你可以使用文章开头提到的 [ls 命令][2]来检查它们。

```
# ls /dev/disk/by-id | grep -i "serial-hex of LUN"
```

### 方法 2：如何使用 rescan-scsi-bus.sh 脚本在 Linux 上扫描新的 LUN 和 SCSI 磁盘

确保你已经安装了 `sg3_utils` 包来使用这个脚本。否则，运行以下命令来安装它。

对于 RHEL/CentOS 6/7 系统，使用 [yum 命令][3]安装 `sg3_utils`。

```
# yum install -y sg3_utils
```

对于 RHEL/CentOS 8 和 Fedora 系统，使用 [dnf 命令][4]安装 sg3_utils。

```
# dnf install -y sg3_utils
```

现在你可以使用 `rescan-scsi-bus.sh` 脚本重新扫描 LUN。

```
# ./rescan-scsi-bus.sh
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-find-wwn-wwnn-wwpn-number-of-hba-card-in-linux/
[2]: https://www.2daygeek.com/linux-unix-ls-command-display-directory-contents/
[3]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/