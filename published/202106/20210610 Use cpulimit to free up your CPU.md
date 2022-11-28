[#]: subject: (Use cpulimit to free up your CPU)
[#]: via: (https://fedoramagazine.org/use-cpulimit-to-free-up-your-cpu/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13501-1.html)

使用 cpulimit 来释放你的 CPU
======

![](https://img.linux.net.cn/data/attachment/album/202106/19/084002xuwuuqfww8xvfem7.jpg)

在 Linux 系统上管理系统资源的推荐工具是 [cgroups][4]。虽然在可以调整的限制方面（CPU、内存、磁盘 I/O、网络等）非常强大，但配置 cgroups 并不简单。[nice][5] 命令从 1973 年起就可以使用了。但它只是调整在一个处理器上竞争时间的进程之间的调度优先级。`nice` 命令不会限制一个进程在单位时间内所能消耗的 CPU 周期的百分比。[cpulimit][6] 命令提供了两个世界的最佳方案。它限制了一个进程在每单位时间内可以分配的 CPU 周期的百分比，而且相对容易调用。

`cpulimit` 命令主要对长期运行的和 CPU 密集型的进程有用。编译软件和转换视频是长期运行的进程的常见例子，它们可以使计算机的 CPU 使用率达到最大。限制这类进程的 CPU 使用率将释放出处理器时间，供计算机上可能运行的其他任务使用。限制 CPU 密集型进程也将减少功耗及热输出，并可能减少系统的风扇噪音。限制一个进程的 CPU 使用率的代价是，它需要更多的时间来完成运行。

### 安装 cpulimit

`cpulimit` 命令在默认的 Fedora Linux 仓库中可用。运行下面的命令，在 Fedora Linux 系统上安装 `cpulimit`：

```
$ sudo dnf install cpulimit
```

### 查看 cpulimit 的文档

`cpulimit` 软件包并没有附带的手册页。使用下面的命令来查看 `cpulimit` 的内置文档。输出结果在下面提供。但你可能需要在你自己的系统上运行该命令，以防止自本文编写以来选项发生变化。

```
$ cpulimit --help
Usage: cpulimit [OPTIONS…] TARGET
   OPTIONS
      -l, --limit=N percentage of cpu allowed from 0 to 800 (required)
      -v, --verbose show control statistics
      -z, --lazy exit if there is no target process, or if it dies
      -i, --include-children limit also the children processes
      -h, --help display this help and exit
   TARGET must be exactly one of these:
      -p, --pid=N pid of the process (implies -z)
      -e, --exe=FILE name of the executable program file or path name
      COMMAND [ARGS] run this command and limit it (implies -z)
```

### 演示

为了演示 `cpulimit` 命令的使用方式，下面提供了一个精心设计的、计算量很大的 Python 脚本。该脚本首先在没有限制的情况下运行，然后在限制为 50% 的情况下运行。它计算的是第 42 个 [斐波那契数][7] 的值。该脚本在这两种情况下都作为 `time` 命令的子进程运行，以显示计算答案所需的总时间。

```
$ /bin/time -f '(computed in %e seconds)' /bin/python -c 'f = lambda n: n if n<2 else f(n-1)+f(n-2); print(f(42), end=" ")'
267914296 (computed in 51.80 seconds)
$ /bin/cpulimit -i -l 50 /bin/time -f '(computed in %e seconds)' /bin/python -c 'f = lambda n: n if n<2 else f(n-1)+f(n-2); print(f(42), end=" ")'
267914296 (computed in 127.38 seconds)
```

当运行第一个版本的命令时，你可能会听到电脑上的 CPU 风扇转动起来。但在运行第二个版本时，你应该不会。第一个版本的命令不受 CPU 的限制，但它不应该导致你的电脑陷入瘫痪。它是以这样一种方式编写的：它最多只能使用一个 CPU 核心。大多数现代 PC 都有多个 CPU 核心，当其中一个 CPU 100% 繁忙时，可以毫无困难地同时运行其他任务。为了验证第一条命令是否使你的一个处理器达到最大，在一个单独的终端窗口中运行 `top` 命令并按下 `1` 键。要退出 `top` 命令可以按 `Q` 键。

设置高于 100% 的限制只对能够进行 [任务并行化][8] 的程序有意义。对于这样的程序，高于 100% 的增量代表一个 CPU 的全部利用率（200%=2 个CPU，300%=3 个CPU，等等）。

注意，在上面的例子中，`-i` 选项已经传递给 `cpulimit` 命令。这是必要的，因为要限制的命令不是 `cpulimit` 命令的直接子进程。相反，它是 `time` 命令的一个子进程，而后者又是 `cpulimit` 命令的一个子进程。如果没有 `-i` 选项，`cpulimit` 将只限制 `time` 命令。

### 最后说明

如果你想限制一个从桌面图标启动的图形程序，请将该程序的 `.desktop` 文件（通常位于 `/usr/share/applications` 目录下）复制到你的 `~/.local/share/applications` 目录下，并相应修改 `Exec` 行。然后运行下面的命令来应用这些变化：

```
$ update-desktop-database ~/.local/share/applications
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-cpulimit-to-free-up-your-cpu/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/06/cpulimit-816x345.jpg
[2]: https://unsplash.com/@henning?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/speed-limit?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://en.wikipedia.org/wiki/Cgroups
[5]: https://en.wikipedia.org/wiki/Nice_(Unix)
[6]: https://github.com/opsengine/cpulimit
[7]: https://en.wikipedia.org/wiki/Fibonacci_number
[8]: https://en.wikipedia.org/wiki/Task_parallelism
