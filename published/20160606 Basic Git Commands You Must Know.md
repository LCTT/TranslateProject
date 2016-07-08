你应该知道的基础 Git 命令
=====================================

![](http://itsfoss.com/wp-content/uploads/2016/06/Download-Git-Sheet.jpg)

*简介：这个快速指南将向你展示所有的基础 Git 命令以及用法。你可以下载这些命令作为快速参考。*

我们在早先一篇文章中已经快速介绍过 [Vi 速查表][1]了。在这篇文章里，我们将会介绍开始使用 Git 时所需要的基础命令。

### Git

[Git][2] 是一个分布式版本控制系统，它被用在大量开源项目中。它是在 2005 年由 Linux 创始人 [Linus Torvalds][3] 写就的。这个程序允许非线性的项目开发，并且能够通过存储在本地服务器高效处理大量数据。在这个教程里，我们将要和 Git 愉快玩耍并学习如何开始使用它。

我在这个教程里使用 Ubuntu，但你可以使用你选择的任何发行版。除了安装以外，剩下的所有命令在任何 Linux 发行版上都是一样的。

### 安装 Git

要安装 git 执行以下命令：

```
sudo apt-get install git-core
```

在它完成下载之后，你就安装好了 Git 并且可以使用了。

### 设置 Git

在 Git 安装之后，不论是从 apt-get 还是从源码安装，你需要将你的用户名和邮箱地址复制到 gitconfig 文件。你可以访问 ~/.gitconfig 这个文件。

全新安装 Git 之后打开它会是完全空白的：

```
sudo vim ~/.gitconfig
```

你也可以使用以下命令添加所需的信息。将‘user’替换成你的用户名，‘user@example.com’替换成你的邮箱。

```
git config --global user.name "User"
git config --global user.email user@example.com
```

然后你就完成设置了。现在让我们开始 Git。

### 仓库

创建一个新目录，打开它并运行以下命令：

```
git init
```

![](http://itsfoss.com/wp-content/uploads/2016/05/Playing-around-git-1-1024x173.png)

这个命令会创建一个新的 Git 仓库（repository）。你的本地仓库由三个 Git 维护的“树”组成。

第一个是你的工作目录（Working Directory），保存实际的文件。第二个是索引，实际上扮演的是暂存区（staging area），最后一个是 HEAD，它指向你最后一个 commit 提交。使用 git clone /path/to/repository 签出你的仓库（从你刚创建的仓库或服务器上已存在的仓库）。

### 添加文件并提交

你可以用以下命令添加改动：

```
git add <filename>
```

这会添加一个新文件到暂存区以提交。如果你想添加每个新文件，输入：

```
git add --all
```

添加文件之后可以使用以下命令检查状态：

```
git status
```

![](http://itsfoss.com/wp-content/uploads/2016/05/Playing-around-git-2-1024x219.png)

正如你看到的，那里已经有一些变化但还没有提交。现在你需要提交这些变化，使用：

```
git commit -m "提交信息"
```

![](http://itsfoss.com/wp-content/uploads/2016/05/playing-around-git-3-1024x124.png)

你也可以这么做（首选）：

```
git commit -a
```

然后写下你的提交信息。现在你的文件提交到了 HEAD，但还不在你的远程仓库中。

### 推送你的改动

你的改动在你本地工作副本的 HEAD 中。如果你还没有从一个已存在的仓库克隆，或想将你的仓库连接到远程服务器，你需要先添加它：

```
git remote add origin <服务器地址>
```

现在你可以将改动推送到指定的远程服务器。要将改动发送到远程服务器，运行：

```
git push -u origin master
```

### 分支

分支用于开发特性，分支之间是互相独立的。主分支 master 是你创建一个仓库时的“默认”分支。使用其它分支用于开发，在完成时将它合并回主分支。

创建一个名为“mybranch”的分支并切换到它之上：

```
git checkout -b mybranch
```

![](http://itsfoss.com/wp-content/uploads/2016/05/Playing-around-Git-4--1024x145.jpg)

你可以使用这个命令切换回主分支：

```
git checkout master
```

如果你想删除这个分支，执行：

```
git branch -d mybranch
```

![](http://itsfoss.com/wp-content/uploads/2016/05/Playing-around-Git-5-1-1024x181.jpg)

除非你将分支推送到远程服务器上，否则该分支对其他人是不可用的，所以只需把它推送上去：

```
git push origin <分支名>
```

### 更新和合并

要将你本地仓库更新到最新的提交上，运行：

```
git pull
```

在你的工作目录获取并合并远程变动。要合并其它分支到你的活动分支（如 master），使用：

```
git merge <分支>
```

在这两种情况下，git 会尝试自动合并（auto-merge）改动。不幸的是，这不总是可能的，可能会导致冲突。你需要通过编辑 git 所显示的文件，手动合并那些冲突。改动之后，你需要用以下命令将它们标记为已合并：

```
git add <文件名>
```

在合并改动之前，你也可以使用以下命令预览：

```
git diff <源分支> <目标分支>
```

### Git 日志

你可以这么查看仓库历史：

```
git log
```

要以每个提交一行的样式查看日志，你可以用：

```
git log --pretty=oneline
```

或者也许你想要看一个所有分支的 ASCII 艺术树，带有标签和分支名：

```
git log --graph --oneline --decorate --all
```

如果你只想看哪些文件改动过：

```
git log --name-status
```

在这整个过程中如果你需要任何帮助，你可以用 git --help。

Git 棒不棒？！祝贺你你已经会 Git 基础了。如果你愿意的话，你可以从下面这个链接下载这些基础 Git 命令作为快速参考：

- [下载 Git 速查表][4]


--------------------------------------------------------------------------------

via: http://itsfoss.com/basic-git-commands-cheat-sheet/

作者：[Rakhi Sharma][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/rakhi/
[1]: http://itsfoss.com/download-vi-cheat-sheet/
[2]: https://git-scm.com/
[3]: https://en.wikipedia.org/wiki/Linus_Torvalds
[4]: https://drive.google.com/open?id=0By49_3Av9sT1bXpINjhvU29VNUU
