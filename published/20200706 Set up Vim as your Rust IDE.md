[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12530-1.html)
[#]: subject: (Set up Vim as your Rust IDE)
[#]: via: (https://opensource.com/article/20/7/vim-rust-ide)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

将 Vim 设置为 Rust IDE
======

> Vim 编辑器是很好的 Rust 应用开发环境。

![Ferris the crab under the sea, unofficial logo for Rust programming language][1]

[Rust][2] 语言旨在以 C++ 开发人员熟悉的方式实现具有安全并发性和高内存性能的系统编程。它也是 [Stack Overflow 的 2019 年开发人员调查][3]中最受欢迎的编程语言之一。

文本编辑器和[集成开发环境（IDE）工具][4]使编写 Rust 代码更加轻松快捷。有很多编辑器可供选择，但是我相信 [Vim 编辑器][5]非常适合作为 Rust IDE。在本文中，我将说明如何为 Rust 应用开发设置 Vim。

### 安装 Vim

Vim 是 Linux 和 Unix 中最常用的命令行文本编辑器之一。最新版本（在编写本文时）是 [8.2][6]，它在使用方式上提供了前所未有的灵活性。

[Vim 的下载页面][7]提供了多种二进制或软件包形式安装。例如，如果使用 macOS，那么可以安装 [MacVim][8] 项目，然后通过[安装 Vim 插件][9] 扩展 Vim 的功能。

要设置 Rust 进行开发，请下载 [Rustup][10]，这是一个方便的 Rust 安装器工具，并在你的终端上运行以下命令（如果你使用 macOS、Linux 或任何其他类 Unix 系统）：

```
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

在提示中选择安装选项。然后，你将看到如下输出：

```
stable installed - rustc 1.43.1 (8d69840ab 2020-05-04)

Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done
automatically.

To configure your current shell run source $HOME/.cargo/env
```

### 语法高亮

Vim 能让你通过 `.vimrc` 文件配置你的运行时环境。要启用语法高亮，请打开 `.vimrc` 文件（如果不存在就创建一个）：

```
$ vim ~/.vimrc
```

在 `.vimrc` 中添加以下内容并保存：

```
filetype plugin indent on
syntax on
```

第一行同时打开检测、插件和缩进配置。第二行启用语法高亮。这些功能将帮助你在 Rust 中管理开发流程。在 Vim 的[帮助文件][11]中了解更多信息。

### 在 Vim 中创建一个 Rust 应用

要使用 Vim 创建一个新的 Rust HelloWorld 应用（`hello.rs`），请输入：

```
$ vim hello.rs
```

输入以下 Rust 代码在控制台中打印 `Hello World!`：

```
fn main() {
    println!("Hello World");
}
```

它看起来应该像这样：

![Rust code with syntax highlighting][12]

没有语法高亮的样子如下：

![Rust code without syntax highlighting][14]

你是否注意到 Vim 自动缩进和组织代码？那是因为你在 `.vimrc` 文件中输入了第一行。

很好！接下来，你将使用 Rust 的包管理器 [Cargo][15] 构建此应用。

### Cargo 集成

Cargo 使创建应用更加容易。要查看操作方法，请创建一个基于 Cargo 的 HelloWorld 应用。如果你尚未在 Linux 或 macOS 系统上安装 Cargo，请输入：

```
$ curl https://sh.rustup.rs -sSf | sh
```

然后使用 Cargo 创建包：

```
$ cargo new my_hello_world
```

如果查看目录结构，你会看到 Cargo 自动生成一些源码和目录。如果你安装了 `tree`，请运行它查看目录结构：

```
$ tree my_hello_world
my_hello_world
├── Cargo.toml
└── src
    └── main.rs

1 directory, 2 files
```

在 Vim 中打开 `main.rs` 源码文件：

```
$ vim my_hello_world/src/main.rs
```

它与你在上面手动创建的 HelloWorld 示例中的代码相同。用 `Rust with Vim` 代替 `World`：

```
 fn main() {
      println!("Hello, Rust with Vim");
 }
```

使用 `:wq` 保存更改并退出 Vim。

### 编译你的应用

现在你可以使用 `cargo build` 编译你的第一个 Rust 应用：


```
$ cd my_hello_world
$ cargo build
```

你的终端输出将类似于以下内容：

```
   Compiling my_hello_world v0.1.0 (/Users/danieloh/cloud-native-app-dev/rust/my_hello_world)

    Finished dev [unoptimized + debuginfo] target(s) in 0.60s
```

你可能会看到一条警告消息，因为你重用了示例包名 `my_hello_world`，但现在可以忽略它。

运行应用：

```
$ target/debug/my_hello_world
Hello, Rust with Vim!
```

你也可以使用 `cargo run` 一次构建和运行应用：

```
$ cargo run
 
    Finished dev [unoptimized + debuginfo] target(s) in 0.00s
     Running `target/debug/my_hello_world`
Hello, Rust with Vim!!
```

恭喜！你在本地的 Vim 编辑器中设置了 Rust IDE，开发了第一个 Rust 应用，并使用 Cargo 包管理器工具构建、测试和运行了它。如果你想学习其他 Cargo 命令，请运行 `cargo help`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/vim-rust-ide

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rust_programming_crab_sea.png?itok=2eWLz8A5 (Ferris the crab under the sea, unofficial logo for Rust programming language)
[2]: https://www.rust-lang.org/
[3]: https://insights.stackoverflow.com/survey/2019#technology-_-most-loved-dreaded-and-wanted-languages
[4]: https://en.wikipedia.org/wiki/Integrated_development_environment
[5]: https://opensource.com/resources/what-vim
[6]: https://github.com/vim/vim
[7]: https://www.vim.org/download.php
[8]: https://github.com/macvim-dev/macvim
[9]: https://opensource.com/article/20/2/how-install-vim-plugins
[10]: https://rustup.rs/
[11]: http://vimdoc.sourceforge.net/htmldoc/filetype.html#:filetype-overview
[12]: https://opensource.com/sites/default/files/uploads/rust_helloworld.png (Rust code with syntax highlighting)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://opensource.com/sites/default/files/uploads/rust_helloworld_no-syntax.png (Rust code without syntax highlighting)
[15]: https://opensource.com/article/20/3/rust-cargo
