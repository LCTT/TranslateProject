[#]: subject: "30 things you didn't know about the Linux kernel"
[#]: via: "https://opensource.com/article/21/8/linux-kernel"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13724-1.html"

关于 Linux 内核的 30 件你不知道的事
======

> Linux 内核今年 30 岁了。

![](https://img.linux.net.cn/data/attachment/album/202108/27/150006o152rdghq0zqr02f.jpg)

Linux 内核今年 30 岁了。这开创性的开源软件的三个十年，让用户能够运行自由软件，让他们能从运行的应用程序中学习，让他们能与朋友分享他们所学到的知识。有人认为，如果没有 Linux 内核，我们如今所享受的 [开源文化][2] 和自由软件的累累硕果，可能就不会应时而出现。如果没有 Linux 作为催化剂，苹果、微软和谷歌所开源的那些就不可能开源。Linux 作为一种现象，对开源文化、软件开发和用户体验的影响，是怎么强调都不为过的，但所有这一切，都滥觞于一个 Linux 内核。

Linux 内核是启动计算机、并识别和确保计算机内外所连接的所有组件之间通信的软件。这些对于大多数用户从未想过，更不用说能理解的代码，Linux 内核有很多令人惊讶的地方。以下是 Linux 内核在其三十年生命中每一年的一件事。顺序无关。

  1. Linux 是第一个具有 USB 3.0 驱动的操作系统。Sarah Sharp 在 2009 年 6 月 7 日宣布她的 USB 3.0 设备的驱动程序可以使用了，她的代码被包含在内核 2.6.31 版本中。
  2. 当某些事件发生时，内核会将自己标记为“受污染”，这在以后的故障排除中可能有用。运行一个“被污染”的内核并不是什么问题。但如果出现错误，首先要做的是在一个没有被污染的内核上重现该问题。
  3. 你可以指定一个主机名或域名作为 `ip=` 内核命令行选项的一部分，Linux 会保留它，而不是用 DHCP 或 BOOTP 提供的主机名或域名来覆盖它。例如，`ip=::::myhostname::dhcp` 设置主机名 `myhostname`。
  4. 在文本启动过程中，可以选择显示黑白的、16 色的或 224 色的 Tux 徽标之一。
  5. 在娱乐业中，DRM 是一种用来防止访问媒介的技术。然而，在 Linux 内核中，DRM 指的是<ruby>直接渲染管理器<rt>Direct Rendering Manager</rt></ruby>，它指的是用于与对接显卡的 GPU 的库（`libdrm`）和驱动程序。
  6. 能够在不重启的情况下给 Linux 内核打补丁。
  7. 如果你自己编译内核，你可以将文本控制台配置为超过 80 列宽。
  8. Linux 内核提供了内置的 FAT、exFAT 和 NTFS（读和写）支持。
  9. Wacom 平板电脑和许多类似设备的驱动程序都内置在内核中。
  10. 大多数内核高手使用 `git send-email` 来提交补丁。
  11. 内核使用一个叫做 [Sphinx][3] 的文档工具链，它是用 Python 编写的。
  12. Hamlib 提供了具有标准化 API 的共享库，可以通过你的 Linux 电脑控制业余无线电设备。
  13. 我们鼓励硬件制造商帮助开发 Linux 内核，以确保兼容性。这样就可以直接处理硬件，而不必从制造商那里下载驱动程序。直接成为内核一部分的驱动程序也会自动从新版本内核的性能和安全改进中受益。
  14. 内核中包含了许多树莓派模块（Pi Hats）的驱动程序。
  15. netcat 乐队发布了一张只能作为 [Linux 内核模块][4] 播放的专辑。
  16. 受 netcat 发布专辑的启发，人们又开发了一个 [把你的内核变成一个音乐播放器][5] 的模块。
  17. Linux 内核的功能支持许多 CPU 架构：ARM、ARM64、IA-64、 m68k、MIPS、Nios II、PA-RISC、OpenRISC、PowerPC、s390、 Sparc、x86、Xtensa 等等。
  18. 2001 年，Linux 内核成为第一个 [以长模式运行的 x86-64 CPU 架构][6]。
  19. Linux 3.4 版引入了 x32 ABI，允许开发者编译在 64 位模式下运行的代码，而同时只使用 32 位指针和数据段。
  20. 内核支持许多不同的文件系统，包括 Ext2、Ext3、Ext4、JFS、XFS、GFS2、GCFS2、BtrFS、NILFS2、NFS、Overlay FS、UDF 等等。
  21. <ruby>虚拟文件系统<rt>Virtual File System</rt></ruby>（VFS）是 Linux 内核中的一个软件层，为用户运行的应用程序提供文件系统接口。它也是内核的一个抽象层，以便不同的文件系统实现可以共存。
  22. Linux 内核包括一个实体的盲文输出设备的驱动程序。
  23. 在 2.6.29 版本的内核中，启动时的 Tux 徽标被替换为 “Tuz”，以提高人们对当时影响澳大利亚的<ruby>塔斯马尼亚魔鬼<rt>Tasmanian Devil</rt></ruby>（即袋獾）种群的一种侵袭性癌症的认识。
  24. <ruby>控制组<rt>Control Groups</rt></ruby>（cgroups）是容器（Docker、Podman、Kubernetes 等的基础技术）能够存在的原因。
  25. 曾经花了大量的法律行动来解放 CIFS，以便将其纳入内核中，而今天，CIFS 模块已被内置于内核，以实现对 SMB 的支持。这使得 Linux 可以挂载微软的远程共享和基于云的文件共享。
  26. 对于计算机来说，产生一个真正的随机数是出了名的困难（事实上，到目前为止是不可能的）。`hw_random` 框架可以利用你的 CPU 或主板上的特殊硬件功能，尽量改进随机数的生成。
  27.  _操作系统抖动_ 是应用程序遇到的干扰，它是由后台进程的调度方式和系统处理异步事件（如中断）的方式的冲突引起的。像这些问题在内核文档中都有详细的讨论，可以帮助面向 Linux 开发的程序员写出更聪明的代码。
  28. `make menuconfig` 命令可以让你在编译前使用 GUI 来配置内核。`Kconfig` 语言定义了内核配置选项。
  29. 对于基本的 Linux 服务器，可以实施一个 _看门狗_ 系统来监控服务器的健康状况。在健康检查间隔中，`watchdog` 守护进程将数据写入一个特殊的 `watchdog` 内核设备，以防止系统重置。如果看门狗不能成功记录，系统就会被重置。有许多看门狗硬件的实现，它们对远程任务关键型计算机（如发送到火星上的计算机）至关重要。
  30. 在火星上有一个 Linux 内核的副本，虽然它是在地球上开发的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-kernel

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/kernel-30.png?itok=xmwX2pCQ (30 years)
[2]: https://opensource.com/article/18/1/creative-commons-real-world
[3]: https://opensource.com/article/19/11/document-python-sphinx
[4]: https://github.com/usrbinnc/netcat-cpi-kernel-module
[5]: https://github.com/FlaviaR/Netcat-Music-Kernel-Expansion
[6]: http://www.x86-64.org/pipermail/announce/2001-June/000020.html
