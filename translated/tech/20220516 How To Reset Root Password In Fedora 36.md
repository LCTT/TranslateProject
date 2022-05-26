[#]: subject: "How To Reset Root Password In Fedora 36"
[#]: via: "https://ostechnix.com/reset-root-password-in-fedora/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: " "
[#]: url: " "

在 Fedora 36 中如何重置 Root 密码
======
在 Fedora 中重置忘记的 root 密码。

您是否忘记了 Fedora 中的 root 密码？或者您想更改 Fedora 系统中的 root 用户密码？没问题！本手册将指导您在 Fedora 操作系统中完成更改或重置 root 密码的步骤。

**注意：** 本手册已在 Fedora 36 和 35 版本上进行了正式测试。下面提供的步骤与在 Fedora Silverblue 和旧 Fedora 版本中重置 root 密码的步骤相同。

**步骤 1** - 打开 Fedora 系统并按下 **ESC** 键，直到看到 GRUB 启动菜单。出现 GRUB 菜单后，选择要引导的内核并按下 **e** 编辑选定的引导条目。

![Grub Menu In Fedora 36][1]

**步骤 2** - 在下一个页面中，你将看到所有启动参数。找到名为 **ro** 的参数。

![Find ro Kernel Parameter In Grub Entry][2]

**步骤 3** - 将 **“ro”** 参数替换为 **“rw init=/sysroot/bin/sh”**（不带引号）。请注意 “`rw`” 和 “`init=/sysroot`...” 之间的空格。修改后的内核参数行应如下所示。

![Modify Kernel Parameters][3]

**步骤 4** - 上述步骤更改参数后，按 **Ctrl+x** 进入紧急模式，即单用户模式。

在紧急模式下，输入以下命令以  **读/写** 模式挂载根文件系统（`/`）。

```
chroot /sysroot/
```

![Mount Root Filesystem In Read, Write Mode In Fedora Linux][4]

**步骤 5** - 现在使用 `passwd` 命令重置 root 密码：

```
passwd root
```

输入两次 root 密码。我建议使用强密码。

![Reset Or Change Root Password In Fedora][5]

**步骤 6** - 重置 root 密码后，运行以下命令在重启时启用 SELinux 重新标记：

```
touch /.autorelabel
```

![Enable SELinux Relabeling On Reboot In Fedora][6]

**步骤 7** - 最后，退出单用户模式并通过运行以下命令将 Fedora 系统重启到正常模式：

```
exit
```

```
reboot
```

等待 SELinux 重新标记完成。这将需要几分钟，具体时长取决于文件系统的大小和硬盘的速度。

![SELinux Filesystem Relabeling In Progress][7]

**步骤 8** - 文件系统重新标记完成后，你可以使用新的 root 密码登录到你的 Fedora 系统。

![Login To Fedora As Root User][8]

如你所见，在 Fedora 36 中重置 root 密码的步骤非常简单，并且与**[在 RHEL 中重置 root 密码][9]**及其衍生版本（如 CentOS、AlmaLinux 和 Rocky Linux）完全相同。

--------------------------------------------------------------------------------

via: https://ostechnix.com/reset-root-password-in-fedora/

作者：[sk][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Grub-Menu-In-Fedora-36.png
[2]: https://ostechnix.com/wp-content/uploads/2021/11/Find-ro-Kernel-Parameter-In-Grub-Entry.png
[3]: https://ostechnix.com/wp-content/uploads/2022/05/Modify-Kernel-Parameters.png
[4]: https://ostechnix.com/wp-content/uploads/2022/05/Mount-Root-Filesystem-In-Read-Write-Mode-In-Fedora-Linux.png
[5]: https://ostechnix.com/wp-content/uploads/2022/05/Reset-Or-Change-Root-Password-In-Fedora.png
[6]: https://ostechnix.com/wp-content/uploads/2022/05/Enable-SELinux-Relabeling-On-Reboot-In-Fedora.png
[7]: https://ostechnix.com/wp-content/uploads/2021/11/SELinux-filesystem-relabeling-in-progress.png
[8]: https://ostechnix.com/wp-content/uploads/2022/05/Login-To-Fedora-As-Root-User.png
[9]: https://ostechnix.com/how-to-reset-root-user-password-in-centos-8-rhel-8/
