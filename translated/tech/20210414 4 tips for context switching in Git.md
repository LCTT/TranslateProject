[#]: subject: (4 tips for context switching in Git)
[#]: via: (https://opensource.com/article/21/4/context-switching-git)
[#]: author: (Olaf Alders https://opensource.com/users/oalders)
[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Git 中内容分支切换的 4 个方案
======
比较 Git 中四种切换分支的方法的优缺点。
![打开文件或窗口的计算机屏幕][1]

所有需要大量使用 Git 的人都会用到分支切换。有时这仅仅占用少量时间和精力，但有时，这个操作会带来一段痛苦的经历。

让我们用以下这个例子来讨论一些处理上下文转换的常用策略的优缺点：

> 假设您在一个名为 `feature-X` 的分支中工作。你刚刚发现你需要解决一个无关的问题。这不能在 `feature-X` 中完成。你需要在一个新的分支 ` feature-Y` 中完成这项工作。

### 方案 1：stash + branch

解决此问题最常见的工作流可能如下所示：

  1. 终止分支 `feature-X` 上的工作
  2. `git stash`
  3. `git checkout -b feature-Y origin/main`
  4. 一顿鼓捣，解决 `feature-Y` 的问题
  5. `git checkout feature-X` 或 `git switch -`
  6. `git stash pop`
  7. 继续在 `feature-X` 中工作



**优点：** 这种方法的优点在于，对于简单的更改，这是一个相当简单的工作流。它可以很好地工作，特别是对于小型仓库。

**缺点：** 使用此工作流时，一次只能有一个工作区。另外，根据仓库的状态，使用 stash 是一个麻烦的环节。

### 方案 2：WIP commit + branch

这个解决方案和前一个非常相似，但是它使用 WIP（Workin Progress）提交而不是 stash。当您准备好切换回来，而不是弹出 stash 时，`git reset HEAD~1` 会展开 WIP 提交，您可以自由地继续，就像之前的方案一样，但不会触及 stash。

  1. 终止分支 `feature-X` 上的工作
  2. `git add -u` (仅仅添加修改和删除的操作)
  3. `git commit -m "WIP"`
  4. `git checkout -b feature-Y origin/master`
  5. 一顿鼓捣，解决 `feature-Y` 的问题
  6. `git checkout feature-X` 或 `git switch -`
  7. `git reset HEAD~1`



**优点：** 对于简单的更改，这是一个简单的工作流，对于小型仓库来说很好用。你不需要使用 stash。

**缺点：** 任何时候都只能有一个工作区。此外，如果您或您的代码审阅者不够谨慎，WIP 提交可能会合并到最终产品。

使用此工作流时，您**永远**不要想着将 `--hard` 添加到 `git reset`。如果您不小心这样做了，您应该能够使用 `git reflog` 恢复提交，但是您最好完全避免这种情况发生，否则你会听到心碎的声音。

### 方案 3: 克隆一个新仓库

在这个解决方案中，不是创建新的分支，而是为每个新的功能分支创建存储库的新克隆。

**优点：** 您可以同时在多个工作区中工作。你不需要 `git stash` 或者是 WIP 提交。

**缺点：** 需要考虑仓库的大小，因为这可能会占用大量磁盘空间(浅层克隆可以帮助解决这种情况，但它们可能并不总是很合适。）此外，您的仓库克隆将互不可知。因为他们不能互相追踪，所以你必须手动追踪你的克隆的源仓库。如果需要 git 钩子，则需要为每个新克隆设置它们。

### 方案 4: git worktree

要使用此解决方案，您可能需要了解 `git add worktree`。如果您不熟悉 Git 中的 worktrees，请不要难过。许多人多年来都对这个概念一无所知。

#### 什么是 worktree?

将 worktree 视为仓库中属于项目的文件。本质上，这是一种工作空间。你可能没有意识到你已经在使用 worktrees 了。开始使用 Git 时，您将自动获得第一个 worktree。

```
$ mkdir /tmp/foo &amp;&amp; cd /tmp/foo
$ git init
$ git worktree list
/tmp  0000000 [master]
```

你可以在以上代码看到，甚至在第一次 commit 前你就有了一个 worktree。接下来去尝试再添加一个 worktree 到你的项目中吧。

#### 添加一个 worktree

想要添加一个新的 worktree 你需要提供:

  1. 硬盘上的一个位置
  2. 一个分支名
  3. 添加哪些分支



```
$ git clone <https://github.com/oalders/http-browserdetect.git>
$ cd http-browserdetect/
$ git worktree list
/Users/olaf/http-browserdetect  90772ae [master]

$ git worktree add ~/trees/oalders/feature-X -b oalders/feature-X origin/master
$ git worktree add ~/trees/oalders/feature-Y -b oalders/feature-Y e9df3c555e96b3f1

$ git worktree list
/Users/olaf/http-browserdetect       90772ae [master]
/Users/olaf/trees/oalders/feature-X  90772ae [oalders/feature-X]
/Users/olaf/trees/oalders/feature-Y  e9df3c5 [oalders/feature-Y]
```

与大多数其他 Git 命令一样，需要在仓库路径下使用此命令。一旦创建了 worktree ，就有了隔离的工作环境。Git 仓库跟踪 worktree 在磁盘上的位置。如果 Git 钩子已经在父仓库中设置好了，那么它们也可以在 worktree 中使用。

请注意到，每个 worktree 只使用父仓库磁盘空间的一小部分。在这种情况下，worktree 需要只大约三分之一的原始磁盘空间。这这非常适合进行扩展。如果您的仓库达到了千兆字节的级别，您就会真正体会到 worktree 对硬盘空间的节省。

```
$ du -sh /Users/olaf/http-browserdetect
2.9M

$ du -sh /Users/olaf/trees/oalders/feature-X
1.0M
```

**优点：** 您可以同时在多个工作区中工作。你不需要使用 stash。Git 跟踪所有的 worktree。你不需要设置 Git 钩子。这也比 `git clone` 更快，并且可以节省网络流量，因为您可以在飞行模式下执行此操作。您还可以更高效地使用磁盘空间，而无需使用浅层克隆。

**缺点：** 这是个需要你额外学习和记忆的新东西，但是如果你能养成使用这个功能的习惯，它会给你丰厚的回报。

### 额外的小技巧

有很多方式可以清除 worktrees，最受欢迎的方式是使用 Git 来移除 worktree：


```
`git worktree remove /Users/olaf/trees/oalders/feature-X`
```

如果你喜欢 rm 大法，你也可以用 `rm -rf` 来删除 worktree。


```
`rm -rf /Users/olaf/trees/oalders/feature-X`
```

但是，如果执行此操作，则可能需要使用 `git worktree prune` 清理所有剩余的文件。或者您现在可以跳过 `prune`，这将在将来的某个时候通过 `git gc` 自行完成。

### 注意事项

如果你准备尝试 `git worktree`, 请记住以下几点：

* 删除 worktree 不会删除分支。
* 可以在 worktree 中切换分支。
* 不能同时签出多个 worktree 中的同一分支。
* 像其他命令一样，`git worktree` 需要从仓库内运行。
* 你可以同时拥有许多 worktree。
* 要从同一个本地签出创建 worktree，否则它们将互不可知。



### git rev-parse

最后一点注意：在使用 `git worktree` 时，仓库根所在的位置可能取决于文本。幸运的是，`git rev parse`允许您区分这两者。

  * 要查找父仓库的根目录，请执行以下操作：

```
  git rev-parse --git-common-dir
```

  * 要查找你当前所在仓库的更目录，请执行：

```
  git rev-parse --show-toplevel
```


### 根据你的需要选择最好的方法

就像很多事情一样，TIMTOWDI (there's more than one way to do it，有不止一种方法解决问题）。重要的是你要找到一个适合你需要的工作流程。您的需求可能因手头的问题而异。也许你偶尔会发现自己将 `git worktree` 作为版本控制工具箱中的一个方便工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/context-switching-git

作者：[Olaf Alders][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/oalders
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
