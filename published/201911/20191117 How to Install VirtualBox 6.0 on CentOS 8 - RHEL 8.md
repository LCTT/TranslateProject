[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11627-1.html)
[#]: subject: (How to Install VirtualBox 6.0 on CentOS 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-virtualbox-6-centos-8-rhel-8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 CentOS 8 / RHEL 8 上安装 VirtualBox 6.0
======

![](https://img.linux.net.cn/data/attachment/album/201911/30/095031gbnm59ux0dw979wb.jpg)

VirtualBox 是一款自由开源的虚拟化工具，它允许技术人员同时运行多个不同风格的虚拟机（VM）。它通常用于运行桌面（Linux 和 Windows），当人们尝试探索新的 Linux 发行版的功能或希望在 VM 中安装 OpenStack、Ansible 和 Puppet 等软件时，它会非常方便，在这种情况下，我们可以使用 VirtualBox 启动 VM。

VirtualBox 被分类为 2 类虚拟机管理程序，这意味着它需要一个现有的操作系统，在上面安装 VirtualBox 软件。VirtualBox 提供功能来创建本机网络或 NAT 网络。在本文中，我们将演示如何在 CentOS 8 和 RHEL 8 系统上安装最新版本的 VirtualBox 6.0，并演示如何安装 VirtualBox 扩展。

### 在 CentOS 8 / RHEL 8 上安装 VirtualBox 6.0 的安装步骤

#### 步骤 1： 启用 VirtualBox 和 EPEL 仓库

登录到你的 CentOS 8 或 RHEL 8 系统并打开终端，执行以下命令并启用 VirtualBox 和 EPEL 包仓库：

```
[root@linuxtechi ~]# dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
```

使用以下 `rpm` 命令导入 Oracle VirtualBox 公钥：

```
[root@linuxtechi ~]# rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
```

使用以下 `dnf` 命令启用 EPEL 仓库：

```
[root@linuxtechi ~]# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
```

#### 步骤 2： 安装 VirtualBox 构建工具和依赖项

运行以下命令来安装所有 VirtualBox 构建工具和依赖项：

```
[root@linuxtechi ~]# dnf install binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms -y
```

成功安装上面的依赖项和构建工具后，使用 `dnf` 命令继续安装 VirtualBox。

#### 步骤 3： 在 CentOS 8 / RHEL 8 上安装 VirtualBox 6.0

如果希望在安装之前列出 VirtualBox 的可用版本，请执行以下 dnf 命令：

```
[root@linuxtechi ~]# dnf search virtualbox
Last metadata expiration check: 0:14:36 ago on Sun 17 Nov 2019 04:13:16 AM GMT.
=============== Summary & Name Matched: virtualbox =====================
VirtualBox-5.2.x86_64 : Oracle VM VirtualBox
VirtualBox-6.0.x86_64 : Oracle VM VirtualBox
[root@linuxtechi ~]#
```

让我们使用以下 `dnf` 命令安装最新版本的 VirtualBox 6.0：

```
[root@linuxtechi ~]# dnf install VirtualBox-6.0 -y
```

如果有本地用户希望将 usb 设备连接到 VirtualBox VM，那么他/她应该是 `vboxusers` 组的一员，请使用下面的 `usermod` 命令将本地用户添加到 `vboxusers` 组。


```
[root@linuxtechi ~]# usermod -aG vboxusers pkumar
```

#### 步骤 4： 访问 CentOS 8 / RHEL 8 上的 VirtualBox

有两种方法可以访问 VirtualBox，在命令行输入 `virtualbox` 然后回车：

```
[root@linuxtechi ~]# virtualbox
```

在桌面环境中，在搜索框中搜索 “VirtualBox”。

![Access-VirtualBox-CentOS8][3]

单击 VirtualBox 图标：

![VirtualBox-CentOS8][4]

这确认 VirtualBox 6.0 已成功安装，让我们安装它的扩展包。

#### 步骤 5： 安装 VirtualBox 6.0 扩展包

顾名思义，VirtualBox 扩展包用于扩展 VirtualBox 的功能。它添加了以下功能：

  * USB 2.0 和 USB 3.0 支持
  * 虚拟 RDP（VRDP）
  * 磁盘镜像加密
  * Intel PXE 启动
  * 主机网络摄像头

使用下面的 `wget` 命令下载 Virtualbox 扩展包到下载文件夹中：

```
[root@linuxtechi ~]$ cd Downloads/
[root@linuxtechi Downloads]$ wget https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
```

下载后，打开 VirtualBox 并依次点击 “File -> Preferences -> Extension”，然后点击 “+” 号图标添加下载的扩展包：

![Install-VirtualBox-Extension-Pack-CentOS8][5]

单击 “Install” 开始安装扩展包：

![Accept-VirtualBox-Extension-Pack-License-CentOS8][6]

单击 “I Agree” 接受 VirtualBox 扩展包许可证。

成功安装 VirtualBox 扩展包后，我们将看到下面的页面，单击 “OK” 并开始使用 VirtualBox。

![VirtualBox-Extension-Pack-Install-Message-CentOS8][7]

本文就是这些了，我希望这些步骤可以帮助你在 CentOS 8 和 RHEL 8 系统上安装 VirtualBox 6.0。请分享你的宝贵的反馈和意见。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-virtualbox-6-centos-8-rhel-8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/dnf-command-examples-rpm-management-fedora-linux/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Access-VirtualBox-CentOS8.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/11/VirtualBox-CentOS8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Install-VirtualBox-Extension-Pack-CentOS8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Accept-VirtualBox-Extension-Pack-License-CentOS8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/11/VirtualBox-Extension-Pack-Install-Message-CentOS8.jpg
[9]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&t=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208
[10]: http://twitter.com/share?text=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&via=Linuxtechi
[11]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&title=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208
[12]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&title=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208
