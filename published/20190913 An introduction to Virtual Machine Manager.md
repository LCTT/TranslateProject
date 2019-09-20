[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11364-1.html)
[#]: subject: (An introduction to Virtual Machine Manager)
[#]: via: (https://opensource.com/article/19/9/introduction-virtual-machine-manager)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

虚拟机管理器（Virtual Machine Manager）简介
======

> virt-manager 为 Linux 虚拟化提供了全方位的选择。

![](https://img.linux.net.cn/data/attachment/album/201909/20/113434dxbbp3ttmxbhmnnm.jpg)

在我关于 [GNOME Boxes][3] 的[系列文章][2]中，我已经解释了 Linux 用户如何能够在他们的桌面上快速启动虚拟机。当你只需要简单的配置时，Box 可以轻而易举地创建虚拟机。

但是，如果你需要在虚拟机中配置更多详细信息，那么你就需要一个工具，为磁盘、网卡（NIC）和其他硬件提供全面的选项。这时就需要 [虚拟机管理器（Virtual Machine Manager）][4]（virt-manager）了。如果在应用菜单中没有看到它，你可以从包管理器或命令行安装它：

* 在 Fedora 上：`sudo dnf install virt-manager`
* 在 Ubuntu 上：`sudo apt install virt-manager`

安装完成后，你可以从应用菜单或在命令行中输入 `virt-manager` 启动。

![Virtual Machine Manager's main screen][5]

为了演示如何使用 virt-manager 创建虚拟机，我将设置一个 Red Hat Enterprise Linux 8 虚拟机。

首先，单击 “<ruby>文件<rt>File</rt></ruby>” 然后点击 “<ruby>新建虚拟机<rt>New Virtual Machine</rt></ruby>”。Virt-manager 的开发者已经标记好了每一步（例如，“<ruby>第 1 步，共 5 步<rt>Step 1 of 5</rt></ruby>”）来使其变得简单。单击 “<ruby>本地安装介质<rt>Local install media</rt></ruby>” 和 “<ruby>下一步<rt>Forward</rt></ruby>”。

![Step 1 virtual machine creation][6]

在下个页面中，选择要安装的操作系统的 ISO 文件。（RHEL 8 镜像位于我的下载目录中。）Virt-manager 自动检测操作系统。

![Step 2 Choose the ISO File][7]

在步骤 3 中，你可以指定虚拟机的内存和 CPU。默认值为内存 1,024MB 和一个 CPU。

![Step 3 Set CPU and Memory][8]

我想给 RHEL 充足的配置来运行，我使用的硬件配置也充足，所以我将它们（分别）增加到 4,096MB 和两个 CPU。

下一步为虚拟机配置存储。默认设置是 10GB 硬盘。（我保留此设置，但你可以根据需要进行调整。）你还可以选择现有磁盘镜像或在自定义位置创建一个磁盘镜像。

![Step 4 Configure VM Storage][9]

步骤 5 是命名虚拟机并单击“<ruby>完成<rt>Finish</rt></ruby>”。这相当于创建了一台虚拟机，也就是 GNOME Boxes 中的一个 Box。虽然技术上讲是最后一步，但你有几个选择（如下面的截图所示）。由于 virt-manager 的优点是能够自定义虚拟机，因此在单击“<ruby>完成<rt>Finish</rt></ruby>”之前，我将选中“<ruby>在安装前定制配置<rt>Customize configuration before install</rt></ruby>”的复选框。

因为我选择了自定义配置，virt-manager 打开了一个有一组设备和设置的页面。这里是重点！

这里你也可以命名该虚拟机。在左侧列表中，你可以查看各个方面的详细信息，例如 CPU、内存、磁盘、控制器和许多其他项目。例如，我可以单击 “CPU” 来验证我在步骤 3 中所做的更改。

![Changing the CPU count][10]

我也可以确认我设置的内存量。

当虚拟机作为服务器运行时，我通常会禁用或删除声卡。为此，请选择 “<ruby>声卡<rt>Sound</rt></ruby>” 并单击 “<ruby>移除<rt>Remove</rt></ruby>” 或右键单击 “<ruby>声卡<rt>Sound</rt></ruby>” 并选择 “<ruby>移除硬件<rt>Remove Hardware</rt></ruby>”。

你还可以使用底部的 “<ruby>添加硬件<rt>Add Hardware</rt></ruby>” 按钮添加硬件。这会打开 “<ruby>添加新的虚拟硬件<rt>Add New Virtual Hardware</rt></ruby>” 页面，你可以在其中添加其他存储设备、内存、声卡等。这就像可以访问一个库存充足的（虚拟）计算机硬件仓库。

![The Add New Hardware screen][11]

对 VM 配置感到满意后，单击 “<ruby>开始安装<rt>Begin Installation</rt></ruby>”，系统将启动并开始从 ISO 安装指定的操作系统。

![Begin installing the OS][12]

完成后，它会重新启动，你的新虚拟机就可以使用了。

![Red Hat Enterprise Linux 8 running in VMM][13]

Virtual Machine Manager 是桌面 Linux 用户的强大工具。它是开源的，是专有和封闭虚拟化产品的绝佳替代品。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/introduction-virtual-machine-manager

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://opensource.com/sitewide-search?search_api_views_fulltext=GNOME%20Box
[3]: https://wiki.gnome.org/Apps/Boxes
[4]: https://virt-manager.org/
[5]: https://opensource.com/sites/default/files/1-vmm_main_0.png (Virtual Machine Manager's main screen)
[6]: https://opensource.com/sites/default/files/2-vmm_step1_0.png (Step 1 virtual machine creation)
[7]: https://opensource.com/sites/default/files/3-vmm_step2.png (Step 2 Choose the ISO File)
[8]: https://opensource.com/sites/default/files/4-vmm_step3default.png (Step 3 Set CPU and Memory)
[9]: https://opensource.com/sites/default/files/6-vmm_step4.png (Step 4 Configure VM Storage)
[10]: https://opensource.com/sites/default/files/9-vmm_customizecpu.png (Changing the CPU count)
[11]: https://opensource.com/sites/default/files/11-vmm_addnewhardware.png (The Add New Hardware screen)
[12]: https://opensource.com/sites/default/files/12-vmm_rhelbegininstall.png
[13]: https://opensource.com/sites/default/files/13-vmm_rhelinstalled_0.png (Red Hat Enterprise Linux 8 running in VMM)
