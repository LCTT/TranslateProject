初步了解 Git
=========================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/get_started_lead.jpeg?itok=r22AKc6P)

*图片来源：opensource.com*

在这个系列的[介绍篇][4]中，我们学习到了谁应该使用 Git，以及 Git 是用来做什么的。今天，我们将学习如何克隆公共 Git 仓库，以及如何提取出独立的文件而不用克隆整个仓库。

由于 Git 如此流行，因而如果你能够至少熟悉一些基础的 Git 知识也能为你的生活带来很多便捷。如果你可以掌握 Git 基础（你可以的，我发誓！），那么你将能够下载任何你需要的东西，甚至还可能做一些贡献作为回馈。毕竟，那就是开源的精髓所在：你拥有获取你使用的软件代码的权利，拥有和他人分享的自由，以及只要你愿意就可以修改它的权利。只要你熟悉了 Git，它就可以让这一切都变得很容易。

那么，让我们一起来熟悉 Git 吧。

### 读和写

一般来说，有两种方法可以和 Git 仓库交互：你可以从仓库中读取，或者你也能够向仓库中写入。它就像一个文件：有时候你打开一个文档只是为了阅读它，而其它时候你打开文档是因为你需要做些改动。

本文仅讲解如何从 Git 仓库读取。我们将会在后面的一篇文章中讲解如何向 Git 仓库写回的主题。

### Git 还是 GitHub？

一句话澄清：Git 不同于 GitHub（或 GitLab，或 Bitbucket）。Git 是一个命令行程序，所以它就像下面这样：

```
$ git
usage: Git [--version] [--help] [-C <path>] 
  [-p | --paginate | --no-pager] [--bare]
  [--Git-dir=<path>] <command> [<args>]

```

由于 Git 是开源的，所以就有许多聪明人围绕它构建了基础软件；这些基础软件，包括在他们自己身边，都已经变得非常流行了。

我的文章系列将首先教你纯粹的 Git 知识，因为一旦你理解了 Git 在做什么，那么你就无需关心正在使用的前端工具是什么了。然而，我的文章系列也将涵盖通过流行的 Git 服务完成每项任务的常用方法，因为那些将可能是你首先会遇到的。

### 安装 Git

在 Linux 系统上，你可以从所使用的发行版软件仓库中获取并安装 Git。BSD 用户应当在 Ports 树的 devel 部分查找 Git。

对于闭源的操作系统，请前往其[项目官网][1]，并根据说明安装。一旦安装后，在 Linux、BSD 和 Mac OS X 上的命令应当没有任何差别。Windows 用户需要调整 Git 命令，从而和 Windows 文件系统相匹配，或者安装 Cygwin 以原生的方式运行 Git，而不受 Windows 文件系统转换问题的羁绊。

### Git 下午茶

并非每个人都需要立刻将 Git 加入到我们的日常生活中。有些时候，你和 Git 最多的交互就是访问一个代码库，下载一两个文件，然后就不用它了。以这样的方式看待 Git，它更像是下午茶而非一次正式的宴会。你进行一些礼节性的交谈，获得了需要的信息，然后你就会离开，至少接下来的三个月你不再想这样说话。

当然，那是可以的。

一般来说，有两种方法访问 Git：使用命令行，或者使用一种神奇的因特网技术通过 web 浏览器快速轻松地访问。

假设你想要给终端安装一个回收站，因为你已经被 rm 命令毁掉太多次了。你可能听说过 Trashy ，它称自己为「理智的 rm 命令中间人」，也许你想在安装它之前阅读它的文档。幸运的是，[Trashy 公开地托管在 GitLab.com][2]。

### Landgrab

我们工作的第一步是对这个 Git 仓库使用 landgrab 排序方法：我们会克隆这个完整的仓库，然后会根据内容排序。由于该仓库是托管在公共的 Git 服务平台上，所以有两种方式来完成工作：使用命令行，或者使用 web 界面。

要想使用 Git 获取整个仓库，就要使用 git clone 命令和 Git 仓库的 URL 作为参数。如果你不清楚正确的 URL 是什么，仓库应该会告诉你的。GitLab 为你提供了 [Trashy][3] 仓库的用于拷贝粘贴的 URL。

