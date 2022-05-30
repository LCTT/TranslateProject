[#]: subject: "How to rename a branch, delete a branch, and find the author of a branch in Git"
[#]: via: "https://opensource.com/article/22/5/git-branch-rename-delete-find-author"
[#]: author: "Agil Antony https://opensource.com/users/agantony"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14635-1.html"

Git 教程：重命名分支、删除分支、查看分支作者
======

![](https://img.linux.net.cn/data/attachment/album/202205/25/161618nt30jqe10nqtlzlj.jpg)

> 掌握管理本地/远程分支等最常见的 Git 任务。

Git 的主要优势之一就是它能够将工作“分叉”到不同的分支中。

如果只有你一个人在使用某个存储库，分支的好处是有限的。但是，一旦你开始与许多其他贡献者一起工作，分支就变得必不可少。Git 的分支机制允许多人同时处理一个项目，甚至是同一个文件。用户可以引入不同的功能，彼此独立，然后稍后将更改合并回主分支。那些专门为一个目的创建的分支，有时也被称为<ruby>主题分支<rt>topic branch</rt></ruby>，例如添加新功能或修复已知错误。

当你开始使用分支，了解如何管理它们会很有帮助。以下是开发者在现实世界中使用 Git 分支执行的最常见任务。

### 重命名分支

有时候，你或许会错误地命名了一个分支，或者你会想要在内容合并到主分支后，使用同一个分支在不同的错误或任务之间切换。在这种情况下，重命名主题分支就会很有帮助。

#### 重命名本地分支

1、重命名本地分支：

```
$ git branch -m <old_branch_name> <new_branch_name>
```

当然，这只会重命名你的分支副本。如果远程 Git 服务器上存在该分支，请继续执行后续步骤。

2、推送这个新分支，从而创建一个新的远程分支：

```
$ git push origin <new_branch_name>
```

3、删除旧的远程分支：

```
$ git push origin -d -f <old_branch_name>
```

#### 重命名当前分支

当你要重命名的分支恰好是当前分支时，你不需要指定旧的分支名称。

1、重命名当前分支：

```
$ git branch -m <new_branch_name>
```

2、推送新分支，从而创建一个新的远程分支：

```
$ git push origin <new_branch_name>
```

3、删除旧的远程分支：

```
$ git push origin -d -f <old_branch_name>
```

### 使用 Git 删除本地和远程分支

为了保持存储库的整洁，通常建议你在确保已将内容合并到主分支后，删除临时分支。

#### 删除本地分支

删除本地分支只会删除系统上存在的该分支的副本。如果分支已经被推送到远程存储库，它仍然可供使用该存储库的每个人使用。

1、签出存储库的主分支（例如 `main` 或 `master`）：

```
$ git checkout <central_branch_name>
```

2、列出所有分支（本地和远程）：

```
$ git branch -a
```

3、删除本地分支：

```
$ git branch -d <name_of_the_branch>
```

要删除所有本地主题分支并仅保留 `main` 分支：

```
$ git branch | grep -v main | xargs git branch -d
```

#### 删除远程分支

删除远程分支只会删除远程服务器上存在的该分支的副本。如果你想撤销删除，也可以将其重新推送到远程（例如 GitHub），只要你还有本地副本即可。

1、签出存储库的主分支（通常是 `main` 或 `master`）：

```
$ git checkout <central_branch_name>
```

2、列出所有分支（本地和远程）：

```
$ git branch -a
```

3、删除远程分支：

```
$ git push origin -d <name_of_the_branch>
```

### 查看远程主题分支的作者

如果你是存储库管理员，你可能会有这个需求，以便通知未使用分支的作者它将被删除。

1、签出存储库的主分支（例如 `main` 或 `master`）：

```
$ git checkout <central_branch_name>
```

2、删除不存在的远程分支的分支引用：

```
$ git remote prune origin
```

3、列出存储库中所有远程主题分支的作者，使用 `--format` 选项，并配合特殊的选择器来只打印你想要的信息（在本例中，`%(authorname)` 和 `%(refname)` 分别代表作者名字和分支名称）：

```
$ git for-each-ref --sort=authordate --format='%(authorname) %(refname)' refs/remotes
```

示例输出：

```
tux  refs/remotes/origin/dev
agil refs/remotes/origin/main
```

你可以添加更多格式，包括颜色编码和字符串操作，以便于阅读：

```
$ git for-each-ref --sort=authordate \
    --format='%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)%(align:25,left)%(color:yellow) %(authorname)%(end)%(color:reset)%(refname:strip=3)' \
    refs/remotes
```

示例输出：

```
01/16/2019 03:18 PM tux      dev
05/15/2022 10:35 PM agil     main
```

你可以使用 `grep` 获取特定远程主题分支的作者：

```
$ git for-each-ref --sort=authordate \
    --format='%(authorname) %(refname)' \
    refs/remotes | grep <topic_branch_name>
```

### 熟练运用分支

Git 分支的工作方式存在细微差别，具体取决于你想要分叉代码库的位置、存储库维护者如何管理分支、<ruby>压扁<rt>squashing</rt></ruby>、<ruby>变基<rt>rebasing</rt></ruby>等。若想进一步了解该主题，你可以阅读下面这三篇文章：

* [《用乐高来类比解释 Git 分支》][4]，作者：Seth Kenlon
* [《我的 Git push 命令的安全使用指南》][5]，作者：Noaa Barki
* [《Git 分支指南》][6]，作者：Kedar Vijay Kulkarni

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/git-branch-rename-delete-find-author

作者：[Agil Antony][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/agantony
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/tree-branches.jpg
[2]: https://www.flickr.com/photos/22244945@N00/3353319002
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/22/4/git-branches
[5]: https://opensource.com/article/22/4/git-push
[6]: https://opensource.com/article/18/5/git-branching
