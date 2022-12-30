[#]: subject: "Learn Rust by debugging Rust"
[#]: via: "https://opensource.com/article/22/7/learn-rust-rustlings"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lkxed"
[#]: translator: "yzuowei"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15395-1.html"

以调试 Rust 的方式来学习 Rust
======

> Rustlings 是由 Rust 团队维护的开源项目，旨在帮助你通过调试代码的方式来学习 Rust。

![Ferris the crab under the sea, unofficial logo for Rust programming language][1]

在我上一篇 [关于 Rustup 的文章][2] 中，我向你们展示了如何安装 Rust 工具链。但是，如果不能上手操作一下 Rust 的话下载工具链又有什么用？学习任何语言都包括阅读现有的代码和写很多的示例程序，这是精通一门语言的好方法。然而，我们还可以走第三条路：调试代码。

通过调试来学习牵扯到尝试去编译一个已经写好的（满是漏洞的）示例程序，理解编译器生成的错误信息，修复示例代码，然后再重新编译。重复这个过程直到代码能够成功被编译并运行。

[Rustlings][3] 是一个由 Rust 团队维护的开源项目，旨在帮助你通过调试代码来学习 Rust。它也会一路为你提供提示。如果你是一名 Rust 初学者，并且刚开始阅读或已经读完了 Rust 书籍，那么 Rustlings 就是理想的下一步。Rustllings 帮助你将运用书中所学，并转向开发更大的项目。

### 安装 Rustlings

我使用（并推荐）Fedora 电脑来体验 Rustlings，但是任何 Linux 发行版都可以。要安装 Rustlings，你必须下载并运行它的安装脚本。通常建议你以不具备任何特别权限的普通用户（非 root 用户）来运行脚本。

记住，你需要 Rust 工具链来使用 Rustlings。如果你还没有这些工具链，请参考我 [关于 Rustup 的文章][4]。

当你准备好时，下载这个安装脚本：

```
$ curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh  > rustlings_install.sh
$ file rustlings_install.sh
rustlings_install.sh: Bourne-Again shell script, ASCII text executable
```

阅读脚本以了解它会做什么：

```
$ less rustlings_install.sh
```

然后运行安装：

```
$ bash rustlings_install.sh
[...]
Installing /home/tux/.cargo/bin/rustlings
Installed package `rustlings v4.8.0 (/home/tux/rustlings)` (executable `rustlings`)
All done!
```

运行 `rustlings` 以开始。

### Rustlings 练习

你现在可以使用命令 `rustlings`。与标志 `--help` 一起执行来查看可选的选项。

```
$ rustlings --help
```

这个安装脚本也克隆了 Rustlings 的 Git 仓库，并安装了运行示例程序所需的依赖。你可以在 `ruslings` 下的 `exercises` 目录查阅这些示例程序。

```
$ cd rustlings
$ pwd
/home/tux/rustlings
$ ls
AUTHORS.md  Cargo.toml        CONTRIBUTING.md  info.toml install.sh README.md  target Cargo.lock  CHANGELOG.md  exercises install.ps1  LICENSE src tests
$ ls -m exercises/
advanced_errors, clippy, collections, conversions, enums, error_handling, functions, generics, if, intro, macros, mod.rs, 
modules, move_semantics, option, primitive_types, quiz1.rs, quiz2.rs, quiz3.rs, quiz4.rs, README.md, 
standard_library_types, strings, structs, tests, threads, traits, variables
```

### 从命令行列出所有练习

命令 `ruslings` 提供给你一个 `list` 命令用以展示每个示例程序，它的完整路径，以及状态 （默认为 “待定”）。

```
$ rustlings list
Name         Path                                 Status
intro1       exercises/intro/intro1.rs            Pending
intro2       exercises/intro/intro2.rs            Pending
variables1   exercises/variables/variables1.rs    Pending
variables2   exercises/variables/variables2.rs    Pending
variables3   exercises/variables/variables3.rs    Pending
[...]
```

在显示结尾处，你会有一个进度报告用来追踪进度。

```
Progress: You completed 0 / 84 exercises (0.00 %).
```

### 查看示例程序

命令 `rustlings list` 向你展示了现有的程序，所以你可以在任何时候查看这些程序的代码，你只需要将完整路径复制到你的终端作为命令 [cat][5] 或者 [less][6] 的参数：

```
$ cat exercises/intro/intro1.rs
```

### 验证你的程序

现在你可以开始调试程序了。你可以使用命令 `verify` 来做这件事。注意 Rustlings 选择了列表里的第一个程序（`intro1.rs`）并尝试去编译它，最后编译成功：

```
$ rustlings verify
Progress: [-----------------------------------] 0/84
✅ Successfully ran exercises/intro/intro1.rs!

You can keep working on this exercise,
or jump into the next one by removing the `I AM NOT DONE` comment:

 6 |  // Execute the command `rustlings hint intro1` for a hint.
 7 |  
 8 |  // I AM NOT DONE
 9 |
```

正如你从结果中所见，尽管示例代码成功编译了，你依然需要做一些工作。每个示例程序的源文件中都带有以下注释：

```
$ grep "NOT DONE" exercises/intro/intro1.rs
// I AM NOT DONE
```

虽然第一个程序的编译没有问题，除非你去掉注释 `I AM NOT DONE`，Rustlings 不会移到下一个程序。

### 来到下一个练习

一旦你从 `intro1.rs` 中去掉这些注释，你就可以通过再一次运行命令 `rustlings verify` 来到下一个练习。这一次，你会发现 Rustlings 尝试去编译这个系列中的下一个程序（`intro2.rs`），但是遇到了一个错误。你应该调试并修复这个问题，并前进。这是你理解为什么 Rust 说程序有漏洞的至关重要的一步。

```
$ rustlings verify
Progress: [>------------------------] 1/84
⚠️  Compiling of exercises/intro/intro2.rs failed! Please try again. Here's the output:
error: 1 positional argument in format string, but no arguments were given
 --> exercises/intro/intro2.rs:8:21
  |
8 |         println!("Hello {}!");
  |                         ^^

error: aborting due to previous error
```

### 来点提示

Rustlings 有一个非常好用的 `hint` 参数，这个参数会告诉你示例程序中哪里出错了，以及如何去修复它。你可以认为这是在编译错误信息基础之上，一个额外的帮助选项。

```
$ rustlings hint intro2
Add an argument after the format string.
```

基于以上提示，修复这个程序就很简单了。你只需要在语句 `println` 中加一个额外的参数。这个 diff 对比应该能帮你理解发生的变化：

```
< println!("Hello {}!", "world");
---
> println!("Hello {}!");
```

一旦你做出了修改，并从源代码中去掉了注释 `NOT DONE`，你可以再一次运行 `rustlings verify` 来编译并运行代码。

```
$ rustlings verify
Progress: [>-------------------------------------] 1/84
✅ Successfully ran exercises/intro/intro2.rs!
```

### 追踪进度

你无法在一天之内做完所有的练习，忘记练到哪也很常见。你可以执行命令 `list` 来查看你的练习状态。

```
$ rustlings list
Name         Path                                  Status
intro1       exercises/intro/intro1.rs             Done   
intro2       exercises/intro/intro2.rs             Done   
variables1   exercises/variables/variables1.rs     Pending
variables2   exercises/variables/variables2.rs     Pending
variables3   exercises/variables/variables3.rs     Pending
[...]
```

### 运行特定的练习

如果你不想从头开始并且想要跳过一些练习，Rustlings 允许你使用命令 `rustlings run` 来专注特定的练习。如此可以运行指定的程序而不需要验证之前的课程。例如：

```
$ rustlings run intro2
Hello world!
✅ Successfully ran exercises/intro/intro2.rs
$ rustlings run variables1
```

敲入练习名字可能会变得乏味，但 Rustlings 为你准备了便利的命令 `next` 用来移向系列中的下一个练习。

```
$ rustlings run next
```

### 替代命令 watch

如果你不想在每次修改后还要敲一次 `verify`，你可以在终端窗口中运行命令 `watch`，然后再继续修改源代码以解决问题。命令 `watch` 会检测到这些修改，然后重新编译以查看这些问题是否被解决。

```
$ rustlings watch
```

### 通过调试学习

Rust 编译器以提供非常有意义的错误信息而被熟知，这些错误信息会帮助你理解在你代码中的问题。这通常意味着更快的调试。Rustlings 是练习 Rust，学会阅读错误信息，并理解 Rust 语言的优秀途径。来看看 [GitHub][7] 上 Rustlings 5.0.0 的最新功能吧。

> **[下载 Rust 速查表][8]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/learn-rust-rustlings

作者：[Gaurav Kamathe][a]
选题：[lkxed][b]
译者：[yzuowei](https://github.com/yzuowei)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/rust_programming_crab_sea.png
[2]: https://opensource.com/article/22/6/rust-toolchain-rustup
[3]: https://github.com/rust-lang/rustlings
[4]: https://opensource.com/article/22/6/rust-toolchain-rustup
[5]: https://opensource.com/article/19/2/getting-started-cat-command
[6]: https://opensource.com/article/18/4/using-less-view-text-files-command-line
[7]: https://github.com/rust-lang/rustlings/releases/tag/5.0.0
[8]: https://opensource.com/downloads/rust-cheat-sheet
