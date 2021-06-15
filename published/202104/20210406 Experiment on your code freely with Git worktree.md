[#]: subject: (Experiment on your code freely with Git worktree)
[#]: via: (https://opensource.com/article/21/4/git-worktree)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13301-1.html)

使用 Git 工作树对你的代码进行自由实验
======

> 获得自由尝试的权利，同时在你的实验出错时可以安全地拥有一个新的、链接的克隆存储库。

![](https://img.linux.net.cn/data/attachment/album/202104/16/085512x3auafu5uaymk52u.jpg)

Git 的设计部分是为了进行实验。如果你知道你的工作会被安全地跟踪，并且在出现严重错误时有安全状态存在，你就不会害怕尝试新的想法。不过，创新的部分代价是，你很可能会在这个过程中弄得一团糟。文件会被重新命名、移动、删除、更改、切割成碎片；新的文件被引入；你不打算跟踪的临时文件会在你的工作目录中占据一席之地等等。

简而言之，你的工作空间变成了纸牌屋，在“快好了！”和“哦，不，我做了什么？”之间岌岌可危地平衡着。那么，当你需要把仓库恢复到下午的一个已知状态，以便完成一些真正的工作时，该怎么办？我立刻想到了 `git branch` 和 [git stash][2] 这两个经典命令，但这两个命令都不是用来处理未被跟踪的文件的，而且文件路径的改变和其他重大的转变也会让人困惑，它们只能把工作暂存（`stash`）起来以备后用。解决这个需求的答案是 Git 工作树。

### 什么是 Git 工作树

Git <ruby>工作树<rt>worktree</rt></ruby>是 Git 仓库的一个链接副本，允许你同时签出多个分支。工作树与主工作副本的路径是分开的，它可以处于不同的状态和不同的分支上。在 Git 中新建工作树的好处是，你可以在不干扰当前工作环境的情况下，做出与当前任务无关的修改、提交修改，然后在以后合并。

直接从 `git-worktree` 手册中找到了一个典型的例子：当你正在为一个项目做一个令人兴奋的新功能时，你的项目经理告诉你有一个紧急的修复工作。问题是你的工作仓库（你的“工作树”）处于混乱状态，因为你正在开发一个重要的新功能。你不想在当前的冲刺中“偷偷地”进行修复，而且你也不愿意把变更暂存起来，为修复创建一个新的分支。相反，你决定创建一个新的工作树，这样你就可以在那里进行修复：

```
$ git branch | tee
* dev
trunk
$ git worktree add -b hotfix ~/code/hotfix trunk
Preparing ../hotfix (identifier hotfix)
HEAD is now at 62a2daf commit
```

在你的 `code` 目录中，你现在有一个新的目录叫做 `hotfix`，它是一个与你的主项目仓库相连的 Git 工作树，它的 `HEAD` 停在叫做 `trunk` 的分支上。现在你可以把这个工作树当作你的主工作区来对待。你可以把目录切换到它里面，进行紧急修复、提交、并最终删除这个工作树：

```
$ cd ~/code/hotfix
$ sed -i 's/teh/the/' hello.txt
$ git commit --all --message 'urgent hot fix'
```

一旦你完成了你的紧急工作，你就可以回到你之前的任务。你可以控制你的热修复何时被集成到主项目中。例如，你可以直接将变更从其工作树推送到项目的远程存储库中：

```
$ git push origin HEAD
$ cd ~/code/myproject
```

或者你可以将工作树存档为 TAR 或 ZIP 文件：

```
$ cd ~/code/myproject
$ git archive --format tar --output hotfix.tar master
```

或者你可以从单独的工作树中获取本地的变化：

```
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
/home/seth/code/hotfix     09e585d [master]
```

从那里，你可以使用任何最适合你和你的团队的策略合并你的变化。

### 列出活动工作树

你可以使用 `git worktree list` 命令获得工作树的列表，并查看每个工作树签出的分支：

```
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
/home/seth/code/hotfix     09e585d [master]
```

你可以在任何一个工作树中使用这个功能。工作树始终是连接的（除非你手动移动它们，破坏 Git 定位工作树的能力，从而切断连接）。

### 移动工作树

Git 会跟踪项目 `.git` 目录下工作树的位置和状态：

```
$ cat ~/code/myproject/.git/worktrees/hotfix/gitdir
/home/seth/code/hotfix/.git
```

如果你需要重定位一个工作树，必须使用 `git worktree move`；否则，当 Git 试图更新工作树的状态时，就会失败：

```
$ mkdir ~/Temp
$ git worktree move hotfix ~/Temp
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
/home/seth/Temp/hotfix     09e585d [master]
```

### 移除工作树

当你完成你的工作时，你可以用 `remove` 子命令删除它：

```
$ git worktree remove hotfix
$ git worktree list
/home/seth/code/myproject  15fca84 [dev]
```

为了确保你的 `.git` 目录是干净的，在删除工作树后使用 `prune` 子命令：

```
$ git worktree remove prune
```

### 何时使用工作树

与许多选项一样，无论是标签还是书签还是自动备份，都要靠你来跟踪你产生的数据，否则可能会变得不堪重负。不要经常使用工作树，要不你最终会有 20 份存储库的副本，每份副本的状态都略有不同。我发现最好是创建一个工作树，做需要它的任务，提交工作，然后删除树。保持简单和专注。

重要的是，工作树为你管理 Git 存储库的方式提供了更好的灵活性。在需要的时候使用它们，再也不用为了检查另一个分支上的内容而争先恐后地保存工作状态了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-worktree

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://linux.cn/article-13293-1.html
