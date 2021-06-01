[#]: subject: (4 tips for context switching in Git)
[#]: via: (https://opensource.com/article/21/4/context-switching-git)
[#]: author: (Olaf Alders https://opensource.com/users/oalders)
[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13422-1.html)

Git 中上下文切换的 4 种方式
======

> 比较 Git 中四种切换分支的方法的优缺点。

![](https://img.linux.net.cn/data/attachment/album/202105/25/091803a6ww3r7yo32oxdzx.jpg)

所有大量使用 Git 的人都会用到某种形式的上下文切换。有时这只会给你的工作流程增加少量的开销，但有时，这可能是一段痛苦的经历。

让我们用以下这个例子来讨论一些常见的上下文切换策略的优缺点：

> 假设你在一个名为 `feature-X` 的分支中工作。你刚刚发现你需要解决一个无关的问题。这不能在 `feature-X` 分支中完成。你需要在一个新的分支 `feature-Y` 中完成这项工作。

### 方案 1：暂存 + 分支

解决此问题最常见的工作流程可能如下所示：

  1. 停止分支 `feature-X` 上的工作
  2. `git stash`
  3. `git checkout -b feature-Y origin/main`
  4. 一顿鼓捣，解决 `feature-Y` 的问题
  5. `git checkout feature-X` 或 `git switch -`
  6. `git stash pop`
  7. 继续在 `feature-X` 中工作

**优点：** 这种方法的优点在于，对于简单的更改，这是一个相当简单的工作流程。它可以很好地工作，特别是对于小型仓库。

**缺点：** 使用此工作流程时，一次只能有一个工作区。另外，根据你的仓库的状态，使用暂存是一个麻烦的环节。

### 方案 2：WIP 提交 + 分支

这个解决方案和前一个非常相似，但是它使用 WIP（<ruby>正在进行的工作<rt>Work in Progress</rt></ruby>）提交而不是暂存。当你准备好切换回来，而不是弹出暂存时，`git reset HEAD~1` 会展开 WIP 提交，你可以自由地继续，就像之前的方案一样，但不会触及暂存。

  1. 停止分支 `feature-X` 上的工作
  2. `git add -u`（仅仅添加修改和删除的文件）
  3. `git commit -m "WIP"`
  4. `git checkout -b feature-Y origin/master`
  5. 一顿鼓捣，解决 `feature-Y` 的问题
  6. `git checkout feature-X` 或 `git switch -`
  7. `git reset HEAD~1`

**优点：** 对于简单的更改，这是一个简单的工作流，也适合于小型仓库。你不需要使用暂存。

**缺点：** 任何时候都只能有一个工作区。此外，如果你或你的代码审阅者不够谨慎，WIP 提交可能会合并到最终产品。

使用此工作流时，你**永远**不要想着将 `--hard` 添加到 `git reset`。如果你不小心这样做了，你应该能够使用 `git reflog` 恢复提交，但是你最好完全避免这种情况发生，否则你会听到心碎的声音。

### 方案 3：克隆一个新仓库

在这个解决方案中，不是创建新的分支，而是为每个新的功能分支创建存储库的新克隆。

**优点：** 你可以同时在多个工作区中工作。你不需要 `git stash` 或者是 WIP 提交。

**缺点：** 需要考虑仓库的大小，因为这可能会占用大量磁盘空间（浅层克隆可以帮助解决这种情况，但它们可能并不总是很合适。）此外，你的仓库克隆将互不可知。因为他们不能互相追踪，所以你必须手动追踪你的克隆的源仓库。如果需要 git 钩子，则需要为每个新克隆设置它们。

### 方案 4：git 工作树

要使用此解决方案，你可能需要了解 `git add worktree`。如果你不熟悉 Git 中的工作树，请不要难过。许多人多年来都对这个概念一无所知。

#### 什么是工作树？

将工作树视为仓库中属于项目的文件。本质上，这是一种工作区。你可能没有意识到你已经在使用工作树了。开始使用 Git 时，你将自动获得第一个工作树。

```
$ mkdir /tmp/foo && cd /tmp/foo
$ git init
$ git worktree list
/tmp  0000000 [master]
```

你可以在以上代码看到，甚至在第一次提交前你就有了一个工作树。接下来去尝试再添加一个工作树到你的项目中吧。

#### 添加一个工作树

想要添加一个新的工作树你需要提供:

  1. 硬盘上的一个位置
  2. 一个分支名
  3. 添加哪些分支

```
$ git clone https://github.com/oalders/http-browserdetect.git
$ cd http-browserdetect/
$ git worktree list
/Users/olaf/http-browserdetect  90772ae [master]

$ git worktree add ~/trees/oalders/feature-X -b oalders/feature-X origin/master
$ git worktree add ~/trees/oalders/feature-Y -b oalders/feature-Y e9df3c555e96b3f1

$ git worktree list
/Users/olaf/http-browserdetect       90772ae [master]
/Users/olaf/trees/oalders/feature-X  90772ae [oalders/feature-X]
/Users/olaf/trees/oalders/feature-Y  e9df3c5 [oalders/feature-Y]
```

与大多数其他 Git 命令一样，你需要在仓库路径下使用此命令。一旦创建了工作树，就有了隔离的工作环境。Git 仓库会跟踪工作树在磁盘上的位置。如果 Git 钩子已经在父仓库中设置好了，那么它们也可以在工作树中使用。

请注意到，每个工作树只使用父仓库磁盘空间的一小部分。在这种情况下，工作树需要只大约三分之一的原始磁盘空间。这这非常适合进行扩展。如果你的仓库达到了千兆字节的级别，你就会真正体会到工作树对硬盘空间的节省。

```
$ du -sh /Users/olaf/http-browserdetect
2.9M

$ du -sh /Users/olaf/trees/oalders/feature-X
1.0M
```

**优点：** 你可以同时在多个工作区中工作。你不需要使用暂存。Git 会跟踪所有的工作树。你不需要设置 Git 钩子。这也比 `git clone` 更快，并且可以节省网络流量，因为你可以在飞行模式下执行此操作。你还可以更高效地使用磁盘空间，而无需借助于浅层克隆。

**缺点：** 这是个需要你额外学习和记忆的新东西，但是如果你能养成使用这个功能的习惯，它会给你丰厚的回报。

#### 额外的小技巧

有很多方式可以清除工作树，最受欢迎的方式是使用 Git 来移除工作树：

```
git worktree remove /Users/olaf/trees/oalders/feature-X
```

如果你喜欢 RM 大法，你也可以用 `rm -rf` 来删除工作树。

```
rm -rf /Users/olaf/trees/oalders/feature-X
```

但是，如果执行此操作，则可能需要使用 `git worktree prune` 清理所有剩余的文件。或者你现在可以跳过清理，这将在将来的某个时候通过 `git gc` 自行完成。

#### 注意事项

如果你准备尝试 `git worktree`，请记住以下几点：

* 删除工作树并不会删除该分支。
* 可以在工作树中切换分支。
* 你不能在多个工作树中同时签出同一个分支。
* 像其他命令一样，`git worktree` 需要从仓库内运行。
* 你可以同时拥有许多工作树。
* 要从同一个本地仓库签出创建工作树，否则它们将互不可知。

#### git rev-parse

最后一点注意：在使用 `git worktree` 时，仓库根所在的位置可能取决于上下文。幸运的是，`git rev parse` 可以让你区分这两者。

* 要查找父仓库的根目录，请执行以下操作：    
    ```
    git rev-parse --git-common-dir
  ```
* 要查找你当前所在仓库的根目录，请执行：
    ```
    git rev-parse --show-toplevel
  ```

### 根据你的需要选择最好的方法

就像很多事情一样，TIMTOWDI（<ruby>条条大道通罗马<rt>there's more than one way to do it</rt></ruby>）。重要的是你要找到一个适合你需要的工作流程。你的需求可能因手头的问题而异。也许你偶尔会发现自己将 `git worktree` 作为版本控制工具箱中的一个方便工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/context-switching-git

作者：[Olaf Alders][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/oalders
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
