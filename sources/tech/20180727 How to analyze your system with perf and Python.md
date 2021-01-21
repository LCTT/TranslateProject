How to analyze your system with perf and Python
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI-)

Modern computers are ever increasing in performance and capacity. This matters little if that increasing capacity is not well utilized. Following is a description of the motivation and work behind "curt," a new tool for Linux systems for measuring and breaking down system utilization by process, by task, and by CPU using the `perf` command's Python scripting capabilities.

I had the privilege of presenting this topic at [Texas Linux Fest 2018][1], and here I've gone a bit deeper into the details, included links to further information, and expanded the scope of my talk.

### System utilization

In discussing computation, let's begin with some assertions:

  1. Every computational system is equally fast at doing nothing.
  2. Computational systems were created to do things.
  3. A computational system is better at doing things when it is doing something than when it is doing nothing.



Modern computational systems have many streams of execution:

  * Often, very large systems are created by literally wiring together smaller systems. At IBM, these smaller systems are sometimes called CECs (short for Central Electronics Complexes and pronounced "keks").
  * There are multiple sockets for processor modules in each system.
  * There are sometimes multiple chips per socket (in the form of dual-chip modules閳ユ摖CMs閳ユ攼r multi-chip modules閳ユ摤CMs).
  * There are multiple cores per chip.
  * There are multiple threads per core.



In sum, there are potentially thousands of execution threads across a single computational system.

