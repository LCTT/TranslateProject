检查 Linux 文件系统中的错误：通过案例学习 FSCK 命令
======

FSCK 是一个很重要的 Linux/Unix 工具，它用于检测并修复文件系统中的错误。它类似于 Windows 操作系统中的 “chkdsk” 工具，但它是为 Linux、MacOS、FreeBSD 操作系统所准备的。

FSCK 全称为 File System Consistency Check。在大多数时候，它在系统启动时运行，但是如果需要的话，它也能被超级用户手工启动。

它可以进行三种模式的操作，

1. 查错并在发现错误时由用户决定如何处理，
2. 查错并自动修复，
3. 查错但在发现错误时只显示错误而不进行修复。

### FSCK 的语法

手工执行 FSCK 的语法为，

```
$ fsck options drives
```

`fsck` 支持的选项有，

- `-p` 自动修复（不询问）
- `-n` 不对文件系统做出改动
- `-y` 对所有问题都回答 "yes"
- `-c` 检查所有的坏块并将之添加到坏块列表中
- `-f` 即使文件系统标记为 clean 也强制进行检查
- `-v` 输出详细信息
- `-b superblock` 使用替代的超级块
- `-B blocksize` 指定超级块的块大小
- `-j  external_journal` 指定外部日志的位置
- `-l  bad_blocks_file` 添加到指定的坏块列表（文件）
- `-L bad_blocks_file` 指定坏块列表（文件）

我们可以根据要做的操作任意指定这些选项。下面让我们来看一些例子。

### Fsck 命令的案例

注意： 在开始讨论案例之前，请先读完这段话。我们不应该用 `fsck` 检查已挂载的磁盘，这很可能会对磁盘造成永久性的伤害。因此在开始使用 `fsck` 之前，我们需要使用下面命令来卸载磁盘，

```
$ umount drivename
```

比如像这样，

```
$ umount /dev/sdb1
```

可以通过下面命令来查看分区编号，

```
$ fdisk -l
```

另外，在运行 fsck 时，可能出错并返回一些错误码。下面是一些常见的错误及其意义的列表，

- `0` - 没有错误
- `1` - 修复了一些文件系统错误
- `2` - 系统需要被重启
- `4` - 文件系统错误未被修复
- `8` - 操作错
- `16` - 使用或语法错
- `32` - fsck 被用户取消
- `128` - 共享库出错

现在让我们来看一些 `fsck` 命令的例子，

### 在单个分区上进行错误检查

在终端运行下面过命令来对单个分区进行检查，

```
$ umount /dev/sdb1
$ fsck /dev/sdb1
```

### 检查文件系统错误并自动修复

使用选项 `-a` 进行一致性检查并自动修复这些错误。也可以用 `-y` 替代 `-a` 选项。

```
$ fsck -a /dev/sdb1
```

### 检查文件系统错误但并不进行修复

若我们只想知道文件系统上有哪些错误而不想修复这些错误，那么可以使用选项 `-n`，

```
$ fsck -n /dev/sdb1
```

### 检查所有分区中的错误

`-A` 选项一次性检查所有分区上的文件系统错误，

```
$ fsck -A
```

若要禁止对根文件系统进行检查可以使用选项 `-R`，

```
$ fsck -AR
```

### 只检查指定文件系统类型的分区

使用选项 `-t` 及文件系统类型，可以让 fsck 只检查指定文件系统类型的分区，比如指定文件系统类型为 “ext4”，

```
$ fsck -t ext4 /dev/sdb1
```

或者，

```
$ fsck -t -A ext4
```

### 只在卸载的磁盘上进行一致性检查

要保证 fsck 只在卸载的磁盘上操作，可以使用选项 `-M`，

```
$ fsck -AM
```

这就是我们的案例教程了。有任何疑问欢迎在下面的留言框中留言。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/linux-filesystem-errors-fsck-command-with-examples/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/learn-use-tcpdump-command-examples/
