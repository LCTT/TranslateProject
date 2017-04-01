free：一个在 Linux 中检查内存使用情况的标准命令
============================================================

我们都知道， IT 基础设施方面的大多数服务器（包括世界顶级的超级计算机）都运行在 Linux 平台上，因为和其他操作系统相比， Linux 更加灵活。有的操作系统对于一些微乎其微的改动和补丁更新都需要重启，但是 Linux 不需要，只有对于一些关键补丁的更新， Linux 才会需要重启。

Linux 系统管理员面临的一大挑战是如何在没有任何停机时间的情况下维护系统的良好运行。管理内存使用是 Linux 管理员又一个具有挑战性的任务。`free` 是 Linux 中一个标准的并且被广泛使用的命令，它被用来分析内存统计（空闲和已用）。今天，我们将要讨论 `free` 命令以及它的一些有用选项。

推荐文章：

*   [smem － Linux 内存报告/统计工具][1]
*   [vmstat － 一个报告虚拟内存统计的标准而又漂亮的工具][2]

### Free 命令是什么

free 命令能够显示系统中物理上的空闲（free）和已用（used）内存，还有交换（swap）内存，同时，也能显示被内核使用的缓冲（buffers）和缓存（caches）。这些信息是通过解析文件 `/proc/meninfo` 而收集到的。

### 显示系统内存

不带任何选项运行 `free` 命令会显示系统内存，包括空闲（free）、已用（used）、交换（swap）、缓冲（buffers）、缓存（caches）和交换（swap）的内存总数。

```
# free
             total       used       free     shared    buffers     cached
Mem:      32869744   25434276    7435468          0     412032   23361716
-/+ buffers/cache:    1660528   31209216
Swap:      4095992          0    4095992
```

输出有三行：

*   第一行：表明全部内存、已用内存、空闲内存、共用内存（主要被 tmpfs（`/proc/meninfo` 中的 `Shmem` 项）使用）、用于缓冲的内存以及缓存内容大小。
	*   全部：全部已安装内存（`/proc/meminfo` 中的 `MemTotal` 项）
	*   已用：已用内存（全部计算 － 空间＋缓冲＋缓存）
	*   空闲：未使用内存（`/proc/meminfo` 中的 `MemFree` 项）
	*   共用：主要被 tmpfs 使用的内存（`/proc/meminfo` 中的 `Shmem` 项）
	*   缓冲：被内核缓冲使用的内存（`/proc/meminfo` 中的 `Buffers` 项）
	*   缓存：被页面缓存和 slab 使用的内存（`/proc/meminfo` 中的 `Cached` 和 `SSReclaimable` 项）
*   第二行：表明已用和空闲的缓冲/缓存
*   第三行：表明总交换内存（`/proc/meminfo` 中的 `SwapTotal` 项）、空闲内存（`/proc/meminfo` 中的 `SwapFree` 项）和已用交换内存。

### 以 MB 为单位显示系统内存

默认情况下， `free` 命令以 `KB - Kilobytes` 为单位输出系统内存，这对于绝大多数管理员来说会有一点迷糊（当系统内存很大的时候，我们中的许多人需要把输出转化为以 MB 为单位，从而才能够理解内存大小）。为了避免这个迷惑，我们在 ‘free’ 命令后面加上 `-m` 选项，就可以立即得到以 ‘MB - Megabytes’ 为单位的输出。

```
# free -m
             total       used       free     shared    buffers     cached
Mem:         32099      24838       7261          0        402      22814
-/+ buffers/cache:       1621      30477
Swap:         3999          0       3999
```

如何从上面的输出中检查剩余多少空闲内存？主要基于已用（used）和空闲（free）两列。你可能在想，你只有很低的空闲内存，因为它只有 `10%`， 为什么？

- 全部实际可用内存 ＝ （全部内存 － 第 2 行的已用内存）
	- 全部内存 ＝ 32099
	- 实际已用内存 ＝ 1621 （ = 全部内存 - 缓冲 - 缓存）
- 全部实际可用内存 ＝ 30477

如果你的 Linux 版本是最新的，那么有一个查看实际空闲内存的选项，叫做可用（`available`） ，对于旧的版本，请看显示 `-/+ buffers/cache` 那一行对应的空闲（`free`）一列。

如何从上面的输出中检查有多少实际已用内存？基于已用（used）和空闲（free）一列。你可能想，你已经使用了超过 `95%` 的内存。

- 全部实际已用内存 ＝ 第一列已用 － （第一列缓冲 ＋ 第一列缓存）
	- 已用内存 ＝ 24838
	- 已用缓冲 ＝ 402
	- 已用缓存 ＝ 22814
- 全部实际已用内存 ＝ 1621

### 以 GB 为单位显示内存

