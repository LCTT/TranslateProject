[#]: subject: "Manage your Rust toolchain using rustup"
[#]: via: "https://opensource.com/article/22/6/rust-toolchain-rustup"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 rustup 管理你的 Rust 工具链
======
Rustup 可用于安装 Rust 并保持更新。它还允许你在稳定版、测试版和每日 Rust 编译器和工具之间无缝切换。

![Tools illustration][1]

图片来源：Opensource.com

[Rust 编程语言][2] 如今变得越来越流行，受到爱好者和公司的一致好评。它受欢迎的原因之一是 Rust 提供的令人惊叹的工具使其成为开发人员使用的乐趣。 [Rustup][3] 是用于管理 Rust 工具的官方工具。它不仅可以用于安装 Rust 并保持更新，它还允许你在稳定、测试和每日 Rust 编译器和工具之间无缝切换。本文将向你介绍 rustup 和一些常用命令。

### 默认 Rust 安装方式

如果你想在 Linux 上安装 Rust，你可以使用你的包管理器。在 Fedora 或 CentOS Stream 上，你可以这样使用它，例如：

```
$ sudo dnf install rust cargo
```

这提供了一个稳定版本的 Rust 工具链，如果你是 Rust 的初学者并想尝试编译和运行简单的程序，它会非常有用。但是，由于 Rust 是一种新的编程语言，它变化很快，并且经常添加许多新功能。这些功能是 Rust 工具链的每日和之后测试版的一部分。要试用这些功能，你需要安装这些较新版本的工具链，而不会影响系统上的稳定版本。不幸的是，你的发行版的包管理器在这里无法为你提供帮助。

### 使用 rustup 安装 Rust 工具链

要解决上述问题，你可以下载安装脚本：

```
$ curl --proto '=https' --tlsv1.2 \
-sSf https://sh.rustup.rs > sh.rustup.rs
```

检查它，然后运行它。它不需要 root 权限，并根据你的本地用户权限安装 Rust：

```
$ file sh.rustup.rs
sh.rustup.rs: POSIX shell script, ASCII text executable
$ less sh.rustup.rs
$ bash sh.rustup.rs
```

出现提示时选择选项 1：

```
1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
> 1
```

安装后，你必须获取环境变量以确保 `rustup` 命令立即可供你使用：

```
$ source $HOME/.cargo/env
```

验证是否安装了 Rust 编译器 (rustc) 和 Rust 包管理器 (cargo)：

```
$ rustc --version
$ cargo --version
```

### 查看已安装和活动的工具链

你可以使用以下命令查看已安装的不同工具链以及哪个工具链是活动的：

```
$ rustup show
```

### 在工具链之间切换

你可以查看默认工具链并根据需要进行更改。如果你当前使用的是稳定的工具链，并希望尝试每日版本中提供的新功能，你可以轻松切换到每日工具链：

```
$ rustup default
$ rustup default nightly
```

要查看 Rust 的编译器和包管理器的确切路径：

```
$ rustup which rustc
$ rustup which cargo
```

### 检查和更新工具链

要检查是否有新的 Rust 工具链可用：

```
$ rustup check
```

假设一个新版本的 Rust 发布了，其中包含一些有趣的特性，并且你想要获取最新版本的 Rust。你可以使用 `update` 子命令来做到这一点：

```
$ rustup update
```

### 帮助和文档

以上命令对于日常使用来说绰绰有余。尽管如此，rustup 有多种命令，你可以参考帮助部分了解更多详细信息：

```
$ rustup --help
```

Rustup 在 GitHub 上有完整的[说明书][4]，你可以将其用作参考。所有 Rust 文档都安装在你的本地系统上，不需要你连接到 Internet。你可以访问包括书籍、标准库等在内的本地文档：

```
$ rustup doc
$ rustup doc --book
$ rustup doc --std
$ rustup doc --cargo
```

Rust 是一种正在积极开发中的令人兴奋的语言。如果你对编程的发展方向感兴趣，请关注 Rust！

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/rust-toolchain-rustup

作者：[Gaurav Kamathe][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/tools_hardware_purple.png
[2]: https://www.rust-lang.org/
[3]: https://github.com/rust-lang/rustup
[4]: https://rust-lang.github.io/rustup/
