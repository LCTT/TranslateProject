[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Guide to Install VMware Tools on Linux)
[#]: via: (https://itsfoss.com/install-vmware-tools-linux)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

在 Linux 上安装 VMware 工具的教程
======

**VMware 工具通过允许你分享剪贴板和文件夹以及其他东西来提升你的虚拟机体验。了解如何在 Ubuntu 和其它 Linux 发行版上安装 VMware 工具**

在先前的教程中，你学习了[在 Ubuntu 上安装 VMware 工作站][1]。你可以通过安装 VMware 工具进一步提升你的虚拟机功能。

如果你已经在 VMware 上安装了一个访客系统，你必须要注意 [VMware 工具][2]的要求-尽管并不完全清楚到底有什么要求。

在本文中，我们将要强调 VMware 工具的重要性，所提供的特性，以及在 Ubuntu 和其它 Linux 发行版上安装 VMware 工具的方法。

### VMware 工具：概览及特性

![在 Ubuntu 上安装 VMware 工具][3]在 Ubuntu 上安装 VMware 工具

出于显而易见的的理由，虚拟机（你的客机系统）将不会与主机上的表现完全一致。在其性能和操作上会有特定的限制。而那是为什么工具箱（VMware 工具）被引入的原因。

VMware 工具以一种高效的形式在提升了其性能的同时，帮助管理访客系统。


#### VMware 工具到底负责什么？

![如何在在 Linux 上安装 VMware 工具][4]

你已大致了解它做什么了-但让我们探讨一下细节：

* 同步访客系统与主机系统间的时间以简化事务
* 解锁从主机系统向客机系统传递消息的能力。比如说，你可以复制文字到剪贴板并将它轻松粘贴到你的客机系统。
* 在客机系统启用声音
* 提升视频分辨率
* 修正错误网络速度数据
* 减少不合适的色深



当你在客机系统上安装 VMware 工具时有重大改变。但是它到底包含什么特性以解锁/提升这些功能呢？然让我们来看看。。

#### VMware 工具：核心特性细节

![用 VMware 工具在主机系统与客机系统间分享剪切板][5]用 VMware 工具在主机系统与客机系统间分享剪切板

如果你不想知道它包含什么来启用这些功能的话，你可以跳过这部分。但是为了好奇的读者，让我们简短地讨论它一下：

**VMware 设备驱动：** 它真的取决于系统。大多数主流操作系统确实默认包括设备驱动。因此你不必另外安装它。这主要涉及-内存控制驱动，鼠标驱动，音频驱动，NIC 驱动，VGA 驱动以及其它。

**VMware 用户处理：** 这是事情变得十分有趣的地方。通过它你获得了在客机和主机间复制粘贴和拖拽的能力。你基本上可以从主机复制粘贴到虚拟机，反之亦然。

你同样也可以拖拽文件。此外，在你未安装 SVGA 驱动时它会启用指针释放/锁定。

**VMware工具生命周期管理：** 嗯我们会在下面看看如何安装 VMware 工具，但是这个特性帮你在虚拟机中轻松安装/升级 VMware 工具。

**分享文件夹**：除了这些。VMware 工具同样允许你在客机与主机系统间分享文件夹。

![使用 VMware 工具在客机与主机系统间分享文件][6]使用 VMware 工具在客机与主机系统间分享文件

当然，它的效果同样取决于客机系统。例如在 Windows 上你通过 Unity 模式在虚拟机上运行程序并从主机系统上操作它。

### 如何在 Ubuntu 和其它 Linux 发行版上安装 VMware 工具

**注意：** 对于 Linux 操作系统，你应该已经安装好了“Open VM 工具”，大多数情况下移除了额外安装 VMware 工具的需求。

大部分时候，当你安装了客机系统时，如果操纵系统支持 [Easy Install][7] 的话你会收到软件更新弹窗告诉你安装 VMware 工具。

Windows 和 Ubuntu 不支持 Esay Install。因此即使你使用 Windows 作为你的主机或尝试在 Ubuntu 上安装 VMware 工具，你应该有一个和弹窗消息差不多的选项来轻松安装 VMware 工具。这是它应该看起来的样子：


![安装 VMware 工具的弹窗][8]安装 VMware 工具的弹窗

这是搞定它最简便的办法。因此当你配置虚拟机时确保你有一个通畅的网络连接。

如果你没收到任何弹窗-或者选项来轻松安装VMware 工具。你需要手动安装它。以下是如何去做：
1\. 运行工作站播放器。
2\. 从菜单导航至**虚拟机->安装 VMware 工具**。如果你已经安装了它并想修复安装，你会看到“**重新安装 VMware 工具**”这一选项出现。
3\. 一旦你点击了，你就会看到一个虚拟 CD/DVD 挂载在客户系统上。
4\. 打开并复制粘贴 **tar.gz** 文件到任何你选择的区域并解压，这里我们选择**桌面**。

![][9]

5\. 在解压后运行终端并通过输入以下命令导航至里面的文件夹：

```
cd Desktop/VMwareTools-10.3.2-9925305/vmware-tools-distrib
```

你需要检查文件夹与路径名-取决于版本与解压目的地-名字可能会改变。

![][10]

Replace **Desktop** with your storage location (such as cd Downloads) and the rest should remain the same if you are installing **10.3.2 version**.

6\. 现在仅需输入以下命令开始安装：

```
sudo ./vmware-install.pl -d
```

![][11]

你会被询问密码以获得安装权限，输入密码然后应当一切都搞定了。

到此为止了，你搞定了。这系列步骤应当适用于几乎大部分基于 Ubuntu 的客机系统。如果你想要在 Ubuntu 服务器上或其它系统安装 VMware 工具，步骤应该类似。

**总结**

在 Ubuntu Linux 上安装 VMware 工具应该挺简单。除了简单办法，我们也详述了手动安装的方法。如果你仍需帮助或者对安装有任何建议，在评论区评论让我们知道。


--------------------------------------------------------------------------------


via: https://itsfoss.com/install-vmware-tools-linux

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[2]: https://kb.vmware.com/s/article/340
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools-downloading.jpg?fit=800%2C531&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/install-vmware-tools-linux.png?resize=800%2C450&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools-features.gif?resize=800%2C500&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools-shared-folder.jpg?fit=800%2C660&ssl=1
[7]: https://docs.vmware.com/en/VMware-Workstation-Player-for-Linux/15.0/com.vmware.player.linux.using.doc/GUID-3F6B9D0E-6CFC-4627-B80B-9A68A5960F60.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools.jpg?fit=800%2C481&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools-extraction.jpg?fit=800%2C564&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools-folder.jpg?fit=800%2C487&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmware-tools-installation-ubuntu.jpg?fit=800%2C492&ssl=1
