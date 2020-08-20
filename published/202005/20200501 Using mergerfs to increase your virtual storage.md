[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12207-1.html)
[#]: subject: (Using mergerfs to increase your virtual storage)
[#]: via: (https://fedoramagazine.org/using-mergerfs-to-increase-your-virtual-storage/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

使用 mergefs 增加虚拟存储
======

![][1]

如果你想在一个媒体项目中用到了多个磁盘或分区，不想丢失任何现有数据，但又想将所有文件都存放在一个驱动器下，该怎么办？这时，mergefs 就能派上用场！

[mergerfs][2] 是一个联合文件系统，旨在简化存储和管理众多商业存储设备上的文件。

你需要从他们的 [GitHub][3] 页面获取最新的 RPM。Fedora 的版本名称中带有 “fc” 和版本号。例如，这是 Fedora 31 的版本： [mergerfs-2.29.0-1.fc31.x86_64.rpm][4]。

### 安装和配置 mergefs

使用 `sudo` 安装已下载的 mergefs 软件包：

```
$ sudo dnf install mergerfs-2.29.0-1.fc31.x86_64.rpm
```

现在，你可以将多个磁盘挂载为一个驱动器。如果你有一台媒体服务器，并且希望所有媒体文件都显示在一个地方，这将很方便。如果将新文件上传到系统，那么可以将它们复制到 mergefs 目录，mergefs 会自动将它们复制具有足够可用空间的磁盘上。

这是使你更容易理解的例子：

```
$ df -hT | grep disk
/dev/sdb1      ext4      23M  386K 21M 2% /disk1
/dev/sdc1      ext4      44M  1.1M 40M 3% /disk2

$ ls -l /disk1/Videos/
total 1
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Our Wedding.mkv

$ ls -l /disk2/Videos/
total 2
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Baby's first Xmas.mkv
-rw-rw-r--. 1 curt curt 0 Mar 8 17:21 Halloween hijinks.mkv
```

在此例中挂载了两块磁盘，分别为 `disk1` 和 `disk2`。两个驱动器都有一个包含文件的 `Videos` 目录。

现在，我们将使用 mergefs 挂载这些驱动器，使它们看起来像一个更大的驱动器。

```
$ sudo mergerfs -o defaults,allow_other,use_ino,category.create=mfs,moveonenospc=true,minfreespace=1M /disk1:/disk2 /media
```

mergefs 手册页非常庞杂，因此我们将说明上面提到的选项。

  * `defaults`：除非指定，否则将使用默认设置。
  * `allow_other`：允许 `sudo` 或 `root` 以外的用户查看文件系统。
  * `use_ino`：让 mergefs 提供文件/目录 inode 而不是 libfuse。虽然不是默认值，但建议你启用它，以便链接的文件共享相同的 inode 值。
  * `category.create=mfs`：根据可用空间在驱动器间传播文件。
  * `moveonenospc=true`：如果启用，那么如果写入失败，将进行扫描以查找具有最大可用空间的驱动器。
  * `minfreespace=1M`：最小使用空间值。
  * `disk1`：第一块硬盘。
  * `disk2`：第二块硬盘。
  * `/media`：挂载驱动器的目录。

看起来是这样的：

```
$ df -hT | grep disk
/dev/sdb1  ext4           23M      386K 21M 2% /disk1
/dev/sdc1  ext4           44M      1.1M 40M 3% /disk2

$ df -hT | grep media
1:2        fuse.mergerfs  66M      1.4M 60M 3% /media
```

你可以看到现在 mergefs 挂载显示的总容量为 66M，这是两块硬盘的总容量。

继续示例：

有一个叫 `Baby's second Xmas.mkv` 的 30M 视频。让我们将其复制到用 mergerfs 挂载的 `/media` 文件夹中。

```
$ ls -lh "Baby's second Xmas.mkv"
-rw-rw-r--. 1 curt curt 30M Apr 20 08:45 Baby's second Xmas.mkv
$ cp "Baby's second Xmas.mkv" /media/Videos/
```

这是最终结果：

```
$ df -hT | grep disk
/dev/sdb1  ext4          23M 386K 21M 2% /disk1
/dev/sdc1  ext4          44M 31M 9.8M 76% /disk2

$ df -hT | grep media
1:2        fuse.mergerfs 66M 31M 30M 51% /media
```

从磁盘空间利用率中可以看到，因为 `disk1` 没有足够的可用空间，所以 mergefs 自动将文件复制到 `disk2`。

这是所有文件详情：

```
$ ls -l /disk1/Videos/
total 1
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Our Wedding.mkv

$ ls -l /disk2/Videos/
total 30003
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Baby's first Xmas.mkv
-rw-rw-r--. 1 curt curt 30720000 Apr 20 08:47 Baby's second Xmas.mkv
-rw-rw-r--. 1 curt curt 0 Mar 8 17:21 Halloween hijinks.mkv

$ ls -l /media/Videos/
total 30004
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Baby's first Xmas.mkv
-rw-rw-r--. 1 curt curt 30720000 Apr 20 08:47 Baby's second Xmas.mkv
-rw-rw-r--. 1 curt curt 0 Mar 8 17:21 Halloween hijinks.mkv
-rw-r--r--. 1 curt curt 0 Mar 8 17:17 Our Wedding.mkv
```

当你将文件复制到 mergefs 挂载点时，它将始终将文件复制到有足够可用空间的硬盘上。如果池中的所有驱动器都没有足够的可用空间，那么你将无法复制它们。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-mergerfs-to-increase-your-virtual-storage/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/mergerfs-816x346.png
[2]: https://github.com/trapexit/mergerfs
[3]: https://github.com/trapexit/mergerfs/releases
[4]: https://github.com/trapexit/mergerfs/releases/download/2.29.0/mergerfs-2.29.0-1.fc31.x86_64.rpm
