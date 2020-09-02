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

Everyone should follow standard conventions for branch naming, tagging, and coding. Every organization has standards or best practices, and many recommendations are freely available on the internet. What's important is to pick a suitable convention early on and follow it as a team.

Also, different team members will have different levels of expertise with Git. You should create and maintain a basic set of instructions for performing common Git operations that follow the project's conventions.

### 正确地合并变更

Each team member should work on a separate feature branch. But even when separate branches are used, everyone eventually modifies some common files. When merging the changes back into the `master` branch, the merge typically will not be automatic. Human intervention may be needed to reconcile different changes made by two authors to the same file. This is where you have to learn to deal with Git merge techniques.

Modern editors have features to help with [Git merge conflicts][2]. They indicate various options for a merge in each part of a file, such as whether to keep your changes, the other branch's changes, or both. It may be time to pick a different code editor if yours doesn't support such capabilities.

### 经常重整你的功能分支

As you continue to develop your feature branch, rebase it against `master` often. This means executing the following steps regularly:

```
git checkout master
git pull
git checkout feature-xyz  # name of your hypothetical feature branch
git rebase master  # may need to fix merge conflicts in feature-xyz
```

These steps [rewrite history][3] in your feature branch (and that's not a bad thing). First, it makes your feature branch look like `master` with all the updates made to `master` up to that point. Then all your commits to the feature branch are replayed on top, so they appear sequentially in the Git log. You may get merge conflicts that you'll need to resolve along the way, which can be a challenge. However, this is the best point to deal with merge conflicts because it only impacts your feature branch.

After you fix any conflicts and perform regression testing, if you're ready to merge your feature back into `master`, do the above rebase steps one more time, then perform the merge:

```
git checkout master
git pull
git merge feature-xyz
```

In the interim, if someone else pushes changes to `master` that conflict with yours, the Git merge will have conflicts again. You'll need to resolve them and repeat the regression testing.

There are other merge philosophies (e.g., without rebasing and only using merge to avoid rewriting history), some of which may even be simpler to use. However, I've found the approach above to be a clean and reliable strategy. The commit history is stacked up as a meaningful sequence of features.

With "pure merge" strategies (without rebasing regularly, as suggested above), the history in the `master` branch will be interspersed with the commits from all the features being developed concurrently. Such a mixed-up history is harder to review. The exact commit times are usually not that important. It's better to have a history that's easier to review.

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
