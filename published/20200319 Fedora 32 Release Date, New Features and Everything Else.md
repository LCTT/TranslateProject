[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12044-1.html)
[#]: subject: (Fedora 32 Release Date, New Features and Everything Else)
[#]: via: (https://itsfoss.com/fedora-32/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Fedora 32 发布日期、新功能和其它信息
======

Fedora 32 应该和 [Ubuntu 20.04 LTS][1] 一样都在 4 月底发布。

由于我们详细介绍了 Ubuntu 20.04，因此我们考虑在这里为 Fedora 粉丝做同样的事情。

在本文中，我将重点介绍 Fedora 32 的新功能。随着开发的进行，我将对本文进行更新。

### Fedora 32 的新功能

![][2]

#### 启用了 EarlyOOM

在此版本中，默认启用 [EarlyOOM][3]。提供一下背景知识，EarlyOOM 可以让用户在大量进行[交换][4]时轻松地摆脱内存不足状况恢复其系统。

值得注意的是，它适用于 Fedora 32 Beta 工作站版本。

#### 添加了 GNOME 3.36

新的 Fedora 32 工作站版也包含了新的 [GNOME 3.36][5]。不仅限于 Fedora 32 Beta 工作站版，[Ubuntu 20.04 LTS][1] 的每日构建版中也添加了它。

当然，GNOME 3.36 中的改进也进入了 Fedora 的最新版本，总体上提供了更快，更好的体验。因此，你将获得新的锁定屏幕、请勿打扰功能以及 GNOME 3.36 附带的所有其他功能。

#### 软件包更新

Fedora 32 版本还更新了许多重要的软件包，包括 Ruby、Perl 和 Python。它还有 [GNU 编译器集合（GCC）][6]的最新版本 10。

#### 其他更改

除了主要亮点之外，还有很多更改、改进或修复。你可以详细查看它的[更新日志][7]来了解有关更多信息。

### 下载Fedora 32（开发版）

Fedora 32 仍在开发中。Beta 版已经发布，你可以在空闲系统或虚拟机上对其进行测试。**我不建议你在最终版本之前在主系统上使用它**。当前版本有一个官方的[已知 bug 列表] [8]，你也可以参考。

在[官方公告][9]中，他们提到了 **Fedora 32 beta 工作站版**和**服务器版**以及其他流行版本的可用性。

要获取工作站和服务器版本，你必须访问 [Fedora 工作站][10]和 [Fedora 服务器][11]的官方下载页面（取决于你的需求）。

![Fedora Download Beta][12]

打开后，你只需查找如上图所示的标记为 “**Beta!**” 的发行版，然后开始下载。对于其他变体版本，请单击下面的链接以转到各自的下载页面：

* [Fedora 32 Beta Spins][13]
* [Fedora 32 Beta Labs][14]
* [Fedora 32 Beta ARM][15]

你是否注意到 Fedora 32 中的其他新功能？你想在这里看到哪些功能？请随时在下面发表评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-32/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/update_fedora.jpg?ssl=1
[3]: https://fedoraproject.org/wiki/Changes/EnableEarlyoom#Enable_EarlyOOM
[4]: https://itsfoss.com/swap-size/
[5]: https://itsfoss.com/gnome-3-36-release/
[6]: https://gcc.gnu.org/
[7]: https://fedoraproject.org/wiki/Releases/32/ChangeSet
[8]: https://fedoraproject.org/wiki/Common_F32_bugs
[9]: https://fedoramagazine.org/announcing-the-release-of-fedora-32-beta/
[10]: https://getfedora.org/workstation/download/
[11]: https://getfedora.org/server/download/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/fedora-download-beta.jpg?ssl=1
[13]: https://spins.fedoraproject.org/prerelease
[14]: https://labs.fedoraproject.org/prerelease
[15]: https://arm.fedoraproject.org/prerelease
