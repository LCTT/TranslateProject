戴文的Linux内核专题：05 配置内核 (1)
================================================================================

![](http://www.linux.org/attachments/slide-jpg.299/)

现在我们已经了解了内核，现在我们可以进入主要工作：配置并编译内核代码。配置内核代码并不会花费太长时间。配置工具会询问许多问题并且允许开发者配置内核的每个方面。如果你有不确定的问题或者特性，你最好使用配置工具提供的默认值。本系列教程会使读者逐步了解配置内核的整个过程。

配置代码前需要在源文件的文件夹内打开一个终端。当终端打开后，基于你喜好的配置界面，这里有几种不同的配置方法：

- make config - 纯文本界面 (最常用的选择)。
- make menuconfig - 基于文本彩色菜单和单选列表。这个选项可以加快开发者开发速度。需要安装ncurses(ncurses-devel)。
- make nconfig - 基于文本的彩色菜单。需要安装curses (libcdk5-dev)。
- make xconfig - QT/X-windows 界面。需要安装QT。 
- make gconfig - Gtk/X-windows 界面。需要安装GTK。
- make oldconfig - 纯文本界面，但是其默认的问题是基于已有的本地配置文件。
- make silentoldconfig - 和oldconfig相似，但是不会显示配置文件中已有的问题的回答。
- make olddefconfig -和silentoldconfig相似，但有些问题已经以它们的默认值选择。
- make defconfig - 这个选项将会创建一份以当前系统架构为基础的默认设置文件。
- make ${PLATFORM}\_defconfig -  创建一份使用arch/$ARCH/configs/${PLATFORM}\_defconfig中的值的配置文件。
- make allyesconfig - 这个选项将会创建一份尽可能多的问题回答都为‘yes’的配置文件。
- make allmodconfig - 这个选项将会创建一份将尽可能多的内核部分配置为模块的配置文件。

> 注意：内核代码可以放进内核自身，也可以成为一个模块。例如，用户可以将蓝牙驱动作为一个模块加入(独立于内核)，或者直接放到内核里，或者完全不加蓝牙驱动。当代码放到内核本身时，内核将会请求更多的内存并且启动会花费更长的时间。然而，内核会执行的更好。如果代码作为模块加入，代码将会一直存在于硬盘上直到被需要时加载。接着模块被加载到内存中。这可以减少内核的内存使用并减少启动的时间。然而，因为内核和模块在内存上相互独立所以会影响内核的性能。另一种选择是不添加一些代码。举例来说，内核开发人员假如知道系统永远都不会使用蓝牙设备，因此这个驱动就可以不加到内核中。这提升了内核的性能。然而，如果用户之后需要蓝牙设备，那么他么需要安装蓝牙模块或者升级内核才行。

- make allnoconfig - 这个选项只会生成内核所必要代码的配置文件。它对尽可能多的问题都回答no。这有时会导致内核无法工作在为编译该内核的硬件上。
- make randconfig - 这个选项会对内核选项随机选择（译注：这是做什么用途的？！）。
- make localmodconfig - 这个选项会根据当前已加载模块列表和系统配置来生成配置文件。
- make localyesconfig - 将所有可装载模块（LKM）都编译进内核(译者注：这里与原文 ‘This will set all module options to yes - most (or all) of the kernel will not be in modules’的意思不同，作者也作出了解释：http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-1.4274/#post-13307)。

贴士：最好使用“make menuconfig”，因为用户可以保存进度。“make config”不会提供这样的便利，因为配置过程会耗费大量时间。

### 配置: ###

大多数开发者选择使用“make menucongfig”或者其他图形菜单之一。当键入上述配置命令后，第一个问题，是受否将内核编译成64位。选项有“Y”、“n”和“?”。问号用来解释这个问题，“n”代表这个问题回答否(no),"Y"代表这个问题回答是(yes)。在这个教程里，我选择是。 这里我输入"Y"(这里是大小写敏感的)并输入回车。

注意：当内核在32位系统上编译时，编译工具会询问内核是否编译成32位。第一个问题在不同的处理器上不一样。

下一行显示的是"Cross-compiler tool prefix (CROSS\_COMPILE) []"（交叉编译器工具前缀）。如果你不是做交叉编译就直接按下回车。如果你正在交叉编译，对ARM系统输入像"arm-unknown-linux-gnu-"，对64位PC输入像"x86_64-pc-linux-gnu-"的字样。对其他处理器而言还有许多其他可能的命令，但是这个表太大了。一旦一名开发者知道他们想要支持的处理器，很容易就可研究出处理器需要的命令。

注意：交叉编译是为别的处理器编译代码。比如，一台Intel系统正编译着不在Intel处理器上运行的程序，比如，这个系统可能正在编译着要在ARM或AMD处理器上运行的代码。

注意：每一项选择会改变接下来显示什么问题及何时显示。我会(在教程里)包含上我的选择让读者可以在他们自己的系统上跟上配置的进度。

接下来,用户会看到“Local version - append to kernel release (LOCALVERSION) []”。这使开发人员可以给定一个特殊版本号或命名他们自定义的内核。我将输入“LinuxDotOrg”，这样，内核版本会显示为“3.9.4-LinuxDotOrg”。接下来，配置工具会询问“Automatically append version information to the version string (LOCALVERSION_AUTO) [N/y/?]”（是否自动添加版本信息到版本号后）。如果本地有一个git版本库，git的修订号会被添加到版本号后面。这个例子中我们没有使用git，所以我回答"no"。不然git修订号将会追加到版本号中。还记得vmlinuz和几个类似的文件么？好了，下一个问题就是问使用哪一种格式压缩内核。开发人员可以从五个选项中选择一个。它们是

1. Gzip (KERNEL\_GZIP)
2. Bzip2 (KERNEL\_BZIP2)
3. LZMA (KERNEL\_LZMA)
4. XZ (KERNEL\_XZ)
5. LZO (KERNEL\_LZO)

Gzip是默认值，所以我选择"1"并按回车。每种压缩格式和其他压缩格式相比都有更高或者更低的压缩比。更好的压缩比意味着更小的体积，但是与低压缩比文件相比，它解压时需要更多的时间。

现在这行显示“Default hostname (DEFAULT\_HOSTNAME) [(none)]”。这里可以配置主机名。通常地，开发者这行留空(我这里留空)，以便以后Linux用户可以自己设置他们的主机名。

接下来开发者可以启用或者禁用交换分区。Linux使用一个叫做"swap space"的独立分区来使用虚拟内存。这相当于Windows中的页面文件。典型地，开发者在这行“Support for paging of anonymous memory (swap) (SWAP) [Y/n/?]”（是否支持匿名内存换页）回答“Y”。

接下来的一行（System V IPC (SYSVIPC) [Y/n/?]）询问内核是否支持IPC。进程间通信使进程间可以通信和同步。最好启用IPC不然许多程序将无法工作。这个问题回答“Y”会使配置工具接下来问“POSIX Message Queues (POSIX_MQUEUE) [Y/n/?]”（是否使用POSIX消息队列），这个问题只会在IPC启用后看见。POSIX消息队列是一种给每条消息一个优先级的消息队列（一种进程间通信形式）。默认的选择是“Y”。按回车选择默认选择（以大写选择指示默认）。

下一个问题“open by fhandle syscalls (FHANDLE) [Y/n/?]”（是否使用文件句柄系统调用来打开文件）是问当有需要进行文件系统操作的时候，程序是否允许使用文件句柄而不是文件名进行。默认上，这个选择是“Y”。

有时，开发者在做了一些选择后，某些问题会自动回答。比如，下一个问题“Auditing support (AUDIT) [Y/?]”（是否支持审计）会在没有提示的情况下自动回答，因为先前的选项需要这个特性。审计支持会记录所有文件的访问和修改。下一个关于审计的问题“Enable system-call auditing support (AUDITSYSCALL) [Y/n/?]”（是否启用系统调用审计支持）。如果启用，所有的系统调用都会记录下来。如果开发者想要更好的性能，那么最好尽可能地禁用审计特性并且不把它加入内核。而另外一些开发者可能为了安全监控而启用审计。这个问题我选择“n”。下一个审计方面的问题“Make audit loginuid immutable (AUDIT\_LOGINUID\_IMMUTABLE) [N/y/?]”（是否要审计进程身份ID不可变）是询问进程是否可以改变它们的loginuid(LOGIN User ID)，如果启用，用户空间的进程将无法改变他们的loginuid。为了更好的性能，我们这里禁用这个特性。（译注：对于使用systemd这样的系统，其是通过中央进程来重启登录服务的，设置为“y”可以避免一些安全问题；而使用较旧的SysVinit和Upstart的系统，其需要管理员手工重启登录服务，应该设置为“N”）

注意：当通过“make config”配置时，这些通过配置工具回答的问题会显示出来但是用户无法改变答案。当通过"make menuconfig"配置时，无论用户按任何键都无法改变选项。开发者不需要去改变这些选项，因为之前的选择决定了另外一个问题的选择。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-1.4274/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
