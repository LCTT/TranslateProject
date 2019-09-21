[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11110-1.html)
[#]: subject: (Excellent! Ubuntu LTS Users Will Now Get the Latest Nvidia Driver Updates [No PPA Needed Anymore])
[#]: via: (https://itsfoss.com/ubuntu-lts-latest-nvidia-drivers/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

好消息！Ubuntu LTS 用户不需要 PPA 也可以获得最新的 Nvidia 驱动更新
======

> 要在 Ubuntu LTS 上获得的最新 Nvidia 驱动程序，你不必再使用 PPA 了。最新的驱动程序现在将在 Ubuntu LTS 版本的存储库中提供。

![][1]

你可能已经注意到在 Ubuntu 上安装最新和最好的 Nvidia 二进制驱动程序更新的麻烦。

默认情况下，Ubuntu 提供开源的 [Nvidia Nouveau 驱动程序][2]，这有时会导致 Ubuntu 卡在启动屏幕上。

你也可以轻松地[在 Ubuntu 中安装专有的 Nvidia 驱动程序][3]。问题是默认 [Ubuntu 存储库][4]中的 Nvidia 驱动程序不是最新的。为此，几年前 [Ubuntu 引入了一个专门的 PPA][5]以解决这个问题。

[使用官方 PPA][6] 仍然是安装闭源图形驱动程序的一个不错的解决方法。但是，它绝对不是最方便的选择。

但是，现在，Ubuntu 同意将最新的 Nvidia 驱动程序更新作为 SRU（[StableReleaseUpdates][7]）的一部分提供。所以，你将在使用 Ubuntu LTS 版本时也拥有 Nvidia 驱动程序了。

好吧，这意味着你不再需要在 Ubuntu LTS 版本上单独下载/安装 Nvidia 图形驱动程序。

就像你会获得浏览器或核心操作系统更新（或安全更新）的更新包一样，你将获得所需的 Nvidia 二进制驱动程序的更新包。

### 这个最新的 Nvidia 显卡驱动程序可靠吗？

SRU 字面上指的是 Ubuntu（或基于 Ubuntu 的发行版）的稳定更新。因此，要获得最新的图形驱动程序，你应该等待它作为稳定更新释出，而不是选择预先发布的更新程序。

当然，没有人能保证它能在所有时间内都正常工作 —— 但安装起来比预先发布的更安全。

### 怎样获得最新的 Nvidia 驱动程序？

![Software Updates Nvidia][8]

你只需从软件更新选项中的其他驱动程序部分启用“使用 NVIDIA 驱动程序元数据包……”。

最初，[The Linux Experiment][10] 通过视频分享了这个消息 —— 然后 Ubuntu 的官方 Twitter 作为公告重新推送了它。你可以观看下面的视频以获取更多详细信息：

- [https://youtu.be/NFdeWTQIpjo](https://youtu.be/NFdeWTQIpjo)

### 支持哪些 Ubuntu LTS 版本？

目前，Ubuntu 18.04 LTS 已经可用了，它也将很快在 Ubuntu 16.04 LTS 上可用（随后的 LTS 也将次第跟上）。

### 总结

现在你可以安装最新的 Nvidia 二进制驱动程序更新了，你认为这有何帮助？

如果你已经测试了预先发布的软件包，请在下面的评论中告诉我们你对此的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-lts-latest-nvidia-drivers/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/nvidia-ubuntu-logo.png?resize=800%2C450&ssl=1
[2]: https://nouveau.freedesktop.org/wiki/
[3]: https://itsfoss.com/install-additional-drivers-ubuntu/
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://itsfoss.com/ubuntu-official-ppa-graphics/
[6]: https://itsfoss.com/ppa-guide/
[7]: https://wiki.ubuntu.com/StableReleaseUpdates
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/software-updates-nvidia.jpg?fit=800%2C542&ssl=1
[9]: https://itsfoss.com/ubuntu-17-04-release-features/
[10]: https://twitter.com/thelinuxEXP
