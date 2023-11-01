[#]: subject: "Some miscellaneous git facts"
[#]: via: "https://jvns.ca/blog/2023/10/20/some-miscellaneous-git-facts/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "KaguyaQiang"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16316-1.html"

一些被忽略的 Git 知识
======

![][0]

我一直在慢慢地撰写关于 Git 工作原理的文章。尽管我曾认为自己对 Git 非常了解，但像往常一样，当我尝试解释某事的时候，我又学到一些新东西。

现在回想起来，这些事情都不算太令人吃惊，但我以前并没有清楚地思考过它们。

事实是:

  * “索引”、“暂存区” 和 `-cached` 是一回事
  * 隐匿文件就是一堆提交
  * 并非所有引用都是分支或标签
  * 合并提交不是空的

下面我们来详细了解这些内容。

### “索引”、“暂存区” 和 `-cached` 是一回事

当你运行 `git add file.txt`，然后运行 `git status`，你会看到类似以下的输出：

```
$ git add content/post/2023-10-20-some-miscellaneous-git-facts.markdown
$ git status
Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
    new file:   content/post/2023-10-20-some-miscellaneous-git-facts.markdown
```

人们通常称这个过程为“暂存文件”或“将文件添加到暂存区”。

当你使用 `git add` 命令来暂存文件时，Git 在后台将文件添加到其对象数据库（在 `.git/objects` 目录下），并更新一个名为 `.git/index` 的文件以引用新添加的文件。

Git 中的这个“暂存区”事实上有 3 种不同的名称，但它们都指的是同一个东西（即 `.git/index` 文件）：

  * `git diff --cached`
  * `git diff --staged`
  * `.git/index` 文件

我觉得我早该早点认识到这一点，但我之前并没有，所以在这里提醒一下。

### 隐匿文件就是一堆提交

当我运行 `git stash` 命令来保存更改时，我一直对这些更改究竟去了哪里感到有些困惑。事实上，当你运行 `git stash` 命令时，Git 会根据你的更改创建一些提交，并用一个名为 `stash` 的引用来标记它们（在 `.git/refs/stash` 目录下）。

让我们将此博客文章隐匿起来，然后查看 `stash` 引用的日志：

```
$ git log stash --oneline
6cb983fe (refs/stash) WIP on main: c6ee55ed wip
2ff2c273 index on main: c6ee55ed wip
... some more stuff
```

现在我们可以查看提交 `2ff2c273` 以查看其包含的内容：

```
$ git show 2ff2c273  --stat
commit 2ff2c273357c94a0087104f776a8dd28ee467769
Author: Julia Evans <julia@jvns.ca>
Date:   Fri Oct 20 14:49:20 2023 -0400

    index on main: c6ee55ed wip

    content/post/2023-10-20-some-miscellaneous-git-facts.markdown | 40 ++++++++++++++++++++++++++++++++++++++++
```

毫不意外，它包含了这篇博客文章。这很合理！

实际上，`git stash` 会创建两个独立的提交：一个是索引提交，另一个是你尚未暂存的改动提交。这让我感到很振奋，因为我一直在开发一款工具，用于快照和恢复 Git 仓库的状态（也许永远不会发布），而我提出的设计与 Git 的隐匿实现非常相似，所以我对自己的选择感到满意。

显然 `stash` 中的旧提交存储在 reflog 中。

### 并非所有引用都是分支或标签

Git 文档中经常泛泛地提到 “引用”，这使得我有时觉得很困惑。就个人而言，我在 Git 中处理 “引用” 的 99% 时间是指分支或 HEAD，而剩下的 1% 时间是指标签。事实上，我以前完全不知道任何不是分支、标签或 `HEAD` 的引用示例。

但现在我知道了一个例子—— `stash` 是一种引用，而它既不是分支也不是标签！所以这太酷啦！

以下是我博客的 Git 仓库中的所有引用（除了 `HEAD`）：

```
$ find .git/refs -type f
.git/refs/heads/main
.git/refs/remotes/origin/HEAD
.git/refs/remotes/origin/main
.git/refs/stash
```

人们在本帖回复中提到的其他一些参考资料：

- `refs/notes/*`，来自 [`git notes`][5]
- `refs/pull/123/head` 和 `refs/pull/123/head`` 用于 GitHub 拉取请求（可通过 `git fetch origin refs/pull/123/merge` 获取）
- `refs/bisect/*`，来自 `git bisect`

### 合并提交不是空的

这是一个示例 Git 仓库，其中我创建了两个分支 `x` 和 `y`，每个分支都有一个文件（`x.txt` 和 `y.txt`），然后将它们合并。让我们看看合并提交。

```
$ git log --oneline
96a8afb (HEAD -> y) Merge branch 'x' into y
0931e45 y
1d8bd2d (x) x
```

如果我运行 `git show 96a8afb`，合并提交看起来是“空的”：没有差异！

```
git show 96a8afb
commit 96a8afbf776c2cebccf8ec0dba7c6c765ea5d987 (HEAD -> y)
Merge: 0931e45 1d8bd2d
Author: Julia Evans <julia@jvns.ca>
Date:   Fri Oct 20 14:07:00 2023 -0400

    Merge branch 'x' into y
```

但是，如果我单独比较合并提交与其两个父提交之间的差异，你会发现当然**有**差异：

```
$ git diff 0931e45 96a8afb   --stat
    x.txt | 1 +
    1 file changed, 1 insertion(+)
$ git diff 1d8bd2d 96a8afb   --stat
    y.txt | 1 +
    1 file changed, 1 insertion(+)
```

现在回想起来，合并提交并不是实际上“空的”（它们是仓库当前状态的快照，就像任何其他提交一样），这一点似乎很明显，只是我以前从未思考为什么它们看起来为空。

显然，这些合并差异为空的原因是合并差异只显示**冲突** —— 如果我创建一个带有合并冲突的仓库（一个分支在同一文件中添加了 `x`，而另一个分支添加了 `y`），然后查看我解决冲突的合并提交，它看起来会像这样：

```
$ git show HEAD
commit 3bfe8311afa4da867426c0bf6343420217486594
Merge: 782b3d5 ac7046d
Author: Julia Evans <julia@jvns.ca>
Date:   Fri Oct 20 15:29:06 2023 -0400

    Merge branch 'x' into y

diff --cc file.txt
index 975fbec,587be6b..b680253
--- a/file.txt
+++ b/file.txt
@@@ -1,1 -1,1 +1,1 @@@
- y
    -x
++z
```

这似乎是在告诉我，一个分支添加了 `x`，另一个分支添加了 `y`，合并提交通过将 `z` 替代冲突解决了它。但在前面的示例中，没有冲突，所以 Git 并未显示任何差异。

（感谢 Jordi 告诉我合并差异的工作原理）

### 先这样吧

些写到这里吧，也许我将在学到更多 Git 知识时撰写另一篇关于 Git 的知识的博客文章。

*（题图：MJ/03bfecc3-944e-47a0-a4fd-575293d2ba92）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/10/20/some-miscellaneous-git-facts/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[KaguyaQiang][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[c]: https://github.com/KaguyaQiang
[1]: tmp.0vBZr0yeF0#the-index-staging-area-and-cached-are-all-the-same-thing
[2]: tmp.0vBZr0yeF0#the-stash-is-a-bunch-of-commits
[3]: tmp.0vBZr0yeF0#not-all-references-are-branches-or-tags
[4]: tmp.0vBZr0yeF0#merge-commits-aren-t-empty
[5]: https://tylercipriani.com/blog/2022/11/19/git-notes-gits-coolest-most-unloved-feature/
[0]: https://img.linux.net.cn/data/attachment/album/202310/25/122259mfu0uowyppuyfdyo.jpg