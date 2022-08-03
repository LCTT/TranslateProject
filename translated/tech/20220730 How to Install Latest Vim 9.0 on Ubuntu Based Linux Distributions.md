[#]: subject: "How to Install Latest Vim 9.0 on Ubuntu Based Linux Distributions"
[#]: via: "https://itsfoss.com/install-latest-vim-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在基于 Ubuntu 的 Linux 发行版上安装最新的 Vim 9.0
======
简介：这个快速教程展示了在 Ubuntu Linux 上安装最新版本的 Vim 的步骤。

Vim 是最[流行的基于终端的文本编辑器][1]之一。然而，它在 Ubuntu 上没有被默认安装。

Ubuntu 使用 Nano 作为默认的终端编辑器。Nano 也是一个优秀的工具，我不打算参与 [Nano 与 Vim 的辩论][2]。

如果你已经花了一些时间掌握了 Vim 的快捷键，你就不必忘记它们，而开始使用一个新的编辑器。

你可以在终端使用以下命令在 Ubuntu 上安装 Vim：

```
sudo apt install vim
```

这很简单，对吗？这种方法的主要问题是，你不会得到最新的Vim版本。

你可以用以下命令检查已安装的 Vim 版本：

```
vim --version
```

而如果你查看 [Vim 网站][3]，你会发现 Vim 已经有较新的版本发布。

在写这篇文章的时候，[Vim 9.0 已经发布][4]，但在 Ubuntu 仓库中还没有。

好消息是，你可以使用一个[非官方但积极维护的 PPA][5] 安装最新的 Vim。

### 使用 PPA 在 Ubuntu 上安装 Vim 9

如果你有特定的 Vim 配置文件，为它们做个备份也无妨。

现在，要安装最新的 Vim 版本，先添加 PPA 仓库：

```
sudo add-apt-repository ppa:jonathonf/vim
```

![Adding the PPA to get the latest Vim version][6]

你不需要在 Ubuntu 上更新软件包缓存，但其他发行版如 Mint 可能仍然需要：

```
sudo apt update
```

现在，使用下面的命令来安装 PPA 提供的最新 Vim 版本：

```
sudo apt install vim
```

如果你已经安装了一个较早的 Vim 版本，它将被升级。你可以用以下方法检查已安装的 Vim 版本：

```
vim --version
```

![Checking installed Vim version][7]

这是一个维护得非常好的 PPA，适用于所有活跃的 Ubuntu 版本。

如果你是 PPA 的新手，我有一个关于这个主题的详细指南。你应该阅读以了解更多关于 [Ubuntu 中 PPA 的概念][8]。

### 降级或删除

如果你想回到 Ubuntu 提供的旧版 Vim，你应该删除现有的版本，删除 PPA 并重新安装它。

在删除 Vim 之前，如果你做了自定义修改并打算再次使用 Vim，你应该复制 vimrc 或其他类似的配置文件。

好的。打开一个终端，使用以下命令：

```
sudo apt remove vim
```

现在删除 PPA，否则你会再次得到最新的 Vim（如果你尝试安装旧版本的 Vim）：

```
sudo add-apt-repository -r ppa:jonathonf/vim
```

现在，如果你想要旧的、官方的 Ubuntu 版本的 Vim，只需再次[使用 apt 命令][9]安装它。

享受 Ubuntu 上的 Vim 吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-latest-vim-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/command-line-text-editors-linux/
[2]: https://itsfoss.com/vim-vs-nano/
[3]: https://www.vim.org/
[4]: https://news.itsfoss.com/vim-9-0-release/
[5]: https://launchpad.net/~jonathonf/+archive/ubuntu/vim
[6]: https://itsfoss.com/wp-content/uploads/2022/07/install-latest-vim-on-ubuntu-using-ppa.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/vim-9-ubuntu.png
[8]: https://itsfoss.com/ppa-guide/
[9]: https://itsfoss.com/apt-command-guide/
