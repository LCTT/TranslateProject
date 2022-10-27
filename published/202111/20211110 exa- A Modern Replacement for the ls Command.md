[#]: subject: "exa: A Modern Replacement for the ls Command"
[#]: via: "https://itsfoss.com/exa/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13972-1.html"

exa：一个 ls 命令的现代替代品
======

![](https://img.linux.net.cn/data/attachment/album/202111/10/155648vf7iwcwsetitqfuw.jpg)

我敢打赌你使用过 [Linux 上的 ls 命令][1]，它是你 [学习 Linux][2] 时首次接触到的命令之一。

这个简单的 `ls` 命令列出目录的内容十分方便，但是直到我发现 `exa` 之前从来没想过会有命令能替代它。

### exa 命令简介

[exa][3] 是一个命令行工具，可以列出指定路径（如未指定则是当前目录）的目录和文件。这也许听起来很熟悉，因为这就是 `ls` 命令所做的事情。

`exa` 被视作从 UNIX 旧时代延续至今的古老的 `ls` 命令的一个现代替代品。如其所声称的那样，它有比 `ls` 命令更多的功能、更好的默认行为。

![exa 功能][4]

以下是一些你应该使用 `exa` 替代 `ls` 的原因：

  * `exa` 像 `ls` 一样可移植（在所有主流 Linux 发行版、*BSD 和 macOS 上可用）
  * 默认彩色输出
  * `exa` 不同格式化的“详细”输出也许会吸引 Linux/BSD 新手
  * 文件查询是并行进行的，这使得 `exa` 与 `ls` 的性能相当
  * 显示单个文件的 git 暂存或未暂存状态

`exa` 的另外一个不同的地方是它是用 Rust 编写的。顺便说一句，Rust 与 C 语言的执行速度相近，但在编译时减少了内存错误，使你的软件可以快速而安全地执行。

### 在 Linux 系统上安装 exa

`exa` 最近很流行，因为许多发行版开始将其包括在其官方软件库中。也就是说，你应该可以使用你的 [发行版的包管理器] 来安装它。

从 Ubuntu 20.10 开始，你可以使用 `apt` 命令来安装它：

```
sudo apt install exa
```

Arch Linux 已经有了它，你只需要 [使用 pacman 命令][6] 即可：

```
sudo pacman -S exa
```

如果它无法通过你的包管理器安装，请不要担心。毕竟它是一个 Rust 包，你可以很容易地用 Cargo 安装它。请确保在你使用的任何发行版 [或 Ubuntu 上安装了 Rust 和 Cargo][7]。

安装 Rust 和 Cargo 后，使用此命令安装 `exa`：

```
cargo install exa
```

### 使用 exa

`exa` 有很多命令选项，主要是为了更好的格式化输出和一些提高舒适度的改进，比如文件的 git 暂存或未暂存状态等等。

下面是一些屏幕截图，展示了 `exa` 是如何在你的系统上工作的。

简单地使用 `exa` 命令将产生类似于 `ls` 但带有颜色的输出。这种彩色的东西可能没有那么吸引人，因为像 Ubuntu 这样的发行版至少在桌面版本中已经提供了彩色的 `ls` 输出。不过，`ls` 命令本身默认没有彩色输出。

```
exa
```

![exa 命令的输出截图，没有任何额外的标志][8]

请注意，`exa` 和 `ls` 命令的选项不尽相同。例如，虽然 `-l` 选项在 `exa` 和 `ls` 中都给出了长列表，但 `-h` 选项添加了一个列标题，而不是 `ls` 的人类可读选项。

```
exa -lh
```

![正如我之前提到的，exa 有列标题以获得更好的“详细”输出][9]

我前面说过，`exa` 已经内置了 Git 集成。下面的屏幕截图给出了 `–git` 标志的演示。请注意 `test_file` 在 `git` 的 `tracked` 列中显示 `-N` ，因为它尚未添加到存储库中。

```
exa --git -lh
```

![演示 git 标志如何与 exa 一起工作][10]

下面的例子不是我的猫键入的。它是各种选项的组合。`exa` 有可供你尝试和探索的很多选项。

```
exa -abghHliS
```

![一个非常丰富多彩和详细的输出，具有用户友好的详细输出][11]

你可以通过在终端中运行以下命令来获取完整的选项列表：

```
exa --help
```

但是，如果你想了解 `exa` 所提供的功能，可以查看其 [Git 存储库][13] 上的 [官方文档][12]。

### 值得从 ls 切换到 exa 吗？

对于类 UNIX 操作系统的新手来说，`exa` 可能是用户友好的，它牺牲了在脚本中容易使用的能力，以换取“易用性”和外观。其中，显示得更清楚并不是一件坏事。

无论如何，`ls` 就像通用命令。你可以将 `exa` 用于个人用途，但在编写脚本时，请坚持使用 `ls`。当预期输出与任一命令中的实际输出不匹配时，`ls` 和 `exa` 之间一个 [或多个] 标志的差异可能会让你发疯。

我想知道你对 `exa` 的看法。你已经尝试过了吗？你对它的体验如何？

--------------------------------------------------------------------------------

via: https://itsfoss.com/exa/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/ls-command/
[2]: https://itsfoss.com/free-linux-training-courses/
[3]: https://the.exa.website/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/exa-features.png?resize=800%2C331&ssl=1
[5]: https://itsfoss.com/package-manager/
[6]: https://itsfoss.com/pacman-command/
[7]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/01_exa.webp?resize=800%2C600&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_exa_lh.webp?resize=800%2C600&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_exa_git.webp?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/04_exa_all_flags.webp?resize=800%2C600&ssl=1
[12]: https://github.com/ogham/exa#command-line-options
[13]: https://github.com/ogham/exa
