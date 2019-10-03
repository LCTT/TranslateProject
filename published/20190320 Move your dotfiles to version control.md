[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11419-1.html)
[#]: subject: (Move your dotfiles to version control)
[#]: via: (https://opensource.com/article/19/3/move-your-dotfiles-version-control)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

把“点文件”放到版本控制中
======

> 通过在 GitLab 或 GitHub 上分享你的点文件，可以在整个系统上备份或同步你的自定义配置。

![](https://img.linux.net.cn/data/attachment/album/201910/03/205222yzo1rbck6accccvo.jpg)

通过隐藏文件集（称为<ruby>点文件<rt>dotfile</rt></ruby>）来定制操作系统是个非常棒的想法。在这篇 [Shell 点文件可以为你做点什么][1]中，H. "Waldo" Grunenwald 详细介绍了为什么以及如何设置点文件的细节。现在让我们深入探讨分享它们的原因和方式。

### 什么是点文件？

“<ruby>点文件<rt>dotfile</rt></ruby>”是指我们计算机中四处漂泊的配置文件。这些文件通常在文件名的开头以 `.` 开头，例如 `.gitconfig`，并且操作系统通常在默认情况下将其隐藏。例如，当我在 MacOS 上使用 `ls -a` 时，它才会显示所有可爱的点文件，否则就不会显示这些点文件。

```
dotfiles on master
➜ ls
README.md  Rakefile   bin       misc    profiles   zsh-custom

dotfiles on master
➜ ls -a
.               .gitignore      .oh-my-zsh      README.md       zsh-custom
..              .gitmodules     .tmux           Rakefile
.gemrc          .global_ignore .vimrc           bin
.git            .gvimrc         .zlogin         misc
.gitconfig      .maid           .zshrc          profiles
```

如果看一下用于 Git 配置的 `.gitconfig`，我能看到大量的自定义配置。我设置了帐户信息、终端颜色首选项和大量别名，这些别名可以使我的命令行界面看起来就像我的一样。这是 `[alias]` 块的摘录：

```
87   # Show the diff between the latest commit and the current state
88   d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"
89
90   # `git di $number` shows the diff between the state `$number` revisions ago and the current state
91   di = !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"
92
93   # Pull in remote changes for the current repository and all its submodules
94   p = !"git pull; git submodule foreach git pull origin master"
95
96   # Checkout a pull request from origin (of a github repository)
97   pr = !"pr() { git fetch origin pull/$1/head:pr-$1; git checkout pr-$1; }; pr"
```

由于我的 `.gitconfig` 有 200 多行的自定义设置，我无意于在我使用的每一台新计算机或系统上重写它，其他人肯定也不想这样。这是分享点文件变得越来越流行的原因之一，尤其是随着社交编码网站 GitHub 的兴起。正式提倡分享点文件的文章是 Zach Holman 在 2008 年发表的《[点文件意味着被复刻][2]》。其前提到今天依然如此：我想与我自己、与点文件新手，以及那些分享了他们的自定义配置从而教会了我很多知识的人分享它们。

### 分享点文件

我们中的许多人拥有多个系统，或者知道硬盘变化无常，因此我们希望备份我们精心策划的自定义设置。那么我们如何在环境之间同步这些精彩的文件？

我最喜欢的答案是分布式版本控制，最好是可以为我处理繁重任务的服务。我经常使用 GitHub，随着我对 GitLab 的使用经验越来越丰富，我肯定会一如既往地继续喜欢它。任何一个这样的服务都是共享你的信息的理想场所。要自己设置的话可以这样做：

1. 登录到你首选的基于 Git 的服务。
2. 创建一个名为 `dotfiles` 的存储库。（将其设置为公开！分享即关爱。）
3. 将其克隆到你的本地环境。（你可能需要设置 Git 配置命令来克隆存储库。GitHub 和 GitLab 都会提示你需要运行的命令。）
4. 将你的点文件复制到该文件夹中。
5. 将它们符号链接回到其目标文件夹（最常见的是 `$HOME`）。
6. 将它们推送到远程存储库。

![](https://opensource.com/sites/default/files/uploads/gitlab-new-project.png)

上面的步骤 4 是这项工作的关键，可能有些棘手。无论是使用脚本还是手动执行，工作流程都是从 `dotfiles` 文件夹符号链接到点文件的目标位置，以便对点文件的任何更新都可以轻松地推送到远程存储库。要对我的 `.gitconfig` 文件执行此操作，我要输入：

```
$ cd dotfiles/
$ ln -nfs .gitconfig $HOME/.gitconfig
```

添加到符号链接命令的标志还具有其他一些用处：

* `-s` 创建符号链接而不是硬链接。
* `-f` 在发生错误时继续做其他符号链接（此处不需要，但在循环中很有用）
* `-n` 避免符号链接到一个符号链接文件（等同于其他版本的 `ln` 的 `-h` 标志）

如果要更深入地研究可用参数，可以查看 IEEE 和开放小组的 [ln 规范][3]以及 [MacOS 10.14.3] [4] 上的版本。自从其他人的点文件中拉取出这些标志以来，我才发现了这些标志。

你还可以使用一些其他代码来简化更新，例如我从 [Brad Parbs][6] 复刻的 [Rakefile][5]。另外，你也可以像 Jeff Geerling [在其点文件中][7]那样，使它保持极其简单的状态。他使用[此 Ansible 剧本][8]对文件进行符号链接。这样使所有内容保持同步很容易：你可以从点文件的文件夹中进行 cron 作业或偶尔进行 `git push`。

### 简单旁注：什么不能分享

在继续之前，值得注意的是你不应该添加到共享的点文件存储库中的内容 —— 即使它以点开头。任何有安全风险的东西，例如 `.ssh/` 文件夹中的文件，都不是使用此方法分享的好选择。确保在在线发布配置文件之前仔细检查配置文件，并再三检查文件中没有 API 令牌。

### 我应该从哪里开始？

如果你不熟悉 Git，那么我[有关 Git 术语的文章][9]和常用命令[备忘清单][10]将会帮助你继续前进。

还有其他超棒的资源可帮助你开始使用点文件。多年前，我就发现了 [dotfiles.github.io][11]，并继续使用它来更广泛地了解人们在做什么。在其他人的点文件中隐藏了许多秘传知识。花时间浏览一些，大胆地将它们添加到自己的内容中。

我希望这是让你在计算机上拥有一致的点文件的快乐开端。

你最喜欢的点文件技巧是什么？添加评论或在 Twitter 上找我 [@mbbroberg][12]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/move-your-dotfiles-version-control

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11417-1.html
[2]: https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/
[3]: http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ln.html
[4]: https://www.unix.com/man-page/FreeBSD/1/ln/
[5]: https://github.com/mbbroberg/dotfiles/blob/master/Rakefile
[6]: https://github.com/bradp/dotfiles
[7]: https://github.com/geerlingguy/dotfiles
[8]: https://github.com/geerlingguy/mac-dev-playbook
[9]: https://opensource.com/article/19/2/git-terminology
[10]: https://opensource.com/downloads/cheat-sheet-git
[11]: http://dotfiles.github.io/
[12]: https://twitter.com/mbbroberg?lang=en
