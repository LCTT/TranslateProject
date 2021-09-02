[#]: subject: (Kernel tracing with trace-cmd)
[#]: via: (https://opensource.com/article/21/7/linux-kernel-trace-cmd)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Kernel tracing with trace-cmd
======
trace-cmd is an easy-to-use, feature-rich utility for tracing Linux
kernel functions.
![Puzzle pieces coming together to form a computer screen][1]

In my [previous article][2], I explained how to use `ftrace` to trace kernel functions. Using `ftrace` by writing and reading from files can get tedious, so I used a wrapper around it to run commands with options to enable and disable tracing, set filters, view output, clear output, and more.

The [trace-cmd][3] command is a utility that helps you do just this. In this article, I use `trace-cmd` to perform the same tasks I did in my `ftrace` article. Since I refer back to that article frequently, I recommend you read it before you read this one.

### Install trace-cmd

I run the commands in this article as the root user.

The `ftrace` mechanism is built into the kernel, and you can verify it is enabled with:


```
# mount | grep tracefs
none on /sys/kernel/tracing type tracefs (rw,relatime,seclabel)
```

However, you need to install the `trace-cmd` utility manually.


```
`# dnf install trace-cmd -y`
```

### List available tracers

When using `ftrace`, you must view a file's contents to see what tracers are available. But with `trace-cmd`, you can get this information with:


```
# trace-cmd list -t
hwlat blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop
```

### Enable the function tracer

In my [earlier article][2], I used two tracers, and I'll do the same here. Enable your first tracer, `function`, with:


```
$ trace-cmd start -p function
  plugin 'function'
```

### View the trace output

Once the tracer is enabled, you can view the output by using the `show` arguments. This shows only the first 20 lines to keep the example short (see my earlier article for an explanation of the output):


```
# trace-cmd show | head -20
## tracer: function
#
# entries-in-buffer/entries-written: 410142/3380032   #P:8
#
#                                _-----=&gt; irqs-off
#                               / _----=&gt; need-resched
#                              | / _---=&gt; hardirq/softirq
#                              || / _--=&gt; preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |
           gdbus-2606    [004] ..s. 10520.538759: __msecs_to_jiffies &lt;-rebalance_domains
           gdbus-2606    [004] ..s. 10520.538760: load_balance &lt;-rebalance_domains
           gdbus-2606    [004] ..s. 10520.538761: idle_cpu &lt;-load_balance
           gdbus-2606    [004] ..s. 10520.538762: group_balance_cpu &lt;-load_balance
           gdbus-2606    [004] ..s. 10520.538762: find_busiest_group &lt;-load_balance
           gdbus-2606    [004] ..s. 10520.538763: update_group_capacity &lt;-update_sd_lb_stats.constprop.0
           gdbus-2606    [004] ..s. 10520.538763: __msecs_to_jiffies &lt;-update_group_capacity
           gdbus-2606    [004] ..s. 10520.538765: idle_cpu &lt;-update_sd_lb_stats.constprop.0
           gdbus-2606    [004] ..s. 10520.538766: __msecs_to_jiffies &lt;-rebalance_domains
```

### Stop tracing and clear the buffer

Tracing continues to run in the background, and you can keep viewing the output using `show`.

To stop tracing, run `trace-cmd` with the `stop` argument:


```
`# trace-cmd stop`
```

To clear the buffer, run it with the `clear` argument:


```
`# trace-cmd clear`
```

### Enable the function_graph tracer

Enable the second tracer, `function_graph`, by running:


```
# trace-cmd start -p function_graph
  plugin 'function_graph'
```

Once again, view the output using the `show` argument. As expected, the output is slightly different from the first trace output. This time it includes a `function calls` chain:


```
# trace-cmd show | head -20
## tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 4)   0.079 us    |        } /* rcu_all_qs */
 4)   0.327 us    |      } /* __cond_resched */
 4)   0.081 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
 4)   0.078 us    |        rcu_all_qs();
 4)   0.243 us    |      }
 4)   0.080 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
 4)   0.078 us    |        rcu_all_qs();
 4)   0.241 us    |      }
 4)   0.080 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
 4)   0.079 us    |        rcu_all_qs();
 4)   0.235 us    |      }
 4)   0.095 us    |      rcu_read_unlock_strict();
 4)               |      __cond_resched() {
```

Use the `stop` and `clear` commands to stop tracing and clear the buffer:


```
# trace-cmd stop
# trace-cmd clear
```

### Tweak tracing to increase depth

If you want to see more depth in the function calls, you can tweak the tracer:


```
# trace-cmd start -p function_graph --max-graph-depth 5
  plugin 'function_graph'
```

Now when you compare this output with what you saw before, you should see more nested function calls:


```
# trace-cmd show | head -20
## tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 6)               |        __fget_light() {
 6)   0.804 us    |          __fget_files();
 6)   2.708 us    |        }
 6)   3.650 us    |      } /* __fdget */
 6)   0.547 us    |      eventfd_poll();
 6)   0.535 us    |      fput();
 6)               |      __fdget() {
 6)               |        __fget_light() {
 6)   0.946 us    |          __fget_files();
 6)   1.895 us    |        }
 6)   2.849 us    |      }
 6)               |      sock_poll() {
 6)   0.651 us    |        unix_poll();
 6)   1.905 us    |      }
 6)   0.475 us    |      fput();
 6)               |      __fdget() {
```

### Learn available functions to trace

If you want to trace only certain functions and ignore the rest, you need to know the exact function names. You can get them with the `list` argument followed by `-f`. This example searches for the common kernel function `kmalloc`, which is used to allocate memory in the kernel:


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

Here's the total count of functions available on my test system:


```
# trace-cmd list -f | wc -l
63165
```

### Trace kernel module-related functions

You can also trace functions related to a specific kernel module. Imagine you want to trace `kvm` kernel module-related functions. Ensure the module is loaded:


```
# lsmod  | grep kvm_intel
kvm_intel             335872  0
kvm                   987136  1 kvm_intel
```

Run `trace-cmd` again with the `list` argument, and from the output, `grep` for lines that end in `]`. This will filter out the kernel modules. Then `grep` the kernel module `kvm_intel`, and you should see all the functions related to that kernel module:


```
# trace-cmd list -f | grep ]$  | grep kvm_intel
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

