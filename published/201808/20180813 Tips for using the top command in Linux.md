在 Linux 中使用 top 命令的建议
======

> 通过这篇教程提升你的 `top` 命令的知识。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

尝试找出你的机器正在运行什么程序，以及哪个进程耗尽了内存导致系统非常非常慢 —— 这是 `top` 命令所能胜任的工作。

`top` 是一个非常有用的程序，其作用类似于 Windows 任务管理器或 MacOS 的活动监视器。在 \*nix 机器上运行 `top` 将实时显示系统上运行的进程的情况。

```
$ top
```

取决于你运行的 `top` 版本，你会看到类似如下内容：

```
top - 08:31:32 up 1 day,  4:09,  0 users,  load average: 0.20, 0.12, 0.10
Tasks:   3 total,   1 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.5 us,  0.3 sy,  0.0 ni, 99.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   4042284 total,  2523744 used,  1518540 free,   263776 buffers
KiB Swap:  1048572 total,        0 used,  1048572 free.  1804264 cached Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    1 root      20   0   21964   3632   3124 S   0.0  0.1   0:00.23 bash
  193 root      20   0  123520  29636   8640 S   0.0  0.7   0:00.58 flask
  195 root      20   0   23608   2724   2400 R   0.0  0.1   0:00.21 top
```

你所用的 `top` 版本可能跟这个看起来不一样，特别是在显示的列上。

### 如何阅读输出的内容

你可以根据输出判断你正在运行的内容，但尝试去解释结果你可能会有些困惑。

前几行包含一堆统计信息（详细信息），后跟一个包含结果列的表（列）。让我们从后者开始吧。

#### 列

这些是系统正在运行的进程。默认按 CPU 使用率降序排序。这意味着在列表顶部的程序正使用更多的 CPU 资源并对你的系统造成更重的负担。对于资源使用而言，这些程序是字面上的消耗资源最多的（top）进程。不得不说，`top` 这个名字起得很妙。

最右边的 `COMMAND` 一列报告进程名（启动它们的命令）。在这个例子里，进程名是 `bash`（一个我们正在运行 `top` 的命令解释器）、`flask`（一个 Python 写的 web 框架）和 `top` 自身。

其它列提供了关于进程的有用信息：

* `PID`：进程 ID，一个用来定位进程的唯一标识符
* `USER`：运行进程的用户
* `PR`：任务的优先级
* `NI`：Nice 值，优先级的一个更好的表现形式
* `VIRT`：虚拟内存的大小，单位是 KiB（kibibytes）
* `RES`：常驻内存大小，单位是 KiB（物理内存和虚拟内存的一部分）
* `SHR`：共享内存大小，单位是 KiB（共享内存和虚拟内存的一部分）
* `S`：进程状态，一般 **I** 代表空闲，**R** 代表运行，**S** 代表休眠，**Z** 代表僵尸进程，**T** 或 **t** 代表停止（还有其它更少见的选项）
* `%CPU`：自从上次屏幕更新后的 CPU 使用率
* `%MEM`：自从上次屏幕更新后的 `RES` 常驻内存使用率
* `TIME+`：自从程序启动后总的 CPU 使用时间
* `COMMAND`：启动命令，如之前描述那样

确切知道 `VIRT`，`RES` 和 `SHR` 值代表什么在日常操作中并不重要。重要的是要知道 `VIRT` 值最高的进程就是内存使用最多的进程。当你在用 `top` 排查为什么你的电脑运行无比卡的时候，那个 `VIRT` 数值最大的进程就是元凶。如果你想要知道共享内存和物理内存的确切意思，请查阅 [top 手册][1]的 Linux Memory Types 段落。

是的，我说的是 kibibytes 而不是 kilobytes。通常称为 kilobyte 的 1024 值实际上是 kibibyte。希腊语的 kilo（χίλιοι）意思是一千（例如一千米是 1000 米，一千克是 1000 克）。Kibi 是 kilo 和 binary 的合成词，意思是 1024 字节（或者 2^10 ）。但是，因为这个词很难说，所以很多人在说 1024 字节的时候会说 kilobyte。`top` 试图在这里使用恰当的术语，所以按它说的理解就好。

#### 屏幕更新说明

实时屏幕更新是 Linux 程序可以做的 **非常酷** 的事之一。这意味着程序能实时更新它们显示的内容，所以看起来是动态的，即使它们用的是文本。非常酷！在我们的例子中，更新时间间隔很重要，因为一些统计数据（`%CPU` 和 `%MEM`）是基于上次屏幕更新的数值的。

因为我们运行在一个持久性的程序中，我们就可以输入一些命令来实时修改配置（而不是停止应用，然后用一个不同的命令行选项再次运行）。

按下 `h` 调用帮助界面，该界面也显示了默认延迟（屏幕更新的时间间隔）。这个值默认（大约）是 3 秒，但你可以输入 `d`（大概是 delay 的意思）或者 `s`（可能是 screen 或 seconds 的意思）来修改它。

#### 细节

在进程列表上面有一大堆有用的信息。有些细节看起来有点儿奇怪，让人困惑。但是一旦你花点儿时间来逐个过一遍，你会发现，在紧要关头，这些是非常有用的。

第一行包含系统的大致信息：

