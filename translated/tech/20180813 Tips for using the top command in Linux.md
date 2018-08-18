在 Linux 中使用 top 命令的建议
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

尝试找出你的机器正在运行的是什么程序，以及哪个进程耗尽了内存导致运行非常非常慢——这些都是 `top` 命令所能胜任的任务。

`top` 是一个非常有用的程序，其作用类似于 Windows 任务管理器或 MacOS 的活动监视器。在 *nix 机器上运行 `top` 将显示系统上运行的进程的实时运行视图。

```
$ top
```

取决于你正在运行的 `top` 版本，你将获得如下所示的内容：

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

你可以根据输出判断您正在运行的内容，但尝试去解释结果你可能会有些困惑。

前几行包含一堆统计信息（详细信息），后跟一个包含结果列表的表（列表）。 让我们从后者开始吧。

### 列表

这些是正运行在系统上的进程。默认按 CPU 使用率降序排序。这意味着在列表顶部的程序正使用更多的 CPU 资源和对你的系统造成更重的负担。对于资源使用而言，这些程序是字面上的消耗最多（top）进程。你必须承认，`top` 程序名字起得很妙。

最右边的`COMMAND`一列报告进程名（你用来启动它们的命令）。在这个例子里，进程名是`bash` （一个我们正在运行 `top` 的命令解释器）、`flask`（一个 Python 写的 web 框架） 和 `top` 自身。

其他列提供了关于进程的有效信息。

* `PID`: 进程 ID，一个用来定位进程的唯一标识符
* `USER`:运行进程的用户
* `PR`: 任务的优先度
* `NI`: 优先度的一个更好的表现形式
* `VIRT`: 虚拟内存的大小 单位是 Kib(kibibytes)
* `RES`: 常驻内存大小 单位是 KiB (物理内存和虚拟内存的一部分)
* `SHR`: 共享内存大小 单位是 KiB(共享内存和虚拟内存的一部分)
* `S`: 进程状态, 一般 **I** 代表空闲，**R** 代表运行，**S** 代表休眠，, **Z** 代表僵尸进程，, **T** or **t** 代表停止（还有其他更少见的选项）
* `%CPU`: 自从上次屏幕结果更新后的 CPU 使用率
* `%MEM`: 自从上次屏幕更新后的`RES`常驻内存使用率
* `TIME+`: 自从程序开始后总的 CPU 使用时间
* `COMMAND`: 启动命令，如之前描述那样

确切知道 `VIRT` , `RES` 和 `SHR` 值代表什么在日常操作中并不重要。重要的事情是知道`VIRT` 值最高的那个进程是那个使用最多内存的进程。如果你在用 `top` 找为什么你的电脑运行慢得就像行走在糖蜜池时，那个`VIRT` 数值最大的进程就是元凶。如果你想要知道共享内存和物理内存的确切意思，请查阅[ top 手册][1]的 Linux 内存类型。

是的，我说的是  kibibytes 而不是 kilobytes。通常称为  kilobyte 的1024值实际上是 kibibyte 。 希腊语的 kilo  ("χίλιοι") 意思是一千或者千（例如一千米是 1000 米，一千克是 1000 克）。Kibi 是 kilo 和 byte 的合成词，意思是 1024 字节（或者 210 ）。但是，因为这个词很难说，所以很多人在说 1024 字节的时候会说  kilobyte。所有这些意味着 `top` 试图在这里使用恰当的术语，所以随它去吧。

#### 屏幕更新说明

实时屏幕更新是 Linux 程序可以做的 ** 非常酷 ** 的事情之一。这意味着程序能实时更新它们显示的内容，所以看起来很生动，即使它们使用的是文本。非常酷！在我们的例子里，更新之间的时间是重要的，因为我们的一些数据（`%CPU` 和 `%MEM`）是基于上次屏幕更新的数值的。

因为我们正在运行一个持续的应用，我们能按下按键命令对设置或者配置进行实时的修改（也就是说，关闭应用，然后用一个不同的命令行标志位来再次运行该应用）。

按下 `h` 调用帮助界面，界面也显示默认延迟（屏幕更新的时间间隔）。这个值默认（大约）是3秒，但是你能输入 `d` （大概是延迟 delay 的意思） 或者 `s` （可能是屏幕 screen 或者秒 seconds 的意识） 来修改这个默认值。

#### 细节

在上面的进程列表里有一大堆有用的信息。有些细节看起来奇怪，令人感到困惑。但是一旦你花一些时间来逐个过一遍，你会发现，在紧要关头，这些是非常有用的数据。

第一行包含系统的大致信息

* `top`:我们正在运行 `top`！你好！ `top`！
* `XX:YY:XX`: 当前时间，每次屏幕更新的时候更新
* `up` （接下去是`X day, YY:ZZ`）: 系统的 [正常运行时间][2]，或者自从系统启动后已经过去了多长时间
* `load average` （接下去是三个数字）： 分别是过去 一分钟、五分钟、15分钟的 [系统负载][3]

