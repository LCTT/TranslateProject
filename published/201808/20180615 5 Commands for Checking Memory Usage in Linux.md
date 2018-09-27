用以检查 Linux 内存使用的 5 个命令
======

> 对于 Linux 管理员来说，检查系统内存用量是一个重要的技能。Jack 给出了解决这个问题的五种不同方式。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/top-main.jpg?itok=WYAw6yJ1)

Linux 操作系统包含大量工具，所有这些工具都可以帮助你管理系统。从简单的文件和目录工具到非常复杂的安全命令，在 Linux 中没有多少是你做不了的。而且，尽管普通桌面用户可能不需要在命令行熟悉这些工具，但对于 Linux 管理员来说，它们是必需的。为什么？首先，你在某些时候不得不使用没有 GUI 的 Linux 服务器。其次，命令行工具通常比 GUI 替代工具提供更多的功能和灵活性。

确定内存使用情况是你可能需要的技能，尤其是某个应用程序变得异常和占用系统内存时。当发生这种情况时，知道有多种工具可以帮助你进行故障排除十分方便的。或者，你可能需要收集有关 Linux 交换分区的信息，或者有关安装的内存的详细信息？对于这些也有相应的命令。让我们深入了解各种 Linux 命令行工具，以帮助你检查系统内存使用情况。这些工具并不是非常难以使用，在本文中，我将向你展示五种不同的方法来解决这个问题。

我将在 [Ubuntu 18.04 服务器平台][1]上进行演示，但是你应该在你选择的发行版中找到对应的所有命令。更妙的是，你不需要安装任何东西（因为大多数这些工具都包含 Linux 系统中）。

话虽如此，让我们开始工作吧。

### top

我想从最常用的工具开始。`top` 命令提供正在运行的系统的实时动态视图，它检查每个进程的内存使用情况。这非常重要，因为你可以轻松地看到同一命令的多个示例消耗不同的内存量。虽然你无法在没有显示器的服务器上看到这种情况，但是你已经注意到打开 Chrome 使你的系统速度变慢了。运行 `top` 命令以查看 Chrome 有多个进程在运行（每个选项卡一个 - 图 1）。

![top][3]

*图1：top 命令中出现多个 Chrome 进程。*

Chrome 并不是唯一显示多个进程的应用。你看到图 1 中的 Firefox 了吗？那是 Firefox 的主进程，而 Web Content 进程是其打开的选项卡。在输出的顶部，你将看到系统统计信息。在我的机器上（[System76 Leopard Extreme][5]），我总共有 16GB 可用 RAM，其中只有超过 10GB 的 RAM 正在使用中。然后，你可以整理该列表，查看每个进程使用的内存百分比。

`top` 最好的地方之一就是发现可能已经失控的服务的进程 ID 号（PID）。有了这些 PID，你可以对有问题的任务进行故障排除（或 `kill`）。

如果你想让 `top` 显示更友好的内存信息，使用命令 `top -o ％MEM`，这会使 `top` 按进程所用内存对所有进程进行排序（图 2）。

![top][7]

*图 2：在 top 命令中按使用内存对进程排序*

`top` 命令还为你提供有关使用了多少交换空间的实时更新。

### free

然而有时候，`top` 命令可能不能满足你的需求。你可能只需要查看系统的可用和已用内存。对此，Linux 还有 `free` 命令。`free` 命令显示：

* 可用和已使用的物理内存总量
* 系统中交换内存的总量
* 内核使用的缓冲区和缓存

在终端窗口中，输入 `free` 命令。它的输出不是实时的，相反，你将获得的是当前空闲和已用内存的即时快照（图 3）。

![free][9]

*图 3 ：free 命令的输出简单明了。*

当然，你可以通过添加 `-m` 选项来让 `free` 显示得更友好一点，就像这样：`free -m`。这将显示内存的使用情况，以 MB 为单位（图 4）。

![free][11]

*图 4：free 命令以一种更易于阅读的形式输出。*

当然，如果你的系统是很新的，你将希望使用 `-g` 选项（以 GB 为单位），比如 `free -g`。

如果你需要知道内存总量，你可以添加 `-t` 选项，比如：`free -mt`。这将简单地计算每列中的内存总量（图 5）。

![total][13]

*图 5：为你提供空闲的内存列。*

### vmstat

