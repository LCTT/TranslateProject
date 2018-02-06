哪个 Linux 内核版本是 “稳定的”？
============================================================


![Linux kernel ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/apple1.jpg?itok=PGRxOQz_ "Linux kernel")
Konstantin Ryabitsev 为你讲解哪个 Linux 内核版本将被考虑作为“稳定版”，以及你如何选择一个适用你的内核版本。[Creative Commons Zero][1]

每次 Linus Torvalds 发布 [一个新 Linux 内核的主线版本][4]，几乎都会引起这种困惑，那就是到底哪个内核版本才是最新的“稳定版”？是新的那个 X.Y，还是前面的那个 X.Y-1.Z ？最新的内核版本是不是太“新”了？你是不是应该坚持使用以前的版本？

[kernel.org][5] 网页上的信息并不会帮你解开这个困惑。目前，在页面的最顶部，我们看到是最新稳定版内核是 4.15 — 但是在这个表格的下面，4.14.16 也被列为“稳定版”，而 4.15 被列为“主线版本”，很困惑，是吧？

不幸的是，这个问题并不好回答。我们在这里使用“稳定”这个词有两个不同的意思：一是，作为最初发布的 Git 树的名字，二是，表示这个内核已经被考虑为“稳定版”，可以作为“生产系统”使用了。

由于 Git 的分布式特性，Linux 的开发工作在许多 [不同的 fork 仓库中][6] 进行。所有的 bug 修复和新特性也是由子系统维护者首次收集和准备的，然后提交给 Linus Torvalds，由 Linus Torvalds 包含进 [他的 Linux 树][7] 中，它的 Git 树被认为是 Git 仓库的 “master”。我们称这个树为 ”主线" Linux 树。

### 候选发布版

在每个新的内核版本发布之前，它都要经过几轮的“候选发布”，它由开发者进行测试并“打磨”所有的这些很酷的新特性。基于他们这几轮测试的反馈，Linus 决定最终版本是否准备就绪。通常每周发布一个候选版本，但是，这个数字经常走到 -rc8，并且有时候甚至达到 -rc9 及以上。当 Linus 确信那个新内核已经没有问题了，他就制作最终发行版，我们称这个版本为“稳定版”，表示它不再是一个“候选发布版”。

### Bug 修复

就像任何一个由不是十全十美的人所写的复杂软件一样，任何一个 Linux 内核的新版本都包含 bug，并且这些 bug 必须被修复。Linux 内核的 bug 修复规则是非常简单的：所有修复必须首先进入到 Linus 的树。一旦在主线仓库中 bug 被修复后，它接着会被应用到由内核开发社区仍然在维护的已发布的内核中。在它们被考虑回迁到已发布的稳定版本之前，所有的 bug 修复必须满足 [一套重要的标准][8] — 标准的其中之一是，它们 “必须已经存在于 Linus 的树中”。这是一个 [独立的 Git 仓库][9]，维护它的用途是回迁 bug 修复，而它也被称为“稳定”树 — 因为它用于跟踪以前发布的稳定内核。这个树由 Greg Kroah-Hartman 策划和维护。

### 最新的稳定内核

因此，无论在什么时候，为了查看最新的稳定内核而访问 kernel.org 网站时，你应该去使用那个在大黄色按钮所说的“最新的稳定内核”。

![sWnmAYf0BgxjGdAHshK61CE9GdQQCPBkmSF9MG8s](https://lh6.googleusercontent.com/sWnmAYf0BgxjGdAHshK61CE9GdQQCPBkmSF9MG8sYqZsmL6e0h8AiyJwqtWYC-MoxWpRWHpdIEpKji0hJ5xxeYshK9QkbTfubFb2TFaMeFNmtJ5ypQNt8lAHC2zniEEe8O4v7MZh)

但是，你可能会惊奇地发现 --  4.15 和 4.14.16 都是稳定版本，那么到底哪一个更“稳定”呢？有些人不愿意使用 ".0" 的内核发行版，因为他们认为这个版本并不足够“稳定”，直到最新的是 ".1" 的为止。很难证明或者反驳这种观点的对与错，并且这两种观点都有赞成或者反对的理由，因此，具体选择哪一个取决于你的喜好。

一方面，任何一个进入到稳定树的发行版都必须首先被接受进入主线内核版本中，并且随后会被回迁到已发行版本中。这意味着内核的主线版本相比稳定树中的发行版本来说，总包含有最新的 bug 修复，因此，如果你想使用的发行版包含的“**已知 bug**”最少，那么使用 “.0” 的主线发行版是最佳选择。

另一方面，主线版本增加了所有很酷的新特性 — 而新特性也给它们带来了**数量未知的“新 bug”**，而这些“新 bug”在老的稳定版中是**不会存在**的。而新的、未知的 bug 是否比旧的、已知的但尚未修复的 bug 更加令人担心呢？ -- 这取决于你的选择。不过需要说明的一点是，许多 bug 修复仅对内核的主线版本进行了彻底的测试。当补丁回迁到旧内核时，它们**可能**会工作的很好，但是它们**很少**做与旧内核的集成测试工作。通常都假定，“以前的稳定版本”足够接近当前的确信可用于生产系统的主线版本。而实际上也确实是这样做的，当然，这也更加说明了为什么选择”哪个内核版本更稳定“是件**非常困难**的事情了。

因此，从根本上说，我们并没有定量的或者定性的手段去明确的告诉你哪个内核版本更加稳定 -- 4.15 还是 4.14.16？我们能够做到的只是告诉你，它们具有”**不同的**稳定性“，（这个答案可能没有帮到你，但是，至少你明白了这些版本的差别是什么？）。

 _学习更多的 Linux 的知识，可以通过来自 Linux 基金会和 edX 的免费课程 ["认识 Linux" ][3]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/which-linux-kernel-version-stable

作者：[KONSTANTIN RYABITSEV ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/apple1jpg
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[4]:https://www.linux.com/blog/intro-to-linux/2018/1/linux-kernel-415-unusual-release-cycle
[5]:https://www.kernel.org/
[6]:https://git.kernel.org/pub/scm/linux/kernel/git/
[7]:https://git.kernel.org/torvalds/c/v4.15
[8]:https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
[9]:https://git.kernel.org/stable/linux-stable/c/v4.14.16
