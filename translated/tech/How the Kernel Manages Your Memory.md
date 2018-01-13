内核如何管理你的内存
============================================================


当我们看完了进程的[虚拟内存地址分布][1]之后，我们将方向转向内核，以及它管理用户内存的机制，这里我们仍然以 gonzo 为例：

![Linux kernel mm_struct](http://static.duartes.org/img/blogPosts/mm_struct.png)

在内核中的实现的 Linux 进程是一个 [task_struct][2] 实例，是一个进程描述符。在 task_struct 中有一个 [mm][3] 域指向了一个内存描述符，[mm_struct][4] ，这是程序运行过程中的一个内存概览。如上图所示，它保存了内存段的开始和结束地址，进程使用物理内存页的[数量][5]，(rss 指的是 Resident Set Size)，使用的虚拟地址空间的[数量][6]，以及一些其他的琐碎的东西，在内存描述符里，我们看到了两个用于主要用于管理程序内存的结构：虚拟内存区域和页表。Ｇonzo 的内存区域如下所示：

![Kernel memory descriptor and memory areas](http://static.duartes.org/img/blogPosts/memoryDescriptorAndMemoryAreas.png)

每一个虚拟内存区域都是一段连续的虚拟地址，这些内存区域不会重叠，[vm_area_struct][7] 能够完全描述一个内存区域，包括它的起始地址和结束地址，[flag][8] 决定了这个内存区域的访问权限和它的行为，如果有文件被映射的话 ，[vm_file][9] 指出了哪一个文件被映射到这个内存区域，虚拟内存区域不会映射匿名的文件，在上面的每一个内存段 (例如，堆，栈) 都对应一个单独的虚拟内存区域，除了内存映射段，这不是必须的，虽然这在 X86 机器上很常见。虚拟内存区域并不关心它们在哪一个段中。

一个程序的 VMA 存储在它的内存描述符中，作为 [mmap][10] 字段中的一个链接列表，通过开始虚拟地址排序，以及以 [mm_rb][12] 字段为根的[红黑树][11]。红黑树允许内核能够快速的查找内存区域覆盖的虚拟内存地址，当你要读位于 `/proc/pid_of_process/maps` 的文件时,内核就会简单地通过查找进程的虚拟内存区域链表然后[打印出来][13]．

在 Windows 系统中，[EPROCESS][14] 块大致上是 task_struct 和 mm_struct 的组合体，在 Windows 系统中类似于 VMA 的是虚拟地址描述符，即 [VAD][15] ;它们被存储在平衡 [AVL tree][16] 中，你知道 Windows 和 Linux 最有趣的地方是什么吗？那就是它们几乎没什么不同。

4 GB 虚拟地址空间被分成许多页，X86 处理器在 32-bit 模式下支持的页面大小有 4 KB ， 2 MB 和 4 MB。Linux 和 Windows 系统都是将用户虚拟地址空间划分为 4 KB 大小的页面，字节 0-4095 在第 0 页上，字节4096-8191 在第 1 页上，以此类推。虚拟地址区域的大小必须是页面大小的整数倍，下图是一个 4 KB 页面组成的 3 GB 大小的用户空间。

![4KB Pages Virtual User Space](http://static.duartes.org/img/blogPosts/pagedVirtualSpace.png)

处理器通过查询页表来将虚拟地址转化成内存物理地址，每一个进程都有它自身的一个页表；当发生进程切换时，用户空间的页表也随之被切换。Linux 系统保存了一个指向在内存描述符中的 [pgd][17] 域中的一个进程页表的指针。对于每一个虚拟页都对应于页表中的一个表项( PTE ) ，在 X86 中，它是一个如下所示的 4 字节的记录：

![x86 Page Table Entry (PTE) for 4KB page](http://static.duartes.org/img/blogPosts/x86PageTableEntry4KB.png)

Linux 具有[读取][18]和[设置][19] PTE 中每一个标志位的功能。位 P 告诉处理器虚拟页是否存在于物理内存中，如果是 0 的话，将会触发一个页错误，记住，当这个位为 0 的时候，内核可以对记录中剩余的字段为所欲为。位 R/W 指示读写的权限，如果该位为 0 ,则这个页面只能读取。位 U/S 指明用户状态/内核状态；如果该位是 0 的话，那么这个页面只能被内核读取，这个标志主要用于实现内存只读以保护我们前面所见的内核空间。

位 D 和 A 为脏位和读取位，一个脏页已经被写入新的数据，当一个可以读取的页被写或读，两个标志都会被置位：处理器仅仅置位它们，它们只能被内核置 ０ ,最后，PTE 存储了这个虚拟地址页所对应的物理内存的起始地址，以 4 KB 对齐，这种原始的字段记录是麻烦的来源，因为它限制了可寻址的物理内存空间最大为 [4 GB][20]，其它的 PTE 字段我们将会在另外一天进行讲述，包括物理地址扩展也在另一天讲述。

 一个虚拟页是内存保护的基本单元，因为页中的所有字节都共享 PTE 中的 U/S 和 R/W 字段，然而，相同的物理内存可能被映射到不同的页上，页可能具有不同的保护标志，请注意，可执行权限在 PTE 中是看不到的。这也就是为什么在 X86 的分页中允许执行在栈内的代码，这使得利用栈缓冲溢出更加的容易(也可能使用 [return-to-libc][21] 来利用不可执行的栈和一些其他的技术)。PTE 缺少不可执行的标志说明了一个更加广泛的事实：在虚拟内存区域中的权限标志可能会可能不会干净利索地被硬件保护理解。内核做它能做的，但最终架构限制了它的可能性。

虚拟内存并不存储任何东西，它仅仅是将程序的地址空间映射到底层的物理内存上。处理器通过一个大的块通常叫做物理地址空间来访问它。尽管在总线上会稍微的涉及一点内存操作，在这里我们忽视它而且假定物理地址空间的范围是按字节增长的从 0 到可以读取内存空间的最大值。物理内存空间被内核划分成了许多的页框，处理器并不知道也并不关心页框，然而他们对于内核是至关重要的，因为页框是物理内存管理的基本单元。Linux 和 Windows 系统在 32-bit 模式下使用的都是 4 KB 的页框。下图是一个 2 GB RAM 机器的例子：

![Physical Address Space](http://static.duartes.org/img/blogPosts/physicalAddressSpace.png)

在 Linux 中，每一个页框都被一个[描述符][23]和若干[标志][24]所追踪。所有的这些描述符跟踪了计算机的全部物理内存；每一个页框的精确状态就能够被了解，物理内存是通过[buddy memory allocation][25] 技术来管理的，因此，对于 buddy 系统来说可以分配的页框都是空闲的。一个分配的页框可能是匿名的，保存程序的数据，或者可能在页缓存中，保存着文件中或块设备中的数据。这里还有一些另外的页框使用情况，但我们现在不谈他们。Windows 具有类似的页框号( PFN )来跟踪物理内存。

现在，我们将虚拟内存，页表以及页框放在一起来理解它们是如何工作的，下图是一个用户堆的例子：

![Physical Address Space](http://static.duartes.org/img/blogPosts/heapMapped.png)

蓝色的矩形框代表的是在虚拟内存中的页，而箭头所表示的是页面映射到页框的页表项。一些虚拟页没有箭头，这就表示它们相对应的 PTEs 中的存在位是 0 ，这可能是因为这个页从未被使用或者这个页被换出。无论在哪种情况下都会导致页错误，即使是他们存在于虚拟内存中。对于虚拟内存来说这看起来有点奇怪，而且与页表不统一，但这的确经常发生。

虚拟内存就像是一个介于程序和内核之间的联系表。你请求做一些事情 (内存分配，文件映射等) ，内核回应可以，然后它合理的创建或者更新了虚拟内存。但是，它并不是立即回应这些请求，它要一直等到发生页错误的时候。内核是懒惰和欺诈的，这是虚拟内存的基本原理。它适用于大部分情况，一些比较熟悉，一些令人惊喜。

![Example of demand paging and memory allocation](http://static.duartes.org/img/blogPosts/heapAllocation.png)

当一个程序通过系统调用 [brk()][26] 请求更多的内存时，内核仅仅是简单的 [更新][27]堆虚拟内存然后完成操作．这时并没有实际进行页框分配而且也没有新的页出现在物理内存中．一旦程序尝试访问页面，就会出现页错误然后 [do_page_fault()][28] 函数被调用．它通过使用 [find_vma()][30] 函数在虚拟内存中开始[查找][29]出错的地址，如果找到，核对访问( 读或写 )的权限，如果没有找到，在联系表中没有要尝试访问的内存，进程就会抛出一个段错误．

当一个虚拟内存区域发现内核必须通过查看 PTE 的内容以及虚拟内存区域的类型来处理这个错误．在我们这个例子中， PTE 显示这个页并不存在，事实上，我们的 PTE 是完全空白的(全部是 0 )，在 Linux 中，这意味着虚拟页从没有被映射，因为这一一个匿名的虚拟内存区域．我们有一个纯净的内存事务必须要使用 [do_anonymous_page()][34] 函数来处理，这会分配一个页框，然后修改 PTE 使发生错误的页映射到新分配的页框中．

对于换出的页的 PTE，事情可能会有所不同．例如，在它的 P 位显示是 0 ，但它并不是空白的页．相反，它记录了存储页内容的交换位置，一定要通过 [do_swap_page()][35] 函数来从磁盘中读取然后装入页框中，这称为主错误．

 我们通过内核对用户内存的管理结束了我们的前半部分。在下一篇文章中，我们将把文件扔到混合体中，构建一个完整的内存基础，包括对性能的影响。

--------------------------------------------------------------------------------

via: http://duartes.org/gustavo/blog/post/how-the-kernel-manages-your-memory/

作者：[Gustavo Duarte][a]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://duartes.org/gustavo/blog/about/
[1]:http://duartes.org/gustavo/blog/post/anatomy-of-a-program-in-memory
[2]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/sched.h#L1075
[3]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/sched.h#L1129
[4]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L173
[5]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L197
[6]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L206
[7]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L99
[8]:http://lxr.linux.no/linux+v2.6.28/include/linux/mm.h#L76
[9]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L150
[10]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L174
[11]:http://en.wikipedia.org/wiki/Red_black_tree
[12]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L175
[13]:http://lxr.linux.no/linux+v2.6.28.1/fs/proc/task_mmu.c#L201
[14]:http://www.nirsoft.net/kernel_struct/vista/EPROCESS.html
[15]:http://www.nirsoft.net/kernel_struct/vista/MMVAD.html
[16]:http://en.wikipedia.org/wiki/AVL_tree
[17]:http://lxr.linux.no/linux+v2.6.28.1/include/linux/mm_types.h#L185
[18]:http://lxr.linux.no/linux+v2.6.28.1/arch/x86/include/asm/pgtable.h#L173
[19]:http://lxr.linux.no/linux+v2.6.28.1/arch/x86/include/asm/pgtable.h#L230
[20]:http://www.google.com/search?hl=en&amp;q=2^20+*+2^12+bytes+in+GB
[21]:http://en.wikipedia.org/wiki/Return-to-libc_attack
[22]:http://duartes.org/gustavo/blog/post/getting-physical-with-memory
[23]:http://lxr.linux.no/linux+v2.6.28/include/linux/mm_types.h#L32
[24]:http://lxr.linux.no/linux+v2.6.28/include/linux/page-flags.h#L14
[25]:http://en.wikipedia.org/wiki/Buddy_memory_allocation
[26]:http://www.kernel.org/doc/man-pages/online/pages/man2/brk.2.html
[27]:http://lxr.linux.no/linux+v2.6.28.1/mm/mmap.c#L2050
[28]:http://lxr.linux.no/linux+v2.6.28/arch/x86/mm/fault.c#L583
[29]:http://lxr.linux.no/linux+v2.6.28/arch/x86/mm/fault.c#L692
[30]:http://lxr.linux.no/linux+v2.6.28/mm/mmap.c#L1466
[31]:http://lxr.linux.no/linux+v2.6.28/arch/x86/mm/fault.c#L711
[32]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2653
[33]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2674
[34]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2681
[35]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2280
[36]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2316
