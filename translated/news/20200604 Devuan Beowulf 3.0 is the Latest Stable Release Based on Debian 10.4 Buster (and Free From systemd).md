[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Devuan Beowulf 3.0 is the Latest Stable Release Based on Debian 10.4 Buster (and Free From systemd))
[#]: via: (https://itsfoss.com/devuan-3-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Devuan Beowulf 3.0 是基于 Debian 10.4 Buster 的最新稳定版本（且没有 systemd）
======

[Devuan GNU+Linux][1] 是 [Debian][2] 的分支，它没有 [systemd][3]。如果你想知道 systemd 有什么问题，那将另一个讨论。

但是，如果你是想要无 systemd Linux 发行版的人，那么 Devuan Beowulf 3.0 的发布对你来说应该是个好消息。

### Devuan Beowulf 3.0：新增功能？

![][4]

Devuan 通常因提供替代的 [init][5] 软件（如 [SysV][6]）而受到喜爱。

在本文中，我们将介绍 Devuan Beowulf 3.0 中的主要亮点。

#### 基于 Debian 10.4 Buster

[Debian 10 Buster][7] 无疑是令人印象深刻的发行系列，最新版本是 Debian 10.4。

在 Devuan Beowulf 3.0 中，你会很高兴地知道该版本基于最新的 Debian 10.4 Buster 更新。

如果你不了解它，可以查看 [Debian 10.4 Buster 的官方公告][8]，以了解更多信息。

#### Linux Kernel 4.19

在最新版本中装有 [Linux Kernel 4.19 LTS][9] 也是一个很好的补充。

当然，这不是最新的，因为我们身处 “Debian 领域”，这里的事物并非总是最新的，而是更加稳定。新内核应该可以解决以前版本中可能遇到的几个问题。

#### 支持 ppc64el 架构

对 [ppc64el][10] 的支持在大多数时候都不是大问题，但支持 PowerPC 和 Power ISA 处理器是一个优势。

别忘了，Devuan GNU+Linux 已经支持 i386、amd64、armel、armhf 和 arm64 架构。

#### 添加 runit 和 OpenRC 作为可选项

为考虑更多 init 替代方案，[runit][11] 和 [openrc][12] 现在是最新版本中的一个选项。

#### 其他更改

除了上面关键亮点外，你还可以发现添加了独立守护进程 [eudev][13] 和 [elogind][14]。

启动页面、显示管理器和桌面主题还包括了细微的变化。例如，启动菜单显示 “**Debian**” 而不是 “**Devuan**”。

如果你想了解有关 Devuan Beowulf 3.0.0 变更的更多技术详细信息，那么可能需要查看[官方发行说明][15]。

花絮

Devuan 的发布以小行星命名。Beowulf 是一个[编号为 38086 的小行星][16]。

### 总结

Devuan Beowulf 3.0 的最新稳定版本被认为是提供无 systemd 发行版的良好进展。

如果你想支持 Devuan 项目，请[在财务上为他们的项目捐款][17]或[通过其他方式][18]。

你觉得这个版本怎么样？请在下面评论让我知道你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/devuan-3-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://devuan.org
[2]: https://www.debian.org
[3]: https://en.wikipedia.org/wiki/Systemd
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/devuan-beowulf.jpg?ssl=1
[5]: https://en.wikipedia.org/wiki/Init
[6]: https://wiki.archlinux.org/index.php/SysVinit
[7]: https://itsfoss.com/debian-10-buster/
[8]: https://www.debian.org/News/2020/20200509
[9]: https://itsfoss.com/linux-kernel-4-19-lts-release/
[10]: https://en.wikipedia.org/wiki/Ppc64
[11]: https://en.wikipedia.org/wiki/Runit
[12]: https://en.wikipedia.org/wiki/OpenRC
[13]: https://wiki.gentoo.org/wiki/Eudev
[14]: https://wiki.gentoo.org/wiki/Elogind
[15]: https://files.devuan.org/devuan_beowulf/Release_notes.txt
[16]: https://en.wikipedia.org/wiki/Meanings_of_minor_planet_names:_38001%E2%80%9339000#086
[17]: https://devuan.org/os/donate
[18]: https://dev1galaxy.org/viewtopic.php?pid=1380#p1380
