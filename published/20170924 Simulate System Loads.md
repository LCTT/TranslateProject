在 Linux 上简单模拟系统负载的方法
======

系统管理员通常需要探索在不同负载对应用性能的影响。这意味着必须要重复地人为创造负载。当然，你可以通过专门的工具来实现，但有时你可能不想也无法安装新工具。

每个 Linux 发行版中都自带有创建负载的工具。他们不如专门的工具那么灵活，但它们是现成的，而且无需专门学习。

### CPU

下面命令会创建 CPU 负荷，方法是通过压缩随机数据并将结果发送到 `/dev/null`：

```
cat /dev/urandom | gzip -9 > /dev/null
```

如果你想要更大的负荷，或者系统有多个核，那么只需要对数据进行压缩和解压就行了，像这样：

```
cat /dev/urandom | gzip -9 | gzip -d | gzip -9 | gzip -d > /dev/null
```

按下 `CTRL+C` 来终止进程。

### 内存占用

下面命令会减少可用内存的总量。它是通过在内存中创建文件系统然后往里面写文件来实现的。你可以使用任意多的内存，只需哟往里面写入更多的文件就行了。

首先，创建一个挂载点，然后将 ramfs 文件系统挂载上去：

```
mkdir z
mount -t ramfs ramfs z/
```

第二步，使用 `dd` 在该目录下创建文件。这里我们创建了一个 128M 的文件：

```
dd if=/dev/zero of=z/file bs=1M count=128
```

文件的大小可以通过下面这些操作符来修改：

- `bs=` 块大小。可以是任何数字后面接上 `B`（表示字节），`K`（表示 KB），`M`（ 表示 MB）或者 `G`（表示 GB）。
- `count=` 要写多少个块。

### 磁盘 I/O

创建磁盘 I/O 的方法是先创建一个文件，然后使用 `for` 循环来不停地拷贝它。

下面使用命令 `dd` 创建了一个全是零的 1G 大小的文件：

```
dd if=/dev/zero of=loadfile bs=1M count=1024
```

下面命令用 `for` 循环执行 10 次操作。每次都会拷贝 `loadfile` 来覆盖 `loadfile1`：

```
for i in {1..10}; do cp loadfile loadfile1; done
```

通过修改 `{1..10}` 中的第二个参数来调整运行时间的长短。（LCTT 译注：你的 Linux 系统中的默认使用的 `cp` 命令很可能是 `cp -i` 的别名，这种情况下覆写会提示你输入 `y` 来确认，你可以使用 `-f` 参数的 `cp` 命令来覆盖此行为，或者直接用 `/bin/cp`  命令。）

若你想要一直运行，直到按下 `CTRL+C` 来停止，则运行下面命令：

```
while true; do cp loadfile loadfile1; done
```
--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/create-system-load/

作者：[Elliot Cooper][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
