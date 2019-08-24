[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to bpftrace for Linux)
[#]: via: (https://opensource.com/article/19/8/introduction-bpftrace)
[#]: author: (Brendan Gregg https://opensource.com/users/brendanghttps://opensource.com/users/marcobravo)

An introduction to bpftrace for Linux
======
New Linux tracer analyzes production performance problems and
troubleshoots software.
![Linux keys on the keyboard for a desktop computer][1]

Bpftrace is a new open source tracer for Linux for analyzing production performance problems and troubleshooting software. Its users and contributors include Netflix, Facebook, Red Hat, Shopify, and others, and it was created by [Alastair Robertson][2], a talented UK-based developer who has won various coding competitions.

Linux already has many performance tools, but they are often counter-based and have limited visibility. For example, [iostat(1)][3] or a monitoring agent may tell you your average disk latency, but not the distribution of this latency. Distributions can reveal multiple modes or outliers, either of which may be the real cause of your performance problems. [Bpftrace][4] is suited for this kind of analysis: decomposing metrics into distributions or per-event logs and creating new metrics for visibility into blind spots.

You can use bpftrace via one-liners or scripts, and it ships with many prewritten tools. Here is an example that traces the distribution of read latency for PID 181 and shows it as a power-of-two histogram:


```
# bpftrace -e 'kprobe:vfs_read /pid == 30153/ { @start[tid] = nsecs; }
kretprobe:vfs_read /@start[tid]/ { @ns = hist(nsecs - @start[tid]); delete(@start[tid]); }'
Attaching 2 probes...
^C

@ns:
[256, 512)         10900 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                      |
[512, 1k)          18291 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[1k, 2k)            4998 |@@@@@@@@@@@@@@                                      |
[2k, 4k)              57 |                                                    |
[4k, 8k)             117 |                                                    |
[8k, 16k)             48 |                                                    |
[16k, 32k)           109 |                                                    |
[32k, 64k)             3 |                                                    |
```

This example instruments one event out of thousands available. If you have some weird performance problem, there's probably some bpftrace one-liner that can shed light on it. For large environments, this ability can help you save millions. For smaller environments, it can be of more use in helping to eliminate latency outliers.

I [previously][5] wrote about bpftrace vs. other tracers, including [BCC][6] (BPF Compiler Collection). BCC is great for canned complex tools and agents. Bpftrace is best for short scripts and ad hoc investigations. In this article, I'll summarize the bpftrace language, variable types, probes, and tools.

Bpftrace uses BPF (Berkeley Packet Filter), an in-kernel execution engine that processes a virtual instruction set. BPF has been extended (aka eBPF) in recent years for providing a safe way to extend kernel functionality. It also has become a hot topic in systems engineering, with at least 24 talks on BPF at the last [Linux Plumber's Conference][7]. BPF is in the Linux kernel, and bpftrace is the best way to get started using BPF for observability.

See the bpftrace [INSTALL][8] guide for how to install it, and get the latest version; [0.9.2][9] was just released. For Kubernetes clusters, there is also [kubectl-trace][10] for running it.

### Syntax


```
`probe[,probe,...] /filter/ { action }`
```

The probe specifies what events to instrument. The filter is optional and can filter down the events based on a boolean expression, and the action is the mini-program that runs.

Here's hello world:


```
`# bpftrace -e 'BEGIN { printf("Hello eBPF!\n"); }'`
```

The probe is **BEGIN**, a special probe that runs at the beginning of the program (like awk). There's no filter. The action is a **printf()** statement.

Now a real example:


```
`# bpftrace -e 'kretprobe:sys_read /pid == 181/ { @bytes = hist(retval); }'`
```

This uses a **kretprobe** to instrument the return of the **sys_read()** kernel function. If the PID is 181, a special map variable **@bytes** is populated with a log2 histogram function with the return value **retval** of **sys_read()**. This produces a histogram of the returned read size for PID 181. Is your app doing lots of one byte reads? Maybe that can be optimized.

### Probe types

These are libraries of related probes. The currently supported types are (more will be added):

Type | Description
---|---
**tracepoint** | Kernel static instrumentation points
**usdt** | User-level statically defined tracing
**kprobe** | Kernel dynamic function instrumentation
**kretprobe** | Kernel dynamic function return instrumentation
**uprobe** | User-level dynamic function instrumentation
**uretprobe** | User-level dynamic function return instrumentation
**software** | Kernel software-based events
**hardware** | Hardware counter-based instrumentation
**watchpoint** | Memory watchpoint events (in development)
**profile** | Timed sampling across all CPUs
**interval** | Timed reporting (from one CPU)
**BEGIN** | Start of bpftrace
**END** | End of bpftrace

Dynamic instrumentation (aka dynamic tracing) is the superpower that lets you trace any software function in a running binary without restarting it. This lets you get to the bottom of just about any problem. However, the functions it exposes are not considered a stable API, as they can change from one software version to another. Hence static instrumentation, where event points are hard-coded and become a stable API. When you write bpftrace programs, try to use the static types first, before the dynamic ones, so your programs are more stable.

### Variable types

Variable | Description
---|---
**@name** | global
**@name[key]** | hash
**@name[tid]** | thread-local
**$name** | scratch

Variables with an **@** prefix use BPF maps, which can behave like associative arrays. They can be populated in one of two ways:

  * Variable assignment: **@name = x;**
  * Function assignment: **@name = hist(x);**



Various map-populating functions are built in to provide quick ways to summarize data.

### Built-in variables and functions

Here are some of the built-in variables and functions, but there are many more.

**Built-in variables:**

Variable | Description
---|---
**pid** | process ID
**comm** | Process or command name
**nsecs** | Current time in nanoseconds
**kstack** | Kernel stack trace
**ustack** | User-level stack trace
**arg0...argN** | Function arguments
**args** | Tracepoint arguments
**retval** | Function return value
**name** | Full probe name

**Built-in functions:**

Function | Description
---|---
**printf("...")** | Print formatted string
**time("...")** | Print formatted time
**system("...")** | Run shell command
**@ = count()** | Count events
**@ = hist(x)** | Power-of-2 histogram for x
**@ = lhist(x, min, max, step)** | Linear histogram for x

See the [reference guide][11] for details.

### One-liners tutorial

A great way to learn bpftrace is via one-liners, which I turned into a [one-liners tutorial][12] that covers the following:

Listing probes | **bpftrace -l 'tracepoint:syscalls:sys_enter_*'**
---|---
Hello world | **bpftrace -e 'BEGIN { printf("hello world\n") }'**
File opens | **bpftrace -e 'tracepoint:syscalls:sys_enter_open { printf("%s %s\n", comm, str(args-&gt;filename)) }'**
Syscall counts by process | **bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count() }'**
Distribution of read() bytes | **bpftrace -e 'tracepoint:syscalls:sys_exit_read /pid == 18644/ { @bytes = hist(args-&gt;retval) }'**
Kernel dynamic tracing of read() bytes | **bpftrace -e 'kretprobe:vfs_read { @bytes = lhist(retval, 0, 2000, 200) }'**
Timing read()s | **bpftrace -e 'kprobe:vfs_read { @start[tid] = nsecs } kretprobe:vfs_read /@start[tid]/ { @ns[comm] = hist(nsecs - @start[tid]); delete(@start[tid]) }'**
Count process-level events | **bpftrace -e 'tracepoint:sched:sched* { @[name] = count() } interval:s:5 { exit() }'**
Profile on-CPU kernel stacks | **bpftrace -e 'profile:hz:99 { @[stack] = count() }'**
Scheduler tracing | **bpftrace -e 'tracepoint:sched:sched_switch { @[stack] = count() }'**
Block I/O tracing | **bpftrace -e 'tracepoint:block:block_rq_issue { @ = hist(args-&gt;bytes); }**
Kernel struct tracing (a script, not a one-liner) | Command: **bpftrace path.bt**, where the path.bt file is:

**#include &lt;linux/path.h&gt;
#include &lt;linux/dcache.h&gt;**

**kprobe:vfs_open { printf("open path: %s\n", str(((path *)arg0)-&gt;dentry-&gt;d_name.name)); }**

See the tutorial for an explanation of each.

### Provided tools

Apart from one-liners, bpftrace programs can be multi-line scripts. Bpftrace ships with 28 of them as tools:

![bpftrace/eBPF tools][13]

These can be found in the **[/tools][14]** directory:


```
tools# ls *.bt
bashreadline.bt  dcsnoop.bt         oomkill.bt    syncsnoop.bt   vfscount.bt
biolatency.bt    execsnoop.bt       opensnoop.bt  syscount.bt    vfsstat.bt
biosnoop.bt      gethostlatency.bt  pidpersec.bt  tcpaccept.bt   writeback.bt
bitesize.bt      killsnoop.bt       runqlat.bt    tcpconnect.bt  xfsdist.bt
capable.bt       loads.bt           runqlen.bt    tcpdrop.bt
cpuwalk.bt       mdflush.bt         statsnoop.bt  tcpretrans.bt
```

Apart from their use in diagnosing performance issues and general troubleshooting, they also provide another way to learn bpftrace. Here are some examples.

#### Source

Here's the code to **biolatency.bt**:


```
tools# cat -n biolatency.bt
     1  /*
     2   * biolatency.bt    Block I/O latency as a histogram.
     3   *                  For Linux, uses bpftrace, eBPF.
     4   *
     5   * This is a bpftrace version of the bcc tool of the same name.
     6   *
     7   * Copyright 2018 Netflix, Inc.
     8   * Licensed under the Apache License, Version 2.0 (the "License")
     9   *
    10   * 13-Sep-2018  Brendan Gregg   Created this.
    11   */
    12
    13  BEGIN
    14  {
    15          printf("Tracing block device I/O... Hit Ctrl-C to end.\n");
    16  }
    17
    18  kprobe:blk_account_io_start
    19  {
    20          @start[arg0] = nsecs;
    21  }
    22
    23  kprobe:blk_account_io_done
    24  /@start[arg0]/
    25
    26  {
    27          @usecs = hist((nsecs - @start[arg0]) / 1000);
    28          delete(@start[arg0]);
    29  }
    30 
    31  END
    32  {
    33          clear(@start);
    34  }
```

It's straightforward, easy to read, and short enough to include on a slide. This version uses kernel dynamic tracing to instrument the **blk_account_io_start()** and **blk_account_io_done()** functions, and it passes a timestamp between them keyed on **arg0** to each. **arg0** on **kprobe** is the first argument to that function, which is the struct request *****, and its memory address is used as a unique identifier.

#### Example files

You can see screenshots and explanations of these tools in the [GitHub repo][14] as ***_example.txt** files. For [example][15]:


```
tools# more biolatency_example.txt
Demonstrations of biolatency, the Linux BPF/bpftrace version.

This traces block I/O, and shows latency as a power-of-2 histogram. For example:

# biolatency.bt
Attaching 3 probes...
Tracing block device I/O... Hit Ctrl-C to end.
^C

@usecs:
[256, 512)             2 |                                                    |
[512, 1K)             10 |@                                                   |
[1K, 2K)             426 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[2K, 4K)             230 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@                        |
[4K, 8K)               9 |@                                                   |
[8K, 16K)            128 |@@@@@@@@@@@@@@@                                     |
[16K, 32K)            68 |@@@@@@@@                                            |
[32K, 64K)             0 |                                                    |
[64K, 128K)            0 |                                                    |
[128K, 256K)          10 |@                                                   |

While tracing, this shows that 426 block I/O had a latency of between 1K and 2K
usecs (1024 and 2048 microseconds), which is between 1 and 2 milliseconds.
There are also two modes visible, one between 1 and 2 milliseconds, and another
between 8 and 16 milliseconds: this sounds like cache hits and cache misses.
There were also 10 I/O with latency 128 to 256 ms: outliers. Other tools and
instrumentation, like biosnoop.bt, can shed more light on those outliers.
[...]
```

Sometimes it can be most effective to switch straight to the example file when trying to understand these tools, since the output may be self-evident (by design!).

#### Man pages

There are also man pages for every tool in the GitHub repo under [/man/man8][16]. They include sections on the output fields and the tool's expected overhead.


```
# nroff -man man/man8/biolatency.8
biolatency(8)               System Manager's Manual              biolatency(8)

NAME
       biolatency.bt - Block I/O latency as a histogram. Uses bpftrace/eBPF.

SYNOPSIS
       biolatency.bt

DESCRIPTION
       This  tool  summarizes  time  (latency) spent in block device I/O (disk
       I/O) as a power-of-2 histogram. This  allows  the  distribution  to  be
       studied,  including  modes and outliers. There are often two modes, one
       for device cache hits and one for cache misses, which can be  shown  by
       this tool. Latency outliers will also be shown.
[...]
```

Writing all these man pages was the least fun part of developing these tools, and some took longer to write than the tool took to develop, but it's nice to see the final result.

### bpftrace vs. BCC

Since eBPF has been merging in the kernel, most effort has been placed on the [BCC][6] frontend, which provides a BPF library and Python, C++, and Lua interfaces for writing programs. I've developed a lot of [tools][17] in BCC/Python; it works great, although coding in BCC is verbose. If you're hacking away at a performance issue, bpftrace is better for your one-off custom queries. If you're writing a tool with many command-line options or an agent that uses Python libraries, you'll want to consider using BCC.

On the Netflix performance team, we use both: BCC for developing canned tools that others can easily use and for developing agents; and bpftrace for ad hoc analysis. The network engineering team has been using BCC to develop an agent for its needs. The security team is most interested in bpftrace for quick ad hoc instrumentation for detecting zero-day vulnerabilities. And I expect the developer teams will use both without knowing it, via the self-service GUIs we are building (Vector), and occasionally may SSH into an instance and run a canned tool or ad hoc bpftrace one-liner.

### Learn more

  * The [bpftrace][4] repository on GitHub
  * The bpftrace [one-liners tutorial][12]
  * The bpftrace [reference guide][11]
  * The [BCC][6] repository for more complex BPF-based tools



I also have a book coming out this year that covers bpftrace: _[BPF Performance Tools: Linux System and Application Observability][18]_, to be published by Addison Wesley, and which contains many new bpftrace tools.

* * *

_Thanks to Alastair Robertson for creating bpftrace, and the bpftrace, BCC, and BPF communities for all the work over the past five years._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/introduction-bpftrace

作者：[Brendan Gregg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brendanghttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://ajor.co.uk/bpftrace/
[3]: https://linux.die.net/man/1/iostat
[4]: https://github.com/iovisor/bpftrace
[5]: http://www.brendangregg.com/blog/2018-10-08/dtrace-for-linux-2018.html
[6]: https://github.com/iovisor/bcc
[7]: https://www.linuxplumbersconf.org/
[8]: https://github.com/iovisor/bpftrace/blob/master/INSTALL.md
[9]: https://github.com/iovisor/bpftrace/releases/tag/v0.9.2
[10]: https://github.com/iovisor/kubectl-trace
[11]: https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md
[12]: https://github.com/iovisor/bpftrace/blob/master/docs/tutorial_one_liners.md
[13]: https://opensource.com/sites/default/files/uploads/bpftrace_tools_early2019.png (bpftrace/eBPF tools)
[14]: https://github.com/iovisor/bpftrace/tree/master/tools
[15]: https://github.com/iovisor/bpftrace/blob/master/tools/biolatency_example.txt
[16]: https://github.com/iovisor/bcc/tree/master/man/man8
[17]: https://github.com/iovisor/bcc#tools
[18]: http://www.brendangregg.com/blog/2019-07-15/bpf-performance-tools-book.html
