Choosing a Linux Tracer (2015)
======
[![][1]][2]
_Linux Tracing is Magic!_

A tracer is an advanced performance analysis and troubleshooting tool, but don't let that intimidate you... If you've used strace(1) or tcpdump(8) - you've used a tracer. System tracers can see much more than just syscalls or packets, as they can typically trace any kernel or application software.

There are so many Linux tracers that the choice is overwhelming. As each has an official (or unofficial) pony-corn mascot, we have enough for a kids' show.

Which tracer should you use?

I've answered this question for two audiences: for most people, and, for performance/kernel engineers. This will also change over time, so I'll need to post follow-ups, maybe once a year or so.

## For Most People

Most people (developers, sysadmins, devops, SREs, ...) are not going to learn a system tracer in gory detail. Here's what you most likely need to know and do about tracers:

### 1. Use perf_events for CPU profiling

Use perf_events to do CPU profiling. The profile can be visualized as a [flame graph][3]. Eg:
```
git clone --depth 1 https://github.com/brendangregg/FlameGraph
perf record -F 99 -a -g -- sleep 30
perf script | ./FlameGraph/stackcollapse-perf.pl | ./FlameGraph/flamegraph.pl > perf.svg

```

Linux perf_events (aka "perf", after its command) is the official tracer/profiler for Linux users. It is in the kernel source, and is well maintained (and currently rapidly being enhanced). It's usually added via a linux-tools-common package.

perf can do many things, but if I had to recommend you learn just one, it would be CPU profiling. Even though this is not technically "tracing" of events, as it's sampling. The hardest part is getting full stacks and symbols to work, which I covered in my [Linux Profiling at Netflix][4] talk for Java and Node.js.

### 2. Know what else is possible

As a friend once said: "You don't need to know how to operate an X-ray machine, but you _do_ need to know that if you swallow a penny, an X-ray is an option!" You need to know what is possible with tracers, so that if your business really needs it, you can either learn how to do it later, or hire someone who does.

In a nutshell: performance of virtually anything can be understood with tracing. File system internals, TCP/IP processing, device drivers, application internals. Read my lwn.net [article on ftrace][5], and browse my [perf_events page][6], as examples of some tracing (and profiling) capabilities.

### 3. Ask for front ends

If you are paying for performance analysis tools (and there are many companies that sell them), ask for Linux tracing support. Imagine an intuitive point-and-click interface that can expose kernel internals, including latency heatmaps at different stack locations. I described such an interface in my [Monitorama talk][7].

I've created and open sourced some front ends myself, although for the CLI (not GUIs). These also allow people to benefit from the tracers more quickly and easily. Eg, from my [perf-tools][8], tracing new processes:
```
# ./execsnoop
Tracing exec()s. Ctrl-C to end.
 PID PPID ARGS
 22898 22004 man ls
 22905 22898 preconv -e UTF-8
 22908 22898 pager -s
 22907 22898 nroff -mandoc -rLL=164n -rLT=164n -Tutf8
[...]

```

At Netflix, we're creating [Vector][9], an instance analysis tool that should also eventually front Linux tracers.

## For Performance or Kernel Engineers

Our job is much harder, since most people may be asking us to figure out how to trace something, and therefore which tracer to use. To properly understand a tracer, you usually need to spend at least one hundred hours with it. Understanding all the Linux tracers to make a rational decision between them a huge undertaking. (I may be the only person who has come close to doing this.)

Here's what I'd recommend. Either:

A) Pick one all-powerful tracer, and standardize on that. This will involve a lot of time figuring out its nuances and safety in a test environment. I'd currently recommend the latest version of SystemTap (ie, build from [source][10]). I know of companies that have picked LTTng, and are happy with it, although it's not quite as powerful (although, it is safer). If sysdig adds tracepoints or kprobes, it could be another candidate.

B) Follow the above flow chart from my [Velocity tutorial][11]. It will mean using ftrace or perf_events as much as possible, eBPF as it gets integrated, and then other tracers like SystemTap/LTTng to fill in the gaps. This is what I do in my current job at Netflix.

