[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10409-1.html)
[#]: subject: (How To Boot Into Rescue Mode Or Emergency Mode In Ubuntu 18.04)
[#]: via: (https://www.ostechnix.com/how-to-boot-into-rescue-mode-or-emergency-mode-in-ubuntu-18-04/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何在 Ubuntu 18.04 中启动到救援模式或紧急模式
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Boot-Into-Rescue-Mode-Or-Emergency-Mode-720x340.png)

正如你可能已经知道的那样，**运行级别** 在许多最近的 Linux 发行版（如 RHEL 7 和 Ubuntu 16.04 LTS）中被 **systemd 的目标** 替换。有关它们的更多详细信息，请参阅[这个指南][1]。在这个简短的教程中，我们将看到如何启动**救援模式**以及**紧急模式**。本指南在 Ubuntu 18.04 LTS 中进行了测试，但是下面给出的步骤适用于大多数使用 systemd 作为默认服务管理器的 Linux 发行版。在进一步讨论之前，让我澄清什么是救援模式和紧急模式以及这两种模式的目的是什么。

### 什么是救援模式？

**救援模式**相当于使用 **SysV** 作为默认的服务管理器的 Linux 发行版中的 **单用户模式**。在救援模式下，将挂载所有本地文件系统，仅启动一些重要服务。但是，不会启动正常服务（例如网络服务）。救援模式在系统无法正常启动的情况下很有用。此外，我们可以在救援模式下执行一些重要的救援操作，例如[重置 root 密码][2]。

### 什么是紧急模式？

与救援模式相比，在**紧急模式**中不启动任何东西。没有服务启动、没有挂载点、没有建立套接字，什么也没有。你所拥有的只是一个**原始的 shell**。紧急模式适用于调试目的。

### 在 Ubuntu 18.04 LTS 中进入救援模式

启动你的 Ubuntu 系统。出现 Grub 菜单时，选择第一条并按下 `e` 进行编辑。

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Grub-menu.png)

如果你没有看到 Grub 菜单，只需在 BIOS 的 logo 消失后立即按下 `ESC` 键。

找到以单词 `linux` 开头的行，并在该行的末尾添加以下内容（要到达末尾，只需按下 `CTRL+e` 或使用 `END` 键或左右箭头键）：

```
systemd.unit=rescue.target
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Edit-grub-menu.png)

添加完成后，只需按下 `CTRL+x` 或 `F10` 即可继续启动救援模式。几秒钟后，你将以 root 用户身份进入救援模式（单用户模式）。以下是 Ubuntu 18.04 LTS 服务器版中救援模式的样子：

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Ubuntu-rescue-mode.png)

接下来，输入以下命令将根 （`/`） 文件系统重新挂载成读/写模式。

```
mount -n -o remount,rw /
```

### 启动到紧急模式

将 Ubuntu 引导到紧急模式与上述方法相同。你只需在编辑 Grub 菜单时将 `systemd.unit=rescue.target` 替换为 `systemd.unit=emergency.target` 即可。

![emergency mode][4]

添加 `systemd.unit=emergency.target` 后，按下 `Ctrl+x` 或 `F10` 继续启动到紧急模式。

![](https://www.ostechnix.com/wp-content/uploads/2018/12/emergency-mode-1.png)

最后，你可以使用以下命令将根文件系统重新挂载成读/写模式：

```
mount -n -o remount,rw /
```

### 在救援模式和紧急模式之间切换

如果你处于救援模式，则不必像上面提到的那样编辑 Grub 条目。相反，只需输入以下命令即可立即切换到紧急模式：

```
systemctl emergency
```

同样，要从紧急模式切换到救援模式，请输入：

```
systemctl rescue
```

你现在知道了什么是救援模式和紧急模式以及如何在 Ubuntu 18.04 中启动这些模式。就像我已经提到的，这里提供的步骤将适用于许多使用 systemd 的 Linux 版本。

就是这些了。希望这篇文章有用。

还有更多好东西。敬请期待！

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-boot-into-rescue-mode-or-emergency-mode-in-ubuntu-18-04/

作者：[SK][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/check-runlevel-linux/
[2]: https://www.ostechnix.com/how-to-reset-or-recover-root-user-password-in-linux/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: http://www.ostechnix.com/wp-content/uploads/2018/12/emergency-mode.png
