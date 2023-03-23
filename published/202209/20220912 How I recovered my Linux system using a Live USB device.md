[#]: subject: "How I recovered my Linux system using a Live USB device"
[#]: via: "https://opensource.com/article/22/9/recover-linux-system-live-usb"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15080-1.html"

我如何使用现场 USB 设备恢复我的 Linux 系统
======

![](https://img.linux.net.cn/data/attachment/album/202209/28/121226rh7vq7qhwhqzh76m.jpg)

> Fedora 现场 USB 发行版为引导和进入恢复模式提供了有效的解决方案。

我的家庭实验室里有十几台物理计算机以及更多的虚拟机。这些系统中的大多数是我用来进行测试和实验的。我经常写使用自动化来简化系统管理任务的文章。我还在多个地方写过，我从自己的错误中学到的东西比几乎任何其他方式都多。

在过去的几周里，我学到了很多东西。

我给自己制造了一个大麻烦。作为多年的系统管理员，我写了数百篇关于 Linux 的文章和五本书，我应该对 Linux 更了解。话又说回来，我们都会犯错，这是一个重要的教训：你永远不会因为有经验而不犯错。

我不打算讨论我的错误的细节。告诉你这是一个错误就足够了，在我做之前我应该多考虑一下我在做什么。此外，细节并不是重点。经验不能让你免于犯下的每一个错误，但它可以帮助你恢复。这就是本文要讨论的内容：使用现场 USB 发行版启动并进入恢复模式。

### 问题

首先，我制造了问题，这本质上是 `/etc/default/grub` 文件的错误配置。接下来，我使用 Ansible 将错误配置的文件分发到我所有的物理计算机并运行 `grub2-mkconfig`。全部 12 个。这真的，真的很快。

除了两台之外，所有的都无法启动。它们在 Linux 启动的早期阶段崩溃，出现各种无法定位 `/root` 文件系统的错误。

我可以使用 root 密码进入“维护”模式，但是如果没有挂载 `/root`，即使是最简单的工具也无法访问。直接引导到恢复内核也不起作用。系统真的被破坏了。

### Fedora 恢复模式

解决此问题的唯一方法是找到进入恢复模式的方法。当一切都失败时，Fedora 提供了一个非常酷的工具：用于安装 Fedora 新实例的<ruby>现场 USB<rt>Live USB</rt></ruby> 驱动器。

将 BIOS 设置为从现场 USB 设备启动后，我启动到 Fedora 36 Xfce 的<ruby>现场<rt>live</rt></ruby>用户桌面。我在桌面上打开了两个相邻的终端会话，并在两者中都切换到了 root 权限。

我在其中一个运行了 `lsblk` 以供参考。我使用该结果来识别 `/` 根分区以及 `boot` 和 `efi` 分区。我使用了我的一台虚拟机，如下所示。在这种情况下没有 `efi` 分区，因为此 VM 不使用 UEFI。

```
# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0           7:0    0  1.5G  1 loop
loop1           7:1    0    6G  1 loop
├─live-rw     253:0    0    6G  0 dm   /
└─live-base   253:1    0    6G  1 dm   
loop2           7:2    0   32G  0 loop
└─live-rw     253:0    0    6G  0 dm   /
sda             8:0    0  120G  0 disk
├─sda1          8:1    0    1G  0 part
└─sda2          8:2    0  119G  0 part
  ├─vg01-swap 253:2    0    4G  0 lvm  
  ├─vg01-tmp  253:3    0   10G  0 lvm  
  ├─vg01-var  253:4    0   20G  0 lvm  
  ├─vg01-home 253:5    0    5G  0 lvm  
  ├─vg01-usr  253:6    0   20G  0 lvm  
  └─vg01-root 253:7    0    5G  0 lvm  
sr0            11:0    1  1.6G  0 rom  /run/initramfs/live
zram0         252:0    0    8G  0 disk [SWAP]
```

`/dev/sda1` 分区很容易识别为 `/boot`，根（`/`）分区也很明显。

在另一个终端会话中，我执行了一系列步骤来恢复我的系统。特定的卷组名称和设备分区（例如 `/dev/sda1`）因系统而异。此处显示的命令特定于我的情况。

目标是使用现场 USB 引导并完成启动，然后仅在镜像目录中挂载必要的文件系统，并运行 `chroot` 命令在 chroot 镜像目录中运行 Linux。这种方法绕过损坏的 GRUB（或其他）配置文件。但是，它提供了一个完整的运行系统，其中安装了所有原始文件系统以进行恢复，既是所需工具的来源，也是要进行更改的目标。

以下是步骤和相关命令：

1. 创建目录 `/mnt/sysimage` 以提供 `chroot` 目录的位置。
2. 将根分区挂载到 `/mnt/sysimage`：
    ```
    # mount /dev/mapper/vg01-root /mnt/sysimage
    ```
3. 将 `/mnt/sysimage` 设为你的工作目录：
    ```
    # cd /mnt/sysimage
    ```
4. 挂载 `/boot` 和 `/boot/efi` 文件系统。
5. 挂载其他主要文件系统。此步骤不需要像 `/home` 和 `/tmp` 这样的文件系统：
    ```
    # mount /dev/mapper/vg01-usr usr

    # mount /dev/mapper/vg01-var var
    ```
6. 绑定已挂载的重要文件系统，它们必须在已经 chroot 的系统和原始的现场系统之间共享，而后者仍然在外部运行：
    ```
    # mount --bind /sys sys

    # mount --bind /proc proc
    ```
7. 一定要最后操作 `/dev` 目录，否则其他文件系统不能挂载：
    ```
    # mount --bind /dev dev
    ```
8. chroot 到系统镜像：
    ```
    # chroot /mnt/sysimage
    ```

系统现在已经准备好了，无论你需要做什么，都可以把它恢复到一个工作状态。然而，有一次我能够在这种状态下运行我的服务器数天，直到我能够研究测试出真正的修复方法。我并不推荐这样做，但在紧急情况下，当有任务需要启动和运行时，这可能是一个选择。

### 解决方案

当我让每个系统进入恢复模式，修复就很容易了。因为我的系统现在就像成功启动一样工作，我只需对 `/etc/default/grub` 和 `/etc/fstab` 进行必要的更改并运行 `grub2-mkconfig > boot/grub2/grub.cfg` 命令。我使用 `exit` 命令退出 chroot 环境，然后重启主机。

当然，我无法自动从我的意外事故中恢复过来。我必须在每台主机上手动执行整个过程，这是使用自动化快速和容易地传播我自己的错误的一点报应。

### 得到教训

尽管它们很有用，我曾经讨厌在我的一些系统管理员工作中举行的“经验教训”会议，但看来我确实需要提醒自己一些事情。因此，这里是我从这场自作自受的惨败中获得的“教训”。

首先，无法引导的十个系统使用了不同的卷组命名方案，而我的新 GRUB 配置没有考虑到这一点。我只是忽略了它们可能不同的事实。

* 彻底考虑清楚。
* 并非所有系统都相同。
* 测试一切。
* 验证一切。
* 永远不要做假设。

现在一切正常。希望我也聪明一点。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/recover-linux-system-live-usb

作者：[David Both][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/markus-winkler-usb-unsplash.jpg
[2]: https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/usb?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
