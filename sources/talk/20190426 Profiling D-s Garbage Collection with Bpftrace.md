[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Profiling D's Garbage Collection with Bpftrace)
[#]: via: (https://theartofmachinery.com/2019/04/26/bpftrace_d_gc.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Profiling D's Garbage Collection with Bpftrace
======

Recently I’ve been playing around with using [`bpftrace`][1] to trace and profile D’s garbage collector. Here are some examples of the cool stuff that’s possible.

### What is `bpftrace`?

It’s a high-level debugging tool based on Linux’s eBPF. “eBPF” stands for “extended Berkely packet filter”, but that’s just a historical name and doesn’t mean much today. It’s really a virtual machine (like the [JVM][2]) that sits inside the Linux kernel and runs code in a special eBPF instruction set similar to normal machine code. Users are expected to write short programs in high-level languages (including C and others) that get compiled to eBPF and loaded into the kernel on the fly to do interesting things.

As you might guess, eBPF is powerful for instrumenting a running kernel, but it also supports instrumenting user-space programs.

### What you need

First you need a Linux kernel. Sorry BSD, Mac OS and Windows users. (But some of you can use [DTrace][3].)

Also, not just any Linux kernel will work. This stuff is relatively new, so you’ll need a modern kernel with BPF-related features enabled. You might need to use the newest (or even testing) version of a distro. Here’s how to check if your kernel meets the requirements:

```
$ uname -r
4.19.27-gentoo-r1sub
$ # 4.9+ recommended by bpftrace
$ zgrep CONFIG_UPROBES /proc/config.gz
CONFIG_UPROBES=y
$ # Also need
$ # CONFIG_BPF=y
$ # CONFIG_BPF_SYSCALL=y
$ # CONFIG_BPF_JIT=y
$ # CONFIG_HAVE_EBPF_JIT=y
$ # CONFIG_BPF_EVENTS=y
```

Of course, [you also need to install the `bpftrace` tool itself][4].

### `bpftrace` D “Hello World”

Here’s a quick test you can do to make sure you’ve got everything working. First, let’s make a Hello World D binary:

```
$ pwd
/tmp/
$ cat hello.d
import std.stdio;

void main()
{
    writeln("Hello World");
}
$ dmd hello.d
$ ./hello
Hello World
$
```

Now let’s `bpftrace` it. `bpftrace` uses a high-level language that’s obviously inspired by AWK. I’ll explain enough to understand the post, but you can also check out the [`bpftrace` reference guide][5] and [one-liner tutorial][6]. The minimum you need to know is that a bpftrace program is a list of `event:name /filter predicate/ { program(); code(); }` blocks that define code snippets to be run on events.

This time I’m only using Linux uprobes, which trigger on functions in user-space programs. The syntax is `uprobe:/path/to/binary:functionName`. One gotcha is that D “[mangles][7]” (encodes) function names before inserting them into the binary. If we want to trigger on the D code’s `main()` function, we need to use the mangled name: `_Dmain`. (By the way, `nm program | grep ' _D.*functionName'` is one quick trick for finding mangled names.)

Run this `bpftrace` invocation in a terminal as root user:

```
# bpftrace -e 'uprobe:/tmp/hello:_Dmain { printf("D Hello World run with process ID %d\n", pid); }'
Attaching 1 probe...
```

While this is running, it’ll print a message every time the D Hello World program is executed by any user in any terminal. Press `Ctrl+C` to quit.

All `bpftrace` code can be run directly from the command line like in the example above. But to make things easier to read from now on, I’ll make neatly formatted scripts.

### Tracing some real code

I’m using [D-Scanner][8], the D code analyser, as an example of a simple but non-trivial D workload. One nice thing about `bpftrace` and uprobes is that no modification of the program is needed. I’m just using a normal build of the `dscanner` tool, and using the [D runtime source code][9] as a codebase to analyse.

Before using `bpftrace`, let’s try using [the profiling that’s built into the D GC implementation itself][10]:

```
$ dscanner --DRT-gcopt=profile:1 --etags
...
    Number of collections:  85
    Total GC prep time:  0 milliseconds
    Total mark time:  17 milliseconds
    Total sweep time:  6 milliseconds
    Total page recovery time:  3 milliseconds
    Max Pause Time:  1 milliseconds
    Grand total GC time:  28 milliseconds
GC summary:   35 MB,   85 GC   28 ms, Pauses   17 ms <    1 ms
```

(If you can make a custom build, you can also use [the D runtime GC API to get stats][11].)

There’s one more gotcha when using `bpftrace` on `dscanner` to trace GC functions: the binary file we specify for the uprobe needs to be the binary file that actually contains the GC functions. That could be the D binary itself, or it could be a shared D runtime library. Try running `ldd /path/to/d_program` to list any linked shared libraries, and if the output contains `druntime`, use that full path when specifying uprobes. My `dscanner` binary doesn’t link to a shared D runtime, so I just use the full path to `dscanner`. (Running `which dscanner` gives `/usr/local/bin/dscanner` for me.)

Anyway, all the GC functions live in a `gc` module, so their mangled names start with `_D2gc`. Here’s a `bpftrace` invocation that tallies GC function calls. For convenience, it also includes a uretprobe to automatically exit when `main()` returns. The output is sorted to make it a little easier to read.

```
# cat dumpgcfuncs.bt
uprobe:/usr/local/bin/dscanner:_D2gc*
{
  @[probe] = count();
}

uretprobe:/usr/local/bin/dscanner:_Dmain
{
  exit();
}
# bpftrace dumpgcfuncs.bt | sort

@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC10freeNoSyncMFNbNiPvZv]: 31
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC10initializeFKCQCd11gcinterface2GCZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC11queryNoSyncMFNbPvZS4core6memory8BlkInfo_]: 44041
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC11removeRangeMFNbNiPvZv]: 2
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC12extendNoSyncMFNbPvmmxC8TypeInfoZm]: 251946
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC14collectNoStackMFNbZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC18fullCollectNoStackMFNbZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC4freeMFNbNiPvZv]: 31
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC5queryMFNbPvZS4core6memory8BlkInfo_]: 47704
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6__ctorMFZCQBzQBzQBxQCiQBn]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6callocMFNbmkxC8TypeInfoZPv]: 80
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6extendMFNbPvmmxC8TypeInfoZm]: 251946
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6mallocMFNbmkxC8TypeInfoZPv]: 12423
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_]: 948995
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC7getAttrMFNbPvZ2goFNbPSQClQClQCjQCu3GcxQBbZk]: 5615
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC7getAttrMFNbPvZk]: 5615
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC8addRangeMFNbNiPvmxC8TypeInfoZv]: 2
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC__T9runLockedS_DQCeQCeQCcQCnQBs10freeNoSyncMFNbNiPvZvS_DQDsQDsQDqQEb8freeTimelS_DQErQErQEpQFa8numFreeslTQCdZQEbMFNbNiKQCrZv]: 31
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC__T9runLockedS_DQCeQCeQCcQCnQBs11queryNoSyncMFNbPvZS4core6memory8BlkInfo_S_DQEmQEmQEkQEv9otherTimelS_DQFmQFmQFkQFv9numOtherslTQDaZQExMFNbKQDmZQDn]: 44041
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC__T9runLockedS_DQCeQCeQCcQCnQBs12extendNoSyncMFNbPvmmxC8TypeInfoZmS_DQEfQEfQEdQEo10extendTimelS_DQFhQFhQFfQFq10numExtendslTQCwTmTmTxQDaZQFdMFNbKQDrKmKmKxQDvZm]: 251946
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC__T9runLockedS_DQCeQCeQCcQCnQBs12mallocNoSyncMFNbmkKmxC8TypeInfoZPvS_DQEgQEgQEeQEp10mallocTimelS_DQFiQFiQFgQFr10numMallocslTmTkTmTxQCzZQFcMFNbKmKkKmKxQDsZQDl]: 961498
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC__T9runLockedS_DQCeQCeQCcQCnQBs18fullCollectNoStackMFNbZ2goFNbPSQEaQEaQDyQEj3GcxZmTQvZQDfMFNbKQBgZm]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC__T9runLockedS_DQCeQCeQCcQCnQBs7getAttrMFNbPvZ2goFNbPSQDqQDqQDoQDz3GcxQBbZkS_DQEoQEoQEmQEx9otherTimelS_DQFoQFoQFmQFx9numOtherslTQCyTQDlZQFdMFNbKQDoKQEbZk]: 5615
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw15LargeObjectPool10allocPagesMFNbmZm]: 5597
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw15LargeObjectPool13updateOffsetsMFNbmZv]: 10745
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw15LargeObjectPool7getInfoMFNbPvZS4core6memory8BlkInfo_]: 3844
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw15SmallObjectPool7getInfoMFNbPvZS4core6memory8BlkInfo_]: 40197
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw15SmallObjectPool9allocPageMFNbhZPSQChQChQCfQCq4List]: 15022
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx10smallAllocMFNbhKmkZ8tryAllocMFNbZb]: 955967
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx10smallAllocMFNbhKmkZPv]: 955912
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx11ToScanStack4growMFNbZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx11fullcollectMFNbbZm]: 85
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx11removeRangeMFNbNiPvZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx23updateCollectThresholdsMFNbZv]: 84
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx4markMFNbNlPvQcZv]: 253
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx5sweepMFNbZm]: 84
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx7markAllMFNbbZ14__foreachbody3MFNbKSQCm11gcinterface5RangeZi]: 85
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx7markAllMFNbbZv]: 85
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx7newPoolMFNbmbZPSQBtQBtQBrQCc4Pool]: 6
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx7recoverMFNbZm]: 84
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx8addRangeMFNbNiPvQcxC8TypeInfoZv]: 2
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx8bigAllocMFNbmKmkxC8TypeInfoZ15tryAllocNewPoolMFNbZb]: 5
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx8bigAllocMFNbmKmkxC8TypeInfoZ8tryAllocMFNbZb]: 5616
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx8bigAllocMFNbmKmkxC8TypeInfoZPv]: 5586
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx8isMarkedMFNbNlPvZi]: 635
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx9allocPageMFNbhZPSQBuQBuQBsQCd4List]: 15024
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw4Pool10initializeMFNbmbZv]: 6
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw4Pool12freePageBitsMFNbmKxG4mZv]: 16439
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl5protoQo7ProtoGC4termMFZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl5protoQo7ProtoGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl5protoQo7ProtoGC8addRangeMFNbNiPvmxC8TypeInfoZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc4impl6manualQp8ManualGC10initializeFKCQBp11gcinterface2GCZv]: 1
@[uprobe:/usr/local/bin/dscanner:_D2gc9pooltable__T9PoolTableTSQBc4impl12conservativeQBy4PoolZQBr6insertMFNbNiPQBxZb]: 6
@[uprobe:/usr/local/bin/dscanner:_D2gc9pooltable__T9PoolTableTSQBc4impl12conservativeQBy4PoolZQBr8findPoolMFNaNbNiPvZPQCe]: 302268
@[uprobe:/usr/local/bin/dscanner:_D2gc9pooltable__T9PoolTableTSQBc4impl12conservativeQBy4PoolZQBr8minimizeMFNaNbNjZAPQCd]: 30
Attaching 231 probes...
```

All these functions are in [`src/gc/`][12], and most of the interesting ones here are in [`src/gc/impl/conservative/`][13]. There are 85 calls to `_D2gc4impl12conservativeQw3Gcx11fullcollectMFNbbZm`, which [`ddemangle`][14] translates to `nothrow ulong gc.impl.conservative.gc.Gcx.fullcollect(bool)`. That matches up with the report from `--DRT-gcopt=profile:1`.

The heart of the `bpftrace` program is `@[probe] = count();`. `@` prefixes a global variable, in this case a variable with an empty name (allowed by `bpftrace`). We’re using the variable as a map (like an associative array in D), and indexing it with `probe`, a built-in variable containing the name of the uprobe that was triggered. The tally is kept using the magic `count()` function.

### Garbage collection timings

How about something more interesting, like generating a profile of collection timings? This time, to get more data, I won’t make `bpftrace` exit as soon as the `dscanner` exits. I’ll keep it running and run `dscanner` 100 times before quitting `bpftrace` with `Ctrl+C`:

```
# cat gcprofile.bt
uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx11fullcollectMFNbbZm
{
  @t = nsecs;
}

uretprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw3Gcx11fullcollectMFNbbZm / @t /
{
  @gc_times = hist(nsecs - @t);
}
# bpftrace gcprofile.bt
Attaching 2 probes...
^C

@gc_times:
[64K, 128K)          138 |@                                                   |
[128K, 256K)        1367 |@@@@@@@@@@                                          |
[256K, 512K)        6687 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512K, 1M)             7 |                                                    |
[1M, 2M)             301 |@@                                                  |
```

Et voila! A log-scale histogram of the `nsecs` timestamp difference between entering and exiting `fullcollect()`. The times are in nanoseconds, so we see that most collections are taking less than half a millisecond, but we have tail cases that take 1-2ms.

### Function arguments

`bpftrace` provides `arg0`, `arg1`, `arg2`, etc. built-in variables for accessing the arguments to a traced function. There are a couple of complications with using them with D code, however.

The first is that (at the binary level) `dmd` makes `extern(D)` functions (i.e., normal D functions) take arguments in the reverse order of `extern(C)` functions (that `bpftrace` is expecting). Suppose you have a simple three-argument function. If it’s using the C calling convention, `bpftrace` will recognise the first argument as `arg0`. If it’s using the D calling convention, however, it’ll be picked up as `arg2`.

```
extern(C) void cfunc(int arg0, int arg1, int arg2)
{
    // ...
}

// (extern(D) is the default)
extern(D) void dfunc(int arg2, int arg1, int arg0)
{
    // ...
}
```

If you look at [the D ABI spec][15], you’ll notice that (just like in C++) there can be a couple of hidden arguments if the function is more complex. If `dfunc` above returned a large struct, there can be an extra hidden argument for implementing [copy elision][16], which means the first argument would actually be `arg3`, and `arg0` would be the hidden argument. If `dfunc` were also a member function, it would have a hidden `this` argument, which would bump up the first argument to `arg4`.

To get the hang of this, you might need to experiment with tracing function calls with known arguments.

### Allocation sizes

Let’s get a histogram of the memory allocation request sizes. Looking at the list of GC functions traced earlier, and comparing it with the GC source code, it looks like we need to trace these functions and grab the `size` argument:

```
class ConservativeGC : GC
{
    // ...
    void *malloc(size_t size, uint bits, const TypeInfo ti) nothrow;
    void *calloc(size_t size, uint bits, const TypeInfo ti) nothrow;
    BlkInfo qalloc( size_t size, uint bits, const TypeInfo ti) nothrow;
    // ...
}
```

As class member functions, they have a hidden `this` argument as well. The last one, `qalloc()`, returns a struct, so it also has a hidden argument for copy elision. So `size` is `arg3` for the first two functions, and `arg4` for `qalloc()`. Time to run a trace:

```
# cat allocsizeprofile.bt
uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6mallocMFNbmkxC8TypeInfoZPv,
uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6callocMFNbmkxC8TypeInfoZPv
{
   @ = hist(arg3);
}

uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_
{
  @ = hist(arg4);
}

uretprobe:/usr/local/bin/dscanner:_Dmain
{
  exit();
}
# bpftrace allocsizeprofile.bt
Attaching 4 probes...
@:
[2, 4)              2489 |                                                    |
[4, 8)              9324 |@                                                   |
[8, 16)            46527 |@@@@@                                               |
[16, 32)          206324 |@@@@@@@@@@@@@@@@@@@@@@@                             |
[32, 64)          448020 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[64, 128)         147053 |@@@@@@@@@@@@@@@@@                                   |
[128, 256)         88072 |@@@@@@@@@@                                          |
[256, 512)          2519 |                                                    |
[512, 1K)           1830 |                                                    |
[1K, 2K)            3749 |                                                    |
[2K, 4K)            1668 |                                                    |
[4K, 8K)             256 |                                                    |
[8K, 16K)           2533 |                                                    |
[16K, 32K)           312 |                                                    |
[32K, 64K)           239 |                                                    |
[64K, 128K)          209 |                                                    |
[128K, 256K)         164 |                                                    |
[256K, 512K)         124 |                                                    |
[512K, 1M)            48 |                                                    |
[1M, 2M)              30 |                                                    |
[2M, 4M)               7 |                                                    |
[4M, 8M)               1 |                                                    |
[8M, 16M)              2 |                                                    |
```

So, we have a lot of small allocations, with a very long tail of larger allocations. Remember, size is on a log scale, so that long tail represents a very skewed distribution.

### Small allocation hotspots

Now for something more complex. Suppose we’re profiling our code and looking for low-hanging fruit for reducing the number of memory allocations. Code that makes a lot of small allocations tends to be a good candidate for this kind of refactoring. `bpftrace` lets us grab stack traces, which can be used to see what part of the main program caused an allocation.

As of writing, there’s one little complication because of a limitation of `bpftrace`’s stack trace handling: it can only show meaningful function symbol names (as opposed to raw memory addresses) if `bpftrace` quits while the target program is still running. There’s [an open bug report for improving this behaviour][17], but in the meantime I just made sure `dscanner` took a long time, and that I shut down `bpftrace` first.

Here’s how to grab the top three stack traces that lead to small (&lt;16B) memory allocations with `qalloc()`:

```
# cat smallallocs.bt
uprobe:/usr/local/bin/dscanner:_D2gc4impl12conservativeQw14ConservativeGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_
{
  if (arg4 < 16)
  {
    @[ustack] = count();
  }
}

END
{
  print(@, 3);
  clear(@);
}
# bpftrace smallallocs.bt
Attaching 2 probes...
^C@[
    _D2gc4impl12conservativeQw14ConservativeGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_+0
    _D2rt8lifetime12__arrayAllocFNaNbmxC8TypeInfoxQlZS4core6memory8BlkInfo_+236
    _d_arraysetlengthT+248
    _D8dscanner8analysis25label_var_same_name_check17LabelVarNameCheck9pushScopeMFZv+29
    _D8dscanner8analysis25label_var_same_name_check17LabelVarNameCheck9__mixin175visitMFxC6dparse3ast6ModuleZv+21
    _D8dscanner8analysis3run7analyzeFAyaxC6dparse3ast6ModulexSQCeQBy6config20StaticAnalysisConfigKS7dsymbol11modulecache11ModuleCacheAxS3std12experimental5lexer__T14TokenStructureThVQFpa305_0a20202020737472696e6720636f6d6d656e743b0a20202020737472696e6720747261696c696e67436f6d6d656e743b0a0a20202020696e74206f70436d702873697a655f7420692920636f6e73742070757265206e6f7468726f77204073616665207b0a202020202020202069662028696e646578203c2069292072657475726e202d313b0a202020202020202069662028696e646578203e2069292072657475726e20313b0a202020202020202072657475726e20303b0a202020207d0a0a20202020696e74206f70436d702872656620636f6e737420747970656f66287468697329206f746865722920636f6e73742070757265206e6f7468726f77204073616665207b0a202020202020202072657475726e206f70436d70286f746865722e696e646578293b0a202020207d0aZQYobZCQZv9container6rbtree__T12RedBlackTreeTSQBGiQBGd4base7MessageVQBFza62_20612e6c696e65203c20622e6c696e65207c7c2028612e6c696e65203d3d20622e6c696e6520262620612e636f6c756d6e203c20622e636f6c756d6e2920Vbi1ZQGt+11343
    _D8dscanner8analysis3run7analyzeFAAyaxSQBlQBf6config20StaticAnalysisConfigQBoKS6dparse5lexer11StringCacheKS7dsymbol11modulecache11ModuleCachebZb+337
    _Dmain+3618
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ6runAllMFZ9__lambda1MFZv+40
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ7tryExecMFMDFZvZv+32
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ6runAllMFZv+139
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ7tryExecMFMDFZvZv+32
    _d_run_main+463
    main+16
    __libc_start_main+235
    0x41fd89415541f689
]: 450
@[
    _D2gc4impl12conservativeQw14ConservativeGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_+0
    _D2rt8lifetime12__arrayAllocFNaNbmxC8TypeInfoxQlZS4core6memory8BlkInfo_+236
    _d_arrayappendcTX+1944
    _D8dscanner8analysis10unmodified16UnmodifiedFinder9pushScopeMFZv+61
    _D8dscanner8analysis10unmodified16UnmodifiedFinder5visitMFxC6dparse3ast6ModuleZv+21
    _D8dscanner8analysis3run7analyzeFAyaxC6dparse3ast6ModulexSQCeQBy6config20StaticAnalysisConfigKS7dsymbol11modulecache11ModuleCacheAxS3std12experimental5lexer__T14TokenStructureThVQFpa305_0a20202020737472696e6720636f6d6d656e743b0a20202020737472696e6720747261696c696e67436f6d6d656e743b0a0a20202020696e74206f70436d702873697a655f7420692920636f6e73742070757265206e6f7468726f77204073616665207b0a202020202020202069662028696e646578203c2069292072657475726e202d313b0a202020202020202069662028696e646578203e2069292072657475726e20313b0a202020202020202072657475726e20303b0a202020207d0a0a20202020696e74206f70436d702872656620636f6e737420747970656f66287468697329206f746865722920636f6e73742070757265206e6f7468726f77204073616665207b0a202020202020202072657475726e206f70436d70286f746865722e696e646578293b0a202020207d0aZQYobZCQZv9container6rbtree__T12RedBlackTreeTSQBGiQBGd4base7MessageVQBFza62_20612e6c696e65203c20622e6c696e65207c7c2028612e6c696e65203d3d20622e6c696e6520262620612e636f6c756d6e203c20622e636f6c756d6e2920Vbi1ZQGt+11343
    _D8dscanner8analysis3run7analyzeFAAyaxSQBlQBf6config20StaticAnalysisConfigQBoKS6dparse5lexer11StringCacheKS7dsymbol11modulecache11ModuleCachebZb+337
    _Dmain+3618
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ6runAllMFZ9__lambda1MFZv+40
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ7tryExecMFMDFZvZv+32
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ6runAllMFZv+139
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ7tryExecMFMDFZvZv+32
    _d_run_main+463
    main+16
    __libc_start_main+235
    0x41fd89415541f689
]: 450
@[
    _D2gc4impl12conservativeQw14ConservativeGC6qallocMFNbmkxC8TypeInfoZS4core6memory8BlkInfo_+0
    _D2rt8lifetime12__arrayAllocFNaNbmxC8TypeInfoxQlZS4core6memory8BlkInfo_+236
    _d_arrayappendcTX+1944
    _D8dscanner8analysis3run7analyzeFAyaxC6dparse3ast6ModulexSQCeQBy6config20StaticAnalysisConfigKS7dsymbol11modulecache11ModuleCacheAxS3std12experimental5lexer__T14TokenStructureThVQFpa305_0a20202020737472696e6720636f6d6d656e743b0a20202020737472696e6720747261696c696e67436f6d6d656e743b0a0a20202020696e74206f70436d702873697a655f7420692920636f6e73742070757265206e6f7468726f77204073616665207b0a202020202020202069662028696e646578203c2069292072657475726e202d313b0a202020202020202069662028696e646578203e2069292072657475726e20313b0a202020202020202072657475726e20303b0a202020207d0a0a20202020696e74206f70436d702872656620636f6e737420747970656f66287468697329206f746865722920636f6e73742070757265206e6f7468726f77204073616665207b0a202020202020202072657475726e206f70436d70286f746865722e696e646578293b0a202020207d0aZQYobZCQZv9container6rbtree__T12RedBlackTreeTSQBGiQBGd4base7MessageVQBFza62_20612e6c696e65203c20622e6c696e65207c7c2028612e6c696e65203d3d20622e6c696e6520262620612e636f6c756d6e203c20622e636f6c756d6e2920Vbi1ZQGt+680
    _D8dscanner8analysis3run7analyzeFAAyaxSQBlQBf6config20StaticAnalysisConfigQBoKS6dparse5lexer11StringCacheKS7dsymbol11modulecache11ModuleCachebZb+337
    _Dmain+3618
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ6runAllMFZ9__lambda1MFZv+40
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ7tryExecMFMDFZvZv+32
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ6runAllMFZv+139
    _D2rt6dmain211_d_run_mainUiPPaPUAAaZiZ7tryExecMFMDFZvZv+32
    _d_run_main+463
    main+16
    __libc_start_main+235
    0x41fd89415541f689
]: 450
```

It looks like a lot of the small allocations are due to a red-black tree in `ModuleCache`.

### What’s next?

I think these examples already show that `bpftrace` is a pretty powerful tool. There’s a lot more that can done, and I highly recommended reading [Brendan Gregg’s eBPF tutorials][18].

I used uprobes to trace arbitrary functions in the D runtime. The pro of this is the freedom to do anything, but the cons are that I had to refer to the D runtime source code and manually deal with the D ABI. There’s also no guarantee that a script I write today will work with future versions of the runtime. Linux also supports making well-defined tracepoints in user code using a feature called [USDT][19]. That should let D code export stable tracepoints that can be used without worrying about the D ABI. I might do more experiments in future.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/04/26/bpftrace_d_gc.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://github.com/iovisor/bpftrace
[2]: https://en.wikipedia.org/wiki/Java_virtual_machine
[3]: http://dtrace.org/blogs/about/
[4]: https://github.com/iovisor/bpftrace/blob/master/INSTALL.md
[5]: https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md
[6]: https://github.com/iovisor/bpftrace/blob/master/docs/tutorial_one_liners.md
[7]: https://dlang.org/spec/abi.html#name_mangling
[8]: https://github.com/dlang-community/D-Scanner
[9]: https://github.com/dlang/druntime/
[10]: https://dlang.org/spec/garbage.html#gc_config
[11]: https://dlang.org/phobos/core_memory.html#.GC.stats
[12]: https://github.com/dlang/druntime/tree/v2.081.1/src/gc
[13]: https://github.com/dlang/druntime/tree/v2.081.1/src/gc/impl/conservative
[14]: https://github.com/dlang/tools
[15]: https://dlang.org/spec/abi.html#parameters
[16]: https://en.wikipedia.org/wiki/Copy_elision
[17]: https://github.com/iovisor/bpftrace/issues/246
[18]: http://www.brendangregg.com/blog/2019-01-01/learn-ebpf-tracing.html
[19]: https://lwn.net/Articles/753601/