* `top`：我们正在运行 `top`！你好！`top`！
* `XX:YY:XX`：当前时间，每次屏幕更新的时候更新
* `up`（接下去是 `X day, YY:ZZ`）：系统的 [uptime][2]，或者自从系统启动后已经过去了多长时间
* `load average`（后跟三个数字）：分别是过去一分钟、五分钟、15 分钟的[系统负载][3]

第二行（`Task`）显示了正在运行的任务的信息，不用解释。它显示了进程总数和正在运行的、休眠中的、停止的进程数和僵尸进程数。这实际上是上述 `S`（状态）列的总和。

第三行（`%Cpu(s)`）显示了按类型划分的 CPU 使用情况。数据是屏幕刷新之间的值。这些值是：

* `us`：用户进程
* `sy`：系统进程
* `ni`：[nice][4] 用户进程
* `id`：CPU 的空闲时间，这个值比较高时说明系统比较空闲
* `wa`：等待时间，或者消耗在等待 I/O 完成的时间
* `hi`：消耗在硬件中断的时间
* `si`：消耗在软件中断的时间
* `st`：“虚拟机管理程序从该虚拟机窃取的时间”

你可以通过点击 `t`（toggle）来展开或折叠 `Task` 和 `%Cpu(s)` 行。

第四行（`Kib Mem`）和第五行（`KiB Swap`）提供了内存和交换空间的信息。这些数值是：

* 总内存容量
* 已用内存
* 空闲内存
* 内存的缓冲值
* 交换空间的缓存值

默认它们是用 KiB 为单位展示的，但是按下 `E`（扩展内存缩放 extend memory scaling）可以轮换不同的单位：KiB、MiB、GiB、TiB、PiB、EiB（kilobytes、megabytes、gigabytes、terabytes、petabytes 和 exabytes）

`top` 用户手册有更多选项和配置项信息。你可以运行 `man top` 来查看你系统上的文档。还有很多 [HTML 版的 man 手册][1]，但是请留意，这些手册可能是针对不同 top 版本的。

### 两个 top 的替代品

你不必总是用 `top` 查看系统状态。你可以根据你的情况用其它工具来协助排查问题，尤其是当你想要更图形化或更专业的界面的时候。

#### htop

`htop` 很像 `top`，但是它带来了一些非常有用的东西：它可以以图形界面展示 CPU 和内存使用情况。

![](https://opensource.com/sites/default/files/uploads/htop_preview.png)

这是我们在刚才运行 `top` 的同一环境中 `htop` 的样子。显示更简洁，但功能却很丰富。

任务统计、负载、uptime 和进程列表仍然在，但是它有了漂亮、彩色、动态的每核 CPU 使用情况，还有图形化的内存使用情况。

以下是不同颜色的含义（你也可以通过按下 `h` 来获得这些信息的帮助）。

CPU 任务优先级或类型：

* 蓝色：低优先级
* 绿色：正常优先级
* 红色：内核任务
* 蓝绿色：虚拟任务
* 条状图末尾的值是已用 CPU 的百分比

内存：

* 绿色：已经使用的内存
* 蓝色：缓冲的内存
* 黄色：缓存内存
* 条状图末尾的值显示已用内存和总内存

如果颜色对你没用，你可以运行 `htop -C` 来禁用它们；那样 `htop` 将使用不同的符号来展示 CPU 和内存类型。

它的底部有一组激活的快捷键提示，可以用来操作过滤结果或改变排序顺序。试着按一些快捷键看看它们能做什么。不过尝试 `F9` 时要小心，它会调出一个信号列表，这些信号会杀死（即停止）一个过程。我建议在生产环境之外探索这些选项。

`htop` 的作者 Hisham Muhammad（是的，`htop` 的名字就是源自 Hisham 的）在二月份的 [FOSDEM 2018][6] 做了一个[简短的演讲][5]。他阐述了 `htop` 不仅有简洁的图形界面，还有更现代的进程信息统计展示方式，这都是之前的工具（如 `top`）所不具备的。

你可以在[手册页面][7]或 [htop 网站][8]阅读更多关于 `htop` 的信息。（提示：网站背景是一个动态的 `htop`。）

#### docker stats

如果你在用 Docker，你可以运行 `docker stats` 来为容器状态生成一个有丰富上下文的界面。

这可能比 `top` 更有帮助，因为它不是按进程分类，而是按容器分类的。这点特别有用，当某个容器运行缓慢时，查看哪个容器耗资源最多比运行 `top` 再找到容器的进程要快。

借助于上面对 `top` 和 `htop` 术语的解释，你应该会更容易理解 `docker stats` 中的那些。然而，[docker stats 文档][9]对每一列都提供了详尽的描述。

---

via: https://opensource.com/article/18/8/top-tips-speed-up-computer

作者：[Katie McLaughlin][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ypingcn](https://github.com/ypingcn)
校对：[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[1]: http://man7.org/linux/man-pages/man1/top.1.html
[2]: https://en.wikipedia.org/wiki/Uptime
[3]: https://en.wikipedia.org/wiki/Load_(computing)
[4]: https://en.wikipedia.org/wiki/Nice_(Unix)#Etymology
[5]: https://www.youtube.com/watch?v=L25waVhy78o
[6]: https://fosdem.org/2018/schedule/event/htop/
[7]: https://linux.die.net/man/1/htop
[8]: https://hisham.hm/htop/index.php
[9]: https://docs.docker.com/engine/reference/commandline/stats/
