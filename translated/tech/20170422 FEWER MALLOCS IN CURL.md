Curl 中的更少的 Malloc
===========================================================

![](https://daniel.haxx.se/blog/wp-content/uploads/2016/09/IMG_20160916_122707-1038x576.jpg)

今天我在 libcurl 内部又做了[一个小变化][4]，使其做更少的 malloc。这一次，泛型链表函数被转换成更少的 malloc (链表函数应该表现的方式，真的)。

### 研究 malloc

几周前我开始研究内存分配。这很容易，因为我们 curl 中已经有多年的内存调试和日志记录系统。使用 curl 的调试版本，并在我的构建目录中运行此脚本：

```
#!/bin/sh
export CURL_MEMDEBUG=$HOME/tmp/curlmem.log
./src/curl http://localhost
./tests/memanalyze.pl -v $HOME/tmp/curlmem.log
```

对于 curl 7.53.1，这大约有 115 次内存分配。这算多还是少？

内存日志非常基本。为了让你了解，这是一个示例代码片段：

```
MEM getinfo.c:70 free((nil))
MEM getinfo.c:73 free((nil))
MEM url.c:294 free((nil))
MEM url.c:297 strdup(0x559e7150d616) (24) = 0x559e73760f98
MEM url.c:294 free((nil))
MEM url.c:297 strdup(0x559e7150d62e) (22) = 0x559e73760fc8
MEM multi.c:302 calloc(1,480) = 0x559e73760ff8
MEM hash.c:75 malloc(224) = 0x559e737611f8
MEM hash.c:75 malloc(29152) = 0x559e737a2bc8
MEM hash.c:75 malloc(3104) = 0x559e737a9dc8
```

### 检查日志

然后，我对日志进行了更深入的研究，我意识到在相同的代码行做了许多小内存分配。我们显然有一些相当愚蠢的代码模式，我们将分配一个结构体，然后将该结构添加到链表或哈希，然后该代码随后再添加另一个小结构体和类似的代码，然后经常在循环中执行。（我在这里说的是_我们_，以避免责怪任何人，但当然我自己也有大部分的责任。。。）

这两个分配将总是成对发生，同时它们将被释放。我决定解决这些问题。做非常小的（小于 32 字节）的分配也是浪费的，因为非常多的数据将被用于跟踪那个微小的内存区域（在 malloc 系统内）。更不用说堆碎片了。

因此，将哈希和链表代码修复为不使用 malloc 是快速且简单的方法，它可以清除 20％ 以上的 malloc，以便进行简单的 “curl http://localhost” 传输。

此时，我根据大小对所有分配进行排序，并检查所有最小的分配。一个突出的部分是在 _curl_multi_wait()_ 中，它是一个典型的在 curl 
传输主循环中被反复调用的函数。对于大多数典型情况，我将其转换为[使用堆栈][5]。在大量重复的调用函数中避免 malloc 是一件好事。

### 重新计数

现在，如上面的脚本所示，相同的 “curl localhost” 命令从 curl 7.53.1 的 115 次分配下降到 80 个分配而没有牺牲任何东西。轻松地有 26％ 的改善。一点也不差！

由于我修改了 curl_multi_wait()，我也想看看它实际上是如何改进一些稍微更高级的传输。我使用了 [multi-double.c][6] 示例代码，添加了初始内存记录的调用，让它使用 curl_multi_wait()，并并行下载了这两个 URL：

```
http://www.example.com/
http://localhost/512M
```

第二个是 512 兆字节的零，第一个是一个 600 字节的公共 html 页面。这是[ count-malloc.c 代码][7]。

首先，我使用 7.53.1 来测试上面的例子，并使用 memaalyze 脚本检查：

```
Mallocs: 33901
Reallocs: 5
Callocs: 24
Strdups: 31
Wcsdups: 0
Frees: 33956
Allocations: 33961
Maximum allocated: 160385
```

好的，所以它总共使用了 160KB 的内存，分配次数超过 33,900 次。但是，它下载超过 512 兆字节的数据，所以它每 15KB 数据有一次 malloc。是好是坏？

回到 git master，现在是 7.54.1-DEV 的版本 - 因为我们不太确定当我们发布下一个版本时会变成哪个版本号。它可能是 7.54.1 或 7.55.0，它还尚未确定。我离题了，我再次运行相同修改的 multi-double.c 示例，再次在内存日志中运行 memaalyze，报告来了：

```
Mallocs: 69
Reallocs: 5
Callocs: 24
Strdups: 31
Wcsdups: 0
Frees: 124
Allocations: 129
Maximum allocated: 153247
```

我不得不看了两次。我做错什么了吗？为了仔细检查，我最好再运行一次。无论我运行多少次，结果还是一样的。

### 33,961 vs 129

在典型的传输中被调用了很多次，并且在传输过程中至少有一次进行内存分配，因此删除那个单一的微小分配对计数器有非常大的影响。正常的传输也会将数据添加或移移出链表并进行散列，但是它们现在也大都是无 malloc 的。简单地说：剩余的分配不会在传输循环中完成，所以它们的重要性不大。

以前的 curl 是当前对此示例分配数量的 263 倍。换句话说：新的是旧的分配数量的 0.37％

另外还有一点，新的内存总共减少了 7KB（4.3％）。

### malloc 重要吗？

在几千兆字节的 RAM 时代里，在传输中有几个 mallocs 真的对于普通人有显著的区别吗？对 512MB 数据完成的 33,832 个额外的 malloc 有什么影响？

为了衡量这些变化的影响，我决定比较本地主机的 HTTP 传输，看看是否可以看到任何速度差异。localhost 对于这个测试是很好的，因为没有网络速度限制，但更快的 curl 下载也越快。服务器端也会相同的快/慢，因为我将使用相同的集合进行这两个测试。

我相同方式构建了 curl 7.53.1 和 curl 7.54.1-DEV，并运行这个命令：

```
curl http://localhost/80GB -o /dev/null
```

它尽快地会将 80GB 的数据写到空设备中。

我获得的确切数字可能不是很有趣，因为它将取决于机器中的 CPU、使用的 HTTP 服务器、构建 curl 时的优化级别等，但是相关数字仍然应该是高度相关的。新代码 vs 旧代码。

7.54.1-DEV 反复表现更快 30％！我的早期版本是 2200MB/秒增加到当前版本的超过 2900 MB /秒。

这里要点当然不是说它很容易在我的机器上使用单一内核以超过 20GB/秒的速度传输 HTTP，因为实际上很少有用户可以通过 curl 快速传输。关键在于 curl 现在传输每字节使用较少的 CPU，这将使更多的 CPU 转移到系统的其余部分来执行任何需要做的事情。或者如果设备是便携式设备，那么可以省电。

关于 malloc 的成本：512MB 测试中我使用旧代码发生了 33832 次或更多的分配。旧代码以大约 2200MB/秒的速率传输 HTTP。这等于每秒 145,827 次 mallocs - 现在它们被删除了！一个 600 MB/秒的改进意味着 curl 每个 malloc 能比过去多传输 4300 字节。

### 去掉这些 malloc 难吗？

一点也不，非常直接。然而，有趣的是，在这个旧项目中，仍然有这样的变化空间。我有这个想法已经好几年了，我很高兴我终于花点时间来实现。感谢我们的测试套件，我可以有相当大的信心做这个“激烈的”内部变化，而不会引入太可怕的回归问题。由于我们的 API 很好地隐藏了内部，所以这种变化可以完全不改变任何旧的或新的应用程序。。

（是的，我还没在版本中发布变更，所以这还有风险，我不得不后悔我的“这很容易”的声明。。。）

### 注意数字

curl 的 git repo 从 7.53.1 到今天已经有 213 个提交。即使我不能想到任何更改，可能还会有一次或多次的提交，而不仅仅是内存分配对性能的影响。

### 更多信息？

还有其他类似的情况么？

也许。我们不会做很多性能测量或比较，所以谁知道，我们可能还会做更多的愚蠢的事情，我们可以停止做，并做得更好。我一直想做的一件事，但是从来没有这样做的是添加每天“监视”内存/mallocs，以及 curl 执行速度，以便更好地跟踪我们在这些方面不知不觉的倒退。

--------------------------------------------------------------------------------

via: https://daniel.haxx.se/blog/2017/04/22/fewer-mallocs-in-curl/

作者：[DANIEL STENBERG ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://daniel.haxx.se/blog/author/daniel/
[1]:https://daniel.haxx.se/blog/author/daniel/
[2]:https://daniel.haxx.se/blog/2017/04/22/fewer-mallocs-in-curl/
[3]:https://daniel.haxx.se/blog/2017/04/22/fewer-mallocs-in-curl/#comments
[4]:https://github.com/curl/curl/commit/cbae73e1dd95946597ea74ccb580c30f78e3fa73
[5]:https://github.com/curl/curl/commit/5f1163517e1597339d
[6]:https://github.com/curl/curl/commit/5f1163517e1597339d
[7]:https://gist.github.com/bagder/dc4a42cb561e791e470362da7ef731d3
