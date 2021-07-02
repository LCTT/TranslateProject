[#]: collector: "lujun9972"
[#]: translator: "BoosterY"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13529-1.html"
[#]: subject: "7 Git tricks that changed my life"
[#]: via: "https://opensource.com/article/20/10/advanced-git-tips"
[#]: author: "Rajeev Bera https://opensource.com/users/acompiler"

七个改变我生活的 Git 小技巧
======

> 这些有用的小技巧将改变你在当前最流行的版本控制系统下的工作方式。

![](https://img.linux.net.cn/data/attachment/album/202106/28/110029d64pblurlh5a4a50.jpg)

Git 是当前最流行最普遍的版本控制系统之一，它被应用于私有系统和公开网站上各种各样的开发工作。不论我变得对 Git 有多熟悉，似乎总有些功能等待着被发掘。下面分享下和 Git 相关的改变我工作方式的一些小技巧。

### 1、Git 中的自动纠错

我们每个人都不时在输入时犯拼写错误，但是如果你使能了 Git 的自动纠错功能，你就能让 Git 自动纠正一些输入错误的子命令。

假如你想用命令 `git status` 来检查状态，但是你恰巧错误地输入了 `git stats`。通常情况下，Git 会告诉你 ‘stats’ 不是个有效的命令：

```
$ git stats
git: ‘stats’ is not a git command. See ‘git --help’.

The most similar command is
status
```

为了避免类似情形，只需要在你的 Git 配置中使能自动纠错功能。

```
$ git config --global help.autocorrect 1
```

如果你只想对当前的仓库生效，就省略掉选项 `--global`。

这个命令会使能自动纠错功能。在相应的 [Git 官方文档][2] 中可以看到这个命令的详细说明，但是试着敲一下上面的错误命令会使你对这个设置干了什么有个直观的了解：

```
$ git stats
git: ‘stats’ is not a git command. See ‘git --help’.
On branch master
Your branch is up to date with ‘origin/master’.

nothing to commit, working tree clean
```

在上面的例子中，Git 直接运行了它建议命令的第一个，也就是 `git status`，而不是给你展示它所建议的子命令。

### 2、对提交进行计数

需要对提交进行计数的原因有很多。例如，一些开发人员利用提交计数来判断什么时候递增工程构建序号，也有一些开发人员用提交计数来对项目进展取得一个整体上的感观。

对提交进行计数相当简单而且直接，下面就是相应的 Git 命令：

```
$ git rev-list --count branch-name
```

在上述命令中，参数 `branch-name` 必须是一个你当前仓库里的有效分支名。

```
$ git rev-list –count master
32
$ git rev-list –count dev
34
```

### 3、仓库优化

你的代码仓库不仅对你来说很宝贵，对你所在的组织也一样。通过少数几个惯例你就能使自己的仓库整洁并且保持最新。[使用 .gitignore 文件][3] 就是这些最好的惯例之一。通过使用这个文件你可以告诉 Git 不要保存一些不需要记录的文件，如二进制文件、临时文件等等。

当然，你还可以使用 Git 的垃圾回收来进一步优化你的仓库。

```
$ git gc --prune=now --aggressive
```

这个命令在你和你的团队经常使用 `pull` 或者 `push` 操作的时候很有帮助。

它是一个内部工具，能清理掉你的仓库里没法访问或者说“空悬”的 Git 对象。

### 4、给未追踪的文件来个备份

大多数时候，删除所有未追踪的文件是安全的。但很多时候也有这么一种场景，你想删掉这些未追踪的文件同时也想做个备份防止以后需要用到。

Git 组合一些 Bash 命令和管道操作，可以让你可以很容易地给那些未追踪的文件创建 zip 压缩包。

```
$ git ls-files --others --exclude-standard -z |\
  xargs -0 tar rvf ~/backup-untracked.zip
```

上面的命令就生成了一个名字为 `backup-untracked.zip` 的压缩包文件（当然，在 `.gitignore` 里面忽略了的文件不会包含在内）。

### 5、了解你的 .git 文件夹

每个仓库都有一个 `.git` 文件夹，它是一个特殊的隐藏文件夹。

```
$ ls -a
. … .git
```

Git 主要通过两个东西来工作：

1. 当前工作树（你当前检出的文件状态）
2. 你的 Git 仓库的文件夹（准确地说，包含版本信息的 `.git` 文件夹的位置）

这个文件夹存储了所有参考信息和一些其他的如配置、仓库数据、HEAD 状态、日志等更多诸如此类的重要细节。

一旦你删除了这个文件夹，尽管你的源码没被删，但是类似你的工程历史记录等远程信息就没有了。删除这个文件夹意味着你的工程（至少本地的复制）不再在版本控制的范畴之内了。这也就意味着你没法追踪你的修改；你没法从远程仓拉取或推送到远程仓了。

通常而言，你需要或者应当对你的 `.git` 文件夹的操作并不多。它是被 Git 管理的，而且大多数时候是一个禁区。然而，在这个文件夹内还是有一些有趣的工件，比如说当前的 HEAD 状态在内的就在其中。

```
$ cat .git/HEAD
ref: refs/heads/master
```

它也隐含着对你仓库地描述：

```
$ cat .git/description
```

这是一个未命名的仓库；通过编辑文件 ‘description’ 可以给这个仓库命名。

Git 钩子文件夹连同一些钩子文件例子也在这里。参考这些例子你就能知道 Git 钩子能干什么了。当然，你也可以 [参考这个 Seth Kenlon 写的 Git 钩子介绍][4]。

### 6、浏览另一个分支的文件

有时，你会想要浏览另一个分支下某个文件的内容。这其实用一个简单的 Git 命令就可以实现，甚至都不用切换分支。

设想你有一个命名为 [README.md][5] 的文件，并且它在 `main` 分支上。当前你正工作在一个名为 `dev` 的分支。

用下面的 Git 命令，在终端上就行。

```
$ git show main:README.md
```

一旦你执行这个命令，你就能在你的终端上看到 `main` 分支上该文件的内容。

### 7、Git 中的搜索

用一个简单的命令你就能在 Git 中像专业人士一样搜索了。更有甚者，尽管你不确定你的修改在哪次提交或者哪个分支上，你依然能搜索。

```
$ git rev-list --all | xargs git grep -F ''
```

例如，假设你想在你的仓库中搜索字符串 `“font-size: 52 px;"` ：

```
$ git rev-list –all | xargs git grep -F ‘font-size: 52 px;’
F3022…9e12:HtmlTemplate/style.css: font-size: 52 px;
E9211…8244:RR.Web/Content/style/style.css: font-size: 52 px;
```

### 试试这些小技巧

我希望这些小技巧对你是有用的，或者增加你的生产力或者节省你的大量时间。

你也有一些喜欢的 [Git 技巧][6] 吗？在评论区分享吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/advanced-git-tips

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[BoosterY](https://github.com/BoosterY)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_code_help_autocorrect_code
[3]: https://opensource.com/article/20/8/dont-ignore-gitignore
[4]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[5]: http://README.md
[6]: https://acompiler.com/git-tips/
