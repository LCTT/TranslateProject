[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Can Better Task Stealing Make Linux Faster?)
[#]: via: (https://www.linux.com/blog/can-better-task-stealing-make-linux-faster)
[#]: author: (Oracle )

Can Better Task Stealing Make Linux Faster?
======

_Oracle Linux kernel developer Steve Sistare contributes this discussion on kernel scheduler improvements._

### Load balancing via scalable task stealing

The Linux task scheduler balances load across a system by pushing waking tasks to idle CPUs, and by pulling tasks from busy CPUs when a CPU becomes idle. Efficient scaling is a challenge on both the push and pull sides on large systems. For pulls, the scheduler searches all CPUs in successively larger domains until an overloaded CPU is found, and pulls a task from the busiest group. This is very expensive, costing 10's to 100's of microseconds on large systems, so search time is limited by the average idle time, and some domains are not searched. Balance is not always achieved, and idle CPUs go unused.

I have implemented an alternate mechanism that is invoked after the existing search in idle_balance() limits itself and finds nothing. I maintain a bitmap of overloaded CPUs, where a CPU sets its bit when its runnable CFS task count exceeds 1. The bitmap is sparse, with a limited number of significant bits per cacheline. This reduces cache contention when many threads concurrently set, clear, and visit elements. There is a bitmap per last-level cache. When a CPU becomes idle, it searches the bitmap to find the first overloaded CPU with a migratable task, and steals it. This simple stealing yields a higher CPU utilization than idle_balance() alone, because the search is cheap, costing 1 to 2 microseconds, so it may be called every time the CPU is about to go idle. Stealing does not offload the globally busiest queue, but it is much better than running nothing at all.

### Results

Stealing improves utilization with only a modest CPU overhead in scheduler code. In the following experiment, hackbench is run with varying numbers of groups (40 tasks per group), and the delta in /proc/schedstat is shown for each run, averaged per CPU, augmented with these non-standard stats:

  * %find - percent of time spent in old and new functions that search for idle CPUs and tasks to steal and set the overloaded CPUs bitmap.
  * steal - number of times a task is stolen from another CPU. Elapsed time improves by 8 to 36%, costing at most 0.4% more find time.



![load balancing][1]

[Used with permission][2]

​​CPU busy utilization is close to 100% for the new kernel, as shown by the green curve in the following graph, versus the orange curve for the baseline kernel:

![][3]

Stealing improves Oracle database OLTP performance by up to 9% depending on load, and we have seen some nice improvements for mysql, pgsql, gcc, java, and networking. In general, stealing is most helpful for workloads with a high context switch rate.

### The code

As of this writing, this work is not yet upstream, but the latest patch series is at [https://lkml.org/lkml/2018/12/6/1253. ][4]If your kernel is built with CONFIG_SCHED_DEBUG=y, you can verify that it contains the stealing optimization using

```
# grep -q STEAL /sys/kernel/debug/sched_features && echo Yes
Yes
```

If you try it, note that stealing is disabled for systems with more than 2 NUMA nodes, because hackbench regresses on such systems, as I explain in [https://lkml.org/lkml/2018/12/6/1250 .][5]However, I suspect this effect is specific to hackbench and that stealing will help other workloads on many-node systems. To try it, reboot with kernel parameter sched_steal_node_limit = 8 (or larger).

### Future work

After the basic stealing algorithm is pushed upstream, I am considering the following enhancements:

  * If stealing within the last-level cache does not find a candidate, steal across LLC's and NUMA nodes.
  * Maintain a sparse bitmap to identify stealing candidates in the RT scheduling class. Currently pull_rt_task() searches all run queues.
  * Remove the core and socket levels from idle_balance(), as stealing handles those levels. Remove idle_balance() entirely when stealing across LLC is supported.
  * Maintain a bitmap to identify idle cores and idle CPUs, for push balancing.



_This article originally appeared at[Oracle Developers Blog][6]._

_Oracle Linux kernel developer Steve Sistare contributes this discussion on kernel scheduler improvements._

### Load balancing via scalable task stealing

The Linux task scheduler balances load across a system by pushing waking tasks to idle CPUs, and by pulling tasks from busy CPUs when a CPU becomes idle. Efficient scaling is a challenge on both the push and pull sides on large systems. For pulls, the scheduler searches all CPUs in successively larger domains until an overloaded CPU is found, and pulls a task from the busiest group. This is very expensive, costing 10's to 100's of microseconds on large systems, so search time is limited by the average idle time, and some domains are not searched. Balance is not always achieved, and idle CPUs go unused.

I have implemented an alternate mechanism that is invoked after the existing search in idle_balance() limits itself and finds nothing. I maintain a bitmap of overloaded CPUs, where a CPU sets its bit when its runnable CFS task count exceeds 1. The bitmap is sparse, with a limited number of significant bits per cacheline. This reduces cache contention when many threads concurrently set, clear, and visit elements. There is a bitmap per last-level cache. When a CPU becomes idle, it searches the bitmap to find the first overloaded CPU with a migratable task, and steals it. This simple stealing yields a higher CPU utilization than idle_balance() alone, because the search is cheap, costing 1 to 2 microseconds, so it may be called every time the CPU is about to go idle. Stealing does not offload the globally busiest queue, but it is much better than running nothing at all.

### Results

Stealing improves utilization with only a modest CPU overhead in scheduler code. In the following experiment, hackbench is run with varying numbers of groups (40 tasks per group), and the delta in /proc/schedstat is shown for each run, averaged per CPU, augmented with these non-standard stats:

  * %find - percent of time spent in old and new functions that search for idle CPUs and tasks to steal and set the overloaded CPUs bitmap.
  * steal - number of times a task is stolen from another CPU. Elapsed time improves by 8 to 36%, costing at most 0.4% more find time.



![load balancing][1]

[Used with permission][2]

​​CPU busy utilization is close to 100% for the new kernel, as shown by the green curve in the following graph, versus the orange curve for the baseline kernel:

![][3]

Stealing improves Oracle database OLTP performance by up to 9% depending on load, and we have seen some nice improvements for mysql, pgsql, gcc, java, and networking. In general, stealing is most helpful for workloads with a high context switch rate.

### The code

As of this writing, this work is not yet upstream, but the latest patch series is at [https://lkml.org/lkml/2018/12/6/1253. ][4]If your kernel is built with CONFIG_SCHED_DEBUG=y, you can verify that it contains the stealing optimization using

```
# grep -q STEAL /sys/kernel/debug/sched_features && echo Yes
Yes
```

If you try it, note that stealing is disabled for systems with more than 2 NUMA nodes, because hackbench regresses on such systems, as I explain in [https://lkml.org/lkml/2018/12/6/1250 .][5]However, I suspect this effect is specific to hackbench and that stealing will help other workloads on many-node systems. To try it, reboot with kernel parameter sched_steal_node_limit = 8 (or larger).

### Future work

After the basic stealing algorithm is pushed upstream, I am considering the following enhancements:

  * If stealing within the last-level cache does not find a candidate, steal across LLC's and NUMA nodes.
  * Maintain a sparse bitmap to identify stealing candidates in the RT scheduling class. Currently pull_rt_task() searches all run queues.
  * Remove the core and socket levels from idle_balance(), as stealing handles those levels. Remove idle_balance() entirely when stealing across LLC is supported.
  * Maintain a bitmap to identify idle cores and idle CPUs, for push balancing.



_This article originally appeared at[Oracle Developers Blog][6]._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/can-better-task-stealing-make-linux-faster

作者：[Oracle][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-load-balancing.png?itok=2Uk1yALt (load balancing)
[2]: /LICENSES/CATEGORY/USED-PERMISSION
[3]: https://cdn.app.compendium.com/uploads/user/e7c690e8-6ff9-102a-ac6d-e4aebca50425/b7a700fe-edc3-4ea0-876a-c91e1850b59b/Image/00c074f4282bcbaf0c10dd153c5dfa76/steal_graph.png
[4]: https://lkml.org/lkml/2018/12/6/1253
[5]: https://lkml.org/lkml/2018/12/6/1250
[6]: https://blogs.oracle.com/linux/can-better-task-stealing-make-linux-faster
