了解用于 Linux 和 Windows 容器的 Docker “容器主机”与“容器操作系统”
=================

让我们来探讨一下“容器主机”和“容器操作系统”之间的关系，以及它们在 Linux 和 Windows 容器之间的区别。

### 一些定义

* <ruby>容器主机<rt>Container Host</rt></ruby>：也称为<ruby>主机操作系统<rt>Host OS</rt></ruby>。主机操作系统是 Docker 客户端和 Docker 守护程序在其上运行的操作系统。在 Linux 和非 Hyper-V 容器的情况下，主机操作系统与运行中的 Docker 容器共享内核。对于 Hyper-V，每个容器都有自己的 Hyper-V 内核。
* <ruby>容器操作系统<rt>Container OS</rt></ruby>：也被称为<ruby>基础操作系统<rt>Base OS</rt></ruby>。基础操作系统是指包含操作系统如 Ubuntu、CentOS 或 windowsservercore 的镜像。通常情况下，你将在基础操作系统镜像之上构建自己的镜像，以便可以利用该操作系统的部分功能。请注意，Windows 容器需要一个基础操作系统，而 Linux 容器不需要。
* <ruby>操作系统内核<rt>Operating System Kernel</rt></ruby>：内核管理诸如内存、文件系统、网络和进程调度等底层功能。

### 如下的一些图

![Linux Containers](http://floydhilton.com/images/2017/03/2017-03-31_14_50_13-Radom%20Learnings,%20Online%20Whiteboard%20for%20Visual%20Collaboration.png)

在上面的例子中：

*   主机操作系统是 Ubuntu。
*   Docker 客户端和 Docker 守护进程（一起被称为 Docker 引擎）正在主机操作系统上运行。
*   每个容器共享主机操作系统内核。
*   CentOS 和 BusyBox 是 Linux 基础操作系统镜像。
*   “No OS” 容器表明你不需要基础操作系统以在 Linux 中运行一个容器。你可以创建一个含有 [scratch][1] 基础镜像的 Docker 文件，然后运行直接使用内核的二进制文件。
*   查看[这篇][2]文章来比较基础 OS 的大小。

![Windows Containers - Non Hyper-V](http://floydhilton.com/images/2017/03/2017-03-31_15_04_03-Radom%20Learnings,%20Online%20Whiteboard%20for%20Visual%20Collaboration.png)

在上面的例子中：

*   主机操作系统是 Windows 10 或 Windows Server。
*   每个容器共享主机操作系统内核。
*   所有 Windows 容器都需要 [nanoserver][3] 或 [windowsservercore][4] 的基础操作系统。

![Windows Containers - Hyper-V](http://floydhilton.com/images/2017/03/2017-03-31_15_41_31-Radom%20Learnings,%20Online%20Whiteboard%20for%20Visual%20Collaboration.png)

在上面的例子中：

*   主机操作系统是 Windows 10 或 Windows Server。
*   每个容器都托管在自己的轻量级 Hyper-V 虚拟机中。
*   每个容器使用 Hyper-V 虚拟机内的内核，它在容器之间提供额外的分离层。
*   所有 Windows 容器都需要 [nanoserver][5] 或 [windowsservercore][6] 的基础操作系统。

### 几个好的链接

*   [关于 Windows 容器][7]
*   [深入实现 Windows 容器，包括多用户模式和“写时复制”来节省资源][8]
*   [Linux 容器如何通过使用“写时复制”来节省资源][9]

--------------------------------------------------------------------------------

via: http://floydhilton.com/docker/2017/03/31/Docker-ContainerHost-vs-ContainerOS-Linux-Windows.html

作者：[Floyd Hilton][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://floydhilton.com/about/
[1]:https://hub.docker.com/_/scratch/
[2]:https://www.brianchristner.io/docker-image-base-os-size-comparison/
[3]:https://hub.docker.com/r/microsoft/nanoserver/
[4]:https://hub.docker.com/r/microsoft/windowsservercore/
[5]:https://hub.docker.com/r/microsoft/nanoserver/
[6]:https://hub.docker.com/r/microsoft/windowsservercore/
[7]:https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/
[8]:http://blog.xebia.com/deep-dive-into-windows-server-containers-and-docker-part-2-underlying-implementation-of-windows-server-containers/
[9]:https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/#the-copy-on-write-strategy
