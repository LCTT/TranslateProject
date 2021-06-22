[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12180-1.html)
[#]: subject: (4 Git scripts I can't live without)
[#]: via: (https://opensource.com/article/20/4/git-extras)
[#]: author: (Vince Power https://opensource.com/users/vincepower)

4 个不可或缺的 Git 脚本
======

> Git Extras 版本库包含了 60 多个脚本，它们是 Git 基本功能的补充。以下是如何安装、使用和贡献的方法。

![](https://img.linux.net.cn/data/attachment/album/202005/03/211446dshwbzoh235b3gre.jpg)

2005 年，[Linus Torvalds][2] 创建了 [Git][3]，以取代他之前用于维护 Linux 内核的分布式源码控制管理的专有解决方案。从那时起，Git 已经成为开源和云原生开发团队的主流版本控制解决方案。

但即使是像 Git 这样功能丰富的应用程序，也没有人们想要或需要的每个功能，所以会有人花大力气去创建这些缺少的功能。就 Git 而言，这个人就是 [TJ Holowaychuk][4]。他的 [Git Extras][5] 项目承载了 60 多个“附加功能”，这些功能扩展了 Git 的基本功能。

### 使用 Git 附加功能

下面介绍一下如何使用四种最受欢迎的 Git 附加功能。

#### git-ignore

`git ignore` 是一个方便的附加功能，它可以让你手动添加文件类型和注释到 `.git-ignore` 文件中，而不需要打开文本编辑器。它可以操作你的个人用户帐户的全局忽略文件和单独用于你正在工作的版本库中的忽略文件。

在不提供参数的情况下执行 `git ignore` 会先列出全局忽略文件，然后是本地的忽略文件。

```
$ git ignore
Global gitignore: /home/alice/.gitignore
# Numerous always-ignore extensions
*.diff
*.err
*.orig
*.rej
*.swo
*.swp
*.vi
*~
*.sass-cache

# OS or Editor folders
Thumbs.db
---------------------------------
Local gitignore: .gitignore
nbproject
```

#### git-info

`git info` 可以检索你所需要的所有信息，以获取你正在使用的版本库的上下文信息。它包括远程 URL、远程分支、本地分支、配置信息和最后一次的提交信息。

```
$ git info

## Remote URLs:

origin      git@github.com:sampleAuthor/git-extras.git (fetch)
origin      git@github.com:sampleAuthor/git-extras.git (push)

## Remote Branches:

origin/HEAD -> origin/master
origin/myBranch

## Local Branches:

myBranch
* master

## Most Recent Commit:

commit e3952df2c172c6f3eb533d8d0b1a6c77250769a7
Author: Sample Author <sampleAuthor@gmail.com>

Added git-info command.

Type ´git log´ for more commits, or ´git show <commit id>´ for full commit details.

## Configuration (.git/config):

color.diff=auto
color.status=auto
color.branch=auto
user.name=Sample Author
user.email=sampleAuthor@gmail.com
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
remote.origin.url=git@github.com:mub/git-extras.git
branch.master.remote=origin
branch.master.merge=refs/heads/master
```

#### git-mr 和 git-pr

这些附加功能的作用类似，工作方式也基本相同。

* `git mr` 检出来自 GitLab 的合并请求。
* `git pr` 检出来自 GitHub 的拉取请求。

无论是哪种情况，你只需要合并请求号/拉取请求号或完整的 URL，它就会抓取远程引用，检出分支，并调整配置，这样 Git 就知道要替换哪个分支了。

```
$ git mr 51
From gitlab.com:owner/repository
 * [new ref]         refs/merge-requests/51/head -> mr/51
Switched to branch 'mr/51'
```

#### git-release

通过将 `commit`、`tag` 和 `push` 合并到一个命令中，`git release` 可以节省大量的按键来执行这三个命令，而这三个命令往往是依次运行的。

要用特定的 `<tagname>` 和自定义消息提交：

```
$ git release 0.1.0 -m <+ powerful feature added>
```

#### 其他附加功能

这只是该版本库中 60 多个 Git 附加功能中的四个命令。要访问 Git Extras 中的全部命令，请查看该源代码库中的 [Commands.md][8] 文件，或者在安装 Git Extras 后运行以下命令。

```
$ git extras --help
```

### 安装 Git 附加功能

使用 Git 附加功能的主要前提是安装了 Git 的命令行版本。如果你打算从源码中构建，还需要有额外的工具（例如：`make`）。

如果你使用的是最新版本的 macOS，那么 Git 附加功能的安装最好使用 [Homebrew][9]（和大多数开源工具一样）。

```
$ brew install git-extras
```

在 Linux 上，每个平台原生的包管理器中都包含有 Git Extras。有时，你需要启用额外的仓库，比如在 CentOS 上的 [EPEL][10]，然后运行一条命令。

```
$ sudo yum install git-extras
```

其他 Linux 发行版、BSD 和其他平台的完整安装说明可以在该版本库的 [Installation.md][11] 文件中找到。

### 贡献

你是否认为 Git 中有缺少的功能，并且已经构建了一个脚本来处理它？为什么不把它作为 Git Extras 发布版的一部分，与全世界分享呢？

要做到这一点，请将该功能贡献到 Git Extras 仓库中。更多具体细节请参见仓库中的  [CONTRIBUTING.md][12] 文件，但基本的操作方法很简单：

1. 创建一个处理该功能的 Bash 脚本。
2. 创建一个基本的 man 文件，让大家知道如何使用它。
3. 更新命令列表和补完脚本，让人们知道这个功能的存在。
4. 运行完整性检查，确保你没有破坏任何东西。
5. 为你的功能创建一个拉取请求。

向 Git Extras 贡献贡献，会让你的 Git 用户的生活更轻松一些。你可以在项目的 [README][13] 中了解更多。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/git-extras

作者：[Vince Power][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vincepower
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://en.wikipedia.org/wiki/Linus_Torvalds
[3]: https://git-scm.com/
[4]: https://github.com/tj
[5]: https://github.com/tj/git-extras
[6]: mailto:git@github.com
[7]: mailto:sampleAuthor@gmail.com
[8]: https://github.com/tj/git-extras/blob/master/Commands.md
[9]: https://brew.sh/
[10]: https://fedoraproject.org/wiki/EPEL
[11]: https://github.com/tj/git-extras/blob/master/Installation.md
[12]: https://github.com/tj/git-extras/blob/master/CONTRIBUTING.md
[13]: https://github.com/tj/git-extras/blob/master/Readme.md
