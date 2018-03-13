Docker 容器中的老式 DOS BBS
======
不久前，我写了一篇[我的 Debian Docker 基本映像][1]。我决定进一步扩展这个概念：在 Docker 中运行 DOS 程序。

但首先，一张截图：

![][2]

事实证明这是可能的，但很难。我使用了所有三种主要的 DOS 模拟器（dosbox、qemu 和 dosemu）。我让它们都能在 Docker 容器中运行，但有很多有趣的问题需要解决。

普遍要做的事是在 DOS 环境下提供一个伪造的调制解调器。这需要作为 TCP 端口暴露在容器外部。这有很多方法可以做到 - 我使用的是 tcpser结。dosbox 有一个  TCP 调制解调器接口，但事实证明，这样做太问题太多了。

挑战来自你希望能够一次接受多个传入 telnet（或 TCP）连接。DOS 不是一个多任务操作系统，所以当时有很多 hack 的方法。一种是有多台物理机，每个有一根传入电话线。或者它们可能会在 [DESQview][3]、OS/2 甚至 Windows 3.1 等多任务层下运行多个伪 DOS 实例。

（注意：我刚刚了解到 [DESQview/X][4]，它将 DESQview 与 X11R5 集成在一起，并[取代了 Windows 3 驱动程序][5]来使 Windows 作为 X 应用程序运行。）

出于各种原因，我不想尝试在 Docker 中运行其中一个系统。这让我模拟了原来的多物理节点设置。从理论上讲，非常简单 - 运行一组 DOS 实例，每个实例最多使用 1MB 的模拟 RAM，这就行了。但是这里面临挑战。

在多物理节点设置中，你需要某种文件共享，因为你的节点需要访问共享消息和文件存储。在老式的 DOS 时代，有很多笨重的方法可以做到这一点 - [Netware][6]、[LAN manager][7]，甚至一些 PC NFS 客户端。我没有访问 Netware。我尝试了 DOS 中的 Microsoft LM 客户端，与在 Docker 容器内运行的 Samba 服务器交互。这样可以使用，但 LM 客户端即使有各种高内存技巧还是占用了很多内存，BBS 软件也无法运行。我无法在多个 dosbox 实例中挂载底层文件系统，因为 dosbox 缓存不兼容。

这就是为什么我使用 dosemu 的原因。除了有比 dosbox 更完整的模拟器之外，它还有一种共享主机文件系统的方式。


所以, 所有这一切都在此：[jgoerzen/docker-bbs-renegade][8]。

我还为其他想做类似事情的人准备了构建块：[docker-dos-bbs][9] 和底层 [docker-dosemu][10]。

意外的收获是，我也试图在 Joyent 的 Triton（基于 Solaris 的 SmartOS）下运行它。让我感到高兴的印象是，这几乎可以在这下工作。是的，在 Solaris 机器上在一个基于 Linux 的 DOS 模拟器的容器中运行  Renegade DOS BBS。


--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9836-an-old-dos-bbs-in-a-docker-container

作者：[John Goerzen][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/archives/author/jgoerzen
[1]:https://changelog.complete.org/archives/9794-fixing-the-problems-with-docker-images
[2]:https://raw.githubusercontent.com/jgoerzen/docker-bbs-renegade/master/renegade-login.png
[3]:https://en.wikipedia.org/wiki/DESQview
[4]:http://toastytech.com/guis/dvx.html
[5]:http://toastytech.com/guis/dvx3.html
[6]:https://en.wikipedia.org/wiki/NetWare
[7]:https://en.wikipedia.org/wiki/LAN_Manager
[8]:https://github.com/jgoerzen/docker-bbs-renegade
[9]:https://github.com/jgoerzen/docker-dos-bbs
[10]:https://github.com/jgoerzen/docker-dosemu
