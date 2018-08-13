如何在 Git 中重置、恢复，返回到以前的状态
======

> 用简洁而优雅的 Git 命令撤销仓库中的改变。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82)

使用 Git 工作时其中一个鲜为人知（和没有意识到）的方面就是，如何轻松地返回到你以前的位置 —— 也就是说，在仓库中如何很容易地去撤销那怕是重大的变更。在本文中，我们将带你了解如何去重置、恢复和完全回到以前的状态，做到这些只需要几个简单而优雅的 Git 命令。

### 重置

我们从 Git 的 `reset` 命令开始。确实，你应该能够认为它就是一个 “回滚” —— 它将你本地环境返回到之前的提交。这里的 “本地环境” 一词，我们指的是你的本地仓库、暂存区以及工作目录。

先看一下图 1。在这里我们有一个在 Git 中表示一系列提交的示意图。在 Git 中一个分支简单来说就是一个命名的、指向一个特定的提交的可移动指针。在这里，我们的 master 分支是指向链中最新提交的一个指针。

![Local Git environment with repository, staging area, and working directory][2]

*图 1：有仓库、暂存区、和工作目录的本地环境*

如果看一下我们的 master 分支是什么，可以看一下到目前为止我们产生的提交链。

```
$ git log --oneline
b764644 File with three lines
7c709f0 File with two lines
9ef9173 File with one line
```

如果我们想回滚到前一个提交会发生什么呢？很简单 —— 我们只需要移动分支指针即可。Git 提供了为我们做这个动作的 `reset` 命令。例如，如果我们重置 master 为当前提交回退两个提交的位置，我们可以使用如下之一的方法：

```
$ git reset 9ef9173
```

（使用一个绝对的提交 SHA1 值 `9ef9173`）

或：

```
$ git reset current~2
```
（在 “current” 标签之前，使用一个相对值 -2）

图 2 展示了操作的结果。在这之后，如果我们在当前分支（master）上运行一个 `git log` 命令，我们将看到只有一个提交。

```
$ git log --oneline

9ef9173 File with one line
```

![After reset][4]

*图 2：在 `reset` 之后*

`git reset` 命令也包含使用一些选项，可以让你最终满意的提交内容去更新本地环境的其它部分。这些选项包括：`hard` 在仓库中去重置指向的提交，用提交的内容去填充工作目录，并重置暂存区；`soft` 仅重置仓库中的指针；而 `mixed`（默认值）将重置指针和暂存区。

这些选项在特定情况下非常有用，比如，`git reset --hard <commit sha1 | reference>` 这个命令将覆盖本地任何未提交的更改。实际上，它重置了（清除掉）暂存区，并用你重置的提交内容去覆盖了工作区中的内容。在你使用 `hard` 选项之前，一定要确保这是你真正地想要做的操作，因为这个命令会覆盖掉任何未提交的更改。

### 恢复

`git revert` 命令的实际结果类似于 `reset`，但它的方法不同。`reset` 命令（默认）是在链中向后移动分支的指针去“撤销”更改，`revert` 命令是在链中添加一个新的提交去“取消”更改。再次查看图 1 可以非常轻松地看到这种影响。如果我们在链中的每个提交中向文件添加一行，一种方法是使用 `reset` 使那个提交返回到仅有两行的那个版本，如：`git reset HEAD~1`。

另一个方法是添加一个新的提交去删除第三行，以使最终结束变成两行的版本 —— 实际效果也是取消了那个更改。使用一个 `git revert` 命令可以实现上述目的，比如：

```
$ git revert HEAD
```

因为它添加了一个新的提交，Git 将提示如下的提交信息：

```
Revert "File with three lines"

This reverts commit b764644bad524b804577684bf74e7bca3117f554.

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Changes to be committed:
#       modified:   file1.txt
#
```

图 3（在下面）展示了 `revert` 操作完成后的结果。

如果我们现在运行一个 `git log` 命令，我们将看到前面的提交之前的一个新提交。

```
$ git log --oneline
11b7712 Revert "File with three lines"
b764644 File with three lines
7c709f0 File with two lines
9ef9173 File with one line
```

这里是工作目录中这个文件当前的内容：

