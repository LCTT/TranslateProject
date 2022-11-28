[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12769-1.html)
[#]: subject: (Try Linux on any computer with this bootable USB tool)
[#]: via: (https://opensource.com/article/20/10/fedora-media-writer)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

用这个创建可引导 USB 的工具在电脑上尝试 Linux
======

> Fedora Media Writer 是创建临场版 USB 以尝试 Linux 的方便方法。

![](https://img.linux.net.cn/data/attachment/album/202010/30/122142c1cmcv7cxgjmw5vw.jpg)

[Fedora Media Writer][2] 是一个小巧、轻量、全面的工具，它简化了 Linux 的入门体验。它可以下载 Fedora 的 Workstation 或 Server 版本并写入到一个可以在任何系统上引导的 USB 驱动器上，使你无需将其安装到硬盘上就可以试用 Fedora Linux。

Media Writer 工具可以用来创建一个<ruby>临场体验的<rt>Live</rt></ruby>、可引导的 USB 驱动器。在你的平台上安装 Fedora Media Writer 应用后，你可以下载并烧录最新的 Fedora Workstation 或 Server 稳定版，也可以选择烧录你下载的任何其他镜像。而且它并不局限于英特尔 64 位设备。它还可以用于 ARM 设备，如[树莓派][3]，这些设备日益变得更加强大和有用。

![Fedora Media Writer main screen][4]

### 安装 Fedora Media Writer

[安装 Fedora Media Writer][6] 有几种方式。你可以通过 GitHub [从源码编译][7]、下载 MacOS 或 Windows 版本、使用 `dnf` 或 `yum` 安装 RPM 包，或者以 Flatpak 的形式获得。

在 Fedora 上：

```
$ sudo dnf install mediawriter
```

最新版本请参见 GitHub 仓库的[发布][8]部分。

### 准备好你的媒体介质

首先，你需要一个 USB 驱动器来安装你的 Linux 操作系统。这就是 Fedora Media Writer 要烧录的设备。这个驱动器必须是空白或可擦除的，因为 **该 USB 驱动器上的所有数据都会被删除**。如果有任何数据，哪怕只是一个文件，如果你不想丢失，那么你必须在继续之前备份它！

确认你的 USB 驱动器是可擦除的之后，将它插入你的电脑并启动 Fedora Media Writer。

### 使用 Fedora Media Writer

当你启动 Fedora Media Writer 时，你会看到一个页面，提示你从互联网上获取一个可引导的镜像，或者从你的硬盘上加载一个自定义镜像。第一个选择是 Fedora 的最新版本。Workstation 版本适用于台式机和笔记本电脑，Server 版本适用于虚拟化、机架服务器或任何你想作为服务器运行的情况。

如果你选择了 Fedora 镜像，Media Writer 会下载一个光盘镜像（通常称为 “iso”，文件扩展名为 .iso），并将其保存到你的下载文件夹中，这样你就可以重复使用它来烧录另一个驱动器。

![Select your image][9]

另外还有 Fedora Spins，这是来自 Fedora 社区的镜像，它旨在满足小众的兴趣。例如，如果你是 [MATE 桌面][10]的粉丝，那么你会很高兴地发现 Media Writer 提供了 MATE spin。它有很多，所以请滚动查看所有的选择。如果你是 Linux 的新手，不要被吓到或感到困惑：这些额外的选项是为老用户准备的，这些用户除了默认的选项外，还发展出了自己的偏好，所以对你来说，只使用 Workstation 或 Server 选项就行，这取决于你是想把 Fedora 作为一个桌面还是作为一个服务器操作系统来运行。

如果你需要一个与你当前使用的 CPU 不同架构的镜像，从窗口右上角的下拉菜单中选择 CPU 架构。

如果你已经将镜像保存在硬盘上，请选择“Custom Image”选项，并选择你要烧录到 USB 的发行版的 .iso 文件。

### 写入 USB 驱动器

当你下载或选择了一个镜像，你必须确认你要将该镜像写入驱动器。

驱动器选择下拉菜单只显示了外部驱动器，所以你不会意外地覆盖自己的硬盘驱动器。这是 Fedora Media Writer 的一个重要功能，它比你在网上看到的许多手动说明要安全得多。然而，如果你的计算机上连接了多个外部驱动器，除了你想覆盖的那个，你应该将它们全部移除，以增加安全性。

选择你要安装镜像的驱动器，然后单击“Write to Disk”按钮。

![Media write][11]

稍等一会儿，镜像就会被写入到你的驱动器，然后可以看看 Don Watkins 对[如何从 USB 驱动器启动到 Linux][12]的出色介绍。

### 开始使用 Linux

Fedora Media Writer 是一种将 Fedora Workstation 或 Server，或任何 Linux 发行版烧录到 USB 驱动器的方法，因此你可以在安装它到设备上之前试用它。试试吧，并在评论中分享你的经验和问题。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/fedora-media-writer

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/usb-hardware.png?itok=ROPtNZ5V (Multiple USB plugs in different colors)
[2]: https://github.com/FedoraQt/MediaWriter
[3]: https://fedoraproject.org/wiki/Architectures/ARM/Raspberry_Pi
[4]: https://opensource.com/sites/default/files/uploads/fmw_mainscreen.png (Fedora Media Writer main screen)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://docs.fedoraproject.org/en-US/fedora/f32/install-guide/install/Preparing_for_Installation/#_fedora_media_writer
[7]: https://github.com/FedoraQt/MediaWriter#building
[8]: https://github.com/FedoraQt/MediaWriter/releases
[9]: https://opensource.com/sites/default/files/mediawriter-image.png
[10]: https://opensource.com/article/19/12/mate-linux-desktop
[11]: https://opensource.com/sites/default/files/mediawriter-write.png (Media write)
[12]: https://opensource.com/article/20/4/first-linux-computer
