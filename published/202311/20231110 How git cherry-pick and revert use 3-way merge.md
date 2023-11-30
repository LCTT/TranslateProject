[#]: subject: "How git cherry-pick and revert use 3-way merge"
[#]: via: "https://jvns.ca/blog/2023/11/10/how-cherry-pick-and-revert-work/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16378-1.html"

Git 的遴选和撤销操作是如何利用三路合并的
======

![][0]

大家好！几天前，我尝试向其他人解释 Git 遴选（`git cherry-pick`）的工作原理，结果发现自己反而更混淆了。

我原先以为 Git 遴选是简单地应用一个补丁，但当我真正这样尝试时，却未能成功！

因此，接下来我们将谈论我原来以为的遴选操作（即应用一个补丁），这个理解为何不准确，以及实际上它是如何执行的（进行“三路合并”）。

尽管本文的内容有些深入，但你并不需要全部理解才能有效地使用 Git。不过，如果你（和我一样）对 Git 的内部运作感到好奇，那就跟我一起深入探讨一下吧！

### 遴选操作并不只是应用一个补丁

我先前理解的 `git cherry-pick COMMIT_ID` 的步骤如下：

* 首先是计算 `COMMIT_ID` 的差异，就如同执行 `git show COMMIT_ID --patch > out.patch` 这个命令
* 然后是将补丁应用到当前分支，就如同执行 `git apply out.patch` 这个命令

在我们详细讨论之前，我想指出的是，虽然大部分情况下这个模型是正确的，如果这是你的认知模型，那就没有问题。但是在一些细微的地方，它可能会错，我觉得这个疑惑挺有意思的，所以我们来看看它究竟是如何运作的。

如果我在存在合并冲突的情况下尝试进行“计算差异并应用补丁”的操作，下面我们就看看具体会发生什么情况：

```
$ git show 10e96e46 --patch > out.patch
$ git apply out.patch
error: patch failed: content/post/2023-07-28-why-is-dns-still-hard-to-learn-.markdown:17
error: content/post/2023-07-28-why-is-dns-still-hard-to-learn-.markdown: patch does not apply
```

这一过程无法成功完成，它并未提供任何解决冲突或处理问题的方案。

而真正运行 `git cherry-pick` 时的实际情况却大为不同，我遭遇到了一处合并冲突:

```
$ git cherry-pick 10e96e46
error: could not apply 10e96e46... wip
hint: After resolving the conflicts, mark them with
hint: "git add/rm <pathspec>", then run
hint: "git cherry-pick --continue".
```

因此，看起来 “Git 正在应用一个补丁”这样的理解方式并不十分准确。但这里的错误信息确实标明了 “无法**应用** 10e96e46”，这么看来，这种理解又不完全是错的。这到底是怎么回事呢？

### 那么，遴选到底是怎么执行的呢？

我深入研究了 Git 的源代码，主要是想了解 `cherry-pick` 是如何工作的，最终我找到了 [这一行代码][1]：

```
res = do_recursive_merge(r, base, next, base_label, next_label, &head, &msgbuf, opts);
```

所以，遴选实际上就是一种……合并操作？这有些出乎意料。那具体都合并了什么内容？如何执行这个合并操作的呢？

我意识到我对 Git 的合并操作并不是特别理解，于是我上网搜索了一下。结果发现 Git 实际上采用了一种被称为 “三路合并” 的合并方式。那这到底是什么含义呢？

### Git 的合并策略：三路合并

假设我要合并下面两个文件，我们将其分别命名为 `v1.py` 和 `v2.py`。

```
def greet():
    greeting = "hello"
    name = "julia"
    return greeting + " " + name
```

```
def say_hello():
    greeting = "hello"
    name = "aanya"
    return greeting + " " + name
```

在这两个文件间，存在两处不同：

  * `def greet()` 和 `def say_hello`
  * `name = "julia"` 和 `name = "aanya"`

我们应该选择哪个呢？看起来好像不可能有答案！

不过，如果我告诉你，原始的函数（我们称之为 `base.py`）是这样的：

```
def say_hello():
    greeting = "hello"
    name = "julia"
    return greeting + " " + name
```

一切似乎变得清晰许多！在这个基础上，`v1` 将函数的名字更改为 `greet`，`v2` 将 `name = "aanya"`。因此，合并时，我们应该同时做出这两处改变：

```
def greet():
    greeting = "hello"
    name = "aanya"
    return greeting + " " + name
```

我们可以命令 Git 使用 `git merge-file` 来完成这次合并，结果正是我们预期的：它选择了 `def greet()` 和 `name = "aanya"`。

```
$ git merge-file v1.py base.py v2.py -p
def greet():
    greeting = "hello"
    name = "aanya"
    return greeting + " " + name⏎
```

这种将两个文件与其原始版本进行合并的方式，被称为 **三路合并**。

如果你想在线上试一试，我在 [jvns.ca/3-way-merge/][2] 创建了一个小实验场。不过我只是草草制作，所以可能对移动端并不友好。

### Git 合并的是更改，而非文件

我对三路合并的理解是 —— Git 合并的是**更改**，而不是文件。我们对同一个文件做出两种不同的更改，Git 试图以合理的方式将这两种更改结合到一起。当两个更改都对同一行进行操作时，Git 可能会遇到困难，此时就会产生合并冲突。

Git 也可以合并超过两处的更改：你可以对同一文件有多达 8 处不同的更改，Git 会尝试将所有更改协调一致。这被称为八爪鱼合并，但除此之外我对其并不了解，因为我从未执行过这样的操作。

### Git 如何使用三路合并来应用补丁

接下来，让我们进入到一个有些出乎意料的情境！当我们讨论 Git “应用补丁”（如在变基 —— `rebase`、撤销 —— `revert` 或遴选 —— `cherry-pick` 中所做的）时，其实并非是生成一个补丁文件并应用它。相反，实际执行的是一次三路合并。

下面是如何将提交 `X` 作为补丁应用到你当前的提交，并与之前的 `v1`、`v2` 和 `base` 设置相对应：

  1. **在你当前提交中**，文件的版本是 `v1`。
  2. **在提交 X 之前**，文件的版本是 `base`。
  3. **在提交 X 中**，文件的版本是 `v2`。
  4. 执行 `git merge-file v1 base v2` 以合并它们（实际上，Git 并不直接执行 `git merge-file`，而是运行一个实现这个功能的 C 函数）。

总的来说，你可以将 `base` 和 `v2` 视为“补丁”，它们之间的差异就是你想要应用到 `v1` 上的更改。

### 遴选如何运作

假设我们有如下提交图，并且我们打算在 `main` 分支上遴选提交 `Y`：

```
A - B (main)
  \ 
   \ 
    X - Y - Z
```

那么，如何将此情景转化为我们前面提过的 `v1`、`v2` 和 `base` 组成的三路合并呢？

  * `B` 是 `v1`
  * `X` 是 `base`，而 `Y` 是 `v2`

所以，`X` 和 `Y` 共同构成了这个“补丁”。

其实，`git rebase` 无非就是重复多次执行 `git cherry-pick` 的过程。

### 撤销如何运作

现在，假如我们希望在如下的提交图上执行 `git revert Y`：

```
X - Y - Z - A - B
```

  * `B` 是 `v1`
  * `Y` 是 `base`，而 `X` 是 `v2`

这个过程反映的实际上就是遴选的情况，不过 `X` 和 `Y` 的位置颠倒了。我们需要这样做因为我们期望生成一个“反向补丁”。在 Git 中，撤销和遴选关系如此的紧密，它们甚至在同一个文件中实现：[revert.c][3]。

### “三路补丁”是一个非常棒的技巧

使用三路合并将提交作为补丁应用的这个技巧非常巧妙且酷炫，我很惊讶之前从未听说过！我并未听过一个特定的名字来描述这种方法，但我更倾向于称之为“三路补丁”。

“三路补丁”的理念在于，你可以通过两个文件来定义补丁：在应用补丁前后的文件（在我们这篇文章中称之为 `base` 和 `v2`）。

因此，总体来看有三个文件被涉及到：一个是原文件，另外两个构成了补丁。

最重要的是，与普通补丁相比，三路补丁是一个更加高效的补丁方案，因为在有两个完整文件的情况下，你拥有更丰富的上下文信息来进行合并。

以下是我们例子中的常规补丁的大致情况：

```
@@ -1,1 +1,1 @@:
- def greet():
+ def say_hello():
    greeting = "hello"
```

而下面这就是一个三路补丁。不过，需要提醒的是这个“三路补丁”并不是一个真正的文件格式，这只是我自己提出的一种概念。

```
BEFORE: (the full file)
def greet():
    greeting = "hello"
    name = "julia"
    return greeting + " " + name
AFTER: (the full file)
def say_hello():
    greeting = "hello"
    name = "julia"
    return greeting + " " + name
```

### 《Building Git》 中提到了这点

James Coglan 的书籍 [《Building Git》][4] 是我在 Git 源码之外唯一找到的地方，他解释了 `git cherry-pick` 是如何在底层运用三路合并的（我原以为《Pro Git》可能会提及这个，但我并没能找到此话题的内容）。

我购买完这本书后发现，我早在 2019 年时就已经买过了，这对我来说真的是个很好的参考。

### Git 中的合并实际上比这更复杂

在 Git 中，合并不限于三路合并 —— 还有一种我不太理解的叫做“递归合并”，还有许多具体处理文件删除和移动的细节，同时也有多种合并算法。

如果想要了解更多相关知识，我最好的建议是阅读《Building Git》，尽管我还未完全阅读这本书。

### Git 应用到底做了什么？

我也参阅了 Git 的源代码，试图理解 `git apply` 的功能。它似乎（不出意外地）在 `apply.c` 中实现。这段代码解析了一个补丁文件，并通入目标文件来寻找应该在何处应用补丁。核心逻辑似乎在 [这里][5]：思路好像是从补丁建议的行数开始，然后向前向后找寻。

```
	/*
	 * There's probably some smart way to do this, but I'll leave
	 * that to the smart and beautiful people. I'm simple and stupid.
	 */
	backwards = current;
	backwards_lno = line;
	forwards = current;
	forwards_lno = line;
	current_lno = line;
for (i = 0; ; i++) {
     ...
```

这个处理过程不禁让人觉得非常直白、与之前的期望相符。

### Git 三路应用的工作方式

`git apply` 命令中也有一个 `--3way` 参数，可以实现三路合并。因此，我们实际上可以通过如下方式，使用 `git apply` 来大体实现 `git cherry-pick` 的功能：

```
$ git show 10e96e46 --patch > out.patch
$ git apply out.patch --3way
Applied patch to 'content/post/2023-07-28-why-is-dns-still-hard-to-learn-.markdown' with conflicts.
U content/post/2023-07-28-why-is-dns-still-hard-to-learn-.markdown
```

但要注意，参数 `--3way` 并不只用到了补丁文件的内容！补丁文件开始的部分是:

```
index d63ade04..65778fc0 100644
```

`d63ade04` 和 `65778fc0` 是旧/新文件版本在 Git 对象数据库中的 ID，因此 Git 可以用这些 ID 来执行三路补丁操作。但如果有人将补丁文件通过邮件发送给你，而你并没有新/旧版本的文件，就无法执行这个操作：如果你缺少 blob，将会出现如下错误：

```
$ git apply out.patch
error: repository lacks the necessary blob to perform 3-way merge.
```

### 三路合并有点历史了

有一部分人指出，三路合并比 Git 的历史还要久远，它起源于 70 年代末期左右。有一篇 2007 年的 [论文][5A] 对此进行了讨论。

### 就说这么多！

我真的对于我对于 Git 内部应用补丁的核心方法其实理解得并不深入这一点感到非常吃惊——学习这一点真的很酷！

虽然我对 Git 用户界面存在 [诸多不满][6]，但是这个特定问题并不包含在内。三路合并似乎是统一解决一系列不同问题的优雅方式，它对于人们来说也很直观（“应用一个补丁”这个想法是许多编程者都习以为常的思考模式，而它底层实现为三路合并的细节，实际上没有人真正需要去思考）。

*我顺便快速推荐一下：我正在写一部有关 Git 的 [zine][7]，如果你对它的发布感兴趣，你可以注册我非常不频繁的 [公告邮件列表][8]。*

*（题图：MJ/321bc2c9-4363-4661-802a-c74fb6a721b2）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/11/10/how-cherry-pick-and-revert-work/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/git/git/blob/dadef801b365989099a9929e995589e455c51fed/sequencer.c#L2353-L2358
[2]: https://jvns.ca/3-way-merge/
[3]: https://github.com/git/git/blob/dadef801b365989099a9929e995589e455c51fed/builtin/revert.c
[4]: https://shop.jcoglan.com/building-git/
[5]: https://github.com/git/git/blob/dadef801b365989099a9929e995589e455c51fed/apply.c#L2684
[5A]: https://www.cis.upenn.edu/~bcpierce/papers/diff3-short.pdf
[6]: https://jvns.ca/blog/2023/11/01/confusing-git-terminology/
[7]: https://wizardzines.com
[8]: https://wizardzines.com/zine-announcements/
[0]: https://img.linux.net.cn/data/attachment/album/202311/14/103134uddjt7ljl8dbbdj2.png