[#]: subject: "Boot From a USB Drive in VirtualBox in Linux"
[#]: via: "https://itsfoss.com/virtualbox-boot-from-usb/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 的 VirtualBox 中从 USB 驱动器启动
======

有一个实时 Linux USB 吗？ 在当前系统上测试它的常用方法是重新启动并在系统重新启动时选择从实时 USB 启动。

但这很烦人，因为你需要停止计算机上的工作并重新启动它。

一种破坏性较小的方法是使用虚拟机。

是的，你可以使用 VirtualBox 从虚拟机中的 USB 启动。这样，你不必为了尝试而在 VM 中安装发行版。请改用实时会话。

在本教程中，我将展示在 Linux 系统上的 VirtualBox 中从 USB 驱动器启动的步骤。这需要一些时间和精力，但可以让你免于重启系统。

### Linux 的 VirtualBox 中从 USB 驱动器启动

由于这是针对高级用户的教程，因此我省略了你事先需要的几个步骤：

  * 在 Linux 系统上安装 VirtualBox
  * 实时 Linux USB，最好是[使用 Ventoy][1]



![][2]

本指南分为三个部分：

  * 创建虚拟机磁盘文件
  * 在 VM 中使用 USB 启动
  * 删除虚拟机磁盘（可选）



那么让我们从第一个开始。

#### 步骤 1：创建虚拟机磁盘文件（VMDK）

首先，你需要识别 USB 驱动器的磁盘名称，为此，你需要[列出系统的驱动器][3]。

为此，我将使用 lsblk 命令：

```

    lsblk

```

![][4]

🚧

确保使用不带任何数字的磁盘名称。就我而言，Ventoy 以 sdb1 命名，但我仍然只能使用 sdb。


从上图中，你可以看到，Ventoy 列出了 `sdb11`，但你必须使用不带任何数字的名称。这意味着我必须只使用 `sdb`，否则，它会抛出错误。

找到驱动器名称后，使用以下命令中的 VBoxManage 命令来创建：

```

    sudo VBoxManage createmedium disk --filename=/path/to/rawdisk.vmdk --variant=RawDisk --format=VMDK --property RawDrive=/dev/sda

```

在上面的命令中，将 `/path/to/rawdisk.vmdk` 替换为要保存文件的路径 ，将 `/dev/sda` 替换为目标驱动器。

就我而言，我想在我的主目录中创建一个名为 `IF.vmdk` 的文件，并且我的目标驱动器是 `/dev/sdb`，然后，我将使用以下命令：

📋

你需要提供绝对路径来创建 vmdk 文件！

```

    sudo VBoxManage createmedium disk --filename=/home/sagar/IF.vmdk --variant=RawDisk --format=VMDK --property RawDrive=/dev/sdb

```

![][5]

最后，使用 chmod 命令更改权限：

```

    sudo chmod 777 Filename.vmdk

```

![][6]

#### 步骤 2：在 Linux 的 VirtualBox 中从 USB 启动

首先，从系统菜单中打开 VirtualBox，然后单击`新建`按钮。

在那里，为你的虚拟机命名并选择操作系统类型及其版本：

![][7]

现在，单击`下一步`按钮，它会要求你为虚拟机分配硬件资源：

![][8]

完成硬件资源分配后，单击`下一步`按钮。

在这里，你将找到创建或添加虚拟磁盘的选项。现在，请执行 3 个简单步骤：

  * 选择第二个选项`使用现有虚拟硬盘文件`。
  * 单击`文件`图标。
  * 点击`添加`按钮并选择你最近创建的以 `.vmdk` 结尾的文件。



![][9]

选择文件后，它将显示文件的名称，选择它并点击`选择`选项：

![][10]

它将向你显示已选择从中启动的文件。单击下一步，它将显示你所做的选择的摘要。

点击`完成`按钮：

![][11]

就是这样！ 虚拟机已创建。

要启动虚拟机，首先选择虚拟机并单击启动按钮：

![][12]

由于我的 USB 有 Ventoy，你可以看到，此处列出了多个发行版：

![][13]

很酷。是么？

#### 步骤 3：使用删除虚拟机及 vmdk 文件（可选）

当我在删除虚拟机后尝试删除 vmdk 文件时，当然，它被删除了，但每当我尝试创建具有相同名称的新文件时，它都会给我一个错误，说该文件已经存在！

因此，在这里，我将引导你了解如何删除虚拟机及 vmdk 文件。

首先，关闭虚拟机并将其删除

![][14]

现在，如果你尝试[使用 rm 命令][15]并提升权限删除 vmdk 文件，你可以删除它（但这就是幻觉的开始）。

例如，在这里，我删除了 IF.vmdk 文件：

```

    sudo rm IF.vmdk

```

![][16]

现在，如果我尝试创建一个具有相同名称的新 vmdk 文件，则会出现错误，指出该文件已存在：

![][17]

要删除 vmdk 文件，首先，你必须使用以下命令取消注册该文件：

```

    sudo VBoxManage closemedium disk /path/to/MyDrive.vmdk

```

![][18]

完成后，你可以使用 rm 命令删除该文件，它将轻松删除：

```

    sudo rm Filename.vmdk

```

然后，如果你尝试创建具有相同文件名的 vmdk 文件，你可以这样做：

![][19]

这就行了！

### 更多虚拟机技巧

如果你正在寻找最快的 VM，可以使用 Qemu + KVM 的组合。我知道这听起来很复杂。

但为了让事情变得简单，我们制作了一份关于如何在 Ubuntu 上安装和使用 Qemu 的专门指南，包括启用共享文件夹、剪贴板和自动调整大小：

![][2]

我希望本指南对你有所帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/virtualbox-boot-from-usb/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/use-ventoy/
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://linuxhandbook.com/linux-list-disks/
[4]: https://itsfoss.com/content/images/2023/07/list-drives-in-Linux.png
[5]: https://itsfoss.com/content/images/2023/07/create-virtual-machine-disk-drive-for-virtualbox-to-boot-from-USB-drive-in-Linux.png
[6]: https://itsfoss.com/content/images/2023/07/use-chmod-command-to-change-the-permissions.png
[7]: https://itsfoss.com/content/images/2023/07/Create-VM-in-VirtualBox-to-boot-from-USB-in-Linux.png
[8]: https://itsfoss.com/content/images/2023/07/allocate-RAM-and-cores-to-Vm-to-boot-from-USB-in-VirtualBox-in-Linux.png
[9]: https://itsfoss.com/content/images/2023/07/add-virtual-machine-disk-drive-in-VirtualBox-to-boot-from-USB-in-Linux.png
[10]: https://itsfoss.com/content/images/2023/07/select-the-vmdk-file.png
[11]: https://itsfoss.com/content/images/2023/07/Finish-the-VM-creation-to-boot-from-USB-in-VirtualBox-in-Linux.png
[12]: https://itsfoss.com/content/images/2023/07/start-the-VM.png
[13]: https://itsfoss.com/content/images/2023/07/Boot-from-USB-in-VirtualBox-in-Linux.png
[14]: https://itsfoss.com/content/images/2023/07/Remove-VM-from-VirtualBox.png
[15]: https://linuxhandbook.com/remove-files-directories/
[16]: https://itsfoss.com/content/images/2023/07/use-rm-command-to-remove-vmdk-file.png
[17]: https://itsfoss.com/content/images/2023/07/unable-to-create-vmdk-file-in-Linux--file-already-exist.png
[18]: https://itsfoss.com/content/images/2023/07/unregister-vmdk-file-in-Linux-to-remove-it.png
[19]: https://itsfoss.com/content/images/2023/07/how-to-remove-the-vmdk-file-in-Linux.png
