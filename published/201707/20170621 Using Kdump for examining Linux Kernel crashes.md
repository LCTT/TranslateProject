使用 Kdump 检查 Linux 内核崩溃
============================================================

> 让我们先看一下 kdump 的基本使用方法，和 kdump/kexec 在内核中是如何实现。

![Using Kdump for examining Linux Kernel crashes](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/linux_boot.png?itok=pSGmf8Ca "Using Kdump for examining Linux Kernel crashes")

[kdump][16] 是获取崩溃的 Linux 内核转储的一种方法，但是想找到解释其使用和内部结构的文档可能有点困难。在本文中，我将研究 kdump 的基本使用方法，和 kdump/kexec 在内核中是如何实现。

[kexec][17] 是一个 Linux 内核到内核的引导加载程序，可以帮助从第一个内核的上下文引导到第二个内核。kexec 会关闭第一个内核，绕过 BIOS 或固件阶段，并跳转到第二个内核。因此，在没有 BIOS 阶段的情况下，重新启动变得更快。

kdump 可以与 kexec 应用程序一起使用 —— 例如，当第一个内核崩溃时第二个内核启动，第二个内核用于复制第一个内核的内存转储，可以使用 `gdb` 和 `crash` 等工具分析崩溃的原因。（在本文中，我将使用术语“第一内核”作为当前运行的内核，“第二内核” 作为使用 kexec 运行的内核，“捕获内核” 表示在当前内核崩溃时运行的内核。）

kexec 机制在内核以及用户空间中都有组件。内核提供了几个用于 kexec 重启功能的系统调用。名为 kexec-tools 的用户空间工具使用这些调用，并提供可执行文件来加载和引导“第二内核”。有的发行版还会在 kexec-tools 上添加封装器，这有助于捕获并保存各种转储目标配置的转储。在本文中，我将使用名为 distro-kexec-tools 的工具来避免上游 kexec 工具和特定于发行版的 kexec-tools 代码之间的混淆。我的例子将使用 Fedora Linux 发行版。

### Fedora kexec-tools 工具

使用 `dnf install kexec-tools` 命令在 Fedora 机器上安装 fedora-kexec-tools。在安装 fedora-kexec-tools 后可以执行 `systemctl start kdump` 命令来启动 kdump 服务。当此服务启动时，它将创建一个根文件系统（initramfs），其中包含了要挂载到目标位置的资源，以保存 vmcore，以及用来复制和转储 vmcore 到目标位置的命令。然后，该服务将内核和 initramfs 加载到崩溃内核区域内的合适位置，以便在内核崩溃时可以执行它们。

Fedora 封装器提供了两个用户配置文件：

1.  `/etc/kdump.conf` 指定修改后需要重建 initramfs 的配置参数。例如，如果将转储目标从本地磁盘更改为 NFS 挂载的磁盘，则需要由“捕获内核”所加载的 NFS 相关的内核模块。
2.  `/etc/sysconfig/kdump` 指定修改后不需要重新构建 initramfs 的配置参数。例如，如果只需修改传递给“捕获内核”的命令行参数，则不需要重新构建 initramfs。

如果内核在 kdump 服务启动之后出现故障，那么“捕获内核”就会执行，其将进一步执行 initramfs 中的 vmcore 保存过程，然后重新启动到稳定的内核。

### kexec-tools 工具

编译 kexec-tools 的源代码得到了一个名为 `kexec` 的可执行文件。这个同名的可执行文件可用于加载和执行“第二内核”，或加载“捕获内核”，它可以在内核崩溃时执行。

加载“第二内核”的命令：

```
# kexec -l kernel.img --initrd=initramfs-image.img –reuse-cmdline
```

`--reuse-command` 参数表示使用与“第一内核”相同的命令行。使用 `--initrd` 传递 initramfs。 `-l` 表明你正在加载“第二内核”，其可以由 `kexec` 应用程序本身执行（`kexec -e`）。使用 `-l` 加载的内核不能在内核崩溃时执行。为了加载可以在内核崩溃时执行的“捕获内核”，必须传递参数 `-p` 取代 `-l`。

加载捕获内核的命令：

