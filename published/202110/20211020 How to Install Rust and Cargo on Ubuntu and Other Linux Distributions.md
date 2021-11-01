[#]: subject: "How to Install Rust and Cargo on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/install-rust-cargo-ubuntu-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13938-1.html"

如何在 Ubuntu 和其它的 Linux 发行版安装 Rust 和 Cargo
======

> 了解在 Linux 上安装 Rust 编程语言及其包管理器 Cargo 的各种方法。

![](https://img.linux.net.cn/data/attachment/album/202110/31/150031j9e0xgeg9jpxeip0.jpg)

自从 Mozilla 贡献了 [Rust][1] 语言之后，它就获得了更加突出和受欢迎的地位。口说无凭。[Rust 将被使用在 Linux 内核中][2]，它是继 C 语言之后的第二种编程语言。

许多开发人员也开始使用 Rust 语言制作很棒的基于命令行的工具。这些工具通常可以通过 [Cargo 包管理器][3] 获得。

这就是为什么在 Linux 中安装 Rust 支持对程序员和最终用户都很重要的原因。

官方 Rust 文档建议通过以下这种方式下载并执行安装程序脚本在 Linux 中安装 Rust：

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

这是可行的。但是，你的发行版可能已经打包了 Rust。使用你的发行版的 [包管理器][4] 也是一种选择。

让我向你介绍官方 Rust 方式和包管理器方式的 Rust 安装步骤。

### 方法1：使用官方方法在任意的 Linux 上安装 Rust

这种方法有几个优点：

  * 你可以获取最新的 Rust 和 Cargo 版本
  * Rust 仅仅是为当前的用户安装，并不是所有用户
  * 你并不需要 root 用户或者 `sudo` 权限就可以为自己安装 Rust

一些人不喜欢从互联网下载并 [运行 shell][5] 脚本，即使它来自官方。但是，由于它不需要 root 访问权限并且脚本来自官方，因此以这种方式安装它应该是安全的。

首先，确保你已经安装了 `curl`。如果没安装，使用你的发行版的包管理器安装它。你可以使用 `apt` 命令在 [Ubuntu 和 Debian 上安装 Curl][6]。

```
sudo apt install curl
```

接下来，使用这条命令下载脚本并运行它：

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

![][7]

它会询问你输入所需的安装类型。选择选项 `1`：

![][8]

脚本完成安装后，你需要获取配置文件的来源，以使更改应用于你的 shell。

![][9]

应用文件：

```
source $HOME/.cargo/env
```

完成后，通过检查已安装的版本来验证 Rust 是否可用：

```
rustc --version
```

![Verifying Rust installation][10]

太酷了。如果 Rust 发布了新版本，你可以使用如下命令更新已安装的版本：

```
rustup update
```

在你看到其它安装方法之前，让我快速展示如何移除以这种方式安装的 Rust。

#### 删除以官方方式安装的 Rust

在终端中，使用如下的命令从系统中移除 Rust：

```
rustup self uninstall
```

询问时按 `Y`，你将从系统中删除 Rust。

![Removing Rust from Linux][11]

官方方式安装已经完成。让我们看看如何使用 `apt` 命令在 Ubuntu 上安装 Rust。

### 方法2：使用 apt 命令在 Ubuntu 上安装 Rust

为什么要使用包管理器？
 
  * 它在整个系统范围内安装 Rust，可供系统上的所有用户使用
  * 它与其它系统更新一起集中更新（如果你的发行版添加了新版本的 Rust）

Ubuntu 中有两个主要的 Rust 包：
  
  * `rustc`：用于 Rust 编程语言的 Rust 编译器
  * `cargo`：Cargo 是 Rust 的包管理器，它会自动安装 `rustc`

作为一个普通用户，你将使用 Cargo 来安装基于 Rust 的应用程序。作为程序员，你需要 Cargo 来获取其它 Rust 包或创建自己的包。

由于 `cargo` 包含 `rustc`，所以我建议安装它，以便一次性安装所有必需的软件包。

```
sudo apt install cargo
```

系统会要求你输入账号密码。

![][12]

当然，你可以自由使用 `apt install rustc`，只安装 Rust。这取决于你的选择。

你可以验证是否为你和所有其他用户安装了 Rust（如果你愿意）：

![][13]

很好。让我也快速展示卸载步骤。

#### 使用 apt remove 移除 Rust

要移除 Rust，你可以先移除 Cargo，然后使用 `autoremove` 命令移除随它安装的依赖项。

```
sudo apt remove cargo
```

现在运行 `autoremove`：

```
sudo apt autoremove
```

就是这样。你现在了解了在 Ubuntu 和其它 Linux 发行版上安装 Rust 的所有基本知识。随时欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-rust-cargo-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.rust-lang.org/
[2]: https://www.zdnet.com/article/rust-in-the-linux-kernel-why-it-matters-and-whats-happening-next/
[3]: https://crates.io/
[4]: https://itsfoss.com/package-manager/
[5]: https://itsfoss.com/run-shell-script-linux/
[6]: https://itsfoss.com/install-curl-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/installing-rust-linux-1.png?resize=800%2C448&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/installing-rust-linux-2.png?resize=800%2C448&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/installing-rust-linux-3.png?resize=800%2C448&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/verify-rust-version.png?resize=800%2C236&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/remove-rust-linux.png?resize=800%2C378&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/install-rust-using-apt-ubuntu.png?resize=759%2C481&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/verify-rust-install-ubuntu.png?resize=741%2C329&ssl=1
