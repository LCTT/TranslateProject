Using Kdump for examining Linux Kernel crashes
============================================================

### Let's examine the basics of kdump usage and look at the internals of kdump/kexec kernel implementation.

![Using Kdump for examining Linux Kernel crashes](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/linux_boot.png?itok=pSGmf8Ca "Using Kdump for examining Linux Kernel crashes")
Image by : 

[Penguin][13], [Boot][14]. Modified by Opensource.com. [CC BY-SA 4.0][15].

[Kdump][16] is a way to acquire a crashed Linux kernel dump, but finding documents that explain its usage and internals can be challenging. In this article, I'll examine the basics of kdump usage and look at the internals of kdump/kexec kernel implementation.

[Kexec][17] is a Linux kernel-to-kernel boot loader that helps to boot the second kernel from the context of first kernel. Kexec shuts down the first kernel, bypasses the BIOS or firmware stage, and jumps to second kernel. Thus, reboots become faster in absence of the BIOS stage.

Kdump can be used with the kexec application—for example, when the second kernel is booted when the first kernel panics, the second kernel is used to copy the memory dump of first kernel, which can be analyzed with tools such as gdb and crash to determine the panic reasons. (In this article, I'll use the terms  _first kernel_  for the currently running kernel,  _second kernel_  for the kernel run using kexec, and  _capture kernel_  for kernel run when current kernel panics.)

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

The kexec mechanism has components in the kernel as well as in user space. The kernel provides few system calls for kexec reboot functionality. A user space tool called kexec-tools uses those calls and provides an executable to load and boot the second kernel. Sometimes a distribution also adds wrappers on top of kexec-tools, which helps capture and save the dump for various dump target configurations. In this article, I will use the name  _distro-kexec-tools_  to avoid confusion between upstream kexec-tools and distro-specific kexec-tools code. My example will use the Fedora Linux distribution.

### Fedora kexec-tools

**dnf install kexec-tools** installs fedora-kexec-tools on Fedora machines. The kdump service can be started by executing **systemctl start kdump** after installation of fedora-kexec-tools. When this service starts, it creates a root file system (initramfs) that contains resources to mount the target for saving vmcore, and a command to copy/dump vmcore to the target. This service then loads the kernel and initramfs at the suitable location within the crash kernel region so that they can be executed upon kernel panic.

Fedora wrapper provides two user configuration files:

1.  **/etc/kdump.conf** specifies configuration parameters whose modification requires rebuild of the initramfs. For example, if you change the dump target from a local disk to an NFS-mounted disk, you will need NFS-related kernel modules to be loaded by the capture kernel.

2.  **/etc/sysconfig/kdump** specifies configuration parameters whose modification do not require rebuild of the initramfs. For example, you do not need to rebuild the initramfs if you only need to modify command-line arguments passed to the capture kernel.

If the kernel panics after the kdump service starts, then the capture kernel is executed, which further executes the vmcore save process from initramfs and reboots to a stable kernel afterward.

### kexec-tools

Compilation of kexec-tools source code provides an executable called **kexec**. The same executable can be used to load and execute a second kernel or to load a capture kernel, which can be executed upon kernel panic.

A typical command to load a second kernel:

```
# kexec -l kernel.img --initrd=initramfs-image.img –reuse-cmdline
```

**--reuse-command** line says to use the same command line as that of first kernel. Pass initramfs using **--initrd**. **-l** says that you are loading the second kernel, which can be executed by the kexec application itself (**kexec -e**). A kernel loaded using **-l** cannot be executed at kernel panic. You must pass **-p**instead of **-l** to load the capture kernel that can be executed upon kernel panic.

A typical command to load a capture kernel:

```
# kexec -p kernel.img --initrd=initramfs-image.img –reuse-cmdline
```

**echo c > /pros/sysrq-trigger** can be used to crash the kernel for test purposes. See **man kexec** for detail about options provided by kexec-tools. Before moving to the next section, which focuses on internal implementation, watch this kexec_dump demo:

 ** 此处有iframe,请手动处理 ** 

### Kdump: End-to-end flow

Figure 1 shows a flow diagram. Crashkernel memory must be reserved for the capture kernel during booting of the first kernel. You can pass **crashkernel=Y@X** in the kernel command line, where **@X** is optional. **crashkernel=256M** works with most of the x86_64 systems; however, selecting a right amount of memory for the crash kernel is dependent on many factors, such as kernel size and initramfs, as well as runtime memory requirement of modules and applications included in initramfs. See the [kernel-parameters documentation][18] for more ways to pass crash kernel arguments.

![pratyush_f1.png](https://opensource.com/sites/default/files/images/life/pratyush_f1.png)

You can pass kernel and initramfs images to a **kexec** executable as shown in the typical command of section (**kexec-tools**). The capture kernel can be the same as the first kernel or can be different. Typically, keep it the same. Initramfs can be optional; for example, when the kernel is compiled with **CONFIG_INITRAMFS_SOURCE**, you do not need it. Typically, you keep a different capture initramfs from the first initramfs, because automating a copy of vmcore in capture initramfs is better. When **kexec** is executed, it also loads **elfcorehdr** data and the purgatory executable. **elfcorehdr** has information about the system RAM memory organization, and purgatory is a binary that executes before the capture kernel executes and verifies that the second stage binary/data have the correct SHA. Purgatory can be made optional as well.

When the first kernel panics, it does a minimal necessary exit process and switches to purgatory if it exists. Purgatory verifies SHA256 of loaded binaries and, if those are correct, then it passes control to the capture kernel. The capture kernel creates vmcore per the system RAM information received from **elfcorehdr**. Thus, you will see a dump of the first kernel in /proc/vmcore after the capture kernel boots. Depending on the initramfs you have used, you can now analyze the dump, copy it to any disk, or there can be an automated copy followed by reboot to a stable kernel.

### Kernel system calls

The kernel provides two system calls—**kexec_load()** and **kexec_file_load()**, which can be used to load the second kernel when **kexec -l** is executed. It also provides an extra flag for the **reboot()** system call, which can be used to boot into second kernel using **kexec -e**.

**kexec_load()**: The **kexec_load()** system call loads a new kernel that can be executed later by **reboot()**. Its prototype is defined as follows:

```
long kexec_load(unsigned long entry, unsigned long nr_segments,
struct kexec_segment *segments, unsigned long flags);
```

User space needs to pass segments for different components, such as kernel, initramfs, etc. Thus, the **kexec** executable helps in preparing these segments. The structure of **kexec_segment** looks like as follows:

```
struct kexec_segment {
	void *buf;
	/* Buffer in user space */
	size_t bufsz;
	/* Buffer length in user space */
	void *mem;
	/* Physical address of kernel */
	size_t memsz;
	/* Physical address length */
};
```

When **reboot()** is called with **LINUX_REBOOT_CMD_KEXEC**, it boots into a kernel loaded by **kexec_load()**. If a flag **KEXEC_ON_CRASH** is passed to **kexec_load()**, then the loaded kernel will not be executed with **reboot(LINUX_REBOOT_CMD_KEXEC)**; rather, that will be executed on kernel panic. **CONFIG_KEXEC** must be defined to use kexec and **CONFIG_CRASH_DUMP** should be defined for kdump.

**kexec_file_load()**: As a user you pass only two arguments (i.e., kernel and initramfs) to the **kexec** executable. **kexec** then reads data from sysfs or other kernel information source and creates all segments. So, **kexec_file_load()**gives you simplification in user space, where you pass only file descriptors of kernel and initramfs. The rest of the all segment preparation is done by the kernel itself. **CONFIG_KEXEC_FILE** should be enabled to use this system call. Its prototype looks like:

```
long kexec_file_load(int kernel_fd, int initrd_fd, unsigned long
cmdline_len, const char __user * cmdline_ptr, unsigned long
flags);
```

Notice that **kexec_file_load()** also accepts the command line, whereas **kexec_load()** did not. The kernel has different architecture-specific ways to accept the command line. Therefore, **kexec-tools** passes the command-line through one of the segments (like in **dtb** or **ELF boot notes**, etc.) in case of **kexec_load()**.

Currently, **kexec_file_load()** is supported for x86 and PowerPC only.

### What happens when the kernel crashes

When the first kernel panics, before control is passed to the purgatory or capture kernel it does the following:

*   prepares CPU registers (see **crash_setup_regs()** in kernel code);

*   updates vmcoreinfo note (see **crash_save_vmcoreinfo()**);

*   shuts down non-crashing CPUs and saves the prepared registers (see **machine_crash_shutdown()** and **crash_save_cpu()**);

*   you also might need to disable the interrupt controller here;

*   and at the end, it performs the kexec reboot (see **machine_kexec()**), which loads/flushes kexec segments to memory and passes control to the execution of entry segment. Entry segment could be purgatory or start address of next kernel.

### ELF program headers

Most of the dump cores involved in kdump are in ELF format. Thus, understanding ELF Program headers is important, especially if you want to find issues with vmcore preparation. Each ELF file has a program header that:

*   is read by the system loader,

*   describes how the program should be loaded into memory,

*   and one can use **Objdump -p elf_file** to look into program headers.

An example of ELF program headers of a vmcore:

```
# objdump -p vmcore
vmcore:
file format elf64-littleaarch64
Program Header:
NOTE off 0x0000000000010000 vaddr 0x0000000000000000 paddr 0x0000000000000000 align 2**0 filesz
0x00000000000013e8 memsz 0x00000000000013e8 flags ---
LOAD off 0x0000000000020000 vaddr 0xffff000008080000 paddr 0x0000004000280000 align 2**0 filesz
0x0000000001460000 memsz 0x0000000001460000 flags rwx
LOAD off 0x0000000001480000 vaddr 0xffff800000200000 paddr 0x0000004000200000 align 2**0 filesz
0x000000007fc00000 memsz 0x000000007fc00000 flags rwx
LOAD off 0x0000000081080000 vaddr 0xffff8000ffe00000 paddr 0x00000040ffe00000 align 2**0 filesz
0x00000002fa7a0000 memsz 0x00000002fa7a0000 flags rwx
LOAD off 0x000000037b820000 vaddr 0xffff8003fa9e0000 paddr 0x00000043fa9e0000 align 2**0 filesz
0x0000000004fc0000 memsz 0x0000000004fc0000 flags rwx
LOAD off 0x00000003807e0000 vaddr 0xffff8003ff9b0000 paddr 0x00000043ff9b0000 align 2**0 filesz
0x0000000000010000 memsz 0x0000000000010000 flags rwx
LOAD off 0x00000003807f0000 vaddr 0xffff8003ff9f0000 paddr 0x00000043ff9f0000 align 2**0 filesz
0x0000000000610000 memsz 0x0000000000610000 flags rwx
```

In this example, there is one note section and the rest are load sections. The note section has information about CPU notes and load sections have information about copied system RAM components.

Vmcore starts with **elfcorehdr**, which has the same structure as that of a an ELF program header. See the representation of **elfcorehdr** in Figure 2:

![pratyush_f2.png](https://opensource.com/sites/default/files/images/life/pratyush_f2.png)

**kexec-tools** reads /sys/devices/system/cpu/cpu%d/crash_notes and prepares headers for **CPU PT_NOTE**. Similarly, it reads **/sys/kernel/vmcoreinfo** and prepares headers for **vmcoreinfo PT_NOTE**, and reads system RAM values from **/proc/iomem** and prepares memory **PT_LOAD** headers. When the capture kernel receives **elfcorehdr**, it appends data from addresses mentioned in the header and prepares vmcore.

### Crash notes

Crash notes is a per-CPU area for storing CPU states in case of a system crash; it has information about current PID and CPU registers.

### vmcoreinfo

This note section has various kernel debug information, such as struct size, symbol values, page size, etc. Values are parsed by capture kernel and embedded into **/proc/vmcore**. **vmcoreinfo** is used mainly by the **makedumpfile** application. **include/linux/kexec.h** in the Linux kernel has macros to define a new **vmcoreinfo**. Some of the example macros are like these:

*   **VMCOREINFO_PAGESIZE()**

*   **VMCOREINFO_SYMBOL()**

*   **VMCOREINFO_SIZE()**

*   **VMCOREINFO_STRUCT_SIZE()**

### makedumpfile

Much information (such as free pages) in a vmcore is not useful. Makedumpfile is an application that excludes unnecessary pages, such as:

*   pages filled with zeroes,

*   cache pages without private flag (non-private cache);

*   cache pages with private flag (private cache);

*   user process data pages;

*   free pages.

Additionally, makedumpfile compresses **/proc/vmcore** data while copying. It can also erase sensitive symbol information from dump; however, it first needs kernel's debug information to do that. This debug information comes from either **VMLINUX** or **vmcoreinfo**, and its output either can be in ELF format or kdump-compressed format.

Typical usage:

```
# makedumpfile -l --message-level 1 -d 31 /proc/vmcore makedumpfilecore
```

See **man makedumpfile** for detail.

### Debugging kdump issues

Issues that new kdump users might have:

###  _Kexec -p kernel_image_  did not succeed

*   Check whether crash memory is allocated.

*   **cat /sys/kernel/kexec_crash_size** should have no zero value.

*   **cat /proc/iomem | grep "Crash kernel"** should have an allocated range.

*   If not allocated, then pass the proper **crashkernel=** argument in the command line.

*   If nothing shows up, then pass **-d** in the **kexec** command and share the debug output with the kexec-tools mailing list.

### Do not see anything on console after last message from first kernel (such as "bye")

*   Check whether **kexec -l kernel_image** followed by **kexec -e** works.

*   Might be missing architecture- or machine-specific options.

*   Might have purgatory SHA verification failed. If your architecture does not support a console in purgatory, then it is difficult to debug.

*   Might have second kernel crashed early.

*   Pass **earlycon**/**earlyprintk** option for your system to the second kernel command line.

*   Share **dmesg** log of both the first and capture kernel with kexec-tools mailing list.

### Resources

#### fedora-kexec-tools

*   Repository: **git://pkgs.fedoraproject.org/kexec-tools**

*   Mailing list: [kexec@lists.fedoraproject.org][7]

*   Description: Specs file and scripts to provide user-friendly command/services so that **kexec-tools** can be automated in different user scenarios.

#### kexec-tools

*   Repository: git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git

*   Mailing list: [kexec@lists.infradead.org][8]

*   Description: Uses kernel system calls and provides a user command **kexec**.

#### Linux kernel

*   Repository: **git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git**

*   Mailing list: [kexec@lists.infradead.org][9]

*   Description: Implements **kexec_load()**, **kexec_file_load()**, and **reboot()**system call and architecture-specific code, such as **machine_kexec()** and **machine_crash_shutdown()**, etc.

#### Makedumpfile

*   Repository: **git://git.code.sf.net/p/makedumpfile/code**

*   Mailing list: [kexec@lists.infradead.org][10]

*   Description: Compresses and filters unnecessary component from the dumpfile.

 _Learn more in Pratyush Anand's [KDUMP: Usage and Internals][11] talk at LinuxCon ContainerCon CloudOpen China on June 20, 2017._

--------------------------------------------------------------------------------


作者简介：

Pratyush Anand - Pratyush is working with Red Hat as a Linux Kernel Generalist. Primarily, he takes care of several kexec/kdump issues being faced by Red Hat product and upstream. He also handles other kernel debugging/tracing/performance issues around Red Hat supported ARM64 platforms. Apart from Linux Kernel, he has also contributed in upstream kexec-tools and makedumpfile project. He is an open source enthusiast and delivers volunteer lectures in educational institutes for the promotion of FOSS.

-------


via: https://opensource.com/article/17/6/kdump-usage-and-internals

作者：[Pratyush Anand  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pratyushanand
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/article/17/6/kdump-usage-and-internals?rate=7i_-TnAGi8Q9GR7fhULKlQUNJw8KWgzadgMY9TDuiAY
[7]:mailto:kexec@lists.fedoraproject.org
[8]:mailto:kexec@lists.infradead.org
[9]:mailto:kexec@lists.infradead.org
[10]:mailto:kexec@lists.infradead.org
[11]:http://sched.co/AVB4
[12]:https://opensource.com/user/143191/feed
[13]:https://pixabay.com/en/penguins-emperor-antarctic-life-429136/
[14]:https://pixabay.com/en/shoe-boots-home-boots-house-1519804/
[15]:https://creativecommons.org/licenses/by-sa/4.0/
[16]:https://www.kernel.org/doc/Documentation/kdump/kdump.txt
[17]:https://linux.die.net/man/8/kexec
[18]:https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt
[19]:https://opensource.com/users/pratyushanand
