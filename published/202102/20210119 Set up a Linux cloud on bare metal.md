[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13161-1.html)
[#]: subject: (Set up a Linux cloud on bare metal)
[#]: via: (https://opensource.com/article/21/1/cloud-image-virt-install)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

在裸机上建立 Linux 云实例
======

> 在 Fedora 上用 virt-install 创建云镜像。

![](https://img.linux.net.cn/data/attachment/album/202102/28/130111cx5pux33bt74o36g.jpg)

虚拟化是使用最多的技术之一。Fedora Linux 使用 [Cloud Base 镜像][2] 来创建通用虚拟机（VM），但设置 Cloud Base 镜像的方法有很多。最近，用于调配虚拟机的 `virt-install` 命令行工具增加了对 `cloud-init` 的支持，因此现在可以使用它在本地配置和运行云镜像。

本文介绍了如何在裸机上设置一个基本的 Fedora 云实例。同样的步骤可以用于任何 raw 或Qcow2 Cloud Base 镜像。

### 什么是 --cloud-init？

`virt-install` 命令使用 `libvirt` 创建一个 KVM、Xen 或 [LXC][3] 客户机。`--cloud-init` 选项使用一个本地文件（称为 “nocloud 数据源”），所以你不需要网络连接来创建镜像。在第一次启动时，`nocloud` 方法会从 iso9660 文件系统（`.iso` 文件）中获取访客机的用户数据和元数据。当你使用这个选项时，`virt-install` 会为 root 用户账户生成一个随机的（临时）密码，提供一个串行控制台，以便你可以登录并更改密码，然后在随后的启动中禁用 `--cloud-init` 选项。 

### 设置 Fedora Cloud Base 镜像

首先，[下载一个 Fedora Cloud Base（for OpenStack）镜像][2]。

![Fedora Cloud 网站截图][4]

然后安装 `virt-install` 命令：

```
$ sudo dnf install virt-install
```

一旦 `virt-install` 安装完毕并下载了 Fedora Cloud Base 镜像，请创建一个名为`cloudinit-user-data.yaml` 的小型 YAML 文件，其中包含 `virt-install` 将使用的一些配置行：

```
#cloud-config
password: 'r00t'
chpasswd: { expire: false }
```

这个简单的云配置可以设置默认的 `fedora` 用户的密码。如果你想使用会过期的密码，可以将其设置为登录后过期。

创建并启动虚拟机：

```
$ virt-install --name local-cloud18012709 \
--memory 2000 --noreboot \
--os-variant detect=on,name=fedora-unknown \
--cloud-init user-data="/home/r3zr/cloudinit-user-data.yaml" \
--disk=size=10,backing_store="/home/r3zr/Downloads/Fedora-Cloud-Base-33-1.2.x86_64.qcow2"
```

在这个例子中，`local-cloud18012709` 是虚拟机的名称，内存设置为 2000MiB，磁盘大小（虚拟硬盘）设置为 10GB，`--cloud-init` 和 `backing_store` 分别带有你创建的 YAML 配置文件和你下载的 Qcow2 镜像的绝对路径。

### 登录

在创建镜像后，你可以用用户名 `fedora` 和 YAML 文件中设置的密码登录（在我的例子中，密码是 `r00t`，但你可能用了别的密码）。一旦你第一次登录，请更改你的密码。

要关闭虚拟机的电源，执行 `sudo poweroff` 命令，或者按键盘上的 `Ctrl+]`。

### 启动、停止和销毁虚拟机

`virsh` 命令用于启动、停止和销毁虚拟机。

要启动任何停止的虚拟机：

```
$ virsh start <vm-name>
```

要停止任何运行的虚拟机：

```
$ virsh shutdown <vm-name>
```

要列出所有处于运行状态的虚拟机：

```
$ virsh list
```

要销毁虚拟机：

```
$ virsh destroy <vm-name>
```

![销毁虚拟机][6]

### 快速而简单

`virt-install` 命令与 `--cloud-init` 选项相结合，可以快速轻松地创建云就绪镜像，而无需担心是否有云来运行它们。无论你是在为重大部署做准备，还是在学习容器，都可以试试`virt-install --cloud-init`。

在云计算工作中，你有喜欢的工具吗？请在评论中告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/cloud-image-virt-install

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS (Sky with clouds and grass)
[2]: https://alt.fedoraproject.org/cloud/
[3]: https://www.redhat.com/sysadmin/exploring-containers-lxc
[4]: https://opensource.com/sites/default/files/uploads/fedoracloud.png (Fedora Cloud website)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/destroyvm.png (Destroying a VM)
