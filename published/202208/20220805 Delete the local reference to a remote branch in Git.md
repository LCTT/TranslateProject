[#]: subject: "Delete the local reference to a remote branch in Git"
[#]: via: "https://opensource.com/article/22/8/delete-local-reference-remote-branch-git"
[#]: author: "Agil Antony https://opensource.com/users/agantony"
[#]: collector: "lkxed"
[#]: translator: "Yufei-Yan"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14919-1.html"

删除 Git 远程分支的本地引用
======

![](https://img.linux.net.cn/data/attachment/album/202208/11/150612dv5diwgve5k2cobk.jpg)

> 遵循几个简单的步骤来保持 Git 仓库的整洁

在合并一个 GibLab 的合并请求（MR）或 GitHub 的拉取请求（PR）后，你通常需要从远程仓库中删掉这个主题分支来保持仓库的整洁。然而，这只会删掉远程仓库的主题分支。本地 Git 仓库也会从例行清理中收益。

要同步本地仓库和远程仓库的信息，可以执行 `git prune` 命令来删除本地仓库中远程分支的本地引用。

按照以下三个简单的步骤：

1、检出仓库中的核心分支（比如 `main` 或者 `master`）：

```
$ git checkout <central_branch_name>
```

2、列出所有远程和本地分支：

```
$ git branch -a
```

示例输出：

```
4.10.z
* master
  remotes/mydata/4.9-stage
  remotes/mydata/4.9.z
  remotes/mydata/test-branch
```

在这个例子中，`test-branch` 是从远程仓库中删除的主题分支的名字。

3、删除远程分支的本地引用：

首先，列出所有可以从本地仓库中删除的分支：

```
$ git remote prune origin --dry-run
```

示例输出：

```
Pruning origin
URL: git@example.com:myorg/mydata-4.10.git
* [would prune] origin/test-branch
```

然后，删除远程分支的本地引用：

```
$ git remote prune origin
```

示例输出：

```
Pruning origin
URL: git@example.com:myorg/mydata-4.10.git
* [pruned] origin/test-branch
```

就是这样！

### 维护 Git 仓库

保持 Git 仓库的整洁，一开始似乎并不紧急，但是随着仓库规模的增长，删除不必要的数据就变得更为重要。不要让从无用的数据筛选而拖慢你。

经常删除远程分支的本地引用，是维护一个可用的 Git 仓库是一个好方法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/delete-local-reference-remote-branch-git

作者：[Agil Antony][a]
选题：[lkxed][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/agantony
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/freesoftwareway_law3.png
