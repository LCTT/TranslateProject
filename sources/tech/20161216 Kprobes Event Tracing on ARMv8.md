# Kprobes Event Tracing on ARMv8

Timeszoro Translating

 ![core-dump](http://www.linaro.org/wp-content/uploads/2016/02/core-dump.png) 

### Introduction

Kprobes is a kernel feature that allows instrumenting the kernel by setting arbitrary breakpoints that call out to developer-supplied routines before and after the breakpointed instruction is executed (or simulated). See the kprobes documentation[[1]][2] for more information. Basic kprobes functionality is selected withCONFIG_KPROBES. Kprobes support was added to mainline for arm64 in the v4.8 release.

In this article we describe the use of kprobes on arm64 using the debugfs event tracing interfaces from the command line to collect dynamic trace events. This feature has been available for some time on several architectures (including arm32), and is now available on arm64\. The feature allows use of kprobes without having to write any code.

### Types of Probes

The kprobes subsystem provides three different types of dynamic probes described below.

### Kprobes

The basic probe is a software breakpoint kprobes inserts in place of the instruction you are probing, saving the original instruction for eventual single-stepping (or simulation) when the probe point is hit.

### Kretprobes

Kretprobes is a part of kprobes that allows intercepting a returning function instead of having to set a probe (or possibly several probes) at the return points. This feature is selected whenever kprobes is selected, for supported architectures (including ARMv8).

### Jprobes

Jprobes allows intercepting a call into a function by supplying an intermediary function with the same calling signature, which will be called first. Jprobes is a programming interface only and cannot be used through the debugfs event tracing subsystem. As such we will not be discussing jprobes further here. Consult the kprobes documentation if you wish to use jprobes.

### Invoking Kprobes

Kprobes provides a set of APIs which can be called from kernel code to set up probe points and register functions to be called when probe points are hit. Kprobes is also accessible without adding code to the kernel, by writing to specific event tracing debugfs files to set the probe address and information to be recorded in the trace log when the probe is hit. The latter is the focus of what this document will be talking about. Lastly kprobes can be accessed through the perf command.

### Kprobes API

The kernel developer can write functions in the kernel (often done in a dedicated debug module) to set probe points and take whatever action is desired right before and right after the probed instruction is executed. This is well documented in kprobes.txt.

### Event Tracing

The event tracing subsystem has its own documentation[[2]][3] which might be worth a read to understand the background of event tracing in general. The event tracing subsystem serves as a foundation for both tracepoints and kprobes event tracing. The event tracing documentation focuses on tracepoints, so bear that in mind when consulting that documentation. Kprobes differs from tracepoints in that there is no predefined list of tracepoints but instead arbitrary dynamically created probe points that trigger the collection of trace event information. The event tracing subsystem is controlled and monitored through a set of debugfs files. Event tracing (CONFIG_EVENT_TRACING) will be selected automatically when needed by something like the kprobe event tracing subsystem.

#### Kprobes Events

With the kprobes event tracing subsystem the user can specify information to be reported at arbitrary breakpoints in the kernel, determined simply by specifying the address of any existing probeable instruction along with formatting information. When that breakpoint is encountered during execution kprobes passes the requested information to the common parts of the event tracing subsystem which formats and appends the data to the trace log, much like how tracepoints works. Kprobes uses a similar but mostly separate collection of debugfs files to control and display trace event information. This feature is selected withCONFIG_KPROBE_EVENT. The kprobetrace documentation[[3]][4] provides the essential information on how to use kprobes event tracing and should be consulted to understand details about the examples presented below.

### Kprobes and Perf

The perf tools provide another command line interface to kprobes. In particular “perf probe” allows probe points to be specified by source file and line number, in addition to function name plus offset, and address. The perf interface is really a wrapper for using the debugfs interface for kprobes.

### Arm64 Kprobes

All of the above aspects of kprobes are now implemented for arm64, in practice there are some differences from other architectures though:

*   Register name arguments are, of course, architecture specific and can be found in the ARM ARM.

*   Not all instruction types can currently be probed. Currently unprobeable instructions include mrs/msr(except DAIF read), exception generation instructions, eret, and hint (except for the nop variant). In these cases it is simplest to just probe a nearby instruction instead. These instructions are blacklisted from probing because the changes they cause to processor state are unsafe to do during kprobe single-stepping or instruction simulation, because the single-stepping context kprobes constructs is inconsistent with what the instruction needs, or because the instruction can’t tolerate the additional processing time and exception handling in kprobes (ldx/stx).
*   An attempt is made to identify instructions within a ldx/stx sequence and prevent probing, however it is theoretically possible for this check to fail resulting in allowing a probed atomic sequence which can never succeed. Be careful when probing around atomic code sequences.
*   Note that because of the details of Linux ARM64 calling conventions it is not possible to reliably duplicate the stack frame for the probed function and for that reason no attempt is made to do so with jprobes, unlike the majority of other architectures supporting jprobes. The reason for this is that there is insufficient information for the callee to know for certain the amount of the stack that is needed.

*   Note that the stack pointer information recorded from a probe will reflect the particular stack pointer in use at the time the probe was hit, be it the kernel stack pointer or the interrupt stack pointer.
*   There is a list of kernel functions which cannot be probed, usually because they are called as part of kprobes processing. Part of this list is architecture-specific and also includes things like exception entry code.

### Using Kprobes Event Tracing

One common use case for kprobes is instrumenting function entry and/or exit. It is particularly easy to install probes for this since one can just use the function name for the probe address. Kprobes event tracing will look up the symbol name and determine the address. The ARMv8 calling standard defines where the function arguments and return values can be found, and these can be printed out as part of the kprobe event processing.

### Example: Function entry probing

Instrumenting a USB ethernet driver reset function:

```
_$ pwd
/sys/kernel/debug/tracing
$ cat > kprobe_events <<EOF
p ax88772_reset %x0
EOF
$ echo 1 > events/kprobes/enable_
```

At this point a trace event will be recorded every time the driver’s _ax8872_reset()_ function is called. The event will display the pointer to the _usbnet_ structure passed in via X0 (as per the ARMv8 calling standard) as this function’s only argument. After plugging in a USB dongle requiring this ethernet driver we see the following trace information:

```
_$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 1/1   #P:8
#
#                           _—–=> irqs-off
#                          / _—-=> need-resched
#                         | / _—=> hardirq/softirq
#                         || / _–=> preempt-depth
#                         ||| / delay
#        TASK-PID   CPU#  |||| TIMESTAMP  FUNCTION
#           | |    |   ||||    |      |
kworker/0:0-4             [000] d… 10972.102939:   p_ax88772_reset_0:
(ax88772_reset+0x0/0x230)   arg1=0xffff800064824c80_
```

Here we can see the value of the pointer argument passed in to our probed function. Since we did not use the optional labelling features of kprobes event tracing the information we requested is automatically labeled_arg1_.  Note that this refers to the first value in the list of values we requested that kprobes log for this probe, not the actual position of the argument to the function. In this case it also just happens to be the first argument to the function we’ve probed.

### Example: Function entry and return probing

The kretprobe feature is used specifically to probe a function return. At function entry the kprobes subsystem will be called and will set up a hook to be called at function return, where it will record the requested event information. For the most common case the return information, typically in the X0 register, is quite useful. The return value in %x0 can also be referred to as _$retval_. The following example also demonstrates how to provide a human-readable label to be displayed with the information of interest.

Example of instrumenting the kernel __do_fork()_ function to record arguments and results using a kprobe and a kretprobe:

```
_$ cd /sys/kernel/debug/tracing
$ cat > kprobe_events <<EOF
p _do_fork %x0 %x1 %x2 %x3 %x4 %x5
r _do_fork pid=%x0
EOF
$ echo 1 > events/kprobes/enable_
```

At this point every call to _do_fork() will produce two kprobe events recorded into the “_trace_” file, one reporting the calling argument values and one reporting the return value. The return value shall be labeled “_pid_” in the trace file. Here are the contents of the trace file after three fork syscalls have been made:

```
_$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 6/6   #P:8
#
#                              _—–=> irqs-off
#                             / _—-=> need-resched
#                            | / _—=> hardirq/softirq
#                            || / _–=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
              bash-1671  [001] d…   204.946007: p__do_fork_0: (_do_fork+0x0/0x3e4) arg1=0x1200011 arg2=0x0 arg3=0x0 arg4=0x0 arg5=0xffff78b690d0 arg6=0x0
              bash-1671  [001] d..1   204.946391: r__do_fork_0: (SyS_clone+0x18/0x20 <- _do_fork) pid=0x724
              bash-1671  [001] d…   208.845749: p__do_fork_0: (_do_fork+0x0/0x3e4) arg1=0x1200011 arg2=0x0 arg3=0x0 arg4=0x0 arg5=0xffff78b690d0 arg6=0x0
              bash-1671  [001] d..1   208.846127: r__do_fork_0: (SyS_clone+0x18/0x20 <- _do_fork) pid=0x725
              bash-1671  [001] d…   214.401604: p__do_fork_0: (_do_fork+0x0/0x3e4) arg1=0x1200011 arg2=0x0 arg3=0x0 arg4=0x0 arg5=0xffff78b690d0 arg6=0x0
              bash-1671  [001] d..1   214.401975: r__do_fork_0: (SyS_clone+0x18/0x20 <- _do_fork) pid=0x726_
```

### Example: Dereferencing pointer arguments

For pointer values the kprobe event processing subsystem also allows dereferencing and printing of desired memory contents, for various base data types. It is necessary to manually calculate the offset into structures in order to display a desired field.

Instrumenting the `_do_wait()` function:

```
_$ cat > kprobe_events <<EOF
p:wait_p do_wait wo_type=+0(%x0):u32 wo_flags=+4(%x0):u32
r:wait_r do_wait $retval
EOF
$ echo 1 > events/kprobes/enable_
```

Note that the argument labels used in the first probe are optional and can be used to more clearly identify the information recorded in the trace log. The signed offset and parentheses indicate that the register argument is a pointer to memory contents to be recorded in the trace log. The “_:u32_” indicates that the memory location contains an unsigned four-byte wide datum (an enum and an int in a locally defined structure in this case).

The probe labels (after the colon) are optional and will be used to identify the probe in the log. The label must be unique for each probe. If unspecified a useful label will be automatically generated from a nearby symbol name, as has been shown in earlier examples.

Also note the “_$retval_” argument could just be specified as “_%x0_“.

Here are the contents of the “_trace_” file after two fork syscalls have been made:

```
_$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 4/4   #P:8
#
#                              _—–=> irqs-off
#                             / _—-=> need-resched
#                            | / _—=> hardirq/softirq
#                            || / _–=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
             bash-1702  [001] d…   175.342074: wait_p: (do_wait+0x0/0x260) wo_type=0x3 wo_flags=0xe
             bash-1702  [002] d..1   175.347236: wait_r: (SyS_wait4+0x74/0xe4 <- do_wait) arg1=0x757
             bash-1702  [002] d…   175.347337: wait_p: (do_wait+0x0/0x260) wo_type=0x3 wo_flags=0xf
             bash-1702  [002] d..1   175.347349: wait_r: (SyS_wait4+0x74/0xe4 <- do_wait) arg1=0xfffffffffffffff6_
```

### Example: Probing arbitrary instruction addresses

In previous examples we have inserted probes for function entry and exit, however it is possible to probe an arbitrary instruction (with a few exceptions). If we are placing a probe inside a C function the first step is to look at the assembler version of the code to identify where we want to place the probe. One way to do this is to use gdb on the vmlinux file and display the instructions in the function where you wish to place the probe. An example of doing this for the _module_alloc_ function in arch/arm64/kernel/modules.c follows. In this case, because gdb seems to prefer using the weak symbol definition and it’s associated stub code for this function, we get the symbol value from System.map instead:

```
_$ grep module_alloc System.map
ffff2000080951c4 T module_alloc
ffff200008297770 T kasan_module_alloc_
```

In this example we’re using cross-development tools and we invoke gdb on our host system to examine the instructions comprising our function of interest:

```
_$ ${CROSS_COMPILE}gdb vmlinux
(gdb) x/30i 0xffff2000080951c4
        0xffff2000080951c4 <module_alloc>:    sub    sp, sp, #0x30
        0xffff2000080951c8 <module_alloc+4>:    adrp    x3, 0xffff200008d70000
        0xffff2000080951cc <module_alloc+8>:    add    x3, x3, #0x0
        0xffff2000080951d0 <module_alloc+12>:    mov    x5, #0x713             // #1811
        0xffff2000080951d4 <module_alloc+16>:    mov    w4, #0xc0              // #192
        0xffff2000080951d8 <module_alloc+20>:
              mov    x2, #0xfffffffff8000000    // #-134217728
        0xffff2000080951dc <module_alloc+24>:    stp    x29, x30, [sp,#16]         0xffff2000080951e0 <module_alloc+28>:    add    x29, sp, #0x10
        0xffff2000080951e4 <module_alloc+32>:    movk    x5, #0xc8, lsl #48
        0xffff2000080951e8 <module_alloc+36>:    movk    w4, #0x240, lsl #16
        0xffff2000080951ec <module_alloc+40>:    str    x30, [sp]         0xffff2000080951f0 <module_alloc+44>:    mov    w7, #0xffffffff        // #-1
        0xffff2000080951f4 <module_alloc+48>:    mov    x6, #0x0               // #0
        0xffff2000080951f8 <module_alloc+52>:    add    x2, x3, x2
        0xffff2000080951fc <module_alloc+56>:    mov    x1, #0x8000            // #32768
        0xffff200008095200 <module_alloc+60>:    stp    x19, x20, [sp,#32]         0xffff200008095204 <module_alloc+64>:    mov    x20, x0
        0xffff200008095208 <module_alloc+68>:    bl    0xffff2000082737a8 <__vmalloc_node_range>
        0xffff20000809520c <module_alloc+72>:    mov    x19, x0
        0xffff200008095210 <module_alloc+76>:    cbz    x0, 0xffff200008095234 <module_alloc+112>
        0xffff200008095214 <module_alloc+80>:    mov    x1, x20
        0xffff200008095218 <module_alloc+84>:    bl    0xffff200008297770 <kasan_module_alloc>
        0xffff20000809521c <module_alloc+88>:    tbnz    w0, #31, 0xffff20000809524c <module_alloc+136>
        0xffff200008095220 <module_alloc+92>:    mov    sp, x29
        0xffff200008095224 <module_alloc+96>:    mov    x0, x19
        0xffff200008095228 <module_alloc+100>:    ldp    x19, x20, [sp,#16]         0xffff20000809522c <module_alloc+104>:    ldp    x29, x30, [sp],#32
        0xffff200008095230 <module_alloc+108>:    ret
        0xffff200008095234 <module_alloc+112>:    mov    sp, x29
        0xffff200008095238 <module_alloc+116>:    mov    x19, #0x0               // #0_
```

In this case we are going to display the result from the following source line in this function:

```
_p = __vmalloc_node_range(size, MODULE_ALIGN, VMALLOC_START,
VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_EXEC, 0,
NUMA_NO_NODE, __builtin_return_address(0));_
```

…and also the return value from the function call in this line:

```
_if (p && (kasan_module_alloc(p, size) < 0)) {_
```

We can identify these in the assembler code from the call to the external functions. To display these values we will place probes at 0xffff20000809520c _and _0xffff20000809521c on our target system:

```
_$ cat > kprobe_events <<EOF
p 0xffff20000809520c %x0
p 0xffff20000809521c %x0
EOF
$ echo 1 > events/kprobes/enable_
```

Now after plugging an ethernet adapter dongle into the USB port we see the following written into the trace log:

```
_$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 12/12   #P:8
#
#                           _—–=> irqs-off
#                          / _—-=> need-resched
#                         | / _—=> hardirq/softirq
#                         || / _–=> preempt-depth
#                         ||| / delay
#        TASK-PID   CPU#  |||| TIMESTAMP  FUNCTION
#           | |    |   ||||    |      |
      systemd-udevd-2082  [000] d… 77.200991: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff200001188000
      systemd-udevd-2082  [000] d… 77.201059: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      systemd-udevd-2082  [000] d… 77.201115: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff200001198000
      systemd-udevd-2082  [000] d… 77.201157: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      systemd-udevd-2082  [000] d… 77.227456: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff2000011a0000
      systemd-udevd-2082  [000] d… 77.227522: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      systemd-udevd-2082  [000] d… 77.227579: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff2000011b0000
      systemd-udevd-2082  [000] d… 77.227635: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      modprobe-2097  [002] d… 78.030643: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff2000011b8000
      modprobe-2097  [002] d… 78.030761: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      modprobe-2097  [002] d… 78.031132: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff200001270000
      modprobe-2097  [002] d… 78.031187: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0_
```

One more feature of the kprobes event system is recording of statistics information, which can be found inkprobe_profile.  After the above trace the contents of that file are:

```
_$ cat kprobe_profile
 p_0xffff20000809520c                                    6            0
p_0xffff20000809521c                                    6            0_
```

This indicates that there have been a total of 8 hits each of the two breakpoints we set, which of course is consistent with the trace log data.  More kprobe_profile features are described in the kprobetrace documentation.

There is also the ability to further filter kprobes events.  The debugfs files used to control this are listed in the kprobetrace documentation while the details of their contents are (mostly) described in the trace events documentation.

### Conclusion

Linux on ARMv8 now is on parity with other architectures supporting the kprobes feature. Work is being done by others to also add uprobes and systemtap support. These features/tools and other already completed features (e.g.: perf, coresight) allow the Linux ARMv8 user to debug and test performance as they would on other, older architectures.

* * *

Bibliography

[[1]][5] Jim Keniston, Prasanna S. Panchamukhi, Masami Hiramatsu. “Kernel Probes (Kprobes).” _GitHub_. GitHub, Inc., 15 Aug. 2016\. Web. 13 Dec. 2016.

[[2]][6] Ts’o, Theodore, Li Zefan, and Tom Zanussi. “Event Tracing.” _GitHub_. GitHub, Inc., 3 Mar. 2016\. Web. 13 Dec. 2016.

[[3]][7] Hiramatsu, Masami. “Kprobe-based Event Tracing.” _GitHub_. GitHub, Inc., 18 Aug. 2016\. Web. 13 Dec. 2016.


----------------

作者简介 ： [David Long][8]David works as an engineer in the Linaro Kernel - Core Development team. Before coming to Linaro he spent several years in the commercial and defense industries doing both embedded realtime work, and software development tools for Unix. That was followed by a dozen years at Digital (aka Compaq) doing Unix standards, C compiler, and runtime library work. After that David went to a series of startups doing embedded Linux and Android, embedded custom OS's, and Xen virtualization. He has experience with MIPS, Alpha, and ARM platforms (amongst others). He has used most flavors of Unix starting in 1979 with Bell Labs V6, and has been a long-time Linux user and advocate. He has also occasionally been known to debug a device driver with a soldering iron and digital oscilloscope.

--------------------------------------------------------------------------------

via: http://www.linaro.org/blog/kprobes-event-tracing-armv8/

作者：[ David Long][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linaro.org/author/david-long/
[1]:http://www.linaro.org/blog/kprobes-event-tracing-armv8/#
[2]:https://github.com/torvalds/linux/blob/master/Documentation/kprobes.txt
[3]:https://github.com/torvalds/linux/blob/master/Documentation/trace/events.txt
[4]:https://github.com/torvalds/linux/blob/master/Documentation/trace/kprobetrace.txt
[5]:https://github.com/torvalds/linux/blob/master/Documentation/kprobes.txt
[6]:https://github.com/torvalds/linux/blob/master/Documentation/trace/events.txt
[7]:https://github.com/torvalds/linux/blob/master/Documentation/trace/kprobetrace.txt
[8]:http://www.linaro.org/author/david-long/
[9]:http://www.linaro.org/blog/kprobes-event-tracing-armv8/#comments
[10]:http://www.linaro.org/blog/kprobes-event-tracing-armv8/#
[11]:http://www.linaro.org/tag/arm64/
[12]:http://www.linaro.org/tag/armv8/
[13]:http://www.linaro.org/tag/jprobes/
[14]:http://www.linaro.org/tag/kernel/
[15]:http://www.linaro.org/tag/kprobes/
[16]:http://www.linaro.org/tag/kretprobes/
[17]:http://www.linaro.org/tag/perf/
[18]:http://www.linaro.org/tag/tracing/
