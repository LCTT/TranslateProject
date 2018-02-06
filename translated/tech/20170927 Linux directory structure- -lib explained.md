Linux 目录结构：/lib 分析
======
[![linux 目录 lib][1]][1]

我们在之前的文章中已经分析了其他重要系统目录，比如 bin、/boot、/dev、 /etc 等。可以根据自己的兴趣进入下列链接了解更多信息。本文中，让我们来看看 /lib 目录都有些什么。

[**目录结构分析：/bin 文件夹**][2]

[**目录结构分析：/boot 文件夹**][3]

[**目录结构分析：/dev 文件夹**][4]

[**目录结构分析：/etc 文件夹**][5]

[**目录结构分析：/lost+found 文件夹**][6]

[**目录结构分析：/home 文件夹**][7]

### Linux 中，/lib 文件夹是什么？

lib 文件夹是 **库文件目录** ，包含了所有对系统有用的库文件。简单来说，它是应用程序、命令或进程正确执行所需要的文件。指令在 /bin 或 /sbin 目录，而动态库文件正是在此目录中。内核模块同样也在这里。

以 pwd 命令执行为例。正确执行，需要调用一些库文件。让我们来探索一下 pwd 命令执行时都发生了什么。我们需要使用 [strace 命令][8] 找出调用的库文件。

示例：

如果你在观察的话，会发现我们使用的 pwd 命令仅进行了内核调用，命令正确执行需要调用两个库文件。

Linux 中 /lib 文件夹内部信息

正如之前所说，这个文件夹包含了目标文件和一些库文件，如果能了解这个文件夹的一些重要子文件，想必是极好的。下面列举的内容是基于我自己的系统，对于你的来说，可能会有所不同。

**/lib/firmware** - 这个文件夹包含了一些硬件、固件（Firmware）代码。

### 硬件和固件（Firmware）之间有什么不同？

为了使硬件合法运行，很多设备软件有两部分软件组成。加载了一个代码片段的切实硬件就是固件，固件与内核交流的软件，被称为驱动。这样一来，确保被指派工作的硬件完成内核直接与硬件交流的工作。

**/lib/modprobe.d** - 自动处理可载入模块命令配置目录

**/lib/modules** - 所有可加载的内核模块都存储在这个目录下。如果你有多个内核，那这个目录下有且不仅有一个文件夹，其中每一个都代表一个内核。

**/lib/hdparm** - 包含 SATA/IDE 硬盘正确运行的参数。

**/lib/udev** - Userspace /dev，是 Linux 内核设备管理器。这个文件夹包含了所有的 udev，类似 rules.d 这样描述特殊规则的相关文件/文件夹。

### /lib 的姊妹文件夹：/lib32 和 /lib64

这两个文件夹包含了特殊结构的库文件。它们几乎和 /lib 文件夹一样，除了架构级别的差异。

### Linux 其他的库文件

**/usr/lib** - 所有软件的库都安装在这里。但是不包含系统默认库文件和内核库文件。

**/usr/local/lib** - 放置额外的系统文件。不同应用都可以调用。

**/var/lib** - rpm/dpkg 数据和游戏缓存类似的动态库/文件都存储在这里。

--------------------------------------------------------------------------------

via: https://www.linuxnix.com/linux-directory-structure-lib-explained/

作者：[Surendra Anne][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxnix.com/author/surendra/
[1]:https://www.linuxnix.com/wp-content/uploads/2017/09/The-lib-folder-explained.png
[2]:https://www.linuxnix.com/linux-directory-structure-explained-bin-folder/
[3]:https://www.linuxnix.com/linux-directory-structure-explained-boot-folder/
[4]:https://www.linuxnix.com/linux-directory-structure-explained-dev-folder/
[5]:https://www.linuxnix.com/linux-directory-structure-explainedetc-folder/
[6]:https://www.linuxnix.com/lostfound-directory-linuxunix/
[7]:https://www.linuxnix.com/linux-directory-structure-home-root-folders/
[8]:https://www.linuxnix.com/10-strace-command-examples-linuxunix/
