[#]: subject: "Ubuntu’s Unity Desktop Still Lives: Version 7.6 is Available for Testing After 6 Years"
[#]: via: "https://news.itsfoss.com/unity-7-6-testing/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "imgradeone"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14538-1.html"

Ubuntu 的 Unity 桌面还活着：时隔 6 年后，7.6 测试版发布
======

> 虽然 Canonical 已经不再维护 Unity 桌面，但 Ubuntu Unity 的开发者承担了这项重任，发布了一项主要更新（已可用于测试）。

![Unity 7.6][1]

怕你兴奋过头了，先提醒一下，Canonical 并没有回归 Unity 桌面的维护。

得益于 Ubuntu Unity 发行版开发者（Rudra Saraswat）的不懈努力，时隔 6 年，我们终于看到了 Unity 桌面环境的更新。

补充说一下，[Ubuntu Unity][2] 是一款采用 Unity 桌面（而不是 GNOME）的社区项目。因此，如果你想在 Ubuntu 22.04 LTS 上使用 Unity 桌面，那么毋庸置疑，[Ubuntu Unity][2] 绝对是你的最佳伙伴。

起初，它仅仅提供了经过微调的 Unity 体验，但现在，**Unity 7.6** 的界面得到了一些优化及视觉变更。

下面是你应该了解的东西：

### Unity 7.6：更新了什么？

> **提示**：Unity 7.6 是为公共测试而发布的，它不应作为替代其他桌面环境的使用环境。

这不仅仅是面向用户的改进，还有针对开发方面的努力，旨在帮助贡献者，让他们更方便地帮助 Unity7 的开发。

这些改善包括：

#### 用户界面变更

![Unity 桌面][3]

Dash 启动器（应用启动器）与 HUD 现已重新设计，拥有更现代、简洁的视觉。

总的来看，现在的设计看上去更加扁平，但仍旧保留了不错的系统全局模糊效果。

本次引入了一些细微的视觉改进，比如停靠区上的“清空回收站”按钮修改为使用 Nemo（而不是 Nautilus），以及修复了 Dash 预览中的应用详情与评分。

#### 性能改进

![Unity 桌面][4]

在最新的更新中，Unity7 的内存使用量更低，同时你也可以注意到，Ubuntu Unity 22.04 的内存使用量明显降低到约 700-800 MB。

此外，低端显卡模式现在运作得更好，Dash 也比以前更快。

#### 其他变化

Unity7 Shell 的源代码已经完全迁移至 [GitLab][5]。用于独立测试的 Unity7 启动器已被修复，同时一些有问题的测试项也已被禁用，改善了构建用时（使其大幅缩短）。

发布说明上说，这些改进将帮助 Unity7 的贡献者。

### 测试 Unity 7.6

你可以按照 [官方测试公告][6] 中提到的方式来编译它，并亲自尝试。你也可以前往其官方网站探索更多。

> **[Unity 7.6][7]**

另一种情况，如果你不想添加测试 PPA 源，你也可以等待 Ubuntu Unity 22.04 的更新。

*你对 Unity 桌面环境的这次更新有什么看法？你喜欢它吗？欢迎在评论区中告诉我你的想法。*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/unity-7-6-testing/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[imgradeone](https://github.com/imgradeone)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/unity-7-6-release.jpg
[2]: https://ubuntuunity.org/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/05/unity-7-6.jpg
[4]: https://news.itsfoss.com/wp-content/uploads/2022/05/neofetch-unity-7-6.png
[5]: https://gitlab.com/ubuntu-unity
[6]: https://unity.ubuntuunity.org/blog/unity-7.6/
[7]: https://unity.ubuntuunity.org/