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

### 在合并前整理提交

When working on your feature branch, it's fine to add a commit for even minor changes. However, if every feature branch produced 50 commits, the resulting number of commits in the `master` branch could grow unnecessarily large as features are added. In general, there should only be one or a few commits added to `master` from each feature branch. To achieve this, _squash_ multiple commits into one or a handful of commits with more elaborate messages for each one. This is typically done using a command such as:

```
`git rebase -i HEAD~20  # look at up to 20 commits to consider squashing`
```

When this is executed, an editor pops up with a list of commits that you can act upon in several ways, including _pick_ or _squash_. Picking a commit means keeping that commit message. Squashing implies combining that commit's message into the previous commit. Using these and other options, you can combine commit messages into one and do some editing and cleanup. It's also an opportunity to get rid of the commit messages that aren't important (e.g., a commit message about fixing a typo).

In summary, keep all the actions associated with the commits, but combine and edit the associated message text for improved clarity before merging into `master`. Don't inadvertently drop a commit during the rebase process.

After performing such a rebase, I like to look at the `git log` one last time to make final edits:

```
`git commit --amend`
```

Finally, forcing an update to your remote feature branch is necessary, since the Git commit history for the branch has been rewritten:

```
`git push -f`
```

### 使用标签

After you have finished testing and are ready to deploy the software from the `master` branch, or if you want to preserve the current state as a significant milestone for any other reason, create a Git tag. While a branch accumulates a history of changes corresponding to commits, a tag is a snapshot of the branch's state at that instant. A tag can be thought of as a history-less branch or as a named pointer to a specific commit immediately before the tag was created.

Configuration control is about preserving the state of code at various milestones. Being able to reproduce software source code for any milestone so that it can be rebuilt when necessary is a requirement in most projects. A Git tag provides a unique identifier for such a code milestone. Tagging is straightforward:

```
git tag milestone-id -m "short message saying what this milestone is about"
git push --tags   # don't forget to explicitly push the tag to the remote
```

Consider a scenario where software corresponding to a given Git tag is distributed to a customer, and the customer reports an issue. While the code in the repository may continue to evolve, it's often necessary to go back to the state of the code corresponding to the Git tag to reproduce the customer issue precisely to create a bug fix. Sometimes newer code may have already fixed the issue but not always. Typically, you'd check out the specific tag and create a branch from that tag:

```
git checkout milestone-id        # checkout the tag that was distributed to the customer
git checkout -b new-branch-name  # create new branch to reproduce the bug
```

Beyond this, consider using annotated tags and signed tags if they may be beneficial to your project.

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
