[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11607-1.html)
[#]: subject: (Can Better Task Stealing Make Linux Faster?)
[#]: via: (https://www.linux.com/blog/can-better-task-stealing-make-linux-faster)
[#]: author: (Oracle )

更好的任务窃取可以使 Linux 更快吗？
======

![](https://img.linux.net.cn/data/attachment/album/201911/23/235729l71755he6e4mpvkq.jpg)

> Oracle Linux 内核开发人员 Steve Sistare 参与了这场有关内核调度程序改进的讨论。

### 通过可扩展的任务窃取进行负载平衡

Linux 任务调度程序通过将唤醒的任务推送到空闲的 CPU，以及在 CPU 空闲时从繁忙的 CPU 中拉取任务来平衡整个系统的负载。在大型系统上的推送侧和拉取侧，有效的伸缩都是挑战。对于拉取，调度程序搜索连续的更大范围中的所有 CPU，直到找到过载的 CPU，然后从最繁忙的组中拉取任务。这代价非常昂贵，在大型系统上要花费 10 到 100 微秒，因此搜索时间受到平均空闲时间的限制，并且某些范围不会被搜索。并非总能达到平衡，而且闲置的 CPU 依旧闲置。

我实现了一种备用机制，该机制在 `idle_balance()` 中的现有搜索中自身受限并且没有找到之后被调用。我维护了一个过载的 CPU 的位图，当可运行的 CFS 任务计数超过 1 时，CPU 会设置该位。这个位图是稀疏的，每个高速缓存线的有效位数量有限。当许多线程同时设置、清除和访问元素时，这可以减少缓存争用。每个末级缓存都有一个位图。当 CPU 空闲时，它将搜索该位图以查找第一个具有可迁移任务的过载 CPU，然后将其窃取。这种简单的窃取会比单独的 `idle_balance()` 产生更高的 CPU 利用率，因为该搜索的成本很便宜，花费 1 到 2 微秒，因此每次 CPU 即将空闲时都可以调用它。窃取不会减轻全局最繁忙的队列的负担，但是它比根本不执行任何操作要好得多。

### 结果

偷窃仅在调度程序代码中占用少量 CPU 开销即可提高利用率。在以下实验中，以不同数量的组（每个组 40 个任务）运行 hackbench，并对每次运行结果显示 `/proc/schedstat` 中的增量（按 CPU 平均），并增加了这些非标准的统计信息：

* `％find`：在旧函数和新函数中花费的时间百分比，这些函数用于搜索空闲的 CPU 和任务以窃取并设置过载的 CPU 位图。
* `steal`：任务从另一个 CPU 窃取的次数。经过的时间增加了 8％ 到 36％，最多增加了 0.4％ 的发现时间。

![load balancing][1]

​​如下图的绿色曲线所示，新内核的 CPU 繁忙利用率接近 100％，作为比较的基线内核是橙色曲线：
​​
![][3]

根据负载的不同，窃取可将 Oracle 数据库 OLTP 性能提高多达 9％，并且我们已经看到 MySQL、Pgsql、gcc、Java 和网络方面有了一些不错的改进。通常，窃取对上下文切换率高的工作负载最有帮助。

### 代码

截至撰写本文时，这项工作尚未完成，但最新的修补程序系列位于 [https://lkml.org/lkml/2018/12/6/1253][4]。如果你的内核是使用 `CONFIG_SCHED_DEBUG=y` 构建的，则可以使用以下命令验证其是否包含窃取优化：

```
# grep -q STEAL /sys/kernel/debug/sched_features && echo Yes
Yes
```

如果要尝试使用，请注意，对于具有 2 个以上 NUMA 节点的系统，禁用了窃取功能，因为 hackbench 在此类系统上发生了回归，正如我在 [https://lkml.org/lkml/2018/12/6/1250][5] 中解释的那样。但是，我怀疑这种影响是特定于 hackbench 的，并且窃取将有助于多节点系统上的其他工作负载。要尝试使用它，请用内核参数 `sched_steal_node_limit=8`（或更大）重新启动。

### 进一步工作

在将基本盗用算法推向上游之后，我正在考虑以下增强功能：

* 如果在末级缓存中进行窃取找不到候选者，在 LLC 和 NUMA 节点之间进行窃取。
* 维护稀疏位图以标识 RT 调度类中的偷窃候选者。当前 `pull_rt_task()` 搜索所有运行队列。
* 从 `idle_balance()` 中删除核心和套接字级别，因为窃取会处理这些级别。当支持跨 LLC 窃取时，完全删除 `idle_balance()`。
* 维护位图以标识空闲核心和空闲 CPU，以实现推平衡。

这篇文章最初发布于 [Oracle Developers Blog][6]。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/can-better-task-stealing-make-linux-faster

作者：[Oracle][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/oracle/
[b]: https://github.com/lujun9972
[1]: https://lcom.static.linuxfound.org/sites/lcom/files/linux-load-balancing.png (load balancing)
[3]: https://cdn.app.compendium.com/uploads/user/e7c690e8-6ff9-102a-ac6d-e4aebca50425/b7a700fe-edc3-4ea0-876a-c91e1850b59b/Image/00c074f4282bcbaf0c10dd153c5dfa76/steal_graph.png
[4]: https://lkml.org/lkml/2018/12/6/1253
[5]: https://lkml.org/lkml/2018/12/6/1250
[6]: https://blogs.oracle.com/linux/can-better-task-stealing-make-linux-faster
