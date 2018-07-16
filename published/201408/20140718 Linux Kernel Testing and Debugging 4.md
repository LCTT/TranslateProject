Linux 内核测试和调试（4）
================================================================================
### 自动测试工具 ###

这里列出一些能满足不同需求的测试工具供你选择。本小节只是简单介绍个大概，并不提供详细操作指南。

#### [AuToTest][1] ####

> AuToTest 是一个全自动测试框架，存在的主要目的就是测试 Linux 内核，当然也可以用来测试其他东西，比如测试一块新硬件是否能稳定工作。AuToTest 是开源软件，以 GPL 方式授权，运行于 server-client 架构（即 C/S 架构）。你可以通过配置 server 端来对运行了 client 端的系统执行初始化、运行与监测工作，也可以自己在目标系统上让 client 运行起来。另外你可以为这个测试框架添加测试用例，详情请参考[AuToTest 白皮书][2]。

#### Linaro Automated Validation Architecture ####

> LAVA 自动测试框架用于自动安装于运行测试。举个例子：你在 LAVA 里面只需运行几个命令就可以跑 LTP（LCTT：Linux Test Project，中文是 Linux 测试计划，SGI发起并由IBM负责维护，目的是为开源社区提供测试套件来验证Linux的可靠性、健壮性和稳定性）。通过 LAVA 命令可以自动为你安装 LTP 所需要的所有依赖包，下载源码、编译编码、将 LTP 安装到某个独立的地方，方便卸载 LTP 时能移除所有二进制文件。安装好 LTP 后，运行 LAVA 命令时添加 'ltp' 选项就可以运行 LTP 测试任务了，它会将测试结果以文件方式保存下来，文件名包含测试名称、时间戳。这些测试结果可以留着供以后参考。这是个发现软件退化（如果软件退化了的话）的好方法。下面列出 LAVA 配合 LTP 使用的一些命令：

显示 LAVA 支持的测试列表：

    lava-test list-tests 

安装测试套件：

    lava-test install ltp 

运行测试：

    lava-test run ltp 

查看结果：

    lava-test results show ltp-timestamp.0 

卸载测试套件：

    lava-test uninstall ltp 

### 内核调试功能 ###

Linux 内核本身包含很多调试功能，比如 kmemcheck 和 kmemleak。

#### kmemcheck ####

> kmemcheck 是一个动态检查工具，可以检测出一些未被初始化的内存（LCTT：内核态使用这些内存可能会造成系统崩溃）并发出警告。它的功能与 Valgrind 类似，只是 Valgrind 运行在用户态，而 kmemchecke 运行在内核态。编译内核时加上 `CONFIG_KMEMCHECK` 选项打开 kmemcheck 调试功能。你可以阅读 Documentation/kmemcheck.txt 来学习如何配置使用这个功能，以及如何看懂调试结果。

#### kmemleak ####

> kmemleak 通过类似于垃圾收集器的功能来检测内核是否有内存泄漏问题。而 kmemleak 与垃圾收集器的不同之处在于前者不会释放孤儿目标（LCTT：不会再被使用的、应该被释放而没被释放的内存区域），而是将它们打印到 /sys/kernel/debug/kmemleak 文件中。用户态的 Valgrind 也有一个类似的功能，使用 --leak-check 选项可以检测并报错内存泄漏问题，但并不释放这个孤儿内存。编译内核时使用 `CONFIG_DEBUG_KMEMLEAK` 选项打开 kmemcleak 调试功能。阅读 Documentation/kmemleak.txt 来学习怎么使用这个工具并读懂调试结果。

### 内核调试接口 ###

Linux 内核通过配置选项、调试用的 API、接口和框架来支持动态或静态的调试。我们现在就好好学习学习这些牛逼的功能，从静态编译选项开始讲。

### 调试配置选项：静态编译 ###

大部分 Linux 内核以及内核模块都包含调试选项，你只要在编译内核或内核模块的时候添加这个静态调试选项，程序运行时后就会产生调试信息，并记录在 dmesg 缓存中。

### 调试的 API ###

调试 API 的一个很好的例子是 DMA-debug，用来调试驱动是否错误使用了 DMA 提供的 API。它会跟踪每个设备的映射关系，检测程序有没有试图为一些根本不存在的映射执行“取消映射”操作，检测代码建立 DMA 映射后可能产生的“映射丢失”的错误。内核配置选项 `CONFIG_HAVE_DMA_APT_DEBUG` 和 `CONFIG_DMA_API_DEBUG` 可以为内核提供这个功能。其中，`CONFIG_DMA_API_DEBUG` 选项启用后，内核调用 DMA 的 API 的同时也会调用 Debug-dma 接口。举例来说，当一个驱动调用 `dma_map_page()` 函数来映射一个 DMA 缓存时，`dma_map_page()` 会调用`debug_dma_map_page()` 函数来跟踪这个缓存，直到驱动调用 `dma_unmap_page()` 来取消映射。详细内容请参考[使用 DMA 调试 API 检测潜在的数据污染和内存泄漏问题][3]。

### 动态调试 ###

动态调试功能就是你可以决定在程序运行过程中是否要 `pr_debug()`, `dev_dbg()`, `print_hex_dump_debug()`, `print_hex_dump_bytes()` 这些函数正常运行起来。什么意思？当程序运行过程中出现错误时，你可以指定程序打印有针对性的、详细的调试信息。这功能牛逼极了，我们不再需要为了添加调试代码定位一个问题，而重新编译安装内核。你可以指定 `CONDIF_DYNAMIC_DEBUG` 选项打开动态调试功能，然后通过 `/sys/kernel/debug/dynamic_debug/control` 接口指定要打印哪些调试日志。下面分别列出代码级别和模块级别打印日志的操作方法：

