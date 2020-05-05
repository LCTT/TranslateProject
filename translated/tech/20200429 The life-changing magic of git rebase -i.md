[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The life-changing magic of git rebase -i)
[#]: via: (https://opensource.com/article/20/4/git-rebase-i)
[#]: author: (Dave Neary https://opensource.com/users/dneary)

完美生活：git rebase -i
======

> 让大家觉得你一次就能写出完美的代码，并让你的补丁更容易审核和合并。

![Hands programming][1]

软件开发是混乱的。有很多错误的转折、有需要修复的错别字、有需要修正的错误、有需要稍后纠正临时和粗陋的代码，还有在开发过程中以后发现的错位问题。有了版本控制，在创建“完美”的最终产品（即准备提交给上游的补丁）的过程中，你会有一个记录着每一个错误的转折和修正的原始记录。就像电影中的片段一样，它们有些尴尬，有时还很有趣。就像电影中的花絮一样，它们会让人有点尴尬，有时也会让人觉得好笑。

如果你能使用版本控制来定期保存你的工作线索，然后当你准备提交审核的东西时，可以隐藏所有这些私人草稿工作，只需提交一份单一的、完美的补丁就可以了，那不是很好吗？`git rebase -i`，是重写历史记录的完美方法，可以让大家觉得你一次就写出了完美的代码。
 
### git rebase 的作用是什么？

如果你不熟悉 Git 的复杂性，这里简单介绍一下。在幕后，Git 将项目的不同版本与唯一标识符关联起来，这个标识符由父节点的唯一标识符的哈希以及新版本与其父节点的差异组成。这样就形成了一棵修订树，每个检出项目的人都会得到自己的副本。不同的人可以把项目往不同的方向发展，每个人的出发点都可能是不同的分支点。

![Master branch vs. private branch][2]

*左边是 `origin` 版本库中的主分支，右边是你个人副本中的私有分支。*

有两种方法可以将你的工作与原始版本库中的主分支整合起来：一种是使用 合并：`git merge`，另一种是使用变基：`git rebase`。它们的工作方式非常不同。

当你使用 `git merge` 时，会在主分支上创建一个新的提交，其中包括所有来自 `origin` 的修改和所有本地的修改。如果有任何冲突（例如，如果别人修改了你也在修改的文件），则将这些冲突标记出来，并且你有机会在将该“合并提交”提交到本地版本库之前解决这些冲突。当你将更改推送回父版本库时，所有的本地工作都会以分支的形式出现在 Git 仓库的其他用户面前。

但是 `git rebase` 的工作方式不同。它回滚你的提交，并从主分支的顶端再次重放这些提交。这导致了两个主要的变化。首先，由于你的提交现在从一个不同的父节点分支出来，它们的哈希值会被重新计算，并且任何克隆了你的仓库的人都可能会有一个残破的仓库副本。第二，你没有一个合并提交，所以在将更改重放到主分支上时会识别出任何合并冲突，所以任何合并冲突都会被识别出来，因此，你需要在进行<ruby>变基<rt>rebase</rt></ruby>之前修复它们。当你现在推送你的修改时，你的工作不会出现在分支上，并且看起来像是你把所有的修改都写到了主分支的最新的提交上。

![Merge commits preserve history, and rebase rewrites history.][3]

*合并提交（左）保留了历史，而变基（右）重写历史。*

然而，这两种方式都有一个坏处：在你准备好分享代码之前，每个人都可以看到你在本地处理问题时的所有涂鸦和编辑。这就是 `git rebase` 的 `--interactive`（或简写 `-i`）标志的作用。

### 介绍 git rebase -i

`git rebase` 的最大优点是它重写了历史。但是，为什么仅止于假装你从后面的点分支出来呢？有一种更进一步方法可以重写你是如何准备就绪这些代码的：`git rebase -i`，交互式的 `git rebase`。

这个功能就是 Git 中的 "神奇的时间机器” 功能。这个标志允许你在做变基时对修订历史记录进行复杂的修改。你可以隐藏你的错误! 将许多小的修改合并到一个原始的功能补丁中! 重新排序修改历史记录中的内容

![output of git rebase -i][4]

当你运行 `git rebase -i` 时，你会得到一个编辑器会话，其中列出了所有正在被变基的提交，并有一些选项可以对它们做什么。默认的选择是 `pick`。

  * `Pick`：会在你的历史记录中保留该提交。
  * `Reword`：允许你修改提交信息，可能是修复一个错别字或添加额外的注释。
  * `Edit`：允许你在重放分支的过程中对提交进行修改。
  * `Squash`：可以将多个提交合并为一个。
  * 你可以通过移动文件中的提交来重新排序。

当你完成后，只需保存最终结果，变基就会执行。在每个阶段，当你选择了修改提交（无论是用 `reword`、`edit`、`squash` 还是有冲突时），变基会停止，并允许你在继续提交之前进行适当的修改。

上面这个例子的结果是 “One-liner bug fix” 和 “Integate new header everywhere” 被合并到一个提交中，而 “New header for docs website” 和 “D'oh - typo. Fixed” 合并到另一个提交中。就像变魔术一样，其他提交的工作还在你的分支中，但相关的提交已经从你的历史记录中消失了！这样一来，你就可以很容易地提交干净的提交。

这使得使用 `git send-email` 或者用你新整理好的补丁集在父版本库中创建一个拉取请求来提交一个干净的补丁给上游项目变得很容易。这有很多好处，包括让你的代码更容易审核，更容易接受，也更容易合并。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/git-rebase-i

作者：[Dave Neary][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dneary
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/sites/default/files/uploads/master-private-branches.png (Master branch vs. private branch)
[3]: https://opensource.com/sites/default/files/uploads/merge-commit-vs-rebase.png (Merge commits preserve history, and rebase rewrites history.)
[4]: https://opensource.com/sites/default/files/uploads/git-rebase-i.png (output of git rebase -i)
