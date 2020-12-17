[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding 52-bit virtual address support in the Arm64 kernel)
[#]: via: (https://opensource.com/article/20/12/52-bit-arm64-kernel)
[#]: author: (Bhupesh Sharma https://opensource.com/users/bhsharma)

Understanding 52-bit virtual address support in the Arm64 kernel
======
The introduction of 64-bit hardware increased the need to handle larger
address spaces.
![Puzzle pieces coming together to form a computer screen][1]

After 64-bit hardware became available, the need to handle larger address spaces (greater than 232 bytes) became obvious. With some vendors now offering servers with 64TiB (or more) of memory, x86_64 and arm64 now allow addressing adress spaces greater than 248 bytes (available with the default 48-bit address support).

x86_64 addressed these use cases by enabling support for five-level page tables in both hardware and software. This enables addressing address spaces equal to 257 bytes (see [x86: 5-level paging enabling for v4.12][2] for details). It bumps the limits to 128PiB of virtual address space and 4PiB of physical address space.

arm64 achieved the same thing by introducing two new architecture extensions—ARMv8.2 LVA (Large Virtual Addressing) and ARMv8.2 LPA (Large Physical Addressing). These allow 4PiB of virtual address space and 4 PiB of physical address space (i.e., 252 bits each, respectively).

With ARMv8.2 architecture extensions available in new arm64 CPUs, the two new hardware extensions are now supported in open source software.

Starting with Linux kernel version 5.4, the 52-bit (Large) Virtual Address (VA) and Physical Address (PA) support was introduced for arm64 architecture. Although the [kernel documentation][3] describes these features and how they impact the new kernels running on older CPUs (which don't support 52-bit VA extension in hardware) and newer CPUs (which support 52-bit VA extensions in hardware), it can be complex for average users to understand them and how they can "opt-in" to receiving VAs from a 52-bit space.

Therefore, I will introduce these relatively new concepts in this article:

  1. How the kernel memory layout got "flipped" for Arm64 after the support for these features was added
  2. The impact on userspace applications, especially the ones that provide debugging support (e.g., kexec-tools, makedumpfile, and crash-utility)
  3. How userspace applications can "opt-in" to receiving VAs from a 52-bit space by specifying an mmap hint parameter that is larger than 48 bits



### ARMv8.2 architecture LVA and LPA extensions

The ARMv8.2 architecture provides two important extensions: Large Virtual Addressing (LVA) and Large Physical Addressing (LPA).

ARMv8.2-LVA supports a larger VA space for each translation table base register of up to 52 bits when using the 64KB translation granule.

ARMv8.2-LPA allows:

  * A larger intermediate physical address (IPA) and PA space of up to 52 bits when using the 64KB translation granule
  * A level 1 block size where the block covers a 4TB address range for the 64KB translation granule if the implementation supports 52 bits of PA



_Note that these features are supported only in the AArch64 state._

Currently, the following Arm64 Cortex-A processors support ARMv8.2 extensions:

  * Cortex-A55
  * Cortex-A75
  * Cortex-A76



For more details, see the [Armv8 Architecture Reference Manual][4].

### Kernel memory layout on Arm64

With the ARMv8.2 extension adding support for LVA space (which is only available when running with a 64KB page size), the number of descriptors gets expanded in the first level of translation.

User addresses have bits 63:48 set to 0, while the kernel addresses have the same bits set to 1. TTBRx selection is given by bit 63 of the virtual address. The `swapper_pg_dir` contains only kernel (global) mappings, while the user `pgd` contains only user (non-global) mappings. The `swapper_pg_dir` address is written to TTBR1 and never written to TTBR0.

**AArch64 Linux memory layout with 64KB pages plus three levels (52-bit with hardware support):**


```
  Start                 End                     Size            Use
  -----------------------------------------------------------------------
  0000000000000000      000fffffffffffff           4PB          user
  fff0000000000000      fff7ffffffffffff           2PB          kernel logical memory map
  fff8000000000000      fffd9fffffffffff        1440TB          [gap]
  fffda00000000000      ffff9fffffffffff         512TB          kasan shadow region
  ffffa00000000000      ffffa00007ffffff         128MB          bpf jit region
  ffffa00008000000      ffffa0000fffffff         128MB          modules
  ffffa00010000000      fffff81ffffeffff         ~88TB          vmalloc
  fffff81fffff0000      fffffc1ffe58ffff          ~3TB          [guard region]
  fffffc1ffe590000      fffffc1ffe9fffff        4544KB          fixed mappings
  fffffc1ffea00000      fffffc1ffebfffff           2MB          [guard region]
  fffffc1ffec00000      fffffc1fffbfffff          16MB          PCI I/O space
  fffffc1fffc00000      fffffc1fffdfffff           2MB          [guard region]
  fffffc1fffe00000      ffffffffffdfffff        3968GB          vmemmap
  ffffffffffe00000      ffffffffffffffff           2MB          [guard region]
```

**Translation table lookup with 4KB pages:**


```
  +--------+--------+--------+--------+--------+--------+--------+--------+
  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
  +--------+--------+--------+--------+--------+--------+--------+--------+
   |                 |         |         |         |         |
   |                 |         |         |         |         v
   |                 |         |         |         |   [11:0]  in-page offset
   |                 |         |         |         +-&gt; [20:12] L3 index
   |                 |         |         +-----------&gt; [29:21] L2 index
   |                 |         +---------------------&gt; [38:30] L1 index
   |                 +-------------------------------&gt; [47:39] L0 index
   +-------------------------------------------------&gt; [63] TTBR0/1
```

**Translation table lookup with 64KB pages:**


```
  +--------+--------+--------+--------+--------+--------+--------+--------+
  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
  +--------+--------+--------+--------+--------+--------+--------+--------+
   |                 |    |               |              |
   |                 |    |               |              v
   |                 |    |               |            [15:0]  in-page offset
   |                 |    |               +----------&gt; [28:16] L3 index
   |                 |    +--------------------------&gt; [41:29] L2 index
   |                 +-------------------------------&gt; [47:42] L1 index (48-bit)
   |                                                   [51:42] L1 index (52-bit)
   +-------------------------------------------------&gt; [63] TTBR0/1
```

 

![][5]

opensource.com

### 52-bit VA support in the kernel

Since the newer kernels with the LVA support should run well on older CPUs (which don't support LVA extension in hardware) and the newer CPUs (which support LVA extension in hardware), the chosen design approach is to have a single binary that supports 52 bit (and must be able to fall back to 48 bit at early boot time if the hardware feature is not present). That is, the VMEMMAP must be sized large enough for 52-bit VAs and also must be sized large enough to accommodate a fixed `PAGE_OFFSET`.

This design approach requires the kernel to support the following variables for the new virtual address space:


```
VA_BITS         constant        the *maximum* VA space size

vabits_actual   variable        the *actual* VA space size
```

So, while `VA_BITS` denotes the maximum VA space size, the actual VA space supported (depending on the switch made at boot time) is indicated by `vabits_actual`.

#### Flipping the kernel memory layout

The design approach of keeping a single kernel binary requires the kernel .text to be in the higher addresses, such that they are invariant to 48/52-bit VAs. Due to the Kernel Address Sanitizer (KASAN) shadow being a fraction of the entire kernel VA space, the end of the KASAN shadow must also be in the higher half of the kernel VA space for both 48 and 52 bit. (Switching from 48 bit to 52 bit, the end of the KASAN shadow is invariant and dependent on `~0UL`, while the start address will "grow" towards the lower addresses).

To optimize `phys_to_virt()` and `virt_to_phys()`, the `PAGE_OFFSET` is kept constant at `0xFFF0000000000000` (corresponding to 52 bit), this obviates the need for an extra variable read. The `physvirt` and `vmemmap` offsets are computed at early boot to enable this logic.

Consider the following physical vs. virtual RAM address space conversion:


```
/*
 * The linear kernel range starts at the bottom of the virtual address
 * space. Testing the top bit for the start of the region is a
 * sufficient check and avoids having to worry about the tag.
 */

#define virt_to_phys(addr) ({                                   \
        if (!(((u64)addr) &amp; BIT(vabits_actual - 1)))            \
                (((addr) &amp; ~PAGE_OFFSET) + PHYS_OFFSET)
})

#define phys_to_virt(addr) ((unsigned long)((addr) - PHYS_OFFSET) | PAGE_OFFSET)

where:
 PAGE_OFFSET - the virtual address of the start of the linear map, at the
                start of the TTBR1 address space,
 PHYS_OFFSET - the physical address of the start of memory, and
 vabits_actual - the *actual* VA space size
```

### Impact on userspace applications used to debug kernel

Several userspace applications are used to debug running/live kernels or analyze the vmcore dump from a crashing system (e.g., to determine the root cause of the kernel crash): kexec-tools, makedumpfile, and crash-utility.

When these are used for debugging the Arm64 kernel, there is also an impact on them because of the Arm64 kernel memory map getting "flipped." These applications also need to perform a translation table walk for determining a physical address corresponding to a virtual address (similar to how it is done in the kernel).

Accordingly, userspace applications must be modified as they are broken upstream after the "flip" was introduced in the kernel memory map.

I have proposed fixes in the three affected userspace applications; while some have been accepted upstream, others are still pending:

  * [Proposed makedumpfile upstream fix][6]
  * [Proposed kexec-tools upstream fix][7]
  * [Fix accepted in crash-utility][8]



Unless these changes are made in userspace applications, they will remain broken for debugging running/live kernels or analyzing the vmcore dump from a crashing system.

### 52-bit userspace VAs

To maintain compatibility with userspace applications that rely on the ARMv8.0 VA space maximum size of 48 bits, the kernel will, by default, return virtual addresses to userspace from a 48-bit range.

Userspace applications can "opt-in" to receiving VAs from a 52-bit space by specifying an mmap hint parameter larger than 48 bits.

For example:


```
.mmap_high_addr.c
\----

   maybe_high_address = mmap(~0UL, size, prot, flags,...);
```

It is also possible to build a debug kernel that returns addresses from a 52-bit space by enabling the following kernel config options:


```
`   CONFIG_EXPERT=y && CONFIG_ARM64_FORCE_52BIT=y`
```

_Note that this option is only intended for debugging applications and should **not** be used in production._

### Conclusions

To summarize:

  1. Starting with Linux kernel version 5.14, the new Armv8.2 hardware extensions LVA and LPA are now well-supported in the Linux kernel.
  2. Userspace applications like kexec-tools and makedumpfile used for debugging the kernel are broken _right now_ and awaiting acceptance of upstream fixes.
  3. Legacy userspace applications that rely on Arm64 kernel providing it a 48-bit VA will continue working as-is, whereas newer userspace applications can "opt-in" to receiving VAs from a 52-bit space by specifying an mmap hint parameter that is larger than 48 bits.



* * *

_This article draws on [Memory Layout on AArch64 Linux][9] and [Linux kernel documentation v5.9.12][10]. Both are licensed under GPLv2.0._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/52-bit-arm64-kernel

作者：[Bhupesh Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
