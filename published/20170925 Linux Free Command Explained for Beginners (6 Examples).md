6 个例子让初学者掌握 free 命令
======

在 Linux 系统上，有时你可能想从命令行快速地了解系统的已使用和未使用的内存空间。如果你是一个 Linux 新手，有个好消息：有一条系统内置的命令可以显示这些信息：`free`。

在本文中，我们会讲到 free 命令的基本用法以及它所提供的一些重要的功能。文中提到的所有命令和用法都是在 Ubuntu 16.04LTS 上测试过的。

### Linux free 命令

让我们看一下 `free` 命令的语法：

```
free [options]
```

free 命令的 man 手册如是说：

> `free` 命令显示了系统的可用和已用的物理内存及交换内存的总量，以及内核用到的缓存空间。这些信息是从 `/proc/meminfo` 中得到的。

接下来我们用问答的方式了解一下 `free` 命令是怎么工作的。

### Q1. 怎么用 free 命令查看已使用和未使用的内存？

这很容易，您只需不加任何参数地运行 `free` 这条命令就可以了：

```
free
```

这是 `free` 命令在我的系统上的输出：

[![view used and available memory using free command][1]][2]

这些列是什么意思呢？

[![Free command columns][3]][4]

- `total` - 安装的内存的总量（等同于 `/proc/meminfo` 中的 `MemTotal` 和 `SwapTotal`）
- `used` - 已使用的内存（计算公式为：`used` = `total` - `free` - `buffers` - `cache`）
- `free` - 未被使用的内存（等同于 `/proc/meminfo` 中的 `MemFree` 和 `SwapFree`）
- `shared` - 通常是临时文件系统使用的内存（等同于 `/proc/meminfo` 中的 `Shmem`；自内核 2.6.32 版本可用，不可用则显示为 `0`）
- `buffers` - 内核缓冲区使用的内存（等同于 `/proc/meminfo` 中的 `Buffers`）
- `cache` - 页面缓存和 Slab 分配机制使用的内存（等同于 `/proc/meminfo` 中的 `Cached` 和 `Slab`）
- `buff/cache` - `buffers` 与 `cache` 之和
- `available` - 在不计算交换空间的情况下，预计可以被新启动的应用程序所使用的内存空间。与 `cache` 或者 `free` 部分不同，这一列把页面缓存计算在内，并且不是所有的可回收的 slab 内存都可以真正被回收，因为可能有被占用的部分。（等同于 `/proc/meminfo` 中的 `MemAvailable`；自内核 3.14 版本可用，自内核 2.6.27 版本开始模拟；在其他版本上这个值与 `free` 这一列相同）

### Q2. 如何更改显示的单位呢？

如果需要的话，你可以更改内存的显示单位。比如说，想要内存以兆为单位显示，你可以用 `-m` 这个参数：

```
free -m
```

[![free command display metrics change][5]][6]

同样地，你可以用 `-b` 以字节显示、`-k` 以 KB 显示、`-m` 以 MB 显示、`-g` 以 GB 显示、`--tera` 以 TB 显示。

### Q3. 怎么显示可读的结果呢？

`free` 命令提供了 `-h` 这个参数使输出转化为可读的格式。

```
free -h
```

用这个参数，`free` 命令会自己决定用什么单位显示内存的每个数值。例如：

[![diplsy data fromm free command in human readable form][7]][8]

### Q4. 怎么让 free 命令以一定的时间间隔持续运行？

您可以用 `-s` 这个参数让 `free` 命令以一定的时间间隔持续地执行。您需要传递给命令行一个数字参数，做为这个时间间隔的秒数。

例如，使 `free` 命令每隔 3 秒执行一次：

```
free -s 3
```

如果您需要 `free` 命令只执行几次，您可以用 `-c` 这个参数指定执行的次数：

```
free -s 3 -c 5
```

上面这条命令可以确保 `free` 命令每隔 3 秒执行一次，总共执行 5 次。

注：这个功能目前在 Ubuntu 系统上还存在 [问题][9]，所以并未测试。

### Q5. 怎么使 free 基于 1000 计算内存，而不是 1024？

如果您指定 `free` 用 MB 来显示内存（用 `-m` 参数），但又想基于 1000 来计算结果，可以用 `--sj` 这个参数来实现。下图展示了用与不用这个参数的结果：

[![How to make free use power of 1000 \(not 1024\) while displaying memory figures][10]][11]

### Q6. 如何使 free 命令显示每一列的总和？

如果您想要 `free` 命令显示每一列的总和，你可以用 `-t` 这个参数。

```
free -t
```

如下图所示：

[![How to make free display total of columns][12]][13]

请注意 `Total` 这一行出现了。

### 总结

`free` 命令对于系统管理来讲是个极其有用的工具。它有很多参数可以定制化您的输出，易懂易用。我们在本文中也提到了很多有用的参数。练习完之后，请您移步至 [man 手册][14]了解更多内容。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-free-command/

作者：[Himanshu Arora][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/linux_free_command/free-command-output.png
[2]:https://www.howtoforge.com/images/linux_free_command/big/free-command-output.png
[3]:https://www.howtoforge.com/images/linux_free_command/free-output-columns.png
[4]:https://www.howtoforge.com/images/linux_free_command/big/free-output-columns.png
[5]:https://www.howtoforge.com/images/linux_free_command/free-m-option.png
[6]:https://www.howtoforge.com/images/linux_free_command/big/free-m-option.png
[7]:https://www.howtoforge.com/images/linux_free_command/free-h.png
[8]:https://www.howtoforge.com/images/linux_free_command/big/free-h.png
[9]:https://bugs.launchpad.net/ubuntu/+source/procps/+bug/1551731
[10]:https://www.howtoforge.com/images/linux_free_command/free-si-option.png
[11]:https://www.howtoforge.com/images/linux_free_command/big/free-si-option.png
[12]:https://www.howtoforge.com/images/linux_free_command/free-t-option.png
[13]:https://www.howtoforge.com/images/linux_free_command/big/free-t-option.png
[14]:https://linux.die.net/man/1/free
