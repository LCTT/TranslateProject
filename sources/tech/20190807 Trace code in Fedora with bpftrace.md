[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Trace code in Fedora with bpftrace)
[#]: via: (https://fedoramagazine.org/trace-code-in-fedora-with-bpftrace/)
[#]: author: (Augusto Caringi https://fedoramagazine.org/author/acaringi/)

Trace code in Fedora with bpftrace
======

![][1]

bpftrace is [a new eBPF-based tracing tool][2] that was first included in Fedora 28. It was developed by Brendan Gregg, Alastair Robertson and Matheus Marchini with the help of a loosely-knit team of hackers across the Net. A tracing tool lets you analyze what a system is doing behind the curtain. It tells you which functions in code are being called, with which arguments, how many times, and so on.

This article covers some basics about bpftrace, and how it works. Read on for more information and some useful examples.

### eBPF (extended Berkeley Packet Filter)

[eBPF][3] is a tiny virtual machine, or a virtual CPU to be more precise, in the Linux Kernel. The eBPF can load and run small programs in a safe and controlled way in kernel space. This makes it safer to use, even in production systems. This virtual machine has its own instruction set architecture ([ISA][4]) resembling a subset of modern processor architectures. The ISA makes it easy to translate those programs to the real hardware. The kernel performs just-in-time translation to native code for main architectures to improve the performance.

The eBPF virtual machine allows the kernel to be extended programmatically. Nowadays several kernel subsystems take advantage of this new powerful Linux Kernel capability. Examples include networking, seccomp, tracing, and more. The main idea is to attach eBPF programs into specific code points, and thereby extend the original kernel behavior.

eBPF machine language is very powerful. But writing code directly in it is extremely painful, because it’s a low level language. This is where bpftrace comes in. It provides a high-level language to write eBPF tracing scripts. The tool then translates these scripts to eBPF with the help of clang/LLVM libraries, and then attached to the specified code points.

## Installation and quick start

To install bpftrace, run the following command in a terminal [using][5] _[sudo][5]_:

```
$ sudo dnf install bpftrace
```

Try it out with a “hello world” example:

```
$ sudo bpftrace -e 'BEGIN { printf("hello world\n"); }'
```

Note that you must run _bpftrace_ as _root_ due to the privileges required. Use the _-e_ option to specify a program, and to construct the so-called “one-liners.” This example only prints _hello world_, and then waits for you to press **Ctrl+C**.

_BEGIN_ is a special probe name that fires only once at the beginning of execution. Every action inside the curly braces _{ }_ fires whenever the probe is hit — in this case, it’s just a _printf_.

Let’s jump now to a more useful example:

```
$ sudo bpftrace -e 't:syscalls:sys_enter_execve { printf("%s called %s\n", comm, str(args->filename)); }'
```

This example prints the parent process name _(comm)_ and the name of every new process being created in the system. _t:syscalls:sys_enter_execve_ is a kernel tracepoint. It’s a shorthand for _tracepoint:syscalls:sys_enter_execve_, but both forms can be used. The next section shows you how to list all available tracepoints.

_comm_ is a bpftrace builtin that represents the process name. _filename_ is a field of the _t:syscalls:sys_enter_execve_ tracepoint. You can access these fields through the _args_ builtin.

All available fields of the tracepoint can be listed with this command:

```
bpftrace -lv "t:syscalls:sys_enter_execve"
```

## Example usage

### Listing probes

A central concept for _bpftrace_ are **probe points**. Probe points are instrumentation points in code (kernel or userspace) where eBPF programs can be attached. They fit into the following categories:

  * _kprobe_ – kernel function start
  * _kretprobe_ – kernel function return
  * _uprobe_ – user-level function start
  * _uretprobe_ – user-level function return
  * _tracepoint_ – kernel static tracepoints
  * _usdt_ – user-level static tracepoints
  * _profile_ – timed sampling
  * _interval_ – timed output
  * _software_ – kernel software events
  * _hardware_ – processor-level events



All available _kprobe/kretprobe_, _tracepoints_, _software_ and _hardware_ probes can be listed with this command:

```
$ sudo bpftrace -l
```

The _uprobe/uretprobe_ and _usdt_ probes are userspace probes specific to a given executable. To use them, use the special syntax shown later in this article.

The _profile_ and _interval_ probes fire at fixed time intervals. Fixed time intervals are not covered in this article.

### Counting system calls

**Maps** are special BPF data types that store counts, statistics, and histograms. You can use maps to summarize how many times each syscall is being called:

```
$ sudo bpftrace -e 't:syscalls:sys_enter_* { @[probe] = count(); }'
```

Some probe types allow wildcards to match multiple probes. You can also specify multiple attach points for an action block using a comma separated list. In this example, the action block attaches to all tracepoints whose name starts with _t:syscalls:sys_enter__, which means all available syscalls.

The bpftrace builtin function _count()_ counts the number of times this function is called. _@[]_ represents a map (an associative array). The key of this map is _probe_, which is another bpftrace builtin that represents the full probe name.

Here, the same action block is attached to every syscall. Then, each time a syscall is called the map will be updated, and the entry is incremented in the map relative to this same syscall. When the program terminates, it automatically prints out all declared maps.

This example counts the syscalls called globally, it’s also possible to filter for a specific process by _PID_ using the bpftrace filter syntax:

```
$ sudo bpftrace -e 't:syscalls:sys_enter_* / pid == 1234 / { @[probe] = count(); }'
```

### Write bytes by process

Using these concepts, let’s analyze how many bytes each process is writing:

```
$ sudo bpftrace -e 't:syscalls:sys_exit_write /args->ret > 0/ { @[comm] = sum(args->ret); }'
```

_bpftrace_ attaches the action block to the write syscall return probe (_t:syscalls:sys_exit_write_). Then, it uses a filter to discard the negative values, which are error codes _(/args-&gt;ret &gt; 0/)_.

The map key _comm_ represents the process name that called the syscall. The _sum()_ builtin function accumulates the number of bytes written for each map entry or process. _args_ is a bpftrace builtin to access tracepoint’s arguments and return values. Finally, if successful, the _write_ syscall returns the number of written bytes. _args-&gt;ret_ provides access to the bytes.

### Read size distribution by process (histogram):

_bpftrace_ supports the creation of histograms. Let’s analyze one example that creates a histogram of the _read_ size distribution by process:

```
$ sudo bpftrace -e 't:syscalls:sys_exit_read { @[comm] = hist(args->ret); }'
```

Histograms are BPF maps, so they must always be attributed to a map (_@_). In this example, the map key is _comm_.

The example makes _bpftrace_ generate one histogram for every process that calls the _read_ syscall. To generate just one global histogram, attribute the _hist()_ function just to _‘@’_ (without any key).

bpftrace automatically prints out declared histograms when the program terminates. The value used as base for the histogram creation is the number of read bytes, found through _args-&gt;ret_.

### Tracing userspace programs

You can also trace userspace programs with _uprobes/uretprobes_ and _USDT_ (User-level Statically Defined Tracing). The next example uses a _uretprobe_, which probes to the end of a user-level function. It gets the command lines issued in every _bash_ running in the system:

```
$ sudo bpftrace -e 'uretprobe:/bin/bash:readline { printf("readline: \"%s\"\n", str(retval)); }'
```

To list all available _uprobes/uretprobes_ of the _bash_ executable, run this command:

```
$ sudo bpftrace -l "uprobe:/bin/bash"
```

_uprobe_ instruments the beginning of a user-level function’s execution, and _uretprobe_ instruments the end (its return). _readline()_ is a function of _/bin/bash_, and it returns the typed command line. _retval_ is the return value for the instrumented function, and can only be accessed on _uretprobe_.

When using _uprobes_, you can access arguments with _arg0..argN_. A _str()_ call is necessary to turn the _char *_ pointer to a _string_.

## Shipped Scripts

There are many useful scripts shipped with bpftrace package. You can find them in the _/usr/share/bpftrace/tools/_ directory.

Among them, you can find:

  * _killsnoop.bt_ – Trace signals issued by the kill() syscall.
  * _tcpconnect.bt_ – Trace all TCP network connections.
  * _pidpersec.bt_ – Count new procesess (via fork) per second.
  * _opensnoop.bt_ – Trace open() syscalls.
  * _vfsstat.bt_ – Count some VFS calls, with per-second summaries.



You can directly use the scripts. For example:

```
$ sudo /usr/share/bpftrace/tools/killsnoop.bt
```

You can also study these scripts as you create new tools.

## Links

  * bpftrace reference guide – <https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md>
  * bpftrace (DTrace 2.0) for Linux 2018 – <http://www.brendangregg.com/blog/2018-10-08/dtrace-for-linux-2018.html>
  * BPF: the universal in-kernel virtual machine – <https://lwn.net/Articles/599755/>
  * Linux Extended BPF (eBPF) Tracing Tools – <http://www.brendangregg.com/ebpf.html>
  * Dive into BPF: a list of reading material – [https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf][6]



* * *

_Photo by _[_Roman Romashov_][7]_ on _[_Unsplash_][8]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/trace-code-in-fedora-with-bpftrace/

作者：[Augusto Caringi][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/acaringi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/bpftrace-816x345.jpg
[2]: https://github.com/iovisor/bpftrace
[3]: https://lwn.net/Articles/740157/
[4]: https://github.com/iovisor/bpf-docs/blob/master/eBPF.md
[5]: https://fedoramagazine.org/howto-use-sudo/
[6]: https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/
[7]: https://unsplash.com/@wehavemegapixels?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/trace?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
