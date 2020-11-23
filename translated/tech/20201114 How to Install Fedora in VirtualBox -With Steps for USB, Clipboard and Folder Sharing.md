[#]: collector: (lujun9972)
[#]: translator: (frogOAO)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Fedora in VirtualBox [With Steps for USB, Clipboard and Folder Sharing])
[#]: via: (https://itsfoss.com/install-fedora-in-virtualbox/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 Fedora 中安装 VirtualBox 【附带 USB，剪切板，文件夹共享教程】
======

如果您对 Fedora Linux 感兴趣，这有几种方式可以尝试它。

最简单还不影响您操作系统的方式是 [制作 Fedora 的 USB 启动盘][1]

另一种方式是安装 VirtualBox 利用虚拟化技术来尝试 Fedora。这样，你可以在你的操作系统上像使用应用程序一样使用 Fedora。

通过这种方式，您可以执行更彻底的测试，而不会搞乱当前的操作系统。

您甚至可以复制您的虚拟安装程序，并在其他系统上重新安装它。听起来方便吗?让我来教你怎么做。

### 在 Fedora 上安装 Fedora

![][2]

让我们分步在 Oracle VirtualBox 上安装 Fedora。

#### 步骤一：安装 VirtualBox 

如果您的系统还没有安装 VirtualBox，您可以从官方网站下载。您可以找到 Windows，MacOs 和 Linux 的说明。 [Ubuntu 用户可以参考这个关于安装 VirtualBox 的详细教程。][3].

![][4]

[下载 VirtualBox][5]

#### **步骤二： 下载 Fedora ISO**

如果您不熟悉 Fedora，那么这些镜像您需要知道。

[Fedora IoT][6] 是用于可扩展基础设施的， [Fedora workstation][7] 是一个镜像，带有一组面向普通GNOME桌面环境中的桌面的工具。[Fedora server][8] 顾名思义，是为服务器或数据中心定制的。

如果GNOME不是您的首选，您可以下载一个带有替代桌面环境的[定制版][9]Fedora桌面。 对于本教程，我选择了带有GNOME桌面环境的[Fedora 33][10]。

[下载 Fedora][11]

#### 步骤三： 创建一个空虚拟机并对其进行配置

要成功安装和运行 Fedora，至少需要 20GB 磁盘空间和 2GB RAM。不过，为了获得更流畅的用户体验，建议增加一倍。在此基础上，我将创建并配置虚拟机。

开启 Virtual Box 点击 New。

![创建一个新的虚拟机][12]

需要注意，最重要的选项是 **将类型设置为 Linux and 版本设置为 Fedora (64-bit)**。如果您在名称提示符处开始输入 Fedora，VirtualBox 将自动为您选择正确的设置。虽然名字不一定非得是 Fedora，它可以是任何你喜欢的。

_如果您只能访问 32 位版本，那么您需要在 BIOS 上启用虚拟化技术，如果您有一个 AMD CPU，它被称为 SVM。最坏的情况是您的 CPU 不支持虚拟化技术。如果你不确定，先检查这个。_

如果您的设置和我一样，点击 create 按钮。

![Name your VM and assign it at least 3 GB RAM][13]

如前所述，至少需要 20gb 的磁盘空间才能安装 Fedora。我的系统上有 32gb 的内存，所以我分配了 8gb。3 GB 的内存应该没问题。

顺便说下内存的使用，只有在运行虚拟机时，虚拟机才会使用内存。否则，它将可用于常规使用。

确保其余设置与示例匹配，并点击 Create。

![Assign 15-20 GB of disk space in VDI format][14]

在你点击虚拟机的 Start 按钮之前，你需要加载如下所示的 ISO [光驱]。

![Add the Fedora ISO to optical drive storage][15]

因为你的虚拟硬盘是空的，虚拟机将从这个 ISO 启动。可以把它看作是使用 live USB 或磁盘安装 Linux。

![Go to Settings and add ISO as optical drive][16]

然后，如果您有一个多核CPU，建议为虚拟机分配 2 个或更多的核。您可以在 system 选项卡下找到 CPU 核心。配置系统时，单击 ok 并启动虚拟机。

![Optional step: Assign number of CPU cores][17]

配置好所有内容后，单击 start 按钮开始安装。

#### 步骤四：在 VirtualBox 中安装 Fedora。

如果您正确地遵循了这个过程，那么当您启动虚拟机时，您将直接从 ISO 文件启动。当您看到类似下面的屏幕时，选择 Start Fedora，并按 enter 键。

![Fedora running in live environment in virtual machine][18]

要启动安装对话框，单击 Install To Hard Drive。

![Click on “install to hard drive”][19]

在您继续安装之前，有必要定义您的键盘布局、您的时区以及最终安装操作系统的位置。

![Choose keyboard, time and date and then go to Installation Destination][20]

划分过程很简单。您像前面的 VDI 那样划分一些空闲空间。它应该被自动识别。


选择您的磁盘并将存储配置设置为 automatic。单击 Done 进入上一个对话框。

![Disk should be automatically recognized][21]

一旦你配置了上面的，点击 “Begin Installation”。

![Begin installation of Fedora][22]

现在只需等待 5 - 6 分钟即可完成安装。安装完成后，点击 “Finish installation” 按钮。

最后一步，需要关闭系统的电源。如果您不熟悉 GNOME 桌面环境，您可以这样做。

![Turn off Fedora live environment after installation][23]

您必须手动卸载在初始步骤中加载的 ISO 文件。

![Remove Fedora ISO From Optical Drive][24]

下一次使用 Fedora 启动虚拟机时，系统将提示您为 Fedora Linux 创建用户帐户并设置密码。

### 使用 VirtualBox 客户添加的附加功能，如剪贴板共享，文件夹共享等

[增强功能包][25] 客户附加程序设计为在客户操作系统安装后安装在虚拟机中。它们包含对客户操作系统进行优化的设备驱动程序和系统应用程序，以获得更好的性能和可用性。

客户添加 ISO 文件被安装为虚拟 CD-ROM 以便安装。

这是一个简单的过程。只需单击设备选项卡，然后单击 “Insert Guest Additions CD image”。

![][26]

当提示符单击 download 时，系统将弹出您下载增强功能包界面。

![Install VirtualBox Guest Additions][27]

#### **共享剪贴板**

有时候，您需要在虚拟机和主机操作系统之间移动一些内容。共享剪贴板/拖放支持将允许您在一个平台上复制项目，并将它们粘贴到另一个平台上。

要启用此功能，请在VirtualBox主页上选择 **Settings**，并按照下面的说明操作。**双向** 的选项是最方便的。

![Enable clipboard sharing between guest and host systems][28]

#### **共享文件夹**

有两种类型的分享：

  * 永久共享，与虚拟机设置一起保存。
  * 暂态共享，当虚拟机关闭时就会消失。可以使用 VirtualBox 管理器中的复选框创建暂态共享。



在本教程中，我将创建一个永久共享文件夹。在 VM 设置中添加您想要共享的主机系统文件夹，并选择您想要在 VM 中出现的名称。

![][29]

下次启动虚拟机时，该文件夹应该显示为网络驱动器。

![][30]

#### **更好的视频支持**

虽然 Oracle VirtualBox 提供了所有基本功能的虚拟显卡，但客户添加的自定义视频驱动程序为您提供了超高和非标准的视频模式，以及加速的视频性能。

使用增强安装包，操作系统的分辨率将随着您调整计算机上的 VirtualBox 窗口而动态调整大小。

最后，增强安装包可以利用您的计算机的显卡。如果你是一名游戏玩家或在 WM 中使用高效软件，这就会产生巨大的改变。

#### USB 和网络设备共享

有了 VirtualBox，用户就可以使用一个功能齐全的操作系统，而不必在不同的硬件上进行设置。然而，在主机和客户机器之间共享USB和网络设备并不像想的那样简单。

要访问USB设备，您将需要安装 [VirtualBox 扩展包][31].

![Install VirtualBox Extensions pack][32]

_**下面这些仅对 Linux**_，因为我使用的是 Linux。

为了使 VirtualBox 能够访问 USB 子系统，运行 VirtualBox 的用户(在主机系统上)必须属于 vboxuser 组。为此，打开一个终端并发出以下命令:

```
sudo usermod -aG vboxusers 'your username'
```

运行该命令后，您应该注销并重新登录，或者重新启动主机。

在这一步，插入你的 u 盘，通过你的 VM 设置，你应该能够找到并添加介质，如例子中所示。

![][33]

当您下次启动虚拟机，您的USB将是可访问的。

![][34]

### 额外提示：保存并导出虚拟机，以便以后可以在任何系统上使用它

您可能想在另一台计算机上使用虚拟机，或者是时候构建一台新机器了，并且您需要保持虚拟机的原样。只需几个简单的步骤，就可以轻松地导出当前设置并将其导入到另一台机器。

在 VirtualBox 主面板上，单击 file 和 export 工具。如果你喜欢键盘快捷键，你可以简单地点击 **Ctrl+E**

![][35]

选择要导出的虚拟机，然后单击 next。

![][36]

格式选项需要注意一下。开放虚拟化格式 0.9、1.0 和 2.0 有三种不同的选项，可以是 ovf 或 ova 扩展。


使用 ovf 扩展名，可以分别编写几个文件，而 ova 扩展名则将所有文件合并到一个开放的虚拟化格式归档文件中。


默认格式 Open Virtualization format 1.0 应该没问题。

![][37]

要完成该过程，单击 next，然后在下一个对话框中单击 export。

#### 总结

通过使用虚拟机，您不仅可以测试操作系统，还可以部署与物理机器同等重要的功能完整的系统。如今，硬件已经变得如此强大和廉价，它的大部分功能都没有被利用。


通过虚拟化技术，您可以使用这些浪费的资源。对物理机器的需求减少了，因此能源消耗也减少了。您可以从硬件和降低运行成本两方面省钱。


在更大的范围内，服务器虚拟化更多的是一种基本需求，而不是一种高级概念。


我希望本教程对您在 VirtualBox 中安装 Fedora Linux 有帮助。如果你遇到任何问题，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-fedora-in-virtualbox/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/frogOAO)
校对：[校对者ID](https://github.com/校对者ID)

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