```
$ cat <filename>
Line 1
Line 2
```

![img](https://opensource.com/sites/default/files/uploads/figure3a.png)

*图 3 `revert` 操作之后*

#### 恢复或重置如何选择？

为什么要优先选择 `revert` 而不是 `reset` 操作？如果你已经将你的提交链推送到远程仓库（其它人可以已经拉取了你的代码并开始工作），一个 `revert` 操作是让他们去获得更改的非常友好的方式。这是因为 Git 工作流可以非常好地在分支的末端添加提交，但是当有人 `reset` 分支指针之后，一组提交将再也看不见了，这可能会是一个挑战。

当我们以这种方式使用 Git 工作时，我们的基本规则之一是：在你的本地仓库中使用这种方式去更改还没有推送的代码是可以的。如果提交已经推送到了远程仓库，并且可能其它人已经使用它来工作了，那么应该避免这些重写提交历史的更改。

总之，如果你想回滚、撤销或者重写其它人已经在使用的一个提交链的历史，当你的同事试图将他们的更改合并到他们拉取的原始链上时，他们可能需要做更多的工作。如果你必须对已经推送并被其他人正在使用的代码做更改，在你做更改之前必须要与他们沟通，让他们先合并他们的更改。然后在这个侵入操作没有需要合并的内容之后，他们再拉取最新的副本。

你可能注意到了，在我们做了 `reset` 操作之后，原始的提交链仍然在那个位置。我们移动了指针，然后 `reset` 代码回到前一个提交，但它并没有删除任何提交。换句话说就是，只要我们知道我们所指向的原始提交，我们能够通过简单的返回到分支的原始链的头部来“恢复”指针到前面的位置：

```
git reset <sha1 of commit>
```

当提交被替换之后，我们在 Git 中做的大量其它操作也会发生类似的事情。新提交被创建，有关的指针被移动到一个新的链，但是老的提交链仍然存在。

### 变基

现在我们来看一个分支变基。假设我们有两个分支：master 和 feature，提交链如下图 4 所示。master 的提交链是 `C4->C2->C1->C0` 和 feature 的提交链是 `C5->C3->C2->C1->C0`。

![Chain of commits for branches master and feature][6]

*图 4：master 和 feature 分支的提交链*

如果我们在分支中看它的提交记录，它们看起来应该像下面的这样。（为了易于理解，`C` 表示提交信息）

```
$ git log --oneline master
6a92e7a C4
259bf36 C2
f33ae68 C1
5043e79 C0

$ git log --oneline feature
79768b8 C5
000f9ae C3
259bf36 C2
f33ae68 C1
5043e79 C0
```

我告诉人们在 Git 中，可以将 `rebase` 认为是 “将历史合并”。从本质上来说，Git 将一个分支中的每个不同提交尝试“重放”到另一个分支中。

因此，我们使用基本的 Git 命令，可以变基一个 feature 分支进入到 master 中，并将它拼入到 `C4` 中（比如，将它插入到 feature 的链中）。操作命令如下：

```
$ git checkout feature
$ git rebase master

First, rewinding head to replay your work on top of it...
Applying: C3
Applying: C5
```

完成以后，我们的提交链将变成如下图 5 的样子。

![Chain of commits after the rebase command][8]

*图 5：`rebase` 命令完成后的提交链*

接着，我们看一下提交历史，它应该变成如下的样子。

```
$ git log --oneline master
6a92e7a C4
259bf36 C2
f33ae68 C1
5043e79 C0

$ git log --oneline feature
c4533a5 C5
64f2047 C3
6a92e7a C4
259bf36 C2
f33ae68 C1
5043e79 C0
```

注意那个 `C3'` 和 `C5'`— 在 master 分支上已处于提交链的“顶部”，由于产生了更改而创建了新提交。但是也要注意的是，rebase 后“原始的” `C3` 和 `C5` 仍然在那里 — 只是再没有一个分支指向它们而已。

如果我们做了这个变基，然后确定这不是我们想要的结果，希望去撤销它，我们可以做下面示例所做的操作：

```
$ git reset 79768b8
```

由于这个简单的变更，现在我们的分支将重新指向到做 `rebase` 操作之前一模一样的位置 —— 完全等效于撤销操作（图 6）。

![After undoing rebase][10]

*图 6：撤销 `rebase` 操作之后*

如果你想不起来之前一个操作指向的一个分支上提交了什么内容怎么办？幸运的是，Git 命令依然可以帮助你。用这种方式可以修改大多数操作的指针，Git 会记住你的原始提交。事实上，它是在 `.git` 仓库目录下，将它保存为一个特定的名为 `ORIG_HEAD ` 的文件中。在它被修改之前，那个路径是一个包含了大多数最新引用的文件。如果我们 `cat` 这个文件，我们可以看到它的内容。

```
$ cat .git/ORIG_HEAD
79768b891f47ce06f13456a7e222536ee47ad2fe
```

我们可以使用 `reset` 命令，正如前面所述，它返回指向到原始的链。然后它的历史将是如下的这样：

```
$ git log --oneline feature
79768b8 C5
000f9ae C3
259bf36 C2
f33ae68 C1
5043e79 C0
```

在 reflog 中是获取这些信息的另外一个地方。reflog 是你本地仓库中相关切换或更改的详细描述清单。你可以使用 `git reflog` 命令去查看它的内容：

```
$ git reflog
79768b8 HEAD@{0}: reset: moving to 79768b
c4533a5 HEAD@{1}: rebase finished: returning to refs/heads/feature
c4533a5 HEAD@{2}: rebase: C5
64f2047 HEAD@{3}: rebase: C3
6a92e7a HEAD@{4}: rebase: checkout master
79768b8 HEAD@{5}: checkout: moving from feature to feature
79768b8 HEAD@{6}: commit: C5
000f9ae HEAD@{7}: checkout: moving from master to feature
6a92e7a HEAD@{8}: commit: C4
259bf36 HEAD@{9}: checkout: moving from feature to master
000f9ae HEAD@{10}: commit: C3
259bf36 HEAD@{11}: checkout: moving from master to feature
259bf36 HEAD@{12}: commit: C2
f33ae68 HEAD@{13}: commit: C1
5043e79 HEAD@{14}: commit (initial): C0
```

你可以使用日志中列出的、你看到的相关命名格式，去重置任何一个东西：

```
$ git reset HEAD@{1}
```

一旦你理解了当“修改”链的操作发生后，Git 是如何跟踪原始提交链的基本原理，那么在 Git 中做一些更改将不再是那么可怕的事。这就是强大的 Git 的核心能力之一：能够很快速、很容易地尝试任何事情，并且如果不成功就撤销它们。

Brent Laster 将在 7 月 16 日至 19 日在俄勒冈州波特兰举行的第 20 届 OSCON 年度活动上，展示 [强大的 Git：Rerere, Bisect, Subtrees, Filter Branch, Worktrees, Submodules, 等等][11]。想了解在任何水平上使用 Git 的一些技巧和缘由，请查阅 Brent 的书 ——"[Professional Git][13]"，它在 Amazon 上有售。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/git-reset-revert-rebase-commands

作者：[Brent Laster][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bclaster
[1]:/file/401126
[2]:https://opensource.com/sites/default/files/uploads/gitcommands1_local-environment.png "Local Git environment with repository, staging area, and working directory"
[3]:/file/401131
[4]:https://opensource.com/sites/default/files/uploads/gitcommands2_reset.png "After reset"
[5]:/file/401141
[6]:https://opensource.com/sites/default/files/uploads/gitcommands4_commits-branches.png "Chain of commits for branches master and feature"
[7]:/file/401146
[8]:https://opensource.com/sites/default/files/uploads/gitcommands5_commits-rebase.png "Chain of commits after the rebase command"
[9]:/file/401151
[10]:https://opensource.com/sites/default/files/uploads/gitcommands6_rebase-undo.png "After undoing rebase"
[11]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/detail/67142
[12]:https://conferences.oreilly.com/oscon/oscon-or
[13]:https://www.amazon.com/Professional-Git-Brent-Laster/dp/111928497X/ref=la_B01MTGIINQ_1_2?s=books&amp;ie=UTF8&amp;qid=1528826673&amp;sr=1-2
