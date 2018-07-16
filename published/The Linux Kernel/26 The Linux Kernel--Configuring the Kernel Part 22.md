戴文的Linux内核专题：26 配置内核 (22)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.703/.jpg)

你好！本篇我们将继续配置"kernel hacks",接着我们会配置整个安全系统。

Alpha和s390处理器需要配置下一个特性(Force weak per-cpu definitions)。这个特性修复了一个在这类处理器中普遍存在的寻址问题。其他的处理器无需启用这个特性。

内核转储可以用这个特殊的调试工具测试(Linux Kernel Dump Test Tool Module)。这个软件会允许内核开发者触发一个假错误来导致内核转储。内核开发者可以保证转储成功执行。

内核提供了不同的错误注射模块来允许内核开发者测试通知(CPU notifier error injection module)、 (PM notifier error injection module) 和 (Memory hotplug notifier error injection module)。通知器提醒系统硬件还在，这对热插拔很重要。这些错误注射模块在这些通知系统中触发一个错误，那么开发者就可以测试通知系统的错误处理能力了。

"Fault-injection framework"驱动提供了不同的用于测试错误处理的工具。

"Latency measuring infrastructure"驱动提供了延迟检测工具LatencyTop，以找出用户空间中由于内核执行/任务而被阻碍/干扰的对象。

下面，我们有一个子菜单名为"Tracers"，它包含了不同追踪器的列表。追踪器是一段监视不同内核函数的代码。每次某个特定的函数启动，追踪器将被调用来检测函数。

下面的模块用来测试红黑树库的性能(Red-Black tree test)。红黑树是一个排序和搜索算法。

下面的特性是相同的除了用来测试区间树库(Interval tree test)。

在启动远程特定系统时，内核同样可以在其他系统上调试FireWire (Remote debugging over FireWire early on boot) 和 (Remote debugging over FireWire with firewire-ohci)。

printk()函数可以用来打印不同的调试信息，如果这个特性启用的话(Enable dynamic printk() support)。"printk()"是一个常被讨论的系统调用，所以记住这个打印内核相关消息。

这是一个直接内存访问(DMA)调试驱动(Enable debugging of DMA-API usage)。

Atomic64自我测试检查系统是否支持原子操作(Perform an atomic64_t self-test at boot)。这是一个32位系统执行64位操作。

这个驱动提供了对于所有可能的RAID6恢复系统的自检(Self test for hardware accelerated raid6 recovery)。

注意：自检是底层测试并且在绝大多数系统硬件和软件开启和执行前侦查软件。自检搜索硬件，失败的设备等等。自检也可能被编成应用以测试它本身。

在"Kernel Hacking"菜单中(如果你是用的是像ncurses那样的菜单接口)，有一个名为"Sample kernel code"的子菜单。在以后的文章中，我们会讨论如何实现自定义/自制内核模块。只要记住这里是启用你自己的模块。

![](http://www.linux.org/attachments/kernel_22-png.704/)

Kernel GNU DeBugger (KGDB)(内核调试器)有许多特性可以启用或者禁用(KGDB: kernel debugger)。这个调试器只工作在通过串行连接的两个Linux系统之间。

这个特性提供在启动时显示额外bzimage解压消息(Enable verbose x86 bootup info messages)。在内核配置的开始部分你设置了内核加密。

printk()打印不同的消息到dmsg的启动界面，但是在串行和控制台驱动加载后。启用这个驱动会使printk()更早打印信息(Early printk)。

下一个驱动和上面的一样，但是使用EHCI端口(Early printk via EHCI debug port)。

内核可以被设置来观察堆栈溢出，这样内核可以更好地管理错误(Check for stack overflows)。内核会执行的更慢，但是溢出不会造成如此大的损害。

通过启用这个，内核页面可用debugfs见到(Export kernel pagetable layout to userspace via debugfs)。然而，这个会使内核变慢。这个用于调试目的。

内核的写入错误可以被这个特性捕捉到(Write protect kernel read-only data structures)。这个选项会使内核的只读数据编程进入写保护模式。此调试工具会损害内核的速度。该调试工具还有一个用来调试其自身的工具(Testcase for the DEBUG_RODATA feature)。

为了防止被修改过代码的模块执行(由于一个错误)，接着启用这个保护性特性 (Set loadable kernel module data as NX and text as RO)。这个调试工具由这个驱动提供(Testcase for the NX non-executable stack feature)。

使用这个选项，内核可以一次刷新一个TLB条目或者整张表 (Set upper limit of TLB entries to flush one-by-one)。

下一个特性是IOMMU调试特性(Enable IOMMU debugging)。这是另外一个调试测试，禁用一些IOMMU特性来用于测试稳定性(Enable IOMMU stress-test mode)。IOMMU代表"input/output memory management unit"(输入/输出内存管理单元)。

启用这个选项回事内核以30s的间隔在change_page_attr()系统调用上执行单端测试。这个系统调用会改变页的属性。

任何被标以"inline"的内核代码，如果没有被表明的也同样会被GCC操作(Allow gcc to uninline functions marked)。GCC编译器会增加使得代码更好的代码(GCC擅长这么做)。然而，一些代码不想被GCC操作。

下面的驱动提供了对"copy_from_user()"系统调用的基本测试（Strict copy size checks)。copy_fcrom_user()从用户空间拷贝数据块到内核空间中。

