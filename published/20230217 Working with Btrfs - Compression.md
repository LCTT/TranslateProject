[#]: subject: "Working with Btrfs – Compression"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-compression/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "A2ureStone"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16299-1.html"

Btrfs 详解：压缩
======

![][0]

这篇文章将探索 Btrfs 中的透明文件系统压缩，以及它如何帮助节省存储空间。这篇文章是《Btrfs 详解》系列文章中的一篇。从 Fedora Linux 33 开始，Btrfs 就是 Fedora Workstation 和 Fedora Silverblue 的默认文件系统。

如果你错过了，这里是本系列的上一篇文章：[Btrfs 详解：快照][1]。

### 简介

很多人都经历过存储空间用完的情况。也许你想从互联网下载一个大文件，或者你需要快速从你的手机中复制些照片，然后操作突然失败。虽然存储空间成本正在稳步降低，但越来越多的设备要么制造时就是固定数量的存储容量，要么最终用户难以扩展其存储容量。

但当你的存储空间不足时你可以做什么呢？也许你会求助于云存储，或者你可以随身携带一些外部存储设备。

在这篇文章里我会研究该问题的另一种解决方案：透明的文件系统压缩，这是 Btrfs 的一个特性。理想情况下，这将解决你的存储问题，同时几乎不需要对你的系统进行修改！让我们来看看是如何做到的。

### 透明压缩的解释

首先，让我们来探寻 _透明_ 压缩是什么意思。你可以通过像 gzip、xz 或者 bzip2 这些压缩算法去压缩文件。这通常是显式操作：你利用一个压缩工具并且让它操作你的文件。虽然根据文件的内容，节约了空间，这有一个主要的缺点：当你想读取文件或者修改的时候，你得先解压缩。

这不仅是一个乏味的过程，而且也暂时打破了你之前节省的空间。再者，你最终解压了你不想访问的那部分文件内容。明显有比这更好的方法！

相反，透明压缩发生在文件系统级别。在这里，压缩的文件对用户看起来像常规的未压缩文件一样。但是，它们是被压缩后存储在硬盘上的。这之所以可行，是因为操作系统仅仅选择性地访问那部分文件，并且确保在向磁盘写入更新时再次压缩它们。

这里的压缩是透明的在于它不被用户感知，除了在文件访问时可能的 CPU 负载小量增加。因此，你可以应用在已有的系统而不是进行硬件修改或者求助于云存储。

### 压缩算法对比

Btrfs 提供了多个压缩算法的选择。出于技术原因它不能选用任意的压缩算法。它现在支持：

  * zstd
  * lzo
  * zlib

好消息是，由于透明压缩的工作原理，你不需要安装这些程序供 Btrfs 使用。在下面的文章里，你会看到如何去运行一个简单的性能测试来对比压缩算法。但是，为了运行性能测试，你必须安装必要的可执行文件。事后不需要留着它们，所以你将使用 Podman 容器来确保不会在系统中留下任何痕迹。

**注意** ：因为 Btrfs 使用的压缩依赖于内核对这些压缩算法的（重新）实现，用户空间版本的算法得出的结果应该认为是粗略估计。

因为一次次敲重复的命令是枯燥的工作，我已经在 Gitlab 上准备了一个可以运行的 Bash 脚本 （<https://gitlab.com/hartang/btrfs-compression-test>）。这会用上面提到的每个算法在不同的压缩级别运行一次简单的压缩和解压缩。

首先，下载脚本：

```
$ curl -LO https://gitlab.com/hartang/btrfs-compression-test/-/raw/main/btrfs_compression_test.sh
```

下一步，启动一个 Fedora Linux 容器去挂载你当前的工作目录，以便你可以和主机交换文件同时在那里运行脚本：

```
$ podman run --rm -it --security-opt label=disable -v "$PWD:$PWD" \
    -w "$PWD" registry.fedoraproject.org/fedora:37
```

最后运行脚本：

```
$ chmod +x ./btrfs_compression_test.sh
$ ./btrfs_compression_test.sh
```

在我机器上的输出是这样：

```
[INFO] Using file 'glibc-2.36.tar' as compression target
[INFO] Target file 'glibc-2.36.tar' not found, downloading now...
################################################################### 100.0%
[ OK ] Download successful!
[INFO] Copying 'glibc-2.36.tar' to '/tmp/tmp.vNBWYg1Vol/' for benchmark...
[INFO] Installing required utilities
[INFO] Testing compression for 'zlib'

    Level | Time (compress) | Compression Ratio | Time (decompress)
-------+-----------------+-------------------+-------------------
        1 |         0.322 s |          18.324 % |           0.659 s
        2 |         0.342 s |          17.738 % |           0.635 s
        3 |         0.473 s |          17.181 % |           0.647 s
        4 |         0.505 s |          16.101 % |           0.607 s
        5 |         0.640 s |          15.270 % |           0.590 s
        6 |         0.958 s |          14.858 % |           0.577 s
        7 |         1.198 s |          14.716 % |           0.561 s
        8 |         2.577 s |          14.619 % |           0.571 s
        9 |         3.114 s |          14.605 % |           0.570 s

[INFO] Testing compression for 'zstd'

    Level | Time (compress) | Compression Ratio | Time (decompress)
-------+-----------------+-------------------+-------------------
        1 |         0.492 s |          14.831 % |           0.313 s
        2 |         0.607 s |          14.008 % |           0.341 s
        3 |         0.709 s |          13.195 % |           0.318 s
        4 |         0.683 s |          13.108 % |           0.306 s
        5 |         1.300 s |          11.825 % |           0.292 s
        6 |         1.824 s |          11.298 % |           0.286 s
        7 |         2.215 s |          11.052 % |           0.284 s
        8 |         2.834 s |          10.619 % |           0.294 s
        9 |         3.079 s |          10.408 % |           0.272 s
       10 |         4.355 s |          10.254 % |           0.282 s
       11 |         6.161 s |          10.167 % |           0.283 s
       12 |         6.670 s |          10.165 % |           0.304 s
       13 |        12.471 s |          10.183 % |           0.279 s
       14 |        15.619 s |          10.075 % |           0.267 s
       15 |        21.387 s |           9.989 % |           0.270 s

[INFO] Testing compression for 'lzo'

    Level | Time (compress) | Compression Ratio | Time (decompress)
-------+-----------------+-------------------+-------------------
        1 |         0.447 s |          25.677 % |           0.438 s
        2 |         0.448 s |          25.582 % |           0.438 s
        3 |         0.444 s |          25.582 % |           0.441 s
        4 |         0.444 s |          25.582 % |           0.444 s
        5 |         0.445 s |          25.582 % |           0.453 s
        6 |         0.438 s |          25.582 % |           0.444 s
        7 |         8.990 s |          18.666 % |           0.410 s
        8 |        34.233 s |          18.463 % |           0.405 s
        9 |        41.328 s |          18.450 % |           0.426 s

[INFO] Cleaning up...
[ OK ] Benchmark complete!
```

重要的是在根据脚本得出的数据做决定之前注意这些事情：

  * 不是所有的文件压缩效果都一样好。像图片或电影这种已经压缩过的现代多媒体格式不会压缩得更小。
  * 脚本中压缩和解压缩各进行一次。重复运行会产生稍微不同的输出。因此，时间应该被理解为是估计，而不是准确的测量。

鉴于输出的数据，我决定在我的系统上使用压缩级别 3 的 zstd 压缩算法。依据你的需求，你可能想使用更高的压缩级别（比如，如果你存储设备相当的慢）。要估算可达到的读/写速度，可以将源存档大小（约 260MB）除以（解）压缩时间。

压缩测试默认是对 GNU libc 2.36 源码进行的。如果你想看看对指定文件的效果，你可以通过第一个参数传递文件路径给脚本。记住文件一定要可以在容器内访问才行。

如果你想要测试其他东西或者执行更加详细的测试，可以阅读脚本的源码，根据需要修改它。

### 配置 Btrfs 压缩

Btrfs 里的透明文件系统压缩可以通过几种方式配置：

  * 作为挂载文件系统的挂载选项（可用于相同 Btrfs 文件系统的所有子卷）
  * 通过 Btrfs 文件属性
  * 在 `btrfs filesystem defrag` 时（不是永久的，不在这里介绍）
  * 通过 `chattr` 文件属性接口（不在这里介绍）

我只会介绍其中前两个。

#### 在挂载时开启压缩

有一个 Btrfs 挂载选项可以开启文件压缩：

```
$ sudo mount -o compress=<ALGORITHM>:<LEVEL> ...
```

例如，去挂载一个文件系统，并使用等级 3 的 `ztsd` 算法去压缩，你可以写成：

```
$ sudo mount -o compress=zstd:3 ...
```

设置压缩等级是可选的。重要的是注意到 `compress` 挂载选项应用到整个 Btrfs 文件系统和它所有的子卷。此外，这是目前唯一支持的指定压缩等级的方式。

为了对文件系统的根应用压缩，必须在 `/etc/fstab` 上指定。例如，Fedora Linux 安装器，默认启用级别 1 的 `zstd` 压缩，在 `/etc/fstab` 里是这样：

```
$ cat /etc/fstab
[ ... ]
UUID=47b03671-39f1-43a7-b0a7-db733bfb47ff  /  btrfs   subvol=root,compress=zstd:1,[ ... ] 0 0
```

#### 启用单个文件压缩

另外一种方式指定压缩的方法是通过 Btrfs 文件系统属性。使用下面的命令去查看文件、目录或子卷的压缩设置：

```
$ btrfs property get <PATH> compression
```

类似的，你可以像这样配置压缩：

```
$ sudo btrfs property set <PATH> compression <VALUE>
```

例如，对在 `/etc` 下所有文件启用 `zlib` 压缩：

```
$ sudo btrfs property set /etc compression zlib
```

你可以通过 `man btrfs-property` 得到支持值的列表。记住这个接口不允许指定压缩级别。除此之外，如果设置了一个压缩属性，它会覆盖挂载时的其他压缩配置。

### 压缩已有文件

在这时，如果你对现有文件系统采用压缩，然后通过 `df` 或类似命令检查空间利用率，你会发现什么都没变。这是因为 Btrfs 自身不会 “重新压缩” 所有已有的文件。压缩只会发生在往磁盘写新数据的时候。有一些方式去执行显式的重压缩：

  1. 等待，什么都不做：只要文件被修改并被写回磁盘，Btrfs 根据配置压缩新写入的文件内容。如果我们等待足够长，越来越多的文件被重写，在某个时间点就会被压缩。
  2. 移动文件到另一个文件系统然后移动回来：取决于你想压缩哪些文件，这可能是相当乏味的选项。
  3. 执行一次 Btrfs 碎片整理。

最后一个选项可能是最方便的，但是它会对已经包含快照的 Btrfs 文件系统提出警告：它会破坏快照间的共享范围。换句话来说，两个快照间所有的共享内容，或者一个快照和它的父子卷，在碎片整理操作后将保存多份。

因此，如果你在你的文件系统里已经有很多快照，你不应该对整个文件系统运行碎片整理。这也没有必要，因为如果你想的话，Btrfs 可以对特定的目录或者单个文件进行碎片整理。

你可以使用以下命令去执行一次碎片整理：

```
$ sudo btrfs filesystem defragment -r /path/to/defragment
```

例如，你想像这样去整理你主目录的碎片：

```
$ sudo btrfs filesystem defragment -r "$HOME"
```

如果有疑问，最好从碎片整理单个大文件开始，并在监视文件系统上的可用空间的同时继续处理越来越大的目录。

### 测量文件系统压缩

有时，你可能会想，文件系统压缩为你节省了多少空间。但如何判断呢？首先，要知道一个 Btrfs 文件系统是否在挂载时启用了压缩，你可以使用以下命令：

```
$ findmnt -vno OPTIONS /path/to/mountpoint | grep compress
```

如果你得到了结果，那么给定挂载点的文件系统就使用了压缩！下一步，`compsize` 命令会告诉你你的文件需要多少空间：

```
$ sudo compsize -x /path/to/examine
```

在我的主目录，结果是这样：

```
$ sudo compsize -x "$HOME"
Processed 942853 files, 550658 regular extents (799985 refs), 462779 inline.
Type       Perc     Disk Usage   Uncompressed Referenced
TOTAL       81%       74G          91G         111G
none       100%       67G          67G          77G
zstd        28%      6.6G          23G          33G
```

每一行告诉你应用到文件的压缩 “类型” 。* `TOTAL` 是下面所有行的总计。
 
另一方面，这些列告诉你我们的文件需要多少空间：

  * `Disk Usage` 是实际分配在硬盘上的空间，
  * `Uncompressed` 是如果没有压缩，文件所需要的空间，
  * `Referenced` 是所有未压缩文件加起来的总大小。

`Referenced` 可以与数据 `Uncompressed` 不同，比如一个文件之前被重复了，或者有快照共享内容。在上面的例子，你可以看到在我的硬盘上总计 91 GB 的未压缩文件仅占据了 74 GB 的存储。取决于在目录里存储的文件类型和应用的压缩等级，这些数字可以有很大差异。

### 文件压缩的其它注意事项

Btrfs 使用启发式算法去探测压缩文件。这是因为压缩文件通常效果不好，所以没有必要浪费 CPU 周期去尝试进一步的压缩。为了这个目的，Btrfs 在写入压缩数据到磁盘之前测量压缩率。如果文件的第一部分压缩效果不好，文件被标记为不可压缩并且不会有后续的压缩。

如果出于某些原因，你想 Btrfs 压缩所有写入的数据，你可以通过 `compress-force` 选项挂载一个 Btrfs 文件系统，像这样：

```
$ sudo mount -o compress-force=zstd:3 ...
```

当像这样配置，Btrfs 会用等级 3 的 `zstd` 算法压缩所有写入磁盘的数据。

一个重要的注意事项是挂载一个有很多数据并开启压缩的 Btrfs 文件系统会比没开启压缩耗时更长。这是有技术上的原因的，而且这是一个不会影响文件系统操作的正常行为。

### 总结

本文详细介绍了 Btrfs 中的透明文件系统压缩。这是一种内置的、相对廉价的方法，可以在不需要修改的情况下从现有硬件中获得一些额外的存储空间。

本系列文章的下一篇将讨论：

- Qgroups - 限制文件系统大小
- RAID - 替换 mdadm 配置

（LCTT 译注：后继文章尚未发布，一旦发布我们会尽快翻译。）

如果你想了解与 Btrfs 相关的其他主题，请查看 Btrfs 维基 [^1] 和文档 [^2]。如果你还没有阅读本系列的前三篇文章，请不要忘记去看看！如果你觉得本文缺少某些内容，请在下面的评论中让我知道。我们下篇文章见！

### 参考资料

[^1]: <https://btrfs.wiki.kernel.org/index.php/Main_Page>
[^2]: <https://btrfs.readthedocs.io/en/latest/Introduction.html>

*（题图：MJ/1a45064c-8da5-4b60-87f2-9886d6a3299e）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-compression/

作者：[Andreas Hartmann][a]
选题：[lujun9972][b]
译者：[A2ureStone](https://github.com/A2ureStone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-16287-1.html
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: tmp.AcVqx2gIro#sources
[0]: https://img.linux.net.cn/data/attachment/album/202310/19/153401dyst48ybibpy3oyd.jpg