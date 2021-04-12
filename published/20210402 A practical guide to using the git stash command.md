[#]: subject: (A practical guide to using the git stash command)
[#]: via: (https://opensource.com/article/21/4/git-stash)
[#]: author: (Ramakrishna Pattnaik https://opensource.com/users/rkpattnaik780)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13293-1.html)

git stash 命令实用指南
======

> 学习如何使用 `git stash` 命令，以及何时应该使用它。

![](https://img.linux.net.cn/data/attachment/album/202104/12/232830chuyr6lkzevrfuzr.jpg)

版本控制是软件开发人员日常生活中不可分割的一部分。很难想象有哪个团队在开发软件时不使用版本控制工具。同样也很难想象有哪个开发者没有使用过（或没有听说过）Git。在 2018 年 Stackoverflow 开发者调查中，74298 名参与者中有 87.2% 的人 [使用 Git][2] 进行版本控制。

Linus Torvalds 在 2005 年创建了 Git 用于开发 Linux 内核。本文将介绍 `git stash` 命令，并探讨一些有用的暂存变更的选项。本文假定你对 [Git 概念][3] 有基本的了解，并对工作树、暂存区和相关命令有良好的理解。

### 为什么 git stash 很重要？

首先要明白为什么在 Git 中暂存变更很重要。假设 Git 没有暂存变更的命令。当你正在一个有两个分支（A 和 B）的仓库上工作时，这两个分支已经分叉了一段时间，并且有不同的头。当你正在处理 A 分支的一些文件时，你的团队要求你修复 B 分支的一个错误。你迅速将你的修改保存到 A 分支（但没有提交），并尝试用 `git checkout B` 来签出 B 分支。Git 会立即中止了这个操作，并抛出错误：“你对以下文件的本地修改会被该签出覆盖……请在切换分支之前提交你的修改或将它们暂存起来。”

在这种情况下，有几种方法可以启用分支切换：

  * 在分支 A 中创建一个提交，提交并推送你的修改，以修复 B 中的错误，然后再次签出 A，并运行 `git reset HEAD^` 来恢复你的修改。
  * 手动保留不被 Git 跟踪的文件中的改动。

第二种方法是个馊主意。第一种方法虽然看起来很传统，但却不太灵活，因为保存未完成工作的修改会被当作一个检查点，而不是一个仍在进行中的补丁。这正是设计 `git stash` 的场景。

`git stash` 将未提交的改动保存在本地，让你可以进行修改、切换分支以及其他 Git 操作。然后，当你需要的时候，你可以重新应用这些存储的改动。暂存是本地范围的，不会被 `git push` 推送到远程。

### 如何使用 git stash

下面是使用 `git stash` 时要遵循的顺序：

  1. 将修改保存到分支 A。
  2. 运行 `git stash`。
  3. 签出分支 B。
  4. 修正 B 分支的错误。
  5. 提交并（可选）推送到远程。
  6. 查看分支 A
  7. 运行 `git stash pop` 来取回你的暂存的改动。

`git stash` 将你对工作目录的修改存储在本地（在你的项目的 `.git` 目录内，准确的说是 `/.git/refs/stash`），并允许你在需要时检索这些修改。当你需要在不同的上下文之间切换时，它很方便。它允许你保存以后可能需要的更改，是让你的工作目录干净同时保持更改完整的最快方法。

### 如何创建一个暂存

暂存你的变化的最简单的命令是 `git stash`：

```
$ git stash
Saved working directory and index state WIP on master; d7435644 Feat: configure graphql endpoint
```

默认情况下，`git stash` 存储（或称之为“暂存”）未提交的更改（已暂存和未暂存的文件），并忽略未跟踪和忽略的文件。通常情况下，你不需要暂存未跟踪和忽略的文件，但有时它们可能会干扰你在代码库中要做的其他事情。

你可以使用附加选项让 `git stash` 来处理未跟踪和忽略的文件：

  * `git stash -u` 或 `git stash --includ-untracked` 储存未追踪的文件。
  * `git stash -a` 或 `git stash --all` 储存未跟踪的文件和忽略的文件。

要存储特定的文件，你可以使用 `git stash -p` 或 `git stash -patch` 命令：

```
$ git stash --patch
diff --git a/.gitignore b/.gitignore
index 32174593..8d81be6e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -3,6 +3,7 @@
 # dependencies
 node_modules/
 /.pnp
+f,fmfm
 .pnp.js

 # testing
(1/1) Stash this hunk [y,n,q,a,d,e,?]?
```

### 列出你的暂存

你可以用 `git stash list` 命令查看你的暂存。暂存是后进先出（LIFO）方式保存的：

```
$ git stash list
stash@{0}: WIP on master: d7435644 Feat: configure graphql endpoint
```

默认情况下，暂存会显示在你创建它的分支和提交的顶部，被标记为 `WIP`。然而，当你有多个暂存时，这种有限的信息量并没有帮助，因为很难记住或单独检查它们的内容。要为暂存添加描述，可以使用命令 `git stash save <description>`：

```
$ git stash save "remove semi-colon from schema"
Saved working directory and index state On master: remove semi-colon from schema

$ git stash list
stash@{0}: On master: remove semi-colon from schema
stash@{1}: WIP on master: d7435644 Feat: configure graphql endpoint
```

### 检索暂存起来的变化

你可以用 `git stash apply` 和 `git stash pop` 这两个命令来重新应用暂存的变更。这两个命令都会重新应用最新的暂存（即 `stash@{0}`）中的改动。`apply` 会重新应用变更；而 `pop` 则会将暂存的变更重新应用到工作副本中，并从暂存中删除。如果你不需要再次重新应用被暂存的更改，则首选 `pop`。

你可以通过传递标识符作为最后一个参数来选择你想要弹出或应用的储藏：

```
$ git stash pop stash@{1}
```

或

```
$ git stash apply stash@{1}
```

### 清理暂存

删除不再需要的暂存是好的习惯。你必须用以下命令手动完成：

  * `git stash clear` 通过删除所有的暂存库来清空该列表。
  * `git stash drop <stash_id>` 从暂存列表中删除一个特定的暂存。

### 检查暂存的差异

命令 `git stash show <stash_id>` 允许你查看一个暂存的差异：

```
$ git stash show stash@{1}
console/console-init/ui/.graphqlrc.yml        |   4 +-
console/console-init/ui/generated-frontend.ts | 742 +++++++++---------
console/console-init/ui/package.json          |   2 +-
```

要获得更详细的差异，需要传递 `--patch` 或 `-p` 标志：

```
$ git stash show stash@{0} --patch
diff --git a/console/console-init/ui/package.json b/console/console-init/ui/package.json
index 755912b97..5b5af1bd6 100644
--- a/console/console-init/ui/package.json
+++ b/console/console-init/ui/package.json
@@ -1,5 +1,5 @@
 {
- "name": "my-usepatternfly",
+ "name": "my-usepatternfly-2",
  "version": "0.1.0",
  "private": true,
  "proxy": "http://localhost:4000"
diff --git a/console/console-init/ui/src/AppNavHeader.tsx b/console/console-init/ui/src/AppNavHeader.tsx
index a4764d2f3..da72b7e2b 100644
--- a/console/console-init/ui/src/AppNavHeader.tsx
+++ b/console/console-init/ui/src/AppNavHeader.tsx
@@ -9,8 +9,8 @@ import { css } from "@patternfly/react-styles";

interface IAppNavHeaderProps extends PageHeaderProps {
- toolbar?: React.ReactNode;
- avatar?: React.ReactNode;
+ toolbar?: React.ReactNode;
+ avatar?: React.ReactNode;
}

export class AppNavHeader extends React.Component&lt;IAppNavHeaderProps&gt;{
  render()
```

### 签出到新的分支

你可能会遇到这样的情况：一个分支和你的暂存中的变更有分歧，当你试图重新应用暂存时，会造成冲突。一个简单的解决方法是使用 `git stash branch <new_branch_name stash_id>` 命令，它将根据创建暂存时的提交创建一个新分支，并将暂存中的修改弹出：

```
$ git stash branch test_2 stash@{0}
Switched to a new branch 'test_2'
On branch test_2
Changes not staged for commit:
(use "git add <file>..." to update what will be committed)
(use "git restore <file>..." to discard changes in working directory)
modified: .graphqlrc.yml
modified: generated-frontend.ts
modified: package.json
no changes added to commit (use "git add" and/or "git commit -a")
Dropped stash@{0} (fe4bf8f79175b8fbd3df3c4558249834ecb75cd1)
```

### 在不打扰暂存参考日志的情况下进行暂存

在极少数情况下，你可能需要创建一个暂存，同时保持暂存参考日志（`reflog`）的完整性。这些情况可能出现在你需要一个脚本作为一个实现细节来暂存的时候。这可以通过 `git stash create` 命令来实现；它创建了一个暂存条目，并返回它的对象名，而不将其推送到暂存参考日志中：

```
$ git stash create "sample stash"
63a711cd3c7f8047662007490723e26ae9d4acf9
```

有时，你可能会决定将通过 `git stash create` 创建的暂存条目推送到暂存参考日志：

```
$ git stash store -m "sample stash testing.." "63a711cd3c7f8047662007490723e26ae9d4acf9"
$ git stash list
stash @{0}: sample stash testing..
```

### 结论

我希望你觉得这篇文章很有用，并学到了新的东西。如果我遗漏了任何有用的使用暂存的选项，请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/git-stash

作者：[Ramakrishna Pattnaik][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rkpattnaik780
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://insights.stackoverflow.com/survey/2018#work-_-version-control
[3]: https://opensource.com/downloads/cheat-sheet-git
