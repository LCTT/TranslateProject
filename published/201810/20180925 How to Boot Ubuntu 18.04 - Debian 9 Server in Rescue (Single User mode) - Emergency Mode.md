如何在救援（单用户模式）/紧急模式下启动 Ubuntu 18.04/Debian 9 服务器
======

将 Linux 服务器引导到单用户模式或<ruby>救援模式<rt>rescue mode</rt></ruby>是 Linux 管理员在关键时刻恢复服务器时通常使用的重要故障排除方法之一。在 Ubuntu 18.04 和 Debian 9 中，单用户模式被称为救援模式。

除了救援模式外，Linux 服务器可以在<ruby>紧急模式<rt>emergency mode</rt></ruby>下启动，它们之间的主要区别在于，紧急模式加载了带有只读根文件系统文件系统的最小环境，没有启用任何网络或其他服务。但救援模式尝试挂载所有本地文件系统并尝试启动一些重要的服务，包括网络。

在本文中，我们将讨论如何在救援模式和紧急模式下启动 Ubuntu 18.04 LTS/Debian 9 服务器。

#### 在单用户/救援模式下启动 Ubuntu 18.04 LTS 服务器：

重启服务器并进入启动加载程序 （Grub） 屏幕并选择 “Ubuntu”，启动加载器页面如下所示，

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Bootloader-Screen-Ubuntu18-04-Server.jpg)

按下 `e`，然后移动到以 `linux` 开头的行尾，并添加 `systemd.unit=rescue.target`。如果存在单词 `$vt_handoff` 就删除它。

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/rescue-target-ubuntu18-04.jpg)

现在按 `Ctrl-x` 或 `F10` 启动，

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/rescue-mode-ubuntu18-04.jpg)

现在按回车键，然后你将得到所有文件系统都以读写模式挂载的 shell 并进行故障排除。完成故障排除后，可以使用 `reboot` 命令重新启动服务器。

#### 在紧急模式下启动 Ubuntu 18.04 LTS 服务器

重启服务器并进入启动加载程序页面并选择 “Ubuntu”，然后按 `e` 并移动到以 `linux` 开头的行尾，并添加 `systemd.unit=emergency.target`。

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergecny-target-ubuntu18-04-server.jpg)

现在按 `Ctrl-x` 或 `F10` 以紧急模式启动，你将获得一个 shell 并从那里进行故障排除。正如我们已经讨论过的那样，在紧急模式下，文件系统将以只读模式挂载，并且在这种模式下也不会有网络，

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergency-prompt-debian9.jpg)

使用以下命令将根文件系统挂载到读写模式，

```
# mount -o remount,rw /

```

同样，你可以在读写模式下重新挂载其余文件系统。

#### 将 Debian 9 引导到救援和紧急模式

重启 Debian 9.x 服务器并进入 grub页面选择 “Debian GNU/Linux”。

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Debian9-Grub-Screen.jpg)

按下 `e` 并移动到 linux 开头的行尾并添加 `systemd.unit=rescue.target` 以在救援模式下启动系统， 要在紧急模式下启动，那就添加 `systemd.unit=emergency.target`。

#### 救援模式：

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Rescue-mode-Debian9.jpg)

现在按 `Ctrl-x` 或 `F10` 以救援模式启动

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Rescue-Mode-Shell-Debian9.jpg)

按下回车键以获取 shell，然后从这里开始故障排除。

#### 紧急模式：

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergency-target-grub-debian9.jpg)

现在按下 `ctrl-x` 或 `F10` 以紧急模式启动系统

![](https://www.linuxtechi.com/wp-content/uploads/2018/09/Emergency-prompt-debian9.jpg)

按下回车获取 shell 并使用 `mount -o remount,rw /` 命令以读写模式挂载根文件系统。

**注意：**如果已经在 Ubuntu 18.04 和 Debian 9 Server 中设置了 root 密码，那么你必须输入 root 密码才能在救援和紧急模式下获得 shell

就是这些了，如果您喜欢这篇文章，请分享你的反馈和评论。


--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/boot-ubuntu-18-04-debian-9-rescue-emergency-mode/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
