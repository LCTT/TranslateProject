[#]: subject: (5 commands to level-up your Git game)
[#]: via: (https://opensource.com/article/21/4/git-commands)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 个命令来升级你的 Git 操作
======
将这些命令加入到你的工作流中，使 Git 发挥更大的作用。
![Business woman on laptop sitting in front of window][1]

如果你经常使用 Git，你可能会知道它非常有名。它可能是最受欢迎的版本控制方案，被一些 [最大的软件项目][2] 用来 [跟踪文件变更][3]。Git 提供了 [鲁棒的接口][4] 来审阅代码、把实验性的变更合并到已经存在的文档中。得益于 [Git hooks][5]，它以灵活性而闻名。同时，也因为它的强大，它给人们留下了一个「复杂」的印象。

Git 有诸多特性，你不必全部使用，但是如果你正在深入研究 Git 的 <ruby>子命令<rt>subcommands</rt></ruby>，我这里倒是有几个，或许你会觉得有用。

### 1\. 找到变更

如果你已经熟悉 Git 的基本指令（`fetch`、`add`、`commit`、`push`、`log` 等等），但是希望学习更多，那么从 Git 的检索子命令开始是一个简单安全的选择。检索你的 Git 仓库（你的 _工作树_）并不会做出任何更改，它只是一个报告机制。你不会像使用 git checkout 一样承担数据完整性的风险，你只是在向 Git 请求仓库的当前状态和历史记录而已。

[git whatchanged][6] 命令（几乎本身就是一个助记符）可以查看哪些文件在某个 commit 中有变更、分别做了什么变更。它是一个简单的、用户友好的命令，因为它把 `show`、`diff-tree` 和 `log` 这三个命令的最佳功能整合到了一个好记的命令中。

### 2\. 使用 git stash 管理变更

你越多地使用 Git，你就会使用 Git 越多。这就是说，一旦你习惯了 Git 的强大，你就会更频繁地使用它。有时，你正在处理一大堆文件，忽然意识到了有更紧急的任务要做。这时，在 [git stash][7] 的帮助下，你就可以把所有正在进行的工作收集起来，然后安全地暂存它们。当你的工作空间变得整洁有序，你就可以把注意力放到别的任务上，晚些时候再把暂存的文件重新加载到工作树里，继续之前的工作。

### 3\. 使用 git worktree 来得到链接的副本

当 `git stash` 不够用的时候，Git 还提供了强大的 [git worktree][8] 命令。有了它，你可以新建一个 _链接的_ 仓库副本，组成一个新分支，把 `HEAD` 设置到任意一个 commit 上，然后基于这个分支开始你的新工作。在这个链接的副本里，你可以进行和主副本完全不同的任务。这是一个避免意外的变更影响当前工作的好办法。当你完成了你的新工作，你可以把新分支推送到远程仓库；也可以把当前的变更归档，晚些时候再处理；还可以从别的工作树中获取它们的变更。无论选择哪一种，你的工作空间之间都会保持相互隔离，任一空间中的变更都不会影响其他空间中的变更，直到你准备好了要合并它们。

### 4\. 使用 cherry-pick 来选择合并

这可能听起来很反直觉，但是，你的 Git 水平越高，你可能遇到的合并冲突就会越多。这是因为合并冲突并不是错误的标志，而是活跃的标志。在学习 Git 中，适应合并时的冲突，并学会如何解决它们是非常重要的。通常的方式或许够用，但是有时候你会需要更加灵活地进行合并，这时候就该 [git cherry-pick][9] 出场了。Cherry-pick 允许你选择部分合并 commits，这样一来你就不需要因为一些细微的不协调而拒绝整个合并请求了。

### 5\. 使用 Git 来管理 $HOME

使用 Git 来管理你的主目录从来没有这么简单过，这都要归功于 Git 可以自由选择管理对象的能力，这是一个在多台计算机之间保持同步的现实可行的选项。但是，想要让它工作顺利，你必须非常明智且谨慎才行。如果你想要了解更多，点击阅读我写的关于 [使用 Git 来管理 $HOME][10] 的小贴士。

### 更好地使用 Git

Git 是一个强大的版本控制系统，你使用得越熟练，就可以越轻松地借助它来完成复杂的任务。今天就尝试一些新的 Git 命令吧，欢迎在评论区分享你最喜欢的 Git 命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-commands

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/19/10/how-gnome-uses-git
[3]: https://opensource.com/article/18/2/how-clone-modify-add-delete-git-files
[4]: https://opensource.com/article/18/5/git-branching
[5]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[6]: https://opensource.com/article/21/3/git-whatchanged
[7]: https://opensource.com/article/21/3/git-stash
[8]: https://opensource.com/article/21/3/git-worktree
[9]: https://opensource.com/article/21/3/reasons-use-cherry-picking
[10]: https://opensource.com/article/21/3/git-your-home
