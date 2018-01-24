ftrace：跟踪你的内核函数！
============================================================

大家好！今天我们将去讨论一个调试工具：ftrace，之前我的博客上还没有讨论过它。还有什么能比一个新的调试工具更让人激动呢？

这个非常棒的 ftrace 并不是个新的工具！它大约在 Linux 的 2.6 内核版本中就有了，时间大约是在 2008 年。[这一篇是我用谷歌能找到的最早的文档][10]。因此，如果你是一个调试系统的“老手”，可能早就已经使用它了！

我知道，ftrace 已经存在了大约 2.5 年了（LCTT 译注：距本文初次写作时），但是还没有真正的去学习它。假设我明天要召开一个专题研究会，那么，关于 ftrace 应该讨论些什么？因此，今天是时间去讨论一下它了！

### 什么是 ftrace？

ftrace 是一个 Linux 内核特性，它可以让你去跟踪 Linux 内核的函数调用。为什么要这么做呢？好吧，假设你调试一个奇怪的问题，而你已经得到了你的内核版本中这个问题在源代码中的开始的位置，而你想知道这里到底发生了什么？

每次在调试的时候，我并不会经常去读内核源代码，但是，极个别的情况下会去读它！例如，本周在工作中，我有一个程序在内核中卡死了。查看到底是调用了什么函数，能够帮我更好的理解在内核中发生了什么，哪些系统涉及其中！（在我的那个案例中，它是虚拟内存系统）。

我认为 ftrace 是一个十分好用的工具（它肯定没有 `strace` 那样使用广泛，也比它难以使用），但是它还是值得你去学习。因此，让我们开始吧！

### 使用 ftrace 的第一步

不像 `strace` 和 `perf`，ftrace 并不是真正的 **程序** – 你不能只运行 `ftrace my_cool_function`。那样太容易了！

如果你去读 [使用 ftrace 调试内核][11]，它会告诉你从 `cd /sys/kernel/debug/tracing` 开始，然后做很多文件系统的操作。

对于我来说，这种办法太麻烦——一个使用 ftrace 的简单例子像是这样：

```
cd /sys/kernel/debug/tracing
echo function > current_tracer
echo do_page_fault > set_ftrace_filter
cat trace
```

这个文件系统是跟踪系统的接口（“给这些神奇的文件赋值，然后该发生的事情就会发生”）理论上看起来似乎可用，但是它不是我的首选方式。

幸运的是，ftrace 团队也考虑到这个并不友好的用户界面，因此，它有了一个更易于使用的界面，它就是 `trace-cmd`！！！`trace-cmd` 是一个带命令行参数的普通程序。我们后面将使用它！我在 LWN 上找到了一个 `trace-cmd` 的使用介绍：[trace-cmd:  Ftrace 的一个前端][12]。

### 开始使用 trace-cmd：让我们仅跟踪一个函数

首先，我需要去使用 `sudo apt-get install trace-cmd` 安装 `trace-cmd`，这一步很容易。

对于第一个 ftrace 的演示，我决定去了解我的内核如何去处理一个页面故障。当 Linux 分配内存时，它经常偷懒，（“你并不是_真的_计划去使用内存，对吗？”）。这意味着，当一个应用程序尝试去对分配给它的内存进行写入时，就会发生一个页面故障，而这个时候，内核才会真正的为应用程序去分配物理内存。

我们开始使用 `trace-cmd` 并让它跟踪 `do_page_fault` 函数！

```
$ sudo trace-cmd record -p function -l do_page_fault
  plugin 'function'
Hit Ctrl^C to stop recording
```

我将它运行了几秒钟，然后按下了 `Ctrl+C`。 让我大吃一惊的是，它竟然产生了一个 2.5MB 大小的名为 `trace.dat` 的跟踪文件。我们来看一下这个文件的内容！

```
$ sudo trace-cmd report
          chrome-15144 [000] 11446.466121: function:             do_page_fault
          chrome-15144 [000] 11446.467910: function:             do_page_fault
          chrome-15144 [000] 11446.469174: function:             do_page_fault
          chrome-15144 [000] 11446.474225: function:             do_page_fault
          chrome-15144 [000] 11446.474386: function:             do_page_fault
          chrome-15144 [000] 11446.478768: function:             do_page_fault
 CompositorTileW-15154 [001] 11446.480172: function:             do_page_fault
          chrome-1830  [003] 11446.486696: function:             do_page_fault
 CompositorTileW-15154 [001] 11446.488983: function:             do_page_fault
 CompositorTileW-15154 [001] 11446.489034: function:             do_page_fault
 CompositorTileW-15154 [001] 11446.489045: function:             do_page_fault

```

看起来很整洁 – 它展示了进程名（chrome）、进程 ID（15144）、CPU ID（000），以及它跟踪的函数。

通过察看整个文件，（`sudo trace-cmd report | grep chrome`）可以看到，我们跟踪了大约 1.5 秒，在这 1.5 秒的时间段内，Chrome 发生了大约 500 个页面故障。真是太酷了！这就是我们做的第一个 ftrace！