Comments by tracer:

### 1. ftrace

I love [Ftrace][12], it's a kernel hacker's best friend. It's built into the kernel, and can consume tracepoints, kprobes, and uprobes, and provides a few capabilities: event tracing, with optional filters and arguments; event counting and timing, summarized in-kernel; and function-flow walking. See [ftrace.txt][13] from the kernel source for examples. It's controlled via /sys, and is intended for a single root user (although you could hack multi-user support using buffer instances). Its interface can be fiddly at times, but it's quite hackable, and there are front ends: Steven Rostedt, the main ftrace author, has created trace-cmd, and I've created the perf-tools collection. My biggest gripe is that it isn't programmable, so you can't, for example, save and fetch timestamps, calculate latency, and then store it as a histogram. You'll need to dump events to user-level, and post-process, at some cost. It may become programmable via eBPF.

### 2. perf_events

[perf_events][14] is the main tracing tool for Linux users, its source is in the Linux kernel, and is usually added via a linux-tools-common package. Aka "perf", after its front end, which is typically used to trace & dump to a file (perf.data), which it does relatively efficiently (dynamic buffering), and then post-processeses that later. It can do most of what ftrace can. It can't do function-flow walking, and is a bit less hackable (as it has better safety/error checking). But it can do profiling (sampling), CPU performance counters, user-level stack translation, and can consume debuginfo for line tracing with local variables. It also supports multiple concurrent users. As with ftrace, it isn't kernel programmable yet, until perhaps eBPF support (patches have been proposed). If there's one tracer I'd recommend people learn, it'd be perf, as it can solve a ton of issues, and is relatively safe.

### 3. eBPF

The extended Berkeley Packet Filter is an in-kernel virtual machine that can run programs on events, efficiently (JIT). It's likely to eventually provide in-kernel programming for ftrace and perf_events, and to enhance other tracers. It's currently being developed by Alexei Starovoitov, and isn't fully integrated yet, but there's enough in-kernel (as of 4.1) for some impressive tools: eg, latency heat maps of block device I/O. For reference, see the [BPF slides][15] from Alexei, and his [eBPF samples][16].

### 4. SystemTap

[SystemTap][17] is the most powerful tracer. It can do everything: profiling, tracepoints, kprobes, uprobes (which came from SystemTap), USDT, in-kernel programming, etc. It compiles programs into kernel modules and loads them - an approach which is tricky to get safe. It is also developed out of tree, and has had issues in the past (panics or freezes). Many are not SystemTap's fault - it's often the first to use certain tracing capabilities with the kernel, and the first to run into bugs. The latest version of SystemTap is much better (you must compile from source), but many people are still spooked from earlier versions. If you want to use it, spend time in a test environment, and chat to the developers in #systemtap on irc.freenode.net. (Netflix has a fault-tolerant architecture, and we have used SystemTap, but we may be less concerned about safety than you.) My biggest gripe is that it seems to assume you'll have kernel debuginfo, which I don't usually have. It actually can do a lot without it, but documentation and examples are lacking (I've begun to help with that myself).

### 5. LTTng

[LTTng][18] has optimized event collection, which outperforms other tracers, and also supports numerous event types, including USDT. It is developed out of tree. The core of it is very simple: write events to a tracing buffer, via a small and fixed set of instructions. This helps make it safe and fast. The downside is that there's no easy way to do in-kernel programming. I keep hearing that this is not a big problem, since it's so optimized that it can scale sufficiently despite needing post processing. It also has been pioneering a different analysis technique, more of a black box recording of all interesting events that can be studied in GUIs later. I'm concerned about such a recording missing events I didn't have the foresight to record, but I really need to spend more time with it to see how well it works in practice. It's the tracer I've spent the least time with (no particular reason).

### 6. ktap

[ktap][19] was a really promising tracer, which used an in-kernel lua virtual machine for processing, and worked fine without debuginfo and on embedded devices. It made it into staging, and for a moment looked like it would win the trace race on Linux. Then eBPF began kernel integration, and ktap integration was postponed until it could use eBPF instead of its own VM. Since eBPF is still integrating many months later, the ktap developers have been waiting a long time. I hope it restarts development later this year.

