[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12994-1.html)
[#]: subject: (Getting started with Git: Terminology 101)
[#]: via: (https://opensource.com/article/19/2/git-terminology)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Git 入门：术语基础
======

> 想学习 Git？看看这个最重要的术语和命令的快速总结。

![](https://img.linux.net.cn/data/attachment/album/202101/08/171156gu9l8dvulxmxom6d.jpg)

如今，对于任何希望跟踪他们的变化的人来说，版本控制是一个重要的工具。它对程序员、系统管理员和<ruby>网站可靠性工程师<rt>site reliability engineers</rt></ruby>（SRE）都特别有用。确保可以从错误中恢复到已知的良好状态是一个巨大的胜利，比以前给复制的文件添加 `.old` 后缀的策略更友好。

但学习 Git 这件事往往被告诉大家“投身开源”的好心同行们过度简化了。在你还不明白之前，就有人要你给一个从<ruby>上游<rt>upstream</rt></ruby> <ruby>变基<rt>rebase</rt></ruby>的<ruby>拉取请求<rt>pull request</rt></ruby>（PR）或<ruby>合并请求<rt>merge request</rt></ruby>（MR），然后他们才能从你的<ruby>远程版本库<rt>remote</rt></ruby>合并 —— 而且一定会删除<ruby>合并提交<rt>merge commits</rt></ruby>。无论你想给开源项目做出什么好的贡献，当你看到这些你不认识的单词时，都会觉得难以融入。

![Git 速查表封面图][2]

- [下载][3] 我们的 Git 速查表。

如果你有一两个月的时间和足够的好奇心，[Git SCM][4] 是你需要学习所有术语的权威来源。但如果你正在寻找来自实践的总结，请继续阅读。

### 提交就是提醒

对我来说，Git 最难理解的部分是 Git 最简单的概念：一个<ruby>提交<rt>commit</rt></ruby>就是一个内容的集合，包括一个关于描述的信息，以及之前的提交。没有固有的代码发布策略，甚至没有内置的明确建议。这个内容甚至不一定是代码 —— 可以是*任何*你想添加到版本库的东西。<ruby>提交消息<rt>commit message</rt></ruby>会对这些内容进行注释。

我喜欢把提交信息看作是给未来的自己的礼物：它可能会提到你编辑的文件，但更重要的是它提醒你修改这些文件的意图。添加更多关于你为什么编辑这些内容的信息，可以帮助任何使用你的版本库的人，即使那个人是你。

### origin/master 在哪里？

要知道自己在 Git 项目中的位置，首先把它想成一棵树。所有 Git 项目都有一个根目录，类似于文件系统的根目录。所有的提交都是这个根目录下的分支。这样一来，分支只是一个提交的指针。按照惯例，`master` 是根目录下默认的分支名称。（LCTT 译注：世界变得快，原文发表于 2019 年，而现在有些地方开始用 `main` 替代这个名字。）

由于 Git 是一个分布式的版本控制系统，同一个代码库分布在多个地方，所以人们经常用<ruby>版本库<rt>repository</rt></ruby>这个词来表示同一个项目的所有副本。（LCTT 译注：“repository” 英文原意是仓库、存储库，在计算机环境中，常用于版本控制、软件分发等方面，有时候会统一译作“仓库”、“存储库”。但我们认为，应该根据不同语境采用更有指向性的译法。在 Git 等版本控制语境中，采用“版本库”；在软件分发方面，采用“软件库”；其它泛指或不确定的语境中，可采用“仓库”、“存储库”译法。）有<ruby>本地版本库<rt>local repository</rt></ruby>，这是你编辑代码的地方（稍后会有更多的介绍），还有<ruby>远程版本库<rt>remote repository</rt></ruby>，这是你完成后想把代码发送到的地方。远程版本库可以在任何地方，甚至在你的本地版本库所在的同一台计算机上，但它们通常托管在 GitLab 或 GitHub 等版本库服务上。

### 我在哪里？

虽然不是官方的卖点，但迷路也是 Git 仓库的“乐趣”之一。你可以通过这套可靠的命令来找到自己的方向：

  * `git branch` —— 找到你所在的分支。
  * `git log` —— 查看你正在进行的提交。
  * `git status` —— 查看自上次提交以来你所做的编辑。
  * `git remote` —— 查看你正在跟踪的远程仓库。

用这些命令来定位自己的方向，当你被卡住的时候，会让你有一种方向感。

### 我是否已将我的提交暂存或缓存起来？

你电脑上的代码俗称为你的<ruby>工作空间<rt>workspace</rt></ruby>。但不是很明显的是，当你在 Git 仓库中时，你还有两个（是的，两个！）其他位置：<ruby>索引<rt>index</rt></ruby>和<ruby>暂存<rt>stash</rt></ruby>。当你写了一些内容，然后**添加**时，你是把它添加到索引中，也就是准备提交的缓存内容。有的时候，你的索引中的文件还没有准备好提交，但你想查看另一个分支。这时，暂存就派上用场了。你可以使用 `git stash` 将索引了但尚未提交的文件存储到暂存区中。当你准备好取回文件时，运行 `git stash pop` 将更改带回索引中。

下面是一些你需要使用暂存区和缓存区的命令：

  * `git diff ...origin/master` —— 显示最近的本地提交和远程的 `origin` 版本库的 `master` 分支之间的差异。
  * `git diff --cached` —— 显示最近的本地提交与添加到本地索引的内容之间的任何差异。
  * `git stash` —— 将索引的（已添加但未提交的）文件放在暂存区堆栈中。
  * `git stash list` —— 显示暂存区堆栈中的变化。
  * `git stash pop` —— 将最近的变化从暂存库中删除。

### 无头骑士

Git 里面有各种比喻。当我想到 `HEAD` 是哪里的时候，我就会想到火车线路。如果你最终处于<ruby>脱离的 HEAD<rt>detached HEAD</rt></ruby>模式，就意味着你已经脱离了这个隐喻的轨道。

`HEAD` 是指向当前签出分支中最近一次提交的指针。默认的“<ryby>签出<rt>checkout</rt></ruby>”是指当你创建一个 Git 仓库并进入到 `master` 分支的时候。每次创建或修改到另一个分支时，你都会切换到该分支行。如果你在当前分支的某处进行 `git checkout <commit>`，`HEAD` 就会移动到该提交。如果没有提交历史记录将你的当前提交连接到已签出的提交，那么你将处于脱离的 `HEAD` 状态。如果你找不到 `HEAD` 的位置，你可以随时用 `git reset --hard origin/master` 来删除修改，回到已知状态。*警告：这将删除你上次推送到 `master` 后的任何改动。*

### 你是上游还是下游？

你的项目的本地副本被认为是你的本地版本库，它可能有也可能没有远程版本库 —— 远程版本库的副本是用于协作或保存的。也可能还有一个<ruby>上游<rt>upstream</rt></ruby>版本库，在那里，项目的第三个副本由不同的贡献者托管和维护。

例如，假设我想为 Kubernetes 做贡献。我会首先将 `kubernetes/kubernetes` 项目<ruby>复刻<rt>fork</rt></ruby>到我的账户下 `mbbroberg/kubernetes`。然后我会将我的项目克隆到我的本地工作区。在这种情况下，我的本地克隆是我的本地仓库，`mbbroberg/kubernetes` 是我的远程仓库，`kubernetes/kubernetes` 是上游。

### 合并的隐喻

当你深入 Git 分支时，根系统的视觉效果就会和火车轨道的形象合二为一。分支通常被用作开发一个新功能的方式，最终你想把它<ruby>合并<rt>merge</rt></ruby>到主分支中。当这样做时，Git 会按顺序保留共同的提交历史，然后将你的分支的新提交追加到历史中。这个过程有一大堆的细节：是否<ruby>变基<rt>rebase</rt></ruby>，是否添加一个<ruby>合并提交<rt>merge commit</rt></ruby>，[Brent Laster][5] 在《[如何在 Git 中重置、恢复和返回之前的状态][6]》中会有更详细的探讨。

### 我想现在就去 Git

要掌握 Git 命令的世界，有大量的术语和需要探索的地方。我希望这篇关于日常使用术语的第一人称探索能帮助你适应这一切。如果你觉得自己被卡住了或者遇到了挫折，欢迎在 Twitter [@mbbroberg][7] 上联系我。

#### 回顾

  * <ruby>提交<rt>Commit</rt></ruby> —— 将当前索引的内容保存在一个新的提交中，并附上用户描述更改的日志信息。
  * <ruby>分支<rt>Branch</rt></ruby> —— 指向一个提交的指针。
  * `master` —— 第一个分支的默认名称。
  * `HEAD` —— 指向当前分支上最近一次提交的指针。
  * <ruby>合并<rt>Merge</rt></ruby> —— 合并两个或多个提交的历史。
  * <ruby>工作空间<rt>Workspace</rt></ruby> —— Git 仓库本地副本的通俗名称。
  * <ruby>工作树<rt>Working tree</rt></ruby> —— 工作区中的当前分支；任何时候你都可以在 `git status` 的输出中看到这个。
  * <ruby>缓存<rt>Cache</rt></ruby> —— 用于临时存储未提交的变更的空间。
  * <ruby>索引<rt>Index</rt></ruby> —— 变更提交前存储其变化的缓存。
  * 跟踪和未跟踪的文件 —— 没有被索引缓存的文件或尚未加入其中的文件。
  * <ruby>暂存<rt>Stash</rt></ruby> —— 另一个缓存，作为一个堆栈，在这里可以存储更改而不需要提交它们。
  * `origin` —— 远程版本库的默认名称。
  * <ruby>本地仓库<rt>Local repository</rt></ruby> —— 也就是你在工作站上保存 Git 仓库副本的地方。
  * <ruby>远程存储库<rt>Remote repository</rt></ruby> —— Git 存储库的第二副本，你可以在这里推送变更以便协作或备份。
  * <ruby>上游存储库<rt>Upstream repository</rt></ruby> —— 你跟踪的远程存储库的通俗说法。
  * <ruby>拉取请求<rt>Pull request</rt></ruby> —— 这是 GitHub 的专用术语，用于让其他人知道你推送到仓库分支的变化。
  * <ruby>合并请求<rt>Merge request</rt></ruby> —— 这是 GitLab 的专用术语，用于让其他人知道你推送到仓库分支的变化。
  * `origin/master` —— 远程版本库及其主要分支的默认名称。

后记：双关语是 Git 最好的部分之一，愿你喜欢。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/git-terminology

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://opensource.com/sites/default/files/uploads/git_cheat_sheet_cover.jpg (Git Cheat Sheet cover image)
[3]: https://opensource.com/downloads/cheat-sheet-git
[4]: https://git-scm.com/about
[5]: https://opensource.com/users/bclaster
[6]: https://opensource.com/article/18/6/git-reset-revert-rebase-commands
[7]: https://twitter.com/mbbroberg
