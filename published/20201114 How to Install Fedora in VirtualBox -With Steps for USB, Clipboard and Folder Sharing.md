[#]: collector: (lujun9972)
[#]: translator: (frogOAO)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12854-1.html)
[#]: subject: (How to Install Fedora in VirtualBox [With Steps for USB, Clipboard and Folder Sharing])
[#]: via: (https://itsfoss.com/install-fedora-in-virtualbox/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 VirtualBox 中安装 Fedora
======

如果你对 Fedora Linux 感兴趣，这有几种方式可以尝试它。

最简单还不影响你操作系统的方式是 [制作 Fedora 的 USB 临场启动盘][1]。

> **LCTT 译注**：
> 
> 在 Linux 发行版的使用方式上，有一种可以无需安装而通过光盘或 USB 存储棒直接在计算机上启动完整的 Linux 操作系统的方式，这种方式称之为 “Live” 方式，如 Live CD、Live USB。
> 
> 通常，Live 一词并不翻译，不过，我认为，除了英文缩写和部分历史原因造成直接使用的英文单词，大部分场景都应该使用本地化的语言来描述，否则，中英文混杂的港台式中文，实在有些不伦不类；抑或，外文翻译本身就不存在意义了。
> 
> 因此，对于 “Live” 一词如何翻译，我们也颇费心思。这个词，在维基百科中文中，被翻译为“[自生系统](https://zh.wikipedia.org/wiki/Live_CD)”，在某些场景下偶见 “现场”、“临场” 等翻译。考虑到 Live CD/USB 的特性，我认为翻译为 “临场” 比较好。
> 
> 于此抛出愚见，希望得到大家的积极反馈。wxy@LCTT

另一种方式是安装 VirtualBox 利用虚拟化技术来尝试 Fedora。这样，你可以在你的操作系统上像使用应用程序一样使用 Fedora。

通过这种方式，你可以执行更彻底的测试，而不会搞乱当前的操作系统。

你甚至可以复制你的虚拟环境，并在其他系统上重新安装它。听起来方便吗？让我来教你怎么做。

### 在 VirtualBox 上安装 Fedora

![][2]

让我们分步在 Oracle VirtualBox 上安装 Fedora。

#### 步骤一：安装 VirtualBox 

如果你的系统还没有安装 VirtualBox，你可以从官方网站下载。你可以找到 Windows、MacOs 和 Linux 的说明。 [Ubuntu 用户可以参考这个关于安装 VirtualBox 的详细教程。][3]

![][4]

- [下载 VirtualBox][5]

#### 步骤二： 下载 Fedora ISO

如果你不熟悉 Fedora，那么这些镜像你需要知道。

[Fedora IoT][6] 是用于可扩展基础设施的，[Fedora workstation][7] 是一个带有一组面向普通 GNOME 桌面环境中的桌面工具的镜像。[Fedora server][8] 顾名思义，是为服务器或数据中心定制的。

如果 GNOME 不是你的首选，你可以下载一个带有替代桌面环境的[定制版][9] Fedora 桌面。对于本教程，我选择了带有 GNOME 桌面环境的[Fedora 33][10]。

- [下载 Fedora][11]

#### 步骤三： 创建一个空虚拟机并对其进行配置

要成功安装和运行 Fedora，至少需要 20GB 磁盘空间和 2GB RAM。不过，为了获得更流畅的用户体验，建议增加一倍。在此基础上，我将创建并配置虚拟机。

开启 Virtual Box 点击 “New”。

![创建一个新的虚拟机][12]

需要注意，最重要的选项是 **将类型设置为 Linux ，版本设置为 Fedora (64-bit)**。如果你在名称提示符处开始输入 “Fedora”，VirtualBox 将自动为你选择正确的设置。虽然名字不一定非得是 Fedora，它可以是任何你喜欢的。

*如果你只能访问 32 位版本，那么你需要在 BIOS 上启用虚拟化技术，如果你有一个 AMD CPU，它被称为 SVM。最坏的情况是你的 CPU 不支持虚拟化技术。如果你不确定，先检查这个。

如果你的设置和我类似，点击 “create” 按钮。

![命名你的虚拟机，并未它指定至少 3 GB RAM][13]

如前所述，至少需要 20GB 的磁盘空间才能安装 Fedora。我的系统上有 32GB 的内存，所以我分配了 8GB 内存。3 GB 的内存应该也没问题。

顺便说下内存的使用，只有在运行虚拟机时，虚拟机才会使用内存。否则，它将可用于常规使用。

确保其余设置与示例匹配，并点击 “Create” 按钮。

![以 VDI 格式分配 15-20 GB 的磁盘空间][14]

在你点击虚拟机的 Start 按钮之前，你需要加载如下所示的 ISO [光驱]。

![将 Fedora ISO 添加到光驱存储中][15]

因为你的虚拟硬盘是空的，虚拟机将从这个 ISO 启动。可以把它看作是使用临场 USB 或磁盘安装 Linux。

![在设置中将 ISO 添加为光驱][16]

然后，如果你有一个多核 CPU，建议为虚拟机分配 2 个或更多的核。你可以在 “System” 选项卡下找到 CPU 核心。配置系统时，单击 “OK” 并启动虚拟机。

![可选：分配 CPU 核数][17]

配置好所有内容后，单击 “Start” 按钮开始安装。

#### 步骤四：在 VirtualBox 中安装 Fedora。

如果你正确地遵循了这个过程，那么当你启动虚拟机时，你将直接从 ISO 文件启动。当你看到类似下面的屏幕时，选择 “Start Fedora”，并按回车键。

![Fedora 运行在虚拟机的临场环境中][18]

要启动安装对话框，单击 “Install To Hard Drive”。

![点击 “install to hard drive”][19]

在你继续安装之前，有必要定义你的键盘布局、你的时区以及最终安装操作系统的位置。

![选择键盘布局、日期和时间，然后是安装目标位置][20]

分区过程很简单。你像前面的 VDI 那样划分一些空闲空间。它应该被自动识别。

选择你的磁盘并将存储配置设置为 “Automatic”。单击 “Done” 进入上一个对话框。

![磁盘应该会自动识别][21]

一旦你配置完了上面的，点击 “Begin Installation”。

![开始 Fedora 的安装][22]

现在只需等待 5 - 6 分钟即可完成安装。安装完成后，点击 “Finish installation” 按钮。

最后一步，需要关闭系统的电源。如果你不熟悉 GNOME 桌面环境，你可以如下这样做。

![安装后关闭 Fedora 临场环境][23]

你必须手动卸载在初始步骤中加载的 ISO 文件。

![从光驱中移走 Fedora ISO][24]

下一次使用 Fedora 启动虚拟机时，系统将提示你为 Fedora Linux 创建用户帐户并设置密码。

### 使用 VirtualBox Guest Additions 的附加功能，如剪贴板共享，文件夹共享等

[Guest Additions][25] 设计为在<ruby>访客<rt>guest</rt></ruby>操作系统安装后安装在虚拟机中。它们包含对客户操作系统进行优化的设备驱动程序和系统应用程序，以获得更好的性能和可用性。

Guest Additions ISO 文件被安装为虚拟 CD-ROM 以便安装。

这是一个简单的过程。只需单击设备选项卡，然后单击 “Insert Guest Additions CD image”。

![][26]

当提示单击 “Download” 时，系统将弹出下载 Guest Additions 镜像界面。

![安装 VirtualBox Guest Additions][27]

#### 共享剪贴板

有时候，你需要在虚拟机和<ruby>宿主机<rt>host</rt></ruby>操作系统之间移动一些内容。共享剪贴板/拖放支持将允许你在一个平台上复制项目，并将它们粘贴到另一个平台上。

要启用此功能，请在 VirtualBox 主页上选择 “Settings”，并按照下面的说明操作。“Bidirectional” 的选项是最方便的。

![启用访客和宿主系统间的剪贴板共享][28]

#### 共享文件夹

有两种类型的分享：

  * 永久共享，与虚拟机设置一起保存。
  * 暂时共享，当虚拟机关闭时就会消失。可以使用 VirtualBox 管理器中的复选框创建暂时共享。

在本教程中，我将创建一个永久共享文件夹。在 VM 设置中添加你想要共享的宿主机系统文件夹，并选择你想要在 VM 中出现的名称。

![][29]

下次启动虚拟机时，该文件夹应该显示为网络驱动器。

![][30]

#### 更好的视频支持

虽然 Oracle VirtualBox 提供了具有基本功能的虚拟显卡，但访客系统添加的自定义视频驱动程序为你提供了超高和非标准的视频模式，以及视频加速。

使用 Guest Additions，操作系统的分辨率将随着你调整计算机上的 VirtualBox 窗口而动态调整大小。

最后，Guest Additions 可以利用你的计算机的显卡。如果你是一名游戏玩家或在 WM 中使用高效软件，这就会产生巨大的改变。

#### USB 和网络设备共享

有了 VirtualBox，用户就可以使用一个功能齐全的操作系统，而不必在不同的硬件上进行设置。然而，在宿主机和访客机器之间共享 USB 和网络设备并不像想的那样简单。

要访问 USB 设备，你将需要安装 [VirtualBox 扩展包][31]。

![安装 VirtualBox 扩展包][32]

**下面这些仅对 Linux**，因为我使用的是 Linux。

为了使 VirtualBox 能够访问 USB 子系统，运行 VirtualBox 的用户（在宿主机系统上）必须属于 `vboxuser` 组。为此，打开一个终端并发出以下命令:

```
sudo usermod -aG vboxusers 'your username'
```

运行该命令后，你应该注销并重新登录，或者重新启动主机。

在这一步，插入你的 U 盘，通过你的 VM 设置，你应该能够找到并添加介质，如例子中所示。

![][33]

当你下次启动虚拟机，你的 USB 将是可访问的。

![][34]

### 额外提示：保存并导出虚拟机，以便以后可以在任何系统上使用它

你可能想在另一台计算机上使用虚拟机，或者是时候构建一台新机器了，并且你需要保持虚拟机的原样。只需几个简单的步骤，就可以轻松地导出当前设置并将其导入到另一台机器。

在 VirtualBox 主面板上，单击 “file”、“Export Appliance”。如果你喜欢键盘快捷键，你可以简单地点击 `Ctrl+E`。

![][35]

选择要导出的虚拟机，然后单击 “Next”。

![][36]

“Format” 选项需要注意一下。有三种不同的选项：<ruby>开放虚拟化格式<rt>Open Virtualization Format</rt></ruby> 0.9、1.0 和 2.0 ，可以是 ovf 或 ova 扩展名。

使用 ovf 扩展名，会分别写入几个文件，而 ova 扩展名则将所有文件合并到一个开放虚拟化格式归档文件中。

默认格式 OVF 1.0 应该没问题。

![][37]

要完成该过程，单击 “Next”，然后在下一个对话框中单击 “Export”。

### 总结

通过使用虚拟机，你不仅可以测试操作系统，还可以部署与物理机器同等重要的功能完整的系统。如今，硬件已经变得如此强大和廉价，它的大部分功能都没有被利用。

通过虚拟化技术，你可以使用这些浪费的资源。对物理机器的需求减少了，因此能源消耗也减少了。你可以从硬件和降低运行成本两方面省钱。

在大规模服务环境中，服务器虚拟化更多的是一种基本需求，而不是一种高级概念。

我希望本教程对你在 VirtualBox 中安装 Fedora Linux 有帮助。如果你遇到任何问题，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-fedora-in-virtualbox/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[frogOAO](https://github.com/frogOAO)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/create-fedora-live-usb-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/install-fedora-in-virtualbox.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/install-virtualbox-ubuntu/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/download-virtulabox.jpg?resize=799%2C294&ssl=1
[5]: https://www.virtualbox.org/
[6]: https://getfedora.org/en/iot/
[7]: https://getfedora.org/en/workstation/
[8]: https://getfedora.org/en/server/
[9]: https://spins.fedoraproject.org/
[10]: https://itsfoss.com/fedora-33/
[11]: https://getfedora.org/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/0.-create-a-new-vm.png?resize=800%2C550&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/1-create-vm-fedora.png?resize=800%2C533&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/2-fedora-vm-disk.png?resize=800%2C533&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-vm-settings-iso.png?resize=800%2C640&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/3-fedora-vm-settings2.png?resize=800%2C600&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/4-fedora-vm-cpu.png?resize=800%2C533&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/6-fedora-vm-boot.png?resize=800%2C600&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/7-fedora-vm-install-1.png?resize=800%2C622&ssl=1
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/9-fedora-vm-partitioning-2.png?resize=800%2C706&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/10-fedora-vm-hdd.png?resize=732%2C645&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/12-fedora-vm-installation-1.png?resize=800%2C706&ssl=1
[23]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/15-power-off-fedora-gnome.png?resize=800%2C706&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/remove-fedora-iso-from-optical-drive.png?resize=800%2C589&ssl=1
[25]: https://www.virtualbox.org/manual/ch04.html
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/16-Fedora-vm-guest-additions.png?resize=800%2C706&ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/17-Fedora-vm-guest-additions.png?resize=800%2C686&ssl=1
[28]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/19-fedora-vm-shared-clipboard-2.png?resize=800%2C650&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/20-fedora-vm-shared-folders-1.png?resize=800%2C650&ssl=1
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/22-fedora-vm-shared-folders2-1.png?resize=800%2C547&ssl=1
[31]: https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack
[32]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/21.-fedora-vm-extension-pack.png?resize=800%2C600&ssl=1
[33]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/25.-fedora-vm-usb-1.png?resize=800%2C527&ssl=1
[34]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/26.-fedora-vm-usb-1.png?resize=800%2C578&ssl=1
[35]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/23.-fedora-vm-export.png?resize=800%2C600&ssl=1
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/24.-fedora-vm-export-1.png?resize=800%2C545&ssl=1
[37]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/25.-fedora-vm-export-800x545.png?resize=800%2C545&ssl=1
