[#]: subject: "Confusing git terminology"
[#]: via: "https://jvns.ca/blog/2023/11/01/confusing-git-terminology/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16451-1.html"

解读那些令人困惑 Git 术语
======

![][0]

我正在一步步解释 Git 的方方面面。在使用 Git 近 15 年后，我已经非常习惯于 Git 的特性，很容易忘记它令人困惑的地方。

因此，我在 [Mastodon][1] 上进行了调查：

> 你有觉得哪些 Git 术语很让人困惑吗？我计划写篇博客，来解读 Git 中一些奇怪的术语，如：“分离的 HEAD 状态”，“快速前移”，“索引/暂存区/已暂存”，“比 `origin/main` 提前 1 个提交”等等。

我收到了许多有洞见的答案，我在这里试图概述其中的一部分。下面是这些术语的列表：

  * HEAD 和 “heads”
  * “分离的 `HEAD` 状态”
  * 在合并或变基时的 “ours” 和 “theirs”
  * “你的分支已经与 'origin/main' 同步”
  * `HEAD^`、`HEAD~`、`HEAD^^`、`HEAD~~`、`HEAD^2`、`HEAD~2`
  * `..` 和 `...`
  * “可以快速前移”
  * “引用”、“符号引用”
  * refspecs
  * “tree-ish”
  * “索引”、“暂存的”、“已缓存的”
  * “重置”、“还原”、“恢复”
  * “未跟踪的文件”、“追踪远程分支”、“跟踪远程分支”
  * 检出
  * reflog
  * 合并、变基和遴选
  * `rebase –onto`
  * 提交
  * 更多复杂的术语

我已经尽力讲解了这些术语，但它们几乎覆盖了 Git 的每一个主要特性，这对一篇博客而言显然过于繁重，所以在某些地方可能会有一些粗糙。

### `HEAD` 和 “heads”

有些人表示他们对 `HEAD` 和 `refs/heads/main` 这些术语感到困惑，因为听起来像是一些复杂的技术内部实现。

以下是一个快速概述：

  * “heads” 就是 “分支”。在 Git 内部，分支存储在一个名为 `.git/refs/heads` 的目录中。（从技术上讲，[官方 Git 术语表][21] 中明确表示分支是所有的提交，而 head 只是最近的提交，但这只是同一事物的两种不同思考方式）
  * `HEAD` 是当前的分支，它被存储在 `.git/HEAD` 中。

我认为，“head 是一个分支，`HEAD` 是当前的分支” 或许是 Git 中最奇怪的术语选择，但已经设定好了，想要更清晰的命名方案已经为时已晚，我们继续。

“HEAD 是当前的分支” 有一些重要的例外情况，我们将在下面讨论。

### “分离的 HEAD 状态”

你可能已经看到过这条信息：

```
$ git checkout v0.1
You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

[...]
```

（消息译文：你处于 “分离 HEAD” 的状态。你可以四处看看，进行试验性的更改并提交，你可以通过切换回一个分支来丢弃这个状态下做出的任何提交。）

这条信息的实质是：

  * 在 Git 中，通常你有一个已经检出的 “当前分支”，例如 `main`。
  * 存放当前分支的地方被称为 `HEAD`。
  * 你做出的任何新提交都会被添加到你的当前分支，如果你运行 `git merge other_branch`，这也会影响你的当前分支。
  * 但是，`HEAD` 不一定**必须**是一个分支！它也可以是一个提交 ID。
  * Git 会称这种状态（`HEAD` 是提交 ID 而不是分支）为 “分离的 `HEAD` 状态”
  * 例如，你可以通过检出一个标签来进入分离的 `HEAD` 状态，因为标签不是分支
  * 如果你没有当前分支，一系列事情就断链了：
    * `git pull` 根本就无法工作（因为它的全部目的就是更新你的当前分支）
    * 除非以特殊方式使用 `git push`，否则它也无法工作
    * `git commit`、`git merge`、`git rebase` 和 `git cherry-pick` 仍然可以工作，但它们会留下“孤儿”提交，这些提交没有连接到任何分支，因此找到这些提交会很困难
  * 你可以通过创建一个新的分支或切换到一个现有的分支来退出分离的 `HEAD` 状态

### 在合并或变基中的 “ours” 和 “theirs”

遇到合并冲突时，你可以运行 `git checkout --ours file.txt` 来选择 “ours” 版本中的 `file.txt`。但问题是，什么是 “ours”，什么是 “theirs” 呢？

我总感觉此类术语混淆不清，也因此从未用过 `git checkout --ours`，但我还是查找相关资料试图理清。

在合并的过程中，这是如何运作的：当前分支是 “ours”，你要合并进来的分支是 “theirs”，这样看来似乎很合理。

```
$ git checkout merge-into-ours # 当前分支是 “ours”
$ git merge from-theirs # 我们正要合并的分支是 “theirs”
```

而在变基的过程中就刚好相反 —— 当前分支是 “theirs”，我们正在变基到的目标分支是 “ours”，如下：

```
$ git checkout theirs # 当前分支是 “theirs”
$ git rebase ours # 我们正在变基到的目标分支是 “ours”
```

我以为之所以会如此，因为在操作过程中，`git rebase main` 其实是将当前分支合并到 `main` （它类似于 `git checkout main; git merge current_branch`），尽管如此我仍然觉得此类术语会造成混淆。

[这个精巧的小网站][22] 对 “ours” 和 “theirs” 的术语进行了解释。

人们也提到，VSCode 将 “ours”/“theirs” 称作 “当前的更改”/“收到的更改”，同样会引起混淆。

### “你的分支已经与 `origin/main` 同步”

此信息貌似很直白 —— 你的 `main` 分支已经与源端同步！

但它实际上有些误导。可能会让你以为这意味着你的 `main` 分支已经是最新的，其实不然。它**真正的**含义是 —— 如果你最后一次运行 `git fetch` 或 `git pull` 是五天前，那么你的 `main` 分支就是与五天前的所有更改同步。

因此，如果你没有意识到这一点，它对你的安全感其实是一种误导。

我认为 Git 理论上可以给出一个更有用的信息，像是“与五天前上一次获取的源端 `main` 是同步的”，因为最新一次获取的时间是在 reflog 中记录的，但它没有这么做。

### `HEAD^`、`HEAD~`、`HEAD^^`、`HEAD~~`、`HEAD^2`、`HEAD~2`

我早就清楚 `HEAD^` 代表前一次提交，但我很长一段时间都困惑于 `HEAD~` 和 `HEAD^` 之间的区别。

我查询资料，得到了如下的对应关系：

  * `HEAD^` 和 `HEAD~` 是同一件事情（指向前 1 个提交）
  * `HEAD^^^`、`HEAD~~~` 和 `HEAD~3` 是同一件事情（指向前 3 个提交）
  * `HEAD^3` 指向提交的第三个父提交，它与 `HEAD~3` 是不同的

这看起来有些奇怪，为什么 `HEAD~` 和 `HEAD^` 是同一个概念？以及，“第三个父提交”是什么？难道就是父提交的父提交的父提交？（剧透：并非如此）让我们一起深入探讨一下！

大部分提交只有一个父提交。但是合并提交有多个父提交 - 因为它们合并了两个或更多的提交。在 Git 中，`HEAD^` 意味着 “HEAD 提交的父提交”。但是如果 `HEAD` 是一个合并提交，那 `HEAD^` 又代表怎么回事呢？

答案是，`HEAD^` 指向的是合并提交的**第一个**父提交，`HEAD^2` 是第二个父提交，`HEAD^3` 是第三个父提交，等等。

但我猜他们也需要一个方式来表示“前三个提交”，所以 `HEAD^3` 是当前提交的第三个父提交（如果当前提交是一个合并提交，可能会有很多父提交），而 `HEAD~3` 是父提交的父提交的父提交。

我想，从我们之前对合并提交 “ours”/“theirs” 的讨论来看，`HEAD^` 是 “ours”，`HEAD^2` 是 “theirs”。

### `..` 和 `...`

这是两个命令：

- `git log main..test`
- `git log main...test`

我从没用过 `..` 和 `...` 这两个命令，所以我得查一下 [man git-range-diff][23]。我的理解是比如这样一个情况：

```
A - B main
  \
    C - D test
```

- `main..test` 对应的是提交 C 和 D
- `test..main` 对应的是提交 B
- `main...test` 对应的是提交 B，C，和 D

更有挑战的是，`git diff` 显然也支持 `..` 和 `...`，但它们在 `git log` 中的意思完全不同？我的理解如下：

- `git log test..main` 显示在 `main` 而不在 `test` 的更改，但是 `git log test...main` 则会显示 _两边_ 的改动。
- `git diff test..main` 显示 `test` 变动 _和_ `main` 变动（它比较 `B` 和 `D`），而 `git diff test...main` 会比较 `A` 和 `D`（它只会给你显示一边的差异）。

有关这个的更多讨论可以参考 [这篇博客文章][24]。

### “可以快速前移”

在 `git status` 中，我们会经常遇到如下的信息：

```
$ git status
On branch main
Your branch is behind 'origin/main' by 2 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)
```

（消息译文：你现在处于 `main` 分支上。你的分支比 `origin/main` 分支落后了 2 个提交，可以进行快速前进。  (使用 `git pull` 命令可以更新你的本地分支)）

但“快速前移” 到底是何意？本质上，它在告诉我们这两个分支基本如下图所示（最新的提交在右侧）：

```
main:        A - B - C
origin/main: A - B - C - D - E
```

或者，从另一个角度理解就是：

```
A - B - C - D - E (origin/main)
        |
        main
```

这里，`origin/main` 仅仅多出了 2 个 `main` 不存在的提交，因此我们可以轻松地让 `main` 更新至最新 —— 我们所需要做的就是添加上那 2 个提交。事实上，这几乎不可能出错 —— 不存在合并冲突。快速前进式合并是个非常棒的事情！这是合并两个分支最简单的方式。

运行完 `git pull` 之后，你会得到如下状态：

```
main:        A - B - C - D - E
origin/main: A - B - C - D - E
```

下面这个例子展示了一种**不能**快速前进的状态。

```
A - B - C - X  (main)
        |
        - - D - E  (origin/main)
```

此时，`main` 分支上有一个 `origin/main` 分支上无的提交（`X`），所以无法执行快速前移。在此种情况，`git status` 就会如此显示：

```
$ git status
Your branch and 'origin/main' have diverged,
and have 1 and 2 different commits each, respectively.
```

（你的分支和 `origin/main` 分支已经产生了分歧，其中各有 1 个和 2 个不同的提交。）

### “引用”、“符号引用”

在使用 Git 时，“引用” 一词可能会使人混淆。实际上，Git 中被称为 “引用” 的实例至少有三种：

  * 分支和标签，例如 `main` 和 `v0.2`
  * `HEAD`，代表当前活跃的分支
  * 诸如 `HEAD^^^` 这样的表达式，Git 会将其解析成一个提交 ID。确切说，这可能并非 “引用”，我想 Git [将其称作][25] “版本参数”，但我个人并未使用过这个术语。

个人而言，“符号引用” 这个术语颇为奇特，因为我觉得我只使用过 `HEAD`（即当前分支）作为符号引用。而 `HEAD` 在 Git 中占据核心位置，多数 Git 核心命令的行为都基于 `HEAD` 的值，因此我不太确定将其泛化成一个概念的实际意义。

### refspecs

在 `.git/config` 配置 Git 远程仓库时，你可能会看到这样的代码 `+refs/heads/main:refs/remotes/origin/main` 。

```
[remote "origin"]
    url = git@github.com:jvns/pandas-cookbook
    fetch = +refs/heads/main:refs/remotes/origin/main
```

我对这段代码的含义并不十分清楚，我通常只是在使用 `git clone` 或 `git remote add` 配置远程仓库时采用默认配置，并没有动机去深究或改变。

### “tree-ish”

在 `git checkout` 的手册页中，我们可以看到：

```
git checkout [-f|--ours|--theirs|-m|--conflict=<style>] [<tree-ish>] [--] <pathspec>...
```

那么这里的 `tree-ish` 是什么意思呢？其实当你执行 `git checkout THING .` 时，`THING` 可以是以下的任一种：

  * 一个提交 ID（如 `182cd3f`）
  * 对一个提交 ID 的引用（如 `main` 或 `HEAD^^` 或 `v0.3.2`）
  * 一个位于提交内的子目录（如 `main:./docs`）
  * 可能就这些？

对我个人来说，“提交内的目录”这个功能我从未使用过，从我的视角看，`tree-ish` 可以解读为“提交或对提交的引用”。

### “索引”、“暂存”、“缓存”

这些术语都指向的是同一样东西（文件 `.git/index`，当你执行 `git add` 时，你的变动会在这里被暂存）：

  * `git diff --cached`
  * `git rm --cached`
  * `git diff --staged`
  * 文件 `.git/index` 

尽管它们都是指向同一个文件，但在实际使用中，这些术语的应用方式有所不同：

  * 很显然，`--index` 和 `--cached` 并不总是表示同一种意思。我自己从未使用 `--index`，所以具体细节我就不展开讨论了，但是你可以在 Junio Hamano（Git 的主管维护者）[的博客文章][26] 中找到详细解释。
  * “索引” 会包含未跟踪的文件（我猜可能是对性能的考虑），但你通常不会把未跟踪的文件考虑在“暂存区”内。

### “重置”、“还原”、“恢复”

许多人提到，“<ruby>重置<rt>reset</rt></ruby>”、“<ruby>还原<rt>revert</rt></ruby>” 和 “<ruby>恢复<rt>restore</rt></ruby>” 这三个词非常相似，易使人混淆。

我认为这部分的困惑来自以下原因：

  * `git reset --hard` 和 `git restore .` 单独使用时，基本上达到的效果是一样的。然而，`git reset --hard COMMIT` 和 `git restore --source COMMIT .` 相互之间是完全不同的。
  * 相应的手册页没有给出特别有帮助的描述：
    * `git reset`: “重置当前 `HEAD` 到指定的状态”
    * `git revert`: “还原某些现有的提交”
    * `git restore`: “恢复工作树文件”

虽然这些简短的描述为你详细说明了哪个名词受到了影响（“当前 `HEAD`”，“某些提交”，“工作树文件”），但它们都预设了你已经知道在这种语境中，“重置”、“还原”和“恢复”的准确含义。

以下是对它们各自功能的简要说明：

  * 重置 —— `git revert COMMIT`: 在你当前的分支上，创建一个新的提交，该提交是 `COMMIT` 的“反向”操作（如果 `COMMIT` 添加了 3 行，那么新的提交就会删除这 3 行）。
  * 还原 —— `git reset --hard COMMIT`: 强行将当前分支回退到 `COMMIT` 所在的状态，抹去自 `COMMIT` 以来的所有更改。这是一个高风险的操作。
  * 恢复 —— `git restore --source=COMMIT PATH`: 将 `PATH` 中的所有文件回退到 `COMMIT` 当时的状态，而不扰乱其他文件或提交历史。

### “未跟踪的文件”、“远程跟踪分支”、“跟踪远程分支”

在 Git 中，“跟踪” 这个词以三种相关但不同的方式使用：

  * “<ruby>未跟踪的文件<rt>Untracked files</rt></ruby>”：在 `git status` 命令的输出中可以看到。这里，“未跟踪” 意味着这些文件不受 Git 管理，不会被计入提交。
  * “<ruby>远程跟踪分支<rt>remote tracking branch</rt></ruby>” 例如 `origin/main`。此处的“远程跟踪分支”是一个本地引用，旨在记住上次执行 `git pull` 或 `git fetch` 时，远程 `origin` 上 `main` 分支的状态。
  * 我们经常看到类似 “分支 `foo` 被设置为跟踪 `origin` 上的远程分支 `bar` ”这样的提示。

即使“未跟踪的文件”和“远程跟踪分支”都用到了“跟踪”这个词，但是它们所在的上下文完全不同，所以没有太多混淆。但是，对于以下两种方式的“跟踪”使用，我觉得可能会产生些许困扰：

  * `main` 是一个跟踪远程的分支
  * `origin/main` 是一个远程跟踪分支

然而，在 Git 中，“跟踪远程的分支” 和 “远程跟踪分支” 是不同的事物，理解它们之间的区别非常关键！下面是对这两者区别的一个简单概述：

  * `main` 是一个分支。你可以在它上面做提交，进行合并等操作。在 `.git/config` 中，它通常被配置为 “追踪” 远程的 `main` 分支，这样你就可以用 `git pull` 和 `git push` 来同步和上传更改。
  * `origin/main` 则并不是一个分支，而是一个“远程跟踪分支”，这并不是一种真正的分支（这有些抱歉）。你**不能**在此基础上做提交。只有通过运行 `git pull` 或 `git fetch` 获取远程 `main` 的最新状态，才能更新它。

我以前没有深入思考过这种模糊的地方，但我认为很容易看出为什么它会让人感到困惑。

### 签出

签出做了两个完全无关的事情：

  * `git checkout BRANCH` 用于切换分支
  * `git checkout file.txt` 用于撤销对 `file.txt` 的未暂存修改

这是众所周知的混淆点，因此 Git 实际上已经将这两个功能分离到了 `git switch` 和 `git restore`（尽管你还是可以使用 `checkout`，就像我一样，在不愿丢弃 15 年对 `git checkout` 肌肉记忆的情况下）。

再者，即使用了 15 年，我仍然记不住 `git checkout main file.txt` 用于从 `main` 分支恢复 `file.txt` 版本的命令参数。

我觉得有时你可能需要在 `checkout` 命令后面加上`--`，帮助区分哪个参数是分支名，哪个是路径，但我并未这么使用过，也不确定何时需要这样做。

### 参考日志（reflog）

有很多人把 `reflog` 读作 `re-flog`，而不是 `ref-log`。由于本文已经足够长，我这里不会深入讨论参考日志，但值得注意的是：

  * 在 Git 中，“参考” 是一个泛指分支、标签和 `HEAD` 的术语
  * 参考日志（“reflog”）则为你提供了一个参考历次记录的历史追踪
  * 它是从一些极端困境中拯救出来的利器，比如说你不小心删除了重要的分支
  * 我觉得参考日志是 Git 用户界面中最难懂的部分，我总是试图避免使用它。

### 合并 vs 变基 vs 遴选

有许多人提及他们常常对于合并和变基的区别感到迷惑，并且不理解变基中的“<ruby>基<rt>base</rt></ruby>”指的是什么。

我会在这里尽量简要的进行描述，但是这些一句话的解释最终可能并不那么明了，因为每个人使用合并和变基创建工作流程时的方式差别挺大，要真正理解合并和变基，你必须理解工作流程。此外，有图示会更好理解。不过这个话题可能需要一篇独立的博客文章来完整讨论，所以我不打算深入这个问题。

  * 合并会创建一个新的提交，用来融合两个分支
  * 变基则会逐个地把当前分支上的提交复制到目标分支
  * 遴选跟变基类似，但是语法完全不同（一个显著的差异是变基是从当前分支复制提交，而遴选则会把提交复制到当前分支）

### `rebase --onto`

在 `git rebase` 中，存在一个被称为 `--onto` 的选项。这一直让我感到困惑，因为 `git rebase main` 的核心功能就是将当前分支变基**到** `main` 运行上。那么，额外的 `--onto` 参数又是怎么回事呢？

我进行了一番查找，`--onto` 显然解决了一个我几乎没有或者说从未遇到过的问题，但我还是会记录下我对它的理解。

```
A - B - C (main)
      \
      D - E - F - G (mybranch)
          |
          otherbranch
```

设想一下，出于某种原因，我只想把提交 `F` 和 `G` 变基到 `main` 上。我相信这应该是某些 Git 工作流中会经常遇到的场景。

显然，你可以运行 `git rebase --onto main otherbranch mybranch` 来完成这个操作。对我来说，在这个语法中记住 3 个不同的分支名顺序似乎是不可能的（三个分支名，对我来说实在太多了），但由于我从很多人那里听说过，我想它一定有它的用途。

### 提交

有人提到他们对 Git 中的提交作为一词双义（既作为动词也作为名词）的用法感到困惑。

例如：

  * 动词：“别忘了经常提交”
  * 名词：“`main` 分支上最新的提交”

我觉得大多数人应该能很快适应这个双关的用法，但是在 SQL 数据库中的“提交”用法与 Git 是有所不同，我认为在 SQL 数据库中，“提交”只是作为一个动词（你使用 `COMMIT` 来结束一个事务），并不作为名词。

此外，在 Git 中，你可以从以下三个不同的角度去考虑一个 Git 提交：

  1. 表示当前每个文件状态的**快照**
  2. 与父提交的**差异**
  3. 记录所有先前提交的**历史**

这些理解都是不错的：不同的命令在所有的这些情况下都会使用提交。例如，`git show` 将提交视为一个差异，`git log` 把提交看作是历史，`git restore` 则将提交理解为一个快照。

然而，Git 的术语并无太多助于你理解一个给定的命令正在如何使用提交。

### 更多令人困惑的术语

以下是更多让人觉得混淆的术语。我对许多这些术语的意思并不十分清楚。

我自己也不是很理解的东西：

  * `git pickaxe` （也许这是 `git log -S` 和 `git log -G`，它们用于搜索以前提交的差异？）
  * 子模块（我知道的全部就是它们并不以我想要的方向工作）
  * Git 稀疏检出中的 “cone mode” （没有任何关于这个的概念，但有人提到过）

人们提及觉得混淆，但我在这篇已经 3000 字的文章中略过的东西：

  * blob、tree
  * “合并” 的方向
  * “origin”、“upstream”，“downstream”
  * `push` 和 `pull` 并不是对立面
  * `fetch` 和 `pull` 的关系（pull = fetch + merge）
  * git porcelain
  * 子树
  * 工作树
  * 暂存
  * “master” 或者 “main” （听起来它在 Git 内部有特殊含义，但其实并没有）
  * 何时需要使用 `origin main`（如 `git push origin main`）vs `origin/main`

人们提及感到困惑的 Github 术语：

  * “<ruby>拉取请求<rt>pull request</rt></ruby>” （与 Gitlab 中的 “<ruby>合并请求<rt>merge request</rt></ruby>” 相比，人们似乎认为后者更清晰）
  * “压扁并合并” 和 “变基并合并” 的作用 （在昨天我从未听说过 `git merge --squash`，我一直以为 “压扁并合并” 是 Github 的特殊功能）

### 确实是 “每个 Git 术语”

我惊讶地发现，几乎 Git 的每个其他核心特性都被至少一人提及为某种方式中的困惑。我对听到更多我错过的混淆的 Git 术语的例子也有兴趣。

关于这个，有另一篇很棒的 2012 年的文章叫做《[最困惑的 Git 术语][27]》。它更多的讨论的是 Git 术语与 CVS 和 Subversion 术语的关联。

如果我要选出我觉得最令人困惑的 3 个 Git 术语，我现在会选：

  * `head` 是一个分支，`HEAD` 是当前分支
  * “远程跟踪分支” 和 “跟踪远程的分支” 是不同的事物
  * “索引”、“暂存的”、“已缓存的” 全部指的同一件事

### 就这样了！

在写这些的过程中，我学到了不少东西。我了解到了一些新的关于Git的事实，但更重要的是，现在我对于别人说Git的所有功能和特性都引起困惑有了更深的理解。

许多问题我之前根本没考虑过，比如我从来没有意识到，在讨论分支时，“跟踪”这个词的用法是多么地特别。

另外，尽管我已经尽力做到准确无误，但由于我涉猎到了一些我从未深入探讨过的Git的角落，所以可能还是出现了一些错误。

*（题图：DALL-E/A/e1e5b964-5f32-41bb-811e-8978fb8556d4）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/11/01/confusing-git-terminology/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://social.jvns.ca/@b0rk/111330564535454510
[2]: tmp.MK9dzkPKFA#head-and-heads
[3]: tmp.MK9dzkPKFA#detached-head-state
[4]: tmp.MK9dzkPKFA#ours-and-theirs-while-merging-or-rebasing
[5]: tmp.MK9dzkPKFA#your-branch-is-up-to-date-with-origin-main
[6]: tmp.MK9dzkPKFA#head-head-head-head-head-2-head-2
[7]: tmp.MK9dzkPKFA#and
[8]: tmp.MK9dzkPKFA#can-be-fast-forwarded
[9]: tmp.MK9dzkPKFA#reference-symbolic-reference
[10]: tmp.MK9dzkPKFA#refspecs
[11]: tmp.MK9dzkPKFA#tree-ish
[12]: tmp.MK9dzkPKFA#index-staged-cached
[13]: tmp.MK9dzkPKFA#reset-revert-restore
[14]: tmp.MK9dzkPKFA#untracked-files-remote-tracking-branch-track-remote-branch
[15]: tmp.MK9dzkPKFA#checkout
[16]: tmp.MK9dzkPKFA#reflog
[17]: tmp.MK9dzkPKFA#merge-vs-rebase-vs-cherry-pick
[18]: tmp.MK9dzkPKFA#rebase-onto
[19]: tmp.MK9dzkPKFA#commit
[20]: tmp.MK9dzkPKFA#more-confusing-terms
[21]: https://git-scm.com/docs/gitglossary
[22]: https://nitaym.github.io/ourstheirs/
[23]: https://git-scm.com/docs/git-range-diff
[24]: https://matthew-brett.github.io/pydagogue/pain_in_dots.html
[25]: https://git-scm.com/docs/revisions
[26]: https://gitster.livejournal.com/39629.html
[27]: https://longair.net/blog/2012/05/07/the-most-confusing-git-terminology/
[0]: https://img.linux.net.cn/data/attachment/album/202312/07/200630j90z4xz7tttgztr9.jpg