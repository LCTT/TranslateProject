使用 Ftrace 跟踪内核
============================================================

标签： [ftrace][8]，[kernel][9]，[kernel profiling][10]，[kernel tracing][11]，[linux][12]，[tracepoints][13]

![](https://blog.selectel.com/wp-content/uploads/2017/04/PR-1801-2-2.png)

在内核级别上分析事件有很多的工具：[SystemTap][14]，[ktap][15]，[Sysdig][16]，[LTTNG][17]等等，并且你也可以在网络上找到关于这些工具的大量介绍文章和资料。

而对于使用 Linux 原生机制去跟踪系统事件以及检索/分析故障信息的方面的资料却很少找的到。这就是 [ftrace][18]，它是添加到内核中的第一款跟踪工具，今天我们来看一下它都能做什么，让我们从它的一些重要术语开始吧。

### 内核跟踪和分析

内核分析可以发现性能“瓶颈”。分析能够帮我们发现在一个程序中性能损失的准确位置。特定的程序生成一个概述 — 一个事件的总结 — 它能够用于帮我们找出哪个函数占用了大量的运行时间。尽管这些程序并不能识别出为什么会损失性能。

瓶颈经常发生在无法通过分析来识别的情况下。去推断出为什么会发生事件，去保存发生事件时的相关上下文，这就需要去跟踪。

跟踪可以理解为在一个正常工作的系统上活动的信息收集进程。它使用特定的工具来完成这项工作，就像录音机来记录声音一样，用它来记录各种注册的系统事件。

跟踪程序能够同时跟踪应用级和操作系统级的事件。它们收集的信息能够用于诊断多种系统问题。

有时候会将跟踪与日志比较。它们两者确时很相似，但是也有不同的地方。

对于跟踪，记录的信息都是些低级别事件。它们的数量是成百上千的，甚至是成千上万的。对于日志，记录的信息都是些高级别事件，数量上通常少多了。这些包含用户登陆系统、应用程序错误、数据库事务等等。

就像日志一样，跟踪数据可以被原样读取，但是用特定的应用程序提取的信息更有用。所有的跟踪程序都能这样做。

在内核跟踪和分析方面，Linux 内核有三个主要的机制：

*   跟踪点 —— 一种基于静态测试代码的工作机制

*   探针 —— 一种动态跟踪机制，用于在任意时刻中断内核代码的运行，调用它自己的处理程序，在完成需要的操作之后再返回。

*   perf_events —— 一个访问 PMU（性能监视单元）的接口

我并不想在这里写关于这些机制方面的内容，任何对它们感兴趣的人可以去访问 [Brendan Gregg 的博客][19]。

使用 ftrace，我们可以与这些机制进行交互，并可以从用户空间直接得到调试信息。下面我们将讨论这方面的详细内容。示例中的所有命令行都是在内核版本为 3.13.0-24 的 Ubuntu 14.04 中运行的。

### Ftrace：常用信息

Ftrace 是函数 Trace 的简写，但它能做的远不止这些：它可以跟踪上下文切换、测量进程阻塞时间、计算高优先级任务的活动时间等等。

Ftrace 是由 Steven Rostedt 开发的，从 2008 年发布的内核 2.6.27 中开始就内置了。这是为记录数据提供的一个调试 `Ring` 缓冲区的框架。这些数据由集成到内核中的跟踪程序来采集。

Ftrace 工作在 debugfs 文件系统上，这是在大多数现代 Linux 分发版中默认挂载的文件系统。为开始使用 ftrace，你将进入到 `sys/kernel/debug/tracing` 目录（仅对 root 用户可用）：

```
# cd /sys/kernel/debug/tracing
```

这个目录的内容看起来应该像这样：

```
аvailable_filter_functions  options         	stack_trace_filter
available_tracers       	per_cpu         	trace
buffer_size_kb          	printk_formats  	trace_clock
buffer_total_size_kb    	README          	trace_marker
current_tracer          	saved_cmdlines  	trace_options
dyn_ftrace_total_info   	set_event       	trace_pipe
enabled_functions       	set_ftrace_filter   trace_stat
events                  	set_ftrace_notrace  tracing_cpumask
free_buffer             	set_ftrace_pid  	tracing_max_latency
function_profile_enabled	set_graph_function  tracing_on
instances               	set_graph_notrace   tracing_thresh
kprobe_events           	snapshot        	uprobe_events
kprobe_profile          	stack_max_size  	uprobe_profile
```

我不想去描述这些文件和子目录；它们的描述在 [官方文档][20] 中已经写的很详细了。我只想去详细介绍与我们这篇文章相关的这几个文件：

*   available_tracers —— 可用的跟踪程序

*   current_tracer —— 正在运行的跟踪程序

*   tracing_on —— 负责启用或禁用数据写入到 `Ring` 缓冲区的系统文件（如果启用它，在文件中添加数字 1，禁用它，添加数字 0）

*   trace —— 以人类友好格式保存跟踪数据的文件

### 可用的跟踪程序

我们可以使用如下的命令去查看可用的跟踪程序的一个列表

```
root@andrei:/sys/kernel/debug/tracing#: cat available_tracers
blk mmiotrace function_graph wakeup_rt wakeup function nop
```

我们来快速浏览一下每个跟踪程序的特性：

*   function —— 一个无需参数的函数调用跟踪程序

*   function_graph —— 一个使用子调用的函数调用跟踪程序

*   blk —— 一个与块 I/O 跟踪相关的调用和事件跟踪程序（它是 blktrace 的用途）

*   mmiotrace —— 一个内存映射 I/O 操作跟踪程序

*   nop —— 简化的跟踪程序，就像它的名字所暗示的那样，它不做任何事情（尽管在某些情况下可能会派上用场，我们将在后文中详细解释）

### 函数跟踪程序

在开始介绍函数跟踪程序 ftrace 之前，我们先看一下测试脚本：

```
#!/bin/sh

dir=/sys/kernel/debug/tracing

sysctl kernel.ftrace_enabled=1
echo function > ${dir}/current_tracer
echo 1 > ${dir}/tracing_on
sleep 1
echo 0 > ${dir}/tracing_on
less ${dir}/trace
```

这个脚本是非常简单的，但是还有几个需要注意的地方。命令 `sysctl ftrace.enabled=1` 启用了函数跟踪程序。然后我们通过写它的名字到 `current_tracer` 文件来启用 `current tracer`。

接下来，我们写入一个 `1` 到 `tracing_on`，它启用了 `Ring` 缓冲区。这些语法都要求在 `1` 和 `>` 符号前后有一个空格；写成像 `echo1> tracing_on` 这样将不能工作。一行之后我们禁用它（如果 `0` 写入到 `tracing_on`， 缓冲区不会被清除并且 ftrace 并不会被禁用）。

我们为什么这样做呢？在两个 `echo` 命令之间，我们看到了命令 `sleep 1`。我们启用了缓冲区，运行了这个命令，然后禁用它。这将使跟踪程序采集了这个命令运行期间发生的所有系统调用的信息。

在脚本的最后一行，我们写了一个在控制台上显示跟踪数据的命令。

一旦脚本运行完成后，我们将看到下列的输出（这里只列出了一个小片断）：

```
# tracer: function
#
# entries-in-buffer/entries-written: 29571/29571   #P:2
#
#                          	_-----=> irqs-off
#                         	/ _----=> need-resched
#                        	| / _---=> hardirq/softirq
#                        	|| / _--=> preempt-depth
#                        	||| / 	delay
#       	TASK-PID   CPU#  ||||	TIMESTAMP  FUNCTION
#          	| |   	|   ||||   	|     	|
        trace.sh-1295  [000] ....	90.502874: mutex_unlock <-rb_simple_write
        trace.sh-1295  [000] ....	90.502875: __fsnotify_parent <-vfs_write
        trace.sh-1295  [000] ....	90.502876: fsnotify <-vfs_write
        trace.sh-1295  [000] ....	90.502876: __srcu_read_lock <-fsnotify
        trace.sh-1295  [000] ....	90.502876: __srcu_read_unlock <-fsnotify
        trace.sh-1295  [000] ....	90.502877: __sb_end_write <-vfs_write
        trace.sh-1295  [000] ....	90.502877: syscall_trace_leave <-int_check_syscall_exit_work
        trace.sh-1295  [000] ....	90.502878: context_tracking_user_exit <-syscall_trace_leave
        trace.sh-1295  [000] ....	90.502878: context_tracking_user_enter <-syscall_trace_leave
        trace.sh-1295  [000] d...	90.502878: vtime_user_enter <-context_tracking_user_enter
        trace.sh-1295  [000] d...	90.502878: _raw_spin_lock <-vtime_user_enter
        trace.sh-1295  [000] d...	90.502878: __vtime_account_system <-vtime_user_enter
        trace.sh-1295  [000] d...	90.502878: get_vtime_delta <-__vtime_account_system
        trace.sh-1295  [000] d...	90.502879: account_system_time <-__vtime_account_system
        trace.sh-1295  [000] d...	90.502879: cpuacct_account_field <-account_system_time
        trace.sh-1295  [000] d...	90.502879: acct_account_cputime <-account_system_time
        trace.sh-1295  [000] d...	90.502879: __acct_update_integrals <-acct_account_cputime
```

这个输出以缓冲区中的信息条目数量和写入的条目数量开始。这两者的数据差异是缓冲区中事件的丢失数量（在我们的示例中没有发生丢失）。

在这里有一个包含下列信息的函数列表：

*   进程标识符（PID）

*   运行这个进程的 CPU（CPU#）

*   进程开始时间（TIMESTAMP）

*   被跟踪函数的名字以及调用它的父级函数；例如，在我们输出的第一行，`rb_simple_write` 调用了 `mutex-unlock` 函数。

### Function_graph 跟踪程序

`function_graph` 跟踪程序的工作和函数一样，但是它更详细：它显示了每个函数的进入和退出点。使用这个跟踪程序，我们可以跟踪函数的子调用并且测量每个函数的运行时间。

我们来编辑一下最后一个示例的脚本：

```
#!/bin/sh

dir=/sys/kernel/debug/tracing

sysctl kernel.ftrace_enabled=1
echo function_graph > ${dir}/current_tracer
echo 1 > ${dir}/tracing_on
sleep 1
echo 0 > ${dir}/tracing_on
less ${dir}/trace
```

运行这个脚本之后，我们将得到如下的输出：

```
# tracer: function_graph
#
# CPU  DURATION              	FUNCTION CALLS
# | 	|   |                 	|   |   |   |
 0)   0.120 us	|                              	} /* resched_task */
 0)   1.877 us	|                            	} /* check_preempt_curr */
 0)   4.264 us	|                          	} /* ttwu_do_wakeup */
 0) + 29.053 us   |                        	} /* ttwu_do_activate.constprop.74 */
 0)   0.091 us	|                        	_raw_spin_unlock();
 0)   0.260 us	|                        	ttwu_stat();
 0)   0.133 us	|                        	_raw_spin_unlock_irqrestore();
 0) + 37.785 us   |                      	} /* try_to_wake_up */
 0) + 38.478 us   |                    	} /* default_wake_function */
 0) + 39.203 us   |                  	} /* pollwake */
 0) + 40.793 us   |                	} /* __wake_up_common */
 0)   0.104 us	|                	_raw_spin_unlock_irqrestore();
 0) + 42.920 us   |              	} /* __wake_up_sync_key */
 0) + 44.160 us   |            	} /* sock_def_readable */
 0) ! 192.850 us  |          	} /* tcp_rcv_established */
 0) ! 197.445 us  |        	} /* tcp_v4_do_rcv */
 0)   0.113 us	|        	_raw_spin_unlock();
 0) ! 205.655 us  |      	} /* tcp_v4_rcv */
 0) ! 208.154 us  |    	} /* ip_local_deliver_finish */
```

在这个图中，`DURATION` 展示了花费在每个运行的函数上的时间。注意使用 `+` 和 `!` 符号标记的地方。加号（+）意思是这个函数花费的时间超过 10 毫秒；而感叹号（！）意思是这个函数花费的时间超过了 100 毫秒。

在 `FUNCTION_CALLS` 下面，我们可以看到每个函数调用的信息。

和 C 语言一样使用了花括号（{）标记每个函数的边界，它展示了每个函数的开始和结束，一个用于开始，一个用于结束；不能调用其它任何函数的叶子函数用一个分号（；）标记。

### 函数过滤器

ftrace 输出可能会很大，精确找出你所需要的内容可能会非常困难。我们可以使用过滤器去简化我们的搜索：输出中将只显示与我们感兴趣的函数相关的信息。为实现过滤，我们只需要在 `set_ftrace_filter` 文件中写入我们需要过滤的函数的名字即可。例如：

```
root@andrei:/sys/kernel/debug/tracing# echo kfree > set_ftrace_filter
```

如果禁用过滤器，我们只需要在这个文件中添加一个空白行即可：

```
root@andrei:/sys/kernel/debug/tracing# echo  > set_ftrace_filter
```

通过运行这个命令：

```
root@andrei:/sys/kernel/debug/tracing# echo kfree > set_ftrace_notrace 
```

我们将得到相反的结果：输出将包含除了 `kfree()` 以外的任何函数的信息。

另一个有用的选项是 `set_ftrace_pid`。它是为在一个特定的进程运行期间调用跟踪函数准备的。

ftrace 还有很多过滤选项。对于它们更详细的介绍，你可以去查看 Steven Rostedt 在 [LWN.net][21] 上的文章。

### 跟踪事件

我们在上面提到到跟踪点机制。跟踪点是插入的由系统事件触发的特定代码。跟踪点可以是动态的（意味着可能会在它们上面附加几个检查），也可以是静态的（意味着不会附加任何检查）。

静态跟踪点不会对系统有任何影响；它们只是增加几个字节用于调用测试函数以及在一个独立的节上增加一个数据结构。

当相关代码片断运行时，动态跟踪点调用一个跟踪函数。跟踪数据是写入到 `Ring` 缓冲区。

跟踪点可以设置在代码的任何位置；事实上，它们确实可以在许多的内核函数中找到。我们来看一下 `kmem_cache_alloc` 函数（它在 [这里][22]）：

```
{
    void *ret = slab_alloc(cachep, flags, _RET_IP_);

    trace_kmem_cache_alloc(_RET_IP_, ret,
                            cachep->object_size, cachep->size, flags);
         return ret;
         }
```

`trace_kmem_cache_alloc` 它本身就是一个跟踪点。我们可以通过查看其它内核函数的源代码找到这样无数的例子。

在 Linux 内核中为了从用户空间使用跟踪点，它有一个专门的 API。在 `/sys/kernel/debug/tracing` 目录中，这里有一个事件目录，它是为了保存系统事件。这些只是为了跟踪系统事件。在这个上下文中系统事件可以理解为包含在内核中的跟踪点。

可以通过运行如下的命令来查看这个事件列表：

```
root@andrei:/sys/kernel/debug/tracing# cat available_events
```

这个命令将在控制台中输出一个很长的列表。这样看起来很不方便。我们可以使用如下的命令来列出一个结构化的列表：

```
root@andrei:/sys/kernel/debug/tracing# ls events

block         	gpio      	mce  	random    	skb   	vsyscall
btrfs         	header_event  migrate  ras       	sock  	workqueue
compaction    	header_page   module   raw_syscalls  spi   	writeback
context_tracking  iommu     	napi 	rcu       	swiotlb   xen
enable        	irq       	net  	regmap    	syscalls  xfs
exceptions    	irq_vectors   nmi  	regulator 	task  	xhci-hcd
ext4          	jbd2      	oom  	rpm       	timer
filemap       	kmem      	pagemap  sched     	udp
fs            	kvm       	power	scsi      	vfs
ftrace        	kvmmmu    	printk   signal    	vmscan
```

所有可能的事件都按子系统分组到子目录中。在我们开始跟踪事件之前，我们要先确保启用了 `Ring` 缓冲区写入：

```
root@andrei:/sys/kernel/debug/tracing# cat tracing_on
```

如果在控制台中显示的是数字 0，那么，我们可以运行如下的命令来启用它：

```
root@andrei:/sys/kernel/debug/tracing# echo 1 > tracing_on
```

在我们上一篇的文章中，我们写了关于 `chroot()` 系统调用的内容；我们来跟踪访问一下这个系统调用。为了跟踪，我们使用 `nop` 因为函数跟踪程序和 `function_graph` 跟踪程序记录的信息太多，它包含了我们不感兴趣的事件信息。

```
root@andrei:/sys/kernel/debug/tracing# echo nop > current_tracer
```

所有事件相关的系统调用都保存在系统调用目录下。在这里我们将找到一个进入和退出多个系统调用的目录。我们需要在相关的文件中通过写入数字 `1` 来激活跟踪点：

```
root@andrei:/sys/kernel/debug/tracing# echo 1 > events/syscalls/sys_enter_chroot/enable
```

然后我们使用 `chroot` 来创建一个独立的文件系统（更多内容，请查看 [这篇文章][23]）。在我们执行完我们需要的命令之后，我们将禁用跟踪程序，以便于不需要的信息或者过量信息出现在输出中：

```
root@andrei:/sys/kernel/debug/tracing# echo 0 > tracing_on
```

然后，我们去查看 `Ring` 缓冲区的内容。在输出的结束部分，我们找到了有关的系统调用信息（这里只是一个节选）。

```
root@andrei:/sys/kernel/debug/tracing# сat trace

......
          chroot-11321 [000] ....  4606.265208: sys_chroot(filename: 7fff785ae8c2)
          chroot-11325 [000] ....  4691.677767: sys_chroot(filename: 7fff242308cc)
            bash-11338 [000] ....  4746.971300: sys_chroot(filename: 7fff1efca8cc)
            bash-11351 [000] ....  5379.020609: sys_chroot(filename: 7fffbf9918cc)
```

关于配置事件跟踪的更的信息可以在 [这里][24] 找到。

### 结束语

在这篇文篇中，我们做了一个 ftrace 的功能概述。我们非常感谢你的任何意见或者补充。如果你想深入研究这个主题，我们为你推荐下列的资源：

*   [https://www.kernel.org/doc/Documentation/trace/tracepoints.txt][1] — 一个跟踪点机制的详细描述

*   [https://www.kernel.org/doc/Documentation/trace/events.txt][2] — 在 Linux 中跟踪系统事件的指南

*   [https://www.kernel.org/doc/Documentation/trace/ftrace.txt][3] — ftrace 的官方文档

*   [https://lttng.org/files/thesis/desnoyers-dissertation-2009-12-v27.pdf][4] — Mathieu Desnoyers（作者是跟踪点和 LTTNG 的创建者）的关于内核跟踪和分析的学术论文。

*   [https://lwn.net/Articles/370423/][5] — Steven Rostedt 的关于 ftrace 功能的文章

*   [http://alex.dzyoba.com/linux/profiling-ftrace.html][6] — 用 ftrace 分析实际案例的一个概述

--------------------------------------------------------------------------------

via:https://blog.selectel.com/kernel-tracing-ftrace/

作者：[Andrej Yemelianov][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.selectel.com/author/yemelianov/
[1]:https://www.kernel.org/doc/Documentation/trace/tracepoints.txt
[2]:https://www.kernel.org/doc/Documentation/trace/events.txt
[3]:https://www.kernel.org/doc/Documentation/trace/ftrace.txt
[4]:https://lttng.org/files/thesis/desnoyers-dissertation-2009-12-v27.pdf
[5]:https://lwn.net/Articles/370423/
[6]:http://alex.dzyoba.com/linux/profiling-ftrace.html
[7]:https://blog.selectel.com/author/yemelianov/
[8]:https://blog.selectel.com/tag/ftrace/
[9]:https://blog.selectel.com/tag/kernel/
[10]:https://blog.selectel.com/tag/kernel-profiling/
[11]:https://blog.selectel.com/tag/kernel-tracing/
[12]:https://blog.selectel.com/tag/linux/
[13]:https://blog.selectel.com/tag/tracepoints/
[14]:https://sourceware.org/systemtap/
[15]:https://github.com/ktap/ktap
[16]:http://www.sysdig.org/
[17]:http://lttng.org/
[18]:https://www.kernel.org/doc/Documentation/trace/ftrace.txt
[19]:http://www.brendangregg.com/blog/index.html
[20]:https://www.kernel.org/doc/Documentation/trace/ftrace.txt
[21]:https://lwn.net/Articles/370423/
[22]:http://lxr.free-electrons.com/source/mm/slab.c
[23]:https://blog.selectel.com/containerization-mechanisms-namespaces/
[24]:https://www.kernel.org/doc/Documentation/trace/events.txt