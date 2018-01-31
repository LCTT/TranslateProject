Translating by qhwdw Kernel Tracing with Ftrace
============================================================

[Andrej Yemelianov][7]
Tags: [ftrace][8], [kernel][9], [kernel profiling][10], [kernel tracing][11], [linux][12], [tracepoints][13]

![](https://blog.selectel.com/wp-content/uploads/2017/04/PR-1801-2-2.png)

There are a number of tools for analyzing events at the kernel level: [SystemTap][14], [ktap][15], [Sysdig][16], [LTTNG][17], etc., and you can find plenty of detailed articles and materials about these on the web.

You’ll find much less information on Linux’s native mechanism for tracing system events and retrieving/analyzing troubleshooting information. That would be [ftrace][18], the first tracing tool added to the kernel, and this is what we’ll be looking at today. Let’s start by defining some key terms.

### Kernel Tracing and Profiling

Kernel profiling detects performance “bottlenecks”. Profiling helps us determine where exactly in a program we’re losing performance. Special programs generate a profile—an event summary—which can be used to figure out which functions took the most time to run. These programs, however, don’t help identify why performance dropped.

Bottlenecking usually occurs under conditions that can’t be identified from profiling. To understand why an event took place, the relevant context has to be restored. This requires tracing.

Tracing is understood as the process of collecting information on the activity in a working system. This is done with special tools that register system events kind of like how a tape recorder records ambient sound.

Tracing programs can simultaneously trace events at the application and OS level. The information they gather may be useful for diagnosing multiple system problems.

Tracing is sometimes compared to logging. There definitely are similarities between the two, but there are differences, too.

With tracing, information is written about low-level events. These number in the hundreds or even thousands. With logging, information is written about higher-level events, which are much less frequent. These include users logging into the system, application errors, database transaction, etc.

Just like logs, tracing data can be read as is; however, it’s more useful to extract information about specific applications. All tracing programs are capable of this.

The Linux kernel has three primary mechanisms for kernel tracing and profiling:

*   tracepoints – a mechanism that works over static instrumented code

*   kprobes – a dynamic tracing mechanism used to interrupt a kernel code at any point, call its own handler, and return after all of the necessary operations have been completed

*   perf_events – an interface for accessing the PMU (Performance Monitoring Unit)

We won’t be writing about all of these mechanism here, but anyone interested can visit [Brendan Gregg’s blog][19].

Using ftrace, we can interact with these mechanisms and get debugging information directly from the user space. We’ll talk about this in more detail below. All command line examples are in Ubuntu 14.04, kernel ver. 3.13.0-24.

### Ftrace: General Information

Ftrace is short for Function Trace, but that’s not all it does: it can be used to track context switches, measure the time it takes to process interruptions, calculate the time for activating high-priority tasks, and much more.

Ftrace was developed by Steven Rostedt and has been included in the kernel since version 2.6.27 in 2008\. This is the framework that provides a debugging ring buffer for recording data. This data is gathered by the kernel’s integrated tracing programs.

Ftrace works on the debugfs file system, which is mounted by default in most modern Linux distributions. To start using ftrace, you’ll have to go to the sys/kernel/debug/tracing directory (this is only available to the root user):

```
# cd /sys/kernel/debug/tracing
```

The contents of the directory should look like this:

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

We won’t describe all of these files and subdirectories; that’s already been taken care of in the [official documentation][20]. Instead, we’ll just briefly describe the files relevant to our context:

*   available_tracers – available tracing programs

*   current_tracer – the tracing program presently running

*   tracing_on – the system file responsible for enabling or disabling data writing to the ring buffer (to enable this, the number 1 has to be added to the file; to disable it, the number 0)

*   trace – the file where tracing data is saved in human-readable format

### Available Tracers

We can view a list of available tracers with the command

```
root@andrei:/sys/kernel/debug/tracing#: cat available_tracers
blk mmiotrace function_graph wakeup_rt wakeup function nop
```

Let’s take a quick look at the features of each tracer:

*   function – a function call tracer without arguments

*   function_graph – a function call tracer with subcalls

*   blk – a call and event tracer related to block device I/O operations (this is what blktrace uses)

*   mmiotrace – a memory-mapped I/O operation tracer

*   nop – the simplest tracer, which as the name suggests, doesn’t do anything (although it may come in handy in some situations, which we’ll describe later on)

### The Function Tracer

We’ll start our introduction to ftrace with the function tracer. Let’s look at a test script:

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

This script is fairly straightforward, but there are a few things worth noting. The command sysctl ftrace.enabled=1 enables the function tracer. We then enable the current tracer by writing its name to the current_tracer file.

Next, we write a 1 to tracing_on, which enables the ring buffer. The syntax requires a space between 1 and the > symbol; echo1> tracing_on will not work. One line later, we disable it (if 0 is written to tracing_on, the buffer won’t clear and ftrace won’t be disabled).

Why would we do this? Between the two echo commands, we see the command sleep 1\. We enable the buffer, run this command, and then disable it. This lets the tracer include information about all of the system calls that occur while the command runs.

In the last line of the script, we give the command to display tracing data in the console.

Once the script has run, we’ll see the following printout (here is just a small fragment):

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

The printout starts with information about the number of entries in the buffer and the total number of entries written. The difference between these two number is the number of events lost while filling the buffer (there were no losses in our example).

Then there’s a list of functions that includes the following information:

*   process identifier (PID)

*   the CPU the process runs on (CPU#)

*   the process start time (TIMESTAMP)

*   the name of the traceable function and the parent function that called it (FUNCTION); for example, in the first line of our output, the mutex-unlock function was called by rb_simple_write

### The Function_graph Tracer

The function_graph tracer works just like function, but more detailed: the entry and exit point is shown for each function. With this tracer, we can trace functions with sub calls and measure the execution time of each function.

Let’s edit the script from our last example:

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

After running this script, we get the following printout:

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

In this graph, DURATION shows the time spent running a function. Pay careful attention to the points marked by the + and ! symbols. The plus sign (+) means the function took more than 10 microseconds; the exclamation point (!) means it took more than 100 microseconds.

Under FUNCTION_CALLS, we find information on each function call.

The symbols used to show the initiation and completion of each function is the same as in C: bracers ({) demarcate functions, one at the start and one at the end; leaf functions that don’t call any other function are marked with a semicolon (;).

### Function Filters

The ftrace printout can be big, and finding exactly what it is you’re looking for can be extremely difficult. We can use filters to simplify our search: the printout will only display information about the functions we’re interested in. To do this, we just have to write the name of our function in the set_ftrace_filter file. For example:

```
root@andrei:/sys/kernel/debug/tracing# echo kfree > set_ftrace_filter
```

To disable the filter, we add an empty line to this file:

```
root@andrei:/sys/kernel/debug/tracing# echo  > set_ftrace_filter
```

By running the command

```
root@andrei:/sys/kernel/debug/tracing# echo kfree > set_ftrace_notrace 
```

we get the opposite result: the printout will give us information about every function except kfree().

Another useful option is set_ftrace_pid. This is for tracing functions that can be called while a particular process runs.

ftrace has many more filtering options. For a more detailed look at these, you can read Steven Rostedt’s article on [LWN.net][21].

### Tracing Events

We mentioned the tracepoints mechanism above. Tracepoints are special code inserts that trigger system events. Tracepoints may be dynamic (meaning they have several checks attached to them) or static (no checks attached).

Static tracepoints don’t affect the system in any way; they just add a few bytes for the function call at the end of the instrumented function and add a data structure in a separate section.

Dynamic tracepoints call a trace function when the relevant code fragment is executed. Tracing data is written to the ring buffer.

Tracepoints can be included anywhere in a code; in fact, they can already be found in a lot of kernel functions. Let’s look at the kmem_cache_alloc function (taken from [here][22]):

```
{
    void *ret = slab_alloc(cachep, flags, _RET_IP_);

    trace_kmem_cache_alloc(_RET_IP_, ret,
                            cachep->object_size, cachep->size, flags);
         return ret;
         }
```

trace_kmem_cache_alloc is itself a tracepoint. We can find countless more examples by just looking at the source code of other kernel functions.

The Linux kernel has a special API for working with tracepoints from the user space. In the /sys/kernel/debug/tracing directory, there’s an events directory where system events are saved. These are available for tracing. System events in this context can be understood as the tracepoints included in the kernel.

The list of these can be viewed by running the command:

```
root@andrei:/sys/kernel/debug/tracing# cat available_events
```

A long list will be printed out in the console. This is a bit inconvenient. We can print out a more structured listed using the command:

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

All possible events are combined in the subdirectory by subsystem. Before we can start tracing events, we’ll make sure we’ve enabled writing to the ring buffer:

```
root@andrei:/sys/kernel/debug/tracing# cat tracing_on
```

If the number 0 is shown in the console, we run:

```
root@andrei:/sys/kernel/debug/tracing# echo 1 > tracing_on
```

In our last article, we wrote about the chroot() system call; let’s trace access to this system call. For our tracer, we’ll use nop because function and function_graph record too much information, including event information that we’re just not interested in.

```
root@andrei:/sys/kernel/debug/tracing# echo nop > current_tracer
```

All system call related events are saved in the syscalls directory. Here we’ll find a directory for entering and exiting various system calls. We’ll activate the tracepoint we need by writing 1 in the corresponding file:

```
root@andrei:/sys/kernel/debug/tracing# echo 1 > events/syscalls/sys_enter_chroot/enable
```

Then we create an isolated file system using chroot (for more information, see this [previous post][23]). After we’ve executed the commands we want, we’ll disable the tracer so that no excess or irrelevant information appears in the printout:

```
root@andrei:/sys/kernel/debug/tracing# echo 0 > tracing_on
```

Then, we can look at the contents of the ring buffer. At the end of the printout, we’ll find information about our system call (here is a small section):

```
root@andrei:/sys/kernel/debug/tracing# сat trace

......
          chroot-11321 [000] ....  4606.265208: sys_chroot(filename: 7fff785ae8c2)
          chroot-11325 [000] ....  4691.677767: sys_chroot(filename: 7fff242308cc)
            bash-11338 [000] ....  4746.971300: sys_chroot(filename: 7fff1efca8cc)
            bash-11351 [000] ....  5379.020609: sys_chroot(filename: 7fffbf9918cc)
```

More detailed information about configuring event tracing can be found [here][24].

### Conclusion

In this article, we presented a general overview of ftrace’s capabilities. We’d appreciate any comments or additions. If you’d like to dive deeper into this topic, we recommend looking at the following resources:

*   [https://www.kernel.org/doc/Documentation/trace/tracepoints.txt][1] — a detailed description of the tracepoints mechanism

*   [https://www.kernel.org/doc/Documentation/trace/events.txt][2] — a manual for tracing system events in Linux

*   [https://www.kernel.org/doc/Documentation/trace/ftrace.txt][3] — offical ftrace documentation

*   [https://lttng.org/files/thesis/desnoyers-dissertation-2009-12-v27.pdf][4] — Mathieu Desnoyers’ (the creator of tracepoints and LTTNG author) dissertation about kernel tracing and profiling

*   [https://lwn.net/Articles/370423/][5] — Steven Rostedt’s article on ftrace capabilities

*   [http://alex.dzyoba.com/linux/profiling-ftrace.html][6] — an ftrace overview that analyzes a practical use case

--------------------------------------------------------------------------------

via:https://blog.selectel.com/kernel-tracing-ftrace/

作者：[Andrej Yemelianov][a]
译者：[译者ID](https://github.com/译者ID)
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