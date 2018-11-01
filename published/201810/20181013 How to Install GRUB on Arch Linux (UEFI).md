如何在 Arch Linux（UEFI）上安装 GRUB
======

![](http://fasterland.net/wp-content/uploads/2018/10/Arch-Linux-Boot-Menu-750x375.jpg)

前段时间，我写了一篇在安装 Windows 后在 Arch Linux 上[如何重新安装 Grub][1]的教程。

几周前，我不得不在我的笔记本上从头开始重新安装 Arch Linux，同时我发现安装 Grub 并不像我想的那么简单。

出于这个原因，由于在新安装 Arch Linux 时在 UEFI bios 中安装 Grub 并不容易，所以我要写这篇教程。

### 定位 EFI 分区

在 Arch Linux 上安装 Grub 的第一件重要事情是定位 EFI 分区。让我们运行以下命令以找到此分区：

```
# fdisk -l
```

我们需要检查标记为 EFI System 的分区，我这里是 `/dev/sda2`。

之后，我们需要在例如 `/boot/efi` 上挂载这个分区：

```
# mkdir /boot/efi
# mount /dev/sdb2 /boot/efi
```

另一件重要的事情是将此分区添加到 `/etc/fstab` 中。

#### 安装 Grub

现在我们可以在我们的系统中安装 Grub：

```
# grub-mkconfig -o /boot/grub/grub.cfg
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

#### 自动将 Windows 添加到 Grub 菜单中

为了自动将 Windows 条目添加到 Grub 菜单，我们需要安装 os-prober：

```
# pacman -Sy os-prober
```

要添加它，让我们运行以下命令：

```
# os-prober
# grub-mkconfig -o /boot/grub/grub.cfg
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

你可以在[这里][2]找到更多关于在 Arch Linux 上 Grub 的信息。

--------------------------------------------------------------------------------

via: http://fasterland.net/how-to-install-grub-on-arch-linux-uefi.html

作者：[Francesco Mondello][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://fasterland.net/
[b]: https://github.com/lujun9972
[1]: http://fasterland.net/reinstall-grub-arch-linux.html
[2]: https://wiki.archlinux.org/index.php/GRUB
