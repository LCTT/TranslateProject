[#]: subject: "It’s Time for Ubuntu to Opt for a Hybrid Rolling Release Model"
[#]: via: "https://news.itsfoss.com/ubuntu-hybrid-release-model/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13666-1.html"

是时候让 Ubuntu 选择混合滚动发布模式了
======

> 在两个 LTS 版本之间有三个短期版本。Ubuntu 应该用滚动发布模式来取代它们。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/Ubuntu-hybrid-release-model.jpg?w=1200&ssl=1)

即使你不是 Ubuntu 的用户，你可能也知道它的发布模式。

有一个 [长期支持（LTS）版本][1]，每两年发布一次，并有五年的支持。在这两个 LTS 版本之间，我们可以看到三个非 LTS 版本，它们的发布时间间隔为 6 个月。

LTS 版本会保持内核不会变化（除非你选择 [HWE 内核][2]），它还维持了各种软件组件不变以提供稳定的生产环境。

介于两者之间的非 LTS 版 Ubuntu 具有 Ubuntu 的新功能、更新一些的内核、新的桌面环境以及 Ubuntu 软件库中的各种软件的新版本。

这些非 LTS 版本作为“试验场”，为最终在 LTS 版本中出现的功能提供测试，这已不是什么秘密。

这就是为什么我建议摆脱这些中间版本，在 LTS 版本之间选择 [滚动发布][3] 模式。个中原因，请听我说。

### 在 LTS 发布之间进行滚动开发

六个月一次的发布计划给 Ubuntu 开发者制定了一个紧凑的工作时间表。这是一个好的方法，它可以使他们的目标集中在一个适当的路线图上。

但是，这也为在每个版本中提供“更多”新功能带来了额外的压力。如果时间很短，这不可能总是做到。还记得 [Ubuntu 不得不从 21.04 版本中删除 GNOME 40][4] 吗？因为开发者没有足够的时间来完成它。

另外，最终用户（比如你和我）想选择留在非 LTS 版本中也是不可行的。其支持在九个月后结束，这意味着即使你没有立即升级到下一个非 LTS 的 Ubuntu 版本，最终你也不得不这样做。如果你在 6 个月内没升级，那你可能就得在 9 个月内升级。

我知道你会说，升级 Ubuntu 版本很简单。点击几下，良好的网速和一个潜在的备份就可以让你在新的 Ubuntu 版本上没有什么麻烦。

我的问题是，为什么要这么麻烦。滚动发布会更简单。让升级在 LTS 版本之间进行。

开发人员在新功能准备好的时候发布。用户随着系统更新不断得到升级，而不是每 6 个月或 9 个月做一次“重大升级”。

你看，那些选择非 LTS 版本的人是那些想要新功能的人，让他们通过滚动发布获得新功能。LTS 的发布时间表保持不变，每两年来一次。

### Bug 测试？像其他滚动发布的版本一样做个测试分支好了

当我说滚动发布时，我并不是指像 Arch Linux 那样的滚动。它应该是像 Manjaro 那样的滚动。换句话说，在测试后推出升级版，而不是直接在野外发布。

目前，新的 Ubuntu 版本有测试版，以便早期采用者可以测试它并向开发者提供反馈。这可以通过保留测试和稳定分支来实现，就像许多其他滚动发布的版本一样。

### 你对滚动发布怎么看？

我知道 Ubuntu 的铁杆用户期待着每一次的发布。代号、吉祥物、艺术品和墙纸，这些都是 Ubuntu 的传统的一部分。我们应该打破这种传统吗？

这只是我的看法，我很想听听你的看法。Ubuntu 应该选择这种混合滚动模式还是坚持目前的模式？你怎么看呢？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-hybrid-release-model/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/long-term-support-lts/
[2]: https://itsfoss.com/ubuntu-hwe-kernel/
[3]: https://itsfoss.com/rolling-release/
[4]: https://news.itsfoss.com/no-gnome-40-in-ubuntu-21-04/
