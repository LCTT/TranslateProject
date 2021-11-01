[#]: subject: (Kernel tracing with trace-cmd)
[#]: via: (https://opensource.com/article/21/7/linux-kernel-trace-cmd)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13852-1.html)

使用 trace-cmd 追踪内核
======

> trace-cmd 是一个易于使用，且特性众多、可用来追踪内核函数的命令。

![](https://img.linux.net.cn/data/attachment/album/202110/05/145818d2i9tgjetzj8itqg.jpg)

在 [之前的文章][2] 里，我介绍了如何利用 `ftrace` 来追踪内核函数。通过写入和读出文件来使用 `ftrace` 会变得很枯燥，所以我对它做了一个封装来运行带有选项的命令，以启用和禁用追踪、设置过滤器、查看输出、清除输出等等。

[trace-cmd][3] 命令是一个可以帮助你做到这一点的工具。在这篇文章中，我使用 `trace-cmd` 来执行我在 `ftrace` 文章中所做的相同任务。由于会经常参考那篇文章，建议在阅读这篇文章之前先阅读它。

### 安装 trace-cmd

本文中所有的命令都运行在 root 用户下。

因为 `ftrace` 机制被内置于内核中，因此你可以使用下面的命令进行验证它是否启用：

```
# mount | grep tracefs
none on /sys/kernel/tracing type tracefs (rw,relatime,seclabel)
```

不过，你需要手动尝试安装 `trace-cmd` 命令：

```
# dnf install trace-cmd -y
```

### 列出可用的追踪器

当使用 `ftrace` 时，你必须查看文件的内容以了解有哪些追踪器可用。但使用 `trace-cmd`，你可以通过以下方式获得这些信息:

```
# trace-cmd list -t
hwlat blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop
```

### 启用函数追踪器

在我 [之前的文章][2] 中，我使用了两个追踪器，在这里我也会这么做。用 `function` 启用你的第一个追踪器:

```
$ trace-cmd start -p function
  plugin 'function'
```

### 查看追踪输出

一旦追踪器被启用，你可以通过使用 `show` 参数来查看输出。这只显示了前 20 行以保持例子的简短（见我之前的文章对输出的解释）：

```
# trace-cmd show | head -20
## tracer: function
#
# entries-in-buffer/entries-written: 410142/3380032   #P:8
#
#                                _-----=> irqs-off
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
           gdbus-2606    [004] ..s. 10520.538759: __msecs_to_jiffies <-rebalance_domains
           gdbus-2606    [004] ..s. 10520.538760: load_balance <-rebalance_domains
           gdbus-2606    [004] ..s. 10520.538761: idle_cpu <-load_balance
           gdbus-2606    [004] ..s. 10520.538762: group_balance_cpu <-load_balance
           gdbus-2606    [004] ..s. 10520.538762: find_busiest_group <-load_balance
           gdbus-2606    [004] ..s. 10520.538763: update_group_capacity <-update_sd_lb_stats.constprop.0
           gdbus-2606    [004] ..s. 10520.538763: __msecs_to_jiffies <-update_group_capacity
           gdbus-2606    [004] ..s. 10520.538765: idle_cpu <-update_sd_lb_stats.constprop.0
           gdbus-2606    [004] ..s. 10520.538766: __msecs_to_jiffies <-rebalance_domains
```

### 停止追踪并清除缓冲区

追踪将会在后台继续运行，你可以继续用 `show` 查看输出。

要停止追踪，请运行带有 `stop` 参数的 `trace-cmd` 命令：

```
# trace-cmd stop
```

要清除缓冲区，用 `clear` 参数运行它：

```
# trace-cmd clear
```

### 启用函数调用图追踪器

运行第二个追踪器，通过 `function_graph` 参数来启用它。

```
# trace-cmd start -p function_graph
  Plugin 'function_graph'
```

再次使用 `show` 参数查看输出。正如预期的那样，输出与第一次追踪输出略有不同。这一次，它包括一个**函数调用**链：

```
# trace-cmd show | head -20
## tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 4)   0.079 us    |        } /* rcu_all_qs */
 4)   0.327 us    |      } /* __cond_resched */
 4)   0.081 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
 4)   0.078 us    |        rcu_all_qs();
 4)   0.243 us    |      }
 4)   0.080 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
 4)   0.078 us    |        rcu_all_qs();
 4)   0.241 us    |      }
 4)   0.080 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
 4)   0.079 us    |        rcu_all_qs();
 4)   0.235 us    |      }
 4)   0.095 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
```

使用 `stop` 和 `clear` 命令来停止追踪和清除缓存区：

```
# trace-cmd stop
# trace-cmd clear
```

### 调整追踪以增加深度

如果你想在函数调用中看到更多的深度，你可以对追踪器进行调整：

```
# trace-cmd start -p function_graph --max-graph-depth 5
  plugin 'function_graph'
```

现在，当你将这个输出与你之前看到的进行比较时，你应该看到更多的嵌套函数调用：

```
# trace-cmd show | head -20
## tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 6)               |        __fget_light() {
 6)   0.804 us    |          __fget_files();
 6)   2.708 us    |        }
 6)   3.650 us    |      } /* __fdget */
 6)   0.547 us    |      eventfd_poll();
 6)   0.535 us    |      fput();
 6)               |      __fdget() {
 6)               |        __fget_light() {
 6)   0.946 us    |          __fget_files();
 6)   1.895 us    |        }
 6)   2.849 us    |      }
 6)               |      sock_poll() {
 6)   0.651 us    |        unix_poll();
 6)   1.905 us    |      }
 6)   0.475 us    |      fput();
 6)               |      __fdget() {
```

### 了解可被追踪的函数

如果你想只追踪某些函数而忽略其他的，你需要知道确切的函数名称。你可以用 `list -f` 参数来得到它们。例如搜索常见的内核函数 `kmalloc`，它被用来在内核中分配内存：

```
# trace-cmd list -f | grep kmalloc
bpf_map_kmalloc_node
mempool_kmalloc
__traceiter_kmalloc
__traceiter_kmalloc_node
kmalloc_slab
kmalloc_order
kmalloc_order_trace
kmalloc_large_node
__kmalloc
__kmalloc_track_caller
__kmalloc_node
__kmalloc_node_track_caller
[...]
```

下面是我的测试系统中可被追踪的函数总数：

```
# trace-cmd list -f | wc -l
63165
```

### 追踪内核模块相关的函数

你也可以追踪与特定内核模块相关的函数。假设你想追踪 `kvm` 内核模块相关的功能，你可以通过以下方式来实现。请确保该模块已经加载：

```
# lsmod | grep kvm_intel
kvm_intel 335872 0
kvm 987136 1 kvm_intel
```

再次运行 `trace-cmd`，使用 `list` 参数，并从输出结果中，`grep` 查找以 `]` 结尾的行。这将过滤掉内核模块。然后 `grep` 内核模块 `kvm_intel` ，你应该看到所有与该内核模块有关的函数。

```
# trace-cmd list -f | grep ]$  | grep kvm_intel
vmx_can_emulate_instruction [kvm_intel]
vmx_update_emulated_instruction [kvm_intel]
vmx_setup_uret_msr [kvm_intel]
vmx_set_identity_map_addr [kvm_intel]
handle_machine_check [kvm_intel]
handle_triple_fault [kvm_intel]
vmx_patch_hypercall [kvm_intel]

[...]

vmx_dump_dtsel [kvm_intel]
vmx_dump_sel [kvm_intel]
```

### 追踪特定函数

现在你知道了如何找到感兴趣的函数，请用一个例子把这些内容用于时间。就像前面的文章一样，试着追踪与文件系统相关的函数。我的测试系统上的文件系统是 `ext4`。

这个过程略有不同；你在运行命令时，不使用 `start` 参数，而是在 `record` 参数后面加上你想追踪的函数的“模式”。你还需要指定你想要的追踪器；在这种情况下，就是 `function_graph`。该命令会继续记录追踪，直到你用 `Ctrl+C` 停止它。所以几秒钟后，按 `Ctrl+C` 停止追踪：

```
# trace-cmd list -f | grep ^ext4_

# trace-cmd record -l ext4_* -p function_graph
  plugin 'function_graph'
Hit Ctrl^C to stop recording
^C
CPU0 data recorded at offset=0x856000
    8192 bytes in size
[...]
```

### 查看追踪记录

要查看你之前的追踪记录，运行带有 `report` 参数的命令。从输出结果来看，很明显过滤器起作用了，你只看到 `ext4` 相关的函数追踪：

```
# trace-cmd report | head -20
[...]
cpus=8
       trace-cmd-12697 [000] 11303.928103: funcgraph_entry:                   |  ext4_show_options() {
       trace-cmd-12697 [000] 11303.928104: funcgraph_entry:        0.187 us   |    ext4_get_dummy_policy();
       trace-cmd-12697 [000] 11303.928105: funcgraph_exit:         1.583 us   |  }
       trace-cmd-12697 [000] 11303.928122: funcgraph_entry:                   |  ext4_create() {
       trace-cmd-12697 [000] 11303.928122: funcgraph_entry:                   |    ext4_alloc_inode() {
       trace-cmd-12697 [000] 11303.928123: funcgraph_entry:        0.101 us   |      ext4_es_init_tree();
       trace-cmd-12697 [000] 11303.928123: funcgraph_entry:        0.083 us   |      ext4_init_pending_tree();
       trace-cmd-12697 [000] 11303.928123: funcgraph_entry:        0.141 us   |      ext4_fc_init_inode();
       trace-cmd-12697 [000] 11303.928123: funcgraph_exit:         0.931 us   |    }
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.081 us   |    ext4_get_dummy_policy();
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.133 us   |    ext4_get_group_desc();
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.115 us   |    ext4_free_inodes_count();
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.114 us   |    ext4_get_group_desc();
```

### 追踪一个特定的 PID

假设你想追踪与一个进程（PID）有关的函数。打开另一个终端，注意运行中的 shell 的PID：

```
# echo $$
10885
```

再次运行 `record` 命令，用 `-P` 选项传递PID。这一次，让终端运行（也就是说，先不要按 `Ctrl+C` ）：

```
# trace-cmd record -P 10885 -p function_graph
  Plugin 'function_graph'
Hit Ctrl^C to stop recording
```

### 在 shell 上运行一些命令

移动到另一个终端，在那里你有一个以特定 PID 运行的 shell，并运行任何命令，例如，`ls` 命令用来列出文件：

```
# ls
Temp-9b61f280-fdc1-4512-9211-5c60f764d702
tracker-extract-3-files.1000
v8-compile-cache-1000
[...]
```

移动到你启用追踪的终端，按 `Ctrl+C` 停止追踪：

```
# trace-cmd record -P 10885 -p function_graph
  plugin 'function_graph'
Hit Ctrl^C to stop recording
^C
CPU1 data recorded at offset=0x856000
    618496 bytes in size
[...]
```

在追踪的输出中，你可以看到左边是 PID 和 Bash shell，右边是与之相关的函数调用。这对于缩小你的追踪范围是非常方便的：

```
# trace-cmd report  | head -20

cpus=8
          <idle>-0     [001] 11555.380581: funcgraph_entry:                   |  switch_mm_irqs_off() {
          <idle>-0     [001] 11555.380583: funcgraph_entry:        1.703 us   |    load_new_mm_cr3();
          <idle>-0     [001] 11555.380586: funcgraph_entry:        0.493 us   |    switch_ldt();
          <idle>-0     [001] 11555.380587: funcgraph_exit:         7.235 us   |  }
            bash-10885 [001] 11555.380589: funcgraph_entry:        1.046 us   |  finish_task_switch.isra.0();
            bash-10885 [001] 11555.380591: funcgraph_entry:                   |  __fdget() {
            bash-10885 [001] 11555.380592: funcgraph_entry:        2.036 us   |    __fget_light();
            bash-10885 [001] 11555.380594: funcgraph_exit:         3.256 us   |  }
            bash-10885 [001] 11555.380595: funcgraph_entry:                   |  tty_poll() {
            bash-10885 [001] 11555.380597: funcgraph_entry:                   |    tty_ldisc_ref_wait() {
            bash-10885 [001] 11555.380598: funcgraph_entry:                   |      ldsem_down_read() {
            bash-10885 [001] 11555.380598: funcgraph_entry:                   |        __cond_resched() {
```

### 试一试

这些简短的例子显示了使用 `trace-cmd` 命令而不是底层的 `ftrace` 机制，是如何实现既容易使用又拥有丰富的功能，许多内容本文并没有涉及。要想了解更多信息并更好地使用它，请查阅它的手册，并尝试使用其他有用的命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-kernel-trace-cmd

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://linux.cn/article-13752-1.html
[3]: https://lwn.net/Articles/410200/
