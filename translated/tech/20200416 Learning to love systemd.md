[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learning to love systemd)
[#]: via: (https://opensource.com/article/20/4/systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

学会爱上systemd
======

systemd是所有进程的源头，负责将Linux主机启动到可以做生产性任务的状态。
![Penguin driving a car with a yellow background][1]

systemd(是的，全小写，即使在句子开头也是小写)，是init和SystemV init脚本的现代替代者。它还有更多功能。

当我想到init和SystemV时，像大多数系统管理员一样，我想到的是Linux的启动和关闭，而没有太多其他的，例如在服务启动和运行后对其进行管理。像init一样，systemd是所有进程的源头，它负责使Linux主机启动到可以做生产性任务的状态。 systemd设定的一些功能比老的init要广泛得多，它要管理正在运行的Linux主机的许多方面，包括挂载文件系统，管理硬件，处理定时器以及启动和管理生产性主机所需的系统服务。

本系列文章是基于我的部分三期Linux培训课程[_使用和管理Linux：从零开始进行学习系统管理_][2]的摘录，探讨了systemd在启动和启动完成后的功能。 

### Linux启动

Linux主机从关机状态到运行状态的完整启动过程很复杂，但它是开放的并且是可知的。在详细介绍之前，我将简要介绍一下从主机硬件被上电到系统准备好用户登录(的过程)。大多数时候，“启动过程”被作为单个概念来讨论，但这是不准确的。实际上，完整的引导和启动过程包含三个主要部分：

   * **硬件引导:** 初始化系统硬件
   * **Linux引导:** 加载Linux内核和systemd
   * **Linux启动:** systemd启动, 为生产工作做准备
   

Linux启动阶段在内核加载了init或systemd(取决于具体发行版使用的是旧的方式还是还是新的方式)之后开始。init和systemd程序启动并管理所有其他进程，他们在各自的系统上都被称为“所有进程之母”。

将硬件引导与Linux引导及Linux启动区分开，并明确定义它们之间的分界点是很重要的。理解他们的差异以及他们每一个在使Linux系统进入生产准备状态所起的作用，才能够管理这些进程并更好地确定大部分人所谓的“启动”问题出在哪里。

启动过程按照三步引导流程使Linux计算机进入可进行生产工作的状态。当内核将主机的控制权转移到systemd时，启动环节开始。

### systemd之争

systemd引起了系统管理员和其他负责维护Linux系统正常运行人员的广泛回应。systemd正在许多Linux系统中接管大量任务的事实造成了某些开发人群和系统管理员群组之间的阻挠和争议。

SystemV和systemd是执行Linux启动环节的两种不同的方法。 SystemV启动脚本和init程序是老的方法，而使用目标(targets)的systemd是新方法。尽管大多数现代Linux发行版都使用较新的systemd进行启动，关机和进程管理，但仍有一些发行版未采用。原因之一是某些发行版维护者和系统管理员喜欢老的SystemV方法，而不是新的systemd。

我认为两者都有其优势。

#### 为何我更喜欢SystemV

我更喜欢SystemV，因为它更开放。使用Bash脚本来完成启动。内核启动init程序（编译后的二进制）后，init启动 **rc.sysinit** 脚本，该脚本执行许多系统初始化任务。 **rc.sysinit** 执行完后，init启动 **/etc/rc.d/rc** 脚本，该脚本依次启动 **/etc/rc.d/rcX.d** 中由SystemV启动脚本定义的各种服务。 其中“ X”是待启动的运行级别号。

除了init程序本身之外，所有这些程序都是开放且易于理解的脚本。可以通读这些脚本并确切了解整个启动过程中发生的事情，但是我不认为有太多系统管理员会实际这样做。每个启动脚本都被编了号，以便按特定顺序启动预期的服务。服务是串行启动的，一次只能启动一个服务。

由Red Hat的Lennart Poettering和Kay Sievers开发的systemd是一个由大的已编译的二进制可执行文件构成的复杂系统，不访问其源码就无法理解。它是开源的，因此“访问其源代码”并不难，只是不太方便。systemd似乎表现出对Linux哲学多个原则的重大驳斥。作为二进制文件，systemd无法被直接打开供系统管理员查看或进行简单更改。systemd试图做所有事情，例如管理正在运行的服务，同时提供比SystemV更多的状态信息。它还管理硬件，进程，进程组，文件系统挂载等。 systemd几乎涉足于现代Linux主机的每方面，使它成为系统管理的一站式工具。所有这些都明显违反了"程序应该小且每个程序都应该只做一件事并且做好"的原则。

#### 为何我更喜欢systemd

我更喜欢用systemd作为启动机制，因为它会根据启动阶段并行地启动尽可能多的服务。这样可以加快整个的启动速度，使得主机系统比SystemV更快地到达登录屏幕。

systemd几乎可以管理正在运行的Linux系统的各个方面。它可以管理正在运行的服务，同时提供比SystemV多得多的状态信息。它还管理硬件，进程和进程组，文件系统挂载等。 systemd几乎涉足于现代Linux操作系统的每方面，使其成为系统管理的一站式工具。（听起来熟悉吧？）

systemd工具是编译后的二进制文件，但该工具包是开放的，因为所有配置文件都是ASCII文本文件。可以通过各种GUI和命令行工具来修改启动配置，也可以添加或修改各种配置文件来满足特定的本地计算环境的需求。

#### 真正的问题

您认为我不能喜欢两种启动系统吗？我能，我会用它们中的任何一个。

我认为，SystemV和systemd之间大多数争议的真正问题和根本原因在于，系统管理阶段[没有选择权][3]。使用SystemV还是systemd已经由各种发行版的开发人员，维护人员和打包人员选择了(但有充分的理由)。由于init极端的侵入性, 挖出(scooping out)并替换init系统会带来很多影响，发行版设计过程之外(的环节)很难处理这些影响。

尽管该选择实际上是为我而选的，我通常最关心的是我的Linux主机仍然可以启动并正常工作。作为最终用户，甚至是系统管理员，我主要关心的是我是否可以完成我的工作，例如写我的书和这篇文章，安装更新以及编写脚本来自动化所有事情。只要我能做我的工作，我就不会真正在意发行版中使用的启动系统。

在启动或服务管理出现问题时，我会在意。无论主机上使用哪种启动系统，我都足够了解如何沿着事件顺序来查找故障并进行修复。

#### 替换SystemV

以前曾有过用更现代的东西替代SystemV的尝试。在大约两个版本中，Fedora使用了一个叫作Upstart的东西来替换老化的SystemV，但是它没有替换init并且没有我能感知到的变化。由于Upstart并未对SystemV的问题进行任何重大更改，因此这个方向的努力很快就被systemd放弃了。

尽管大部分Linux开发人员都认可替换旧的SystemV启动系统是个好主意，但许多开发人员和系统管理员并不喜欢systemd。与其重新讨论人们在systemd中遇到的或曾经遇到过的所有所谓的问题，不如带您去看两篇好文章，尽管有些陈旧，但它们涵盖了大多数内容。Linux内核的创建者Linus Torvalds对systemd似乎不感兴趣。在2014年ZDNet的文章_[Linus Torvalds和其他人对Linux上的systemd的看法][4]_中，Linus清楚地表达了他的感受。

>“实际上我对systemd本身没有任何特别强烈的意见。我对一些核心开发人员有一些意见，我认为它们在对待bugs和兼容性方面过于轻率，而且我认为某些设计细节是疯狂的（例如，我不喜欢二进制日志），但这只是细节，不是大问题。”

如果您对Linus不太了解，我可以告诉您，如果他不喜欢某事，那么他非常直率，坦率，并且非常清楚这种不喜欢。他解决自己对事物不满的方式已经被社会更好地接受了。

2013年，Poettering写了一篇很长的博客，其中他在揭穿[systemd的神话][5]的同时透露了创建它的一些原因。这是一本很好的读物，我强烈建议您阅读。

### systemd任务

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


### 架构

这些和更多的任务通过许多守护程序，控制程序和配置文件来支持。图1显示了许多属于systemd的组件。这是一个简化的图，旨在提供概要描述，因此它并不包括所有独立的程序或文件。它也不提供数据流的视角，数据流是如此复杂，因此在本系列文章的背景下没用。

![系统架构][6]

完整的systemd讲解就需要一本书。您不需要了解图1中的systemd组件是如何组合在一起的细节。了解支持各种Linux服务管理以及日志文件和日志处理的程序和组件就够了。 但是很明显，systemd并不是某些批评者所说的那样的庞然大物。

### 作为1号进程的systemd

systemd是1号进程(PID 1)。它的一些功能(比老的SystemV3 init要广泛得多)用于管理正在运行的Linux主机的许多方面，包括挂载文件系统以及启动和管理Linux生产主机所需的系统服务。与启动顺序无关的任何systemd任务都不在本文讨论范围之内（但本系列后面的一些文章将探讨其中的一些任务）。

首先，systemd挂载 **/etc/fstab** 所定义的文件系统，包括所有交换文件或分区。此时，它可以访问位于 **/etc** 中的配置文件，包括它自己的配置文件。它使用其配置链接 **/etc/systemd/system/default.target** 来确定将主机引导至哪个状态或目标。 **default.target** 文件是指向真实目标文件的符号链接。对于桌面工作站，通常是 **graphical.target**，它相当于SystemV中的运行级别5。对于服务器，默认值更可能是 **multi-user.target**，相当于SystemV中的运行级别3。 **emergency.target** 类似于单用户模式。目标(targets)和服务(services)是systemd的单位。

下表（图2）将systemd目标与老的SystemV启动运行级别进行了比较。systemd提供systemd目标别名以便向后兼容。目标别名允许脚本（以及许多系统管理员）使用SystemV命令（如**init 3**）更改运行级别。当然，SystemV命令被转发给systemd进行解释和执行。

**systemd目标** | **SystemV运行级别** | **目标别名** | **描述**
--- | --- | ---- |-
default.target | | |此目标总是通过符号连接的方式成为“多用户目标”或“图形化目标”的别名。systemd始终使用 **default.target** 来启动系统。 ** default.target** 绝不应该设为 **halt.target**，**poweroff.target** 或 **reboot.target** 的别名
graphic.target | 5 | runlevel5.target |带有GUI的 **Multi-user.target**
| 4 | runlevel4.target |未用。在SystemV中运行级别4与运行级别3相同。可以创建并自定义此目标以启动本地服务，而无需更改默认的 **multi-user.target**
multi-user.target | 3 | runlevel3.target |所有服务在运行，但仅有命令行界面（CLI）
| 2 | runlevel2.target |多用户，没有NFS，其他所有非GUI服务在运行
rescue.target | 1 | runlevel1.target |基本系统，包括挂载文件系统，运行最基本的服务和主控制台的恢复shell
Emergency.target | S | |单用户模式-没有服务运行；不挂载文件系统。这是最基本的工作级别，只有主控制台上运行的一个紧急Shell供用户与系统交互
halt.target | | |在不关电源的情况下停止系统
reboot.target | 6 | runlevel6.target |重启
poweroff.target | 0 | runlevel0.target |停止系统并关闭电源

每个目标在其配置文件中都描述了一个依赖集。systemd启动必须的依赖，这些依赖是运行Linux主机到特定功能级别所需的服务。当目标配置文件中列出的所有依赖项被加载并运行后，系统就在该目标级别运行了。 在图2中，功能最多的目标位于表的顶部，从顶向下，功能逐步递减。

systemd还会检查老的SystemV init目录，以确认是否存在任何启动文件。如果有，systemd会将它们作为配置文件以启动它们描述的服务。网络服务是一个很好的例子，在Fedora中它仍然使用SystemV启动文件。

图3（如下）是直接从启动手册页复制来的。它显示了systemd启动期间普遍的事件顺序以及确保成功启动的基本顺序要求。

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

**sysinit.target** 和 **basic.target** 目标可以看作启动过程中的检查点。尽管systemd的设计目标之一是并行启动系统服务，但是某些服务和功能目标必须先启动，然后才能启动其他服务和目标。直到该检查点所需的所有服务和目标被满足后才能通过这些检查点。

当它依赖的所有单元都完成时，将到达 **sysinit.target**。所有这些单元，挂载文件系统，设置交换文件，启动udev，设置随机数生成器种子，启动低层服务以及配置安全服务（如果一个或多个文件系统是加密的）都必须被完成，但 **sysinit.target** 的这些任务可以并行执行。

**sysinit.target** 将启动系统接近正常运行所需的所有低层服务和单元，以及转移到 **basic.target** 所需的服务和单元。

在完成 **sysinit.target** 目标之后，systemd会启动实现下一个目标所需的所有单元。基本目标通过启动所有下一目标所需的单元来提供一些其他功能。包括设置如PATHs为各种可执行程序的路径，设置通信套接字和计时器之类。

最后，用户级目标 **multi-user.target** 或 **graphical.target** 被初始化。要满足图形目标的依赖必须先达到**multi-user.target**。图3中带下划线的目标是通常的启动目标。当达到这些目标之一时，启动就完成了。如果 **multi-user.target** 是默认设置，那么您应该在控制台上看到文本模式的登录界面。如果 **graphical.target** 是默认设置，那么您应该看到图形的登录界面。您看到的特定的GUI登录界面取决于您默认的显示管理器。

引导手册页还描述并提供了引导到初始RAM磁盘和systemd关机过程的地图。

systemd还提供了一个工具，该工具列出了完整启动或指定单元的依赖。单元是可控制的systemd资源实体，其范围从特定服务（例如httpd或sshd）到计时器，挂载，套接字等。尝试以下命令并滚动查看结果。

```
`systemctl list-dependencies graphical.target`
```

注意，这完全展开了使系统进入图形目标运行模式所需的顶层目标单元列表。 也可以使用 **\-all** 选项来展开所有其他单元。

```
`systemctl list-dependencies --all graphical.target`
```

您可以使用 **less** 命令来搜索诸如“target”，“slice”和“ socket”之类的字符串。

现在尝试下面的方法。

```
`systemctl list-dependencies multi-user.target`
```

和


```
`systemctl list-dependencies rescue.target`
```

和


```
`systemctl list-dependencies local-fs.target`
```

和


```
`systemctl list-dependencies dbus.service`
```
```
`systemctl list-dependencies graphic.target`
```



这个工具帮助我可视化我正用的主机的启动依赖细节。继续花一些时间探索一个或多个Linux主机的启动树。但是要小心，因为systemctl手册页包含以下注释：

> _“请注意，此命令仅列出当前被服务管理器加载到内存的单元。尤其是，此命令根本不适合用于获取特定单元的全部反向依赖列表，因为它不会列出被单元声明了但是未加载的依赖项。” _

### 结尾语

即使在深入研究systemd之前，很明显能看出它既强大又复杂。显然，systemd不是单一，庞大，整体且不可知的二进制文件。相反，它是由许多较小的组件和旨在执行特定任务的子命令组成。

本系列的下一篇文章将更详细地探讨systemd的启动，以及systemd的配置文件，更改默认的目标以及如何创建简单服务单元。

### 资源

互联网上有大量关于systemd的信息，但是很多都简短，晦涩甚至是误导。除了本文提到的资源外，以下网页还提供了有关systemd启动的更详细和可靠的信息。

  * Fedora项目有一个很好的，实用的[guide to systemd][7]。它有你需要知道的通过systemd来配置，管理和维护Fedora主机所需的几乎所有知识。
  * Fedora项目还有一个不错的[cheat sheet][8]，将老的SystemV命令与对比的systemd命令相互关联。
  * 有关systemd及其创建原因的详细技术信息，请查看[Freedesktop.org][9]的[systemd描述][10]。
  * [Linux.com][11]的“systemd的更多乐趣”提供了更高级的systemd [信息和技巧][12]。


还有systemd的设计师和主要开发者Lennart Poettering撰写的针对Linux系统管理员的一系列技术文章。这些文章是在2010年4月至2011年9月之间撰写的，但它们现在和那时一样有用。关于systemd及其生态的其他许多好文都基于这些论文。

  * [重新思考1号进程][13]
  * [systemd之系统管理员, I][14]
  * [systemd之系统管理员, II][15]
  * [systemd之系统管理员, III][16]
  * [systemd之系统管理员, IV][17]
  * [systemd之系统管理员, V][18]
  * [systemd之系统管理员, VI][19]
  * [systemd之系统管理员, VII][20]
  * [systemd之系统管理员, VIII][21]
  * [systemd之系统管理员, IX][22]
  * [systemd之系统管理员, X][23]
  * [systemd之系统管理员, XI][24]



Mentor Graphics的Linux内核和系统程序员Alison Chiaken预览了此文...
--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
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
