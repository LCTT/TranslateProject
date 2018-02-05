What’s behind the Intel design flaw forcing numerous patches?
============================================================

### There's obviously a big problem, but we don't know exactly what.


![](https://cdn.arstechnica.net/wp-content/uploads/2015/06/intel-48-core-larrabee-probably-640x427.jpg)


Both Windows and Linux are receiving significant security updates that can, in the worst case, cause performance to drop by half, to defend against a problem that as yet hasn't been fully disclosed.

Patches to the Linux kernel have been trickling in over the past few weeks. Microsoft has been [testing the Windows updates in the Insider program since November][3], and it is expected to put the alterations into mainstream Windows builds on Patch Tuesday next week. Microsoft's Azure has scheduled maintenance next week, and Amazon's AWS is scheduled for maintenance on Friday—presumably related.

Since the Linux patches [first came to light][4], a clearer picture of what seems to be wrong has emerged. While Linux and Windows differ in many regards, the basic elements of how these two operating systems—and indeed, every other x86 operating system such as FreeBSD and [macOS][5]—handle system memory is the same, because these parts of the operating system are so tightly coupled to the capabilities of the processor.

### Keeping track of addresses

Every byte of memory in a system is implicitly numbered, those numbers being each byte's address. The very earliest operating systems operated using physical memory addresses, but physical memory addresses are inconvenient for lots of reasons. For example, there are often gaps in the addresses, and (particularly on 32-bit systems), physical addresses can be awkward to manipulate, requiring 36-bit numbers, or even larger ones.

Accordingly, modern operating systems all depend on a broad concept called virtual memory. Virtual memory systems allow both programs and the kernels themselves to operate in a simple, clean, uniform environment. Instead of the physical addresses with their gaps and other oddities, every program, and the kernel itself, uses virtual addresses to access memory. These virtual addresses are contiguous—no need to worry about gaps—and sized conveniently to make them easy to manipulate. 32-bit programs see only 32-bit addresses, even if the physical address requires 36-bit or more numbering.

While this virtual addressing is transparent to almost every piece of software, the processor does ultimately need to know which physical memory a virtual address refers to. There's a mapping from virtual addresses to physical addresses, and that's stored in a large data structure called a page table. Operating systems build the page table, using a layout determined by the processor, and the processor and operating system in conjunction use the page table whenever they need to convert between virtual and physical addresses.

This whole mapping process is so important and fundamental to modern operating systems and processors that the processor has dedicated cache—the translation lookaside buffer, or TLB—that stores a certain number of virtual-to-physical mappings so that it can avoid using the full page table every time.

The use of virtual memory gives us a number of useful features beyond the simplicity of addressing. Chief among these is that each individual program is given its own set of virtual addresses, with its own set of virtual to physical mappings. This is the fundamental technique used to provide "protected memory;" one program cannot corrupt or tamper with the memory of another program, because the other program's memory simply isn't part of the first program's mapping.

But these uses of an individual mapping per process, and hence extra page tables, puts pressure on the TLB cache. The TLB isn't very big—typically a few hundred mappings in total—and the more page tables a system uses, the less likely it is that the TLB will include any particular virtual-to-physical translation.

### Half and half

To make the best use of the TLB, every mainstream operating system splits the range of virtual addresses into two. One half of the addresses is used for each program; the other half is used for the kernel. When switching between processes, only half the page table entries change—the ones belonging to the program. The kernel half is common to every program (because there's only one kernel), and so it can use the same page table mapping for every process. This helps the TLB enormously; while it still has to discard mappings belonging to the process' half of memory addresses, it can keep the mappings for the kernel's half.

This design isn't completely set in stone. Work was done on Linux to make it possible to give a 32-bit process the entire range of addresses, with no sharing between the kernel's page table and that of each program. While this gave the programs more address space, it carried a performance cost, because the TLB had to reload the kernel's page table entries every time kernel code needed to run. Accordingly, this approach was never widely used on x86 systems.

One downside of the decision to split the virtual address space between the kernel and each program is that the memory protection is weakened. If the kernel had its own set of page tables and virtual addresses, it would be afforded the same protection as different programs have from one another; the kernel's memory would be simply invisible. But with the split addressing, user programs and the kernel use the same address range, and, in principle, a user program would be able to read and write kernel memory.

To prevent this obviously undesirable situation, the processor and virtual addressing system have a concept of "rings" or "modes." x86 processors have lots of rings, but for this issue, only two are relevant: "user" (ring 3) and "supervisor" (ring 0). When running regular user programs, the processor is put into user mode, ring 3\. When running kernel code, the processor is in ring 0, supervisor mode, also known as kernel mode.

These rings are used to protect the kernel memory from user programs. The page tables aren't just mapping from virtual to physical addresses; they also contain metadata about those addresses, including information about which rings can access an address. The kernel's page table entries are all marked as only being accessible to ring 0; the program's entries are marked as being accessible from any ring. If an attempt is made to access ring 0 memory while in ring 3, the processor blocks the access and generates an exception. The result of this is that user programs, running in ring 3, should not be able to learn anything about the kernel and its ring 0 memory.

At least, that's the theory. The spate of patches and update show that somewhere this has broken down. This is where the big mystery lies.

### Moving between rings

Here's what we do know. Every modern processor performs a certain amount of speculative execution. For example, given some instructions that add two numbers and then store the result in memory, a processor might speculatively do the addition before ascertaining whether the destination in memory is actually accessible and writeable. In the common case, where the location  _is_  writeable, the processor managed to save some time, as it did the arithmetic in parallel with figuring out what the destination in memory was. If it discovers that the location isn't accessible—for example, a program trying to write to an address that has no mapping and no physical location at all—then it will generate an exception and the speculative execution is wasted.

Intel processors, specifically—[though not AMD ones][6]—allow speculative execution of ring 3 code that writes to ring 0 memory. The processors  _do_  properly block the write, but the speculative execution minutely disturbs the processor state, because certain data will be loaded into cache and the TLB in order to ascertain whether the write should be allowed. This in turn means that some operations will be a few cycles quicker, or a few cycles slower, depending on whether their data is still in cache or not. As well as this, Intel's processors have special features, such as the Software Guard Extensions (SGX) introduced with Skylake processors, that slightly change how attempts to access memory are handled. Again, the processor does still protect ring 0 memory from ring 3 programs, but again, its caches and other internal state are changed, creating measurable differences.

What we don't know, yet, is just how much kernel memory information can be leaked to user programs or how easily that leaking can occur. And which Intel processors are affected? Again it's not entirely clear, but indications are that every Intel chip with speculative execution (which is all the mainstream processors introduced since the Pentium Pro, from 1995) can leak information this way.

The first wind of this problem came from researchers from [Graz Technical University in Austria][7]. The information leakage they discovered was enough to undermine kernel mode Address Space Layout Randomization (kernel ASLR, or KASLR). ASLR is something of a last-ditch effort to prevent the exploitation of [buffer overflows][8]. With ASLR, programs and their data are placed at random memory addresses, which makes it a little harder for attackers to exploit security flaws. KASLR applies that same randomization to the kernel so that the kernel's data (including page tables) and code are randomly located.

The Graz researchers developed [KAISER][9], a set of Linux kernel patches to defend against the problem.

If the problem were just that it enabled the derandomization of ASLR, this probably wouldn't be a huge disaster. ASLR is a nice protection, but it's known to be imperfect. It's meant to be a hurdle for attackers, not an impenetrable barrier. The industry reaction—a fairly major change to both Windows and Linux, developed with some secrecy—suggests that it's not just ASLR that's defeated and that a more general ability to leak information from the kernel has been developed. Indeed, researchers have [started to tweet][10] that they're able to leak and read arbitrary kernel data. Another possibility is that the flaw can be used to escape out of a virtual machine and compromise a hypervisor.

The solution that both the Windows and Linux developers have picked is substantially the same, and derived from that KAISER work: the kernel page table entries are no longer shared with each process. In Linux, this is called Kernel Page Table Isolation (KPTI).

With the patches, the memory address is still split in two; it's just the kernel half is almost empty. It's not quite empty, because a few kernel pieces need to be mapped permanently, whether the processor is running in ring 3  _or_  ring 0, but it's close to empty. This means that even if a malicious user program tries to probe kernel memory and leak information, it will fail—there's simply nothing to leak. The real kernel page tables are only used when the kernel itself is running.

This undermines the very reason for the split address space in the first place. The TLB now needs to clear out any entries related to the real kernel page tables every time it switches to a user program, putting an end to the performance saving that splitting enabled.

The impact of this will vary depending on the workload. Every time a program makes a call into the kernel—to read from disk, to send data to the network, to open a file, and so on—that call will be a little more expensive, since it will force the TLB to be flushed and the real kernel page table to be loaded. Programs that don't use the kernel much might see a hit of perhaps 2-3 percent—there's still some overhead because the kernel always has to run occasionally, to handle things like multitasking.

But workloads that call into the kernel a ton will see much greater performance drop off. In a benchmark, a program that does virtually nothing  _other_  than call into the kernel saw [its performance drop by about 50 percent][11]; in other words, each call into the kernel took twice as long with the patch than it did without. Benchmarks that use Linux's loopback networking also see a big hit, such as [17 percent][12] in this Postgres benchmark. Real database workloads using real networking should see lower impact, because with real networks, the overhead of calling into the kernel tends to be dominated by the overhead of using the actual network.

While Intel systems are the ones known to have the defect, they may not be the only ones affected. Some platforms, such as SPARC and IBM's S390, are immune to the problem, as their processor memory management doesn't need the split address space and shared kernel page tables; operating systems on those platforms have always isolated their kernel page tables from user mode ones. But others, such as ARM, may not be so lucky; [comparable patches for ARM Linux][13] are under development.

<aside class="ad_native" id="ad_xrail_native" style="box-sizing: inherit;"></aside>

[][15][PETER BRIGHT][14]Peter is Technology Editor at Ars. He covers Microsoft, programming and software development, Web technology and browsers, and security. He is based in Brooklyn, NY.

--------------------------------------------------------------------------------

via: https://arstechnica.com/gadgets/2018/01/whats-behind-the-intel-design-flaw-forcing-numerous-patches/

作者：[ PETER BRIGHT ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://arstechnica.com/author/peter-bright/
[1]:https://arstechnica.com/author/peter-bright/
[2]:https://arstechnica.com/gadgets/2018/01/whats-behind-the-intel-design-flaw-forcing-numerous-patches/?comments=1
[3]:https://twitter.com/aionescu/status/930412525111296000
[4]:https://lwn.net/SubscriberLink/741878/eb6c9d3913d7cb2b/
[5]:https://twitter.com/aionescu/status/948609809540046849
[6]:https://lkml.org/lkml/2017/12/27/2
[7]:https://gruss.cc/files/kaiser.pdf
[8]:https://arstechnica.com/information-technology/2015/08/how-security-flaws-work-the-buffer-overflow/
[9]:https://github.com/IAIK/KAISER
[10]:https://twitter.com/brainsmoke/status/948561799875502080
[11]:https://twitter.com/grsecurity/status/947257569906757638
[12]:https://www.postgresql.org/message-id/20180102222354.qikjmf7dvnjgbkxe@alap3.anarazel.de
[13]:https://lwn.net/Articles/740393/
[14]:https://arstechnica.com/author/peter-bright
[15]:https://arstechnica.com/author/peter-bright
