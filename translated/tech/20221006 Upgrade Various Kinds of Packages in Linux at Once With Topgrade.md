[#]: subject: "Upgrade Various Kinds of Packages in Linux at Once With Topgrade"
[#]: via: "https://itsfoss.com/topgrade/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 Topgrade 一次升级 Linux 中的各种软件包
======
更新 Linux 系统并没有那么复杂，不是吗？毕竟，要像发行版一样更新 Ubuntu，你只需要使用 apt update 和 apt upgrade。

如果所有的包都是通过一个包管理器安装的，就会是这样。

但现在情况不再如此。你有经典的 apt/dnf/pacman，还有 snap、flatpak、appimages。不止于此，你还可以使用 PIP（用于 Python）和 Cargo（用于 Rust）安装应用。

使用 node？ npm 包需要单独更新。Oh My Zsh？需要单独更新。[Vim 中的插件][1]、Atom 等也可能不被 apt/dnf/pacman 覆盖。

你现在看到问题了吗？这就是名为 topgrade 的新工具旨在解决的问题。

### Topgrade：处理各种更新的单一程序

[topgrade][2] 是一个 CLI 程序，它会检测你使用的工具，然后运行适当的命令来更新它们。

![topgrade disable system][3]

除了通常的 Linux 包管理器，它还可以检测和更新 brew、cargo、PIP、pihole、Vim 和 Emacs 插件、R 软件包等。你可以在 [wiki 页面][4]上查看支持的包列表。

##### Topgrade 的主要特点：

* 能够从不同的包管理器更新包，包括固件！
* 你可以控制更新包的方式。
* 高度可定制。
* 能够在更新包之前进行概览

所以不要浪费任何时间，让我们跳到安装。

### 使用 Cargo 在 Linux 中安装 Topgrade

安装过程非常简单，因为我将使用 cargo 包管理器。

我们已经有了[详细指南，其中包含设置 cargo 包管理器的多种方法][5]。所以我将在我的示例中使用 Ubuntu 来快速完成。

因此，让我们以最少方式安装依赖项以及 cargo：

```
sudo apt install cargo libssl-dev pkg-config
```

安装 cargo 后，使用给定的命令安装 topgrade：

```
cargo install topgrade
```

它会抛出一个警告：

![cargo error][6]

你只需添加 cargo 路径即可运行二进制文件。这可以通过给定的命令来完成，你需要使用你的用户名替换 `sagar`：

```
echo 'export PATH=$PATH:/home/sagar/.cargo/bin' >> /home/sagar/.bashrc
```

现在，重启系统，topgrade 就可以使用了。但是等等，我们需要安装另一个包来更新 cargo 以获取最新的包。

```
cargo install cargo-update
```

这样我们完成了安装。

### 使用 Topgrade

使用 topgrade 非常简单。使用一个命令，就是这样：

```
topgrade
```

![][7]

但这不会给你除了系统包之外的任何控制，但正如我所提到的，你可以将不想更新的仓库列入黑名单。

#### 从 Topgrade 中排除包管理器和仓库

假设我想排除 snap 和从默认包管理器下载的包，所以我的命令是：

```
topgrade --disable snap system
```

![topgrade disable snap system][8]

要进行永久更改，你必须在其配置文件中进行一些更改，这些更改可以通过给定的命令访问：

```
topgrade --edit-config
```

对于此示例，我排除了 snap 和默认系统仓库：

![configuring topgrade][9]

#### 试运行 topgrade

评估将要更新的过时软件包总是一个好主意，我从 topgrade 的整个目录中找到了这个最有用的选项。

你只需使用带有 `-n` 选项的 topgrade，它就会生成过期软件包的摘要。

```
topgrade -n
```

![summery of topgrade][10]

检查需要更新的软件包的一种简洁方法。

### 最后的话

在使用 Topgrade 几周后，它成为了我的 Linux 武器库中不可或缺的一部分。 像大多数其他 Linux 用户一样，我只是通过我的默认包管理器更新包。 Python 和 Rust 包被完全忽略了。 感谢 topgrade，我的系统现在完全更新了。

我知道这不是每个人都想使用的工具。 那你呢？ 愿意试一试吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/topgrade/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://linuxhandbook.com/install-vim-plugins/
[2]: https://github.com/r-darwish/topgrade
[3]: https://itsfoss.com/wp-content/uploads/2022/09/topgrade-disable-system.png
[4]: https://github.com/r-darwish/topgrade/wiki/Step-list
[5]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[6]: https://itsfoss.com/wp-content/uploads/2022/09/cargo-error.png
[7]: https://itsfoss.com/wp-content/uploads/2022/10/topgrade.mp4
[8]: https://itsfoss.com/wp-content/uploads/2022/09/topgrade-disable-snap-system.png
[9]: https://itsfoss.com/wp-content/uploads/2022/09/configuring-topgrade-1.png
[10]: https://itsfoss.com/wp-content/uploads/2022/09/summery-of-topgrade.png