另一个非常方便的工具是 `vmstat`。这个特殊的命令是一个报告虚拟内存统计信息的小技巧。`vmstat` 命令将报告关于：

* 进程
* 内存
* 分页
* 阻塞 IO
* 中断
* 磁盘
* CPU

使用 `vmstat` 的最佳方法是使用 `-s` 选项，如 `vmstat -s`。这将在单列中报告统计信息（这比默认报告更容易阅读）。`vmstat` 命令将提供比你需要的更多的信息（图 6），但更多的总是更好的（在这种情况下）。

![vmstat][15]

*图 6：使用 vmstat 命令来检查内存使用情况。*

### dmidecode

如果你想找到关于已安装的系统内存的详细信息，该怎么办？为此，你可以使用 `dmidecode` 命令。这个特殊的工具是 DMI 表解码器，它将系统的 DMI 表内容转储成人类可读的格式。如果你不清楚 DMI 表是什么，那么可以这样说，它可以用来描述系统的构成（以及系统的演变）。

要运行 `dmidecode` 命令，你需要 `sudo` 权限。因此输入命令 `sudo dmidecode -t 17`。该命令的输出（图 7）可能很长，因为它显示所有内存类型设备的信息。因此，如果你无法上下滚动，则可能需要将该命令的输出发送到一个文件中，比如：`sudo dmidecode -t 17> dmi_infoI`，或将其传递给 `less` 命令，如 `sudo dmidecode | less`。

![dmidecode][17]

*图 7：dmidecode 命令的输出。*

### /proc/meminfo

你可能会问自己：“这些命令从哪里获取这些信息？”在某些情况下，它们从 `/proc/meminfo` 文件中获取。猜到了吗？你可以使用命令 `less /proc/meminfo` 直接读取该文件。通过使用 `less` 命令，你可以在长长的输出中向上和向下滚动，以准确找到你需要的内容（图 8）。

![/proc/meminfo][19]

*图 8：less /proc/meminfo 命令的输出。*

关于 `/proc/meminfo` 你应该知道：这不是一个真实的文件。相反 `/proc/meminfo` 是一个虚拟文件，包含有关系统的实时动态信息。特别是，你需要检查以下值：

  * 全部内存（`MemTotal`）
  * 空闲内存（`MemFree`）
  * 可用内存（`MemAvailable`）
  * 缓冲区（`Buffers`）
  * 文件缓存（`Cached`）
  * 交换缓存（`SwapCached`）
  * 全部交换区（`SwapTotal`）
  * 空闲交换区（`SwapFree`）

如果你想使用 `/proc/meminfo`，你可以连接 egrep 命令使用它：`egrep --color'Mem | Cache | Swap'/proc/meminfo`。这将生成一个易于阅读的列表，其中包含 `Mem`、 `Cache` 和 `Swap` 等内容的条目将是彩色的（图 9）。

![/proc/meminfo][21]

*图 9：让 /proc/meminfo 更容易阅读。*

### 继续学习

你要做的第一件事就是阅读每个命令的手册页（例如 `man top`、`man free`、`man vmstat`、`man dmidecode`）。从命令的手册页开始，对于如何在 Linux 上使用一个工具，它总是一个很好的学习方法。

通过 Linux 基金会和 edX 的免费 [“Linux 简介”][22]课程了解有关 Linux 的更多知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/5-commands-checking-memory-usage-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.ubuntu.com/download/server
[2]:/files/images/memory1jpg
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_1.jpg?itok=fhhhUL_l (top)
[4]:/licenses/category/used-permission
[5]:https://system76.com/desktops/leopard
[6]:/files/images/memory2jpg
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_2.jpg?itok=zuVkQfvv (top)
[8]:/files/images/memory3jpg
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_3.jpg?itok=rvuQp3t0 (free)
[10]:/files/images/memory4jpg
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_4.jpg?itok=K_luLLPt (free)
[12]:/files/images/memory5jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_5.jpg?itok=q50atcsX (total)
[14]:/files/images/memory6jpg
[15]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_6.jpg?itok=bwFnUVmy (vmstat)
[16]:/files/images/memory7jpg
[17]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_7.jpg?itok=UNHIT_P6 (dmidecode)
[18]:/files/images/memory8jpg
[19]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_8.jpg?itok=t87jvmJJ (/proc/meminfo)
[20]:/files/images/memory9jpg
[21]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_9.jpg?itok=t-iSMEKq (/proc/meminfo)
[22]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
