[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12981-1.html"
[#]: subject: "10 things to love about Git"
[#]: via: "https://opensource.com/article/20/12/git"
[#]: author: "Joshua Allen Holm https://opensource.com/users/holmja"

让你爱上 Git 的 10 篇文章
======

> 你对 Git 了解得越多，使用 Git 就会越容易。一起来回顾下年度最佳 Git 文章。

![](https://img.linux.net.cn/data/attachment/album/202101/04/120824ue7jvn9nj4n2s4vh.jpg)

Git 是开源开发者工具箱中最基本的工具。这个强大的版本控制系统有很多复杂的功能。使用 Git 不需要了解它所有的功能，但是对 Git 了解得越多，使用 Git 就会越容易。

下面每篇文章都提供了一些奇技淫巧来提升和增强你的 Git 技能。

### 怎么解决 git 合并时的冲突

Brian Breniser 的这篇教程从 `git merge` 的定义以及解释什么是冲突开始。然后他详细解释了在合并时如果有冲突[如何解决冲突][2]。Breniser 还提了一些能学习更多关于解决冲突和其他 Git 功能的建议。

### 4 个不可或缺的 Git 脚本

Vince Power 分享了他[最重要的 Git 脚本][3]。这些脚本可以从 Git Extras 包中获得，该包提供了 60 多个 Git 增强脚本。Power 最爱的脚本有：在无需打开文本编辑器的情况下编辑 `.git-ignore` 的 `git-ignore` ；用于提供 Git 仓库的摘要的 `git-info`；用来处理 GitLab 的合并请求（MR）和 GitHub 的拉取请求（PR）的 `git-pr`；把 Git 的提交（`commit`）、标签（`tag`）和推送（`push`）合为一体的 `git-release`。

### 完美生活：git rebase -i

在 Dave Neary 的这篇文章中可以学习[使用 git rebase -i 来修改你的 Git 提交历史][4]。Neary 从解释 Git 是如何把提交历史记录到仓库中的以及 `git commit` 和 `git rebase` 的区别。之后，他又解释了如何使用 `git rebase -i` 让 Git 仓库的提交历史变得简洁。这个命令能让你把“修复书写错误”的提交合进其它提交里，把几个相似的小提交合并成一个大的提交。

### Git Cola 让使用 Git 变得简单

Seth Kenlon 演示了[如何使用 Git Cola][5]。Git 是个命令行工具，这对于有些人来说是有学习门槛的。Git Cola 提供了一个图形界面，因此不习惯用命令行的用户也可以使用 Git。在此文中，Kenlon 展示了如何安装 Git Cola，并使用 Git Cola 的图形用户界面完成了很多 Git 提交任务。

### 6 个在团队中使用 Git 的最佳实践

从设计上讲，Git 是个协同工具，但是关于如何协同的很多细节是由团队自行决定的。Ravi Chandran 提了一些建议，团队应该采用这些建议[更高效地使用 Git][6]。Chandran 在文中列出的 6 个最佳实践是：“使约定正式化”，“正确地合并修改”，“经常变基你的功能分支”，“在合并之前把压扁你的提交”，“使用标签”，“让软件的可执行程序打印标签”。

### 改变我使用 Git 工作方式的七个技巧

Rajeev Bera 分享了 [7 个 Git 技巧][7]，这些技巧能提升 Git 的用户体验。文章探讨了 Git 的自动更正、提交计数、仓库优化、备份未追踪的文件、了解 `.git` 目录、在另一个分支查看文件以及在 Git 下搜索。

### 使用 tmux 和 Git 定制化我的 Linux 终端

Moshe Zadka 展示了他是如何[使用 tmux 和 Git][8]定制化他的 Linux 终端的。Zadka 的文章是个人工作流的优秀探索。他使用 GNOME 终端，用 tmux 和一些能让他快速查看 Git 仓库状态的功能来增强终端。他只需要用一个字母就可以提交文件或把提交推送到远程仓库。

### 使用 Lazygit 让复杂的 Git 任务简单化

Jesse Duffield 解释了如何使用[Lazygit，一个能让使用 Git 变得简单的终端界面][9]。Lazygit 的开发者 Duffield 详细阐述了如何使用这个界面来暂存文件、以交互方式变基、进行筛选、搜索提交以及创建一个 PR。

### 使用子模块和子树来管理 Git 项目

子模块和子树是两种在 Git 仓库中引入嵌套的子项目的方式。在[使用子模块和子树来管理 Git 项目][10]中，Manaswini Das 解释了两个选项的工作原理和区别。

### 不喜欢 diff？那么试试 Meld

Ben Nuttall 展示了如何[使用 Meld 代替 diff][11]来进行对比和合并修改。Meld 是图形化的 `diff`，输出更容易理解。Nuttall 演示了使用 `diff` 和 Meld 进行对比的区别。他还解释了 Meld 是如何识别 Git 项目的，这意味着在 Git 中一个文件被提交之后，可以用 Meld 来搜索修改。

你想学习关于 Git 的什么内容？请在评论去分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/git

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF "Woman using laptop concentrating"
[2]: https://opensource.com/article/20/4/git-merge-conflict
[3]: https://linux.cn/article-12180-1.html
[4]: https://linux.cn/article-12231-1.html
[5]: https://opensource.com/article/20/3/git-cola
[6]: https://linux.cn/article-12621-1.html
[7]: https://linux.cn/article-12894-1.html
[8]: https://linux.cn/article-12450-1.html
[9]: https://opensource.com/article/20/3/lazygit
[10]: https://linux.cn/article-12244-1.html
[11]: https://linux.cn/article-12067-1.html
[12]: https://opensource.com/how-submit-article
