[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12455-1.html)
[#]: subject: (Btrfs to be the Default Filesystem on Fedora? Fedora 33 Starts Testing Btrfs Switch)
[#]: via: (https://itsfoss.com/btrfs-default-fedora/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Fedora 33 开始测试切换到 Btrfs
======

尽管距离 Fedora 的下一个稳定版本（[Fedora 33][1]）还有几个月的距离，但仍有一些值得关注的变化。

在所有其他 [Fedora 33 接受的系统范围的更改][1]中，最有趣的提议是将 Btrfs 作为桌面的默认文件系统，这个提议现在已经被批准了。

这是 Fedora 对该提案的评价：

> 对于安装 Fedora 的笔记本电脑和工作站，我们希望以透明的方式向用户提供文件系统功能。我们希望添加新功能，同时减少处理磁盘空间不足之类的情况所需的专业知识。Btrfs 它的设计理念非常适合这个角色，让我们将其设为默认设置。

值得注意的是，在测试的最终投票结果出来之前，这不是系统范围内的更改。

但是，现在测试已经成功完成，投票结果也是赞成的 —— Fedora 33 版本已经接受了这个改动。

那么，为什么 Fedora 提出这一更改？这会有什么用么？这是糟糕的举动吗？对 Fedora 的发行有何影响？让我们在这里谈论下。

![][3]

### 它会影响哪些 Fedora 版本？

根据提议，如果测试成功，那么 Fedora 33 的所有桌面版本、spins 和 labs 都受此影响。

因此，你可以期望[工作站版本][4]将 Btrfs 作为 Fedora 33 上的默认文件系统。

### 实施此更改的潜在好处

为了改进 Fedora 在笔记本和工作站的使用，Btrfs 文件系统提供了一些好处。

现在 Fedora 33 将成为默认文件系统 —— 让我来指出使用 Btrfs 作为默认文件系统的好处：

  * 延长存储硬件的使用寿命
  * 提供一个简单的方案来解决用户耗尽根目录或主目录上的可用空间的情况
  * 不易造成数据损坏，易于恢复
  * 提供更好的调整文件系统大小的功能
  * 通过强制 I/O 限制来确保桌面在高内存压力下的响应能力
  * 使复杂的存储设置易于管理

如果你感到好奇，你可能想更深入地了解 [Btrfs][5] 及其总体优点。

不要忘记，Btrfs 已经是受支持的选项，它只是不是默认的文件系统而已。

但是，总的来说，感觉在Fedora 33上引入Btrfs作为默认文件系统是一个有用的变化。

### Red Hat Enterprise Linux 会不会实现它？

很明显，Fedora 被认为是 [Red Hat Enterprise Linux][6] 的前沿版本。

因此，如果 Fedora 拒绝更改，那么 Red Hat 将不会实施。另一方面，如果你希望 RHEL 使用 Btrfs，那么 Fedora 应该首先同意更改。

为了让你更加清楚，Fedora 对其进行了详细介绍：

> Red Hat 在许多方面都很好地支持 Fedora。但是 Fedora 已经与上游紧密合作，并依赖上游。这将是其中之一。这是该提案的重要考虑因素。社区有责任确保它得到支持。如果 Fedora 拒绝，那么 Red Hat 将永远不会支持 Btrfs。Fedora 必然需要成为第一个，并提出令人信服的理由，说明它比替代方案能解决更多的问题。它的负责人相信它确实如此，毫无疑问。

另外，值得注意的是，如果你不想在 Fedora 中使用 btrfs，你应该看看 [OpenSUSE][7] 和 [SUSE Linux Enterprise][8]。

### 总结

即使这个更改看起来不会影响任何升级或兼容性，你也可以在 [Fedora 项目的 Wiki 页面][9]中找到有关 Btrfs 的更改的更多信息。

你对针对 Fedora 33 发行版的这一更改有何看法？你是否要将 btrfs 文件系统作为默认文件系统？

请在下面的评论中让我知道你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/btrfs-default-fedora/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://fedoraproject.org/wiki/Releases/33/ChangeSet
[2]: https://fedoraproject.org/wiki/Test_Day:2020-07-08_Btrfs_default?rd=Test_Day:F33_btrfs_by_default_2020-07-08
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/btrfs-default-fedora.png?ssl=1
[4]: https://getfedora.org/en/workstation/
[5]: https://en.wikipedia.org/wiki/Btrfs
[6]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[7]: https://www.opensuse.org
[8]: https://www.suse.com
[9]: https://fedoraproject.org/wiki/Changes/BtrfsByDefault
