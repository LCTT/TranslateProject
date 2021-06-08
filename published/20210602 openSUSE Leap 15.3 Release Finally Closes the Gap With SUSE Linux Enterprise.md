[#]: subject: (openSUSE Leap 15.3 Release Finally Closes the Gap With SUSE Linux Enterprise)
[#]: via: (https://news.itsfoss.com/opensuse-leap-15-3-release/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13469-1.html)

openSUSE Leap 15.3 版本缩小了与 SUSE Linux 企业版的差距
======

![](https://img.linux.net.cn/data/attachment/album/202106/08/184921thd7vc8qvxbhzt53.jpg)

> 随着 openSUSE 15.3 的发布，与 SUSE Linux 企业版的差距终于缩小了。对于开发团队来说，这应该是一个令人兴奋的用于测试的更新。

去年，在 [openSUSE Leap 15.2 发行版][1] 中他们希望通过使用与企业版相同二进制软件包来构建 openSUSE Leap，从而缩小 openSUSE Leap 与 SUSE Linux 企业版之间的差距。

这样一来的话，如果有人在使用 openSUSE 测试后切换到 SUSE Linux 企业版，部署的迁移过程都将大大简化。此外，openSUSE Leap 将是开发团队进行测试的一个轻松选择。

随着 openSUSE Leap 15.3 的发布，这个构想成为了现实。本文我将重点介绍这次发布的主要变化。

### openSUSE Leap 15.3: 最新变化

最重要的变化是，它使用与 SUSE Linux 企业版相同的二进制软件包构建。

并且，[发布公告][2] 中提到了这一巨大变化的好处：

> 此版本对于迁移项目和用户验收测试非常有益，使用 openSUSE leap 15.3 进行运行调优和测试工作负载的大型开发团队将会获得最大的好处，因为这些工作负载可以轻松提升并转移到 SUSE Linux 企业版 15 SP3 上进行长期维护。

除了这个巨大的变化，还有其他几个重要的变化使它成为一个令人激动的版本。

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/Leap_15.3_xfce.png?w=1529&ssl=1)

对于 Xfce 4.16 桌面，有一些视觉变化，包括新的图标和调色板。设置管理器还增加了一个视觉刷新功能，提供了更清晰的外观。

如果有需要，KDE Plasma 5.18 也可以作为 LTS 选项与此版本一起提供。而且，GNOME 3.34 在某些应用程序的外观和感觉上有一些细微的变化。虽然 Cinnamon 没有大的变化，但是你会发现它有了一个新的模式。

在这个版本中，你将发现 gnu health 3.8 添加了一些新特性供你探索。

DNF 包管理器有一个更新计划，但是当前没有释放出来，你可以通过后续的维护更新获得它。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/Leap_15.3_xfce4-terminal.png?w=1529&ssl=1)

IBM Z 和 LinuxONE（s390x）是 Leap 15.3 中新支持的两种架构。

所包含的容器技术仍然保持不变，但是它们在本版本中收到了安全更新。当然，你需要去找 Linode 等托管解决方案提供的最新云镜像。

几个应用程序升级包括 Ononishare 2.2、Chromium 89 等。你可以在 [官方特性列表][4] 中找到更多详细信息。

### 下载 openSUSE Leap 15.3

需要注意的是，从今天起，Leap 15.2 将有六个月的寿命（EOL）。

在尝试升级到 Leap 15.3 之前，你必须确保运行的是 Leap 15.2。你可以在他们的 [官方发行说明][5] 中找到有关升级过程的更多信息。

从下面的按钮链接的官方下载页面获取最新的 ISO。

- [下载 openSUSE Leap 15.3][6]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/opensuse-leap-15-3-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/opensuse-leap-15-2-release/
[2]: https://news.opensuse.org/2021/06/02/opensuse-leap-bridges-path-to-enterprise/
[4]: https://en.opensuse.org/Features_15.3
[5]: https://en.opensuse.org/Release_announcement_15.3
[6]: https://get.opensuse.org/leap/
