[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learning to love systemd)
[#]: via: (https://opensource.com/article/20/4/systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

Learning to love systemd 学会爱上systemd
======
systemd is the mother of all processes, responsible for bringing the
Linux host up to a state where productive work can be done.
![Penguin driving a car with a yellow background][1]

systemd是所有进程的源头，负责将Linux主机启动到可以做生产性任务的状态。
![Penguin driving a car with a yellow background][1]

systemd—yes, all lower-case, even at the beginning of a sentence—is the modern replacement for init and SystemV init scripts. It is also much more.

Like most sysadmins, when I think of the init program and SystemV, I think of Linux startup and shutdown and not really much else, like managing services once they are up and running. Like init, systemd is the mother of all processes, and it is responsible for bringing the Linux host up to a state in which productive work can be done. Some of the functions assumed by systemd, which is far more extensive than the old init program, are to manage many aspects of a running Linux host, including mounting filesystems, managing hardware, handling timers, and starting and managing the system services that are required to have a productive Linux host.

This series of articles, which is based in part on excerpts from my three-volume Linux training course, [_Using and administering Linux: zero to sysadmin_][2], explores systemd's functions both at startup and beginning after startup finishes.
systemd(是的，全小写，即使在句子开头也是小写)，是init和SystemV init脚本的现代替代者。它还有更多功能。

当我想到init和SystemV时，像大多数系统管理员一样，我想到的是Linux的启动和关闭，而没有太多其他的，例如在服务启动和运行后对其进行管理。像init一样，systemd是所有进程的源头，它负责使Linux主机启动到可以做生产性任务的状态。 systemd设定的一些功能比老的init要广泛得多，它要管理正在运行的Linux主机的许多方面，包括挂载文件系统，管理硬件，处理定时器以及启动和管理生产性主机所需的系统服务。

本系列文章是基于我的部分三期Linux培训课程[_使用和管理Linux：从零开始进行学习系统管理_][2]的摘录，探讨了systemd在启动和启动完成后的功能。 

### Linux boot Linux启动

The complete process that takes a Linux host from an off state to a running state is complex, but it is open and knowable. Before getting into the details, I'll give a quick overview from when the host hardware is turned on until the system is ready for a user to log in. Most of the time, "the boot process" is discussed as a single entity, but that is not accurate. There are, in fact, three major parts to the full boot and startup process:

  * **Hardware boot:** Initializes the system hardware
  * **Linux boot:** Loads the Linux kernel and then systemd
  * **Linux startup:** Where systemd prepares the host for productive work

Linux主机从关机状态到运行状态的完整启动过程很复杂，但它是开放的并且是可知的。在详细介绍之前，我将简要介绍一下从主机硬件被上电到系统准备好用户登录(的过程)。大多数时候，“启动过程”被作为单个概念来讨论，但这是不准确的。实际上，完整的引导和启动过程包含三个主要部分：

   * **硬件引导:** 初始化系统硬件
   * **Linux引导:** 加载Linux内核和systemd
   * **Linux启动:** systemd启动, 为生产工作做准备
   

The Linux startup sequence begins after the kernel has loaded either init or systemd, depending upon whether the distribution uses the old or new startup, respectively. The init and systemd programs start and manage all the other processes and are both known as the "mother of all processes" on their respective systems.

It is important to separate the hardware boot from the Linux boot from the Linux startup and to explicitly define the demarcation points between them. Understanding these differences and what part each plays in getting a Linux system to a state where it can be productive makes it possible to manage these processes and better determine where a problem is occurring during what most people refer to as "boot."

The startup process follows the three-step boot process and brings the Linux computer up to an operational state in which it is usable for productive work. The startup process begins when the kernel transfers control of the host to systemd.
Linux启动阶段在内核加载了init或systemd(取决于具体发行版使用的是旧的方式还是还是新的方式)之后开始。init和systemd程序启动并管理所有其他进程，他们在各自的系统上都被称为“所有进程之母”。

将硬件引导与Linux引导及Linux启动区分开，并明确定义它们之间的分界点是很重要的。理解他们的差异以及他们每一个在使Linux系统进入生产准备状态所起的作用，才能够管理这些进程并更好地确定大部分人所谓的“启动”问题出在哪里。

启动过程按照三步引导流程使Linux计算机进入可进行生产工作的状态。当内核将主机的控制权转移到systemd时，启动环节开始。

### systemd controversy systemd之争

systemd can evoke a wide range of reactions from sysadmins and others responsible for keeping Linux systems up and running. The fact that systemd is taking over so many tasks in many Linux systems has engendered pushback and discord among certain groups of developers and sysadmins.

SystemV and systemd are two different methods of performing the Linux startup sequence. SystemV start scripts and the init program are the old methods, and systemd using targets is the new method. Although most modern Linux distributions use the newer systemd for startup, shutdown, and process management, there are still some that do not. One reason is that some distribution maintainers and some sysadmins prefer the older SystemV method over the newer systemd.

I think both have advantages.

systemd引起了系统管理员和其他负责维护Linux系统正常运行人员的广泛回应。systemd正在许多Linux系统中接管大量任务的事实造成了某些开发人群和系统管理员群组之间的阻挠和争议。

SystemV和systemd是执行Linux启动环节的两种不同的方法。 SystemV启动脚本和init程序是老的方法，而使用目标(targets)的systemd是新方法。尽管大多数现代Linux发行版都使用较新的systemd进行启动，关机和进程管理，但仍有一些发行版未采用。原因之一是某些发行版维护者和系统管理员喜欢老的SystemV方法，而不是新的systemd。

我认为两者都有其优势。

#### Why I prefer SystemV 为何我更喜欢SystemV

I prefer SystemV because it is more open. Startup is accomplished using Bash scripts. After the kernel starts the init program, which is a compiled binary, init launches the **rc.sysinit** script, which performs many system initialization tasks. After **rc.sysinit** completes, init launches the **/etc/rc.d/rc** script, which in turn starts the various services defined by the SystemV start scripts in the **/etc/rc.d/rcX.d**, where "X" is the number of the runlevel being started.

Except for the init program itself, all these programs are open and easily knowable scripts. It is possible to read through these scripts and learn exactly what is taking place during the entire startup process, but I don't think many sysadmins actually do that. Each start script is numbered so that it starts its intended service in a specific sequence. Services are started serially, and only one service starts at a time.

systemd, developed by Red Hat's Lennart Poettering and Kay Sievers, is a complex system of large, compiled binary executables that are not understandable without access to the source code. It is open source, so "access to the source code" isn't hard, just less convenient. systemd appears to represent a significant refutation of multiple tenets of the Linux philosophy. As a binary, systemd is not directly open for the sysadmin to view or make easy changes. systemd tries to do everything, such as managing running services, while providing significantly more status information than SystemV. It also manages hardware, processes, and groups of processes, filesystem mounts, and much more. systemd is present in almost every aspect of the modern Linux host, making it the one-stop tool for system management. All of this is a clear violation of the tenets that programs should be small and that each program should do one thing and do it well.

我更喜欢SystemV，因为它更开放。使用Bash脚本来完成启动。内核启动init程序（编译后的二进制）后，init启动 **rc.sysinit** 脚本，该脚本执行许多系统初始化任务。 **rc.sysinit** 执行完后，init启动 **/etc/rc.d/rc** 脚本，该脚本依次启动 **/etc/rc.d/rcX.d** 中由SystemV启动脚本定义的各种服务。 其中“ X”是待启动的运行级别号。

除了init程序本身之外，所有这些程序都是开放且易于理解的脚本。可以通读这些脚本并确切了解整个启动过程中发生的事情，但是我不认为有太多系统管理员会实际这样做。每个启动脚本都被编了号，以便按特定顺序启动预期的服务。服务是串行启动的，一次只能启动一个服务。

由Red Hat的Lennart Poettering和Kay Sievers开发的systemd是一个由大的已编译的二进制可执行文件构成的复杂系统，不访问其源码就无法理解。它是开源的，因此“访问其源代码”并不难，只是不太方便。systemd似乎表现出对Linux哲学多个原则的重大驳斥。作为二进制文件，systemd无法被直接打开供系统管理员查看或进行简单更改。systemd试图做所有事情，例如管理正在运行的服务，同时提供比SystemV更多的状态信息。它还管理硬件，进程，进程组，文件系统挂载等。 systemd几乎涉足于现代Linux主机的每方面，使它成为系统管理的一站式工具。所有这些都明显违反了"程序应该小且每个程序都应该只做一件事并且做好"的原则。

#### Why I prefer systemd 为何我更喜欢systemd

I prefer systemd as my startup mechanism because it starts as many services as possible in parallel, depending upon the current stage in the startup process. This speeds the overall startup and gets the host system to a login screen faster than SystemV.

systemd manages almost every aspect of a running Linux system. It can manage running services while providing significantly more status information than SystemV. It also manages hardware, processes and groups of processes, filesystem mounts, and much more. systemd is present in almost every aspect of the modern Linux operating system, making it the one-stop tool for system management. (Does this sound familiar?)

The systemd tools are compiled binaries, but the tool suite is open because all the configuration files are ASCII text files. Startup configuration can be modified through various GUI and command-line tools, as well as adding or modifying various configuration files to suit the needs of the specific local computing environment.

我更喜欢用systemd作为启动机制，因为它会根据启动阶段并行地启动尽可能多的服务。这样可以加快整个的启动速度，使得主机系统比SystemV更快地到达登录屏幕。

systemd几乎可以管理正在运行的Linux系统的各个方面。它可以管理正在运行的服务，同时提供比SystemV多得多的状态信息。它还管理硬件，进程和进程组，文件系统挂载等。 systemd几乎涉足于现代Linux操作系统的每方面，使其成为系统管理的一站式工具。（听起来熟悉吧？）

systemd工具是编译后的二进制文件，但该工具包是开放的，因为所有配置文件都是ASCII文本文件。可以通过各种GUI和命令行工具来修改启动配置，也可以添加或修改各种配置文件来满足特定的本地计算环境的需求。

#### The real issue 真正的问题

Did you think I could not like both startup systems? I do, and I can work with either one.

In my opinion, the real issue and the root cause of most of the controversy between SystemV and systemd is that there is [no choice][3] on the sysadmin level. The choice of whether to use SystemV or systemd has already been made by the developers, maintainers, and packagers of the various distributions—but with good reason. Scooping out and replacing an init system, by its extreme, invasive nature, has a lot of consequences that would be hard to tackle outside the distribution design process.

Despite the fact that this choice is made for me, my Linux hosts boot up and work, which is what I usually care the most about. As an end user and even as a sysadmin, my primary concern is whether I can get my work done, work such as writing my books and this article, installing updates, and writing scripts to automate everything. So long as I can do my work, I don't really care about the start sequence used on my distro.

I do care when there is a problem during startup or service management. Regardless of which startup system is used on a host, I know enough to follow the sequence of events to find the failure and fix it.

您认为我不能喜欢两种启动系统吗？我能，我会用它们中的任何一个。

我认为，SystemV和systemd之间大多数争议的真正问题和根本原因在于，系统管理阶段[没有选择权][3]。使用SystemV还是systemd已经由各种发行版的开发人员，维护人员和打包人员选择了(但有充分的理由)。由于init极端的侵入性, 挖出(scooping out)并替换init系统会带来很多影响，发行版设计过程之外(的环节)很难处理这些影响。

尽管该选择实际上是为我而选的，我通常最关心的是我的Linux主机仍然可以启动并正常工作。作为最终用户，甚至是系统管理员，我主要关心的是我是否可以完成我的工作，例如写我的书和这篇文章，安装更新以及编写脚本来自动化所有事情。只要我能做我的工作，我就不会真正在意发行版中使用的启动系统。

在启动或服务管理出现问题时，我会在意。无论主机上使用哪种启动系统，我都足够了解如何沿着事件顺序来查找故障并进行修复。

#### Replacing SystemV 替换SystemV

There have been previous attempts at replacing SystemV with something a bit more modern. For about two releases, Fedora used a thing called Upstart to replace the aging SystemV, but it did not replace init and provided no changes that I noticed. Because Upstart provided no significant changes to the issues surrounding SystemV, efforts in this direction were quickly dropped in favor of systemd.

Despite the fact that most Linux developers agree that replacing the old SystemV startup is a good idea, many developers and sysadmins dislike systemd for that. Rather than rehash all the so-called issues that people have—or had—with systemd, I will refer you to two good, if somewhat old, articles that should cover most everything. Linus Torvalds, the creator of the Linux kernel, seems disinterested. In a 2014 ZDNet article, _[Linus Torvalds and others on Linux's systemd][4]_, Linus is clear about his feelings.

> "I don't actually have any particularly strong opinions on systemd itself. I've had issues with some of the core developers that I think are much too cavalier about bugs and compatibility, and I think some of the design details are insane (I dislike the binary logs, for example), but those are details, not big issues."

In case you don't know much about Linus, I can tell you that if he does not like something, he is very outspoken, explicit, and quite clear about that dislike. He has become more socially acceptable in his manner of addressing his dislike about things.

In 2013, Poettering wrote a long blog post in which he debunks the [myths about systemd][5] while providing insight into some of the reasons for creating it. This is a very good read, and I highly recommend it.

以前曾有过用更现代的东西替代SystemV的尝试。在大约两个版本中，Fedora使用了一个叫作Upstart的东西来替换老化的SystemV，但是它没有替换init并且没有我能感知到的变化。由于Upstart并未对SystemV的问题进行任何重大更改，因此这个方向的努力很快就被systemd放弃了。

尽管大部分Linux开发人员都认可替换旧的SystemV启动系统是个好主意，但许多开发人员和系统管理员并不喜欢systemd。与其重新讨论人们在systemd中遇到的或曾经遇到过的所有所谓的问题，不如带您去看两篇好文章，尽管有些陈旧，但它们涵盖了大多数内容。Linux内核的创建者Linus Torvalds对systemd似乎不感兴趣。在2014年ZDNet的文章_[Linus Torvalds和其他人对Linux上的systemd的看法][4]_中，Linus清楚地表达了他的感受。

>“实际上我对systemd本身没有任何特别强烈的意见。我对一些核心开发人员有一些意见，我认为它们在对待bugs和兼容性方面过于轻率，而且我认为某些设计细节是疯狂的（例如，我不喜欢二进制日志），但这只是细节，不是大问题。”

如果您对Linus不太了解，我可以告诉您，如果他不喜欢某事，那么他非常直率，坦率，并且非常清楚这种不喜欢。他解决自己对事物不满的方式已经被社会更好地接受了。

2013年，Poettering写了一篇很长的博客，其中他在揭穿[systemd的神话][5]的同时透露了创建它的一些原因。这是一本很好的读物，我强烈建议您阅读。

### systemd tasks systemd任务

Depending upon the options used during the compile process (which are not considered in this series), systemd can have as many as 69 binary executables that perform the following tasks, among others:

  * The systemd program runs as PID 1 and provides system startup of as many services in parallel as possible, which, as a side effect, speeds overall startup times. It also manages the shutdown sequence.
  * The systemctl program provides a user interface for service management.
  * Support for SystemV and LSB start scripts is offered for backward compatibility.
  * Service management and reporting provide more service status data than SystemV.
  * It includes tools for basic system configuration, such as hostname, date, locale, lists of logged-in users, running containers and virtual machines, system accounts, runtime directories and settings, daemons to manage simple network configuration, network time synchronization, log forwarding, and name resolution.
  * It offers socket management.
  * systemd timers provide advanced cron-like capabilities to include running a script at times relative to system boot, systemd startup, the last time the timer was started, and more.
  * It provides a tool to analyze dates and times used in timer specifications.
  * Mounting and unmounting of filesystems with hierarchical awareness allows safer cascading of mounted filesystems.
  * It enables the positive creation and management of temporary files, including deletion.
  * An interface to D-Bus provides the ability to run scripts when devices are plugged in or removed. This allows all devices, whether pluggable or not, to be treated as plug-and-play, which considerably simplifies device handling.
  * Its tool to analyze the startup sequence can be used to locate the services that take the most time.
  * It includes journals for storing system log messages and tools for managing the journals.
  
根据编译过程中使用的选项（不在本系列中介绍），systemd可以有多达69个二进制可执行文件用于执行任务，其中包括：

  * systemd程序以1号进程(PID 1)运行，并提供使尽可能多服务并行启动的系统启动能力，它额外加快了总体启动时间。它还管理关机顺序。
  * systemctl程序提供了服务管理的用户接口。
  * 支持SystemV和LSB启动脚本，以便向后兼容。
  * 服务管理和报告提供了比SystemV更多的服务状态数据。
  * 提供基本的系统配置工具，例如主机名，日期，语言环境，已登录用户的列表，正在运行的容器和虚拟机，系统帐户，运行时目录和设置；用于简易网络配置，网络时间同步，日志转发和名称解析的守护程序。
  * 提供套接字管理。
  * systemd定时器提供类似cron的高级功能，包括在相对于系统启动，systemd启动，定时器上次启动时刻的某个时间点运行脚本。
  * 提供了一个工具来分析定时器规格中使用的日期和时间。
  * 能感知层次的文件系统挂载和卸载可以更安全地级联挂载的文件系统。
  * 允许主动的创建和管理临时文件，包括删除文件。
  * D-Bus的接口提供在插入或移除设备时运行脚本的能力。这允许将所有设备（无论是否可插拔）都被视为即插即用，从而大大简化了设备的处理。
  * 分析启动顺序的工具可用于查找耗时最多的服务。
  * 包括用于存储系统消息的日志以及管理日志的工具。


### Architecture 架构

Those tasks and more are supported by a number of daemons, control programs, and configuration files. Figure 1 shows many of the components that belong to systemd. This is a simplified diagram designed to provide a high-level overview, so it does not include all of the individual programs or files. Nor does it provide any insight into data flow, which is so complex that it would be a useless exercise in the context of this series of articles.

![systemd architecture][6]

A full exposition of systemd would take a book on its own. You do not need to understand the details of how the systemd components in Figure 1 fit together; it's enough to know about the programs and components that enable managing various Linux services and deal with log files and journals. But it's clear that systemd is not the monolithic monstrosity it is purported to be by some of its critics.
这些和更多的任务通过许多守护程序，控制程序和配置文件来支持。图1显示了许多属于systemd的组件。这是一个简化的图，旨在提供概要描述，因此它并不包括所有独立的程序或文件。它也不提供数据流的视角，数据流是如此复杂，因此在本系列文章的背景下没用。

！[系统架构] [6]

完整的systemd讲解就需要一本书。您不需要了解图1中的systemd组件是如何组合在一起的细节。了解支持各种Linux服务管理以及日志文件和日志处理的程序和组件就够了。 但是很明显，systemd并不是某些批评者所说的那样的庞然大物。

### systemd as PID 1 作为1号进程的systemd

systemd is PID 1. Some of its functions, which are far more extensive than the old SystemV3 init program, are to manage many aspects of a running Linux host, including mounting filesystems and starting and managing system services required to have a productive Linux host. Any of systemd's tasks that are not related to the startup sequence are outside the scope of this article (but some will be explored later in this series).

First, systemd mounts the filesystems defined by **/etc/fstab**, including any swap files or partitions. At this point, it can access the configuration files located in **/etc**, including its own. It uses its configuration link, **/etc/systemd/system/default.target**, to determine which state or target it should boot the host into. The **default.target** file is a symbolic link to the true target file. For a desktop workstation, this is typically going to be the **graphical.target**, which is equivalent to runlevel 5 in SystemV. For a server, the default is more likely to be the **multi-user.target**, which is like runlevel 3 in SystemV. The **emergency.target** is similar to single-user mode. Targets and services are systemd units.

The table below (Figure 2) compares the systemd targets with the old SystemV startup runlevels. systemd provides the systemd target aliases for backward compatibility. The target aliases allow scripts—and many sysadmins—to use SystemV commands like **init 3** to change runlevels. Of course, the SystemV commands are forwarded to systemd for interpretation and execution.

systemd是1号进程(PID 1)。它的一些功能(比老的SystemV3 init要广泛得多)用于管理正在运行的Linux主机的许多方面，包括挂载文件系统以及启动和管理Linux生产主机所需的系统服务。与启动顺序无关的任何systemd任务都不在本文讨论范围之内（但本系列后面的一些文章将探讨其中的一些任务）。

首先，systemd挂载 **/etc/fstab** 所定义的文件系统，包括所有交换文件或分区。此时，它可以访问位于 **/etc** 中的配置文件，包括它自己的配置文件。它使用其配置链接 **/etc/systemd/system/default.target** 来确定将主机引导至哪个状态或目标。 **default.target** 文件是指向真实目标文件的符号链接。对于桌面工作站，通常是 **graphical.target**，它相当于SystemV中的运行级别5。对于服务器，默认值更可能是 **multi-user.target**，相当于SystemV中的运行级别3。 **emergency.target** 类似于单用户模式。目标(targets)和服务(services)是systemd的单位。

下表（图2）将systemd目标与老的SystemV启动运行级别进行了比较。systemd提供systemd目标别名以便向后兼容。目标别名允许脚本（以及许多系统管理员）使用SystemV命令（如**init 3**）更改运行级别。当然，SystemV命令被转发给systemd进行解释和执行。

**systemd targets** | **SystemV runlevel** | **target aliases** | **Description**
---|---|---|---
default.target |  |  | This target is always aliased with a symbolic link to either **multi-user.target** or **graphical.target**. systemd always uses the **default.target** to start the system. The **default.target** should never be aliased to **halt.target**, **poweroff.target**, or **reboot.target**.
graphical.target | 5 | runlevel5.target | **Multi-user.target** with a GUI
| 4 | runlevel4.target | Unused. Runlevel 4 was identical to runlevel 3 in the SystemV world. This target could be created and customized to start local services without changing the default **multi-user.target**.
multi-user.target | 3 | runlevel3.target | All services running, but command-line interface (CLI) only
| 2 | runlevel2.target | Multi-user, without NFS, but all other non-GUI services running
rescue.target | 1 | runlevel1.target | A basic system, including mounting the filesystems with only the most basic services running and a rescue shell on the main console
emergency.target | S |  | Single-user mode—no services are running; filesystems are not mounted. This is the most basic level of operation with only an emergency shell running on the main console for the user to interact with the system.
halt.target |  |  | Halts the system without powering it down
reboot.target | 6 | runlevel6.target | Reboot
poweroff.target | 0 | runlevel0.target | Halts the system and turns the power off

**系统目标** | ** SystemV运行级别** | **目标别名** | **描述**
--- | --- | ---- |-
default.target | | |此目标始终使用指向“多用户目标”或“图形目标”的符号链接进行别名。 systemd始终使用** default.target **来启动系统。 ** default.target **绝不应别名为halt.target **，poweroff.target **或reboot.target **。
graphic.target | 5 | runlevel5.target |带有GUI的``Multi-user.target''
| 4 | runlevel4.target |没用过。运行级别4与SystemV世界中的运行级别3相同。可以创建并自定义此目标以启动本地服务，而无需更改默认的“ multi-user.target”。
多用户目标| 3 | runlevel3.target |所有服务正在运行，但仅命令行界面（CLI）
| 2 | runlevel2.target |多用户，没有NFS，但所有其他非GUI服务正在运行
rescue.target | 1 | runlevel1.target |基本系统，包括仅在运行最基本服务的情况下挂载文件系统，并在主控制台上安装急救外壳
Emergency.target | S | |单用户模式-没有服务正在运行；文件系统未挂载。这是最基本的操作级别，只有在主控制台上运行的紧急外壳供用户与系统交互。
halt.target | | |在不关闭电源的情况下暂停系统
reboot.target | 6 | runlevel6.target |重启
poweroff.target | 0 | runlevel0.target |停止系统并关闭电源

Each target has a set of dependencies described in its configuration file. systemd starts the required dependencies, which are the services required to run the Linux host at a specific level of functionality. When all the dependencies listed in the target configuration files are loaded and running, the system is running at that target level. In Figure 2, the targets with the most functionality are at the top of the table, with functionality declining towards the bottom of the table.

systemd also looks at the legacy SystemV init directories to see if any startup files exist there. If so, systemd uses them as configuration files to start the services described by the files. The deprecated network service is a good example of one that still uses SystemV startup files in Fedora.

Figure 3 (below) is copied directly from the bootup man page. It shows a map of the general sequence of events during systemd startup and the basic ordering requirements to ensure a successful startup.
每个目标在其配置文件中都有一组依赖性。 systemd启动所需的依赖关系，这些依赖关系是在特定功能级别上运行Linux主机所需的服务。 加载并运行目标配置文件中列出的所有依赖项后，系统将在该目标级别运行。 在图2中，功能最多的目标位于表的顶部，功能朝表的底部递减。

systemd还会查看旧版SystemV初始化目录，以查看是否存在任何启动文件。 如果是这样，systemd会将它们用作配置文件以启动文件描述的服务。 不推荐使用的网络服务是一个很好的例子，它仍然在Fedora中使用SystemV启动文件。

图3（如下）直接从启动手册页复制而来。 它显示了systemd启动期间事件的一般顺序以及确保成功启动的基本顺序要求的映射。

```
                                         cryptsetup-pre.target
                                                   |
 (various low-level                                v
     API VFS mounts:                 (various cryptsetup devices...)
  mqueue, configfs,                                |    |
  debugfs, ...)                                    v    |
  |                                  cryptsetup.target  |
  |  (various swap                                 |    |    remote-fs-pre.target
  |   devices...)                                  |    |     |        |
  |    |                                           |    |     |        v
  |    v                       local-fs-pre.target |    |     |  (network file systems)
  |  swap.target                       |           |    v     v                 |
  |    |                               v           |  remote-cryptsetup.target  |
  |    |  (various low-level  (various mounts and  |             |              |
  |    |   services: udevd,    fsck services...)   |             |    remote-fs.target
  |    |   tmpfiles, random            |           |             |             /
  |    |   seed, sysctl, ...)          v           |             |            /
  |    |      |                 local-fs.target    |             |           /
  |    |      |                        |           |             |          /
  \\____|______|_______________   ______|___________/             |         /
                              \ /                                |        /
                               v                                 |       /
                        sysinit.target                           |      /
                               |                                 |     /
        ______________________/|\\_____________________           |    /
       /              |        |      |               \          |   /
       |              |        |      |               |          |  /
       v              v        |      v               |          | /
  (various       (various      |  (various            |          |/
   timers...)      paths...)   |   sockets...)        |          |
       |              |        |      |               |          |
       v              v        |      v               |          |
 timers.target  paths.target   |  sockets.target      |          |
       |              |        |      |               v          |
       v              \\_______ | _____/         rescue.service   |
                              \|/                     |          |
                               v                      v          |
                           basic.target         rescue.target    |
                               |                                 |
                       ________v____________________             |
                      /              |              \            |
                      |              |              |            |
                      v              v              v            |
                  display-    (various system   (various system  |
              manager.service     services        services)      |
                      |         required for        |            |
                      |        graphical UIs)       v            v
                      |              |            multi-user.target
 emergency.service    |              |              |
         |            \\_____________ | _____________/
         v                          \|/
 emergency.target                    v
                              graphical.target
```

The **sysinit.target** and **basic.target** targets can be considered checkpoints in the startup process. Although one of systemd's design goals is to start system services in parallel, certain services and functional targets must be started before other services and targets can start. These checkpoints cannot be passed until all of the services and targets required by that checkpoint are fulfilled.

The **sysinit.target** is reached when all of the units it depends on are completed. All of those units, mounting filesystems, setting up swap files, starting udev, setting the random generator seed, initiating low-level services, and setting up cryptographic services (if one or more filesystems are encrypted), must be completed but, within the **sysinit.target**, those tasks can be performed in parallel.

The **sysinit.target** starts up all of the low-level services and units required for the system to be marginally functional and that are required to enable moving onto the **basic.target**.
sysinit.target **和basic.target **目标可以视为启动过程中的检查点。尽管systemd的设计目标之一是并行启动系统服务，但是必须先启动某些服务和功能目标，然后才能启动其他服务和目标。在满足该检查点所需的所有服务和目标之前，无法通过这些检查点。

当它依赖的所有单元都完成时，将达到sysinit.target **。所有这些单元，装入文件系统，设置交换文件，启动udev，设置随机生成器种子，启动低级服务以及设置加密服务（如果已加密一个或多个文件系统）都必须完成，但是必须在** sysinit.target **，这些任务可以并行执行。

sysinit.target **将启动系统仅能正常运行所需的所有低层服务和单元，并且这些必需的低端服务和单元必须能够转移到basic.target **上。

After the **sysinit.target** is fulfilled, systemd then starts all the units required to fulfill the next target. The basic target provides some additional functionality by starting units that are required for all of the next targets. These include setting up things like paths to various executable directories, communication sockets, and timers.

Finally, the user-level targets, **multi-user.target** or **graphical.target**, can be initialized. The **multi-user.target** must be reached before the graphical target dependencies can be met. The underlined targets in Figure 3 are the usual startup targets. When one of these targets is reached, startup has completed. If the **multi-user.target** is the default, then you should see a text-mode login on the console. If **graphical.target** is the default, then you should see a graphical login; the specific GUI login screen you see depends on your default display manager.

The bootup man page also describes and provides maps of the boot into the initial RAM disk and the systemd shutdown process.

systemd also provides a tool that lists dependencies of a complete startup or for a specified unit. A unit is a controllable systemd resource entity that can range from a specific service, such as httpd or sshd, to timers, mounts, sockets, and more. Try the following command and scroll through the results.
在完成sysinit.target **之后，systemd然后启动实现下一个目标所需的所有单元。基本目标通过启动所有下一个目标所需的单元来提供一些其他功能。其中包括设置诸如各种可执行目录的路径，通信套接字和计时器之类的内容。

最后，可以初始化用户级目标** multi-user.target **或** graphical.target **。必须满足** multi-user.target **才能满足图形目标的依赖关系。图3中带下划线的目标是通常的启动目标。当达到这些目标之一时，启动已完成。如果默认为“ multi-user.target”，那么您应该在控制台上看到文本模式登录。如果** graphical.target **是默认设置，则应该看到图形登录名。您看到的特定GUI登录屏幕取决于您的默认显示管理器。

引导手册页还描述并提供了引导到初始RAM磁盘和systemd关机过程的映射。

systemd还提供了一个工具，该工具列出了完整启动或指定单位的依赖性。单元是可控的systemd资源实体，其范围可以从特定服务（例如httpd或sshd）到计时器，安装，套接字等。尝试以下命令并在结果中滚动。

```
`systemctl list-dependencies graphical.target`
```

Notice that this fully expands the top-level target units list required to bring the system up to the graphical target run mode. Use the **\--all** option to expand all of the other units as well.


```
`systemctl list-dependencies --all graphical.target`
```

You can search for strings such as "target," "slice," and "socket" using the search tools of the **less** command.

So now, try the following.


```
`systemctl list-dependencies multi-user.target`
```

and


```
`systemctl list-dependencies rescue.target`
```

and


```
`systemctl list-dependencies local-fs.target`
```

and


```
`systemctl list-dependencies dbus.service`
```
```
`systemctl list-dependencies graphic.target`
```

注意，这完全扩展了使系统进入图形目标运行模式所需的顶级目标单元列表。 也可以使用** \-all **选项来扩展所有其他单位。


```
`systemctl list-dependencies --all graphic.target`
```

您可以使用** less **命令的搜索工具来搜索诸如“ target”，“ slice”和“ socket”之类的字符串。

因此，现在尝试以下方法。


```
`systemctl list-dependencies multi-user.target`
```

和


```
`systemctl列表依赖resurance.target`
```

和


```
`systemctl list-dependencies local-fs.target`
```

和


```
`systemctl list-dependencies dbus.service`
```

This tool helps me visualize the specifics of the startup dependencies for the host I am working on. Go ahead and spend some time exploring the startup tree for one or more of your Linux hosts. But be careful because the systemctl man page contains this note:

> _"Note that this command only lists units currently loaded into memory by the service manager. In particular, this command is not suitable to get a comprehensive list at all reverse dependencies on a specific unit, as it won't list the dependencies declared by units currently not loaded."_
这个工具可以帮助我可视化我正在处理的主机的启动依赖项的细节。 继续并花一些时间探索一个或多个Linux主机的启动树。 但是要小心，因为systemctl手册页包含以下注释：

> _“，请注意，此命令仅列出服务管理器当前加载到内存中的单元。特别地，此命令不适用于获取特定单元上所有反向依赖项的全面列表，因为它不会列出已声明的依赖项 按当前未加载的单位。” _

### Final thoughts

Even before getting very deep into systemd, it's obvious that it is both powerful and complex. It is also apparent that systemd is not a single, huge, monolithic, and unknowable binary file. Rather, it is composed of a number of smaller components and subcommands that are designed to perform specific tasks.

The next article in this series will explore systemd startup in more detail, as well as systemd configuration files, changing the default target, and how to create a simple service unit.
甚至在深入研究systemd之前，很明显它既强大又复杂。 显然，systemd不是单个，巨大，整体且不可知的二进制文件。 而是由许多较小的组件和旨在执行特定任务的子命令组成。

本系列的下一篇文章将更详细地探讨systemd启动，以及systemd配置文件，更改默认目标以及如何创建简单服务单元。

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide][7] [to systemd][7]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][8] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][9]'s [description of systemd][10].
  * [Linux.com][11]'s "More systemd fun" offers more advanced systemd [information and tips][12].

