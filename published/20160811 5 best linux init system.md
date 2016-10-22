现代 Linux 的五大初始化系统（1992-2015）
============================================

在 Linux 和其他类 Uniux 系统中，init（初始化）进程是系统启动时由内核执行的第一个进程，其进程 ID（PID）为 1，并静默运行在后台，直到系统关闭。

init 进程负责启动其他所有的进程，比如守护进程、服务和其他后台进程，因此，它是系统中其它所有进程之母（偏偏叫做“父进程”）。某个进程可以启动许多个子进程，但在这个过程中，某个子进程的父进程结束之后，该子进程的父进程会变成 init 进程。

![](http://www.tecmint.com/wp-content/uploads/2016/08/Linux-init-Systems.png)

这么多年过去了，许多的初始化系统在主流 Linux 脱颖而出，和本文中，我将你来看看在 Linux 操作系统最好的初始化系统。

### 1. System V Init

System V (SysV) 是一个在类 Unix 系统中最为成熟而且大受欢迎的初始化方案，是 Unix/Linux 系统中所有进程的父进程。SysV 是第一个商业 Unix 系统设计的初始化方案。

除了 Gentoo 使用自主的初始化系统、Slackware 使用 BSD 风格的初始化方案外，几乎所有的 Linux 发行版都率先使用 SysV 作为初始化方案。

随着时间的推移，由于一些设计上的缺陷，有几个 SysV 初始化替换方案已经开发出来，用以为 Linux 创建更加高效和完美的初始化系统。

尽管这些替代方案都超越了 SysV 并提供了更多新特性，但它们仍然和原始 SysV 初始化脚本保持兼容。

### 2. SystemD

SystemD 是一个 Linux 平台中相对较新的初始化方案。它由 Fedora 15 引入，集成了各类工具以便更好的管理系统。主要目的是：系统初始化、管理和跟踪引导进程中和系统运行时所有的系统进程。

Systemd 全面有别于其他传统的 Unix 初始化系统，特别是在启动系统和服务管理方面。它同样兼容 SysV 和 LBS 初始化脚本。

其中较为突出的特性如下：

- 纯粹、简单、高效的设计
- 启动时的并发和并行处理
- 更好的 API
- 开启可选进程的移除功能
- 使用 journald 来支持事件日志
- 使用 systemd calender timers 来支持任务计划
- 以二进制文件存储日志
- 保存 systemd 的状态以待今后查看
- 与 GNOME 更好整合实现等

查看 Systemd 初始化系统简介：<https://fedoraproject.org/wiki/Systemd>

### 3. Upstart

Upstart 是一个基于事件的初始化系统，由 Ubuntu 的制作团队开发的，用以替代 SysV。它可以启动不同的系统任务和进程、在系统运行时校验进程并在系统关闭时结束进程。

它是一个使用 SysV 和 Systemd 启动脚本的混合初始化系统，Upstart 中值得一提的特性如下：

- Ubuntu 的原生初始化系统，但可以运行在其他所有的发行版中
- 基于事件启动/结束的任务和服务
- 启动/结束任务和服务时生成事件
- 可以由其他系统进程发送事件
- 使用 D-Bus 和 init 进程通信
- 用户可以启动/结束其各自的进程
- 可以再现崩溃的进程等

访问 Upstart 主页：<http://upstart.ubuntu.com/index.html>

### 4. OpenRC

OpenRC 是一个基于依赖关系的类 Unix 系统初始化方案，兼容 SysV。基本可以说是 SysV 的升级版，但必须要清楚记住的是：OpenRC 并非只是完全替代 /sbin/init 文件。

它所提供的出色特性如下：

- 可运行在包括 Gentoo 和 BSD 在内的多数 Linux 系统之中
- 支持硬件触发的初始化脚本（LCTT 译注：如硬件热插拔所触发的）
- 支持单个配置文件
- 不支持单个服务配置文件
- 以守护进程的方式运行
- 并行服务启动等

访问 OpenRC 主页：<https://wiki.gentoo.org/wiki/OpenRC>

### 5. runit

runit 同样是一个跨平台初始化系统，可以运行在 GNU/Linux、Solaris、BSD 和 Mac OS X 中，用替代 SysV，同时提供服务监控。

相比于 SysV 和其他 Linux 初始化系统，它提供了一些好用和卓越的组件，如下：

- 服务监控：每个服务都关联一个服务目录
- 清理进程状态，以保证每个进程处于干净状态
- 可靠的日志机制
- 快速的系统启动和关闭
- 可移植
- 打包方便
- 代码体积小等

访问 runit 主页：<http://smarden.org/runit/>

正如我之前所说的，Linux 中的初始化系统负责启动和管理所有的进程。此外，SysV 是 Linux 系统中主要的初始化系统，但由于一些性能缺陷，系统开发者已经开发出几个替代品。

在这里，我已经介绍了几个可用的替代方案，但你可能觉得有一些其他的初始化系统值得在此提及。请在下方的评论区将你的想法告诉我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/best-linux-init-systems/

作者：[Aaron Kili](http://www.tecmint.com/author/aaronkili/)
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


