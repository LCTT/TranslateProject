[#]: subject: "Making your Windows System Ready for Virtual Machines"
[#]: via: "https://itsfoss.com/windows-enable-virtualization/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16186-1.html"

让你的 Windows 系统为虚拟机做好准备
======

![][0]

> 以下是确保 Windows 系统已准备好运行虚拟机的必要条件。

在 VirtualBox 中看到了“<ruby>无法打开虚拟机会话<rt>failed to open a session for the virtual machine</rt></ruby>”错误？

你的系统上可能没有启用虚拟化。

这是在 Windows 系统上创建虚拟机所需执行的几件事之一。

简单来说，你需要了解：

  * 在你的 PC 上启用虚拟化支持
  * 使用虚拟机程序创建/管理虚拟机
  * 确保某些系统资源要求以无缝使用虚拟机

下面是第一件事：

### 在 Windows PC 上启用虚拟化

如果你的系统预装了 Windows 10/11，那么你很可能已经启用了虚拟化。你不需要额外的设置。

但如果你在系统上手动安装了 Windows，那么可能需要检查 BIOS 设置以查看它是否支持虚拟化。如果禁用，虚拟机程序将无法运行并给出错误。

这是使用 VirtualBox 程序时出现的错误：

![][1]

你怎么能这么做呢？ 以下是基本步骤：

![][2]

  1. 前往 UEFI 固件设置（或 BIOS 菜单）。你通常可以通过按 `Del` 按钮或 `F1`、`F2`、`F10` 或 `F12` 来访问它。
  2. 根据主板制造商的不同，用户界面会有所不同。但是，在大多数情况下，你必须进入到其中的“<ruby>高级<rt>Advance</rt></ruby>”选项，并访问“<ruby>CPU 配置<rt>CPU Configuration</rt></ruby>”设置。
  3. 在 CPU 配置中，你必须启用 “Intel (VMX) Virtualization Technology” 或 “SVM Mode”（适用于 AMD 处理器）。

下一步是什么？ 考虑到你已经启用了虚拟化支持，你需要使用 [虚拟化程序][3] 来帮助你完成工作。

### 使用虚拟化程序

你可以选择第三方应用以方便使用，也可以选择使用 Windows 自带的 Hyper-V。

#### Hyper-V

我们不会详细介绍如何使用 Hyper-V，但为了节省你一些时间，你可以按照以下步骤启用它，然后按照其[文档][4]使用它。

> 📋 Hyper-V 不适用于 Windows 10/11 家庭版。

考虑到你的系统上安装了 Windows 专业版/教育版/企业版，可以通过**控制面板**或使用 **PowerShell** 轻松启用它。

![][5]

我更喜欢控制面板，只需在搜索栏中搜索 “Windows 功能”或通过 “控制面板 → 程序 → 打开或关闭 Windows 功能” 打开。

接下来，单击 “Hyper-V” 并点击 “OK”。就是这样。

![][6]

它将通过获取所需的文件来应用更改。你只需要等待。

完成后，它会要求你**重启系统**以使新功能生效。

![][7]

#### 第三方虚拟化程序

虽然使用 Hyper-V 可以让虚拟机获得更好的性能，但它使用起来却并不那么简单。

因此，建议终端用户使用第三方虚拟机程序。

最好的选择之一是 [VirtualBox][8]。我们还有一个指南可以帮助你使用 [VirtualBox 安装 Linux][9]。

![][10]

它是一个开源程序，具有一系列功能和用户友好的界面。你也可以在 Windows、Linux 和 macOS 上使用它。

你还可以选择专有（但流行）的选项，例如 [VMware Workstation][11]。

想了解这些程序吗？你可以查看 Linux 下的一些可用选项，了解有哪些解决方案：

> **[9 个最佳虚拟化软件][12]**

### 检查系统资源和要求

创建和使用虚拟机并不完全是一个非常占用资源的过程。但是，你可能需要注意一些变量。

其中一些包括：

  * 确保你的系统至少有 4 GB 内存（越多越好）
  * 双核或以上 64 位处理器

如果你不知道，即使虚拟机是孤立的机器，也会占用你系统的资源。大多数最低规格建议 4 GB RAM，但**我建议使用 8 GB**。

如果你想要**运行两个虚拟机**，你可能需要在 Windows 上拥有**超过 8GB 的内存**。

除了内存，你应该有一个**多核**处理器。这样，一些内核可以自由地让你在主机上做其他事情，而另一些内核则用于处理虚拟机。

当确定了处理器和内存，接下来就是**磁盘空间**。

对于虚拟机来说，磁盘通常是动态分配的，也就是说，物理存储驱动器的空间会随着操作系统及其文件的增加而消耗。

在某些类型的虚拟磁盘中，它保留你指定的整个空间。因此，执行此操作时，请在启动之前检查可用磁盘空间。通常最好选择一个未安装 Windows 系统的单独驱动器。

**如果你遵循了上述所有提示，你的 Windows 系统就可以运行和管理虚拟机了。现在，你可以 [在 Windows 的虚拟机中轻松地安装 Linux][9]**。

💬 那么，你喜欢用什么方式来处理虚拟机？请在下面的评论中告诉我们你的想法。

*（题图：MJ/c1690724-a797-442b-8fb5-b6d41ef0c45c）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/windows-enable-virtualization/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/07/virtualbox-error.jpg
[2]: https://itsfoss.com/content/images/2023/07/bios-asus.jpg
[3]: https://itsfoss.com/virtualization-software-linux
[4]: https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/
[5]: https://itsfoss.com/content/images/2023/07/windows-features-on.jpg
[6]: https://itsfoss.com/content/images/2023/07/hyper-v-enable.jpg
[7]: https://itsfoss.com/content/images/2023/07/hyper-v-restart.jpg
[8]: https://www.virtualbox.org/
[9]: https://itsfoss.com/install-linux-in-virtualbox/
[10]: https://itsfoss.com/content/images/2023/07/virtualbox-7.png
[11]: https://www.vmware.com/products/workstation-player.html
[12]: https://itsfoss.com/virtualization-software-linux/
[0]: https://img.linux.net.cn/data/attachment/album/202309/13/100649idhbxhxehrqb9ahh.jpg