#Linux开机引导和启动过程简介

---
>你是否曾经对操作系统为何能够执行应用程序而感到疑惑？那么本文将为你揭开操作系统引导与启动的面纱。


理解操作系统开机引导和启动过程对于配置操作系统和解决相关启动问题是至关重要的。该文章陈述了 GRUB2 引导装载程序开机引导装载内核的过程和 systemd 执行开机启动操作系统的过程。

事实上，操作系统的启动分为两个阶段：引导和启动。引导阶段开始于打开电源开关，结束于内核初始化完成和 systemd 进程成功拉起。启动阶段接管了剩余工作，直到操作系统可用。

总体来说，Linux 的开机引导和启动过程是相当容易理解，下文将分章节对于不同步骤进行详细说明。

其他Linux参考资源
- [What is Linux?](https://opensource.com/resources/what-is-linux?src=linux_resource_menu)
- [What are Linux containers?](https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu)
- [Managing devices in Linux](https://opensource.com/article/16/11/managing-devices-linux?src=linux_resource_menu)
- [Download Now: Linux commands cheat sheet](https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ)
- [Our latest Linux articles](https://opensource.com/tags/linux?src=linux_resource_menu)
- BIOS POST
- Boot loader (GRUB2)
- Kernel initialization
- Start systemd, the parent of all processes.

注意，本文以 GRUB2 和 systemd 为载体讲述操作系统的开机引导和启动过程，是因为两者是目前主流的 linux 发行版本所使用的引导加载内核和初始化系统的软件。当然另外一些过去使用的相关软件仍然在一些 Linux 发行版本中使用。

##引导过程
发起引导过程的方法有两种。首先，如果系统处于关机状态，那么打开电源按钮将开启系统引导过程。其次，如果操作系统已经运行在一个本地用户（该用户可是 root 或其他非特权用户），那么用户可以借助图形界面或命令行界面通过编程方式发起一个重启操作，从而触发系统引导过程。重启包括了一个关机和启动操作。

###BIOS上电自检
上电自检过程中其实 Linux 没有什么也没做，上电自检主要由硬件完成，这对于所有操作系统都一样。当电脑接通电源，电脑开始执行 BIOS（基本输入输出系统）的 POST（上电自检）过程。

在 1981 年，IBM设计的第一台个人电脑中，BIOS 被设计为初始烧录于硬件组件中。POST作为 BIOS 的组成部分，用于检验电脑硬件基本功能是否正常。如果 POST 失败，那么这个电脑就不能使用，引导过程也将就此中断。

BIOS 上电自检确认硬件的基本功能正常，然后产生一个 BIOS 中断，INT 13H，该中断指向任何可启动设备的启动记录。如果在该启动扇区中发现一个有效的启动记录，那么BIOS将加载启动记录中的数据到内存中。控制权也将从BIOS转移到此段代码。

设备启动记录中代码加载是引导加载器真正的第一阶段。大多数 Linux 发行版本使用的引导加载器一共有 3 种，GRUB，GRUB2 和 LILO。GRUB2 是最新出现的，也是相对于其他老的选项使用最广泛的。

###GRUB2
GRUB2 全称是 Grand Unified BootLoader，Version 2。它是目前流行的大部分 Linux 发行版本的通用启动加载器。GRUB2 是一个用于寻找操作系统内核并加载其到内存的智能程序。由于 GRUB 比 GRUB2 易于书写和阅读，在下文中，除特殊指明以外，GRUB 将代指 GRUB2。

GRUB 被设计为兼容多种操作系统引导规范，GRUB 能够用来引导不同版本的 Linux 和其他的开源操作系统；它还能链式加载操作系统的专用引导记录。

GRUB 允许用户选择任何给定几个 Linux 发行版本内核开机引导操作系统。这个特性使得操作系统，在因为关键软件不兼容或其他某些原因升级失败时，具备恢复先前版本的能力。GRUB 能够通过文件 /boot/grub/grub.conf 进行配置。

GRUB1 现在已经逐步被弃用，它已经被更新的版本 GRUB2 所替换。 GRUB2 是在 GRUB1 的基础上重写完成。Red Hat 基础发行版（Fedora 15 和 CentOS/RHEL 7）均升级到 GRUB2。GRUB2 提供了与 GRUB1 同样的引导功能，但是 GRUB2 又像一个基于命令行的 Pre-OS 环境主框架，使得在预引导阶段配置更为方便和易操作。GRUB2 通过 /boot/grub2/grub.cfg 进行配置。

两个 GRUB 的最主要作用都是完成内核加载并启动内核。两个版本的 GRUB 的基本工作方式一致，其主要阶段也保持相同，都可分为3个阶段。在本文将以 GRUB2 为例进行讨论其工作过程。GRUB 或 GRUB2 的配置，以及 GRUB2 的使用命令均超过本文范围，不会在文中进行介绍。

####阶段 1
如上文 POST（上电自检）阶段提到，在 POST 阶段结束时，BIOS 将查找在启动设备中查找引导记录，其通常位于 MBR（主引导记录），它加载该引导记录中代码进入内存，并开始执行此代码。引导代码必须存储于引导记录，由于一个记录的大小为 512 字节且引导记录还必须存储该所在设备的分区信息，导致了引导代码必须非常小。 在实际中，引导代码在住引导扇区中占用的空间大小为 446 字节，该 446 字节的文件通常被叫做引导镜像（boot.img），其中不包含设备的分区信息，分区是一般单独添加到引导记录中。

由于引导记录的大小限制，它不可能非常智能，且不能理解文件系统结构。因此阶段 1 的唯一功能就是加载阶段 1.5 的所需的代码。为了完成此任务，阶段 1.5 的代码必须位于引导记录与设备第一个分区之间的位置。在加载阶段 1.5 代码进入内存后，控制权将有阶段 1 转移到阶段 1.5。

####阶段 1.5
如上所述，阶段 1.5 的代码必须位于引导记录与设备第一个分区之间的位置。该空间由于历史技术原因而空闲。第一个分区的开始位置在扇区 63 和 MBR（记录 0）之间遗留下 62 个 512 字节的记录（共 31744 字节），该区域用于存储阶段 2 的代码镜像 core.img 文件。该文件大小为 25389 字节，故此区域有足够大小的空间用来存储 core.img。

因为有更大的存储空间用于阶段 1.5，且该空间足够容纳一个通用的文件系统，如标准的EXT，其他的 linux 文件系统，FAT 和 NTFS 等。core.img 必定比 boot.img 更复杂且更强大。这意味着 GRUB2 的阶段 2 能够运行于一个标准的 EXT 文件系统，但是不能运行于逻辑卷上。故阶段 2 的文件可以存放于 /boot 根目录之下，特殊地文件如 /boot/grub2 等都存放于该目录下。

注意 /boot 目录必须是一个 GRUB 所支持的文件系统（并不是所有的文件系统均可）。阶段 1.5 的功能是启动阶段 2 所需要的文件系统，并将阶段 2 需要的文件存储到 /boot 根目录下，且加载相关的驱动程序。

####阶段 2
GRUB 阶段 2 所有的文件都已存放于 /boot/grub2 目录及其几个子目录之下。该阶段没有一个类似于阶段 1 与阶段 1.5 的镜像文件。相应地，该阶段主要需要从 /boot/grub2/i386-pc 目录下加载一些内核运行时模块。

GRUB 阶段 2的主要功能是定位和加载 Linux 内核到内存中，并转移控制权到内核。内核的相关文件位于 /boot 目录下，这些内核文件可以通过其文件名进行识别，其文件名均带有前缀 vmlinuz。你可以使用 ll 命令查看操作系统中当前已经安装的内核文件。

GRUB2 根 GRUB1 类似，支持选择从某个内核文件引导启动。Red Hat 包管理器（DNF）支持保持多个内核版本，以防最新版本内核发生问题而无法启动时，恢复老版本系统。GRUB 在安装系统时提供一个预引导菜单，其中包括问题诊断菜单（recuse）以及恢复菜单（如果配置已经设置恢复镜像）。

阶段 2 加载选择的内核到内存中，并转移控制权到内核代码。

###内核
内核文件都是以一种自解压的压缩格式存储，它与一个初始化的内存映像和存储设备映射表都存储于 /boot 目录之下。

在被选择内核加载到内存中，并开始执行后，在其进行任何工作之前，内核文件首先必须从压缩格式自解压。一旦内核自解压完成，则启动systemd进程(该进程是替换老的 systemV 系统的 init 进程)，并转移控制权到 systemd。

在引导过程的结束时，Linux 内核和 systemd 处于运行状态，但是由于没有其他任何程序在执行，故其不能执行任何有关用户的功能性任务。

##启动过程
启动过程紧随引导过程之后，启动过程使 Linux 系统进入可操作状态，并能够执行用户功能性任务。具体来说，就是系统启动相关的系统守护进程。

###systemd
systemd 是所有进程的父进程。它负责拉起宿主操作系统到一个用户可操作状态（可以执行功能任务）。systemd 相对于 init 进程扩展了一些管理该宿主进程各个方面的新功能，包括文件系统挂载，以及开启和管理系统服务等具体业务功能，但是 systemd 的任何与系统启动过程无关的功能均不在此文的讨论范围。

首先，systemd 挂载文件系统是在 **/etc/fstab** 配置，包括内存交换分区和设备分区。据此，systemd 必须能够访问位于 /etc 目录下的配置文件。systemd 借助配置文件 **/etc/systemd/system/default.target** 决定 Linux 系统应该启动达到哪个状态。**default.target** 是一个真实文件的符号链接。对于桌面系统，其链接到 **graphical.target**，该文件相当于老的 systemV init 方式的 **runlevel 5**。对于一个服务器操作系统来说，**default.target** 链接到 **multi-user.target** 相当于 systemV 系统的  **runlevel 3**。 **emergency.target** 相当于单用户模式。

注意，所有的状态点（targets）和服务（services）均为 systemd 的组成单元。

如下表 1 是 systemd 启动的 targets 和老版 systemV init 启动状态点对比。这个 **systemd target aliases** （systemd 状态别名）是为了 systemd 向前兼容 systemV 而提供。这个 target 别名允许系统管理员（包括我自己）用 systemV 命令（例如 init 3）改变运行级别。当然，该 systemV 命令也可以转发到 systemd 进行解释和执行。
|SystemV 运行级别 | systemd target | systemd target 别名 | 描述 |
|:---:|---|---|---|
| | halt.target |   | 在不下电的情况下停止系统. |
| 0 | poweroff.target | runlevel0.target | 停止系统运行并切断电源. |
| S | emergency.target |   | 单用户模式，没有服务进程运行，文件系统也没挂载。这是用于紧急救援模式的一个基本的运行状态，仅仅能够通过在本地运行 shell 与系统进行交互。|
| 1 | rescue.target | runlevel1.target | 该状态是一个挂在了文件系统，仅运行了部分基本服务进程的基本系统，并在主控制台启动了一个 shell 访问入口用于诊断。 |
| 2 |   | runlevel2.target | 多用户，没有挂在 NFS 文件系统，但是所有的非图形界面服务进程已经运行。 |
| 3 | multi-user.target | runlevel3.target | 所有服务都已运行，只支持命令接口访问. |
| 4 |   | runlevel4.target | 暂未使用. |
| 5 | graphical.target | runlevel5.target | 多用户，且支持图形界面接口. |
| 6 | reboot.target | runlevel6.target | 重启 |
|   | default.target |   | 这个状态是对于多用户或图形界面状态的一个代指。systemd 总是通过 default.target 启动系统。default.target 绝不应该代指  halt.target, poweroff.target 或 reboot.target。 |
*表 1 systemd 与老版本 systemV的启动状态点比较*

每个 target 在配置文件中配置一个依赖集，systemd 需要首先启动该 target 所需依赖，指定运行级别的系统依赖于其对应服务进程的运行。当配置文件中所有的依赖服务都加载并运行后，即说明系统处于在运行级别。

systemd 也会查看 systemV init 遗留的目录中是否存在相关启动文件，若存在，则 systemd 根据这些配置文件的内容启动对应的服务。在 Fedora 系统中，这个过时的网络服务就是通过该方式启动的一个实例。

如下图 1 是直接从 bootup 的 man 页面拷贝而来。它展示了在一个系统成功启动的过程一般的事件序列和基本的顺序要求。

**sysinit.target** 和 **basic.target** 启动过程中的两个状态检查点。尽管 systemd 的设计初衷是并行启动系统服务，但是部分服务进程或功能模块的启动是以其他服务或功能启动为前提的。系统将暂停于检查点直到其所要求的条件都满足为止。

**sysinit.target** 状态的到达是以其所依赖的所有资源模块都正常启动为前提的。其包括文件系统挂载，交换文件设置，设备管理器的启动，随机数生成器种子设置，低级别系统服务初始化，加解密服务启动（如果一个或者多个文件系统加密，则此项必须启动）等，在 **sysinit.target** 中这些服务与模块是可以并行启动的。

**sysinit.target** 启动所有最基本的低级别服务和资源，这些服务和资源都是进行下一阶段  basic.target 工作的必要前提。

```
  local-fs-pre.target
            |
            v
   (various mounts and   (various swap   (various cryptsetup
    fsck services...)     devices...)        devices...)       (various low-level   (various low-level
            |                  |                  |             services: udevd,     API VFS mounts:
            v                  v                  v             tmpfiles, random     mqueue, configfs,
     local-fs.target      swap.target     cryptsetup.target    seed, sysctl, ...)      debugfs, ...)
            |                  |                  |                    |                    |
            \__________________|_________________ | ___________________|____________________/
                                                 \|/
                                                  v
                                           sysinit.target
                                                  |
             ____________________________________/|\________________________________________
            /                  |                  |                    |                    \
            |                  |                  |                    |                    |
            v                  v                  |                    v                    v
        (various           (various               |                (various          rescue.service
       timers...)          paths...)              |               sockets...)               |
            |                  |                  |                    |                    v
            v                  v                  |                    v             *rescue.target
      timers.target      paths.target             |             sockets.target
            |                  |                  |                    |
            v                  \_________________ | ___________________/
                                                 \|/
                                                  v
                                            basic.target
                                                  |
             ____________________________________/|                                 emergency.service
            /                  |                  |                                         |
            |                  |                  |                                         v
            v                  v                  v                                *emergency.target
        display-        (various system    (various system
    manager.service         services           services)
            |             required for            |
            |            graphical UIs)           v
            |                  |          *multi-user.target
            |                  |                  |
            \_________________ | _________________/
                              \|/
                               v
                  *graphical.target
```
*图 1：systemd 的启动流程*

在 **sysinit.target** 满足以后，systemd 进入完成 basic.target 状态， 启动 **basic.target** 要求的所有资源。 basic.target 启动下一状态需要的前置功能或服务，包括可执行目录，通信 sockets，以及定时器等。

最后，将到达用户状态（**multi-user.target** 或 **graphical.target**），应该注意的是 **graphical.target** 是以 **multi-user.target** 为基础的。

图 1 中，以*开头的状态（target）是通用的启动状态。当到达其中的某一状态，则说明系统已经成功启动。如果 **multi-user.target** 是默认的目标状态，则成功启动的系统将以命令行登录界面呈现于用户。如果 **graphical.target** 是默认的目标状态，则成功启动的系统将以图形登陆界面呈现于用户，界面的具体样式将根据系统所配置的显示管理器而定。

##问题讨论
最近我需要将将一台 Linux 电脑的内核引导方式从旧版 GRUB1 更改为 GRUB2。我发现一些 GRUB2 的命令在我的系统上不能用，也可能是我使用方法不正确。至今，我仍然不知道是何原因导致，此问题需要进一步探究。

**grub2-set-default** 命令没能在配置文件 **/etc/default/grub** 中成功设置内核引导索引，以至于期望的内核并没有被引导启动。故在该配置文件中我手动更改 **GRUB_DEFAULT=saved** 为 **GRUB_DEFAULT=2**，2 是我需要引导安装的内核文件所在设备的索引。然后我执行命令 **grub2-mkconfig > /boot/grub2/grub.cfg** 创建了新的 GRUB 配置文件，该方法成功规避了命令行无效的问题，并成功更改了系统引导方式。

##结论
GRUB2, systemd 和 init 都是发行版 Linux 引导和启动的关键组件。尽管在实际中， systemd 的使用还存在一些争议，但是 GRUB2 与 systemd 结合的方式能够方便地引导内核并成功启动系统。

尽管 GRUB2 和 systemd 都比其前任要更加复杂，但是它们更加容易学习和管理。在 man 页面有大量关于 systemd 的帮助说明，freedesktop.org 也在线收录了完整的此帮助说明。下面有更多相关信息链接。

##附加资源
- [GNU GRUB](https://en.wikipedia.org/wiki/GNU_GRUB) (Wikipedia)
- [GNU GRUB Manual](https://www.gnu.org/software/grub/manual/grub.html) (GNU.org)
- [Master Boot Record](https://en.wikipedia.org/wiki/Master_boot_record) (Wikipedia)
- [Multiboot specification](https://en.wikipedia.org/wiki/Multiboot_Specification) (Wikipedia)
- [systemd](https://en.wikipedia.org/wiki/Systemd) (Wikipedia)
- [systemd bootup process](https://www.freedesktop.org/software/systemd/man/bootup.html) (Freedesktop.org)
- [systemd index of man pages](https://www.freedesktop.org/software/systemd/man/index.html) (Freedesktop.org)

---
作者简介：

David Both 居住在美国北卡罗纳州的首府罗利，是一个 Linux 开源贡献者。他已经从事 IT 行业 40 余年，在 IBM 教授 OS/2 20余年。1981 年，他在 IBM 开发了第一个关于 最初的 IBM 个人电脑的培训课程。他也曾在 Red Hat 教授 RHCE 课程，也曾供职于 MCI worldcom，Cico 以及北卡罗纳州等。他已经为 Linux 开源社区工作进 20 年。

---
原文链接: [https://opensource.com/article/17/2/linux-boot-and-startup](https://opensource.com/article/17/2/linux-boot-and-startup)

作者：[David Both](https://opensource.com/users/dboth) 译者：penghuster 校对：校对者ID

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
