[#]: subject: (Analyze the Linux kernel with ftrace)
[#]: via: (https://opensource.com/article/21/7/linux-kernel-ftrace)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

通过 `ftrace` 来分析 Linux 内核
======
通过 `ftrace` 来了解 Linux 内核内部工作方式是一个好方法。
![Linux keys on the keyboard for a desktop computer][1]

一个操作系统的内核是最难以理解的软件之一。自从你的系统启动后，它会一直在后台运行。尽管每个用户都不与内核直接交互，但他们在内核的帮助下完成自己的计算任务。与内核的交互发生在调用系统调用或者用户日常使用的各种库或应用间接调用了系统调用。

在之前的文章里我介绍了如何使用 `strace` 来追踪系统调用。然而，使用 `strace` 时你的可见性是受限的。它允许你查看特定参数的系统调用。并在工作完成后，看到其返回值或状态，来表明是通过还是失败。但是你无法知道内核在这段时间内发生了什么。除了系统调用外，内核中还有很多其他活动发生时却被忽略了。

### `ftrace` 介绍

本文的目的是通过使用一个名为 `ftrace` 的机制来追踪内核函数。任何 Linux 用户可以通过使用它来轻松地追踪内核，并且了解更多关于 Linux 内核内部如何工作。

`ftrace` 默认产生的输出是巨大的，因为内核总是忙的。为了节省空间，很多情况下我会通过截断来给出最小输出。

我使用 Fedora 来演示下面的例子，但是它们应该在其他最新的 Linux 发行版上同样可以运行。

### 启用 `ftrace`

`ftrace` 现在已经是内核中的一部分了，你不再需要事先安装它了。也就是说，如果你在使用最近的 Linux 系统，那么 `ftrace` 是已经启动了的。为了验证 `ftrace` 是否可用，运行 `mount` 命令并查找 `tracefs`。如果你看到类似下面的输出，表示 `ftrace` 已经启用，你可以轻松地尝试本文中下面的例子。下面的命令需要在 root 用户下使用（`sudo` 是不够的）

```
$ sudo mount | grep tracefs
none on /sys/kernel/tracing type tracefs (rw,relatime,seclabel)
```

要想使用 `ftrace`，你首先需要进入上面 `mount` 命令中找到的特定目录中，在那个目录下运行文章中的其他命令。

```
`$ cd /sys/kernel/tracing`
```

### 一般的工作流程

首先，你需要理解捕捉踪迹和获取输出的一般流程。如果你直接运行 `ftrace`，没有任何特定的 `ftrace-` 命令会被运行。相反的，你基本上是通过标准 Linux 命令来写入或读取一些文件。

通用的步骤如下：
1. 通过写入一些特定文件来启用/结束追踪
2. 通过写入一些特定文件来设置/取消追踪时的过滤规则
3. 读取基于第 1 和 2 步的追踪输出
4. 清除输出的文件或缓存
5. 缩小到特定用例（你要追踪的内核函数），重复1,2,3,4 步

First of all, you must understand the general workflow of capturing a trace and obtaining the output. If you're using `ftrace` directly, there isn't any special `ftrace-`specific commands to run. Instead, you basically write to some files and read from some files using standard command-line Linux utilities.

### 可用的追踪器类型

有多种不同的追踪器可供你使用。之前提到，在运行任何命令前，你需要进入一个特定的目录下，因为文件在这些目录下。我在我的例子中使用相对路径（与绝对路径相反）

你可以查看 `available_tracers` 文件内容来查看所有可用的追踪器类型。你可以可以看下面列出了几个。不需要担心有这么多。

```
$ pwd
/sys/kernel/tracing

$ sudo cat available_tracers
hwlat blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop
```

在所有输出的追踪器中，我会聚焦于下面三个特殊的：启用追踪的 `function` 和 `function_graph`，以及停止追踪的 `nop`

### 确认当前的追踪器

通常情况默认的追踪器设定为 `nop`。即在特殊文件中 `current_tracer` 中的 “无操作”，这意味着追踪目前是关闭的。

```
$ pwd
/sys/kernel/tracing

$ sudo cat current_tracer
nop
```

### 查看追踪输出

在启用任何追踪功能之前，请你看一下保存追踪输出的文件。你可以用 [cat](2) 命令查看名为 `trace` 的文件的内容。

```
$ sudo cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 0/0   #P:8
#
#                                _-----=&gt; irqs-off
#                               / _----=&gt; need-resched
#                              | / _---=&gt; hardirq/softirq
#                              || / _--=&gt; preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
```

### 启用 `function` 追踪器

你可以通过向 `current_tracer` 文件写入 `function` 来启用第一个追踪器 `function`（文件原本内容为 `nop`，意味着追踪是关闭的）。把这个操作看成是启用追踪的一种方式。

```
$ pwd
/sys/kernel/tracing

$ sudo cat current_tracer
nop
$ echo function &gt; current_tracer
$
$ cat current_tracer
function
```

### 查看 `function` 追踪器的更新追踪输出

现在你已启动追踪，是时候查看输出了。如果你查看 `trace` 文件内容，你将会看到许多被连续写入的内容。我通过管道只展示了文件内容的前 20 行。根据左边输出的标题，你可以看到在某个 CPU 上运行的任务和进程 ID。根据右边输出的内容，你可以看到具体的内核函数和其副函数。中间显示了时间信息。

```
$ sudo cat trace | head -20
# tracer: function
#
# entries-in-buffer/entries-written: 409936/4276216   #P:8
#
#                                _-----=&gt; irqs-off
#                               / _----=&gt; need-resched
#                              | / _---=&gt; hardirq/softirq
#                              || / _--=&gt; preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
          &lt;idle&gt;-0       [000] d...  2088.841739: tsc_verify_tsc_adjust &lt;-arch_cpu_idle_enter
          &lt;idle&gt;-0       [000] d...  2088.841739: local_touch_nmi &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841740: rcu_nocb_flush_deferred_wakeup &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841740: tick_check_broadcast_expired &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841740: cpuidle_get_cpu_driver &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841740: cpuidle_not_available &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841741: cpuidle_select &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841741: menu_select &lt;-do_idle
          &lt;idle&gt;-0       [000] d...  2088.841741: cpuidle_governor_latency_req &lt;-menu_select
```

请记住当追踪打开后，这意味着追踪结果会被一直连续写入直至你关闭追踪。

### 关闭追踪

关闭追踪是简单的。你只需要在 `current_tracer` 文件中用 `nop` 替换 `function` 追踪器即可：

```
$ sudo cat current_tracer
function

$ sudo echo nop &gt; current_tracer

$ sudo cat current_tracer
nop
```

### 启用 `function_graph` 追踪器

现在尝试第二个名为 `function_graph` 的追踪器。你可以使用和上面相同的步骤：在 `current_tracer` 文件中写入 `function_graph`：

```
$ sudo echo function_graph &gt; current_tracer

$ sudo cat current_tracer
function_graph
```

### `function_tracer` 追踪器的追踪输出

注意到目前 `trace` 文件的输出格式已经发生变化。现在，你可以看到 CPU ID 和内核函数的执行时间。接下来，一个花括号表示一个函数的开始，以及它内部调用了哪些其他函数。

```
$ sudo cat trace | head -20
# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 6)               |              n_tty_write() {
 6)               |                down_read() {
 6)               |                  __cond_resched() {
 6)   0.341 us    |                    rcu_all_qs();
 6)   1.057 us    |                  }
 6)   1.807 us    |                }
 6)   0.402 us    |                process_echoes();
 6)               |                add_wait_queue() {
 6)   0.391 us    |                  _raw_spin_lock_irqsave();
 6)   0.359 us    |                  _raw_spin_unlock_irqrestore();
 6)   1.757 us    |                }
 6)   0.350 us    |                tty_hung_up_p();
 6)               |                mutex_lock() {
 6)               |                  __cond_resched() {
 6)   0.404 us    |                    rcu_all_qs();
 6)   1.067 us    |                  }
```

### 启用追踪的设置来增加追踪的深度

你可以使用下面的步骤来调整追踪器以看到更深层次的函数调用。完成之后，你可以查看 `trace` 文件的内容并发现输出变得更加详细了。为了文章的可读性，这个例子的输出被省略了：

```
$ sudo cat max_graph_depth
0
$ sudo echo 1 &gt; max_graph_depth
$ # or
$ sudo echo 2 &gt; max_graph_depth

$ sudo cat trace
```

### 查找要追踪的函数

上面的步骤足以让你开始追踪。但是它产生的输出内容是巨大的，当你想试图找到自己感兴趣的内容时，往往会很困难。通常你更希望能够之追踪特定的函数，而忽略其他函数。但如果你不知道它们确切的名称，你怎么知道要追踪哪些进程？有一个文件可以帮助你解决这个问题 —— `available_filter_functions` 文件提供了一个可供追踪的函数列表。

```
$ sudo wc -l available_filter_functions  
63165 available_filter_functions
```

### 查找一般的内核函数

现在试着搜索一个你所知道的简单内核函数。用户空间有 `malloc` 函数用来分配内存，而内核有 `kmalloc` 函数，它提供类似的功能。下面是所有与 `kmalloc` 相关的函数。

```
$ sudo grep kmalloc available_filter_functions
debug_kmalloc
mempool_kmalloc
kmalloc_slab
kmalloc_order
kmalloc_order_trace
kmalloc_fix_flags
kmalloc_large_node
__kmalloc
__kmalloc_track_caller
__kmalloc_node
__kmalloc_node_track_caller
[...]
```

### 查找内核模块或者驱动相关函数

在 `available_filter_functions` 文件的输出中，你可以看到一些以括号内文字结尾的行，例如下面的例子中的 `[kvm_intel]`。这些函数与当前加载的内核模块 `kvm_intel` 有关。你可以运行 `lsmod` 命令来验证。

```
$ sudo grep kvm available_filter_functions | tail
__pi_post_block [kvm_intel]
vmx_vcpu_pi_load [kvm_intel]
vmx_vcpu_pi_put [kvm_intel]
pi_pre_block [kvm_intel]
pi_post_block [kvm_intel]
pi_wakeup_handler [kvm_intel]
pi_has_pending_interrupt [kvm_intel]
pi_update_irte [kvm_intel]
vmx_dump_dtsel [kvm_intel]
vmx_dump_sel [kvm_intel]

$ lsmod  | grep -i kvm
kvm_intel             335872  0
kvm                   987136  1 kvm_intel
irqbypass              16384  1 kvm
```

### 仅追踪特定的函数

为了实现对特定函数或模式的追踪，你可以利用 `set_ftrace_filter` 文件来指定你要追踪上述输出中的哪些函数。这个文件也接受 `*` 模式，它可以扩展到包括具有给定模式的其他函数。作为一个例子，我在我的机器上使用ext4文件系统。我可以用下面的命令指定ext4的特定内核函数来追踪。

```
$ sudo mount | grep home
/dev/mapper/fedora-home on /home type ext4 (rw,relatime,seclabel)

$ pwd
/sys/kernel/tracing

$ sudo cat set_ftrace_filter
#### all functions enabled ####
$
$ echo ext4_* &gt; set_ftrace_filter
$
$ cat set_ftrace_filter
ext4_has_free_clusters
ext4_validate_block_bitmap
ext4_get_group_number
ext4_get_group_no_and_offset
ext4_get_group_desc
[...]
```

现在当你可以看到追踪输出时，你只能看到与内核函数有关的 `ext4` 函数，而你之前已经为其设置了一个过滤器。所有其他的输出都被忽略了。

```
$ sudo cat trace |head -20
# tracer: function
#
# entries-in-buffer/entries-written: 3871/3871   #P:8
#
#                                _-----=&gt; irqs-off
#                               / _----=&gt; need-resched
#                              | / _---=&gt; hardirq/softirq
#                              || / _--=&gt; preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
           cupsd-1066    [004] ....  3308.989545: ext4_file_getattr &lt;-vfs_fstat
           cupsd-1066    [004] ....  3308.989547: ext4_getattr &lt;-ext4_file_getattr
           cupsd-1066    [004] ....  3308.989552: ext4_file_getattr &lt;-vfs_fstat
           cupsd-1066    [004] ....  3308.989553: ext4_getattr &lt;-ext4_file_getattr
           cupsd-1066    [004] ....  3308.990097: ext4_file_open &lt;-do_dentry_open
           cupsd-1066    [004] ....  3308.990111: ext4_file_getattr &lt;-vfs_fstat
           cupsd-1066    [004] ....  3308.990111: ext4_getattr &lt;-ext4_file_getattr
           cupsd-1066    [004] ....  3308.990122: ext4_llseek &lt;-ksys_lseek
           cupsd-1066    [004] ....  3308.990130: ext4_file_read_iter &lt;-new_sync_read
```

### 排除要被追踪的函数

你并不总是知道你想追踪什么，但是，你肯定知道你不想追踪什么。因此，有一个 `set_ftrace_notrace` —— 请注意其中的 "no"。你可以在这个文件中写下你想要的模式，并启用追踪。这样除了所提到的模式外，任何其他东西都会被追踪到。这通常有助于删除那些使我们的输出变得混乱的普通功能。

```
$ sudo cat set_ftrace_notrace
#### no functions disabled ####
```

### 具有目标性的追踪

到目前为止，你一直在追踪内核中发生的一切。但是，他无法帮助你追踪与某个特定命令有关的事件。为了达到这个目的，你可以按需打开和关闭跟踪，并且在它们之间，运行我们选择的命令，这样你就不会在跟踪输出中得到额外的输出。你可以通过向 `tracing_on` 写入 `1` 来启用跟踪，写 `0` 来关闭跟踪。

```
$ sudo cat tracing_on
0

$ sudo echo 1 &gt; tracing_on
$ sudo cat tracing_on
1

$ # Run some specific command that we wish to trace here

$ sudo echo 0 &gt; tracing_on

$ cat tracing_on
0
```

### 追踪特定的 PID

如果你想追踪与正在运行的特定进程有关的活动，你可以将该 PID 写入一个名为 `set_ftrace_pid` 的文件，然后启用追踪。这样一来，追踪就只限于这个PID，这在某些情况下是非常有帮助的。

```
`$ sudo echo $PID > set_ftrace_pid`
```

### 总结

`ftrace` 是一个了解 Linux 内核内部工作的很好方式。通过一些练习，你可以学会对 `ftrace` 进行调整以缩小搜索范围。要想更详细地了解 `ftrace` 和它的高级用法，请看 `ftrace` 的核心作者 Steven Rostedt 写的这些优秀文章。

  * [调试 Linux 内核，第一部分](3)
  * [调试 Linux 内核，第二部分](4)
  * [调试 Linux 内核，第三部分](5)


--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-kernel-ftrace

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://opensource.com/article/19/2/getting-started-cat-command
[3]: https://lwn.net/Articles/365835/
[4]: https://lwn.net/Articles/366796/
[5]: https://lwn.net/Articles/370423/
