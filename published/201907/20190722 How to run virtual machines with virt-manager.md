[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11151-1.html)
[#]: subject: (How to run virtual machines with virt-manager)
[#]: via: (https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/)
[#]: author: (Marco Sarti https://fedoramagazine.org/author/msarti/)

如何使用 virt-manager 运行虚拟机
======

![][1]

在早些年，在同一台笔记本中运行多个操作系统只能双启动。当时，这些操作系统很难同时运行或彼此交互。许多年过去了，在普通的 PC 上，可以通过虚拟化在一个系统中运行另一个系统。

最近的 PC 或笔记本（包括价格适中的笔记本电脑）都有硬件虚拟化，可以运行性能接近物理主机的虚拟机。

虚拟化因此变得常见，它可以用来测试操作系统、学习新技术、创建自己的家庭云、创建自己的测试环境等等。本文将指导你使用 Fedora 上的 Virt Manager 来设置虚拟机。

### 介绍 QEMU/KVM 和 Libvirt

与所有其他 Linux 系统一样，Fedora 附带了虚拟化扩展支持。它由作为内核模块之一的 KVM（基于内核的虚拟机）提供支持。

QEMU 是一个完整的系统仿真器，它可与 KVM 协同工作，允许你使用硬件和外部设备创建虚拟机。

最后，[libvirt][2] 能让你管理基础设施的 API 层，即创建和运行虚拟机。

这三个技术都是开源的，我们将在 Fedora Workstation 上安装它们。

### 安装

#### 步骤 1：安装软件包

安装是一个相当简单的操作。 Fedora 仓库提供了 “virtualization” 软件包组，其中包含了你需要的所有包。

```
sudo dnf install @virtualization
```

#### 步骤 2：编辑 libvirtd 配置

默认情况下，系统管理仅限于 root 用户，如果要启用常规用户，那么必须按以下步骤操作。

打开 `/etc/libvirt/libvirtd.conf` 进行编辑：

```
sudo vi /etc/libvirt/libvirtd.conf
```

将 UNIX 域套接字组所有者设置为 libvirt：

```
unix_sock_group = "libvirt"
```

调整 UNIX 域套接字的读写权限：

```
unix_sock_rw_perms = "0770"
```

#### 步骤 3：启动并启用 libvirtd 服务

```
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
```

#### 步骤 4：将用户添加到组

为了管理 libvirt 与普通用户，你必须将用户添加到 `libvirt` 组，否则每次启动 `virt-manager` 时，都会要求你输入 sudo 密码。

```
sudo usermod -a -G libvirt $(whoami)
```

这会将当前用户添加到组中。你必须注销并重新登录才能应用更改。

### 开始使用 virt-manager

可以通过命令行 （`virsh`） 或通过 `virt-manager` 图形界面管理 libvirt 系统。如果你想做虚拟机自动化配置，那么命令行非常有用，例如使用 [Ansible][3]，但在本文中我们将专注于用户友好的图形界面。

`virt-manager` 界面很简单。主窗口显示连接列表，其中包括本地系统连接。

连接设置包括虚拟网络和存储定义。你可以定义多个虚拟网络，这些网络可用于在客户端系统之间以及客户端系统和主机之间进行通信。

### 创建你的第一个虚拟机

要开始创建新虚拟机，请按下主窗口左上角的按钮：

![][4]

向导的第一步需要选择安装模式。你可以选择本地安装介质、网络引导/安装或导入现有虚拟磁盘：

![][5]

选择本地安装介质，下一步将需要选择 ISO 镜像路径：

![ ][6]

随后的两个步骤能让你调整新虚拟机的 CPU、内存和磁盘大小。最后一步将要求你选择网络选项：如果你希望虚拟机通过 NAT 与外部隔离，请选择默认网络。如果你希望从外部访问虚拟机，那么选择桥接。请注意，如果选择桥接，那么虚拟机则无法与主机通信。

如果要在启动设置之前查看或更改配置，请选中“安装前自定义配置”：

![][7]

虚拟机配置窗口能让你查看和修改硬件配置。你可以添加磁盘、网络接口、更改引导选项等。满意后按“开始安装”：

![][8]

此时，你将被重定向到控制台来继续安装操作系统。操作完成后，你可以从控制台访问虚拟机：

![][9]

刚刚创建的虚拟机将出现在主窗口的列表中，你还能看到 CPU 和内存占用率的图表：

![][10]

libvirt 和 `virt-manager` 是功能强大的工具，它们可以以企业级管理为你的虚拟机提供出色的自定义。如果你需要更简单的东西，请注意 Fedora Workstation [预安装的 GNOME Boxes 已经能够满足基础的虚拟化要求][11]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/

作者：[Marco Sarti][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/msarti/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/virt-manager-816x346.jpg
[2]: https://libvirt.org/
[3]: https://fedoramagazine.org/get-the-latest-ansible-2-8-in-fedora/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-09-41-45.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-09-30-53.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-42-39.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-43-21.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-44-58.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-55-35.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-11-09-22.png
[11]: https://fedoramagazine.org/getting-started-with-virtualization-in-gnome-boxes/