### Trace specific functions

Now that you know how to find functions of interest, put that knowledge to work with an example. As in the earlier article, try to trace filesystem-related functions. The filesystem I had on my test system was `ext4`.

This procedure is slightly different; instead of `start`, you run the command with the `record` argument followed by the "pattern" of the functions you want to trace. You also need to specify the tracer you want; in this case, that's `function_graph`. The command continues recording the trace until you stop it with **Ctrl+C**. So after a few seconds, hit **Ctrl+C** to stop tracing:


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

### View the recorded trace

To view the trace you recorded earlier, run the command with the `report` argument. From the output, it's clear that the filter worked, and you see only the ext4-related function trace:


```
# trace-cmd report | head -20
[...]
cpus=8
       trace-cmd-12697 [000] 11303.928103: funcgraph_entry:                   |  ext4_show_options() {
       trace-cmd-12697 [000] 11303.928104: funcgraph_entry:        0.187 us   |    ext4_get_dummy_policy();
       trace-cmd-12697 [000] 11303.928105: funcgraph_exit:         1.583 us   |  }
       trace-cmd-12697 [000] 11303.928122: funcgraph_entry:                   |  ext4_create() {
       trace-cmd-12697 [000] 11303.928122: funcgraph_entry:                   |    ext4_alloc_inode() {
       trace-cmd-12697 [000] 11303.928123: funcgraph_entry:        0.101 us   |      ext4_es_init_tree();
       trace-cmd-12697 [000] 11303.928123: funcgraph_entry:        0.083 us   |      ext4_init_pending_tree();
       trace-cmd-12697 [000] 11303.928123: funcgraph_entry:        0.141 us   |      ext4_fc_init_inode();
       trace-cmd-12697 [000] 11303.928123: funcgraph_exit:         0.931 us   |    }
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.081 us   |    ext4_get_dummy_policy();
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.133 us   |    ext4_get_group_desc();
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.115 us   |    ext4_free_inodes_count();
       trace-cmd-12697 [000] 11303.928124: funcgraph_entry:        0.114 us   |    ext4_get_group_desc();
```

### Trace a specific PID

Say you want to trace functions related to a specific persistent identifier (PID). Open another terminal and note the PID of the running shell:


```
# echo $$
10885
```

Run the `record` command again and pass the PID using the `-P` option. This time, let the terminal run (i.e., do not press **Ctrl+C** yet):


```
# trace-cmd record -P 10885 -p function_graph
  plugin 'function_graph'
Hit Ctrl^C to stop recording
```

### Run some activity on the shell

Move back to the other terminal where you had a shell running with a specific PID and run any command, e.g., `ls` to list files:


```
# ls
Temp-9b61f280-fdc1-4512-9211-5c60f764d702
tracker-extract-3-files.1000
v8-compile-cache-1000
[...]
```

Move back to the terminal where you enabled tracing and hit **Ctrl+C** to stop tracing:


```
# trace-cmd record -P 10885 -p function_graph
  plugin 'function_graph'
Hit Ctrl^C to stop recording
^C
CPU1 data recorded at offset=0x856000
    618496 bytes in size
[...]
```

In the trace's output, you can see the PID and the Bash shell on the left and the function calls related to it on the right. This can be pretty handy to narrow down your tracing:


```
# trace-cmd report  | head -20

cpus=8
          &lt;idle&gt;-0     [001] 11555.380581: funcgraph_entry:                   |  switch_mm_irqs_off() {
          &lt;idle&gt;-0     [001] 11555.380583: funcgraph_entry:        1.703 us   |    load_new_mm_cr3();
          &lt;idle&gt;-0     [001] 11555.380586: funcgraph_entry:        0.493 us   |    switch_ldt();
          &lt;idle&gt;-0     [001] 11555.380587: funcgraph_exit:         7.235 us   |  }
            bash-10885 [001] 11555.380589: funcgraph_entry:        1.046 us   |  finish_task_switch.isra.0();
            bash-10885 [001] 11555.380591: funcgraph_entry:                   |  __fdget() {
            bash-10885 [001] 11555.380592: funcgraph_entry:        2.036 us   |    __fget_light();
            bash-10885 [001] 11555.380594: funcgraph_exit:         3.256 us   |  }
            bash-10885 [001] 11555.380595: funcgraph_entry:                   |  tty_poll() {
            bash-10885 [001] 11555.380597: funcgraph_entry:                   |    tty_ldisc_ref_wait() {
            bash-10885 [001] 11555.380598: funcgraph_entry:                   |      ldsem_down_read() {
            bash-10885 [001] 11555.380598: funcgraph_entry:                   |        __cond_resched() {
```

### Give it a try

These brief examples show how using `trace-cmd` instead of the underlying `ftrace` mechanism is both easy to use and rich in features, including many I didn't cover here. To learn more and get better at it, consult its man page and try out its other useful commands.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-kernel-trace-cmd

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/article/21/7/analyze-linux-kernel-ftrace
[3]: https://lwn.net/Articles/410200/