第二行 （`Task`）显示了正在运行的任务的信息，不用解释。它显示了进程总数和正在运行的、休眠中的、停止的进程数和僵尸进程数。这实际上是上述 `S` （状态）列的总和。

第三行（`%Cpu(s)`）显示了按类型划分的 CPU 使用情况。数据是屏幕刷新之间的值。这些值是: 

* `us`: 用户进程
* `sy`: 系统进程
* `ni`: [nice][4] 用户进程
* `id`: CPU 的闲置时间， 高闲置时间意味着除此之外不会有太多事情发生
* `wa`: 等待时间，或者花在等待 I/O 完成的时间
* `hi`: 花在硬件中断的时间
* `si`: 花在软件中断的时间
* `st`: “虚拟机管理程序从该虚拟机窃取的时间”

你能通过点击`t` （触发 toggle 的意思）来展开 `Task` 和`%Cpu(s)` 列。

第四行（`Kib Mem`）和第五行（`KiB Swap`）提供了内存和交换空间的信息。这些数值是：

* `total`
* `used`
* `free`

还有：

* 内存的缓冲值
* 交换空间的缓存值

默认它们是用 KiB 为单位展示的，但是按下 `E` （扩展内存缩放 extend memory scaling 的意思）能在不同的数值轮换：KiB 、MiB、 GiB、 TiB、 PiB、 EiB （kilobytes, megabytes, gigabytes, terabytes, petabytes, 和 exabytes，它们真正的名字）

`top` 用户手册甚至显示了关于有效标志位和配置的更多信息。 你能运行 `man top` 来找到你系统上的文档。有不同的网页显示 [HTML 版的手册][1]，但是请留意，这些手册可能是给不同 top 版本看的。

### 两个 top 的替代品

你不必总是用 `top` 来理解发生了什么。根据您的情况，其他工具可能会帮助您诊断问题，尤其是当您想要更图形化或专业的界面时。

#### htop

`htop` 很像 `top` ，但是它给表格带来了一些非常有用的东西: CPU 和内存使用的图形表示。

![](https://opensource.com/sites/default/files/uploads/htop_preview.png)

这就是我们在 `top` 中考察的环境在`htop` 中的样子。显示要简单得多，但仍有丰富的功能。

我们的任务计数、负载、正常运行时间和进程列表仍然存在，但是我们获得了每个内核CPU使用情况的漂亮、彩色、动画视图和内存使用情况图表。

以下是不同颜色的含义(你也可以通过按“h”来获得这些信息，以获得“帮助”)。

CPU任务优先级或类型：

* 蓝色:低优先级
* 绿色:正常优先级
* 红色:核心任务
* 蓝色:虚拟化任务
* 条形末尾的值是已用CPU的百分比

内存：

* 绿色：已经使用的内存 
* 蓝色：缓冲的内存 
* 黄色：缓存内存 
* 条形图末尾的值显示已用内存和总内存 

如果颜色对你没用，你可以运行 `htop - C` 来禁用它们；否则，`htop` 将使用不同的符号来分隔CPU和内存类型。 

在底部，有一个有效功能键的提示，你可以用它来过滤结果或改变排序顺序。 尝试一些命令，看看它们能做什么。只是尝试 `F9` 时要小心。 这将会产生一个信号列表，这些信号会杀死(即停止)一个过程。 我建议在生产环境之外探索这些选项。 

`htop` 的作者，Hisham Muhammad （是的，用 Hisham 命名的 `htop`）在二月份 的 [FOSDEM 2018][6]  就 [lightning talk][5] 做了一个展示。他解释 `htop` 是如何不仅有清晰的图形，还用更现代化的统计信息展示进程信息，这都是之前的工具 `top` 所不具备的。

你可以在 [手册页面][7] 或 [htop 网站][8] 阅读更多关于 `htop` 的信息。（警告:网站包含动画背景`htop`。)

#### docker stats

如果你正在用 Docker工作，你可以运行 `docker stats`来生成一个丰富的上下文来表示你的容器在做什么。

这可能比 `top` 更有帮助，因为您不是按进程分类，而是按容器分类。当容器运行缓慢时，这一点特别有用，因为查看哪个容器使用的资源最多比运行 `top` 和试图将进程映射到容器要快。

上面对 `top` 和 `htop` 中首字母缩略词和描述符的解释应该会让你更容易理解 `docker stats` 中的那些。然而，[docker stats 文档] [9]对每一栏都提供了有用的描述。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/top-tips-speed-up-computer

作者：[Katie McLaughlin][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ypingcn](https://github.com/ypingcn)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/glasnt
[1]:http://man7.org/linux/man-pages/man1/top.1.html
[2]:https://en.wikipedia.org/wiki/Uptime
[3]:https://en.wikipedia.org/wiki/Load_(computing)
[4]:https://en.wikipedia.org/wiki/Nice_(Unix)#Etymology
[5]:https://www.youtube.com/watch?v=L25waVhy78o
[6]:https://fosdem.org/2018/schedule/event/htop/
[7]:https://linux.die.net/man/1/htop
[8]:https://hisham.hm/htop/index.php
[9]:https://docs.docker.com/engine/reference/commandline/stats/
