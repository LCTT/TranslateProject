MidnightBSD 发布 1.0！
======

几天前，Lucas Holt 宣布发布 MidnightBSD 1.0。让我们快速看一下这个新版本中包含的内容。

### 什么是 MidnightBSD？

![MidnightBSD][1]

[MidnightBSD][2] 是 FreeBSD 的一个分支。Lucas 创建了 MightnightBSD，这成为桌面用户和 BSD 新手的一个选择。他想创造一个能让人们快速体验 BSD 桌面的东西。他认为其他发行版过于关注服务器市场。

### MidnightBSD 1.0 中有什么？

根据[发布说明][3]（[视频](https://www.youtube.com/embed/-rlk2wFsjJ4)），1.0 中的大部分工作都是更新基础系统，改进包管理器和更新工具。新版本与 FreeBSD 10-Stable 兼容。

Mports（MidnightBSD 的包管理系统）已经升级支持使用一个命令安装多个包。`mport upgrade` 命令已经修复。Mports 现在会跟踪已弃用和过期的包。它还引入了新的包格式。

其他变化包括：

  * 现在支持 [ZFS][4] 作为启动文件系统。以前，ZFS 只能用于附加存储。
  * 支持 NVME SSD。
  * AMD Ryzen 和 Radeon 的支持得到了改善。
  * Intel、Broadcom 和其他驱动程序已更新。
  * 已从 FreeBSD 移植 bhyve 支持。
  * 传感器框架已被删除，因为它导致锁定问题。
  * 删除了 Sudo 并用 OpenBSD 中的 [doas][5] 替换。
  * 增加了对 Microsoft hyper-v 的支持。

### 升级之前

如果你当前是 MidnightBSD 的用户或正在考虑尝试新版本，那么还是再等一会。Lucas 目前正在重建软件包以支持新的软件包格式和工具。他还计划在未来几个月内升级软件包和移植桌面环境。他目前正致力于移植 Firefox 52 ESR，因为它是最后一个不需要 Rust 的版本。他还希望将更新版本的 Chromium 移植到 MidnightBSD。我建议关注 MidnightBSD 的 [Twitter][6]。

### 0.9 怎么回事？

你可能注意到 MidnightBSD 的先前版本是 0.8.6。你现在可能想知道“为什么跳到 1.0”？根据 Lucas 的说法，他在开发 0.9 时遇到了几个问题。事实上，他重试好几次。他最终采用与 0.9 分支不同的方式，并变成了 1.0。有些软件包在 0.* 系列也有问题。

### 需要帮助

目前，MidnightBSD 项目几乎是 Lucas Holt 一个人的作品。这是其发展缓慢的主要原因。如果你有兴趣帮忙，可以通过 [Twitter][6] 与他联系。

在[发布公告视频][7]中。Lucas 说他遇到了上游项目接受补丁的问题。他们似乎认为 MidnightBSD 太小了。这通常意味着他必须从头开始移植应用。

### 想法

我对劣势者有一个想法。在我接触的所有 BSD 中，这个外号最适合 MidnightBSD。一个人想要创建一个轻松的桌面体验。当前只有一个其他的 BSD 在尝试做相似的事情：Project Trident。我想这是 BSD 成功的真正的阻碍。Linux 成功是因为人们可以快速容易地安装它。希望 MidnightBSD 为 BSD 做到这一点，但是还有很长的路要走。

你有没有用过 MidnightBSD？如果没有，你最喜欢的 BSD 是什么？我们应该涵盖哪些其他 BSD 主题？请在下面的评论中告诉我们。

如果你觉得这篇文章有趣，请花一点时间在社交媒体，Hacker News 或 [Reddit][8] 上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/midnightbsd-1-0-release/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:  https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/midnightbsd-wallpaper.jpeg
[2]: https://www.midnightbsd.org/
[3]: https://www.midnightbsd.org/notes/
[4]: https://itsfoss.com/what-is-zfs/
[5]: https://man.openbsd.org/doas
[6]: https://twitter.com/midnightbsd
[7]: https://www.youtube.com/watch?v=-rlk2wFsjJ4
[8]: http://reddit.com/r/linuxusersgroup