这里还有一个自检；它用于NMI(NMI Selftest)。

现在，我们会进入"Security Options"，如果你使用像ncurses的基于菜单的接口时。第一个选项允许访问内核中存储的键和验证令牌(Enable access key retention support)。这有很多原因用到，像访问加密文件系统。

下面的选项用于创建并密封/开启键((TRUSTED KEYS))。加密的键使用这个驱动加密/解密(ENCRYPTED KEYS)。

启用这个特性键可以在/proc中看到(Enable the /proc/keys file by which keys may be viewed)。

使用这个安全特性，额外的限制可以应用到syslog中(Restrict unprivileged access to the kernel syslog)。

如果启用这个选项，那么用户可以选择不同的安全模块(Enable different security models)。不然，将会使用默认。如果你不完全理解安全或者如果你对使用默认感到没问题，那么就禁用它。

这个驱动提供了securityfs文件系统(Enable the securityfs filesystem)。

当启用这个特性后，钩子将会被增加到网络和套接字安全中(Socket and Networking Security Hooks)。这些钩子是访问控制。

IPSec网络钩子(also called XFRM networking hooks)在这个选项启用后实现(XFRM (IPSec) Networking Security Hooks)。安全钩子同样可被文件使用(Security hooks for pathname based access control)。

下一个驱动提供了对Intel可信赖执行技术的支持(Enable Intel(R) Trusted Execution Technology (Intel(R) TXT))。

用户可以设置无法为用户空间保留的内存寻址范围(Low address space for LSM to protect from user allocation)。开始点是0。用户在此选项中输入结束点。对于大多数平台而言，65536是一个建议值。

SELinux(在内核安全的文章中提到)是一种流行的Linux安全模块(NSA SELinux Support)。SELinux存在很多选项和特性。启动参数决定了当内核执行(NSA SELinux boot parameter)时SELinux是否启动{1}或者不启动{0}。SELinux可以被配置成在root用户需要时临时禁止(NSA SELinux runtime disable)。用户可以启用这个特性开发并测试新的策略(NSA SELinux Development Support)。AVC统计被这个特性收集并被存储 (NSA SELinux AVC Statistics)。对于checkreqprot标志有一个默认设置；"1"意味着SElinux会检查应用请求的保护，"0"会默认使用内核对mmap和mprotect系统调用的保护(NSA SELinux checkreqprot default value)。存在很多的SElinux策略;用户可以设置他们不希望SELinux excede的最新版本(NSA SELinux maximum supported policy format version)。

另外一个Linux安全模块(LSM),SMACK,也被内核支持(Simplified Mandatory Access Control Kernel Support)。

TOMOYO是另外一个被支持的LSM(TOMOYO Linux Support)。在学习模式中允许被添加的最大条目数目在下面的特性中设置(Default maximal count for audit log)。接下来，这个选项允许/禁用TOMOYO在没有策略加载器下被激活(Activate without calling userspace policy loader)。策略加载器的位置在这里被配置((/sbin/tomoyo-init) Location of userspace policy loader)，触发执行的可执行文件在这里设置((/sbin/init) Trigger for calling userspace policy loader)。

再说一次，内核支持另外一个LSM - APPArmor(AppArmor support)。像SELinux一样，可以为AppArmor设置默认的启动参数(AppArmor boot parameter default value)。

Yama是另外一个LSM(Yama support)。如果启用这个特性Yama可以与另外一个LSM一起使用(Yama stacked with other LSMs)。

这个驱动让内核可以使用多个密钥链来验证进程(Digital signature verification using multiple keyrings)。

非对称键在这个特性中支持(Enable asymmetric keys support)。

内核可以保存并维护一个哈希和重要系统文件的列表(Integrity Measurement Architecture(IMA))。那么，如果恶意软件改变了一个重要的文件，内核会知道因为文件或者可执行文件被使用时内核会检测哈希值。强烈建议启用这个特性。

如果启用这个特性会加入额外的安全属性(EVM support)。可以用下面的选项设置版本(EVM HMAC version)。有两个选项分别是version 1和2。

记住所有的Linux安全模块的不同了么(LSMs)？好的，下面可以设置默认模块(Default security module (AppArmor))。

下一篇中，我们会配置"Cryptographic API"。我估计还会剩下两篇文章。在这之后，我们会讨论其他的内核主题。

先睹为快：本篇之后，关于配置还有一篇。接着，我们会完成编译并安装内核。

致我的粉丝：你随意给我致信或者给我电子邮件来建议你希望在以后的内核文章中想要看到的主题。我已经收到了一些来自这个系列读者的一些建议。请随意给我更多建议。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-22.5017/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出