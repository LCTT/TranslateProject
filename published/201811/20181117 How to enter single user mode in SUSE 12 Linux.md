如何在 SUSE 12 Linux 中进入单用户模式？
======

> 一篇了解如何在 SUSE 12 Linux 服务器中进入单用户模式的简短文章。

![How to enter single user mode in SUSE 12 Linux][1]

在这篇简短的文章中，我们将向你介绍在 SUSE 12 Linux 中进入单用户模式的步骤。在排除系统主要问题时，单用户模式始终是首选。单用户模式禁用网络并且没有其他用户登录，你可以排除许多多用户系统的情况，可以帮助你快速排除故障。单用户模式最常见的一种用处是[重置忘记的 root 密码][2]。

### 1、暂停启动过程

首先，你需要拥有机器的控制台才能进入单用户模式。如果它是虚拟机那就是虚拟机控制台，如果它是物理机那么你需要连接它的 iLO/串口控制台。重启系统并在 GRUB 启动菜单中按任意键停止内核的自动启动。

![Kernel selection menu at boot in SUSE 12][3]

### 2、编辑内核的启动选项

进入上面的页面后，在所选内核（通常是你首选的最新内核）上按 `e` 更新其启动选项。你会看到下面的页面。

![grub2 edits in SUSE 12][4]

现在，向下滚动到内核引导行，并在行尾添加 `init=/bin/bash`，如下所示。

![Edit to boot in single user shell][5]

### 3、引导编辑后的内核

现在按 `Ctrl-x` 或 `F10` 来启动这个编辑过的内核。内核将以单用户模式启动，你将看到 `#` 号提示符，即有服务器的 root 访问权限。此时，根文件系统以只读模式挂载。因此，你对系统所做的任何更改都不会被保存。

运行以下命令以将根文件系统重新挂载为可重写入的。

```
kerneltalks:/ # mount -o remount,rw /
```

这就完成了！继续在单用户模式中做你必要的事情吧。完成后不要忘了重启服务器引导到普通多用户模式。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/howto/how-to-enter-single-user-mode-in-suse-12-linux/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://a4.kerneltalks.com/wp-content/uploads/2018/11/How-to-enter-single-user-mode-in-SUSE-12-Linux.png
[2]: https://kerneltalks.com/linux/recover-forgotten-root-password-rhel/
[3]: https://a1.kerneltalks.com/wp-content/uploads/2018/11/Grub-menu-in-SUSE-12.png
[4]: https://a3.kerneltalks.com/wp-content/uploads/2018/11/grub2-editor.png
[5]: https://a4.kerneltalks.com/wp-content/uploads/2018/11/Edit-to-boot-in-single-user-shell.png
