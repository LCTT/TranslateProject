[#]: subject: "10 Git tutorials to level up your open source skills in 2022"
[#]: via: "https://opensource.com/article/22/1/git-tutorials"
[#]: author: "Manaswini Das https://opensource.com/users/manaswinidas"
[#]: collector: "lujun9972"
[#]: translator: "stevenzdg988"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14194-1.html"

2021 总结：提升 Git 技能的 10 篇指南
======

> 这些文章包含了黑科技、鲜为人知的事实，以及在使用 Git 时可以派上用场的技巧和窍门。

![](https://img.linux.net.cn/data/attachment/album/202201/19/171344h03bqej63r36vyvl.jpg)

Git 是代码协作开发工作流程中不可或缺的一部分。无论你是初学者还是专家，第一件事就是在使用开源代码时需要学习这个功能强大的版本控制系统。对于 Git，不需要知道所有事情，但是了解一些特殊的黑科技可以让你在 GitLab 等平台上更轻松地分享代码，因此你可以与不同地方的开发人员协作。如果有什么没把握的地方，`git --help` 可以帮助你。

我每天都为了解 Git 所提供的控制能力而感到惊讶。没有哪种情况是你无法恢复到早期版本的，无论你所处的情况是多么不可能或棘手。

在 2021 年我们发布了大量 Git 的文章；我只汇总了其中前 10 篇，这些文章包含了各种黑科技、鲜为人知的事实，以及在使用 Git 时可以派上用场的技巧和窍门。

### 使用 git stash 命令的实用指南

[Ramakrishna Pattnaik][2] 解释了 [git stash 命令][3] 的功能。这篇文章重点介绍 `git stash` 如何帮助你列出、检查、保存和恢复更改，以确保切换分支时的无忧体验。它还可以帮助你跟踪在本地无需提交的更改，而同时保持干净的工作目录。

### 5 个让你的 Git 技能更上一层楼的 Git 命令

[Seth Kenlon][4] 详细介绍了 [五个鲜为人知的 Git 命令][5]，它们可以让你的生活更轻松。开发人员可以使用 `git whatchanged`、`git stash`、`git worktree` 和 `git cherry-pick` 等命令来节省时间。

### Git cherry-pick 简介

[Rajeev Bera][6] 教程将引导你了解 [git cherry-pick 命令][7] 是什么，为什么和如何使用它，并列出 `git cherry-pick` 可以帮助你避免棘手的情况所有用例。

### 3 个使用 git cherry-pick 命令的原因

我分享了 [利用 git cherry-pick][8] 如何帮助你避免冗余，一次性处理多个提交并恢复丢失的更改。

### 使用 git worktree 自由地尝试你的代码

`git stash` 命令负责将更改保存到工作目录。Seth Kenlon 向我们介绍了 `git worktree` 和几个 [git worktree 用例][9]，它们可以帮助你将存储库恢复到已知状态。

### Git 上下文切换的 4 个技巧

[Olaf Alders][10] 的这篇文章讨论了使用 Git 时 [切换分支的四种不同方式][11] 的利弊。这些选项将帮助你简化工作流程，并保持干净的工作目录，而不会丢失你的更改。

### 查找 Git 提交中的更改

Seth Kenlon 解释了如何利用如 [git log 和 git whatchanged][12] 等简单命令来提取有关 Git 提交内容中更改的特定信息。这是一个有用的快捷方式，而且名字很容易记住。

### 管理主目录的 7 个 Git 技巧

Seth Kenlon 分享了 [使用 Git 管理和组织 $HOME 变量][13] 的注意事项，并解释了它如何让他的跨设备生活更实用。更好的是，这让他可以自由地尝试新想法，因为他知道他可以轻松地将它们回滚。

### GitOps 与 DevOps：有什么区别？

[Bryant Son][14] 向你介绍了 [GitOps][15]，他将其描述为 DevOps 的进化版本，它使用 Git 作为单一事实来源。这篇文章还列出了其它有用资源，可用于学习 DevOps 并在开源领域找到工作。

### 开始使用 Argo CD

[Ayush Sharma][16] 详细介绍了 [Argo CD][17] 的优势，这是一种基于拉取式的 GitOps 开发工具。Argo CD 通过在 Git 中管理 Kubernetes 清单并将它们同步到集群中，为你提供两全其美的体验。

你能想到其他让你的生活更轻松的 Git 技巧吗？请在评论中告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/git-tutorials

作者：[Manaswini Das][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/manaswinidas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/users/rkpattnaik780
[3]: https://opensource.com/article/21/4/git-stash
[4]: https://opensource.com/users/seth
[5]: https://opensource.com/article/21/4/git-commands
[6]: https://opensource.com/users/acompiler
[7]: https://opensource.com/article/21/4/cherry-picking-git
[8]: https://opensource.com/article/21/3/git-cherry-pick
[9]: https://opensource.com/article/21/4/git-worktree
[10]: https://opensource.com/users/oalders
[11]: https://opensource.com/article/21/4/context-switching-git
[12]: https://opensource.com/article/21/4/git-whatchanged
[13]: https://opensource.com/article/21/4/git-home
[14]: https://opensource.com/users/brson
[15]: https://opensource.com/article/21/3/gitops
[16]: https://opensource.com/users/ayushsharma
[17]: https://opensource.com/article/21/8/argo-cd
[18]: https://opensource.com/how-submit-article
