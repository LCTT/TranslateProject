我最现代化的“init”系统 （1922-2015）
============================================

在Linux和其他类Linux操作系统，init(initialization) 进程是内核启动时启动的第一个进程，它的进程 ID(PID) 是 1, 它在后台运行直到关机。


init 进程启动所有的其他进程，守护进程，服务和其他后台进程。因此，这是系统中所有进程的母进程。在系统中一个进程能启动很多其他的子进程，但是一旦父进程死亡，init进程会接管这些子进程。
![](http://www.tecmint.com/wp-content/uploads/2016/08/Linux-init-Systems.png)


这些年来，许多init系统在主要的Linux发行版中涌现，本指南中也都有所介绍，我们将来看看你能用在Linux系统上的一些最好的init系统。
### 1. System V Init

System V (SysV) 是一个在类unix系统上成熟而又受欢迎的 init 方案，在 Unix/Linux 系统上它是所有进程的父进程。SysV是第一个被设计的商用Unix操作系统。

几乎所有的Linux发行版最开始都是使用 SysV init 方案，除了Gentoo和Slackware，Gentoo 使用自己的 init，Slackware 使用 BSD-style init 方案。

随着时间的流逝，由于一些缺点，几个 SysV init 的替代品开始发展，意在创造更有效和完美的 Linux init 系统。

虽然这些选择设法提升SysV并且可能提供新的特性，但是他们仍然与最初的 SysV init 脚本兼容。
### 2. SystemD

在 Linux 平台 SystemD 是一个比较新的 init 方案。Fedora 在 15 版中引进，它有各种各样的工具便于系统管理。主要的目的还是初始化，在启动过程和运行过程中管理和跟踪所有的系统进程。

Systemd init 和其他传统的 Unix init 系统，实际的系统方法和服务管理在某种程度上彻底不同。当然它也兼容 SysV 和 LBS 脚本
It has some of the following eminent features:
它有以下一些杰出的特性：

-  简洁，简单高效的设计
- 在启动时并行和并发处理
- 更好的 APIv
- 允许删除可选进程
- 使用 journald 支持事件日志
- 支持使用systemd历法计时器作业调度
- 在二进制文件中存储日志
- 保存systemd状态以便未来参考开-
- 更好的整合更多 GNOME plus


查看 Systemd init 概述: <https://fedoraproject.org/wiki/Systemd>
### 3. Upstart


Upstart是一个 Ubuntu 的制造商开发的一个基于事件的 init 系统为了代替 SysV init 系统。它启动不同的系统任务和进程，监控它们当系统运行的时候并且当系统关闭的时候停止他们。


它是一个混合的 init 系统可以使用同时使用 SysV 和 Systemd 脚本，一些值得注意的特性包括
- 源于ubuntu但是也可在所有的其他发行版中运行
- 基于事件开始或停止任务和服务
- 在开始或停止任务和服务会产生事件
- 事件能由其他系统进程发送
- 可以通过 D-Bus 通信
- 用户可以启动或者停止他们自己的进程
- 再生突然死亡的服务等等

访问主页 <http://upstart.ubuntu.com/index.html>
### 4. OpenRC

OpenRC is a dependency-based init scheme for Unix-like operating systems, it is compatible with SysV init. As much as it brings some improvements to Sys V, you must keep in mind that OpenRC is not an absolute replacement for /sbin/init file.
OpenRC 是个基于依赖关系的类UNix操作系统的 init 方案，它和SysV init 对比，带来了尽可能多的提升，你必须要记住 OpenRC 不能绝对替代 /sbin/init 文件

它提供一些杰出的特性包括
- 它能运行于很多Linux分支包括Gentoo和BSD
- 支持硬件启动 init 脚本
- 支持单个配置文件
- 不支持每个服务配置
- 作为守护进程运行
- 并行启动服务等等

访问主页: <https://wiki.gentoo.org/wiki/OpenRC>
### 5. runit

runit 是个跨平台的 init 系统能在各种操作系统上运行，如 GNU/Linux，*BSD，MAC OS X，并且它可以替代 SysV init，也提供了服务监管

在Linux它展现了一些有利且非凡的成分，这些成分在 SysV init 中并没有可能在其他的init系统中也没有，它们包括:

 服务监控,每个服务都会和一个服务目录相关联
 清理内存状态,它保证了每个内存有个干净的状态
 有个可靠的日志记录设备
 快速启动和关机
 它是轻巧的
 包友好
小的代码量等等
访问主页: <http://smarden.org/runit/>

正如我前面所讲，在linux系统 init system 启动和管理所有其他的进程。另外，在Linux操作系统 SysV 是主要的 init 方案，，但是由于一些性能上的缺陷，系统程序员已经开发了一些去替代他.

在这里,我们看到了一些替代品,但是可能有其他的你觉得有价值的 init 系统没有提及,你能在下方评论让我们知道他.
--------------------------------------------------------------------------------

via: http://www.tecmint.com/best-linux-init-systems/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili ][a]
译者：[hkurj](https://github.com/hkurj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