### 下一个 ftrace 技巧：我们来跟踪一个进程！

好吧，只看一个函数是有点无聊！假如我想知道一个程序中都发生了什么事情。我使用一个名为 Hugo 的静态站点生成器。看看内核为 Hugo 都做了些什么事情？

在我的电脑上 Hugo 的 PID 现在是 25314，因此，我使用如下的命令去记录所有的内核函数：

```
sudo trace-cmd record --help # I read the help!
sudo trace-cmd record -p function -P 25314 # record for PID 25314
```

`sudo trace-cmd report` 输出了 18,000 行。如果你对这些感兴趣，你可以看 [这里是所有的 18,000 行的输出][13]。

18,000 行太多了，因此，在这里仅摘录其中几行。

当系统调用 `clock_gettime` 运行的时候，都发生了什么：

```
 compat_SyS_clock_gettime
    SyS_clock_gettime
       clockid_to_kclock
       posix_clock_realtime_get
          getnstimeofday64
             __getnstimeofday64
                arch_counter_read
    __compat_put_timespec
```

这是与进程调试相关的一些东西：

```
 cpufreq_sched_irq_work
    wake_up_process
       try_to_wake_up
          _raw_spin_lock_irqsave
             do_raw_spin_lock
          _raw_spin_lock
             do_raw_spin_lock
          walt_ktime_clock
             ktime_get
                arch_counter_read
          walt_update_task_ravg
             exiting_task

```

虽然你可能还不理解它们是做什么的，但是，能够看到所有的这些函数调用也是件很酷的事情。

### “function graph” 跟踪

这里有另外一个模式，称为 `function_graph`。除了它既可以进入也可以退出一个函数外，其它的功能和函数跟踪器是一样的。[这里是那个跟踪器的输出][14]

```
sudo trace-cmd record -p function_graph -P 25314
```

同样，这里只是一个片断（这次来自 futex 代码）：

```
             |      futex_wake() {
             |        get_futex_key() {
             |          get_user_pages_fast() {
  1.458 us   |            __get_user_pages_fast();
  4.375 us   |          }
             |          __might_sleep() {
  0.292 us   |            ___might_sleep();
  2.333 us   |          }
  0.584 us   |          get_futex_key_refs();
             |          unlock_page() {
  0.291 us   |            page_waitqueue();
  0.583 us   |            __wake_up_bit();
  5.250 us   |          }
  0.583 us   |          put_page();
+ 24.208 us  |        }
```

