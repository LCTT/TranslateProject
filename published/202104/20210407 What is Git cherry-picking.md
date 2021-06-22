[#]: subject: (What is Git cherry-picking?)
[#]: via: (https://opensource.com/article/21/4/cherry-picking-git)
[#]: author: (Rajeev Bera https://opensource.com/users/acompiler)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13295-1.html)

什么是 Git 遴选（cherry-pick）？
======

> 了解 `git cherry-pick` 命令是什么，为什么用以及如何使用。

![](https://img.linux.net.cn/data/attachment/album/202104/14/131735o63v3ow6y2wc281o.jpg)

当你和一群程序员一起工作时，无论项目大小，处理多个 Git 分支之间的变更都会变得很困难。有时，你不想将整个 Git 分支合并到另一个分支，而是想选择并移动几个特定的提交。这个过程被称为 “<ruby>遴选<rt>cherry-pick</rt></ruby>”。

本文将介绍“遴选”是什么、为何使用以及如何使用。

那么让我们开始吧。

### 什么是遴选？

使用遴选（`cherry-pick`）命令，Git 可以让你将任何分支中的个别提交合并到你当前的 [Git HEAD][2] 分支中。

当执行 `git merge` 或者 `git rebase` 时，一个分支的所有提交都会被合并。`cherry-pick` 命令允许你选择单个提交进行整合。

### 遴选的好处

下面的情况可能会让你更容易理解遴选功能。

想象一下，你正在为即将到来的每周冲刺实现新功能。当你的代码准备好了，你会把它推送到远程分支，准备进行测试。

然而，客户并不是对所有修改都满意，要求你只呈现某些修改。因为客户还没有批准下次发布的所有修改，所以 `git rebase` 不会有预期的结果。为什么会这样？因为 `git rebase` 或者 `git merge` 会把上一个冲刺的每一个调整都纳入其中。

遴选就是答案！因为它只关注在提交中添加的变更，所以遴选只会带入批准的变更，而不添加其他的提交。

还有其他几个原因可以使用遴选：

  * 这对于 bug 修复是必不可少的，因为 bug 是出现在开发分支中对应的提交的。
  * 你可以通过使用 `git cherry-pick` 来避免不必要的工作，而不用使用其他选项例如 `git diff` 来应用特定变更。
  * 如果因为不同 Git 分支的版本不兼容而无法将整个分支联合起来，那么它是一个很有用的工具。

### 使用 cherry-pick 命令

在 `cherry-pick` 命令的最简单形式中，你只需使用 [SHA][3] 标识符来表示你想整合到当前 HEAD 分支的提交。

要获得提交的哈希值，可以使用 `git log` 命令：

```
$ git log --oneline
```

当你知道了提交的哈希值后，你就可以使用 `cherry-pick` 命令。

语法是：

```
$ git cherry-pick <commit sha>
```

例如：

```
$ git cherry-pick 65be1e5
```

这将会把指定的修改合并到当前已签出的分支上。

如果你想做进一步的修改，也可以让 Git 将提交的变更内容添加到你的工作副本中。

语法是：

```
$ git cherry-pick <commit sha> --no-commit
```

例如：

```
$ git cherry-pick 65be1e5 --no-commit
```

如果你想同时选择多个提交，请将它们的提交哈希值用空格隔开：

```
$ git cherry-pick hash1 hash3
```

当遴选提交时，你不能使用 `git pull` 命令，因为它能获取一个仓库的提交**并**自动合并到另一个仓库。`cherry-pick` 是一个专门不这么做的工具；另一方面，你可以使用 `git fetch`，它可以获取提交，但不应用它们。毫无疑问，`git pull` 很方便，但它不精确。

### 自己尝试

要尝试这个过程，启动终端并生成一个示例项目：

```
$ mkdir fruit.git
$ cd fruit.git
$ git init .
```

创建一些数据并提交：

```
$ echo "Kiwifruit" > fruit.txt
$ git add fruit.txt
$ git commit -m 'First commit'
```

现在，通过创建一个项目的复刻来代表一个远程开发者：

```
$ mkdir ~/fruit.fork
$ cd !$
$ echo "Strawberry" >> fruit.txt
$ git add fruit.txt
$ git commit -m 'Added a fruit"
```

这是一个有效的提交。现在，创建一个不好的提交，代表你不想合并到你的项目中的东西：

```
$ echo "Rhubarb" >> fruit.txt
$ git add fruit.txt
$ git commit -m 'Added a vegetable that tastes like a fruit"
```

返回你的仓库，从你的假想的开发者那里获取提交的内容：

```
$ cd ~/fruit.git
$ git remote add dev ~/fruit.fork
$ git fetch dev
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 6 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (6/6), done...
```

```
$ git log –oneline dev/master
e858ab2 Added a vegetable that tastes like a fruit
0664292 Added a fruit
b56e0f8 First commit
```

你已经从你想象中的开发者那里获取了提交的内容，但你还没有将它们合并到你的版本库中。你想接受第二个提交，但不想接受第三个提交，所以使用 `cherry-pick`。

```
$ git cherry-pick 0664292
```

第二次提交现在在你的仓库里了：

```
$ cat fruit.txt
Kiwifruit
Strawberry
```

将你的更改推送到远程服务器上，这就完成了！

### 避免使用遴选的原因

在开发者社区中，通常不鼓励所以遴选。主要原因是它会造成重复提交，而你也失去了跟踪你的提交历史的能力。

如果你不按顺序地遴选了大量的提交，这些提交会被记录在你的分支中，这可能会在 Git 分支中导致不理想的结果。

遴选是一个强大的命令，如果没有正确理解可能发生的情况，它可能会导致问题。不过，当你搞砸了，提交到错误的分支时，它可能会救你一命（至少是你当天的工作）。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/cherry-picking-git

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/pictures/cherry-picking-recipe-baking-cooking.jpg?itok=XVwse6hw (Measuring and baking a cherry pie recipe)
[2]: https://acompiler.com/git-head/
[3]: https://en.wikipedia.org/wiki/Secure_Hash_Algorithms
