[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13069-1.html)
[#]: subject: (Understanding 52-bit virtual address support in the Arm64 kernel)
[#]: via: (https://opensource.com/article/20/12/52-bit-arm64-kernel)
[#]: author: (Bhupesh Sharma https://opensource.com/users/bhsharma)

理解 ARM64 内核中对 52 位虚拟地址的支持
======

> 随着 64 位硬件的引入，增加了处理更大地址空间的需求。

![](https://img.linux.net.cn/data/attachment/album/202101/30/170448rynbm9b6nmb90403.jpg)

当 64 位硬件变得可用之后，处理更大地址空间（大于 2^32 字节）的需求变得显而易见。现如今一些公司已经提供 64TiB 或更大内存的服务器，x86_64 架构和 arm64 架构现在允许寻址的地址空间大于 2^48 字节（可以使用默认的 48 位地址支持）。

x86_64 架构通过让硬件和软件启用五级页表以支持这些用例。它允许寻址的地址空间等于 2^57 字节（详情见 [x86：在 4.12 内核中启用 5 级页表][2]）。它突破了过去虚拟地址空间 128PiB 和物理地址空间 4PiB 的上限。

arm64 架构通过引入两个新的体系结构 —— ARMv8.2 LVA（更大的虚拟寻址） 和 ARMv8.2 LPA（更大的物理地址寻址） —— 拓展来实现相同的功能。这允许使用 4PiB 的虚拟地址空间和 4PiB 的物理地址空间（即分别为 2^52 位）。

随着新的 arm64 CPU 中支持了 ARMv8.2 体系结构拓展，同时现在开源软件也支持了这两种新的硬件拓展。

从 Linux 5.4 内核开始， arm64 架构中的 52 位（大）虚拟地址（VA）和物理地址（PA）得到支持。尽管[内核文档][3]描述了这些特性和新的内核运行时对旧的 CPU（硬件层面不支持 52 位虚拟地址拓展）和新的 CPU（硬件层面支持 52 位虚拟地址拓展）的影响，但对普通用户而言，理解这些并且如何 “选择使用” 52 位的地址空间可能会很复杂。

因此，我会在本文中介绍下面这些比较新的概念：

  1. 在增加了对这些功能的支持后，内核的内存布局如何“翻转”到 Arm64 架构
  2. 对用户态应用的影响，尤其是对提供调试支持的程序（例如：kexec-tools、 makedumpfile 和 crash-utility）
  3. 如何通过指定大于 48 位的 mmap 参数，使用户态应用“选择”从 52 位地址空间接受 VA？

### ARMv8.2 架构的 LVA 和 LPA 拓展

ARMv8.2 架构提供两种重要的拓展：大虚拟寻址（LVA）和大物理寻址（LPA）。

当使用 64 KB 转换粒度时，ARMv8.2-LVA 为每个翻译表基地址寄存器提供了一个更大的 52 位虚拟地址空间。

在 ARMv8.2-LVA 中允许：

  * 当使用 64 KB 转换粒度时，中间物理地址（IPA）和物理地址空间拓展为 52 位。
  * 如果使用 64 KB 转换粒度来实现对 52 位物理地址的支持，那么一级块将会覆盖 4TB 的地址空间。

_需要注意的是这些特性仅在 AArch64 架构中支持。_

目前下列的 Arm64 Cortex-A 处理器支持 ARMv8.2 拓展：

  * Cortex-A55
  * Cortex-A75
  * Cortex-A76

更多细节请参考 [Armv8 架构参考手册][4]。

### Arm64 的内核内存布局

伴随着 ARMv8.2 拓展增加了对 LVA 地址的支持（仅当以页大小为 64 KB 运行时可用），在第一级转换中，描述符的数量会增加。

用户地址将 63-48 位位置为 0，然而内核地址将这些位设置为 1。TTBRx 的选择由虚拟地址的 63 位决定。`swapper_pg_dir` 仅包含内核（全局）映射，然而 `pgd` 仅包含用户（非全局）的映射。`swapper_pg_dir` 地址会写入 TTBR1，且永远不会写入 TTBR0。

**页面大小为 64 KB 和三个级别的（具有 52 位硬件支持）的 AArch64 架构下 Linux 内存布局如下：**

```
  开始                  结束                       大小          用途
  -----------------------------------------------------------------------
  0000000000000000      000fffffffffffff           4PB          用户
  fff0000000000000      fff7ffffffffffff           2PB          内核逻辑内存映射
  fff8000000000000      fffd9fffffffffff        1440TB          [间隙]
  fffda00000000000      ffff9fffffffffff         512TB          Kasan 阴影区
  ffffa00000000000      ffffa00007ffffff         128MB          bpf jit 区域
  ffffa00008000000      ffffa0000fffffff         128MB          模块
  ffffa00010000000      fffff81ffffeffff         ~88TB          vmalloc 区
  fffff81fffff0000      fffffc1ffe58ffff          ~3TB          [保护区域]
  fffffc1ffe590000      fffffc1ffe9fffff        4544KB          固定映射
  fffffc1ffea00000      fffffc1ffebfffff           2MB          [保护区域]
  fffffc1ffec00000      fffffc1fffbfffff          16MB          PCI I/O 空间
  fffffc1fffc00000      fffffc1fffdfffff           2MB          [保护区域]
  fffffc1fffe00000      ffffffffffdfffff        3968GB          vmemmap
  ffffffffffe00000      ffffffffffffffff           2MB          [保护区域]
```

**4 KB 页面的转换查询表如下：**

```
  +--------+--------+--------+--------+--------+--------+--------+--------+
  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
  +--------+--------+--------+--------+--------+--------+--------+--------+
   |                 |         |         |         |         |
   |                 |         |         |         |         v
   |                 |         |         |         |   [11:0]  页内偏移量
   |                 |         |         |         +-> [20:12] L3 索引
   |                 |         |         +-----------> [29:21] L2 索引
   |                 |         +---------------------> [38:30] L1 索引
   |                 +-------------------------------> [47:39] L0 索引
   +-------------------------------------------------> [63] TTBR0/1
```

**64 KB 页面的转换查询表如下：**

```
  +--------+--------+--------+--------+--------+--------+--------+--------+
  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
  +--------+--------+--------+--------+--------+--------+--------+--------+
   |                 |    |               |              |
   |                 |    |               |              v
   |                 |    |               |            [15:0]  页内偏移量
   |                 |    |               +----------> [28:16] L3 索引
   |                 |    +--------------------------> [41:29] L2 索引
   |                 +-------------------------------> [47:42] L1 索引 (48 位)
   |                                                   [51:42] L1 索引 (52 位)
   +-------------------------------------------------> [63] TTBR0/1
```

![][5]

### 内核对 52 位虚拟地址的支持

因为支持 LVA 的较新的内核应该可以在旧的 CPU（硬件不支持 LVA 拓展）和新的 CPU（硬件支持 LVA 拓展）上都正常运行，因此采用的设计方法是使用单个二进制文件来支持 52 位（如果硬件不支持该特性，则必须在刚开始启动时能回退到 48 位）。也就是说，为了满足 52 位的虚拟地址以及固定大小的 `PAGE_OFFSET`，`VMEMMAP` 必须设置得足够大。

这样的设计方式要求内核为了新的虚拟地址空间而支持下面的变量：

```
VA_BITS         常量       *最大的* 虚拟地址空间大小

vabits_actual   变量       *实际的* 虚拟地址空间大小
```

因此，尽管 `VA_BITS` 设置了最大的虚拟地址空间大小，但实际上支持的虚拟地址空间大小由 `vabits_actual` 确定（具体取决于启动时的切换）。

#### 翻转内核内存布局

保持一个单一内核二进制文件的设计方法要求内核的 `.text` 位于高位地址中，因此它们对于 48/52 位虚拟地址是不变的。因为内核地址检测器（KASAN）区域仅占整个内核虚拟地址空间的一小部分，因此对于 48 位或 52 位的虚拟地址空间，KASAN 区域的末尾也必须在内核虚拟地址空间的上半部分。（从 48 位切换到 52 位，KASAN 区域的末尾是不变的，且依赖于 `~0UL`，而起始地址将“增长”到低位地址）

为了优化 `phys_to_virt()` 和 `virt_to_phys()`，页偏移量将被保持在 `0xFFF0000000000000` （对应于 52 位），这消除了读取额外变量的需求。在早期启动时将会计算 `physvirt` 和 `vmemmap` 偏移量以启用这个逻辑。

考虑下面的物理和虚拟 RAM 地址空间的转换：

```
/*
 * 内核线性地址开始于虚拟地址空间的底部
 * 测试区域开始处的最高位已经是一个足够的检查，并且避免了担心标签的麻烦
 */

#define virt_to_phys(addr) ({                                   \
        if (!(((u64)addr) & BIT(vabits_actual - 1)))            \
                (((addr) & ~PAGE_OFFSET) + PHYS_OFFSET)
})

#define phys_to_virt(addr) ((unsigned long)((addr) - PHYS_OFFSET) | PAGE_OFFSET)

在上面的代码中：
 PAGE_OFFSET — 线性映射的虚拟地址的起始位置位于 TTBR1 地址空间
 PHYS_OFFSET — 物理地址的起始位置以及 vabits_actual — *实际的*虚拟地址空间大小
```

### 对用于调试内核的用户态程序的影响

有几个用户空间应用程序可以用于调试正在运行的/活动中的内核或者分析系统崩溃时的 vmcore 转储（例如确定内核奔溃的根本原因）：kexec-tools、makedumpfile 和 crash-utility。

当用它们来调试 Arm64 内核时，因为 Arm64 内核内存映射被“翻转”，因此也会对它们产生影响。这些应用程序还需要遍历转换表以确定与虚拟地址相应的物理地址（类似于内核中的完成方式）。

相应地，在将“翻转”引入内核内存映射之后，由于上游破坏了用户态应用程序，因此必须对其进行修改。

我已经提议了对三个受影响的用户态应用程序的修复；有一些已经被上游接受，但其他仍在等待中：

  * [提议 makedumpfile 上游的修复][6]
  * [提议 kexec-tools 上游的修复][7]
  * [已接受的 crash-utility 的修复][8]

除非在用户空间应用程序进行了这些修改，否则它们将仍然无法调试运行/活动中的内核或分析系统崩溃时的 vmcore 转储。

### 52 位用户态虚拟地址

为了保持与依赖 ARMv8.0 虚拟地址空间的最大为 48 位的用户空间应用程序的兼容性，在默认情况下内核会将虚拟地址从 48 位范围返回给用户空间。

通过指定大于 48 位的 mmap 提示参数，用户态程序可以“选择”从 52 位空间接收虚拟地址。

例如：

```
.mmap_high_addr.c
----

   maybe_high_address = mmap(~0UL, size, prot, flags,...);
```

通过启用以下的内核配置选项，还可以构建一个从 52 位空间返回地址的调试内核：

```
   CONFIG_EXPERT=y && CONFIG_ARM64_FORCE_52BIT=y
```

_请注意此选项仅用于调试应用程序，不应在实际生产中使用。_

### 结论

总结一下：

1. 内核版本从 5.14 开始，新的 Armv8.2 硬件拓展 LVA 和 LPA 在内核中得到良好支持。
2. 像 kexec-tools 和 makedumpfile 被用来调试内核的用户态应用程序现在无法支持新拓展，仍在等待上游接受修补。
3. 过去的用户态应用程序依赖于 Arm64 内核提供的 48 位虚拟地址将继续原样工作，而较新的用户态应用程序通构指定超过 48 位更大的 mmap 提示参数来 “选择加入”已接受来自 52 位的虚拟地址。

* * *

_这篇文章参考了 [AArch64 架构下的 Linux 内存布局][9] 和 [Linux 5.9.12 内核文档][10]。它们均为 GPLv2.0 许可。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/52-bit-arm64-kernel

作者：[Bhupesh Sharma][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bhsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://lwn.net/Articles/716916/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/memory.rst
[4]: https://developer.arm.com/documentation/ddi0487/latest/
[5]: https://opensource.com/sites/default/files/arm64-multi-level-translation_0.png (arm64 Multi-level Translation)
[6]: http://lists.infradead.org/pipermail/kexec/2020-September/021372.html
[7]: http://lists.infradead.org/pipermail/kexec/2020-September/021333.html
[8]: https://github.com/crash-utility/crash/commit/1c45cea02df7f947b4296c1dcaefa1024235ef10
[9]: https://www.kernel.org/doc/html/latest/arm64/memory.html
[10]: https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/memory.h
