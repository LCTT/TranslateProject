[#]: subject: "Installing and Using Homebrew Package Manager on Linux"
[#]: via: "https://itsfoss.com/homebrew-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14065-1.html"

在 Linux 上安装和使用 Homebrew 包管理器
======

![](https://img.linux.net.cn/data/attachment/album/202112/09/090614sptwo73z73f7fw7u.jpg)

Homebrew（家酿），也被称为 Brew，是一个主要为 macOS 创建的命令行包管理器。

[Homebrew][1] 在 macOS 用户中相当流行，因为更多的开发者创造了可以用 Homebrew 轻松安装的命令行工具。

这种流行导致了 Linuxbrew 的诞生，它是 Homebrew 的一个 Linux 移植版。由于它主要是 Git 和 Ruby 组成的，而 Linux 和 macOS 都是类 Unix 的系统，所以 Brew 在两种操作系统上都能很好地工作。

Linuxbrew 项目最终与 Homebrew 项目合并，现在只有一个 Brew 项目，叫做 Homebrew。

为什么我叫它 Brew，而不是 Homebrew？因为命令以 `brew` 开头。你会在后面的章节中看到它的详细内容。

### 当你已经有了 apt、dnf、snap 时，为什么还要在 Linux 上使用 Homebrew 包管理器？

我知道这种感觉。你已经有一个由你的发行版提供的好的 [包管理器][2]。除此之外，你还有 Snap、Flatpak 和其他通用软件包系统。

在你的 Linux 系统上你真的需要 Homebrew 包管理器吗？答案取决于你的需求。

你看，除了发行版的包管理器和通用包管理器，你会遇到需要其他包管理器的情况，比如 [Pip][3] （用于 Python 应用）和 [Cargo][4] （用于 Rust 软件包）。

想象一下，你遇到了一个很好的命令行工具，想试试。它的软件库提到它可以使用 `brew` 或源代码来安装。在这种情况下，在你的系统上有 `brew` 可能会有帮助。毕竟，都 2021 了，[从源代码安装][5] 并不时髦（也不舒服）。

换句话说，如果你遇到一些有趣的命令行工具只提供 `brew` 安装选项，你会有一个额外的选择。

### 在 Ubuntu 和其他 Linux 发行版上安装 Homebrew

安装是相当容易的。你只需要确保你已经有了所有的依赖项。

#### 步骤 1：安装依赖项

你需要有相对较新版本的 gcc 和 glibc。你可以 [在 Ubuntu 上安装 build-essential 包][6] 来获得它们。除此之外，你还需要 [安装 Git][7]、Curl 和 procps（用于监控系统进程）。

在基于 Ubuntu 和 Debian 的系统中，你可以像这样一起安装所有这些东西：

```
sudo apt-get install build-essential procps curl file git
```

![Iinstall dependencies for Homebrew in Ubuntu/Debian][8]

对于其他发行版，请使用你的包管理器并安装这些依赖项。

#### 步骤 2：安装 Homebrew

你可以看到为什么你需要 [安装 Curl][9]。它允许你 [在终端下载安装脚本文件][10]。

只要输入这个命令：

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

当要求输入回车键时，请按下回车。

![Installing Homebrew on Ubuntu][11]

在脚本最后，它建议运行几个命令，将其添加到 `PATH` 变量中。Homebrew 实际上是安装在你的主目录中，然后软链接到 `/usr/local` 目录中。

![Run the suggested command under Next steps to add Homebrew to PATh variable][12]

你可以 [在终端方便地复制和粘贴][13]。只要选择它所建议的命令，按 `Ctrl+Shift+C` 复制，按 `Ctrl+Shift+V` 粘贴。

或者，你也可以直接复制粘贴这个命令：

```
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
```

然后是这个：

```
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

![Adding brew commands to the PATH][14]

#### 步骤 3：验证 brew 的安装

就快完成了。只需通过使用 `brew doctor` 命令来验证 `brew` 命令是否可以运行：

```
brew doctor
```

`brew doctor` 命令会告诉你是否有任何问题。

你可以通过安装示例 hello 项目再次验证：

```
brew install hello
```

如果你没有看到任何错误，你可以在 Linux 上享用家酿了。

### 使用 brew 命令来安装、删除和管理软件包

让我快速告诉你几个可以用来安装、删除和管理软件包的 `brew` 命令。

由于 Homebrew 安装在你的主目录中，你不需要 `sudo` 来运行它（就像 Pip 和 Cargo）。

要用 `brew` 安装一个软件包，请使用安装选项：

```
brew install package_name
```

这里没有自动完成软件包名称的功能。你需要知道确切的软件包名称。

要删除一个 `brew` 软件包，你可以使用 `remove` 或 `uninstall` 选项。两者的作用是一样的。

```
brew remove package_name
```

你也可以用这个命令列出已安装的 `brew` 软件包：

```
brew list
```

你也可以用 `autoremove` 选项删除不需要的依赖：

```
brew autoremove
```

在下一张截图中，我只用 `brew` 安装了两个软件包，但它也显示了这些软件包的依赖关系。即使在移除软件包后，依赖关系仍然存在。`autoremove` 终于把它们删除了。

![Listing and removing brew apckages][15]

还有很多 `brew` 命令选项，但这不在本教程的范围内。你可以随时 [翻阅它的文档][16] 并进一步探索。

### 从 Linux 中删除 Homebrew

如果不加入从你的 Linux 系统中删除 Homebrew 的步骤，本教程就不完整。

根据 [GitHub 仓库中提到的步骤][17]，你必须下载并使用这个命令运行卸载脚本：

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

你会被要求输入 `Y` 键来确认删除。

![Removing Homebrew from Linux][18]

当 Homebrew 的卸载完成后，它会列出它所遗留的文件和目录：

![Remaining files after Homebrew removal][19]

让你自己去删除这些文件和目录。

### 总结

正如我前面解释的，Homebrew 为你已经有的东西提供了一个扩展。如果你偶然发现一个只有 `brew` 安装方式的应用，在你的 Linux 系统上安装 Homebrew 会很方便。

你对这个话题有什么要补充的，或者分享你的问题或意见？请在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/homebrew-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://brew.sh/
[2]: https://itsfoss.com/package-manager/
[3]: https://itsfoss.com/install-pip-ubuntu/
[4]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[5]: https://itsfoss.com/install-software-from-source-code/
[6]: https://itsfoss.com/build-essential-ubuntu/
[7]: https://itsfoss.com/install-git-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-dependencies-for-homebrew-linux.png?resize=800%2C493&ssl=1
[9]: https://itsfoss.com/install-curl-ubuntu/
[10]: https://itsfoss.com/download-files-from-linux-terminal/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/installing-homebrew-ubuntu.png?resize=800%2C453&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/adding-homebrew-to-path-Linux.png?resize=800%2C442&ssl=1
[13]: https://itsfoss.com/copy-paste-linux-terminal/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/post-installation-steps-for-brew.png?resize=786%2C348&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/brew-remove-packages.png?resize=800%2C572&ssl=1
[16]: https://docs.brew.sh/Manpage
[17]: https://github.com/homebrew/install#uninstall-homebrew
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/removing-homebrew-from-Linux.png?resize=800%2C539&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/remaining-files-after-homebrew-removal.png?resize=800%2C464&ssl=1
