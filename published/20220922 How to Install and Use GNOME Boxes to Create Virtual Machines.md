[#]: subject: "How to Install and Use GNOME Boxes to Create Virtual Machines"
[#]: via: "https://www.debugpoint.com/install-use-gnome-boxes/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15950-1.html"

如何安装和使用 GNOME Boxes 来创建虚拟机
======

![][0]

> 本快速教程解释了安装和使用 GNOME Boxes 以及创建虚拟机的步骤，以及一些提示和故障排除。

虚拟化是使用抽象硬件层运行虚拟实例（而不是实际实例）的过程。通俗地说，它允许你同时安装和运行多个操作系统（Linux、Windows）。

[虚拟机][1] 是一个模拟操作系统，它运行在另一个操作系统之上，并使用与主机相同的硬件和存储空间。虽然，你可以控制可以分配给虚拟机的共享内存或空间量。

有多种软件可用于创建虚拟机，例如 [Virtual Box][2]、KVM、Hyper-V、VMWare player 和 GNOME Boxes。

但老实说，它们中的大多数使用起来都很复杂，有时还不够稳定。[GNOME Boxes][3] 是另一个自由开源的软件，它非常易于使用，通过抽象出大量选项让你可以轻松创建和管理虚拟机。

### 安装 GNOME Boxes

如果你正在运行 Fedora 的 GNOME 定制版，你应该已经安装了它。但是，对于 Ubuntu、Linux Mint、Kubuntu 和其他发行版，你只需运行以下命令即可将其安装到你的系统中。

```
sudo apt install gnome-boxes
```

#### 通过 Flatpak

它也可以通过 Flatpak 包获得。我会推荐你使用这个版本。首先，使用 [本指南][4] 在系统中安装 Flatpak，然后从终端运行以下命令进行安装。

```
flatpak install flathub org.gnome.Boxes
```

### 使用 GNOME Boxes 创建虚拟机

从应用菜单启动 GNOME Boxes。

要创建虚拟机，你需要要虚拟化的操作系统的镜像（*.ISO）。

你可以从发行版的官方下载页面下载任何操作系统 ISO 镜像。对于本指南，我使用的是 Pop!_OS，这是一个优秀的 Linux 发行版。

启动后，单击顶部的 “+” 图标启动并选择“<ruby>创建虚拟机<rt>Create a virtual machine</rt></ruby>”。

![Create Virtual Machine][5]

在下一个窗口中，你可以选择已经可用的下载，或者你可以选择你的 ISO 文件作为操作系统源。单击“<ruby>操作系统镜像文件<rt>Operating system image file</rt></ruby>”并选择你的 ISO 文件。

分配虚拟机的内存和存储空间。请记住，你的虚拟机将从主机系统获取内存和存储空间。所以尽量不要分配为最大值。

例如，在下图中，我从主机系统的 8GB 总内存中为虚拟机（客户机）分配了 2GB 内存。

同样，如果你只是想测试操作系统，也请选择最小存储空间。但是，如果你正在为服务器或严肃的工作创建虚拟机，请合理分配你要分配的空间或内存量。

另一件需要记住的重要事情是，除非你删除虚拟机，否则你允许的存储磁盘空间将被永久占用。因此，即使你的虚拟机没有使用整个分配的空间，你也不会获得那么多的可用磁盘空间。

![Allocate resources for your virtual machine][6]

继续安装。

在分区窗口中，你应该看到一个硬盘和一个分区，这就是虚拟机的磁盘空间。通常，它们被命名为 `/dev/vda` 或者 `/dev/sda`。

不用担心；你可以随意使用此分区，这不会影响你的物理磁盘分区或实际主机系统上的任何数据。安装 Linux 时遵循相同的 `/root` 分区，然后继续。

![Virtual machine partition][7]

完成安装后，你应该会在虚拟机中看到新的操作系统。在 GNOME Boxes 中，你应该会看到一个系统条目。你可以单击它启动虚拟机。

你可以使用虚拟机操作系统的内部关闭选项关闭虚拟机。

如果需要，你还可以通过选择上下文菜单选项来删除虚拟机。

![Context menu in installed virtual machine][8]

你还可以从属性窗口检查你的虚拟机使用了多少内存和 CPU。

请注意，你可以使用属性调整现有虚拟机的内存和其他项目。

![System properties][9]

### 故障排除

以下是你在使用 GNOME Boxes 时可能遇到的一些常见错误或问题。

#### 1、虚拟机中的分辨率问题

如果你的虚拟机分辨率很低，这与你的主机系统不兼容，那么你必须安装以下项目。在客户系统（而不是主机系统）中打开终端并运行以下命令。

对于基于 Ubuntu 的发行版：

```
sudo apt install spice-vdagent spice-webdavd
```

对于 Fedora 系统：

```
sudo dnf install spice-vdagent spice-webdavd
```

这两个包有助于确定合适的分辨率、在主机和客户之间复制/粘贴、通过公共文件夹共享文件等。

安装后，重新启动客户系统；或者你可以在重启后注销并重新登录一次，你应该会看到正确的分辨率。

#### 2、在 Ubuntu 18.04 中 GNOME Boxes 不能启动虚拟机

如果你在 Boxes 3.34 中创建虚拟机，那么你应该知道有一个错误导致你的虚拟机无法启动。要解决这个问题，你必须执行一些额外的步骤。请记住，最新的 Boxes 3.36 不需要这些。

打开终端窗口并运行以下命令来更改 qemu 配置文件：

```
sudo gedit /etc/modprobe.d/qemu-system-x86.conf
```

在上面的文件中添加以下行并保存：

```
group=kvm
```

现在，运行以下命令将你的用户名添加到 KVM 组。

```
sudo usermod -a -G kvm <你的帐户名称>
```

### 总结

在本文中，你了解了如何安装和使用 GNOME Boxes 来利用虚拟化。我希望它能帮助你。

🗨️ 如果你遇到任何错误或对 GNOME Boxes 的虚拟机有任何疑问，请使用下面的评论栏告诉我。

*（题图：MJ/b4d091cf-9585-468b-9ce6-ba0b0c69cce4）*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-use-gnome-boxes/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.redhat.com/en/topics/virtualization/what-is-a-virtual-machine
[2]: https://www.debugpoint.com/tag/virtualbox/
[3]: https://wiki.gnome.org/Apps/Boxes
[4]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[5]: https://www.debugpoint.com/wp-content/uploads/2020/05/Create-Virtual-Machine.png
[6]: https://www.debugpoint.com/wp-content/uploads/2020/05/Allocate-resources-for-your-virtual-machine.png
[7]: https://www.debugpoint.com/wp-content/uploads/2020/05/Virtual-machine-partition.png
[8]: https://www.debugpoint.com/wp-content/uploads/2020/05/Context-menu-in-installed-virtual-machine.png
[9]: https://www.debugpoint.com/wp-content/uploads/2020/05/System-properties.png
[0]: https://img.linux.net.cn/data/attachment/album/202306/28/151813xrp87wpccdclwc3c.jpg