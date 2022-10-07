[#]: subject: "Why I love Tig for visualizing my Git workflows"
[#]: via: "https://opensource.com/article/22/7/visualize-git-workflow-tig"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14809-1.html"

使用 Tig 来可视化 Git 工作流
======

![](https://img.linux.net.cn/data/attachment/album/202207/09/123419u39t3jz9gzc6345t.jpg)

> Tig 是审查 Git 仓库的绝佳工具，它鼓励你探索日志，而无需构建冗长且有时复杂的查询。

如果你发现浏览你的 Git 仓库非常复杂，我已经为你准备好了工具，来了解一下 Tig。

Tig 是一个 [基于 ncurses][2] 的 Git 文本模式界面，它允许你浏览 Git 仓库中的更改。它还可以充当各种 Git 命令输出的分页器。使用这个工具可以让我很好地了解在哪个提交中发生了哪些更改，最新的提交合并是什么等等。请跟随这个简短的教程，亲自尝试一下。

### 安装 Tig

在 Linux 上，你可以使用包管理器安装 Tig。例如，在 Fedora 和 Mageia 上：

```
$ sudo dnf install tig
```

在 Debian、Linux Mint、Elementary、Pop_OS 和其他基于 Debian 的发行版上：

```
$ sud apt install tig
```

在 macOS 上，使用 [MacPorts][3] 或 [Homebrew][4]。 Tig 的完整安装指南可在 [Tig 手册][5] 中找到。

### 使用 Tig

Tig 提供了常见 Git 输出的交互式视图。例如，使用 Git，你可以使用命令 `git show-ref` 查看所有引用：

```
$ git show-ref
98b108... refs/heads/master
6dae95... refs/remotes/origin/1010-internal-share-partition-format-reflexion
84e1f8... refs/remotes/origin/1015-add-libretro-openlara
e62c7c... refs/remotes/origin/1016-add-support-for-retroarch-project-cd
1c29a8... refs/remotes/origin/1066-add-libretro-mess
ffd3f53... refs/remotes/origin/1155-automatically-generate-assets-for-external-installers
ab4d14... refs/remotes/origin/1160-release-on-bare-metal-servers
28baa9... refs/remotes/origin/1180-ipega-pg-9118
8dff1d... refs/remotes/origin/1181-add-libretro-dosbox-core-s
81a7fe... refs/remotes/origin/1189-allow-manual-build-on-master
[...]
```

使用 Tig，你可以在可滚动列表中获取该信息以及更多信息，此外还可以使用键盘快捷键来打开其他视图，其中包含每个引用的详细信息。

![][6]

### 分页模式

当输入来自标准输入时，Tig 进入分页模式。当指定 `show` 子命令并给出 `--stdin` 选项时，标准输入被假定为提交 ID 列表，它被转发到 `git-show` ：

```
$ git rev-list --author=sumantrom HEAD | tig show –stdin
```

### 日志和差异视图

当你在 Tig 的日志视图中时，你可以按键盘上的 `d` 键来显示差异。这将显示提交中更改的文件以及删除和添加的行。

### 交互式 Git 数据

Tig 是对 Git 的一个很好的补充。它鼓励你探索日志，而无需构建冗长且有时复杂的查询，从而可以轻松查看你的 Git 仓库。

立即将 Tig 添加到你的 Git 工具包中！

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/visualize-git-workflow-tig

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/images/life/computer_code_programming_laptop_0.jpg
[2]: https://opensource.com/article/21/8/ncurses-linux
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://jonas.github.io/tig/doc/manual.html
[6]: https://opensource.com/sites/default/files/2022-06/tig%201.png
