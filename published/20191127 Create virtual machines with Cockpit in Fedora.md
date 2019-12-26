[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11716-1.html)
[#]: subject: (Create virtual machines with Cockpit in Fedora)
[#]: via: (https://fedoramagazine.org/create-virtual-machines-with-cockpit-in-fedora/)
[#]: author: (Karlis KavacisPaul W. Frields https://fedoramagazine.org/author/karlisk/https://fedoramagazine.org/author/pfrields/)

在 Fedora 中使用 Cockpit 创建虚拟机
======

![][1]

本文向你展示如何在 Fedora 31 上使用安装 Cockpit 所需软件来创建和管理虚拟机。Cockpit 是一个[交互式管理界面][2]，可让你在任何受支持的 Web 浏览器上访问和管理系统。随着 [virt-manager 逐渐被废弃][3]，鼓励用户使用 Cockpit 来替换它。

Cockpit 是一个正在活跃开发的项目，它有许多扩展其工作的插件。例如，其中一个是 “Machines”，它与 libvirtd 交互并允许用户创建和管理虚拟机。

### 安装软件

先决所需软件是 `libvirt`、`cockpit` 和 `cockpit-machines`。要将它们安装在 Fedora 31 上，请在终端[使用 sudo][4] 运行以下命令：

```
$ sudo dnf install libvirt cockpit cockpit-machines
```

Cockpit 也在 “Headless Management” 软件包组中。该软件组对于仅通过网络访问的基于 Fedora 的服务器很有用。在这里，请使用以下命令进行安装：

```
$ sudo dnf groupinstall "Headless Management"
```

### 设置 Cockpit 服务

安装了必要的软件包后，就该启用服务了。`libvirtd` 服务运行虚拟机，而 Cockpit 有一个激活的套接字服务，可让你访问 Web GUI：

```
$ sudo systemctl enable libvirtd --now
$ sudo systemctl enable cockpit.socket --now
```

这应该足以运行虚拟机并通过 Cockpit 对其进行管理。（可选）如果要从网络上的另一台设备访问并管理计算机，那么需要将该服务开放给网络。为此，请在防火墙配置中添加新规则：

```
$ sudo firewall-cmd --zone=public --add-service=cockpit --permanent
$ sudo firewall-cmd --reload
```

要确认服务正在运行并且没有发生任何问题，请检查服务的状态：

```
$ sudo systemctl status libvirtd
$ sudo systemctl status cockpit.socket
```

此时一切都应该正常工作。Cockpit Web GUI 应该可通过 <https://localhost:9090> 或 <https://127.0.0.1:9090> 访问。或者，在连接到同一网络的任何其他设备上的 Web 浏览器中输入本地网络 IP。（如果未设置 SSL 证书，那么可能需要允许来自浏览器的连接。）

### 创建和安装机器

使用系统的用户名和密码登录界面。你还可以选择是否允许在此会话中将密码用于管理任务。

选择 “Virtual Machines”，然后选择 “Create VM” 来创建一台新的虚拟机。控制台为你提供几个选项：

  * 使用 Cockpit 的内置库下载操作系统
  * 使用系统上已下载的安装媒体
  * 指向系统安装树的 URL
  * 通过 [PXE][5] 协议通过网络引导媒体

输入所有必要的参数。然后选择 “Create” 启动新虚拟机。

此时，将出现一个图形控制台。大多数现代 Web 浏览器都允许你使用键盘和鼠标与 VM 控制台进行交互。现在，你可以完成安装并使用新的 VM，就像[过去通过 virt-manager][6] 一样。

*照片由 [Miguel Teixeira][7] 发布于 [Flickr][8]（CC BY-SA 2.0）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/create-virtual-machines-with-cockpit-in-fedora/

作者：[Karlis Kavacis][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/karlisk/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/create-vm-cockpit-816x345.jpg
[2]: https://cockpit-project.org/
[3]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/8.0_release_notes/rhel-8_0_0_release#virtualization_4
[4]: https://fedoramagazine.org/howto-use-sudo/
[5]: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
[6]: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/
[7]: https://flickr.com/photos/miguelteixeira/
[8]: https://flickr.com/photos/miguelteixeira/2964851828/
