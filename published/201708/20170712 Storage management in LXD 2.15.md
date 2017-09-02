LXD 2.15 中的存储管理
============================================================

![containers](https://cbrauner.files.wordpress.com/2017/07/containers.png?w=1008)

长久以来 LXD 已经支持多种存储驱动。用户可以在 zfs、btrfs、lvm 或纯目录存储池之间进行选择，但他们只能使用单个存储池。一个被频繁被提到的需求是不仅支持单个存储池，还支持多个存储池。这样，用户可以维护一个由 SSD 支持的 zfs 存储池用于 I/O 密集型容器，另一个简单的基于目录的存储池用于其他容器。幸运的是，现在这是可能的，因为 LXD 在几个版本后有了自己的存储管理 API。

### 创建存储池

新安装 LXD 没有定义任何存储池。如果你运行 `lxd init` ，LXD 将提供为你创建一个存储池。由 `lxd init` 创建的存储池将是创建容器的默认存储池。

[![asciicast](https://asciinema.org/a/126892.png)][2] 

### 创建更多的存储池

我们的客户端工具使得创建额外的存储池变得非常简单。为了创建和管理新的存储池，你可以使用 `lxc storage` 命令。所以如果你想在块设备 `/dev/sdb` 上创建一个额外的 btrfs 存储池，你只需使用 `lxc storage create my-btrfs btrfs source=/dev/sdb`。让我们来看看：

[![asciicast](https://asciinema.org/a/128580.png)][3] 

### 在默认存储池上创建容器

如果你从全新安装的 LXD 开始，并通过 `lxd init` 创建了一个存储池，LXD 将使用此池作为默认存储池。这意味着如果你执行 `lxc launch images:ubuntu/xenial xen1`，LXD 将为此存储池上的容器的根文件系统创建一个存储卷。在示例中，我们使用 `my-first-zfs-pool` 作为默认存储池。

[![asciicast](https://asciinema.org/a/128582.png)][4] 

### 在特定存储池上创建容器

但是你也可以通过传递 `-s` 参数来告诉 `lxc launch` 和 `lxc init` 在特定存储池上创建一个容器。例如，如果要在 `my-btrfs` 存储池上创建一个新的容器，你可以执行 `lxc launch images:ubuntu/xenial xen-on-my-btrfs -s my-btrfs`：

 [![asciicast](https://asciinema.org/a/128583.png)][5] 

### 创建自定义存储卷

如果你其中一个容器需要额外的空间存储额外的数据，那么新的存储 API 将允许你创建可以连接到容器的存储卷。只需要 `lxc storage volume create my-btrfs my-custom-volume`：

[![asciicast](https://asciinema.org/a/128584.png)][6] 

### 连接自定义卷到容器中

当然，这个功能是有用的，因为存储 API 让你把这些存储卷连接到容器。要将存储卷连接到容器，可以使用 `lxc storage volume attach my-btrfs my-custom-volume xen1 data /opt/my/data`：

[![asciicast](https://asciinema.org/a/128585.png)][7] 

### 在容器之间共享自定义存储卷

默认情况下，LXD 将使连接的存储卷由其所连接的容器写入。这意味着它会将存储卷的所有权更改为容器的 id 映射。但存储卷也可以同时连接到多个容器。这对于在多个容器之间共享数据是非常好的。但是，这有一些限制。为了将存储卷连接到多个容器，它们必须共享相同的 id 映射。让我们创建一个额外的具有一个隔离的 id 映射的容器 `xen-isolated`。这意味着它的 id 映射在这个 LXD 实例中将是唯一的，因此没有其他容器具有相同的id映射。将相同的存储卷 `my-custom-volume` 连接到此容器现在将会失败：

[![asciicast](https://asciinema.org/a/128588.png)][8] 

但是我们让 `xen-isolated` 与 `xen1` 有相同的映射，并把它重命名为 `xen2` 来反映这个变化。现在我们可以将 `my-custom-volume` 连接到 `xen1` 和 `xen2` 而不会有问题：

[![asciicast](https://asciinema.org/a/128593.png)][9] 

### 总结

存储 API 是 LXD 非常强大的补充。它提供了一组基本功能，有助于在大规模使用容器时处理各种问题。这个简短的介绍希望给你一个印象，你可以做什么。将来会有更多介绍。

本篇文章最初在[ Brauner 的博客][10]中发布。

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/07/12/storage-management-in-lxd-2-15/

作者：[Christian Brauner][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://cbrauner.wordpress.com/
[1]:https://insights.ubuntu.com/author/christian-brauner/
[2]:https://asciinema.org/a/126892
[3]:https://asciinema.org/a/128580
[4]:https://asciinema.org/a/128582
[5]:https://asciinema.org/a/128583
[6]:https://asciinema.org/a/128584
[7]:https://asciinema.org/a/128585
[8]:https://asciinema.org/a/128588
[9]:https://asciinema.org/a/128593
[10]:https://cbrauner.wordpress.com/
