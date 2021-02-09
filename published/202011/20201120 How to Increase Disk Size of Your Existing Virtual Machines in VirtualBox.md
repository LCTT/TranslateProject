[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12869-1.html)
[#]: subject: (How to Increase Disk Size of Your Existing Virtual Machines in VirtualBox)
[#]: via: (https://itsfoss.com/increase-disk-size-virtualbox/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 VirtualBox 中增加现有虚拟机的磁盘大小
======

下面是你迟早会遇到的情况。

你在 [VirtualBox][1] 中安装了一个或多个操作系统。在创建这些虚拟操作系统的同时，你还在 VirtualBox 中为它们创建了虚拟硬盘。

你指定了虚拟磁盘的最大大小，比如说 15 或 20GB，但现在使用了一段时间后，你发现你的虚拟机已经没有空间了。

虽然[在 Ubuntu 和其他操作系统上有释放磁盘空间的方法][2]，但更稳健的处理方式是增加 VirtualBox 中创建的虚拟机的磁盘大小。

是的，你可以在 VirtualBox 中扩大虚拟硬盘，即使在创建之后也可以。虽然这是一个安全且经过测试的过程，但我们强烈建议你在执行这样的操作之前，先创建一个虚拟机的备份。

### 如何扩大 VirtualBox 磁盘大小

![][3]

我将向你展示如何在 VirtualBox 中以图形和命令行（对于 Linux 极客）方式调整磁盘大小。这两种方法都很简单直接。

#### 方法 1：在 VirtualBox 中使用虚拟媒体管理器

VirtualBox 6 增加了一个调整虚拟磁盘大小的图形化选项。你可以在 VirtualBox 主页的文件选项卡中找到它。

进入 “File -> Virtual Media Manager”：

![][4]

在列表中选择一个虚拟机，然后使用 “Size” 滑块或输入你需要的大小值。完成后点击 “Apply”。

![][5]

请记住，虽然你增加了虚拟磁盘的大小，但**如果你的空间是动态分配的，那么实际的分区大小仍然不变**。

#### 方法 2：使用 Linux 命令行增加 VirtualBox 磁盘空间

如果你使用 Linux 操作系统作为宿主机，在宿主机中打开终端并输入以下命令来调整 VDI 的大小：

```
VBoxManage modifymedium "/path_to_vdi_file" --resize <megabytes>
```

在你按下回车执行命令后，调整大小的过程应该马上结束。

> 注意事项
>
> VirtualBox 早期版本命令中的 `*modifyvdi` 和 `modifyhd` 命令也支持，并在内部映射到 `modifymedium` 命令。

![][6]

如果你不确定虚拟机的保存位置，可以在 VirtualBox 主页面点击 “Files -> Preferences” 或使用键盘快捷键 `Ctrl+G` 找到默认位置。

![][7]

### 总结

就我个人而言，我更喜欢在每个 Linux 发行版上使用终端来扩展磁盘，图形化选项是最新的 VirtualBox 版本的一个非常方便的补充。

这是一个简单快捷的小技巧，但对 VirtualBox 基础知识是一个很好的补充。如果你觉得这个小技巧很有用，可以看看 [VirtualBox 客户端增强包][8]的几个功能。

--------------------------------------------------------------------------------

via: https://itsfoss.com/increase-disk-size-virtualbox/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.virtualbox.org/
[2]: https://itsfoss.com/free-up-space-ubuntu-linux/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/enlarge-disk-size-virtualbox.png?resize=800%2C450&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/1-virtual-box-media-manager.png?resize=800%2C600&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/2-virtual-box-increase-disc-space.png?resize=800%2C505&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/3-virtual-box-increase-disc-space-terminal.png?resize=800%2C600&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/4-virtual-box-preferences.png?resize=800%2C450&ssl=1
[8]: https://itsfoss.com/install-fedora-in-virtualbox/
