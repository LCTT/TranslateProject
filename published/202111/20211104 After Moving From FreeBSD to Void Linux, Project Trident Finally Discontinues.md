[#]: subject: "After Moving From FreeBSD to Void Linux, Project Trident Finally Discontinues"
[#]: via: "https://news.itsfoss.com/project-trident-discontinues/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13960-1.html"

从 FreeBSD 转到 Void Linux 后，Trident 项目终于结束了
======

> Trident 项目为我们提供了与操作系统无关的 Lumina 桌面。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/project-trident-discontinues.png?w=1200&ssl=1)

令人遗憾，[Trident 项目][1] 团队宣布将结束他们的 Linux 发行版的开发。

### 那段故事

你或许没有听说过 Trident 项目，让我来讲点关于它的一点回忆。那是在 2005 年，Kris Moore 推出了 [PC-BSD][2]，提供了一种用桌面界面来设置 FreeBSD 的简单方法。次年，它被 [iXsystems][3] 收购。十年后，2016 年 9 月，这个项目被改名为 TrueOS。这个项目也变成了基于 FreeBSD Current 分支的滚动发行版。两年后，TrueOS [宣布][4] 他们将取消其操作系统的桌面版本，而专注于商业和服务器市场。其桌面元素被 [剥离][5] 到一个新项目：Trident。

有一段时间，Trident 开发团队尽力在 FreeBSD 之上打造良好的桌面体验。可是，由于 [FreeBSD 的问题][6]，包括 “硬件兼容性、通信标准，或软件包的可用性一直限制着 Trident 项目的用户”，他们决定将其建立在其他基础之上。他们的解决方案是在 2019 年将其项目重新构建在 [Void Linux][7] 之上。有那么一段时间，看起来 Trident 项目似乎有了未来。然后，2020 年来了。

![Trident 桌面][8]

### 项目的终止

10 月 29 号，Trident 项目团队发布了以下 [公告][9]：

> 我们非常悲伤地宣布，Trident 项目将从 2021 年 11 月 1 号起进入“夕阳”阶段，并将于 2022 年 3 月关掉商店。项目的核心团队共同做出了这个决定。随着过去两年中，生活、工件和家庭等方面的事情和变故；我们个人的优先事项也发生了改变。
>
> 我们将保持 Trident 项目的软件包存储库和网站的运行，直到 2022 年 3 月 1 日的终止期，但是我们强烈推荐用户在即将到来的新年假期中开始寻找其他桌面系统替代。
>
> 感谢大家的支持和鼓励！过去几年中，该项目得以良好运转，我们也非常高兴在这些年里结识了你们中的许多人。

### Lumina 项目继续

贯穿 PC-BSD/TrueOS/Trident 项目传奇故事的一个永恒主题是桌面环境。2012 年，[Ken Moore][10]（Kris 的弟弟）开始开发一个基于 Qt 的桌面环境 [Lumina][11]。2014 年，它成为 PC-BSD 的默认桌面环境，并一直保持到 Trident 项目出现。Lumina 不同于其他桌面环境，因为它的设计与操作系统无关。其他桌面系统像 KDE 和 GNOME 都具有 Linux 特定代码，这使得它们难以移植到 BSD。

![Lumina 桌面环境][15]

今年 6 月，Ken 把 [Lumina 的领导权][12] 交给了 Trident 的开发者 [JT Pennington][13]（也因 [BSDNow][14] 知名）。

[公告][12] 中说：

> 经过长达 7 年的工作，我决定是时候让其他人接手 Lumina 桌面项目的开发了。这是个难以置信的任务，推动我进入之前从未考虑过的开发领域。可是，由于工作和生活的变化，我几乎没有为 Lumina 开发新功能的时间了，特别是即将在明年或者晚些时候到来的 Qt5->Qt6 升级。通过把火炬传递给 JT （GitHub 昵称是 q5sys），我希望这个项目能获得更及时的更新，以造福每个人。
>
> 感谢大家，我希望 Lumina 桌面项目能继续成功！！

### 总结

我一直对 Trident 项目抱有很高的期望。与我们介绍的许多发行版相比，它很小巧。它不是只增加了一两个新工具的、对 Arch 或 Ubuntu 的翻版。不仅如此，他们还努力改进一个与他们理念相同的发行版 Void Linux。可是，生活会发生变故，即使是我们中最好的人也难以避免遇到变故。我祝愿 Ken、JT 和其他人一切顺利，他们已经在这个项目上花费了很多时间。希望，我们未来能看到他们的更多作品。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/project-trident-discontinues/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[zd200572](https://github.com/zd200572)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://project-trident.org/
[2]: https://en.wikipedia.org/wiki/TrueOS
[3]: http://ixsystems.com/
[4]: https://itsfoss.com/trueos-plan-change/
[5]: https://itsfoss.com/project-trident-interview/
[6]: https://project-trident.org/post/os_migration/
[7]: https://voidlinux.org/
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/project-trident.png?w=850&ssl=1
[9]: https://project-trident.org/post/2021-10-29_sunset/
[10]: https://github.com/beanpole135
[11]: https://lumina-desktop.org/
[12]: https://lumina-desktop.org/post/2021-06-23/
[13]: https://github.com/q5sys
[14]: https://www.bsdnow.tv/
[15]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/lumina.png?w=850&ssl=1