互联网上有大量有关systemd的信息，但是很多信息简明扼要，晦涩甚至是误导。除了本文提到的资源外，以下网页还提供了有关systemd启动的更详细和可靠的信息。

  * Fedora项目有一个很好的，实用的[guide] [7] [to systemd] [7]。它具有使用systemd配置，管理和维护Fedora计算机所需的几乎所有知识。
  * Fedora项目还有一个不错的[备忘单] [8]，可以将旧的SystemV命令与可比的systemd命令交叉引用。
  *有关systemd及其创建原因的详细技术信息，请查看[Freedesktop.org] [9]的[systemd描述] [10]。
  * [Linux.com] [11]的“更多系统乐趣”提供了更高级的systemd [信息和提示] [12]。




There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.
还有systemd的设计师和主要开发者Lennart Poettering撰写的一系列针对Linux sysadmin的技术性文章。这些文章是在2010年4月至2011年9月之间撰写的，但它们现在和那时一样具有相关性。关于systemd及其生态系统的许多其他优点都基于这些论文。

  * [Rethinking PID 1][13]
  * [systemd for Administrators, Part I][14]
  * [systemd for Administrators, Part II][15]
  * [systemd for Administrators, Part III][16]
  * [systemd for Administrators, Part IV][17]
  * [systemd for Administrators, Part V][18]
  * [systemd for Administrators, Part VI][19]
  * [systemd for Administrators, Part VII][20]
  * [systemd for Administrators, Part VIII][21]
  * [systemd for Administrators, Part IX][22]
  * [systemd for Administrators, Part X][23]
  * [systemd for Administrators, Part XI][24]



Alison Chiaken, a Linux kernel and systems programmer at Mentor Graphics, offers a preview of her...
Mentor Graphics的Linux内核和系统程序员Alison Chiaken预览了她的...
--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: http://www.both.org/?page_id=1183
[3]: http://www.osnews.com/story/28026/Editorial_Thoughts_on_Systemd_and_the_Freedom_to_Choose
[4]: https://www.zdnet.com/article/linus-torvalds-and-others-on-linuxs-systemd/
[5]: http://0pointer.de/blog/projects/the-biggest-myths.html
[6]: https://opensource.com/sites/default/files/uploads/systemd-architecture.png (systemd architecture)
[7]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[8]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[9]: http://Freedesktop.org
[10]: http://www.freedesktop.org/wiki/Software/systemd
[11]: http://Linux.com
[12]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[13]: http://0pointer.de/blog/projects/systemd.html
[14]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[18]: http://0pointer.de/blog/projects/three-levels-of-off.html
[19]: http://0pointer.de/blog/projects/changing-roots
[20]: http://0pointer.de/blog/projects/blame-game.html
[21]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[22]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[23]: http://0pointer.de/blog/projects/instances.html
[24]: http://0pointer.de/blog/projects/inetd.html