### 7. dtrace4linux

[dtrace4linux][20] is mostly one man's part-time effort (Paul Fox) to port Sun DTrace to Linux. It's impressive, and some providers work, but it's some ways from complete, and is more of an experimental tool (unsafe). I think concern over licensing has left people wary of contributing: it will likely never make it into the Linux kernel, as Sun released DTrace under the CDDL license; Paul's approach to this is to make it an add-on. I'd love to see DTrace on Linux and this project finished, and thought I'd spend time helping it finish when I joined Netflix. However, I've been spending time using the built-in tracers, ftrace and perf_events, instead.

### 8. OL DTrace

[Oracle Linux DTrace][21] is a serious effort to bring DTrace to Linux, specifically Oracle Linux. Various releases over the years have shown steady progress. The developers have even spoken about improving the DTrace test suite, which shows a promising attitude to the project. Many useful providers have already been completed: syscall, profile, sdt, proc, sched, and USDT. I'm still waiting for fbt (function boundary tracing, for kernel dynamic tracing), which will be awesome on the Linux kernel. Its ultimate success will hinge on whether it's enough to tempt people to run Oracle Linux (and pay for support). Another catch is that it may not be entirely open source: the kernel components are, but I've yet to see the user-level code.

### 9. sysdig

[sysdig][22] is a new tracer that can operate on syscall events with tcpdump-like syntax, and lua post processing. It's impressive, and it's great to see innovation in the system tracing space. Its limitations are that it is syscalls only at the moment, and, that it dumps all events to user-level for post processing. You can do a lot with syscalls, although I'd like to see it support tracepoints, kprobes, and uprobes. I'd also like to see it support eBPF, for in-kernel summaries. The sysdig developers are currently adding container support. Watch this space.

## Further Reading

My own work with the tracers includes:

**ftrace** : My [perf-tools][8] collection (see the examples directory); my lwn.net [article on ftrace][5]; a [LISA14][8] talk; and the posts: [function counting][23], [iosnoop][24], [opensnoop][25], [execsnoop][26], [TCP retransmits][27], [uprobes][28], and [USDT][29].

**perf_events** : My [perf_events Examples][6] page; a [Linux Profiling at Netflix][4] talk for SCALE; and the posts [CPU Sampling][30], [Static Tracepoints][31], [Heat Maps][32], [Counting][33], [Kernel Line Tracing][34], [off-CPU Time Flame Graphs][35].

**eBPF** : The post [eBPF: One Small Step][36], and some [BPF-tools][37] (I need to publish more).

**SystemTap** : I wrote a [Using SystemTap][38] post a long time ago, which is somewhat out of date. More recently I published some [systemtap-lwtools][39], showing how SystemTap can be used without kernel debuginfo.

**LTTng** : I've used it a little, but not enough yet to publish anything.

**ktap** : My [ktap Examples][40] page includes one-liners and scripts, although these were for an earlier version.

**dtrace4linux** : I included some examples in my [Systems Performance book][41], and I've developed some small fixes for things in the past, eg, [timestamps][42].

**OL DTrace** : As this is a straight port of DTrace, much of my earlier DTrace work should be relevant (too many links to list here; search on [my homepage][43]). I may develop some specific tools once this is more complete.

**sysdig** : I contributed the [fileslower][44] and [subsecond offset spectrogram][45] chisels.

**others** : I did write a warning post about [strace][46].

Please, no more tracers! ... If you're wondering why Linux doesn't just have one, or DTrace itself, I answered these in my [From DTrace to Linux][47] talk, starting on [slide 28][48].

