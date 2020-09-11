[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 best practices for teams using Git)
[#]: via: (https://opensource.com/article/20/7/git-best-practices)
[#]: author: (Ravi Chandran https://opensource.com/users/ravichandran)

团队中使用 Git 的 6 个最佳实践
======

> 采用这些 Git 协作策略，让团队工作更高效。

![技术会议上得女性们][1]

Git 非常有助于小团队管理自身的软件开发进度，但有些方法能让你把它变得更高效。我发现了许多有助于我的团队的最佳实践，尤其是当不同 Git 水平的新人加入时。

### 在你的团队中正式确立 Git 约定

每个人都应当遵循对于分支命名，标记和编码的规范。每个组织都有自己的规范或者最佳实践，并且很多建议都可以从网上免费获取。而重要的是尽早选择合适的规范并在团队中遵循。

同时，不同的团队成员的 Git 水平参差不齐。你需要创建并维护一组符合团队规范的基础指令，用于执行通用 Git 操作。

### 正确地合并变更

每个团队成员都需要在独立的功能分支上开发。但是尽管使用了独立的分支，每个人最终都会修改到一些通用文件。当把更改合并回 `master` 分支时，合并通常无法自动进行。可能需要手动解决不同作者对同一文件不同变更的冲突。这就是你必须学会如何处理 Git 合并技术的原因。

现代编辑器具有协助解决 [Git 合并冲突][2]的功能。Modern editors have features to help with [Git merge conflicts][2]. 它们对同一文件合并的每一个部分提供多种选择，例如，是否保留你的更改，或者是保留另一分支的更改，亦或者是全部保留。如果你的编辑器不支持这些功能，那么可能是时候换一个代码编辑器了。

### 经常重整你的功能分支

当你持续地开发你的功能分支时，请经常对它做 `rebase master`。这意味着要经常执行以下步骤：

```
git checkout master
git pull
git checkout feature-xyz  # 假设的功能分支名称
git rebase master  # 可能需要解决  feature-xyz 上的合并冲突
```

这些步骤会在你的功能分支上[重写历史][3]（这并不是件坏事）。首先，它会使你的功能分支获得 `master` 分支上当前的所有更新。其次，你在功能分支上的所有提交都会在分支历史的顶部重写，因此它们会顺序地出现在日志中。你可能需要一路解决遇到地合并冲突，这也许是个挑战。但是，这是解决冲突最好的时间，因为它只影响你的功能分支。

在解决完所有冲突并进行回归测试后，如果你准备好将功能分支合并回 `master`，那么就可以在再次执行上述的 `rebase` 步骤后进行合并：

```
git checkout master
git pull
git merge feature-xyz
```

在次期间，如果其他人也将和你有冲突的更改推送到 `master`，那么 Git 合并将再次发生冲突。你需要解决它们并重新进行回归测试。

还有一些其他的合并哲学（例如，只使用合并不使用 rebase 以防止重写历史），其中一些甚至可能更简单易用。但是，我发现上述方法是一个干净可靠的策略。提交历史日志将以有意义的功能序列进行排列。

如果使用“纯合并”策略（上面所说的，不定期 rebase），那么 `master` 分支的历史将穿插着所有同时开发的功能的提交。这样混乱的历史很难回顾。确切的提交时间通常并不是那么重要。最好是有一个易于查看的历史日志。

### 在合并前压缩提交

当你在功能分支上开发时，即使再小的修改也可以作为一个 commit。但是，如果每个个功能分支都要产生五十个 commit，那么随着不断地增添新功能，`master` 分支的 commit 数终将无谓地膨胀。通常来说，每个功能分支只应该往 `master` 中增加一个或几个 commit。为此，你需要将多个 commit 压缩成一个或者几个带有更详细信息的提交中。通常使用以下命令来完成：

```
git rebase -i HEAD~20  # 查看可进行压缩的二十个 commit
```

当这条命令执行后，将弹出一个 commit 列表的编辑器，你可以通过包括 _pick_ 或 _squash_ 内的数种方式编辑它。_pick_ 一个 commit 即保留这个 commit。_squash_ 一个 commit 则是将这个 commit 合并到前一个中。使用这些方法，你就可以将多个 commit 合并到一个并做编辑和清理。这也是一个清理不重要的 commit 信息的机会（例如，带错字的提交）。

总之，保留所有与 commit 相关的操作，但在合并到 `master` 分支前，合并并编辑相关信息以明确意图。注意，不要在 rebase 的过程中不小心删掉 commit。

在执行完诸如 rebase 之类的操作后，我会再次看看 `git log` 并做最终的修改：

```
git commit --amend
```

最后，由于重写了分支的 Git 提交历史，必需强制更新远程分支：

```
git push -f
```

### 使用标签

当你完成测试并准备从 `master` 分支部署软件到线上时，又或者当你出于某种原因想要保留当前状态作为一个里程碑时，那么可以创建一个 Git 的标签。对于一个积累了一些变更和相应提交的分支而言，标签就是该分支在那一时刻的快照。一个标签可以看作是没有历史记录的分支，也可以看作是直接指向标签创建前那个提交的命名指针。

配置控制是关于保留各个里程碑上代码的状态。大多数项目都有一个需求，允许重现任一里程碑上的软件源码，以便在需要时重新构建。Git 标签为每个代码的里程碑提供了一个唯一标识。打标签非常简单：

```
git tag milestone-id -m "short message saying what this milestone is about"
git push --tags   # 不要忘记将标签显式推送到远程
```

考虑一种情况，Git 标签对应的软件版本已经分发给客户，而且客户提了个问题。尽管代码库中的代码可能已经继续在开发，但通常情况下为了准确地重现客户问题以便做出修复，必须回退到 Git 标签对应的代码状态。偶尔，新代码已经修复了那个问题，但并非一直如此。通常你需要切换到特定的标签并从那个标签创建一个分支：

```
git checkout milestone-id        # 切换到分发给客户的标签
git checkout -b new-branch-name  # 创建新的分支用于重现 bug
```

此外，如果带注释的标记和带符号的标记有助于你的项目，可以考虑使用它们。

### 让软件运行时打印标签

In most embedded projects, the resulting binary file created from a software build has a fixed name. The Git tag corresponding to the software binary file cannot be inferred from its filename. It is useful to "embed the tag" into the software at build time to correlate any future issues precisely to a given build. Embedding the tag can be automated within the build process. Typically, the tag string `git describe` generates is inserted into the code before code compilation so that the resulting executable will print the tag string while booting up. When a customer reports an issue, they can be guided to send you a copy of the boot output.

### 总结

Git 是一个需要花时间去掌握的复杂工具。使用这些实践可以帮助团队成功地使用 Git 协作，无论他们的知识水平。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/git-best-practices

作者：[Ravi Chandran][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ravichandran
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/christina-wocintechchat-com-rg1y72ekw6o-unsplash_1.jpg?itok=MoIv8HlK (Women in tech boardroom)
[2]: https://opensource.com/article/20/4/git-merge-conflict
[3]: https://opensource.com/article/20/4/git-rebase-i