```
# kexec -p kernel.img --initrd=initramfs-image.img –reuse-cmdline
```

`echo c > /pros/sysrq-trigger` 可用于使内核崩溃以进行测试。有关 kexec-tools 提供的选项的详细信息，请参阅 `man kexec`。在转到下一个部分之前，请看这个 kexec_dump 的演示：

[kexec_dump_demo (YouTube)](https://www.youtube.com/embed/iOq_rJhrKhA?rel=0&origin=https://opensource.com&enablejsapi=1)

### kdump: 端到端流

下图展示了流程图。必须在引导“第一内核”期间为捕获内核保留 crashkernel 的内存。您可以在内核命令行中传递 `crashkernel=Y@X`，其中 `@X` 是可选的。`crashkernel=256M` 适用于大多数 x86_64 系统；然而，为崩溃内核选择适当的内存取决于许多因素，如内核大小和 initramfs，以及 initramfs 中包含的模块和应用程序运行时的内存需求。有关传递崩溃内核参数的更多方法，请参阅 [kernel-parameters 文档][18]。

![pratyush_f1.png](https://opensource.com/sites/default/files/images/life/pratyush_f1.png)

您可以将内核和 initramfs 镜像传递给 `kexec` 可执行文件，如（`kexec-tools`）部分的命令所示。“捕获内核”可以与“第一内核”相同，也可以不同。通常，一样即可。Initramfs 是可选的；例如，当内核使用 `CONFIG_INITRAMFS_SOURCE` 编译时，您不需要它。通常，从第一个 initramfs 中保存一个不一样的捕获 initramfs，因为在捕获 initramfs 中自动执行 vmcore 的副本能获得更好的效果。当执行 `kexec` 时，它还加载了 `elfcorehdr` 数据和 purgatory 可执行文件（LCTT 译注：purgatory 就是一个引导加载程序，是为 kdump 定作的。它被赋予了“炼狱”这样一个古怪的名字应该只是一种调侃）。 `elfcorehdr` 具有关于系统内存组织的信息，而 purgatory 可以在“捕获内核”执行之前执行并验证第二阶段的二进制或数据是否具有正确的 SHA。purgatory 也是可选的。

当“第一内核”崩溃时，它执行必要的退出过程并切换到 purgatory（如果存在）。purgatory 验证加载二进制文件的 SHA256，如果是正确的，则将控制权传递给“捕获内核”。“捕获内核”根据从 `elfcorehdr` 接收到的系统内存信息创建 vmcore。因此，“捕获内核”启动后，您将看到 `/proc/vmcore` 中“第一内核”的转储。根据您使用的 initramfs，您现在可以分析转储，将其复制到任何磁盘，也可以是自动复制的，然后重新启动到稳定的内核。

### 内核系统调用

内核提供了两个系统调用：`kexec_load()` 和 `kexec_file_load()`，可以用于在执行 `kexec -l` 时加载“第二内核”。它还为 `reboot()` 系统调用提供了一个额外的标志，可用于使用 `kexec -e` 引导到“第二内核”。

`kexec_load()`：`kexec_load()` 系统调用加载一个可以在之后通过 `reboot()` 执行的新的内核。其原型定义如下：

```
long kexec_load(unsigned long entry, unsigned long nr_segments,
struct kexec_segment *segments, unsigned long flags);
```

用户空间需要为不同的组件传递不同的段，如内核，initramfs 等。因此，`kexec` 可执行文件有助于准备这些段。`kexec_segment` 的结构如下所示：

```
struct kexec_segment {
	void *buf;
	/* 用户空间缓冲区 */
	size_t bufsz;
	/* 用户空间中的缓冲区长度 */
	void *mem;
	/* 内核的物理地址 */
	size_t memsz;
	/* 物理地址长度 */
};
```

当使用 `LINUX_REBOOT_CMD_KEXEC` 调用 `reboot()` 时，它会引导进入由 `kexec_load` 加载的内核。如果标志 `KEXEC_ON_CRASH` 被传递给 `kexec_load()`，则加载的内核将不会使用 `reboot(LINUX_REBOOT_CMD_KEXEC)` 来启动；相反，这将在内核崩溃中执行。必须定义 `CONFIG_KEXEC` 才能使用 `kexec`，并且为 `kdump` 定义 `CONFIG_CRASH_DUMP`。

`kexec_file_load()`：作为用户，你只需传递两个参数（即 `kernel` 和 `initramfs`）到 `kexec` 可执行文件。然后，`kexec` 从 sysfs 或其他内核信息源中读取数据，并创建所有段。所以使用 `kexec_file_load()` 可以简化用户空间，只传递内核和 initramfs 的文件描述符。其余部分由内核本身完成。使用此系统调用时应该启用 `CONFIG_KEXEC_FILE`。它的原型如下：

```
long kexec_file_load(int kernel_fd, int initrd_fd, unsigned long
cmdline_len, const char __user * cmdline_ptr, unsigned long
flags);
```

请注意，`kexec_file_load` 也可以接受命令行，而 `kexec_load()` 不行。内核根据不同的系统架构来接受和执行命令行。因此，在 `kexec_load()` 的情况下，`kexec-tools` 将通过其中一个段（如在 dtb 或 ELF 引导注释等）中传递命令行。

目前，`kexec_file_load()` 仅支持 x86 和 PowerPC。

#### 当内核崩溃时会发生什么

当第一个内核崩溃时，在控制权传递给 purgatory 或“捕获内核”之前，会执行以下操作：

*   准备 CPU 寄存器（参见内核代码中的 `crash_setup_regs()`）;
*   更新 vmcoreinfo 备注（请参阅 `crash_save_vmcoreinfo()`）;
*   关闭非崩溃的 CPU 并保存准备好的寄存器（请参阅 `machine_crash_shutdown()` 和 `crash_save_cpu()`）;
*   您可能需要在此处禁用中断控制器；
*   最后，它执行 kexec 重新启动（请参阅 `machine_kexec()`），它将加载或刷新 kexec 段到内存，并将控制权传递给进入段的执行文件。输入段可以是下一个内核的 purgatory 或开始地址。

#### ELF 程序头

kdump 中涉及的大多数转储核心都是 ELF 格式。因此，理解 ELF 程序头部很重要，特别是当您想要找到 vmcore 准备的问题。每个 ELF 文件都有一个程序头：

*   由系统加载器读取，
*   描述如何将程序加载到内存中，
*   可以使用 `Objdump -p elf_file` 来查看程序头。

vmcore 的 ELF 程序头的示例如下：

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

在这个例子中，有一个 note 段，其余的是 load 段。note 段提供了有关 CPU 信息，load 段提供了关于复制的系统内存组件的信息。

vmcore 从 `elfcorehdr` 开始，它具有与 ELF 程序头相同的结构。参见下图中 `elfcorehdr` 的表示：

![pratyush_f2.png](https://opensource.com/sites/default/files/images/life/pratyush_f2.png)

`kexec-tools` 读取 `/sys/devices/system/cpu/cpu%d/crash_notes` 并准备 `CPU PT_NOTE` 的标头。同样，它读取 `/sys/kernel/vmcoreinfo` 并准备 `vmcoreinfo PT_NOTE` 的标头，从 `/proc/iomem` 读取系统内存并准备存储器 `PT_LOAD` 标头。当“捕获内核”接收到 `elfcorehdr` 时，它从标头中提到的地址中读取数据，并准备 vmcore。

#### Crash note

Crash notes 是每个 CPU 中用于在系统崩溃的情况下存储 CPU 状态的区域；它有关于当前 PID 和 CPU 寄存器的信息。

#### vmcoreinfo

该 note 段具有各种内核调试信息，如结构体大小、符号值、页面大小等。这些值由捕获内核解析并嵌入到 `/proc/vmcore` 中。 `vmcoreinfo` 主要由 `makedumpfile` 应用程序使用。在 Linux 内核，`include/linux/kexec.h` 宏定义了一个新的 `vmcoreinfo`。 一些示例宏如下所示：

*   `VMCOREINFO_PAGESIZE()`
*   `VMCOREINFO_SYMBOL()`
*   `VMCOREINFO_SIZE()`
*   `VMCOREINFO_STRUCT_SIZE()`

#### makedumpfile

vmcore 中的许多信息（如可用页面）都没有用处。`makedumpfile` 是一个用于排除不必要的页面的应用程序，如：

*   填满零的页面；
*   没有私有标志的缓存页面（非专用缓存）;
*   具有私有标志的缓存页面（专用缓存）;
*   用户进程数据页；
*   可用页面。

此外，`makedumpfile` 在复制时压缩 `/proc/vmcore` 的数据。它也可以从转储中删除敏感的符号信息； 然而，为了做到这一点，它首先需要内核的调试信息。该调试信息来自 `VMLINUX` 或 `vmcoreinfo`，其输出可以是 ELF 格式或 kdump 压缩格式。

典型用法：

```
# makedumpfile -l --message-level 1 -d 31 /proc/vmcore makedumpfilecore
```

详细信息请参阅 `man makedumpfile`。

### kdump 调试

新手在使用 kdump 时可能会遇到的问题：

####  `Kexec -p kernel_image`  没有成功

*   检查是否分配了崩溃内存。
*   `cat /sys/kernel/kexec_crash_size` 不应该有零值。
*   `cat /proc/iomem | grep "Crash kernel"` 应该有一个分配的范围。
*   如果未分配，则在命令行中传递正确的 `crashkernel=` 参数。
*   如果没有显示，则在 `kexec` 命令中传递参数 `-d`，并将输出信息发送到 kexec-tools 邮件列表。

#### 在“第一内核”的最后一个消息之后，在控制台上看不到任何东西（比如“bye”）

*   检查 `kexec -e` 之后的 `kexec -l kernel_image` 命令是否工作。
*   可能缺少支持的体系结构或特定机器的选项。
*   可能是 purgatory 的 SHA 验证失败。如果您的体系结构不支持 purgatory 中的控制台，则很难进行调试。
*   可能是“第二内核”早已崩溃。
*   将您的系统的 `earlycon` 或 `earlyprintk` 选项传递给“第二内核”的命令行。
*   使用 kexec-tools 邮件列表共享第一个内核和捕获内核的 `dmesg` 日志。

### 资源

#### fedora-kexec-tools

*   GitHub 仓库：`git://pkgs.fedoraproject.org/kexec-tools`
*   邮件列表：[kexec@lists.fedoraproject.org][7]
*   说明：Specs 文件和脚本提供了用户友好的命令和服务，以便 `kexec-tools` 可以在不同的用户场景下实现自动化。

#### kexec-tools

*   GitHub 仓库：git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
*   邮件列表：[kexec@lists.infradead.org][8]
*   说明：使用内核系统调用并提供用户命令 `kexec`。

#### Linux kernel

*   GitHub 仓库： `git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git`
*   邮件列表：[kexec@lists.infradead.org][9]
*   说明：实现了 `kexec_load()`、`kexec_file_load()`、`reboot()` 系统调用和特定体系结构的代码，例如 `machine_kexec()` 和 `machine_crash_shutdown()`。

#### Makedumpfile

*   GitHub 仓库： `git://git.code.sf.net/p/makedumpfile/code`
*   邮件列表：[kexec@lists.infradead.org][10]
*   说明：从转储文件中压缩和过滤不必要的组件。

（题图：[Penguin][13]、 [Boot][14]，修改：Opensource.com. [CC BY-SA 4.0][15]）

--------------------------------------------------------------------------------


作者简介：

Pratyush Anand - Pratyush 正在以以为 Linux 内核专家的身份与 Red Hat 合作。他主要负责 Red Hat 产品和上游所面临的几个 kexec/kdump 问题。他还处理 Red Hat 支持的 ARM64 平台周围的其他内核调试、跟踪和性能问题。除了 Linux 内核，他还在上游的 kexec-tools 和 makedumpfile 项目中做出了贡献。他是一名开源爱好者，并在教育机构举办志愿者讲座，促进了 FOSS。

-------


via: https://opensource.com/article/17/6/kdump-usage-and-internals

作者：[Pratyush Anand][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

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
