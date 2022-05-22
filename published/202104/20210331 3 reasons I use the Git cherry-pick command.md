[#]: subject: (3 reasons I use the Git cherry-pick command)
[#]: via: (https://opensource.com/article/21/3/git-cherry-pick)
[#]: author: (Manaswini Das https://opensource.com/users/manaswinidas)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13305-1.html)

我使用 Git cherry-pick 命令的 3 个理由
======

> “遴选”可以解决 Git 仓库中的很多问题。以下是用 `git cherry-pick` 修复错误的三种方法。

![](https://img.linux.net.cn/data/attachment/album/202104/17/174429qw1im6if6mf6zi9i.jpg)

在版本控制系统中摸索前进是一件很棘手的事情。对于一个新手来说，这可能是非常难以应付的，但熟悉版本控制系统（如 Git）的术语和基础知识是开始为开源贡献的第一步。

熟悉 Git 也能帮助你在开源之路上走出困境。Git 功能强大，让你感觉自己在掌控之中 —— 没有哪一种方法会让你无法恢复到工作版本。

这里有一个例子可以帮助你理解“<ruby>遴选<rt>cherry-pick</rt></ruby>”的重要性。假设你已经在一个分支上做了好几个提交，但你意识到这是个错误的分支！你现在该怎么办？你现在要做什么？要么在正确的分支上重复所有的变更，然后重新提交，要么把这个分支合并到正确的分支上。等一下，前者太过繁琐，而你可能不想做后者。那么，还有没有办法呢？有的，Git 已经为你准备好了。这就是“遴选”的作用。顾名思义，你可以用它从一个分支中手工遴选一个提交，然后转移到另一个分支。

使用遴选的原因有很多。以下是其中的三个原因。

### 避免重复性工作

如果你可以直接将相同的提交复制到另一个分支，就没有必要在不同的分支中重做相同的变更。请注意，遴选出来的提交会在另一个分支中创建带有新哈希的新提交，所以如果你看到不同的提交哈希，请不要感到困惑。

如果您想知道什么是提交的哈希，以及它是如何生成的，这里有一个说明可以帮助你。提交哈希是用 [SHA-1][2] 算法生成的字符串。SHA-1 算法接收一个输入，然后输出一个唯一的 40 个字符的哈希值。如果你使用的是 [POSIX][3] 系统，请尝试在您的终端上运行这个命令：

```
$ echo -n "commit" | openssl sha1
```

这将输出一个唯一的 40 个字符的哈希值 `4015b57a143aec5156fd1444a017a32137a3fd0f`。这个哈希代表了字符串 `commit`。

Git 在提交时生成的 SHA-1 哈希值不仅仅代表一个字符串。它代表的是：

```
sha1(
    meta data
        commit message
        committer
        commit date
        author
        authoring date
    Hash of the entire tree object
)
```

这就解释了为什么你对代码所做的任何细微改动都会得到一个独特的提交哈希值。哪怕是一个微小的改动都会被发现。这是因为 Git 具有完整性。

### 撤销/恢复丢失的更改

当你想恢复到工作版本时，遴选就很方便。当多个开发人员在同一个代码库上工作时，很可能会丢失更改，最新的版本会被转移到一个陈旧的或非工作版本上。这时，遴选提交到工作版本就可以成为救星。

#### 它是如何工作的？

假设有两个分支：`feature1` 和 `feature2`，你想把 `feature1` 中的提交应用到 `feature2`。

在 `feature1` 分支上，运行 `git log` 命令，复制你想遴选的提交哈希值。你可以看到一系列类似于下面代码示例的提交。`commit` 后面的字母数字代码就是你需要复制的提交哈希。为了方便起见，您可以选择复制前六个字符（本例中为 `966cf3`）。

```
commit 966cf3d08b09a2da3f2f58c0818baa37184c9778 (HEAD -> master)
Author: manaswinidas <me@example.com>
Date:   Mon Mar 8 09:20:21 2021 +1300

   add instructions
```

然后切换到 `feature2` 分支，在刚刚从日志中得到的哈希值上运行 `git cherry-pick`：

```
$ git checkout feature2
$ git cherry-pick 966cf3.
```

如果该分支不存在，使用 `git checkout -b feature2` 来创建它。

这里有一个问题。你可能会遇到下面这种情况：

```
$ git cherry-pick 966cf3
On branch feature2
You are currently cherry-picking commit 966cf3d.

nothing to commit, working tree clean
The previous cherry-pick is now empty, possibly due to conflict resolution.
If you wish to commit it anyway, use:

   git commit --allow-empty

Otherwise, please use 'git reset'
```

不要惊慌。只要按照建议运行 `git commit --allow-empty`：

```
$ git commit --allow-empty
[feature2 afb6fcb] add instructions
Date: Mon Mar 8 09:20:21 2021 +1300
```

这将打开你的默认编辑器，允许你编辑提交信息。如果你没有什么要补充的，可以保存现有的信息。

就这样，你完成了你的第一次遴选。如上所述，如果你在分支 `feature2` 上运行 `git log`，你会看到一个不同的提交哈希。下面是一个例子：

```
commit afb6fcb87083c8f41089cad58deb97a5380cb2c2 (HEAD -&gt; feature2)
Author: manaswinidas &lt;[me@example.com][4]&gt;
Date:   Mon Mar 8 09:20:21 2021 +1300
   add instructions
```

不要对不同的提交哈希感到困惑。这只是区分 `feature1` 和 `feature2` 的提交。

### 遴选多个提交

但如果你想遴选多个提交的内容呢？你可以使用：

```
git cherry-pick <commit-hash1> <commit-hash2>... <commit-hashn>
```

请注意，你不必使用整个提交的哈希值，你可以使用前五到六个字符。

同样，这也是很繁琐的。如果你想遴选的提交是一系列的连续提交呢？这种方法太费劲了。别担心，有一个更简单的方法。

假设你有两个分支：

  * `feature1` 包括你想复制的提交（从更早的 `commitA` 到 `commitB`）。
  * `feature2` 是你想把提交从 `feature1` 转移到的分支。

然后：

  1. 输入 `git checkout <feature1>`。
  2. 获取 `commitA` 和 `commitB` 的哈希值。
  3. 输入 `git checkout <branchB>`。
  4. 输入 `git cherry-pick <commitA>^..<commitB>` （请注意，这包括 `commitA` 和 `commitB`）。
  5. 如果遇到合并冲突，[像往常一样解决][5]，然后输入 `git cherry-pick --continue` 恢复遴选过程。

### 重要的遴选选项

以下是 [Git 文档][6] 中的一些有用的选项，你可以在 `cherry-pick` 命令中使用。

  * `-e`、`--edit`：用这个选项，`git cherry-pick` 可以让你在提交前编辑提交信息。
  * `-s`、`--signoff`：在提交信息的结尾添加 `Signed-off by` 行。更多信息请参见 `git-commit(1)` 中的 signoff 选项。
  * `-S[<keyid>]`、`--pgg-sign[=<keyid>]`：这些是 GPG 签名的提交。`keyid` 参数是可选的，默认为提交者身份；如果指定了，则必须嵌在选项中，不加空格。
  * `--ff`：如果当前 HEAD 与遴选的提交的父级提交相同，则会对该提交进行快进操作。

下面是除了 `--continue` 外的一些其他的后继操作子命令：

  * `--quit`：你可以忘记当前正在进行的操作。这可以用来清除遴选或撤销失败后的后继操作状态。
  * `--abort`：取消操作并返回到操作序列前状态。

下面是一些关于遴选的例子：

  * `git cherry-pick master`：应用 `master` 分支顶端的提交所引入的变更，并创建一个包含该变更的新提交。
  * `git cherry-pick master~4 master~2'：应用 `master` 指向的第五个和第三个最新提交所带来的变化，并根据这些变化创建两个新的提交。

感到不知所措？你不需要记住所有的命令。你可以随时在你的终端输入 `git cherry-pick --help` 查看更多选项或帮助。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/git-cherry-pick

作者：[Manaswini Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/manaswinidas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/pictures/cherry-picking-recipe-baking-cooking.jpg?itok=XVwse6hw (Measuring and baking a cherry pie recipe)
[2]: https://en.wikipedia.org/wiki/SHA-1
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: mailto:me@example.com
[5]: https://opensource.com/article/20/4/git-merge-conflict
[6]: https://git-scm.com/docs/git-cherry-pick
