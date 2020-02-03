[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11393-1.html)
[#]: subject: (A Quick Look at Elvish Shell)
[#]: via: (https://itsfoss.com/elvish-shell/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Elvish Shell 速览
======

每个来到这里的人都会对许多系统中默认 Bash shell 有所了解（无论多少）。过去这些年已经有一些新的 shell 出现来解决 Bash 中的一些缺点。Elvish 就是其中之一，我们将在今天讨论它。

### 什么是 Elvish Shell？

![Pipelines In Elvish][1]

[Elvish][2] 不仅仅是一个 shell。它[也是][3]“一种表达性编程语言”。它有许多有趣的特性，包括：

* 它是由 Go 语言编写的
* 内置文件管理器，灵感来自 [Ranger 文件管理器][4]（`Ctrl + N`）
* 可搜索的命令历史记录（`Ctrl + R`）
* 访问的目录的历史记录（`Ctrl + L`）
* 支持结构化数据，例如列表、字典和函数的强大的管道
* 包含“一组标准的控制结构：有 `if` 条件控制、`for` 和 `while` 循环，还有 `try` 的异常处理”
* 通过包管理器支持[第三方模块扩展 Elvish][5]
* BSD 两句版许可证

你肯定在喊，“为什么叫 Elvish？”。好吧，根据[他们的网站][6]，他们之所以选择当前的名字，是因为：

> 在 Roguelike 游戏中，精灵制造的物品质量很高。它们通常被称为“精灵物品”。但是之所以选择 “elvish” 是因为它以 “sh” 结尾，这是 Unix shell 的久远传统。这个与 fish 押韵，它是影响 Elvish 哲学的 shell 之一。

### 如何安装 Elvish Shell

Elvish 在几种主流发行版中都有。

请注意，该软件还很年轻。最新版本是 0.12。根据该项目的 [GitHub 页面][3]：“尽管还处在 1.0 之前，但它已经适合大多数日常交互使用。”

![Elvish Control Structures][7]

#### Debian 和 Ubuntu

Elvish 包已引入 Debian Buster 和 Ubuntu 17.10。不幸的是，这些包已经过时，你需要使用 [PPA][8] 安装最新版本。你需要使用以下命令：

```
sudo add-apt-repository ppa:zhsj/elvish
sudo apt update
sudo apt install elvish
```

#### Fedora

Elvish 在 Fedora 的主仓库中没有。你需要添加 [FZUG 仓库][9]安装 Evlish。为此，你需要使用以下命令：

```
sudo dnf config-manager --add-repo=http://repo.fdzh.org/FZUG/FZUG.repol
sudo dnf install elvish
```

#### Arch

Elvish 在 [Arch 用户仓库][10]中可用。

我相信你知道该[如何在 Linux 中更改 Shell][11]，因此安装后可以切换到 Elvish 来使用它。

### 对 Elvish Shell 的想法

就个人而言，我没有理由在任何系统上安装 Elvish。我可以通过安装几个小的命令行程序或使用已经安装的程序来获得它的大多数功能。

例如，Bash 中已经存在“搜索历史命令”功能，并且效果很好。如果要提高历史命令的能力，我建议安装 [fzf][12]。`fzf` 使用模糊搜索，因此你无需记住要查找的确切命令。`fzf` 还允许你预览和打开文件。

我认为 Elvish 作为一种编程语言是不错的，但是我会坚持使用 Bash shell 脚本，直到 Elvish 变得更成熟。

你们都有用过 Elvish 么？你认为安装 Elvish 是否值得？你最喜欢的 Bash 替代品是什么？请在下面的评论中告诉我们。

如果你发现这篇文章有趣，请花一点时间在社交媒体、Hacker News 或 Reddit 上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/elvish-shell/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/pipelines-in-elvish.png?fit=800%2C421&ssl=1
[2]: https://elv.sh/
[3]: https://github.com/elves/elvish
[4]: https://ranger.github.io/
[5]: https://github.com/elves/awesome-elvish
[6]: https://elv.sh/ref/name.html
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/Elvish-control-structures.png?fit=800%2C425&ssl=1
[8]: https://launchpad.net/%7Ezhsj/+archive/ubuntu/elvish
[9]: https://github.com/FZUG/repo/wiki/Add-FZUG-Repository
[10]: https://aur.archlinux.org/packages/elvish/
[11]: https://linuxhandbook.com/change-shell-linux/
[12]: https://github.com/junegunn/fzf
[13]: http://reddit.com/r/linuxusersgroup