Ideally, all these execution streams are 100% busy doing useful work. One measure of **utilization** for an individual execution stream (CPU thread) is the percentage of time that thread has tasks scheduled and running. (Note that I didn't say  "doing useful work." Creating a tool that measures useful work is left as an exercise for the reader.) By extension, **system utilization** is the overall percentage of time that all execution streams of a system have tasks scheduled and running. Similarly, utilization can be defined with respect to an individual task. **Task utilization** is the percentage of the lifetime of the task that was spent actively running on any CPU thread. By extension, **process utilization** is the collective utilization of its tasks.

### Utilization measurement tools

There are tools that measure system utilization: `uptime`, `vmstat`, `mpstat`, `nmon`, etc. There are tools that measure individual process utilization: `time`. There are not many tools that measure system-wide per-process and per-task utilization. One such command is `curt` on AIX. According to [IBM's Knowledge Center][2]: "The `curt` command takes an AIX trace file as input and produces a number of statistics related to processor (CPU) utilization and process/thread/pthread activity."

The AIX `curt` command reports system-wide, per-processor, per-process, and per-task statistics for application processing (user time), system calls (system time), hypervisor calls, kernel threads, interrupts, and idle time.

This seems like a good model for a similar command for a Linux system.

### Utilization data

Before starting to create any tools for utilization analysis, it is important to know what data is required. Since utilization is directly related to whether a task is actively running or not, related scheduling events are required: When is the task made to run, and when is it paused? Tracking on which CPU the task runs is important, so migration events are required for implicit migrations. There are also certain system calls that force explicit migrations. Creation and deletion of tasks are obviously important. Since we want to understand user time, system time, hypervisor time, and interrupt time, events that show the transitions between those task states are required.

The Linux kernel contains "tracepoints" for all those events. It is possible to enable tracing for those events directly in the kernel's `debugfs` filesystem, usually mounted at `/sys/kernel/debug`, in the `tracing` directory (`/sys/kernel/debug/tracing`).

An easier way to record tracing data is with the Linux `perf` command.

### The perf command

`perf` is a very powerful userspace command for tracing or counting both hardware and software events.

Software events are predefined in the kernel, can be predefined in userspace code, and can be dynamically created (as "probes") in kernel or userspace code.

`perf` can do much more than just trace and count, though.

#### perf stat

The `stat` subcommand of `perf` will run a command, count some events commonly found interesting, and produce a simple report:
```
Performance counter stats for './load 100000':
鑱�
鑱� 鑱� 鑱� 90537.006424 鑱� 鑱� 鑱絫ask-clock:u (msec) 鑱� 鑱� 鑱� # 鑱� 鑱�1.000 CPUs utilized 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�0 鑱� 鑱� 鑱絚ontext-switches:u 鑱� 鑱� 鑱� 鑱�# 鑱� 鑱�0.000 K/sec 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�0 鑱� 鑱� 鑱絚pu-migrations:u 鑱� 鑱� 鑱� 鑱� 鑱�# 鑱� 鑱�0.000 K/sec 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�915 鑱� 鑱� 鑱絧age-faults:u 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # 鑱� 鑱�0.010 K/sec 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱�386,836,206,133 鑱� 鑱� 鑱絚ycles:u 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�# 鑱� 鑱�4.273 GHz 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�(66.67%)
鑱� 鑱� 鑱�3,488,523,420 鑱� 鑱� 鑱絪talled-cycles-frontend:u # 鑱� 鑱�0.90% frontend cycles idle 鑱� 鑱� (50.00%)
鑱� 鑱�287,222,191,827 鑱� 鑱� 鑱絪talled-cycles-backend:u 鑱�# 鑱� 74.25% backend cycles idle 鑱� 鑱� 鑱�(50.00%)
鑱� 鑱�291,102,378,513 鑱� 鑱� 鑱絠nstructions:u 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�# 鑱� 鑱�0.75 鑱絠nsn per cycle 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # 鑱� 鑱�0.99 鑱絪talled cycles per insn 鑱�(66.67%)
鑱� 鑱� 43,730,320,236 鑱� 鑱� 鑱絙ranches:u 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�# 鑱�483.010 M/sec 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�(50.00%)
鑱� 鑱� 鑱� 鑱�822,030,340 鑱� 鑱� 鑱絙ranch-misses:u 鑱� 鑱� 鑱� 鑱� 鑱� # 鑱� 鑱�1.88% of all branches 鑱� 鑱� 鑱� 鑱� 鑱�(50.00%)
鑱�
鑱� 鑱� 鑱� 90.539972837 seconds time elapsed
```

#### perf record, perf report, and perf annotate

For much more interesting analysis, the `perf` command can also be used to record events and information associated with the task state at the time the event occurred:
```
$ perf record ./some-command
[ perf record: Woken up 55 times to write data ]
[ perf record: Captured and wrote 13.973 MB perf.data (366158 samples) ]
$ perf report --stdio --show-nr-samples --percent-limit 4
# Samples: 366K of event 'cycles:u'
# Event count (approx.): 388851358382
#
# Overhead 鑱� 鑱� 鑱� Samples 鑱紺ommand 鑱絊hared Object 鑱� 鑱� 鑱絊ymbol 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
# ........ 鑱�............ 鑱�....... 鑱�................. 鑱�................................................
#
鑱� 鑱� 62.31% 鑱� 鑱� 鑱� 鑱�228162 鑱絣oad 鑱� 鑱� load 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [.] main
鑱� 鑱� 19.29% 鑱� 鑱� 鑱� 鑱� 70607 鑱絣oad 鑱� 鑱� load 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [.] sum_add
鑱� 鑱� 18.33% 鑱� 鑱� 鑱� 鑱� 67117 鑱絣oad 鑱� 鑱� load 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [.] sum_sub
```

This example shows a program that spends about 60% of its running time in the function `main` and about 20% each in subfunctions `sum_sub` and `sum_add`. Note that the default event used by `perf record` is "cycles." Later examples will show how to use `perf record` with other events.

`perf report` can further report runtime statistics by source code line (if the compilation was performed with the `-g` flag to produce debug information):
```
$ perf report --stdio --show-nr-samples --percent-limit 4 --sort=srcline
# Samples: 366K of event 'cycles:u'
# Event count (approx.): 388851358382
#
# Overhead 鑱� 鑱� 鑱� Samples 鑱絊ource:Line 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
# ........ 鑱�............ 鑱�...................................
#
鑱� 鑱� 19.40% 鑱� 鑱� 鑱� 鑱� 71031 鑱絣oad.c:58
鑱� 鑱� 16.16% 鑱� 鑱� 鑱� 鑱� 59168 鑱絣oad.c:18
鑱� 鑱� 15.11% 鑱� 鑱� 鑱� 鑱� 55319 鑱絣oad.c:14
鑱� 鑱� 13.30% 鑱� 鑱� 鑱� 鑱� 48690 鑱絣oad.c:66
鑱� 鑱� 13.23% 鑱� 鑱� 鑱� 鑱� 48434 鑱絣oad.c:70
鑱� 鑱� 鑱�4.58% 鑱� 鑱� 鑱� 鑱� 16767 鑱絣oad.c:62
鑱� 鑱� 鑱�4.01% 鑱� 鑱� 鑱� 鑱� 14677 鑱絣oad.c:56
```

Further, `perf annotate` can show statistics for each instruction of the program:
```
$ perf annotate --stdio
Percent | 鑱� 鑱� 鑱絊ource code & Disassembly of load for cycles:u (70607 samples)
------------------------------------------------------------------------------
鑱� 鑱� 鑱� 鑱� 鑱�: 鑱� 鑱� 鑱�0000000010000774 <sum_add>:
鑱� 鑱� 鑱� 鑱� 鑱�: 鑱� 鑱� 鑱絠nt sum_add(int sum, int value) {
鑱� 鑱�12.60 : 鑱� 鑱� 鑱� 鑱�10000774: 鑱� std 鑱� 鑱� r31,-8(r1)
鑱� 鑱� 0.02 : 鑱� 鑱� 鑱� 鑱�10000778: 鑱� stdu 鑱� 鑱絩1,-64(r1)
鑱� 鑱� 0.00 : 鑱� 鑱� 鑱� 鑱�1000077c: 鑱� mr 鑱� 鑱� 鑱絩31,r1
鑱� 鑱�41.90 : 鑱� 鑱� 鑱� 鑱�10000780: 鑱� mr 鑱� 鑱� 鑱絩10,r3
鑱� 鑱� 0.00 : 鑱� 鑱� 鑱� 鑱�10000784: 鑱� mr 鑱� 鑱� 鑱絩9,r4
鑱� 鑱� 0.05 : 鑱� 鑱� 鑱� 鑱�10000788: 鑱� stw 鑱� 鑱� r10,32(r31)
鑱� 鑱�23.78 : 鑱� 鑱� 鑱� 鑱�1000078c: 鑱� stw 鑱� 鑱� r9,36(r31)
鑱� 鑱� 鑱� 鑱� 鑱�: 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絩eturn (sum + value);
鑱� 鑱� 0.76 : 鑱� 鑱� 鑱� 鑱�10000790: 鑱� lwz 鑱� 鑱� r10,32(r31)
鑱� 鑱� 0.00 : 鑱� 鑱� 鑱� 鑱�10000794: 鑱� lwz 鑱� 鑱� r9,36(r31)
鑱� 鑱�14.75 : 鑱� 鑱� 鑱� 鑱�10000798: 鑱� add 鑱� 鑱� r9,r10,r9
鑱� 鑱� 0.00 : 鑱� 鑱� 鑱� 鑱�1000079c: 鑱� extsw 鑱� r9,r9
鑱� 鑱� 鑱� 鑱� 鑱�: 鑱� 鑱� 鑱絵
鑱� 鑱� 6.09 : 鑱� 鑱� 鑱� 鑱�100007a0: 鑱� mr 鑱� 鑱� 鑱絩3,r9
鑱� 鑱� 0.02 : 鑱� 鑱� 鑱� 鑱�100007a4: 鑱� addi 鑱� 鑱絩1,r31,64
鑱� 鑱� 0.03 : 鑱� 鑱� 鑱� 鑱�100007a8: 鑱� ld 鑱� 鑱� 鑱絩31,-8(r1)
鑱� 鑱� 0.00 : 鑱� 鑱� 鑱� 鑱�100007ac: 鑱� blr
```

(Note: this code is not optimized.)

#### perf top

Similar to the `top` command, which displays (at a regular update interval) the processes using the most CPU time, `perf top` will display the functions using the most CPU time among all processes on the system, a nice leap in granularity.

![](https://opensource.com/sites/default/files/uploads/perf-top.gif)

#### perf list

The examples thus far have used the default event, run cycles. There are hundreds and perhaps thousands of events of different types. `perf list` will show them all. Following are just a few examples:
```
$ perf list
鑱� instructions 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Hardware event]
鑱� context-switches OR cs 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Software event]
鑱� L1-icache-loads 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絒Hardware cache event]
鑱� mem_access OR cpu/mem_access/ 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絒Kernel PMU event]
cache:
鑱� pm_data_from_l2 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱絒The processor's data cache was reloaded from local core's L2 due to a demand load]
floating point:
鑱� pm_fxu_busy 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱絒fxu0 busy and fxu1 busy]
frontend:
鑱� pm_br_mpred_cmpl 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱絒Number of Branch Mispredicts]
memory:
鑱� pm_data_from_dmem 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱絒The processor's data cache was reloaded from another chip's memory on the same Node or Group (Distant) due to a demand load]
鑱� pm_data_from_lmem 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱絒The processor's data cache was reloaded from the local chip's Memory due to a demand load]
鑱� rNNN 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Raw hardware event descriptor]
鑱� raw_syscalls:sys_enter 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Tracepoint event]
鑱� syscalls:sys_enter_chmod 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Tracepoint event]
鑱� sdt_libpthread:pthread_create 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絒SDT event]
```

Events labeled as `Hardware event`, `Hardware cache event`, `Kernel PMU event`, and most (if not all) of the events under the categories like `cache`, `floating point`, `frontend`, and `memory` are hardware events counted by the hardware and triggered each time a certain count is reached. Once triggered, an entry is made into the kernel trace buffer with the current state of the associated task. `Raw hardware event` codes are alphanumeric encodings of the hardware events. These are mostly needed when the hardware is newer than the kernel and the user needs to enable events that are new for that hardware. Users will rarely, if ever, need to use raw event codes.

Events labeled `Tracepoint event` are embedded in the kernel. These are triggered when that section of code is executed by the kernel. There are "syscalls" events for every system call supported by the kernel. `raw_syscalls` events are triggered for every system call. Since there is a limit to the number of events being actively traced, the `raw_syscalls` events may be more practical when a large number of system calls need to be traced.

Events labeled `SDT event` are for software-defined tracepoints (SDTs). These can be embedded in application or library code and enabled as needed. When enabled, they behave just like other events: When that section of code is executed (by any task being traced on the system), an entry is made in the kernel trace buffer with the current state of the associated task. This is a very powerful capability that can prove very useful.

#### perf buildid-cache and perf probe

Enabling SDTs is easy. First, make the SDTs for a certain library known to `perf`:
```
$ perf buildid-cache -v --add /lib/powerpc64le-linux-gnu/libpthread.so.0
$ perf list | grep libpthread
[閳ヮ泝
鑱� sdt_libpthread:pthread_create 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絒SDT event]
[閳ヮ泝
```

Then, turn SDT definitions into available tracepoints:
```
$ /usr/bin/sudo perf probe sdt_libpthread:pthread_create
Added new event:
鑱� sdt_libpthread:pthread_create (on %pthread_create in /lib/powerpc64le-linux-gnu/libpthread-2.27.so)
You can now use it in all perf tools, such as:
鑱� 鑱� perf record -e sdt_libpthread:pthread_create -aR sleep 1
$ perf record -a -e sdt_libpthread:pthread_create ./test
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.199 MB perf.data (9 samples) ]
```

Note that any location in an application or library can be made into a tracepoint. To find functions in an application that can be made into tracepoints, use `perf probe` with `閳ユ徎uncs`:
```
$ perf probe 閳ユ悪 ./load --funcs
[閳ヮ泝
main
sum_add
sum_sub
```

To enable the function `main` of the `./load` application as a tracepoint:
```
/usr/bin/sudo perf probe 閳ユ悪 ./load main
Added new event:
鑱� probe_load:main 鑱� 鑱� 鑱�(on main in /home/pc/projects/load-2.1pc/load)
You can now use it in all perf tools, such as:
鑱� 鑱� perf record 閳ユ徍 probe_load:main 閳ユ彸R sleep 1
$ perf list | grep load:main
鑱� probe_load:main 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Tracepoint event]
$ perf record 閳ユ徍 probe_load:main ./load
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.024 MB perf.data (1 samples) ]
```

#### perf script

Continuing the previous example, `perf script` can be used to walk through the `perf.data` file and output the contents of each record:
```
$ perf script
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� Load 16356 [004] 80526.760310: probe_load:main: (4006a2)
```

### Processing perf trace data

The preceding discussion and examples show that `perf` can collect the data required for system utilization analysis. However, how can that data be processed to produce the desired results?

#### perf eBPF

A relatively new and emerging technology with `perf` is called [eBPF][3]. BPF is an acronym for Berkeley Packet Filter, and it is a C-like language originally for, not surprisingly, network packet filtering in the kernel. eBPF is an acronym for extended BPF, a similar, but more robust C-like language based on BPF.

Recent versions of `perf` can be used to incorporate compiled eBPF code into the kernel to securely and intelligently handle events for any number of purposes, with some limitations.

The capability is very powerful and quite useful for real-time, continuous updates of event-related data and statistics.

However, as this capability is emerging, support is mixed on current releases of Linux distributions. It's a bit complicated (or, put differently, I have not figured it out yet). It's also only for online use; there is no offline capability. For these reasons, I won't cover it further here.

#### perf data file

`perf record` produces a `perf.data` file. The file is a structured binary file, is not particularly well documented, has no programming interface for access, and is unclear on what compatibility guarantees exist. For these reasons, I chose not to directly use the `perf.data` file.

#### perf script

One of the last examples above showed how `perf script` is used for walking through the `perf.data` file and emitting basic information about each record there. This is an appropriate model for what would be needed to process the file and track the state changes and compute the statistics required for system utilization analysis.

`perf script` has several modes of operation, including several higher-level scripts that come with `perf` that produce statistics based on the trace data in a `perf.data` file.
```
$ perf script -l
List of available trace scripts:
鑱� rw-by-pid 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絪ystem-wide r/w activity
鑱� rwtop [interval] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� system-wide r/w top
鑱� wakeup-latency 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� system-wide min/max/avg wakeup latency
鑱� failed-syscalls [comm] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� system-wide failed syscalls
鑱� rw-by-file <comm> 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絩/w activity for a program, by file
鑱� failed-syscalls-by-pid [comm] 鑱� 鑱� 鑱� 鑱絪ystem-wide failed syscalls, by pid
鑱� intel-pt-events 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絧rint Intel PT Power Events and PTWRITE
鑱� syscall-counts-by-pid [comm] 鑱� 鑱� 鑱� 鑱� system-wide syscall counts, by pid
鑱� export-to-sqlite [database name] [columns] [calls] export perf data to a sqlite3 database
鑱� futex-contention 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� futext contention measurement
鑱� sctop [comm] [interval] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絪yscall top
鑱� event_analyzing_sample 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� analyze all perf samples
鑱� net_dropmonitor 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絛isplay a table of dropped frames
鑱� compaction-times [-h] [-u] [-p|-pv] [-t | [-m] [-fs] [-ms]] [pid|pid-range|comm-regex] display time taken by mm compaction
鑱� export-to-postgresql [database name] [columns] [calls] export perf data to a postgresql database
鑱� stackcollapse 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絧roduce callgraphs in short form for scripting use
鑱� netdev-times [tx] [rx] [dev=] [debug] display a process of packet and processing time
鑱� syscall-counts [comm] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絪ystem-wide syscall counts
鑱� sched-migration 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絪ched migration overview
$ perf script failed-syscalls-by-pid /bin/ls
鑱�
syscall errors:
鑱�
comm [pid] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count
------------------------------ 鑱�----------
鑱�
ls [18683]
鑱� syscall: access 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� err = ENOENT 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 1
鑱� syscall: statfs 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� err = ENOENT 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 1
鑱� syscall: ioctl 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� err = ENOTTY 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 3
```

What do these scripts look like? Let's find out.
```
$ locate failed-syscalls-by-pid
/usr/libexec/perf-core/scripts/python/failed-syscalls-by-pid.py
[閳ヮ泝
$ rpm 閳ユ悗f /usr/libexec/perf-core/scripts/python/failed-syscalls-by-pid.py
perf-4.14.0-46.el7a.x86_64
$ $ ls /usr/libexec/perf-core/scripts
perl 鑱絧ython
$ perf script -s lang
鑱�
Scripting language extensions (used in perf script -s [spec:]script.[spec]):
鑱�
鑱� Perl 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Perl]
鑱� pl 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Perl]
鑱� Python 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Python]
鑱� py 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Python]
```

So, these scripts come with `perf`, and both Python and Perl are supported languages.

Note that for the entirety of this content, I will refer exclusively to Python.

#### perf scripts

How do these scripts do what they do? Here are important extracts from `/usr/libexec/perf-core/scripts/python/failed-syscalls-by-pid.py`:
```
def raw_syscalls__sys_exit(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, id, ret):
[閳ヮ泝
鑱� 鑱� 鑱� 鑱� if ret < 0:
[閳ヮ泝
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� syscalls[common_comm][common_pid][id][ret] += 1
```

The function `raw_syscalls__sys_exit` has parameters for all the data for the associated event. The rest of the function only increments a counter associated with the command, process ID, and system call. The rest of the code doesn't do that much. Most of the complexity is in the function signature for the event-handling routine.

Fortunately, `perf` makes it easy to figure out the proper signatures for various tracepoint event-handling functions.

#### perf script 閳ユ徏en-script

For the `raw_syscalls` events, we can generate a trace containing just those events:
```
$ perf list | grep raw_syscalls
鑱� raw_syscalls:sys_enter 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� [Tracepoint event]
鑱� raw_syscalls:sys_exit 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絒Tracepoint event]
$ perf record -e 'raw_syscalls:*' /bin/ls >/dev/null
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.025 MB perf.data (176 samples) ]
```

We can then have `perf` generate a script that contains sample implementations of event-handling functions for the events in the `perf.data` file:
```
$ perf script --gen-script python
generated Python script: perf-script.py
```

What do we find in the script?
```
def raw_syscalls__sys_exit(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, id, ret):
[閳ヮ泝
def raw_syscalls__sys_enter(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, id, args):
```

Both event-handling functions are specified with their signatures. Nice!

Note that this script works with `perf script 閳ユ悞`:
```
$ perf script -s ./perf-script.py
in trace_begin
raw_syscalls__sys_exit 鑱� 鑱� 7 94571.445908134 鑱� 鑱�21117 ls 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絠d=0, ret=0
raw_syscalls__sys_enter 鑱� 鑱� 7 94571.445942946 鑱� 鑱�21117 ls 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絠d=45, args=閿熸枻鎷烽敓锟�?bc閿熸枻鎷烽敓锟�?閿燂拷
[閳ヮ泝
```

Now we have a template on which to base writing a Python script to parse the events of interest for reporting system utilization.

### perf scripting

The Python scripts generated by `perf script 閳ユ徏en-script` are not directly executable. They must be invoked by `perf`:
```
$ perf script 閳ユ悞 ./perf-script.py
```

What's really going on here?

  1. First, `perf` starts. The `script` subcommand's `-s` option indicates that an external script will be used.

  2. `perf` establishes a Python runtime environment.

  3. `perf` loads the specified script.

  4. `perf` runs the script. The script can perform normal initialization and even handle command line arguments, although passing the arguments is slightly awkward, requiring a `--` separator between the arguments for `perf` and for the script:
  ```
  $ perf script -s ./perf-script.py -- --script-arg1 [...]
  
  ```

  5. `perf` processes each record of the trace file, calling the appropriate event-handling function in the script. Those event-handling functions can do whatever they need to do.




### Utilization

It appears that `perf` scripting has sufficient capabilities for a workable solution. What sort of information is required to generate the statistics for system utilization?

  * Task creation (`fork`, `pthread_create`)
  * Task termination (`exit`)
  * Task replacement (`exec`)
  * Task migration, explicit or implicit, and current CPU
  * Task scheduling
  * System calls
  * Hypervisor calls
  * Interrupts



It can be helpful to understand what portion of time a task spends in various system calls, handling interrupts, or making explicit calls out to the hypervisor. Each of these categories of time can be considered a "state" for the task, and the methods of transitioning from one state to another need to be tracked:

![](https://opensource.com/sites/default/files/uploads/task-state-diagram.png)

The most important point of the diagram is that there are events for each state transition.

  * Task creation: `clone` system call
  * Task termination: `sched:sched_process_exit`
  * Task replacement: `sched:sched_process_exec`
  * Task migration: `sched_setaffinity` system call (explicit), `sched:sched_migrate_task` (implicit)
  * Task scheduling: `sched:sched_switch`
  * System calls: `raw_syscalls:sys_enter`, `raw_syscalls:sys_exit`
  * Hypervisor calls: (POWER-specific) `powerpc:hcall_entry`, `powerpc:hcall_exit`
  * Interrupts: `irq:irq_handler_entry`, `irq:irq_handler_exit`



### The curt command for Linux

`perf` provides a suitable infrastructure with which to capture the necessary data for system utilization. There are a sufficient set of events available for tracing in the Linux kernel. The Python scripting capabilities permit a powerful and flexible means of processing the trace data. It's time to write the tool.

#### High-level design

In processing each event, the relevant state of the affected tasks must be updated:

  * New task? Create and initialize data structures to track the task's state
    * Command
    * Process ID
    * Task ID
    * Migration count (0)
    * Current CPU
  * New CPU for this task? Create and initialize data structures for CPU-specific data
    * User time (0)
    * System time (0)
    * Hypervisor time (0)
    * Interrupt time (0)
    * Idle time (0)
  * New transaction for this task? Create and initialize data structures for transaction-specific data
    * Elapsed time (0)
    * Count (0)
    * Minimum (maxint), maximum (0)
  * Existing task?
    * Accumulate time for the previous state
    * Transaction ending? Accumulate time for the transaction, adjust minimum, maximum values
  * Set new state
  * Save current time (time current state entered)
  * Migration? Increment migration count



#### High-level example

For a `raw_syscalls:sys_enter` event:

  * If this task has not been seen before, allocate and initialize a new task data structure
  * If the CPU is new for this task, allocate and initialize a new CPU data structure
  * If this system call is new for this task, allocate and initialize a new call data structure
  * In the task data structure:
    * Accumulate the time since the last state change in a bucket for the current state ("user")
    * Set the new state ("system")
    * Save the current timestamp as the start of this time period for the new state



#### Edge cases

##### sys_exit as a task's first event

If the first event in the trace for a task is `raw_syscalls:sys_exit`:

  * There is no matching `raw_syscalls:sys_enter` with which to determine the start time of this system call.
  * The accumulated time since the start of the trace was all spent in the system call and needs to be added to the overall elapsed time spent in all calls to this system call.
  * The elapsed time of this system call is unknown.
  * It would be inaccurate to account for this elapsed time in the average, minimum, or maximum statistics for this system call.



In this case, the tool creates a separate bucket called "pending" for time spent in the system call that cannot be accounted for in the average, minimum, or maximum.

A "pending" bucket is required for all transactional events (system calls, hypervisor calls, and interrupts).

##### sys_enter as a task's last event

Similarly, If the last event in the trace for a task is `raw_syscalls:sys_enter`:

  * There is no matching `raw_syscalls:sys_exit` with which to determine the end time of this system call.
  * The accumulated time from the start of the system call to the end of the trace was all spent in the system call and needs to be added to the overall elapsed time spent in all calls to this system call.
  * The elapsed time of this system call is unknown.
  * It would be inaccurate to account for this elapsed time in the average, minimum, or maximum statistics for this system call.



This elapsed time is also accumulated in the "pending" bucket.

A "pending" bucket is required for all transactional events (system calls, hypervisor calls, and interrupts).

Since this condition can only be discovered at the end of the trace, a final "wrap-up" step is required in the tool where the statistics for all known tasks are completed based on their final states.

##### Indeterminable state

It is possible that a very busy task (or a short trace) will never see an event for a task from which the task's state can be determined. For example, if only `sched:sched_switch` or `sched:sched_task_migrate` events are seen for a task, it is impossible to determine that task's state. However, the task is known to exist and to be running.

Since the actual state cannot be determined, the runtime for the task is accumulated in a separate bucket, arbitrarily called "busy-unknown." For completeness, this time is also displayed in the final report.

##### Invisible tasks

For very, very busy tasks (or a short trace), it is possible that a task was actively running during the entire time the trace was being collected, but no events for that task appear in the trace. It was never migrated, paused, or forced to wait.

Such tasks cannot be known to exist by the tool and will not appear in the report.

#### curt.py Python classes

##### Task

  * One per task
  * Holds all task-specific data (command, process ID, state, CPU, list of CPU data structures [see below], migration count, lists of per-call data structures [see below])
  * Maintains task state



##### Call

  * One per unique transaction, per task (for example, one for the "open" system call, one for the "close" system call, one for IRQ 27, etc.)
  * Holds call-specific data (e.g., start timestamp, count, elapsed time, minimum, maximum)
  * Allocated as needed (lazy allocation)
  * Stored within a task in a Python dictionary indexed by the unique identifier of the call (e.g., system call code, IRQ number, etc.)



##### CPU

  * One per CPU on which this task has been observed to be running
  * Holds per-CPU task data (e.g., user time, system time, hypervisor call time, interrupt time)
  * Allocated as needed (lazy allocation)
  * Stored within a task in a Python dictionary indexed by the CPU number



#### curt.py event processing example

As previously discussed, `perf script` will iterate over all events in the trace and call the appropriate event-handling function for each event.

A first attempt at an event-handling function for `sys_exit`, given the high-level example above, might be:
```
tasks = {}

def raw_syscalls__sys_enter(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, args):
 
  # convert the multiple timestamp values into a single value
  timestamp = nsecs(common_secs, common_nsecs)

  # find this task's data structure
  try:
    task = tasks[common_pid]
  except:
    # new task!
    task = Task()
    # save the command string
    task.comm = common_comm
    # save the new task in the global list (dictionary) of tasks
    tasks[common_pid] = task

  if common_cpu not in task.cpus:
    # new CPU!
    task.cpu = common_cpu
    task.cpus[common_cpu] = CPU()

  # compute time spent in the previous state ('user')
  delta = timestamp 閳ワ拷 task.timestamp
  # accumulate 'user' time for this task/CPU
  task.cpus[task.cpu].user += delta
  if id not in task.syscalls:
    # new system call for this task!
    task.syscalls[id] = Call()

  # change task's state
  task.mode = 'sys'

  # save the timestamp for the last event (this one) for this task
  task.timestamp = timestamp

def raw_syscalls__sys_exit(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, ret):

  # convert the multiple timestamp values into a single value
  timestamp = nsecs(common_secs, common_nsecs)

  # get the task data structure
  task = tasks[common_pid]

  # compute elapsed time for this system call
  delta =  task.timestamp - timestamp

  # accumulate time for this task/system call
  task.syscalls[id].elapsed += delta
  # increment the tally for this task/system call
  task.syscalls[id].count += 1
  # adjust statistics
  if delta < task.syscalls[id].min:
    task.syscalls[id].min = delta
  if delta > task.syscalls[id].max:
    task.syscalls[id].max = delta

  # accumulate time for this task's state on this CPU
  task.cpus[common_cpu].system += delta

  # change task's state
  task.mode = 'user'

  # save the timestamp for the last event (this one) for this task
  task.timestamp = timestamp
```

### Handling the edge cases

Following are some of the edge cases that are possible and must be handled.

#### Sys_exit as first event

As a system-wide trace can be started at an arbitrary time, it is certainly possible that the first event for a task is `raw_syscalls:sys_exit`. This requires adding the same code for new task discovery from the event-handling function for `raw_syscalls:sys_enter` to the handler for `raw_syscalls:sys_exit`. This:
```
鑱� # get the task data structure
鑱� task = tasks[common_pid]
```

becomes this:
```
鑱� # find this task's data structure
鑱� try:
鑱� 鑱� task = tasks[common_pid]
鑱� except:
鑱� 鑱� # new task!
鑱� 鑱� task = Task()
鑱� 鑱� # save the command string
鑱� 鑱� task.comm = common_comm
鑱� 鑱� # save the new task in the global list (dictionary) of tasks
鑱� 鑱� tasks[common_pid] = task
```

Another issue is that it is impossible to properly accumulate the data for this system call since there is no timestamp for the start of the system call. The time from the start of the trace until this event has been spent by this task in the system call. It would be inaccurate to ignore this time. It would also be inaccurate to incorporate this time such that it is used to compute the average, minimum, or maximum. The only reasonable option is to accumulate this separately, calling it "pending" system time. To accurately compute this time, the timestamp of the first event of the trace must be known. Since any event could be the first event in the trace, every event must conditionally save its timestamp if it is the first event. A global variable is required:
```
start_timestamp = 0

```

And every event-handling function must conditionally save its timestamp:
```
鑱� # convert the multiple timestamp values into a single value
鑱� timestamp = nsecs(common_secs, common_nsecs)

鑱� If start_timestamp = 0:
鑱� 鑱� start_timestamp = timestamp
```

So, the event-handling function for `raw_syscalls:sys_exit` becomes:
```
def raw_syscalls__sys_exit(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, ret):

鑱� # convert the multiple timestamp values into a single value
鑱� timestamp = nsecs(common_secs, common_nsecs)

鑱� If start_timestamp = 0:
鑱� 鑱� start_timestamp = timestamp

鑱� # find this task's data structure
鑱� try:
鑱� 鑱� task = tasks[common_pid]

鑱� 鑱� # compute elapsed time for this system call
鑱� 鑱� delta = 鑱絫ask.timestamp - timestamp

鑱� 鑱� # accumulate time for this task/system call
鑱� 鑱� task.syscalls[id].elapsed += delta
鑱� 鑱� # increment the tally for this task/system call
鑱� 鑱� task.syscalls[id].count += 1
鑱� 鑱� # adjust statistics
鑱� 鑱� if delta < task.syscalls[id].min:
鑱� 鑱� 鑱� task.syscalls[id].min = delta
鑱� 鑱� if delta > task.syscalls[id].max:
鑱� 鑱� 鑱� task.syscalls[id].max = delta

鑱� except:
鑱� 鑱� # new task!
鑱� 鑱� task = Task()
鑱� 鑱� # save the command string
鑱� 鑱� task.comm = common_comm
鑱� 鑱� # save the new task in the global list (dictionary) of tasks
鑱� 鑱� tasks[common_pid] = task

鑱� 鑱� # compute elapsed time for this system call
鑱� 鑱� delta = 鑱絪tart_timestamp - timestamp

鑱� 鑱� # accumulate time for this task/system call
鑱� 鑱� task.syscalls[id].pending += delta

鑱� # accumulate time for this task's state on this CPU
鑱� task.cpus[common_cpu].system += delta

鑱� # change task's state
鑱� task.mode = 'user'

鑱� # save the timestamp for the last event (this one) for this task
鑱� task.timestamp = timestamp
```
### Sys_enter as last event

A similar issue to having `sys_exit` as the first event for a task is when `sys_enter` is the last event seen for a task. The time spent in the system call must be accumulated for completeness but can't accurately impact the average, minimum, nor maximum. This time will also be accumulated in for a separate "pending" state.

To accurately determine the elapsed time of the pending system call, from `sys_entry` to the end of the trace period, the timestamp of the final event in the trace file is required. Unfortunately, there is no way to know which event is the last event until that event has already been processed. So, all events must save their respective timestamps in a global variable.

It may be that many tasks are in the state where the last event seen for them was `sys_enter`. Thus, after the last event is processed, a final "wrap up" step is required to complete the statistics for those tasks. Fortunately, there is a `trace_end` function which is called by `perf` after the final event has been processed.

Last, we need to save the `id` of the system call in every `sys_enter`.
```
curr_timestamp = 0

def raw_syscalls__sys_enter(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, args):

鑱� # convert the multiple timestamp values into a single value
鑱� curr_timestamp = nsecs(common_secs, common_nsecs)
[閳ヮ泝
鑱� task.syscall = id
[閳ヮ泝

def trace_end():
鑱� 鑱� 鑱� 鑱� for tid in tasks.keys():
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task = tasks[tid]
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # if this task ended while executing a system call
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if task.mode == 'sys':
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # compute the time from the entry to the system call to the end of the trace period
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� delta = curr_timestamp - task.timestamp
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # accumulate the elapsed time for this system call
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.syscalls[task.syscall].pending += delta
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # accumulate the system time for this task/CPU
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.cpus[task.cpu].sys += delta
```

### Migrations

A task migration is when a task running on one CPU is moved to another CPU. This can happen by either:

  1. Explicit request (e.g., a call to `sched_setaffinity`), or
  2. Implicitly by the kernel (e.g., load balancing or vacating a CPU being taken offline)



When detected:

  * The migration count for the task should be incremented
  * The statistics for the previous CPU should be updated
  * A new CPU data structure may need to be updated and initialized if the CPU is new for the task
  * The task's current CPU is set to the new CPU



For accurate statistics, task migrations must be detected as soon as possible. The first case, explicit request, happens within a system call and can be detected in the `sys_exit` event for that system call. The second case has its own event, `sched:sched_migrate_task`, so it will need a new event-handling function.
```
def raw_syscalls__sys_exit(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, ret):

鑱� # convert the multiple timestamp values into a single value
鑱� timestamp = nsecs(common_secs, common_nsecs)

鑱� If start_timestamp = 0:
鑱� 鑱� start_timestamp = timestamp

鑱� # find this task's data structure
鑱� try:
鑱� 鑱� task = tasks[common_pid]

鑱� 鑱� # compute elapsed time for this system call
鑱� 鑱� delta = 鑱絫ask.timestamp - timestamp

鑱� 鑱� # accumulate time for this task/system call
鑱� 鑱� task.syscalls[id].elapsed += delta
鑱� 鑱� # increment the tally for this task/system call
鑱� 鑱� task.syscalls[id].count += 1
鑱� 鑱� # adjust statistics
鑱� 鑱� if delta < task.syscalls[id].min:
鑱� 鑱� 鑱� task.syscalls[id].min = delta
鑱� 鑱� if delta > task.syscalls[id].max:
鑱� 鑱� 鑱� task.syscalls[id].max = delta

鑱� except:
鑱� 鑱� # new task!
鑱� 鑱� task = Task()
鑱� 鑱� # save the command string
鑱� 鑱� task.comm = common_comm
鑱� 鑱� # save the new task in the global list (dictionary) of tasks
鑱� 鑱� tasks[common_pid] = task

鑱� 鑱� task.cpu = common_cpu

鑱� 鑱� # compute elapsed time for this system call
鑱� 鑱� delta = 鑱絪tart_timestamp - timestamp

鑱� 鑱� # accumulate time for this task/system call
鑱� 鑱� task.syscalls[id].pending += delta

鑱� If common_cpu != task.cpu:
鑱� 鑱� task.migrations += 1
鑱� 鑱� # divide the time spent in this syscall in half...
鑱� 鑱� delta /= 2
鑱� 鑱� # and give have to the previous CPU, below, and half to the new CPU, later
鑱� 鑱� task.cpus[task.cpu].system += delta

鑱� # accumulate time for this task's state on this CPU
鑱� task.cpus[common_cpu].system += delta

鑱� # change task's state
鑱� task.mode = 'user'

鑱� # save the timestamp for the last event (this one) for this task
鑱� task.timestamp = timestamp

def sched__sched_migrate_task(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, comm, pid, prio, orig_cpu,
鑱� 鑱� 鑱� 鑱� dest_cpu, perf_sample_dict):

鑱� If start_timestamp = 0:
鑱� 鑱� start_timestamp = timestamp

鑱� # find this task's data structure
鑱� try:
鑱� 鑱� task = tasks[common_pid]
鑱� except:
鑱� 鑱� # new task!
鑱� 鑱� task = Task()
鑱� 鑱� # save the command string
鑱� 鑱� task.comm = common_comm
鑱� 鑱� # save the new task in the global list (dictionary) of tasks
鑱� 鑱� tasks[common_pid] = task

鑱� 鑱� task.cpu = common_cpu

鑱� 鑱� If common_cpu not in task.cpus:
鑱� 鑱� 鑱� task.cpus[common_cpu] = CPU()

鑱� 鑱� task.migrations += 1
```

### Task creation

To accurately collect statistics for a task, it is essential to know when the task is created. Tasks can be created with `fork()`, which creates a new process, or `pthread_create()`, which creates a new task within the same process. Fortunately, both are manifested by a `clone` system call and made evident by a `sched:sched_process_fork` event. The lifetime of the task starts at the `sched_process_fork` event. The edge case that arises is that the first likely events for the new task are:

  1. `sched_switch` when the new task starts running. The new task should be considered idle at creation until this event occurs
  2. `sys_exit` for the `clone` system call. The initial state of the new task needs to be based on the state of the task that creates it, including being within the `clone` system call.



One edge case that must be handled is if the creating task (parent) is not yet known, it must be created and initialized, and the presumption is that it has been actively running since the start of the trace.
```
def sched__sched_process_fork(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, parent_comm, parent_pid, child_comm, child_pid):
鑱� global start_timestamp, curr_timestamp
鑱� curr_timestamp = self.timestamp
鑱� if (start_timestamp == 0):
鑱� 鑱� start_timestamp = curr_timestamp
鑱� # find this task's data structure
鑱� try:
鑱� 鑱� task = tasks[common_pid]
鑱� except:
鑱� 鑱� # new task!
鑱� 鑱� task = Task()
鑱� 鑱� # save the command string
鑱� 鑱� task.comm = common_comm
鑱� 鑱� # save the new task in the global list (dictionary) of tasks
鑱� 鑱� tasks[common_pid] = task
鑱� try:
鑱� 鑱� parent = tasks[self.parent_tid]
鑱� except:
鑱� 鑱� # need to create parent task here!
鑱� 鑱� parent = Task(start_timestamp, self.command, 'sys', self.pid)
鑱� 鑱� parent.sched_stat = True # ?
鑱� 鑱� parent.cpu = self.cpu
鑱� 鑱� parent.cpus[parent.cpu] = CPU()
鑱� 鑱� tasks[self.parent_tid] = parent
鑱�
鑱� 鑱� task.resume_mode = parent.mode
鑱� 鑱� task.syscall = parent.syscall
鑱� 鑱� task.syscalls[task.syscall] = Call()
鑱� 鑱� task.syscalls[task.syscall].timestamp = self.timestamp
```

### Task exit

Similarly, for complete and accurate task statistics, it is essential to know when a task has terminated. There's an event for that: `sched:sched_process_exit`. This one is pretty easy to handle, in that the effort is just to close out the statistics and set the mode appropriately, so any end-of-trace processing will not think the task is still active:
```
def sched__sched_process_exit_old(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, comm, pid, prio):
鑱� global start_timestamp, curr_timestamp
鑱� curr_timestamp = self.timestamp
鑱� if (start_timestamp == 0):
鑱� 鑱� start_timestamp = curr_timestamp

鑱� # find this task's data structure
鑱� try:
鑱� 鑱� task = tasks[common_pid]
鑱� except:
鑱� 鑱� # new task!
鑱� 鑱� task = Task()
鑱� 鑱� # save the command string
鑱� 鑱� task.comm = common_comm
鑱� 鑱� task.timestamp = curr_timestamp
鑱� 鑱� # save the new task in the global list (dictionary) of tasks
鑱� 鑱� tasks[common_pid] = task

鑱� delta = timestamp 閳ワ拷 task.timestamp
鑱� task.sys += delta
鑱� task.mode = 'exit'
```

### Output

What follows is an example of the report displayed by `curt`, slightly reformatted to fit on a narrower page width and with the idle-time classification data (which makes the output very wide) removed, and for brevity. Seen are two processes, 1497 and 2857. Process 1497 has two tasks, 1497 and 1523. Each task has a per-CPU summary and system-wide ("ALL" CPUs) summary. Each task's data is followed by the system call data for that task (if any), hypervisor call data (if any), and interrupt data (if any). After each process's respective tasks is a per-process summary. Process 2857 has a task 2857-0 that is the previous task image before an exec() system call replaced the process image. After all processes is a system-wide summary.
```
1497:
-- [ 鑱絫ask] command 鑱� 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱絒 鑱�1497] X 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 2 鑱�0.076354 鑱�0.019563 鑱�0.000000 鑱�0.000000 鑱�0.000000 15.818719 | 鑱� 0.6%
鑱� 鑱絒 鑱�1497] X 鑱� 鑱� 鑱� 鑱� 鑱� ALL 鑱�0.076354 鑱�0.019563 鑱�0.000000 鑱�0.000000 鑱�0.000000 15.818719 | 鑱� 0.6% 鑱� 鑱� 0
鑱�
鑱� -- ( ID)name 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count 鑱� elapsed 鑱� 鑱� 鑱絧ending 鑱� 鑱� 鑱絘verage 鑱� 鑱� 鑱絤inimum 鑱� 鑱� 鑱絤aximum
鑱� 鑱� 鑱�( 鑱�0)read 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 2 鑱�0.004699 鑱� 鑱� 0.000000 鑱� 鑱� 0.002350 鑱� 鑱� 0.002130 鑱� 鑱� 0.002569
鑱� 鑱� 鑱�(232)epoll_wait 鑱� 鑱� 鑱� 鑱� 鑱� 1 鑱�9.968375 鑱� 鑱� 5.865208 鑱� 鑱� 9.968375 鑱� 鑱� 9.968375 鑱� 鑱� 9.968375
鑱�
-- [ 鑱絫ask] command 鑱� 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱絒 鑱�1523] InputThread 鑱� 1 鑱�0.052598 鑱�0.037073 鑱�0.000000 鑱�0.000000 鑱�0.000000 15.824965 | 鑱� 0.6%
鑱� 鑱絒 鑱�1523] InputThread ALL 鑱�0.052598 鑱�0.037073 鑱�0.000000 鑱�0.000000 鑱�0.000000 15.824965 | 鑱� 0.6% 鑱� 鑱� 0
鑱�
鑱� -- ( ID)name 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count 鑱� elapsed 鑱� 鑱� 鑱絧ending 鑱� 鑱� 鑱絘verage 鑱� 鑱� 鑱絤inimum 鑱� 鑱� 鑱絤aximum
鑱� 鑱� 鑱�( 鑱�0)read 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�14 鑱�0.011773 鑱� 鑱� 0.000000 鑱� 鑱� 0.000841 鑱� 鑱� 0.000509 鑱� 鑱� 0.002185
鑱� 鑱� 鑱�( 鑱�1)write 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�2 鑱�0.010763 鑱� 鑱� 0.000000 鑱� 鑱� 0.005381 鑱� 鑱� 0.004974 鑱� 鑱� 0.005789
鑱� 鑱� 鑱�(232)epoll_wait 鑱� 鑱� 鑱� 鑱� 鑱� 1 鑱�9.966649 鑱� 鑱� 5.872853 鑱� 鑱� 9.966649 鑱� 鑱� 9.966649 鑱� 鑱� 9.966649
鑱�
-- [ 鑱絫ask] command 鑱� 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱絒 鑱� ALL] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� ALL 鑱�0.128952 鑱�0.056636 鑱�0.000000 鑱�0.000000 鑱�0.000000 31.643684 | 鑱� 0.6% 鑱� 鑱� 0
鑱�
2857:
-- [ 鑱絫ask] command 鑱� 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱絒 鑱�2857] execs.sh 鑱� 鑱� 鑱�1 鑱�0.257617 鑱�0.249685 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.266200 | 鑱�65.6%
鑱� 鑱絒 鑱�2857] execs.sh 鑱� 鑱� 鑱�2 鑱�0.000000 鑱�0.023951 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.005728 | 鑱�80.7%
鑱� 鑱絒 鑱�2857] execs.sh 鑱� 鑱� 鑱�5 鑱�0.313509 鑱�0.062271 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.344279 | 鑱�52.2%
鑱� 鑱絒 鑱�2857] execs.sh 鑱� 鑱� 鑱�6 鑱�0.136623 鑱�0.128883 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.533263 | 鑱�33.2%
鑱� 鑱絒 鑱�2857] execs.sh 鑱� 鑱� 鑱�7 鑱�0.527347 鑱�0.194014 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.990625 | 鑱�42.1%
鑱� 鑱絒 鑱�2857] execs.sh 鑱� 鑱紸LL 鑱�1.235096 鑱�0.658804 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.140095 | 鑱�46.9% 鑱� 鑱� 4
鑱�
鑱� -- ( ID)name 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count 鑱� elapsed 鑱� 鑱� 鑱絧ending 鑱� 鑱� 鑱絘verage 鑱� 鑱� 鑱絤inimum 鑱� 鑱� 鑱絤aximum
鑱� 鑱� 鑱�( 鑱�9)mmap 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�15 鑱�0.059388 鑱� 鑱� 0.000000 鑱� 鑱� 0.003959 鑱� 鑱� 0.001704 鑱� 鑱� 0.017919
鑱� 鑱� 鑱�( 14)rt_sigprocmask 鑱� 鑱� 鑱�12 鑱�0.006391 鑱� 鑱� 0.000000 鑱� 鑱� 0.000533 鑱� 鑱� 0.000431 鑱� 鑱� 0.000711
鑱� 鑱� 鑱�( 鑱�2)open 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 9 鑱�2.253509 鑱� 鑱� 0.000000 鑱� 鑱� 0.250390 鑱� 鑱� 0.008589 鑱� 鑱� 0.511953
鑱� 鑱� 鑱�( 鑱�3)close 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�9 鑱�0.017771 鑱� 鑱� 0.000000 鑱� 鑱� 0.001975 鑱� 鑱� 0.000681 鑱� 鑱� 0.005245
鑱� 鑱� 鑱�( 鑱�5)fstat 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�9 鑱�0.007911 鑱� 鑱� 0.000000 鑱� 鑱� 0.000879 鑱� 鑱� 0.000683 鑱� 鑱� 0.001182
鑱� 鑱� 鑱�( 10)mprotect 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 8 鑱�0.052198 鑱� 鑱� 0.000000 鑱� 鑱� 0.006525 鑱� 鑱� 0.003913 鑱� 鑱� 0.018073
鑱� 鑱� 鑱�( 13)rt_sigaction 鑱� 鑱� 鑱� 鑱� 8 鑱�0.004281 鑱� 鑱� 0.000000 鑱� 鑱� 0.000535 鑱� 鑱� 0.000458 鑱� 鑱� 0.000751
鑱� 鑱� 鑱�( 鑱�0)read 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 7 鑱�0.197772 鑱� 鑱� 0.000000 鑱� 鑱� 0.028253 鑱� 鑱� 0.000790 鑱� 鑱� 0.191028
鑱� 鑱� 鑱�( 12)brk 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�5 鑱�0.003766 鑱� 鑱� 0.000000 鑱� 鑱� 0.000753 鑱� 鑱� 0.000425 鑱� 鑱� 0.001618
鑱� 鑱� 鑱�( 鑱�8)lseek 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�3 鑱�0.001766 鑱� 鑱� 0.000000 鑱� 鑱� 0.000589 鑱� 鑱� 0.000469 鑱� 鑱� 0.000818
鑱�
-- [ 鑱絫ask] command 鑱� 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱絒2857-0] perf 鑱� 鑱� 鑱� 鑱� 鑱�6 鑱�0.053925 鑱�0.191898 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.827263 | 鑱�22.9%
鑱� 鑱絒2857-0] perf 鑱� 鑱� 鑱� 鑱� 鑱�7 鑱�0.000000 鑱�0.656423 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.484107 | 鑱�57.6%
鑱� 鑱絒2857-0] perf 鑱� 鑱� 鑱� 鑱紸LL 鑱�0.053925 鑱�0.848321 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�1.311370 | 鑱�40.8% 鑱� 鑱� 1
鑱�
鑱� -- ( ID)name 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count 鑱� elapsed 鑱� 鑱� 鑱絧ending 鑱� 鑱� 鑱絘verage 鑱� 鑱� 鑱絤inimum 鑱� 鑱� 鑱絤aximum
鑱� 鑱� 鑱�( 鑱�0)read 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 0 鑱�0.000000 鑱� 鑱� 0.167845 鑱� 鑱� 鑱� 鑱� 鑱� -- 鑱� 鑱� 鑱� 鑱� 鑱� -- 鑱� 鑱� 鑱� 鑱� 鑱� --
鑱� 鑱� 鑱�( 59)execve 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 0 鑱�0.000000 鑱� 鑱� 0.000000 鑱� 鑱� 鑱� 鑱� 鑱� -- 鑱� 鑱� 鑱� 鑱� 鑱� -- 鑱� 鑱� 鑱� 鑱� 鑱� --
鑱�
ALL:
-- [ 鑱絫ask] command 鑱� 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱絒 鑱� ALL] 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� ALL 10.790803 29.633170 鑱�0.160165 鑱�0.000000 鑱�0.137747 54.449823 | 鑱� 7.4% 鑱� 鑱�50
鑱�
鑱� -- ( ID)name 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count 鑱� elapsed 鑱� 鑱� 鑱絧ending 鑱� 鑱� 鑱絘verage 鑱� 鑱� 鑱絤inimum 鑱� 鑱� 鑱絤aximum
鑱� 鑱� 鑱�( 鑱�1)write 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 2896 鑱�1.623985 鑱� 鑱� 0.000000 鑱� 鑱� 0.004014 鑱� 鑱� 0.002364 鑱� 鑱� 0.041399
鑱� 鑱� 鑱�(102)getuid 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�2081 鑱�3.523861 鑱� 鑱� 0.000000 鑱� 鑱� 0.001693 鑱� 鑱� 0.000488 鑱� 鑱� 0.025157
鑱� 鑱� 鑱�(142)sched_setparam 鑱� 鑱� 691 鑱�7.222906 鑱� 鑱�32.012841 鑱� 鑱� 0.024925 鑱� 鑱� 0.002024 鑱� 鑱� 0.662975
鑱� 鑱� 鑱�( 13)rt_sigaction 鑱� 鑱� 鑱� 383 鑱�0.235087 鑱� 鑱� 0.000000 鑱� 鑱� 0.000614 鑱� 鑱� 0.000434 鑱� 鑱� 0.014402
鑱� 鑱� 鑱�( 鑱�8)lseek 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�281 鑱�0.169157 鑱� 鑱� 0.000000 鑱� 鑱� 0.000602 鑱� 鑱� 0.000452 鑱� 鑱� 0.013404
鑱� 鑱� 鑱�( 鑱�0)read 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 133 鑱�2.782795 鑱� 鑱� 0.167845 鑱� 鑱� 0.020923 鑱� 鑱� 0.000509 鑱� 鑱� 1.864439
鑱� 鑱� 鑱�( 鑱�7)poll 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�96 鑱�8.583354 鑱� 131.889895 鑱� 鑱� 0.193577 鑱� 鑱� 0.000626 鑱� 鑱� 4.596280
鑱� 鑱� 鑱�( 鑱�4)stat 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�93 鑱�7.036355 鑱� 鑱� 1.058719 鑱� 鑱� 0.183187 鑱� 鑱� 0.000981 鑱� 鑱� 3.661659
鑱� 鑱� 鑱�( 47)recvmsg 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 85 鑱�0.146644 鑱� 鑱� 0.000000 鑱� 鑱� 0.001725 鑱� 鑱� 0.000646 鑱� 鑱� 0.019067
鑱� 鑱� 鑱�( 鑱�3)close 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 79 鑱�0.171046 鑱� 鑱� 0.000000 鑱� 鑱� 0.002165 鑱� 鑱� 0.000428 鑱� 鑱� 0.020659
鑱� 鑱� 鑱�( 鑱�9)mmap 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�78 鑱�0.311233 鑱� 鑱� 0.000000 鑱� 鑱� 0.003990 鑱� 鑱� 0.001613 鑱� 鑱� 0.017919
鑱� 鑱� 鑱�(186)gettid 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�74 鑱�0.067315 鑱� 鑱� 0.000000 鑱� 鑱� 0.000910 鑱� 鑱� 0.000403 鑱� 鑱� 0.014075
鑱� 鑱� 鑱�( 鑱�2)open 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�71 鑱�3.081589 鑱� 鑱� 0.213059 鑱� 鑱� 0.184248 鑱� 鑱� 0.001921 鑱� 鑱� 0.937946
鑱� 鑱� 鑱�(202)futex 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 62 鑱�5.145112 鑱� 164.286154 鑱� 鑱� 0.405566 鑱� 鑱� 0.000597 鑱� 鑱�11.587437
鑱�
鑱� -- ( ID)name 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� count 鑱� elapsed 鑱� 鑱� 鑱絧ending 鑱� 鑱� 鑱絘verage 鑱� 鑱� 鑱絤inimum 鑱� 鑱� 鑱絤aximum
鑱� 鑱� 鑱�( 12)i8042 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 10 鑱�0.160165 鑱� 鑱� 0.000000 鑱� 鑱� 0.016016 鑱� 鑱� 0.010920 鑱� 鑱� 0.032805
鑱�
Total Trace Time: 15.914636 ms
```

### Hurdles and issues

Following are some of the issues encountered in the development of `curt`.

#### Out-of-order events

One of the more challenging issues is the discovery that events in a `perf.data` file can be out of time order. For a program trying to monitor state transitions carefully, this is a serious issue. For example, a trace could include the following sequence of events, displayed as they appear in the trace file:
```
time 0000: 鑱絪ys_enter syscall1
time 0007: 鑱絪ys_enter syscall2
time 0006: 鑱絪ys_exit syscall1
time 0009: 鑱絪ys_exit syscall2
```

Just blindly processing these events in the order they are presented to their respective event-handling functions (in the wrong time order) will result in incorrect statistics (or worse).

The most user-friendly ways to handle out-of-order events include:

  * Prevent traces from having out-of-order events in the first place by changing the way `perf record` works
  * Providing a means to reorder events in a trace file, perhaps by enhancing `perf inject`
  * Modifying how `perf script` works to present the events to the event-handling functions in time order



But user-friendly is not the same as straightforward, nor easy. Also, none of the above are in the user's control.

I chose to implement a queue for incoming events that would be sufficiently deep to allow for proper reordering of all events. This required a significant redesign of the code, including implementation of classes for each event, and moving the event processing for each event type into a method in that event's class.

In the redesigned code, the actual event handlers' only job is to save the relevant data from the event into an instance of the event class, queue it, then process the top (oldest in time) event from the queue:
```
def raw_syscalls__sys_enter(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, args):
鑱� 鑱� 鑱� 鑱� 鑱絜vent = Event_sys_enter(nsecs(common_secs,common_nsecs), common_cpu, common_pid, common_comm, id)
鑱� 鑱� 鑱� 鑱� process_event(event)
```

The simple reorderable queuing mechanism is in a common function:
```
events = []
n_events = 0
def process_event(event):
鑱� 鑱� 鑱� 鑱� global events,n_events,curr_timestamp
鑱� 鑱� 鑱� 鑱� i = n_events
鑱� 鑱� 鑱� 鑱� while i > 0 and events[i-1].timestamp > event.timestamp:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� i = i-1
鑱� 鑱� 鑱� 鑱� events.insert(i,event)
鑱� 鑱� 鑱� 鑱� if n_events < params.window:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� n_events = n_events+1
鑱� 鑱� 鑱� 鑱� else:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� event = events[0]
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # need to delete from events list now,
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� # because event.process() could reenter here
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� del events[0]
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if event.timestamp < curr_timestamp:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� sys.stderr.write("Error: OUT OF ORDER events detected.\n 鑱絋ry increasing the size of the look-ahead window with --window=<n>\n")
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� event.process()
```

Note that the size of the queue is configurable, primarily for performance and to limit memory consumption. The function will report when that queue size is insufficient to eliminate out-of-order events. It is worth considering whether to consider this case a catastrophic failure and elect to terminate the program.

Implementing a class for each event type led to some consideration for refactoring, such that common code could coalesce into a base class:
```
class Event (object):
鑱�
鑱� 鑱� 鑱� 鑱� def __init__(self):
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.timestamp = 0
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.cpu = 0
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.tid = 0
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.command = 'unknown'
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.mode = 'unknown'
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.pid = 0
鑱�
鑱� 鑱� 鑱� 鑱� def process(self):
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� global start_timestamp
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� try:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task = tasks[self.tid]
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if task.pid == 'unknown':
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� tasks[self.tid].pid = self.pid
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� except:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task = Task(start_timestamp, self.command, self.mode, self.pid)
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� tasks[self.tid] = task
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if self.cpu not in task.cpus:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.cpus[self.cpu] = CPU()
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if task.cpu == 'unknown':
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.cpu = self.cpu
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if self.cpu != task.cpu:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.cpu = self.cpu
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.migrations += 1
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� return task
```

Then a class for each event type would be similarly constructed:
```
class Event_sys_enter ( Event ):
鑱�
鑱� 鑱� 鑱� 鑱� def __init__(self, timestamp, cpu, tid, comm, id, pid):
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.timestamp = timestamp
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.cpu = cpu
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.tid = tid
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.command = comm
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.id = id
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.pid = pid
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� self.mode = 'busy-unknown'
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� def process(self):
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� global start_timestamp, curr_timestamp
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� curr_timestamp = self.timestamp
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if (start_timestamp == 0):
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� start_timestamp = curr_timestamp
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task = super(Event_sys_enter, self).process()
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if task.mode == 'busy-unknown':
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.mode = 'user'
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� for cpu in task.cpus:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.cpus[cpu].user = task.cpus[cpu].busy_unknown
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.cpus[cpu].busy_unknown = 0
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.syscall = self.id
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if self.id not in task.syscalls:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.syscalls[self.id] = Call()
鑱�
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.syscalls[self.id].timestamp = curr_timestamp
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� task.change_mode(curr_timestamp, 'sys')
```

Further refactoring is evident above, as well, moving the common code that updates relevant statistics based on a task's state change and the state change itself into a `change_mode` method of the `Task` class.

### Start-of-trace timestamp

As mentioned above, for scripts that depend on elapsed time, there should be an easier way to get the first timestamp in the trace other than forcing every event-handling function to conditionally save its timestamp as the start-of-trace timestamp.

### Awkward invocation

The syntax for invoking a `perf` Python script, including script parameters, is slightly awkward:
```
$ perf script 閳ユ悞 ./curt.py -- --window=80
```

Also, it's awkward that `perf` Python scripts are not themselves executable.

The `curt.py` script was made directly executable and will invoke `perf`, which will in turn invoke the script. Implementation is a bit confusing but it's easy to use:
```
$ ./curt.py --window=80
```

This script must detect when it has been directly invoked. The Python environment established by `perf` is a virtual module from which the `perf` Python scripts import:
```
try:
鑱� 鑱� 鑱� 鑱� from perf_trace_context import *
```

If this import fails, the script was directly invoked. In this case, the script will `exec perf`, specifying itself as the script to run, and passing along any command line parameters:
```
except:
鑱� 鑱� 鑱� 鑱� if len(params.file_or_command) == 0:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� params.file_or_command = [ "perf.data" ]
鑱� 鑱� 鑱� 鑱� sys.argv = ['perf', 'script', '-i' ] + params.file_or_command + [ '-s', sys.argv[0] ]
鑱� 鑱� 鑱� 鑱� sys.argv.append('--')
鑱� 鑱� 鑱� 鑱� sys.argv += ['--window', str(params.window)]
鑱� 鑱� 鑱� 鑱� if params.debug:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� sys.argv.append('--debug')
鑱� 鑱� 鑱� 鑱� sys.argv += ['--api', str(params.api)]
鑱� 鑱� 鑱� 鑱� if params.debug:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� print sys.argv
鑱� 鑱� 鑱� 鑱� os.execvp("perf", sys.argv)
鑱� 鑱� 鑱� 鑱� sys.exit(1)
```

In this way, the script can not only be run directly, it can still be run by using the `perf script` command.

#### Simultaneous event registration required

An artifact of the way `perf` enables events can lead to unexpected trace data. For example, specifying:
```
$ perf record 閳ユ彸 閳ユ徍 raw_syscalls:sys_enter 閳ユ徍 raw_syscalls:sys_exit ./command
```

Will result in a trace file that begins with the following series of events for a single task (the `perf` command itself):
```
sys_enter
sys_enter
sys_enter
閳ワ拷

```

This happens because `perf` will register the `sys_enter` event for every CPU on the system (because of the `-a` argument), then it will register the `sys_exit` event for every CPU. In the latter case, since the `sys_enter` event has already been enabled for each CPU, that event shows up in the trace; but since the `sys_exit` has not been enabled on each CPU until after the call returns, the `sys_exit` call does not show up in the trace. The reverse issue happens at the end of the trace file, with a series of `sys_exit` events in the trace because the `sys_enter` event has already been disabled.

The solution to this issue is to group the events, which is not well documented:
```
$ perf record 閳ユ徍 '{raw_syscalls:sys_enter,raw_syscalls:sys_exit}' ./command
```

With this syntax, the `sys_enter` and `sys_exit` events are enabled simultaneously.

#### Awkward recording step

There are a lot of different events required for computation of the full set of statistics for tasks. This leads to a very long, complicated command for recording:
```
$ perf record -e '{raw_syscalls:*,sched:sched_switch,sched:sched_migrate_task,sched:sched_process_exec,sched:sched_process_fork,sched:sched_process_exit,sched:sched_stat_runtime,sched:sched_stat_wait,sched:sched_stat_sleep,sched:sched_stat_blocked,sched:sched_stat_iowait,powerpc:hcall_entry,powerpc:hcall_exit}' -a *command --args*

```

The solution to this issue is to enable the script to perform the record step itself, by itself invoking `perf`. A further enhancement is to proceed after the recording is complete and report the statistics from that recording:
```
if params.record:
鑱� 鑱� 鑱� 鑱� # [ed. Omitting here the list of events for brevity]
鑱� 鑱� 鑱� 鑱� eventlist = '{' + eventlist + '}' # group the events
鑱� 鑱� 鑱� 鑱� command = ['perf', 'record', '--quiet', '--all-cpus',
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� '--event', eventlist ] + params.file_or_command
鑱� 鑱� 鑱� 鑱� if params.debug:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� print command
鑱� 鑱� 鑱� 鑱� subprocess.call(command)
```

The command syntax required to record and report becomes:
```
$ ./curt.py --record ./command
```

### Process IDs and perf API change

Process IDs are treated a bit cavalierly by `perf` scripting. Note well above that one of the common parameters for the generated event-handling functions is named `common_pid`. This is not the process ID, but the task ID. In fact, on many current Linux-based distributions, there is no way to determine a task's process ID from within a `perf` Python script. This presents a serious problem for a script that wants to compute statistics for a process.

Fortunately, in Linux kernel v4.14, an additional parameter was provided to each of the event-handling functions閳ユ摽perf_sample_dict`閳ユ攣 dictionary from which the process ID could be extracted: (`perf_sample_dict['sample']['pid']`).

Unfortunately, current Linux distributions may not have that version of the Linux kernel. If the script is written to expect that extra parameter, the script will fail and report an error:
```
TypeError: irq__irq_handler_exit_new() takes exactly 11 arguments (10 given)
```

Ideally, a means to automatically discover if the additional parameter is passed would be available to permit a script to easily run with both the old and new APIs and to take advantage of the new API if it is available. Unfortunately, such a means is not readily apparent.

Since there is clearly value in using the new API to determine process-wide statistics, `curt` provides a command line option to use the new API. `curt` then takes advantage of Python's lazy function binding to adjust, at run-time, which API to use:
```
if params.api == 1:
鑱� 鑱� 鑱� 鑱� dummy_dict = {}
鑱� 鑱� 鑱� 鑱� dummy_dict['sample'] = {}
鑱� 鑱� 鑱� 鑱� dummy_dict['sample']['pid'] = 'unknown'
鑱� 鑱� 鑱� 鑱� raw_syscalls__sys_enter = raw_syscalls__sys_enter_old
鑱� 鑱� 鑱� 鑱� [閳ヮ泝
else:
鑱� 鑱� 鑱� 鑱� raw_syscalls__sys_enter = raw_syscalls__sys_enter_new
鑱� 鑱� 鑱� 鑱� [閳ヮ泝
```

This requires two functions for each event:
```
def raw_syscalls__sys_enter_new(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, args, perf_sample_dict):
鑱�
鑱� 鑱� 鑱� 鑱� event = Event_sys_enter(nsecs(common_secs,common_nsecs), common_cpu, common_pid, common_comm, id, perf_sample_dict['sample']['pid'])
鑱� 鑱� 鑱� 鑱� process_event(event)
鑱�
def raw_syscalls__sys_enter_old(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, args):
鑱� 鑱� 鑱� 鑱� global dummy_dict
鑱� 鑱� 鑱� 鑱� raw_syscalls__sys_enter_new(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, id, args, dummy_dict)
```

Note that the event-handling function for the older API will make use of the function for the newer API, passing a statically defined dictionary containing just enough data such that accessing it as `perf_sample_dict['sample']['pid']` will work (resulting in `'unknown'`).

#### Events reported on other CPUs

Not all events that refer to a task are reported from a CPU on which the task is running. This could result in an artificially high migration count and other incorrect statistics. For these types of events (`sched_stat`), the event CPU is ignored.

#### Explicit migrations (no sched_migrate event)

While there is conveniently an event for when the kernel decides to migrate a task from one CPU to another, there is no event for when the task requests a migration on its own. These are effected by system calls (`sched_setaffinity`), so the `sys_exit` event handler must compare the event CPU to the task's CPU, and if different, presume a migration has occurred. (This is described above, but repeated here in the "issues" section for completeness.)

#### Mapping system call IDs to names is architecture-specific

System calls are identified in events only as unique numeric identifiers. These identifiers are not readily interpreted by humans in the report. These numeric identifiers are not readily mapped to their mnemonics because they are architecture-specific, and new system calls can be added in newer kernels. Fortunately, `perf` provides a means to map system call numeric identifiers to system call names. A simple example follows:
```
from Util import syscall_name
def raw_syscalls__sys_enter(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, id, args, perf_sample_dict):
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� print "%s id=%d" % (syscall_name(id), id)
```

Unfortunately, using syscall_name introduces a dependency on the `audit` python bindings. This dependency is being removed in upstream versions of perf.

#### Mapping hypervisor call IDs to names is non-existent

Similar to system calls, hypervisor calls are also identified only with numeric identifiers. For IBM's POWER hypervisor, they are statically defined. Unfortunately, `perf` does not provide a means to map hypervisor call identifiers to mnemonics. `curt` includes a (hardcoded) function to do just that:
```
hcall_to_name = {
鑱� 鑱� 鑱� 鑱� '0x4':'H_REMOVE',
鑱� 鑱� 鑱� 鑱� '0x8':'H_ENTER', 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� '0xc':'H_READ', 鑱� 鑱� 鑱�
鑱� 鑱� 鑱� 鑱� '0x10':'H_CLEAR_MOD',
[閳ヮ泝
}
鑱�
def hcall_name(opcode):
鑱� 鑱� 鑱� 鑱� try:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� return hcall_to_name[hex(opcode)]
鑱� 鑱� 鑱� 鑱� except:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� return str(opcode)
```

### Command strings as bytearrays

`perf` stores command names and string arguments in Python bytearrays. Unfortunately, printing bytearrays in Python prints every character in the bytearray閳ユ攨ven if the string is null-terminated. For example:
```
$ perf record 閳ユ彸 閳ユ徍 'sched:sched_switch' sleep 3
$ perf script 閳ユ徏 Python
generated Python script: perf-script.py
$ perf script -s ./perf-script.py
in trace_begin
sched__sched_switch 鑱� 鑱� 鑱�3 664597.912692243 鑱� 鑱�21223 perf 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絧rev_comm=perf^@-terminal-^@, prev_pid=21223, prev_prio=120, prev_state=, next_comm=migration/3^@^@^@^@^@, next_pid=23, next_prio=0
[閳ヮ泝
```

One solution is to truncate the length of these bytearrays based on null termination, as needed before printing:
```
def null(ba):
鑱� 鑱� 鑱� 鑱� null = ba.find('\x00')
鑱� 鑱� 鑱� 鑱� if null >= 0:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� ba = ba[0:null]
鑱� 鑱� 鑱� 鑱� return ba

def sched__sched_switch(event_name, context, common_cpu,
鑱� 鑱� 鑱� 鑱� common_secs, common_nsecs, common_pid, common_comm,
鑱� 鑱� 鑱� 鑱� common_callchain, prev_comm, prev_pid, prev_prio, prev_state,
鑱� 鑱� 鑱� 鑱� next_comm, next_pid, next_prio, perf_sample_dict):

鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� print "prev_comm=%s, prev_pid=%d, prev_prio=%d, " \
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� "prev_state=%s, next_comm=%s, next_pid=%d, " \
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� "next_prio=%d" % \
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� (null(prev_comm), prev_pid, prev_prio,
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� flag_str("sched__sched_switch", "prev_state", prev_state),
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� null(next_comm), next_pid, next_prio)
```

Which nicely cleans up the output:
```
sched__sched_switch 鑱� 鑱� 鑱�3 664597.912692243 鑱� 鑱�21223 perf 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱絧rev_comm=perf, prev_pid=21223, prev_prio=120, prev_state=, next_comm=migration/3, next_pid=23, next_prio=0
```

### Dynamic mappings, like IRQ number to name

Dissimilar to system calls and hypervisor calls, interrupt numbers (IRQs) are dynamically assigned by the kernel on demand, so there can't be a static table mapping an IRQ number to a name. Fortunately, `perf` passes the name to the event's `irq_handler_entry` routine. This allows a script to create a dictionary that maps the IRQ number to a name:
```
irq_to_name = {}
def irq__irq_handler_entry_new(event_name, context, common_cpu, common_secs, common_nsecs, common_pid, common_comm, common_callchain, irq, name, perf_sample_dict):
鑱� 鑱� 鑱� 鑱� irq_to_name[irq] = name
鑱� 鑱� 鑱� 鑱� event = Event_irq_handler_entry(nsecs(common_secs,common_nsecs), common_cpu, common_pid, common_comm, irq, name, getpid(perf_sample_dict))
鑱� 鑱� 鑱� 鑱� process_event(event)
```

Somewhat oddly, `perf` does not pass the name to the `irq_handler_exit` routine. So, it is possible that a trace may only see an `irq_handler_exit` for an IRQ and must be able to tolerate that. Here, instead of mapping the IRQ to a name, the IRQ number is returned as a string instead:
```
def irq_name(irq):
鑱� 鑱� 鑱� 鑱� if irq in irq_to_name:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� return irq_to_name[irq]
鑱� 鑱� 鑱� 鑱� return str(irq)
```
#### Task 0
Task 0 shows up everywhere. It's not a real task. It's a substitute for the "idle" state. It's the task ID given to the `sched_switch` event handler when the CPU is going to (or coming from) the "idle" state. It's often the task that is "interrupted" by interrupts. Tracking the statistics for task 0 as if it were a real task would not make sense. Currently, `curt` ignores task 0. However, this loses some information, like some time spent in interrupt processing. `curt` should, but currently doesn't, track interesting (non-idle) time for task 0.

#### Spurious sched_migrate_task events (same CPU)

Rarely, a `sched_migrate_task` event occurs in which the source and target CPUs are the same. In other words, the task is not migrated. To avoid artificially inflated migration counts, this case must be explicitly ignored:
```
class Event_sched_migrate_task (Event):
鑱� 鑱� 鑱� 鑱� def process(self):
[閳ヮ泝
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� if self.cpu == self.dest_cpu:
鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� 鑱� return
```

#### exec

The semantics of the `exec` system call are that the image of the current process is replaced by a completely new process image without changing the process ID. This is awkward for tracking the statistics of a process (really, a task) based on the process (task) ID. The change is significant enough that the statistics for each task should be accumulated separately, so the current task's statistics need to be closed out and a new set of statistics should be initialized. The challenge is that both the old and new tasks have the same process (task) ID. `curt` addresses this by tagging the task's task ID with a numeric suffix:
```
class Event_sched_process_exec (Event):
鑱� def process(self):
鑱� 鑱� global start_timestamp, curr_timestamp
鑱� 鑱� curr_timestamp = self.timestamp
鑱� 鑱� if (start_timestamp == 0):
鑱� 鑱� 鑱� start_timestamp = curr_timestamp
鑱�
鑱� 鑱� task = super(Event_sched_process_exec, self).process()
鑱�
鑱� 鑱� new_task = Task(self.timestamp, self.command, task.mode, self.pid)
鑱� 鑱� new_task.sched_stat = True
鑱� 鑱� new_task.syscall = task.syscall
鑱� 鑱� new_task.syscalls[task.syscall] = Call()
鑱� 鑱� new_task.syscalls[task.syscall].timestamp = self.timestamp
鑱�
鑱� 鑱� task.change_mode(curr_timestamp, 'exit')
鑱�
鑱� 鑱� suffix=0
鑱� 鑱� while True:
鑱� 鑱� 鑱� old_tid = str(self.tid)+"-"+str(suffix)
鑱� 鑱� 鑱� if old_tid in tasks:
鑱� 鑱� 鑱� 鑱� suffix += 1
鑱� 鑱� 鑱� else:
鑱� 鑱� 鑱� 鑱� break
鑱�
鑱� 鑱� tasks[old_tid] = tasks[self.tid]
鑱�
鑱� 鑱� del tasks[self.tid]
鑱�
鑱� 鑱� tasks[self.tid] = new_task
```

This will clearly separate the statistics for the different process images. In the example below, the `perf` command (task "9614-0") `exec`'d `exec.sh` (task "9614-1"), which in turn `exec`'d itself (task "9614"):
```
-- [ 鑱絫ask] command 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱� [ 鑱�9614] execs.sh 鑱� 鑱�4 鑱�1.328238 鑱�0.485604 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.273230 | 鑱�44.4%
鑱� 鑱� [ 鑱�9614] execs.sh 鑱� 鑱�7 鑱�0.000000 鑱�0.201266 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.003466 | 鑱�98.3%
鑱� 鑱� [ 鑱�9614] execs.sh 鑱紸LL 鑱�1.328238 鑱�0.686870 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.276696 | 鑱�47.0% 鑱� 鑱� 1

-- [ 鑱絫ask] command 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱� [9614-0] perf 鑱� 鑱� 鑱� 鑱�3 鑱�0.000000 鑱�0.408588 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.298722 | 鑱�15.1%
鑱� 鑱� [9614-0] perf 鑱� 鑱� 鑱� 鑱�4 鑱�0.059079 鑱�0.028269 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.611355 | 鑱�12.5%
鑱� 鑱� [9614-0] perf 鑱� 鑱� 鑱� 鑱�5 鑱�0.000000 鑱�0.067626 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.004702 | 鑱�93.5%
鑱� 鑱� [9614-0] perf 鑱� 鑱� 鑱紸LL 鑱�0.059079 鑱�0.504483 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.914779 | 鑱�16.2% 鑱� 鑱� 2
鑱�
-- [ 鑱絫ask] command 鑱� cpu 鑱� 鑱� 鑱絬ser 鑱� 鑱� 鑱� sys 鑱� 鑱� 鑱� irq 鑱� 鑱� 鑱� 鑱絟v 鑱� 鑱� 鑱絙usy 鑱� 鑱� 鑱絠dle | 鑱絬til% moves
鑱� 鑱� [9614-1] execs.sh 鑱� 鑱�3 鑱�1.207972 鑱�0.987433 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.435908 | 鑱�47.4%
鑱� 鑱� [9614-1] execs.sh 鑱� 鑱�4 鑱�0.000000 鑱�0.341152 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�0.004147 | 鑱�98.8%
鑱� 鑱� [9614-1] execs.sh 鑱紸LL 鑱�1.207972 鑱�1.328585 鑱�0.000000 鑱�0.000000 鑱�0.000000 鑱�2.440055 | 鑱�51.0% 鑱� 鑱� 1
```

#### Distribution support

Surprisingly, there is currently no support for `perf`'s Python bindings in Ubuntu. [Follow the saga][4] for more detail.

#### Limit on number of traced events

As `curt` gets more sophisticated, it is likely that more and more events may be required to be included in the trace file. `perf` currently requires one file descriptor per event per CPU. This becomes a problem when the maximum number of open file descriptors is not a large multiple of the number of CPUs on the system. On systems with large numbers of CPUs, this quickly becomes a problem. For example, the default maximum number of open file descriptors is often 1,024. An IBM POWER8 system with four sockets may have 12 cores per socket and eight threads (CPUs) per core. Such a system has 4 * 12 * 8 = 392 CPUs. In that case, `perf` could trace only about two events! A workaround is to (significantly) increase the maximum number of open file descriptors (`ulimit 閳ユ悏` if the system administrator has configured the hard limits high enough; or the administrator can set the limits higher in `/etc/security/limits.conf` for `nofile`).

### Summary

I hope this article shows the power of `perf`閳ユ攣nd specifically the utility and flexibility of the Python scripting enabled with `perf`閳ユ敄o perform sophisticated processing of kernel trace data. Also, it shows some of the issues and edge cases that can be encountered when the boundaries of such technologies are tested.

Please feel free to download and make use of the `curt` tool described here, report problems, suggest improvements, or contribute code of your own on the [`curt` GitHub page][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/fun-perf-and-python

娴ｆ粏鈧拑绱癧Paul Clarke][a]
闁顣介敍姝攍ujun9972](https://github.com/lujun9972)
鐠囨垼鈧拑绱癧鐠囨垼鈧將D](https://github.com/鐠囨垼鈧將D)
閺嶁€愁嚠閿涙瓟閺嶁€愁嚠閼板將D](https://github.com/閺嶁€愁嚠閼板將D)

閺堫剚鏋冮悽锟� [LCTT](https://github.com/LCTT/TranslateProject) 閸樼喎鍨辩紓鏍槯閿涘Linux娑擃厼娴梋(https://linux.cn/) 閼斤綀鐛曢幒銊ュ毉

[a]:https://opensource.com/users/thinkopenly
[1]:https://2018.texaslinuxfest.org/
[2]:https://www.ibm.com/support/knowledgecenter/en/ssw_aix_72/com.ibm.aix.cmds1/curt.htm
[3]:https://opensource.com/article/17/9/intro-ebpf
[4]:https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1707875
[5]:https://github.com/open-power-sdk/curt
