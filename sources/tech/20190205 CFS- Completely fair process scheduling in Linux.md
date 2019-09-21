[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (CFS: Completely fair process scheduling in Linux)
[#]: via: (https://opensource.com/article/19/2/fair-scheduling-linux)
[#]: author: (Marty kalin https://opensource.com/users/mkalindepauledu)

CFS: Completely fair process scheduling in Linux
======
CFS gives every task a fair share of processor resources in a low-fuss but highly efficient way. 
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh)

Linux takes a modular approach to processor scheduling in that different algorithms can be used to schedule different process types. A scheduling class specifies which scheduling policy applies to which type of process. Completely fair scheduling (CFS), which became part of the Linux 2.6.23 kernel in 2007, is the scheduling class for normal (as opposed to real-time) processes and therefore is named **SCHED_NORMAL**.

CFS is geared for the interactive applications typical in a desktop environment, but it can be configured as **SCHED_BATCH** to favor the batch workloads common, for example, on a high-volume web server. In any case, CFS breaks dramatically with what might be called "classic preemptive scheduling." Also, the "completely fair" claim has to be seen with a technical eye; otherwise, the claim might seem like an empty boast.

Let's dig into the details of what sets CFS apart from—indeed, above—other process schedulers. Let's start with a quick review of some core technical terms.

### Some core concepts

Linux inherits the Unix view of a process as a program in execution. As such, a process must contend with other processes for shared system resources: memory to hold instructions and data, at least one processor to execute instructions, and I/O devices to interact with the external world. Process scheduling is how the operating system (OS) assigns tasks (e.g., crunching some numbers, copying a file) to processors—a running process then performs the task. A process has one or more threads of execution, which are sequences of machine-level instructions. To schedule a process is to schedule one of its threads on a processor.

In a simplifying move, Linux turns process scheduling into thread scheduling by treating a scheduled process as if it were single-threaded. If a process is multi-threaded with N threads, then N scheduling actions would be required to cover the threads. Threads within a multi-threaded process remain related in that they share resources such as memory address space. Linux threads are sometimes described as lightweight processes, with the lightweight underscoring the sharing of resources among the threads within a process.

Although a process can be in various states, two are of particular interest in scheduling. A blocked process is awaiting the completion of some event such as an I/O event. The process can resume execution only after the event completes. A runnable process is one that is not currently blocked.

A process is processor-bound (aka compute-bound) if it consumes mostly processor as opposed to I/O resources, and I/O-bound in the opposite case; hence, a processor-bound process is mostly runnable, whereas an I/O-bound process is mostly blocked. As examples, crunching numbers is processor-bound, and accessing files is I/O-bound. Although an entire process might be characterized as either processor-bound or I/O-bound, a given process may be one or the other during different stages of its execution. Interactive desktop applications, such as browsers, tend to be I/O-bound.

A good process scheduler has to balance the needs of processor-bound and I/O-bound tasks, especially in an operating system such as Linux that thrives on so many hardware platforms: desktop machines, embedded devices, mobile devices, server clusters, supercomputers, and more.

### Classic preemptive scheduling versus CFS

Unix popularized classic preemptive scheduling, which other operating systems including VAX/VMS, Windows NT, and Linux later adopted. At the center of this scheduling model is a fixed timeslice, the amount of time (e.g., 50ms) that a task is allowed to hold a processor until preempted in favor of some other task. If a preempted process has not finished its work, the process must be rescheduled. This model is powerful in that it supports multitasking (concurrency) through processor time-sharing, even on the single-CPU machines of yesteryear.

The classic model typically includes multiple scheduling queues, one per process priority: Every process in a higher-priority queue gets scheduled before any process in a lower-priority queue. As an example, VAX/VMS uses 32 priority queues for scheduling.

CFS dispenses with fixed timeslices and explicit priorities. The amount of time for a given task on a processor is computed dynamically as the scheduling context changes over the system's lifetime. Here is a sketch of the motivating ideas and technical details:

  * Imagine a processor, P, which is idealized in that it can execute multiple tasks simultaneously. For example, tasks T1 and T2 can execute on P at the same time, with each receiving 50% of P's magical processing power. This idealization describes perfect multitasking, which CFS strives to achieve on actual as opposed to idealized processors. CFS is designed to approximate perfect multitasking.

  * The CFS scheduler has a target latency, which is the minimum amount of time—idealized to an infinitely small duration—required for every runnable task to get at least one turn on the processor. If such a duration could be infinitely small, then each runnable task would have had a turn on the processor during any given timespan, however small (e.g., 10ms, 5ns, etc.). Of course, an idealized infinitely small duration must be approximated in the real world, and the default approximation is 20ms. Each runnable task then gets a 1/N slice of the target latency, where N is the number of tasks. For example, if the target latency is 20ms and there are four contending tasks, then each task gets a timeslice of 5ms. By the way, if there is only a single task during a scheduling event, this lucky task gets the entire target latency as its slice. The fair in CFS comes to the fore in the 1/N slice given to each task contending for a processor.

  * The 1/N slice is, indeed, a timeslice—but not a fixed one because such a slice depends on N, the number of tasks currently contending for the processor. The system changes over time. Some processes terminate and new ones are spawned; runnable processes block and blocked processes become runnable. The value of N is dynamic and so, therefore, is the 1/N timeslice computed for each runnable task contending for a processor. The traditional **nice** value is used to weight the 1/N slice: a low-priority **nice** value means that only some fraction of the 1/N slice is given to a task, whereas a high-priority **nice** value means that a proportionately greater fraction of the 1/N slice is given to a task. In summary, **nice** values do not determine the slice, but only modify the 1/N slice that represents fairness among the contending tasks.

  * The operating system incurs overhead whenever a context switch occurs; that is, when one process is preempted in favor of another. To keep this overhead from becoming unduly large, there is a minimum amount of time (with a typical setting of 1ms to 4ms) that any scheduled process must run before being preempted. This minimum is known as the minimum granularity. If many tasks (e.g., 20) are contending for the processor, then the minimum granularity (assume 4ms) might be more than the 1/N slice (in this case, 1ms). If the minimum granularity turns out to be larger than the 1/N slice, the system is overloaded because there are too many tasks contending for the processor—and fairness goes out the window.

  * When does preemption occur? CFS tries to minimize context switches, given their overhead: time spent on a context switch is time unavailable for other tasks. Accordingly, once a task gets the processor, it runs for its entire weighted 1/N slice before being preempted in favor of some other task. Suppose task T1 has run for its weighted 1/N slice, and runnable task T2 currently has the lowest virtual runtime (vruntime) among the tasks contending for the processor. The vruntime records, in nanoseconds, how long a task has run on the processor. In this case, T1 would be preempted in favor of T2.

  * The scheduler tracks the vruntime for all tasks, runnable and blocked. The lower a task's vruntime, the more deserving the task is for time on the processor. CFS accordingly moves low-vruntime tasks towards the front of the scheduling line. Details are forthcoming because the line is implemented as a tree, not a list.

  * How often should the CFS scheduler reschedule? There is a simple way to determine the scheduling period. Suppose that the target latency (TL) is 20ms and the minimum granularity (MG) is 4ms:

`TL / MG = (20 / 4) = 5 ## five or fewer tasks are ok`

In this case, five or fewer tasks would allow each task a turn on the processor during the target latency. For example, if the task number is five, each runnable task has a 1/N slice of 4ms, which happens to equal the minimum granularity; if the task number is three, each task gets a 1/N slice of almost 7ms. In either case, the scheduler would reschedule in 20ms, the duration of the target latency.

Trouble occurs if the number of tasks (e.g., 10) exceeds TL / MG because now each task must get the minimum time of 4ms instead of the computed 1/N slice, which is 2ms. In this case, the scheduler would reschedule in 40ms:

`(number of tasks) core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated MG = (10 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 4) = 40ms ## period = 40ms`




Linux schedulers that predate CFS use heuristics to promote the fair treatment of interactive tasks with respect to scheduling. CFS takes a quite different approach by letting the vruntime facts speak mostly for themselves, which happens to support sleeper fairness. An interactive task, by its very nature, tends to sleep a lot in the sense that it awaits user inputs and so becomes I/O-bound; hence, such a task tends to have a relatively low vruntime, which tends to move the task towards the front of the scheduling line.

### Special features

CFS supports symmetrical multiprocessing (SMP) in which any process (whether kernel or user) can execute on any processor. Yet configurable scheduling domains can be used to group processors for load balancing or even segregation. If several processors share the same scheduling policy, then load balancing among them is an option; if a particular processor has a scheduling policy different from the others, then this processor would be segregated from the others with respect to scheduling.

Configurable scheduling groups are another CFS feature. As an example, consider the Nginx web server that's running on my desktop machine. At startup, this server has a master process and four worker processes, which act as HTTP request handlers. For any HTTP request, the particular worker that handles the request is irrelevant; it matters only that the request is handled in a timely manner, and so the four workers together provide a pool from which to draw a task-handler as requests come in. It thus seems fair to treat the four Nginx workers as a group rather than as individuals for scheduling purposes, and a scheduling group can be used to do just that. The four Nginx workers could be configured to have a single vruntime among them rather than individual vruntimes. Configuration is done in the traditional Linux way, through files. For vruntime-sharing, a file named **cpu.shares** , with the details given through familiar shell commands, would be created.

As noted earlier, Linux supports scheduling classes so that different scheduling policies, together with their implementing algorithms, can coexist on the same platform. A scheduling class is implemented as a code module in C. CFS, the scheduling class described so far, is **SCHED_NORMAL**. There are also scheduling classes specifically for real-time tasks, **SCHED_FIFO** (first in, first out) and **SCHED_RR** (round robin). Under **SCHED_FIFO** , tasks run to completion; under **SCHED_RR** , tasks run until they exhaust a fixed timeslice and are preempted.

### CFS implementation

CFS requires efficient data structures to track task information and high-performance code to generate the schedules. Let's begin with a central term in scheduling, the runqueue. This is a data structure that represents a timeline for scheduled tasks. Despite the name, the runqueue need not be implemented in the traditional way, as a FIFO list. CFS breaks with tradition by using a time-ordered red-black tree as a runqueue. The data structure is well-suited for the job because it is a self-balancing binary search tree, with efficient **insert** and **remove** operations that execute in **O(log N)** time, where N is the number of nodes in the tree. Also, a tree is an excellent data structure for organizing entities into a hierarchy based on a particular property, in this case a vruntime.

In CFS, the tree's internal nodes represent tasks to be scheduled, and the tree as a whole, like any runqueue, represents a timeline for task execution. Red-black trees are in wide use beyond scheduling; for example, Java uses this data structure to implement its **TreeMap**.

Under CFS, every processor has a specific runqueue of tasks, and no task occurs at the same time in more than one runqueue. Each runqueue is a red-black tree. The tree's internal nodes represent tasks or task groups, and these nodes are indexed by their vruntime values so that (in the tree as a whole or in any subtree) the internal nodes to the left have lower vruntime values than the ones to the right:

```
    25     ## 25 is a task vruntime
    /\
  17  29   ## 17 roots the left subtree, 29 the right one
  /\  ...
 5  19     ## and so on
...  \
     nil   ## leaf nodes are nil
```

In summary, tasks with the lowest vruntime—and, therefore, the greatest need for a processor—reside somewhere in the left subtree; tasks with relatively high vruntimes congregate in the right subtree. A preempted task would go into the right subtree, thus giving other tasks a chance to move leftwards in the tree. A task with the smallest vruntime winds up in the tree's leftmost (internal) node, which is thus the front of the runqueue.

The CFS scheduler has an instance, the C **task_struct** , to track detailed information about each task to be scheduled. This structure embeds a **sched_entity** structure, which in turn has scheduling-specific information, in particular, the vruntime per task or task group:

```
struct task_struct {       /bin /boot /dev /etc /home /lib /lib64 /lost+found /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var info on a task **/
  ...
  struct sched_entity se;  /** vruntime, etc. **/
  ...
};
```

The red-black tree is implemented in familiar C fashion, with a premium on pointers for efficiency. A **cfs_rq** structure instance embeds a **rb_root** field named **tasks_timeline** , which points to the root of a red-black tree. Each of the tree's internal nodes has pointers to the parent and the two child nodes; the leaf nodes have nil as their value.

CFS illustrates how a straightforward idea—give every task a fair share of processor resources—can be implemented in a low-fuss but highly efficient way. It's worth repeating that CFS achieves fair and efficient scheduling without traditional artifacts such as fixed timeslices and explicit task priorities. The pursuit of even better schedulers goes on, of course; for the moment, however, CFS is as good as it gets for general-purpose processor scheduling.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/fair-scheduling-linux

作者：[Marty kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