我们看到在这个示例中，在 `futex_wake` 后面调用了 `get_futex_key`。这是在源代码中真实发生的事情吗？我们可以检查一下！！[这里是在 Linux 4.4 中 futex_wake 的定义][15] (我的内核版本是 4.4）。

为节省时间我直接贴出来，它的内容如下：

```
static int
futex_wake(u32 __user *uaddr, unsigned int flags, int nr_wake, u32 bitset)
{
	struct futex_hash_bucket *hb;
	struct futex_q *this, *next;
	union futex_key key = FUTEX_KEY_INIT;
	int ret;
	WAKE_Q(wake_q);

	if (!bitset)
		return -EINVAL;

	ret = get_futex_key(uaddr, flags & FLAGS_SHARED, &key, VERIFY_READ);
```

如你所见，在 `futex_wake` 中的第一个函数调用真的是 `get_futex_key`！ 太棒了！相比阅读内核代码，阅读函数跟踪肯定是更容易的找到结果的办法，并且让人高兴的是，还能看到所有的函数用了多长时间。

### 如何知道哪些函数可以被跟踪

如果你去运行 `sudo trace-cmd list -f`，你将得到一个你可以跟踪的函数的列表。它很简单但是也很重要。

### 最后一件事：事件！

现在，我们已经知道了怎么去跟踪内核中的函数，真是太酷了！

还有一类我们可以跟踪的东西！有些事件与我们的函数调用并不相符。例如，你可能想知道当一个程序被调度进入或者离开 CPU 时，都发生了什么事件！你可能想通过“盯着”函数调用计算出来，但是，我告诉你，不可行！

由于函数也为你提供了几种事件，因此，你可以看到当重要的事件发生时，都发生了什么事情。你可以使用 `sudo cat /sys/kernel/debug/tracing/available_events` 来查看这些事件的一个列表。 

我查看了全部的 sched_switch 事件。我并不完全知道 sched_switch 是什么，但是，我猜测它与调度有关。

```
sudo cat /sys/kernel/debug/tracing/available_events
sudo trace-cmd record -e sched:sched_switch
sudo trace-cmd report
```

输出如下：

```
 16169.624862:   Chrome_ChildIOT:24817 [112] S ==> chrome:15144 [120]
 16169.624992:   chrome:15144 [120] S ==> swapper/3:0 [120]
 16169.625202:   swapper/3:0 [120] R ==> Chrome_ChildIOT:24817 [112]
 16169.625251:   Chrome_ChildIOT:24817 [112] R ==> chrome:1561 [112]
 16169.625437:   chrome:1561 [112] S ==> chrome:15144 [120]

```

现在，可以很清楚地看到这些切换，从 PID 24817 -> 15144 -> kernel -> 24817 -> 1561 -> 15114。(所有的这些事件都发生在同一个 CPU 上）。

### ftrace 是如何工作的？

ftrace 是一个动态跟踪系统。当我们开始 ftrace 内核函数时，**函数的代码会被改变**。让我们假设去跟踪 `do_page_fault` 函数。内核将在那个函数的汇编代码中插入一些额外的指令，以便每次该函数被调用时去提示跟踪系统。内核之所以能够添加额外的指令的原因是，Linux 将额外的几个 NOP 指令编译进每个函数中，因此，当需要的时候，这里有添加跟踪代码的地方。

这是一个十分复杂的问题，因为，当不需要使用 ftrace 去跟踪我的内核时，它根本就不影响性能。而当我需要跟踪时，跟踪的函数越多，产生的开销就越大。

（或许有些是不对的，但是，我认为的 ftrace 就是这样工作的）

### 更容易地使用 ftrace：brendan gregg 的工具及 kernelshark

正如我们在文件中所讨论的，你需要去考虑很多的关于单个的内核函数/事件直接使用 ftrace 都做了些什么。能够做到这一点很酷！但是也需要做大量的工作！

Brendan Gregg （我们的 Linux 调试工具“大神”）有个工具仓库，它使用 ftrace 去提供关于像 I/O 延迟这样的各种事情的信息。这是它在 GitHub 上全部的 [perf-tools][16] 仓库。

这里有一个权衡，那就是这些工具易于使用，但是你被限制仅能用于 Brendan Gregg 认可并做到工具里面的方面。它包括了很多方面！:)

另一个工具是将 ftrace 的输出可视化，做的比较好的是 [kernelshark][17]。我还没有用过它，但是看起来似乎很有用。你可以使用 `sudo apt-get install kernelshark` 来安装它。

### 一个新的超能力

我很高兴能够花一些时间去学习 ftrace！对于任何内核工具，不同的内核版本有不同的功效，我希望有一天你能发现它很有用！

### ftrace 系列文章的一个索引

最后，这里是我找到的一些 ftrace 方面的文章。它们大部分在 LWN （Linux 新闻周刊）上，它是 Linux 的一个极好的资源（你可以购买一个 [订阅][18]！）

*   [使用 Ftrace 调试内核 - part 1][1] (Dec 2009, Steven Rostedt)
*   [使用 Ftrace 调试内核 - part 2][2] (Dec 2009, Steven Rostedt)
*   [Linux 函数跟踪器的秘密][3] (Jan 2010, Steven Rostedt)
*   [trace-cmd：Ftrace 的一个前端][4] (Oct 2010, Steven Rostedt)
*   [使用 KernelShark 去分析实时调试器][5] (2011, Steven Rostedt)
*   [Ftrace: 神秘的开关][6] (2014, Brendan Gregg)
*   内核文档：（它十分有用） [Documentation/ftrace.txt][7]
*   你能跟踪的事件的文档 [Documentation/events.txt][8]
*   linux 内核开发上的一些 ftrace 设计文档 （不是有用，而是有趣！) [Documentation/ftrace-design.txt][9]

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/03/19/getting-started-with-ftrace/

作者：[Julia Evans][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca
[1]:https://lwn.net/Articles/365835/
[2]:https://lwn.net/Articles/366796/
[3]:https://lwn.net/Articles/370423/
[4]:https://lwn.net/Articles/410200/
[5]:https://lwn.net/Articles/425583/
[6]:https://lwn.net/Articles/608497/
[7]:https://raw.githubusercontent.com/torvalds/linux/v4.4/Documentation/trace/ftrace.txt
[8]:https://raw.githubusercontent.com/torvalds/linux/v4.4/Documentation/trace/events.txt
[9]:https://raw.githubusercontent.com/torvalds/linux/v4.4/Documentation/trace/ftrace-design.txt
[10]:https://lwn.net/Articles/290277/
[11]:https://lwn.net/Articles/365835/
[12]:https://lwn.net/Articles/410200/
[13]:https://gist.githubusercontent.com/jvns/e5c2d640f7ec76ed9ed579be1de3312e/raw/78b8425436dc4bb5bb4fa76a4f85d5809f7d1ef2/trace-cmd-report.txt
[14]:https://gist.githubusercontent.com/jvns/f32e9b06bcd2f1f30998afdd93e4aaa5/raw/8154d9828bb895fd6c9b0ee062275055b3775101/function_graph.txt
[15]:https://github.com/torvalds/linux/blob/v4.4/kernel/futex.c#L1313-L1324
[16]:https://github.com/brendangregg/perf-tools
[17]:https://lwn.net/Articles/425583/
[18]:https://lwn.net/subscribe/Info