![](https://opensource.com/sites/default/files/1_gitlab-url.jpg)

你也许注意到了，在某些服务平台上，会同时提供 SSH 和 HTTPS 链接。只有当你拥有仓库的写权限时，你才可以使用 SSH。否则的话，你必须使用 HTTPS URL。

一旦你获得了正确的 URL，克隆仓库是非常容易的。就是 git clone 该 URL 即可，以及一个可选的指定要克隆到的目录。默认情况下会将 git 目录克隆到你当前所在的目录；例如，'trashy.git' 将会克隆到你当前位置的 'trashy' 目录。我使用 .clone 扩展名标记那些只读的仓库，而使用 .git 扩展名标记那些我可以读写的仓库，不过这并不是官方要求的。

```
$ git clone https://gitlab.com/trashy/trashy.git trashy.clone
Cloning into 'trashy.clone'...
remote: Counting objects: 142, done.
remote: Compressing objects: 100% (91/91), done.
remote: Total 142 (delta 70), reused 103 (delta 47)
Receiving objects: 100% (142/142), 25.99 KiB | 0 bytes/s, done.
Resolving deltas: 100% (70/70), done.
Checking connectivity... done.
```

一旦成功地克隆了仓库，你就可以像对待你电脑上任何其它目录那样浏览仓库中的文件。

另外一种获得仓库拷贝的方式是使用 web 界面。GitLab 和 GitHub 都会提供一个 .zip 格式的仓库快照文件。GitHub 有一个大大的绿色下载按钮，但是在 GitLab 中，可以在浏览器的右侧找到并不显眼的下载按钮。

![](https://opensource.com/sites/default/files/1_gitlab-zip.jpg)

### 仔细挑选

另外一种从 Git 仓库中获取文件的方法是找到你想要的文件，然后把它从仓库中拽出来。只有 web 界面才提供这种方法，本质上来说，你看到的是别人的仓库克隆；你可以把它想象成一个 HTTP 共享目录。

使用这种方法的问题是，你也许会发现某些文件并不存在于原始仓库中，因为完整形式的文件可能只有在执行 make 命令后才能构建，那只有你下载了完整的仓库，阅读了 README 或者 INSTALL 文件，然后运行相关命令之后才会产生。不过，假如你确信文件存在，而你只想进入仓库，获取那个文件，然后离开的话，你就可以那样做。

在 GitLab 和 GitHub 中，单击文件链接，并在 Raw 模式下查看，然后使用你的 web 浏览器的保存功能，例如：在 Firefox 中，“文件” \> “保存页面为”。在一个 GitWeb 仓库中（这是一个某些更喜欢自己托管 git 的人使用的私有 git 仓库 web 查看器），Raw 查看链接在文件列表视图中。

![](https://opensource.com/sites/default/files/1_webgit-file.jpg)

### 最佳实践

通常认为，和 Git 交互的正确方式是克隆完整的 Git 仓库。这样认为是有几个原因的。首先，可以使用 git pull 命令轻松地使克隆仓库保持更新，这样你就不必在每次文件改变时就重回 web 站点获得一份全新的拷贝。第二，你碰巧需要做些改进，只要保持仓库整洁，那么你可以非常轻松地向原来的作者提交所做的变更。

现在，可能是时候练习查找感兴趣的 Git 仓库，然后将它们克隆到你的硬盘中了。只要你了解使用终端的基础知识，那就不会太难做到。还不知道基本的终端使用方式吗？那再给多我 5 分钟时间吧。

### 终端使用基础

首先要知道的是，所有的文件都有一个路径。这是有道理的；如果我让你在常规的非终端环境下为我打开一个文件，你就要导航到文件在你硬盘的位置，并且直到你找到那个文件，你要浏览一大堆窗口。例如，你也许要点击你的家目录 > 图片 > InktoberSketches > monkey.kra。

在那样的场景下，文件 monkeysketch.kra 的路径是：$HOME/图片/InktoberSketches/monkey.kra。

在终端中，除非你正在处理一些特殊的系统管理员任务，你的文件路径通常是以 $HOME 开头的（或者，如果你很懒，就使用 ~ 字符），后面紧跟着一些列的文件夹直到文件名自身。

这就和你在 GUI 中点击各种图标直到找到相关的文件或文件夹类似。

如果你想把 Git 仓库克隆到你的文档目录，那么你可以打开一个终端然后运行下面的命令：

```
$ git clone https://gitlab.com/foo/bar.git 
$HOME/文档/bar.clone
```

一旦克隆完成，你可以打开一个文件管理器窗口，导航到你的文档文件夹，然后你就会发现 bar.clone 目录正在等待着你访问。

如果你想要更高级点，你或许会在以后再次访问那个仓库，可以尝试使用 git pull 命令来查看项目有没有更新：

```
$ cd $HOME/文档/bar.clone
$ pwd
bar.clone
$ git pull
```

到目前为止，你需要初步了解的所有终端命令就是那些了，那就去探索吧。你实践得越多，Git 掌握得就越好（熟能生巧），这是重点，也是事情的本质。

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/7/stumbling-git

作者：[Seth Kenlon][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]: https://git-scm.com/download
[2]: https://gitlab.com/trashy/trashy
[3]: https://gitlab.com/trashy/trashy.git
[4]: https://linux.cn/article-7639-1.html
