[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11977-1.html)
[#]: subject: (Getting started with the Rust package manager, Cargo)
[#]: via: (https://opensource.com/article/20/3/rust-cargo)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Rust 包管理器 Cargo 入门
======

> 了解 Rust 的软件包管理器和构建工具。

![](https://img.linux.net.cn/data/attachment/album/202003/09/104906tdl21k977t8999qt.jpg)

[Rust][2] 是一种现代编程语言，可提供高性能、可靠性和生产力。几年来，它一直被 StackOverflow 调查评为[最受欢迎的语言][3]。

除了是一种出色的编程语言之外，Rust 还具有一个称为 Cargo 的构建系统和软件包管理器。Cargo 处理许多任务，例如构建代码、下载库或依赖项等等。这两者捆绑在一起，因此在安装 Rust 时会得到 Cargo。

### 安装 Rust 和 Cargo

在开始之前，你需要安装 Rust 和 Cargo。Rust 项目提供了一个可下载的脚本来处理安装。要获取该脚本，请打开浏览器以访问 [https://sh.rustup.rs][4] 并保存该文件。阅读该脚本以确保你对它的具体行为有所了解，然后再运行它：

```
$ sh ./rustup.rs
```

你也可以参考这个[安装 Rust][5] 的网页以获取更多信息。

安装 Rust 和 Cargo 之后，你必须<ruby>获取<rt>source</rt></ruby> `env` 文件中的配置：

```
$ source $HOME/.cargo/env
```

更好的办法是，将所需目录添加到 `PATH` 环境变量中：

```
export PATH=$PATH:~/.cargo/bin
```

如果你更喜欢使用软件包管理器（例如 Linux 上的 DNF 或 Apt），请在发行版本的存储库中查找 Rust 和 Cargo 软件包，并进行相应的安装。 例如：

```
$ dnf install rust cargo
```

安装并设置它们后，请验证你拥有的 Rust 和 Cargo 版本：

```
$ rustc --version
rustc 1.41.0 (5e1a79984 2020-01-27)
$ cargo --version
cargo 1.41.0 (626f0f40e 2019-12-03)
```

### 手动构建和运行 Rust

从在屏幕上打印“Hello, world!”的简单程序开始。打开你喜欢的文本编辑器，然后键入以下程序：

```
$ cat hello.rs
fn main() {
    println!("Hello, world!");
}
```

以扩展名 `.rs` 保存文件，以将其标识为 Rust 源代码文件。

使用 Rust 编译器 `rustc` 编译程序：

```
$ rustc hello.rs
```

编译后，你将拥有一个与源程序同名的二进制文件：

```
$ ls -l
total 2592
-rwxr-xr-x. 1 user group 2647944 Feb 13 14:14 hello
-rw-r--r--. 1 user group      45 Feb 13 14:14 hello.rs
$
```

执行程序以验证其是否按预期运行：

```
$ ./hello
Hello, world!
```

这些步骤对于较小的程序或任何你想快速测试的东西就足够了。但是，在进行涉及到多人的大型程序时，Cargo 是前进的最佳之路。

### 使用 Cargo 创建新包

Cargo 是 Rust 的构建系统和包管理器。它可以帮助开发人员下载和管理依赖项，并帮助创建 Rust 包。在 Rust 社区中，Rust 中的“包”通常被称为“crate”（板条箱），但是在本文中，这两个词是可以互换的。请参阅 Rust 社区提供的 Cargo [FAQ][6] 来区分。

如果你需要有关 Cargo 命令行实用程序的任何帮助，请使用 `--help` 或 `-h` 命令行参数：

```
$ cargo –help
```

要创建一个新的包，请使用关键字 `new`，跟上包名称。在这个例子中，使用 `hello_opensource` 作为新的包名称。运行该命令后，你将看到一条消息，确认 Cargo 已创建具有给定名称的二进制包：

```
$ cargo new hello_opensource
     Created binary (application) `hello_opensource` package
```

运行 `tree` 命令以查看目录结构，它会报告已创建了一些文件和目录。首先，它创建一个带有包名称的目录，并且在该目录内有一个存放你的源代码文件的 `src` 目录：

```
$ tree .
.
└── hello_opensource
    ├── Cargo.toml
    └── src
        └── main.rs

2 directories, 2 files
```

Cargo 不仅可以创建包，它也创建了一个简单的 “Hello, world” 程序。打开 `main.rs` 文件看看：

```
$ cat hello_opensource/src/main.rs
fn main() {
    println!("Hello, world!");
}
```

下一个要处理的文件是 `Cargo.toml`，这是你的包的配置文件。它包含有关包的信息，例如其名称、版本、作者信息和 Rust 版本信息。

程序通常依赖于外部库或依赖项来运行，这使你可以编写应用程序来执行不知道如何编码或不想花时间编码的任务。你所有的依赖项都将在此文件中列出。此时，你的新程序还没有任何依赖关系。打开 `Cargo.toml` 文件并查看其内容：

```
$ cat hello_opensource/Cargo.toml
[package]
name = "hello_opensource"
version = "0.1.0"
authors = ["user <user@mail.com>"]
edition = "2018"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
```

### 使用 Cargo 构建程序

到目前为止，一切都很顺利。现在你已经有了一个包，可构建一个二进制文件（也称为可执行文件）。在此之前，进入包目录：

```
$ cd hello_opensource/
```

你可以使用 Cargo 的 `build` 命令来构建包。注意消息说它正在“编译”你的程序：

```
$ cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.38s
```

运行 `build` 命令后，检查项目目录发生了什么：

```
$ tree .
.
├── Cargo.lock
├── Cargo.toml
├── src
│   └── main.rs
└── target
    └── debug
        ├── build
        ├── deps
        │   ├── hello_opensource-147b8a0f466515dd
        │   └── hello_opensource-147b8a0f466515dd.d
        ├── examples
        ├── hello_opensource
        ├── hello_opensource.d
        └── incremental
            └── hello_opensource-3pouh4i8ttpvz
                ├── s-fkmhjmt8tj-x962ep-1hivstog8wvf
                │   ├── 1r37g6m45p8rx66m.o
                │   ├── 2469ykny0eqo592v.o
                │   ├── 2g5i2x8ie8zed30i.o
                │   ├── 2yrvd7azhgjog6zy.o
                │   ├── 3g9rrdr4hyk76jtd.o
                │   ├── dep-graph.bin
                │   ├── query-cache.bin
                │   ├── work-products.bin
                │   └── wqif2s56aj0qtct.o
                └── s-fkmhjmt8tj-x962ep.lock

9 directories, 17 files
```

哇！编译过程产生了许多中间文件。另外，你的二进制文件将以与软件包相同的名称保存在 `./target/debug` 目录中。

### 使用 Cargo 运行你的应用程序

现在你的二进制文件已经构建好了，使用 Cargo 的 `run` 命令运行它。如预期的那样，它将在屏幕上打印 `Hello, world!`。

```
$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.01s
     Running `target/debug/hello_opensource`
Hello, world!
```

或者，你可以直接运行二进制文件，该文件位于：

```
$ ls -l ./target/debug/hello_opensource
-rwxr-xr-x. 2 root root 2655552 Feb 13 14:19 ./target/debug/hello_opensource
```

如预期的那样，它产生相同的结果：

```
$ ./target/debug/hello_opensource
Hello, world!
```

假设你需要重建包，并丢弃早期编译过程创建的所有二进制文件和中间文件。Cargo 提供了一个方便的`clean` 选项来删除所有中间文件，但源代码和其他必需文件除外：

```
$ cargo clean
$ tree .
.
├── Cargo.lock
├── Cargo.toml
└── src
    └── main.rs

1 directory, 3 files
```

对程序进行一些更改，然后再次运行以查看其工作方式。例如，下面这个较小的更改将 `Opensource` 添加到 `Hello, world!` 字符串中：

```
$ cat src/main.rs
fn main() {
    println!("Hello, Opensource world!");
}
```

现在，构建该程序并再次运行它。这次，你会在屏幕上看到 `Hello, Opensource world!`：

```
$ cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.39s

$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.01s
     Running `target/debug/hello_opensource`
Hello, Opensource world!
```

### 使用 Cargo 添加依赖项

Cargo 允许你添加程序需要运行的依赖项。使用 Cargo 添加依赖项非常容易。每个 Rust 包都包含一个 `Cargo.toml` 文件，其中包含一个依赖关系列表（默认为空）。用你喜欢的文本编辑器打开该文件，找到 `[dependencies]` 部分，然后添加要包含在包中的库。例如，将 `rand` 库添加为依赖项：

```
$ cat Cargo.toml
[package]
name = "hello_opensource"
version = "0.1.0"
authors = ["test user <test@mail.com>"]
edition = "2018"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
rand = "0.3.14"
```

试试构建你的包，看看会发生什么。

```
$ cargo build
    Updating crates.io index
   Compiling libc v0.2.66
   Compiling rand v0.4.6
   Compiling rand v0.3.23
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 4.48s
```

现在，Cargo 会联系 [Crates.io][9]（这是 Rust 用于存储 crate（或包）的中央仓库），并下载和编译 `rand`。但是，等等 —— `libc` 包是怎么回事？你没有要安装 libc 啊。是的，`rand` 包依赖于 `libc` 包；因此，Cargo 也会下载并编译 `libc`。

库的新版本会不断涌现，而 Cargo 提供了一种使用 `update` 命令更新其所有依赖关系的简便方法：

```
cargo update
```

你还可以选择使用 `-p` 标志跟上包名称来更新特定的库：

```
cargo update -p rand
```

### 使用单个命令进行编译和运行

到目前为止，每当对程序进行更改时，都先使用了 `build` 之后是 `run`。有一个更简单的方法：你可以直接使用 `run` 命令，该命令会在内部进行编译并运行该程序。要查看其工作原理，请首先清理你的软件包目录：

```
$ cargo clean
$ tree .
.
├── Cargo.lock
├── Cargo.toml
└── src
    └── main.rs

1 directory, 3 files
```

现在执行 `run`。输出信息表明它已进行编译，然后运行了该程序，这意味着你不需要每次都显式地运行 `build`：

```
$ cargo run
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.41s
     Running `target/debug/hello_opensource`
Hello, world!
```

### 在开发过程中检查代码

在开发程序时，你经常会经历多次迭代。你需要确保你的程序没有编码错误并且可以正常编译。你不需要负担在每次编译时生成二进制文件的开销。Cargo 为你提供了一个 `check` 选项，该选项可以编译代码，但跳过了生成可执行文件的最后一步。首先在包目录中运行 `cargo clean`：

```
$ tree .
.
├── Cargo.lock
├── Cargo.toml
└── src
    └── main.rs

1 directory, 3 files
```

现在运行 `check` 命令，查看对目录进行了哪些更改：

```
$ cargo check
    Checking hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.18s
```

该输出显示，即使在编译过程中创建了中间文件，但没有创建最终的二进制文件或可执行文件。这样可以节省一些时间，如果该包包含了数千行代码，这非常重要：

```
$ tree .
.
├── Cargo.lock
├── Cargo.toml
├── src
│   └── main.rs
└── target
    └── debug
        ├── build
        ├── deps
        │   ├── hello_opensource-842d9a06b2b6a19b.d
        │   └── libhello_opensource-842d9a06b2b6a19b.rmeta
        ├── examples
        └── incremental
            └── hello_opensource-1m3f8arxhgo1u
                ├── s-fkmhw18fjk-542o8d-18nukzzq7hpxe
                │   ├── dep-graph.bin
                │   ├── query-cache.bin
                │   └── work-products.bin
                └── s-fkmhw18fjk-542o8d.lock

9 directories, 9 files
```

要查看你是否真的节省了时间，请对 `build` 和 `check` 命令进行计时并进行比较。首先，计时 `build` 命令：

```
$ time cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.40s

real    0m0.416s
user    0m0.251s
sys     0m0.199s
```

在运行 `check` 命令之前清理目录：

```
$ cargo clean
```

计时 `check` 命令：

```
$ time cargo check
    Checking hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.15s

real    0m0.166s
user    0m0.086s
sys     0m0.081s
```

显然，`check` 命令要快得多。

### 建立外部 Rust 包

到目前为止，你所做的这些都可以应用于你从互联网上获得的任何 Rust crate。你只需要下载或克隆存储库，移至包文件夹，然后运行 `build` 命令，就可以了：

```
git clone <github-like-url>
cd <package-folder>
cargo build
```

### 使用 Cargo 构建优化的 Rust 程序

到目前为止，你已经多次运行 `build`，但是你注意到它的输出了吗？不用担心，再次构建它并密切注意：

```
$ cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.36s
```

看到了每次编译后的 `[unoptimized + debuginfo]` 文本了吗？这意味着 Cargo 生成的二进制文件包含大量调试信息，并且未针对执行进行优化。开发人员经常经历开发的多次迭代，并且需要此调试信息进行分析。同样，性能并不是开发软件时的近期目标。因此，对于现在而言是没问题的。

但是，一旦准备好发布软件，就不再需要这些调试信息。而是需要对其进行优化以获得最佳性能。在开发的最后阶段，可以将 `--release` 标志与 `build` 一起使用。仔细看，编译后，你应该会看到 `[optimized]` 文本：

```
$ cargo build --release
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished release [optimized] target(s) in 0.29s
```

如果愿意，你可以通过这种练习来了解运行优化软件与未优化软件时节省的时间。

### 使用 Cargo 创建库还是二进制文件

任何软件程序都可以粗略地分类为独立二进制文件或库。一个独立二进制文件也许即使是当做外部库使用的，自身也是可以运行的。但是，作为一个库，是可以被另一个独立二进制文件所利用的。到目前为止，你在本教程中构建的所有程序都是独立二进制文件，因为这是 Cargo 的默认设置。 要创建一个**库**，请添加 `--lib` 选项：

```
$ cargo new --lib libhello
     Created library `libhello` package
```

这次，Cargo 不会创建 `main.rs` 文件，而是创建一个 `lib.rs` 文件。 你的库的代码应该是这样的：

```
$ tree .
.
└── libhello
    ├── Cargo.toml
    └── src
        └── lib.rs

2 directories, 2 files
```

Cargo 就是这样的，不要奇怪，它在你的新库文件中添加了一些代码。通过移至包目录并查看文件来查找添加的内容。默认情况下，Cargo 在库文件中放置一个测试函数。

### 使用 Cargo 运行测试

Rust 为单元测试和集成测试提供了一流的支持，而 Cargo 允许你执行以下任何测试：

```
$ cd libhello/

$ cat src/lib.rs
#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
```

Cargo 有一个方便的 `test` 命令，可以运行代码中存在的任何测试。尝试默认运行 Cargo 在库代码中放入的测试：

```
$ cargo test
   Compiling libhello v0.1.0 (/opensource/libhello)
    Finished test [unoptimized + debuginfo] target(s) in 0.55s
     Running target/debug/deps/libhello-d52e35bb47939653

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out

   Doc-tests libhello

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out
```

### 深入了解 Cargo 内部

你可能有兴趣了解在运行一个 Cargo 命令时它底下发生了什么。毕竟，在许多方面，Cargo 只是个封装器。要了解它在做什么，你可以将 `-v` 选项与任何 Cargo 命令一起使用，以将详细信息输出到屏幕。

这是使用 `-v` 选项运行 `build` 和 `clean` 的几个例子。

在 `build` 命令中，你可以看到这些给定的命令行选项触发了底层的 `rustc`（Rust 编译器）：

```
$ cargo build -v
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
     Running `rustc --edition=2018 --crate-name hello_opensource src/main.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C debuginfo=2 -C metadata=147b8a0f466515dd -C extra-filename=-147b8a0f466515dd --out-dir /opensource/hello_opensource/target/debug/deps -C incremental=/opensource/hello_opensource/target/debug/incremental -L dependency=/opensource/hello_opensource/target/debug/deps`
    Finished dev [unoptimized + debuginfo] target(s) in 0.36s
```

而 `clean` 命令表明它只是删除了包含中间文件和二进制文件的目录：

```
$ cargo clean -v
    Removing /opensource/hello_opensource/target
```

### 不要让你的技能生锈

要扩展你的技能，请尝试使用 Rust 和 Cargo 编写并运行一个稍微复杂的程序。很简单就可以做到：例如，尝试列出当前目录中的所有文件（可以用 9 行代码完成），或者尝试自己回显输入。小型的实践应用程序可帮助你熟悉语法以及编写和测试代码的过程。

本文为刚起步的 Rust 程序员提供了大量信息，以使他们可以开始入门 Cargo。但是，当你开始处理更大、更复杂的程序时，你需要对 Cargo 有更深入的了解。当你准备好迎接更多内容时，请下载并阅读 Rust 团队编写的开源的《[Cargo 手册][10]》，看看你可以创造什么！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/rust-cargo

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers2.png?itok=idd8duC_ (Shipping containers stacked in a yard)
[2]: https://www.rust-lang.org/
[3]: https://insights.stackoverflow.com/survey/2019#technology-_-most-loved-dreaded-and-wanted-languages
[4]: https://sh.rustup.rs/
[5]: https://www.rust-lang.org/tools/install
[6]: https://doc.rust-lang.org/cargo/faq.html
[7]: mailto:user@mail.com
[8]: mailto:test@mail.com
[9]: http://crates.io
[10]: https://doc.rust-lang.org/cargo