让 kernel/power/suspend.c 源码第340行的 `pr_debug()` 函数打印日志：

    echo 'file suspend.c line 340 +p' > /sys/kernel/debug/dynamic_debug/control

让内核模块在加载过程中打开动态调试功能：

> 使用 modprobe 命令加在模块时加上 dyndbg='plmft' 选项。

让内核模块的动态调试功能在重启后依然有效：

> 编辑 /etc/modprobe.d/modname.conf 文件（没有这个文件就创建一个），添加 dyndbg='plmft' 选项。然而对于哪些通过 initramfs 加载的驱动来说，这个配置基本无效（LCTT：免费奉送点比较高级的知识哈。系统启动时，需要先让 initramfs 挂载一个虚拟的文件系统，然后再挂载启动盘上的真实文件系统。这个虚拟文件系统里面的文件是 initramfs 自己提供的，也就是说你在真实的文件系统下面配置了 /etc/modprobe.d/modname.conf 这个文件，initramfs 是压根不去理会的。站在内核驱动的角度看：如果内核驱动在 initramfs 过程中被加载到内核，这个驱动读取到的 /etc/modprobe.d/modname.conf 是 initramfs 提供的，而不是你编辑的那个。所以会有上述“写了配置文件后重启依然无效”的结论）。对于这种刁民，呃，刁驱动，我们需要修改 grub 配置文件，在 kernel 那一行添加 module.dyndbg='plmft' 参数，这样你的驱动就可以开机启动动态调试功能了。

想打印更详细的调试信息，可以使用 `dynamic_debug.verbose=1` 选项。参考 Documentation/dynamic-debug-howto.txt 文件获取更多信息。

### 设置追踪点 ###

到目前为止，我们介绍了多种动态和静态调试方法。静态调试选项和静态调试钩子函数（比如 DMA Debug API）需要的编译过程打开或关闭，导致了一个难过的事实：需要重新编译安装内核。而动态编译功能省去了“重新编译”这件麻烦事，但是也有不足的地方，就是调试代码引入了条件变量，用于判断是否打印调试信息。这种方法可以让你在程序运行时决定是否打印日志，但需要执行额外的判断过程。“追踪点”代码只会在程序运行过程中使用“追踪点”功能才会被触发。也就是说，“追踪点”代码与上述说的两种方法都不一样。当用不到它时，它不会运行（LCTT：动态调试的话，代码每次都需要查看下变量，然后判断是否需要打印日志；而“追踪点”貌似利用某种触发机制，不需要每次都去查看变量）。当你需要用到它时，程序的代码会把“追踪点”代码包含进去。它不会添加任何条件变量来增加系统的运行负担。

详细信息请参考[布置追踪代码的小技巧][4]。

### “追踪点”的原理 ###

追踪点使用“跳跃标签”，这是一种使用分支跳转的编码修正（code modification）技术。

当关闭追踪点的时候，其伪代码看起来时这样的：

    [ code1 ]
    nop
    back:
    [ code2 ]
    return;
    tracepoint:
    [ tracepoint code ]
    jmp back;

当打开追踪点的时候，其伪代码看起来时这样的：（注意追踪点代码出现的位置）

    [ code1 ]
    jmp tracepoint
    back:
    [ code2 ]
    return;
    tracepoint:
    [ tracepoint code ]
    jmp back;

（LCTT：咳咳，解释解释上面两段伪代码吧，能看懂的大神请忽略这段注释。不使用追踪点时，代码运行过程是：code1->code2->return结束；使用追踪点时，代码运行过程是：code1->跳到tracepoint code执行调试代码->跳回code2->return结束。两段代码的唯一区别就是第二行，前者为 nop（不做任何操作），后者为 jmp tracepoint （跳到调试代码）。）

### Linux 电源管理子系统的测试 ###

使用静态调试、动态调试和追踪调试技术，我们来跑一下磁盘的电源管理测试。当系统被挂起时，内核会为磁盘创建一个休眠镜像，使磁盘进入休眠模式，当系统重新被唤醒时，内核又利用这个休眠镜像重新唤醒磁盘。

设置挂起设备与唤醒设备需要的时间：

    echo 1 > /sys/power/pm_print_times

以 reboot 模式挂起磁盘：

    echo reboot > /sys/power/disk
    echo disk > /sys/power/state

以 shutdown 模式挂起磁盘 —— 与 reboot 模式一样，只是重新唤醒磁盘的话还需要电源提供。

    echo shutdown > /sys/power/disk
    echo disk > /sys/power/state

以 platform 模式挂起磁盘 —— 能测试更多内容，比如 BIOS 挂起和唤醒，会涉及到 ACPI 功能。我们推荐你使用这种方式，把 BIOS 也拉下水陪你玩挂起和唤醒游戏。

    echo platform > /sys/power/disk
    echo disk > /sys/power/state

--------------------------------------------------------------------------------

via:http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,3 

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://autotest.github.io/
[2]:https://github.com/autotest/autotest/wiki/WhitePaper
[3]:http://events.linuxfoundation.org/sites/events/files/slides/Shuah_Khan_dma_map_error.pdf
[4]:http://www.linuxjournal.com/content/july-2013-linux-kernel-news
