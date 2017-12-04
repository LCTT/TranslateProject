ARMv8 上的 kprobes 事件跟踪 
==============

![core-dump](http://www.linaro.org/wp-content/uploads/2016/02/core-dump.png) 

### 介绍

kprobes 是一种内核功能，它允许通过在执行（或模拟）断点指令之前和之后，设置调用开发者提供例程的任意断点来检测内核。可参见 kprobes 文档^注1 获取更多信息。基本的 kprobes 功能可使用 `CONFIG_KPROBEES` 来选择。在 arm64 的 v4.8 内核发行版中， kprobes 支持被添加到主线。

在这篇文章中，我们将介绍 kprobes 在 arm64 上的使用，通过在命令行中使用 debugfs 事件追踪接口来收集动态追踪事件。这个功能在一些架构（包括 arm32）上可用已经有段时间，现在在 arm64 上也能使用了。这个功能可以无需编写任何代码就能使用 kprobes。 

### 探针类型

kprobes 子系统提供了三种不同类型的动态探针，如下所述。

#### kprobes

基本探针是 kprobes 插入的一个软件断点，用以替代你正在探测的指令，当探测点被命中时，它为最终的单步执行（或模拟）保存下原始指令。

#### kretprobes

kretprobes 是 kprobes 的一部分，它允许拦截返回函数，而不必在返回点设置一个探针（或者可能有多个探针）。对于支持的架构（包括 ARMv8），只要选择 kprobes，就可以选择此功能。

#### jprobes

jprobes 允许通过提供一个具有相同<ruby>调用签名<rt>call signature</rt></ruby>的中间函数来拦截对一个函数的调用，这里中间函数将被首先调用。jprobes 只是一个编程接口，它不能通过 debugfs 事件追踪子系统来使用。因此，我们将不会在这里进一步讨论 jprobes。如果你想使用 jprobes，请参考 kprobes 文档。

### 调用 kprobes

kprobes 提供一系列能从内核代码中调用的 API 来设置探测点和当探测点被命中时调用的注册函数。在不往内核中添加代码的情况下，kprobes 也是可用的，这是通过写入特定事件追踪的 debugfs 文件来实现的，需要在文件中设置探针地址和信息，以便在探针被命中时记录到追踪日志中。后者是本文将要讨论的重点。最后 kprobes 可以通过 perl 命令来使用。

#### kprobes API

内核开发人员可以在内核中编写函数(通常在专用的调试模块中完成）来设置探测点，并且在探测指令执行前和执行后立即执行任何所需操作。这在 kprobes.txt 中有很好的解释。

#### 事件追踪

事件追踪子系统有自己的自己的文档^注2 ，对于了解一般追踪事件的背景可能值得一读。事件追踪子系统是<ruby>追踪点<rt>tracepoints</rt></ruby>和 kprobes 事件追踪的基础。事件追踪文档重点关注追踪点，所以请在查阅文档时记住这一点。kprobes 与追踪点不同的是没有预定义的追踪点列表，而是采用动态创建的用于触发追踪事件信息收集的任意探测点。事件追踪子系统通过一系列 debugfs 文件来控制和监视。事件追踪（`CONFIG_EVENT_TRACING`）将在被如 kprobe 事件追踪子系统等需要时自动选择。

##### kprobes 事件

使用 kprobes 事件追踪子系统，用户可以在内核任意断点处指定要报告的信息，只需要指定任意现有可探测指令的地址以及格式化信息即可确定。在执行过程中遇到断点时，kprobes 将所请求的信息传递给事件追踪子系统的公共部分，这些部分将数据格式化并追加到追踪日志中，就像追踪点的工作方式一样。kprobes 使用一个类似的但是大部分是独立的 debugfs 文件来控制和显示追踪事件信息。该功能可使用 `CONFIG_KPROBE_EVENT` 来选择。Kprobetrace 文档^ 注3 提供了如何使用 kprobes 事件追踪的基本信息，并且应当被参考用以了解以下介绍示例的详细信息。 

#### kprobes 和 perf

perf 工具为 kprobes 提供了另一个命令行接口。特别地，`perf probe` 允许探测点除了由函数名加偏移量和地址指定外，还可由源文件和行号指定。perf 接口实际上是使用 kprobes 的 debugfs 接口的封装器。

### Arm64 kprobes

上述所有 kprobes 的方面现在都在 arm64 上得到实现，然而实际上与其它架构上的有一些不同：

*   注册名称参数当然是依架构而特定的，并且可以在 ARM ARM 中找到。
*   目前不是所有的指令类型都可被探测。当前不可探测的指令包括 mrs/msr（除了 DAIF 读取）、异常生成指令、eret 和 hint（除了 nop 变体）。在这些情况下，只探测一个附近的指令来代替是最简单的。这些指令在探测的黑名单里是因为在 kprobes 单步执行或者指令模拟时它们对处理器状态造成的改变是不安全的，这是由于 kprobes 构造的单步执行上下文和指令所需要的不一致，或者是由于指令不能容忍在 kprobes 中额外的处理时间和异常处理（ldx/stx）。
*   试图识别在 ldx/stx 序列中的指令并且防止探测，但是理论上这种检查可能会失败，导致允许探测到的原子序列永远不会成功。当探测原子代码序列附近时应该小心。
*   注意由于 linux ARM64 调用约定的具体信息，为探测函数可靠地复制栈帧是不可能的，基于此不要试图用 jprobes 这样做，这一点与支持 jprobes 的大多数其它架构不同。这样的原因是被调用者没有足够的信息来确定需要的栈数量。
*   注意当探针被命中时，一个探针记录的栈指针信息将反映出使用中的特定栈指针，它是内核栈指针或者中断栈指针。
*   有一组内核函数是不能被探测的，通常因为它们作为 kprobes 处理的一部分被调用。这组函数的一部分是依架构特定的，并且也包含如异常入口代码等。

### 使用 kprobes 事件追踪

kprobes 的一个常用例子是检测函数入口和/或出口。因为只需要使用函数名来作为探针地址，它安装探针特别简单。kprobes 事件追踪将查看符号名称并且确定地址。ARMv8 调用标准定义了函数参数和返回值的位置，并且这些可以作为 kprobes 事件处理的一部分被打印出来。

#### 例子: 函数入口探测

检测 USB 以太网驱动程序复位功能：

```
$ pwd
/sys/kernel/debug/tracing
$ cat > kprobe_events <<EOF
p ax88772_reset %x0
EOF
$ echo 1 > events/kprobes/enable
```

此时每次该驱动的 `ax8872_reset()` 函数被调用，追踪事件都将会被记录。这个事件将显示指向通过作为此函数的唯一参数的 `X0`（按照 ARMv8 调用标准）传入的 `usbnet` 结构的指针。插入需要以太网驱动程序的 USB 加密狗后，我们看见以下追踪信息：

```
$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 1/1   #P:8
#
#                           _—–=> irqs-off
#                          / _—-=> need-resched
#                         | / _—=> hardirq/softirq
#                         || / _–=> preempt-depth
#                         ||| / delay
#        TASK-PID   CPU#  |||| TIMESTAMP  FUNCTION
#           | |    |   ||||    |      |
kworker/0:0-4             [000] d… 10972.102939:   p_ax88772_reset_0:
(ax88772_reset+0x0/0x230)   arg1=0xffff800064824c80
```

这里我们可以看见传入到我们的探测函数的指针参数的值。由于我们没有使用 kprobes 事件追踪的可选标签功能，我们需要的信息自动被标注为 `arg1`。注意这指向我们需要 kprobes 记录这个探针的一组值的第一个，而不是函数参数的实际位置。在这个例子中它也只是碰巧是我们探测函数的第一个参数。 

#### 例子: 函数入口和返回探测

kretprobe 功能专门用于探测函数返回。在函数入口 kprobes 子系统将会被调用并且建立钩子以便在函数返回时调用，钩子将记录需求事件信息。对最常见情况，返回信息通常在 `X0` 寄存器中，这是非常有用的。在 `%x0` 中返回值也可以被称为 `$retval`。以下例子也演示了如何提供一个可读的标签来展示有趣的信息。 

使用 kprobes 和 kretprobe 检测内核 `do_fork()` 函数来记录参数和结果的例子：

```
$ cd /sys/kernel/debug/tracing
$ cat > kprobe_events <<EOF
p _do_fork %x0 %x1 %x2 %x3 %x4 %x5
r _do_fork pid=%x0
EOF
$ echo 1 > events/kprobes/enable
```

此时每次对 `_do_fork()` 的调用都会产生两个记录到 trace 文件的 kprobe 事件，一个报告调用参数值，另一个报告返回值。返回值在 trace 文件中将被标记为 `pid`。这里是三次 fork 系统调用执行后的 trace 文件的内容： 

```
_$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 6/6   #P:8
#
#                              _—–=> irqs-off
#                             / _—-=> need-resched
#                            | / _—=> hardirq/softirq
#                            || / _–=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
              bash-1671  [001] d…   204.946007: p__do_fork_0: (_do_fork+0x0/0x3e4) arg1=0x1200011 arg2=0x0 arg3=0x0 arg4=0x0 arg5=0xffff78b690d0 arg6=0x0
              bash-1671  [001] d..1   204.946391: r__do_fork_0: (SyS_clone+0x18/0x20 <- _do_fork) pid=0x724
              bash-1671  [001] d…   208.845749: p__do_fork_0: (_do_fork+0x0/0x3e4) arg1=0x1200011 arg2=0x0 arg3=0x0 arg4=0x0 arg5=0xffff78b690d0 arg6=0x0
              bash-1671  [001] d..1   208.846127: r__do_fork_0: (SyS_clone+0x18/0x20 <- _do_fork) pid=0x725
              bash-1671  [001] d…   214.401604: p__do_fork_0: (_do_fork+0x0/0x3e4) arg1=0x1200011 arg2=0x0 arg3=0x0 arg4=0x0 arg5=0xffff78b690d0 arg6=0x0
              bash-1671  [001] d..1   214.401975: r__do_fork_0: (SyS_clone+0x18/0x20 <- _do_fork) pid=0x726_
```

#### 例子： 解引用指针参数

对于指针值，kprobes 事件处理子系统也允许解引用和打印所需的内存内容，适用于各种基本数据类型。为了展示所需字段，手动计算结构的偏移量是必要的。

检测 `_do_wait()` 函数：

```
$ cat > kprobe_events <<EOF
p:wait_p do_wait wo_type=+0(%x0):u32 wo_flags=+4(%x0):u32
r:wait_r do_wait $retval
EOF
$ echo 1 > events/kprobes/enable
```

注意在第一个探针中使用的参数标签是可选的，并且可用于更清晰地识别记录在追踪日志中的信息。带符号的偏移量和括号表明了寄存器参数是指向记录在追踪日志中的内存内容的指针。`:u32` 表明了内存位置包含一个无符号的 4 字节宽的数据（在这个例子中指局部定义的结构中的一个 emum 和一个 int）。

探针标签（冒号后）是可选的，并且将用来识别日志中的探针。对每个探针来说标签必须是独一无二的。如果没有指定，将从附近的符号名称自动生成一个有用的标签，如前面的例子所示。

也要注意 `$retval` 参数可以只是指定为 `%x0`。

这里是两次 fork 系统调用执行后的 trace 文件的内容：

```
$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 4/4   #P:8
#
#                              _—–=> irqs-off
#                             / _—-=> need-resched
#                            | / _—=> hardirq/softirq
#                            || / _–=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
             bash-1702  [001] d…   175.342074: wait_p: (do_wait+0x0/0x260) wo_type=0x3 wo_flags=0xe
             bash-1702  [002] d..1   175.347236: wait_r: (SyS_wait4+0x74/0xe4 <- do_wait) arg1=0x757
             bash-1702  [002] d…   175.347337: wait_p: (do_wait+0x0/0x260) wo_type=0x3 wo_flags=0xf
             bash-1702  [002] d..1   175.347349: wait_r: (SyS_wait4+0x74/0xe4 <- do_wait) arg1=0xfffffffffffffff6
```

#### 例子: 探测任意指令地址

在前面的例子中，我们已经为函数的入口和出口插入探针，然而探测一个任意指令（除少数例外）是可能的。如果我们正在 C 函数中放置一个探针，第一步是查看代码的汇编版本以确定我们要放置探针的位置。一种方法是在 vmlinux 文件上使用 gdb,并在要放置探针的函数中展示指令。下面是一个在 `arch/arm64/kernel/modules.c` 中 `module_alloc` 函数执行此操作的示例。在这种情况下，因为 gdb 似乎更喜欢使用弱符号定义，并且它是与这个函数关联的存根代码，所以我们从 System.map 中来获取符号值： 

```
$ grep module_alloc System.map
ffff2000080951c4 T module_alloc
ffff200008297770 T kasan_module_alloc
```

在这个例子中我们使用了交叉开发工具，并且在我们的主机系统上调用 gdb 来检查指令包含我们感兴趣函数。 

```
$ ${CROSS_COMPILE}gdb vmlinux
(gdb) x/30i 0xffff2000080951c4
        0xffff2000080951c4 <module_alloc>:    sub    sp, sp, #0x30
        0xffff2000080951c8 <module_alloc+4>:    adrp    x3, 0xffff200008d70000
        0xffff2000080951cc <module_alloc+8>:    add    x3, x3, #0x0
        0xffff2000080951d0 <module_alloc+12>:    mov    x5, #0x713             // #1811
        0xffff2000080951d4 <module_alloc+16>:    mov    w4, #0xc0              // #192
        0xffff2000080951d8 <module_alloc+20>:
              mov    x2, #0xfffffffff8000000    // #-134217728
        0xffff2000080951dc <module_alloc+24>:    stp    x29, x30, [sp,#16]         0xffff2000080951e0 <module_alloc+28>:    add    x29, sp, #0x10
        0xffff2000080951e4 <module_alloc+32>:    movk    x5, #0xc8, lsl #48
        0xffff2000080951e8 <module_alloc+36>:    movk    w4, #0x240, lsl #16
        0xffff2000080951ec <module_alloc+40>:    str    x30, [sp]         0xffff2000080951f0 <module_alloc+44>:    mov    w7, #0xffffffff        // #-1
        0xffff2000080951f4 <module_alloc+48>:    mov    x6, #0x0               // #0
        0xffff2000080951f8 <module_alloc+52>:    add    x2, x3, x2
        0xffff2000080951fc <module_alloc+56>:    mov    x1, #0x8000            // #32768
        0xffff200008095200 <module_alloc+60>:    stp    x19, x20, [sp,#32]         0xffff200008095204 <module_alloc+64>:    mov    x20, x0
        0xffff200008095208 <module_alloc+68>:    bl    0xffff2000082737a8 <__vmalloc_node_range>
        0xffff20000809520c <module_alloc+72>:    mov    x19, x0
        0xffff200008095210 <module_alloc+76>:    cbz    x0, 0xffff200008095234 <module_alloc+112>
        0xffff200008095214 <module_alloc+80>:    mov    x1, x20
        0xffff200008095218 <module_alloc+84>:    bl    0xffff200008297770 <kasan_module_alloc>
        0xffff20000809521c <module_alloc+88>:    tbnz    w0, #31, 0xffff20000809524c <module_alloc+136>
        0xffff200008095220 <module_alloc+92>:    mov    sp, x29
        0xffff200008095224 <module_alloc+96>:    mov    x0, x19
        0xffff200008095228 <module_alloc+100>:    ldp    x19, x20, [sp,#16]         0xffff20000809522c <module_alloc+104>:    ldp    x29, x30, [sp],#32
        0xffff200008095230 <module_alloc+108>:    ret
        0xffff200008095234 <module_alloc+112>:    mov    sp, x29
        0xffff200008095238 <module_alloc+116>:    mov    x19, #0x0               // #0
```

在这种情况下，我们将在此函数中显示以下源代码行的结果：

```
p = __vmalloc_node_range(size, MODULE_ALIGN, VMALLOC_START,
VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_EXEC, 0,
NUMA_NO_NODE, __builtin_return_address(0));
```

……以及在此代码行的函数调用的返回值：

```
if (p && (kasan_module_alloc(p, size) < 0)) {
```

我们可以在从调用外部函数的汇编代码中识别这些。为了展示这些值，我们将在目标系统上的 `0xffff20000809520c` 和 `0xffff20000809521c` 处放置探针。

```
$ cat > kprobe_events <<EOF
p 0xffff20000809520c %x0
p 0xffff20000809521c %x0
EOF
$ echo 1 > events/kprobes/enable
```

现在将一个以太网适配器加密狗插入到 USB 端口后，我们看到以下写入追踪日志的内容：

```
$ cat trace
# tracer: nop
#
# entries-in-buffer/entries-written: 12/12   #P:8
#
#                           _—–=> irqs-off
#                          / _—-=> need-resched
#                         | / _—=> hardirq/softirq
#                         || / _–=> preempt-depth
#                         ||| / delay
#        TASK-PID   CPU#  |||| TIMESTAMP  FUNCTION
#           | |    |   ||||    |      |
      systemd-udevd-2082  [000] d… 77.200991: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff200001188000
      systemd-udevd-2082  [000] d… 77.201059: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      systemd-udevd-2082  [000] d… 77.201115: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff200001198000
      systemd-udevd-2082  [000] d… 77.201157: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      systemd-udevd-2082  [000] d… 77.227456: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff2000011a0000
      systemd-udevd-2082  [000] d… 77.227522: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      systemd-udevd-2082  [000] d… 77.227579: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff2000011b0000
      systemd-udevd-2082  [000] d… 77.227635: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      modprobe-2097  [002] d… 78.030643: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff2000011b8000
      modprobe-2097  [002] d… 78.030761: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
      modprobe-2097  [002] d… 78.031132: p_0xffff20000809520c: (module_alloc+0x48/0x98) arg1=0xffff200001270000
      modprobe-2097  [002] d… 78.031187: p_0xffff20000809521c: (module_alloc+0x58/0x98) arg1=0x0
```

kprobes 事件系统的另一个功能是记录统计信息，这可在 `inkprobe_profile` 中找到。在以上追踪后，该文件的内容为：

```
$ cat kprobe_profile
 p_0xffff20000809520c                                    6            0
p_0xffff20000809521c                                    6            0
```

这表明我们设置的两处断点每个共发生了 8 次命中，这当然与追踪日志数据是一致的。在 kprobetrace 文档中有更多 kprobe_profile 的功能描述。

也可以进一步过滤 kprobes 事件。用来控制这点的 debugfs 文件在 kprobetrace 文档中被列出，然而它们内容的详细信息大多在 trace events 文档中被描述。

### 总结

现在，Linux ARMv8 对支持 kprobes 功能也和其它架构相当。有人正在做添加 uprobes 和 systemtap 支持的工作。这些功能/工具和其他已经完成的功能（如： perf、 coresight）允许 Linux ARMv8 用户像在其它更老的架构上一样调试和测试性能。 

* * *

参考文献

- 注1： Jim Keniston, Prasanna S. Panchamukhi, Masami Hiramatsu. “Kernel Probes (kprobes).” _GitHub_. GitHub, Inc., 15 Aug. 2016\. Web. 13 Dec. 2016.
- 注2： Ts’o, Theodore, Li Zefan, and Tom Zanussi. “Event Tracing.” _GitHub_. GitHub, Inc., 3 Mar. 2016\. Web. 13 Dec. 2016.
- 注3： Hiramatsu, Masami. “Kprobe-based Event Tracing.” _GitHub_. GitHub, Inc., 18 Aug. 2016\. Web. 13 Dec. 2016.


----------------

作者简介 ： [David Long][8] 在 Linaro Kernel - Core Development 团队中担任工程师。 在加入 Linaro 之前，他在商业和国防行业工作了数年，既做嵌入式实时工作又为Unix提供软件开发工具。之后，在 Digital（又名 Compaq）公司工作了十几年，负责 Unix 标准，C 编译器和运行时库的工作。之后 David 又去了一系列初创公司做嵌入式 Linux 和安卓系统，嵌入式定制操作系统和 Xen 虚拟化。他拥有 MIPS，Alpha 和 ARM 平台的经验（等等）。他使用过从 1979 年贝尔实验室 V6 开始的大部分Unix操作系统，并且长期以来一直是 Linux 用户和倡导者。他偶尔也因使用烙铁和数字示波器调试设备驱动而知名。

--------------------------------------------------------------------------------

via: http://www.linaro.org/blog/kprobes-event-tracing-armv8/

作者：[David Long][a]
译者：[kimii](https://github.com/kimii)
校对：[wxy](https://github.com/wxy)

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

