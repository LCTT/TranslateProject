[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12894-1.html)
[#]: subject: (7 Git tricks that changed my life)
[#]: via: (https://opensource.com/article/20/10/advanced-git-tips)
[#]: author: (Rajeev Bera https://opensource.com/users/acompiler)

改变我使用 Git 工作方式的七个技巧
======

> 这些有用的技巧将改变你使用这个流行的版本控制系统的工作方式。

![](https://img.linux.net.cn/data/attachment/album/202012/07/092803d67fa7bttuuj98fb.jpg)

Git 是目前最常见的版本控制系统之一，无论是私有系统还是公开托管的网站，都在使用它进行各种开发工作。但无论我对 Git 的使用有多熟练，似乎总有一些功能还没有被发现，下面是改变我使用 Git 工作方式的七个技巧。

### 1、Git 中的自动更正

我们有时都会打错字，但如果启用了 Git 的自动更正功能，就可以让 Git 自动修正打错的子命令。

假设你想用 `git status` 检查状态，却不小心输入了 `git stats`。正常情况下，Git 会告诉你 `stats` 不是一条有效的命令：

```
$ git stats
git: ‘stats’ is not a git command. See ‘git --help’.

The most similar command is
status
```

为了避免类似的情况发生，请在 Git 配置中启用 Git 自动更正功能：

```
$ git config --global help.autocorrect 1
```

如果你希望这个命令只适用于你当前的版本库，请省略 `--global` 选项。

这条命令启用了自动更正功能。更深入的教程可以在 [Git Docs][2] 中找到，但尝试一下和上面一样的错误命令，就能很好地了解这个配置的作用：

```
$ git stats
git: ‘stats’ is not a git command. See ‘git --help’.
On branch master
Your branch is up to date with ‘origin/master’.

nothing to commit, working tree clean
```

Git 现在不会建议使用其他子命令，而是直接运行最上面的建议，在本例中是 `git status`。

### 2、计算你的提交量

你需要计算提交数量可能有很多原因。例如，许多开发者通过计算提交数量来判断何时该增加构建版本号，或者只是想了解项目的进展情况。

要计算提交数量其实很简单直接，下面是 Git 的命令：

```
$ git rev-list --count branch-name
```

在上面的命令中，`branch-name` 应该是当前版本库中有效的分支名称：

```
$ git rev-list –count master
32
$ git rev-list –count dev
34
```

### 3、优化你的仓库

你的代码仓库不仅对你有价值，对你的组织也有价值。你可以通过一些简单的做法来保持你的版本库的清洁和更新。其中一个最好的做法是 [使用 .gitignore 文件][3]。使用这个文件，就是告诉 Git 不要存储许多不需要的文件，比如二进制文件、临时文件等等。

为了进一步优化你的版本库，你可以使用 Git 的垃圾收集功能：

```
$ git gc --prune=now --aggressive
```

当你或你的团队大量使用 `pull` 或 `push` 命令时，这条命令就会起到帮助作用。

这个命令是一个内部工具，可以清理仓库中无法访问或 “孤儿” Git 对象。

### 4、备份未被跟踪的文件

大多数时候，删除所有未被跟踪的文件是安全的。不过很多时候，你不仅要删除，还要为你的未跟踪文件创建一个备份，以备以后需要。

通过 Git 和一些 Bash 命令管道，可以很容易地为你的未被跟踪的文件创建一个压缩包：

```
$ git ls-files --others --exclude-standard -z |\
xargs -0 tar rvf ~/backup-untracked.zip
```

上面的命令制作了一个名为 `backup-untracked.zip` 的存档（并排除了 `.gitignore` 中列出的文件）。

### 5、了解你的 .git 文件夹

每个版本库都有一个 `.git` 文件夹。它是一个特殊的隐藏文件夹。

```
$ ls -a
. … .git
```

Git 的工作主要依赖于两个部分：

  1. 工作树（你当前签出的文件状态）。
  2. 你的 Git 仓库的路径（即你的 `.git` 文件夹的位置，其中包含版本信息）。

这个文件夹存储了所有的引用和其他重要的细节，比如配置、仓库数据、HEAD 状态、日志等等。

如果你删除这个文件夹，你的源代码的当前状态不会被删除，但你的远程信息，如你的项目历史记录，会被删除。删除这个文件夹意味着你的项目（至少是本地副本）不再处于版本控制之下。这意味着你不能跟踪你的变化；你不能从远程拉取或推送。

一般来说，不需要在 `.git` 文件夹里做什么，也没有什么应该做的。它是由 Git 管理的，基本上被认为是个禁区。然而，这个目录里有一些有趣的工件，包括 HEAD 的当前状态。

```
$ cat .git/HEAD
ref: refs/heads/master
```

它还可能包含对你的存储库的描述：

```
$ cat .git/description
```

这是一个未命名的仓库，编辑这个 `description` 文件可以命名这个仓库。

Git 钩子文件夹（`hooks`）也在这里，里面有一些钩子示例文件。你可以阅读这些示例来了解通过 Git 钩子可以实现什么，你也可以 [阅读 Seth Kenlon 的 Git 钩子介绍][4]。

### 6、查看另一个分支的文件

有时你想查看另一个分支的文件的内容。用一个简单的 Git 命令就可以实现，而且不需要切换分支。

假设你有一个名为 [README.md][5] 的文件，它在 `main` 分支中，而你正在 `dev` 分支上工作。

使用下面的 Git 命令，你可以在终端上完成：

```
$ git show main:README.md
```

一旦你执行了这个命令，你就可以在你的终端上查看文件的内容。

### 7、在 Git 中搜索

只需一个简单的命令，你就可以像专业人士一样在 Git 中搜索。更棒的是，即使你不确定是在哪个提交或分支上做的修改，也可以在 Git 中搜索。

```
$ git rev-list --all | xargs git grep -F 'string'
```

例如，假设你想在你的版本库中搜索 `font-size: 52 px;` 这个字符串：

```
$ git rev-list –all | xargs git grep -F 'font-size: 52 px;'
F3022…9e12:HtmlTemplate/style.css: font-size: 52 px;
E9211…8244:RR.Web/Content/style/style.css: font-size: 52 px;
```

### 试试这些技巧

希望这些高级技巧对你有用，提高你的工作效率，为你节省很多时间。

你有喜欢的 [Git 小技巧][6] 吗？在评论中分享吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/advanced-git-tips

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_code_help_autocorrect_code
[3]: https://linux.cn/article-12524-1.html
[4]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[5]: http://README.md
[6]: https://acompiler.com/git-tips/
