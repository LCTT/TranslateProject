[#]: subject: "How to Mount Bitlocker Encrypted Windows Partition in Linux"
[#]: via: "https://itsfoss.com/mount-encrypted-windows-partition-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14008-1.html"

如何在 Linux 中挂载 Bitlocker 加密的 Windows 分区
======

> 情况是这样的。我的系统自带 Windows 10 Pro，并且带有 BitLocker 加密功能。我 [甚至在 Windows 启用了 BitLocker 加密的情况下，以双启动模式安装了 Ubuntu][1]。

![](https://img.linux.net.cn/data/attachment/album/202111/22/144133k6n9xsnnt46t0z94.jpg)

你可以轻松地从 Linux 中访问 Windows 文件。没有什么高科技的东西。只要进入文件管理器，点击通常位于“<ruby>其他位置<rt>Other Locations</rt></ruby>”标签下的 Windows 分区。

![Mounting Windows partition through the file manager in Linux desktop][2]

对于 BitLocker 加密的 Windows 分区来说，这个过程也不是太复杂。只是当你试图挂载 Windows 分区时，它会要求你输入密码。

![Password required for encrypted Windows drive mount in Linux][3]

这是能工作的。在我的情况中，我输入了 48 位 BitLocker 恢复密码，它解密了 Windows 分区，并在带有 GNOME 40 的 Ubuntu 21.10 中毫无问题地挂载了它。

试试你的 BitLocker 密码。如果这不起作用，试试恢复密码。对于普通的 Windows 10 Pro 用户，恢复密码存储在你的微软账户中。

[BitLocker Recovery Password in Micrsoft Account][4]

输入恢复密码，你会看到 Windows 分区和它的文件现在可以访问。勾选“<ruby>记住密码<rt>Remember Password</rt></ruby>”框也是为了进一步使用而节省时间。

![Encrypted Windows partition now mounted in Linux][5]

如果上述方法对你不起作用，或者你不熟悉命令行，还有一个替代方法。

这个方法包括使用一个叫做 [Dislocker][6] 的工具。

### 使用 Dislocker 在 Linux 中挂载 BotLocker 加密的 Windows 分区（命令行方法）

使用 Dislocker 分为两部分。第一部分是解开 BitLocker 的加密，并给出一个名为 `dislocker-file` 的文件。这基本上是一个虚拟的 NTFS 分区。第二部分是挂载你刚刚得到的虚拟 NTFS 分区。

你需要 BitLocker 密码或恢复密码来解密加密的驱动器。

让我们来看看详细的步骤。

#### 步骤 1：安装 Disclocker

大多数 Linux 发行版的仓库中都有 Dislocker。请使用你的发行版的包管理器来安装它。

在基于 Ubuntu 和 Debian 的发行版上，使用这个命令：

```
sudo apt install dislocker
```

![Installing Dislocker in Ubuntu][7]

#### 步骤 2：创建挂载点

你需要创建两个挂载点。一个是 Dislocker 生成 `dislocker-file` 的地方，另一个是将这个 `dislocker-file`（虚拟文件系统）作为一个回环设备挂载。

没有命名限制，你可以给这些挂载目录起任何你想要的名字。

逐一使用这些命令：

```
sudo mkdir -p /media/decrypt
sudo mkdir -p /media/windows-mount
```

![Creating mount points for dislocker][8]

#### 步骤 3：获取需要解密的分区信息

你需要 Windows 分区的名称。你可以使用文件资源管理器或像 Gparted 这样的 GUI 工具。

![Get the partition name][9]

在我的例子中，Windows 分区是 `/dev/nvme0n1p3`。对你的系统来说，这将是不同的。你也可以使用命令行来达到这个目的。

```
sudo lsblk
```

#### 步骤 4：解密分区并挂载

你已经设置好了一切。现在是真正的部分。

**如果你有 BitLocker 密码**，以这种方式使用 `dislocker` 命令（用实际值替换 `<partition_name>` 和 `<password>`）：

```
sudo dislocker <partition_name> -u<password> -- /media/decrypt
```

如果你只有恢复密码，请以这种方式使用该命令用实际值替换 `<partition_name>` 和 `<password>`）：

```
sudo dislocker <partition_name> -p<recovery_password> -- /media/decrypt
```

在解密该分区时，应该不会花很长时间。你应该在指定的挂载点看到 `dislocker-file`，在我们的例子中是 `/media/decrypt`。现在挂载这个 dislocker-file：

```
sudo mount -o loop /media/decrypt/dislocker-file /media/windows-mount
```

![][10]

完成了。你的 BitLocker 加密的 Windows 分区已经被解密并挂载到 Linux 中。你也可以从文件资源管理器中访问它。

![Mounting Dislocker decrypted Windows partition with file manager][11]

#### 文件系统类型错误的故障排除提示

如果你遇到这样的错误：

```
mount: /media/windows-mount: wrong fs type, bad option, bad superblock on /dev/loop35, missing codepage or helper program, or other error.
```

你应该在挂载时指定文件系统。

对于NTFS，使用：

```
sudo mount -t ntfs-3g -o loop /media/decrypt/dislocker-file /media/windows-mount
```

对于 exFAT，使用：

```
sudo mount -t exFAT-fuse -o loop /media/decrypt/dislocker-file /media/windows-mount
```

#### 解除对 Windows 分区的挂载

你可以从文件管理器中取消挂载的分区。只要**点击名为 windows-mount 的分区旁边的卸载符号**。

或者，你可以使用卸载命令：

```
sudo umount /media/decrypt
sudo umount /media/windows-mount
```

我希望这对你有帮助。如果你还有问题或建议，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mount-encrypted-windows-partition-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/dual-boot-ubuntu-windows-bitlocker/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/mount-encrypted-windows-partition-in-linux.png?resize=800%2C476&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/password-needed-for-encrypted-windows-drive-mount-in-Linux.png?resize=788%2C380&ssl=1
[4]: https://account.microsoft.com/devices/recoverykey?refd=support.microsoft.com
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/encrypted-windows-partition-mounted-in-Linux.png?resize=800%2C491&ssl=1
[6]: https://github.com/Aorimn/dislocker
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-dislocker-ubuntu.png?resize=786%2C386&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/creating-mount-points-for-dislocker.png?resize=777%2C367&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/show-device-name-gparted.png?resize=800%2C416&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/mount-dislocker-decrypted-windows-partition.png?resize=777%2C253&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/discloker-mount-encrypted-windows-partition.png?resize=800%2C483&ssl=1
