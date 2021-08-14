[#]: subject: (Run a Linux virtual machine in Podman)
[#]: via: (https://opensource.com/article/21/7/linux-podman)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13635-1.html)

在 Podman 中运行一个 Linux 虚拟机
======

> 使用 Podman Machine 创建一个基本的 Fedora CoreOS 虚拟机来使用容器和容器化工作负载。

![](https://img.linux.net.cn/data/attachment/album/202107/31/114043y4d0kstx90zpx6o3.jpg)

Fedora CoreOS 是一个自动更新、最小化的基于 [rpm-ostree][2] 的操作系统，用于安全地、大规模地运行容器化工作负载。

[Podman][3] “是一个用于管理容器和镜像、挂载到这些容器中的卷，以及由这些容器组组成的吊舱的工具。Podman 基于 libpod，它是一个容器生命周期管理库”。

当你使用 [Podman Machine][4] 时，神奇的事情发生了，它可以帮助你创建一个基本的 Fedora CoreOS 虚拟机（VM）来使用容器和容器化工作负载。

### 开始使用 Podman Machine

第一步是安装 Podman。如果你已经安装了最新版本的 Podman，你可以跳过这个步骤。在我的 Fedora 34 机器上，我用以下方式安装 Podman：

```
$ sudo dnf install podman
```

我使用的是 podman-3.2.2-1.fc34.x86_64。

### 初始化 Fedora CoreOS

Podman 安装完成后，用以下方法初始化它：

```
❯ podman machine init vm2
Downloading VM image: fedora-coreos-34.20210626.1.0-qemu.x86_64.qcow2.xz: done 
Extracting compressed file
```

这个命令创建了 `vm2`，并下载了 .xz 格式的 Fedora CoreOS 的 qcow2 文件并将其解压。

### 列出你的虚拟机

了解你的虚拟机和它们的状态是很重要的，`list` 命令可以帮助你做到这一点。下面的例子显示了我所有的虚拟机的名称，它们被创建的日期，以及它们最后一次启动的时间：

```
❯ podman machine list 
NAME          VM TYPE     CREATED     LAST UP
podman-machine-default* qemu      6 days ago   Currently running
vm2           qemu      11 minutes ago 11 minutes ago
```

### 启动一个虚拟机

要启动一个虚拟机，请运行：

```
❯ podman machine start
Waiting for VM ...
```

### SSH 到虚拟机

你可以使用 SSH 来访问你的虚拟机，并使用它来运行工作负载，而没有任何麻烦的设置：

```
❯ podman machine ssh  
Connecting to vm podman-machine-default. To close connection, use `~.` or `exit`
Fedora CoreOS 34.20210611.1.0
Tracker: https://github.com/coreos/fedora-coreos-tracker
Discuss: https://discussion.fedoraproject.org/c/server/coreos/
 
Last login: Wed Jun 23 13:23:36 2021 from 10.0.2.2
[core@localhost ~]$ uname -a
Linux localhost 5.12.9-300.fc34.x86_64 #1 SMP Thu Jun 3 13:51:40 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
[core@localhost ~]$
```

目前，Podman 只支持一次运行一个虚拟机。

### 停止你的虚拟机

要停止运行中的虚拟机，请使用 `stop` 命令：

```
❯ podman machine stop

[core@localhost ~]$ Connection to localhost closed by remote host.
Connection to localhost closed.
Error: exit status 255
```

我希望这能帮助你开始使用 Podman Machine。请试一试，并在评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-podman

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: http://coreos.github.io/rpm-ostree/
[3]: https://github.com/containers/podman
[4]: http://docs.podman.io/en/latest/markdown/podman-machine.1.html