Thanks to [Deirdre Straughan][49] for edits, and for creating the tracing ponies (with General Zoi's pony creator).

--------------------------------------------------------------------------------

via: http://www.brendangregg.com/blog/2015-07-08/choosing-a-linux-tracer.html

作者：[Brendan Gregg.][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.brendangregg.com
[1]:http://www.brendangregg.com/blog/images/2015/tracing_ponies.png
[2]:http://www.slideshare.net/brendangregg/velocity-2015-linux-perf-tools/105
[3]:http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html
[4]:http://www.brendangregg.com/blog/2015-02-27/linux-profiling-at-netflix.html
[5]:http://lwn.net/Articles/608497/
[6]:http://www.brendangregg.com/perf.html
[7]:http://www.brendangregg.com/blog/2015-06-23/netflix-instance-analysis-requirements.html
[8]:http://www.brendangregg.com/blog/2015-03-17/linux-performance-analysis-perf-tools.html
[9]:http://techblog.netflix.com/2015/04/introducing-vector-netflixs-on-host.html
[10]:https://sourceware.org/git/?p=systemtap.git;a=blob_plain;f=README;hb=HEAD
[11]:http://www.slideshare.net/brendangregg/velocity-2015-linux-perf-tools
[12]:http://lwn.net/Articles/370423/
[13]:https://www.kernel.org/doc/Documentation/trace/ftrace.txt
[14]:https://perf.wiki.kernel.org/index.php/Main_Page
[15]:http://www.phoronix.com/scan.php?page=news_item&px=BPF-Understanding-Kernel-VM
[16]:https://github.com/torvalds/linux/tree/master/samples/bpf
[17]:https://sourceware.org/systemtap/wiki
[18]:http://lttng.org/
[19]:http://ktap.org/
[20]:https://github.com/dtrace4linux/linux
[21]:http://docs.oracle.com/cd/E37670_01/E38608/html/index.html
[22]:http://www.sysdig.org/
[23]:http://www.brendangregg.com/blog/2014-07-13/linux-ftrace-function-counting.html
[24]:http://www.brendangregg.com/blog/2014-07-16/iosnoop-for-linux.html
[25]:http://www.brendangregg.com/blog/2014-07-25/opensnoop-for-linux.html
[26]:http://www.brendangregg.com/blog/2014-07-28/execsnoop-for-linux.html
[27]:http://www.brendangregg.com/blog/2014-09-06/linux-ftrace-tcp-retransmit-tracing.html
[28]:http://www.brendangregg.com/blog/2015-06-28/linux-ftrace-uprobe.html
[29]:http://www.brendangregg.com/blog/2015-07-03/hacking-linux-usdt-ftrace.html
[30]:http://www.brendangregg.com/blog/2014-06-22/perf-cpu-sample.html
[31]:http://www.brendangregg.com/blog/2014-06-29/perf-static-tracepoints.html
[32]:http://www.brendangregg.com/blog/2014-07-01/perf-heat-maps.html
[33]:http://www.brendangregg.com/blog/2014-07-03/perf-counting.html
[34]:http://www.brendangregg.com/blog/2014-09-11/perf-kernel-line-tracing.html
[35]:http://www.brendangregg.com/blog/2015-02-26/linux-perf-off-cpu-flame-graph.html
[36]:http://www.brendangregg.com/blog/2015-05-15/ebpf-one-small-step.html
[37]:https://github.com/brendangregg/BPF-tools
[38]:http://dtrace.org/blogs/brendan/2011/10/15/using-systemtap/
[39]:https://github.com/brendangregg/systemtap-lwtools
[40]:http://www.brendangregg.com/ktap.html
[41]:http://www.brendangregg.com/sysperfbook.html
[42]:https://github.com/dtrace4linux/linux/issues/55
[43]:http://www.brendangregg.com
[44]:https://github.com/brendangregg/sysdig/commit/d0eeac1a32d6749dab24d1dc3fffb2ef0f9d7151
[45]:https://github.com/brendangregg/sysdig/commit/2f21604dce0b561407accb9dba869aa19c365952
[46]:http://www.brendangregg.com/blog/2014-05-11/strace-wow-much-syscall.html
[47]:http://www.brendangregg.com/blog/2015-02-28/from-dtrace-to-linux.html
[48]:http://www.slideshare.net/brendangregg/from-dtrace-to-linux/28
[49]:http://www.beginningwithi.com/
