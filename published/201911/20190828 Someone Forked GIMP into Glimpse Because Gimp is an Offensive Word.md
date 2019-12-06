[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11529-1.html)
[#]: subject: (Someone Forked GIMP into Glimpse Because Gimp is an Offensive Word)
[#]: via: (https://itsfoss.com/gimp-fork-glimpse/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

由于 GIMP 是令人反感的字眼，有人将它复刻了
======

在开源应用程序世界中，当社区成员希望以与其他人不同的方向来开发应用程序时，<ruby>复刻<rt>fork</rt></ruby>是很常见的。最新的具有新闻价值的一个复刻称为 [Glimpse][1]，旨在解决用户在使用 <ruby>[GNU 图像处理程序][2]<rt>GNU Image Manipulation Program</rt></ruby>（通常称为 GIMP）时遇到的某些问题。

### 为什么创建 GIMP 的复刻？

![][3]

当你访问 Glimpse 应用的[主页][1]时，它表示该项目的目标是“尝试其他设计方向并修复长期存在的错误。”这听起来并不奇怪。但是，如果你开始阅读该项目的博客文章，则是另外一种印象。

根据该项目的[第一篇博客文章][4]，他们创建了这个复刻是因为他们不喜欢 GIMP 这个名称。根据该帖子，“我们中的许多人不认为该软件的名称适用于所有用户，并且在拒绝该项目的 13 年后，我们决定复刻！”

如果你想知道为什么这些人认为 GIMP 令人讨厌，他们在[关于页面][5]中回答该问题：

> “如果英语不是你的母语，那么你可能没有意识到 ‘gimp’ 一词有问题。在某些国家，这被视为针对残疾人的侮辱和针对不受欢迎儿童的操场侮辱。它也可以与成年人同意的某些‘天黑后’活动联系起来。”

他们还指出，他们并没有使这一举动脱离政治正确或过于敏感。“除了可能给边缘化社区带来的痛苦外，我们当中许多人都有过倡导自由软件的故事，比如在 GNU 图像处理程序没有被专业环境中的老板或同事视为可选项这件事上。”

他们似乎在回答许多质疑，“不幸的是，我们不得不复刻整个项目来更改其名称，我们认为有关此问题的讨论陷入了僵局，而这是最积极的前进方向。 ”

看起来 Glimpse 这个名称不是确定不变的。他们的 GitHub 页面上有个关于可能选择其他名称的[提案][7]。也许他们应该放弃 GNU 这个词，我认为 IMP 这个词没有不好的含义。（LCTT 译注：反讽）

### 分叉之路

![GIMP 2.10][8]

[GIMP][6] 已经存在了 20 多年，因此任何形式的复刻都是一项艰巨的任务。当前，[他们正在计划][9]首先在 2019 年 9 月发布 Glimpse 0.1。这将是一个软复刻，这意味着在迁移到新身份时的更改将主要是装饰性的。（LCTT 译注：事实上到本译文发布时，该项目仍然处于蛋疼的 0.1 beta，也许 11 月，也许 12 月，才能发布 0.1 的正式版本。）

Glimpse 1.0 将是一个硬复刻，他们将积极更改代码库并将其添加到代码库中。他们想将 1.0 移植到 GTK3 并拥有自己的文档。他们估计，直到 2020 年 GIMP 3 发布之后才能做到。

除了 1.0，Glimpse 团队还计划打响自己的名声。他们计划进行“前端 UI 重写”。他们目前正在讨论[改用哪种语言][10]。D 和 Rust 似乎有很多支持者。随着时间的流逝，他们也[希望][4]“添加新功能以解决普通用户的抱怨”。

### 最后的思考

我过去曾经使用过一点 GIMP，但从来没有对它的名称感到困扰。老实说，我很长一段时间都不知道这意味着什么。有趣的是，当我在 Wikipedia 上搜索 GIMP 时，看到了一个 [GIMP 项目][11]的条目，这是纽约的一个现代舞蹈项目，其中包括残疾人。我想 gimp 并不是每个人视为一个贬低词汇的。

对我来说，更改名称似乎需要大量工作。似乎改写 UI 的想法会使项目看起来更有价值一些。我想知道他们是否会调整它以带来更经典的 UI，例如[使用 Ctrl + S 保存到 GIMP][12] / Glimpse。让我们拭目以待。

如果你对该项目感兴趣，可以在 [Twitter][14] 上关注他们，查看其 [GitHub 帐户][15]，或查看其 [Patreon 页面][16]。

你觉得被 GIMP 名称冒犯了吗？你是否认为值得对应用程序进行复刻，以便你可以对其进行重命名？在下面的评论中让我们知道。

如果你觉得这篇文章有趣，请花一点时间在社交媒体、Hacker News 或 [Reddit][17] 上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gimp-fork-glimpse/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://getglimpse.app/
[2]: https://www.gimp.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/gimp-fork-glimpse.png?resize=800%2C450&ssl=1
[4]: https://getglimpse.app/posts/so-it-begins/
[5]: https://getglimpse.app/about/
[6]: https://itsfoss.com/gimp-2-10-release/
[7]: https://github.com/glimpse-editor/Glimpse/issues/92
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/08/gimp-screenshot.jpg?resize=800%2C508&ssl=1
[9]: https://getglimpse.app/posts/six-week-checkpoint/
[10]: https://github.com/glimpse-editor/Glimpse/issues/70
[11]: https://en.wikipedia.org/wiki/The_Gimp_Project
[12]: https://itsfoss.com/how-to-solve-gimp-2-8-does-not-save-in-jpeg-or-png-format/
[13]: https://itsfoss.com/wps-office-2016-linux/
[14]: https://twitter.com/glimpse_editor
[15]: https://github.com/glimpse-editor/Glimpse
[16]: https://www.patreon.com/glimpse
[17]: https://reddit.com/r/linuxusersgroup