默认情况下， `free` 命令会以 `KB - kilobytes` 为单位显示输出，这对于大多数管理员来说会有一些迷惑，所以我们使用上面的选项来获得以 `MB - Megabytes` 为单位的输出。但是，当服务器的内存很大（超过 100 GB 或 200 GB）时，上面的选项也会让人很迷惑。所以，在这个时候，我们可以在 `free` 命令后面加上 `-g` 选项，从而立即得到以 `GB - Gigabytes` 为单位的输出。

```
# free -g
             total       used       free     shared    buffers     cached
Mem:            31         24          7          0          0         22
-/+ buffers/cache:          1         29
Swap:            3          0          3
```

### 显示全部内存行

默认情况下， `free` 命令的输出只有三行（内存、缓冲/缓存以及交换）。为了统一以单独一行显示（全部（内存＋交换）、已用（内存＋（已用－缓冲/缓存）＋交换）以及空闲（内存＋（已用－缓冲/缓存）＋交换），在 ‘free’ 命令后面加上 `-t` 选项。

```
# free -t
             total       used       free     shared    buffers     cached
Mem:      32869744   25434276    7435468          0     412032   23361716
-/+ buffers/cache:    1660528   31209216
Swap:      4095992          0    4095992
Total:    36965736   27094804   42740676
```

### 按延迟运行 free 命令以便更好的统计

默认情况下， free 命令只会显示一次统计输出，这是不足够进一步排除故障的，所以，可以通过添加延迟（延迟是指在几秒后再次更新）来定期统计内存活动。如果你想以两秒的延迟运行 free 命令，可以使用下面的命令（如果你想要更多的延迟，你可以按照你的意愿更改数值）。

下面的命令将会每 2 秒运行一次直到你退出：

```
# free -s 2
             total       used       free     shared    buffers     cached
Mem:      32849392   25935844    6913548        188     182424   24632796
-/+ buffers/cache:    1120624   31728768
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25935288    6914104        188     182424   24632796
-/+ buffers/cache:    1120068   31729324
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25934968    6914424        188     182424   24632796
-/+ buffers/cache:    1119748   31729644
Swap:     20970492          0   20970492
```

### 按延迟和具体次数运行 free 命令

另外，你可以按延迟和具体次数运行 free 命令，一旦达到某个次数，便自动退出。

下面的命令将会每 2 秒运行一次 free 命令，计数 5 次以后自动退出。

```
# free -s 2 -c 5
             total       used       free     shared    buffers     cached
Mem:      32849392   25931052    6918340        188     182424   24632796
-/+ buffers/cache:    1115832   31733560
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931192    6918200        188     182424   24632796
-/+ buffers/cache:    1115972   31733420
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931348    6918044        188     182424   24632796
-/+ buffers/cache:    1116128   31733264
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931316    6918076        188     182424   24632796
-/+ buffers/cache:    1116096   31733296
Swap:     20970492          0   20970492

             total       used       free     shared    buffers     cached
Mem:      32849392   25931308    6918084        188     182424   24632796
-/+ buffers/cache:    1116088   31733304
Swap:     20970492          0   20970492
```

### 人类可读格式

为了以人类可读的格式输出，在 `free` 命令的后面加上 `-h` 选项，和其他选项比如 `-m` 和 `-g` 相比，这将会更人性化输出（自动使用 GB 和 MB 单位）。

```
# free -h
              total        used        free      shared  buff/cache   available
Mem:           2.0G        1.6G        138M         20M        188M        161M
Swap:          2.0G        1.8G        249M
```

### 取消缓冲区和缓存内存输出

默认情况下， `缓冲/缓存` 内存输出是同时输出的。为了取消缓冲和缓存内存的输出，可以在 `free` 命令后面加上 `-w` 选项。（该选项在版本 3.3.12 上可用）

注意比较上面有`缓冲/缓存`的输出。

```
# free -wh
              total        used        free      shared     buffers       cache   available
Mem:           2.0G        1.6G        137M         20M        8.1M        183M        163M
Swap:          2.0G        1.8G        249M
```

### 显示最低和最高的内存统计

默认情况下， `free` 命令不会显示最低和最高的内存统计。为了显示最低和最高的内存统计，在 free 命令后面加上 `-l` 选项。

```
# free -l
             total       used       free     shared    buffers     cached
Mem:      32849392   25931336    6918056        188     182424   24632808
Low:      32849392   25931336    6918056
High:            0          0          0
-/+ buffers/cache:    1116104   31733288
Swap:     20970492          0   20970492
```

### 阅读关于 free 命令的更过信息

如果你想了解 free 命令的更多可用选项，只需查看其 man 手册。

```
# free --help
or
# man free
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/smem-linux-memory-usage-statistics-reporting-tool/
[2]:http://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/
[3]:http://www.2daygeek.com/author/magesh/
