[#]: subject: "How to Boot Ubuntu 22.04 into Rescue / Emergency Mode"
[#]: via: "https://www.linuxtechi.com/boot-ubuntu-22-04-rescue-emergency-mode/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14750-1.html"

如何启动 Ubuntu 22.04 进入救援/紧急模式
======

![](https://img.linux.net.cn/data/attachment/album/202206/24/101647n4nru1ayaw4nrnue.jpg)

极客们好，将 Ubuntu 22.04（Jammy Jellyfish）启动到<ruby>救援<rt>Rescue</rt></ruby>和<ruby>紧急<rt>Emergency</rt></ruby>模式可以重置忘记的用户密码、修复文件系统错误，以及在启动过程中禁用或启用 systemd 服务。

在这篇文章中，我们将学习如何启动 Ubuntu 22.04 LTS 系统进入救援和应急模式。救援模式类似于单用户模式，所有的故障排除步骤都在这里进行。救援模式加载最小的环境并挂载根文件系统。

而在紧急模式下，我们得到的是单用户 Shell，而不启动任何系统服务。因此，当我们无法启动系统进入救援模式时，就需要紧急模式。

### 启动 Ubuntu 22.04 进入救援或单用户模式

前往你想启动到救援或单用户模式的目标系统。在启动时按下 `SHIFT + ESC` 键，进入 GRUB 引导加载器页面。

![Default-Grub-Screen-Ubuntu-22-04][1]

选择第一个选项 “Ubuntu”，并按 `e` 键进入编辑模式。

在以 `linux` 开头的一行末尾，删除字符串 `$vt_handoff` 并添加字符串 `systemd.unit=rescue.target`。

![rescue-target-ubuntu-22-04][2]

做完修改后，按 `Ctrl + X` 或 `F10` 在救援模式下启动。

![Troubleshooting-Commands-in-Rescue-Mode][3]

进入救援模式后，运行所有的故障排除命令，并运行 `systemctl reboot` 命令来重启系统。

### 另一种启动系统进入救援模式的方法

重新启动系统并按下 `ESC + Shift` 键，进入 GRUB 启动界面。

选择第二个选项 “<ruby>Ubuntu 高级选项<rt>Advanced Options for Ubuntu</rt></ruby>”->选择“<ruby>恢复模式<rt>recovery mode</rt></ruby>”选项并点击回车->选择 <ruby>root（进入 root shell 提示符）<rt>root (Drop to root shell prompt)</rt></ruby>。

下面是一个例子：

![Boot-Ubuntu-22-04-Rescue-Mode][4]

当你有了 root Shell，运行命令来恢复和修复系统问题，最后使用 `systemctl reboot` 来重启系统。

### 引导 Ubuntu 22.04 进入紧急模式

要启动系统进入紧急模式，首先进入 GRUB 页面。

![Default-Grub-Screen-Ubuntu-22-04][5]

选择第一个选项 “Ubuntu” 并按 `e` 键进行编辑。寻找以 `linux` 开头的一行，移到该行的末尾，删除字符串 `$vt_handoff` 并添加字符串 `systemd.unit=emergency.target`。

![Emergency-Mode-Ubuntu-22-04][6]

按 `Ctrl + X` 或 `F10` 将系统启动到紧急模式。

![Command-in-Emergency-Mode-Ubuntu-22-04][7]

同样，在紧急模式下，你可以在这个模式下执行所有的故障排除，完成后，就用 `systemctl reboot` 命令重启系统。

这篇文章的内容就这些。文章内容丰富，不要犹豫，请在你的技术朋友中分享它。请在下面的评论区发表你的疑问和反馈。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/boot-ubuntu-22-04-rescue-emergency-mode/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Default-Grub-Screen-Ubuntu-22-04.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/06/rescue-target-ubuntu-22-04.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Troubleshooting-Commands-in-Rescue-Mode.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Boot-Ubuntu-22-04-Rescue-Mode.gif
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Default-Grub-Screen-Ubuntu-22-04.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Emergency-Mode-Ubuntu-22-04.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Command-in-Emergency-Mode-Ubuntu-22-04.png
