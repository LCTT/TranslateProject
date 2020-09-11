[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10392-1.html)
[#]: subject: (How To Install Rust Programming Language In Linux)
[#]: via: (https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

如何在 Linux 中安装 Rust 编程语言
======

Rust 通常被称为 rust-lang。Rust 是一个由 Mozilla Research 赞助的通用的、多范式、现代的、跨平台和开源系统编程语言。

它旨在实现安全性、速度和并发性等目标。

Rust 在语法上与 C++ 相似，但它的设计者希望它在保持性能的同时提供更好的内存安全性。

Rust 目前在许多组织中使用，例如 Firefox、Chef、Dropbox、Oracle、GNOME 等。

### 如何在 Linux 中安装 Rust 语言？

我们可以通过多种方式安装 Rust，但以下是官方推荐的安装方式。

```
$ curl https://sh.rustup.rs -sSf | sh
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust programming 
language, and its package manager, Cargo.

It will add the cargo, rustc, rustup and other commands to Cargo's bin 
directory, located at:

  /home/daygeek/.cargo/bin

This path will then be added to your PATH environment variable by modifying the
profile files located at:

  /home/daygeek/.profile
  /home/daygeek/.bash_profile

You can uninstall at any time with rustup self uninstall and these changes will
be reverted.

Current installation options:

   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
>1

info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: latest update on 2018-12-06, rust version 1.31.0 (abe02cefd 2018-12-04)
info: downloading component 'rustc'
 77.7 MiB /  77.7 MiB (100 %)   1.2 MiB/s ETA:   0 s                
info: downloading component 'rust-std'
 54.2 MiB /  54.2 MiB (100 %)   1.2 MiB/s ETA:   0 s                
info: downloading component 'cargo'
  4.7 MiB /   4.7 MiB (100 %)   1.2 MiB/s ETA:   0 s                
info: downloading component 'rust-docs'
  8.5 MiB /   8.5 MiB (100 %)   1.2 MiB/s ETA:   0 s                
info: installing component 'rustc'
info: installing component 'rust-std'
info: installing component 'cargo'
info: installing component 'rust-docs'
info: default toolchain set to 'stable'

  stable installed - rustc 1.31.0 (abe02cefd 2018-12-04)


Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH 
environment variable. Next time you log in this will be done automatically.

To configure your current shell run source $HOME/.cargo/env
```

运行以下命令配置当前 shell。

```
$ source $HOME/.cargo/env
```

运行以下命令验证已安装的 Rust 版本。

```
$ rustc --version
rustc 1.31.0 (abe02cefd 2018-12-04)
```

### 如何测试 Rust 编程语言？

安装 Rust 后，请按照以下步骤检查 Rust 语言是否正常工作。

```
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```

创建一个文件并添加以下代码并保存。确保 Rust 文件始终以 .rs 扩展名结尾。

```
$ vi 2g.rs

fn main() {
 println!("Hello, It's 2DayGeek.com - Best Linux Practical Blog!");
}
```

运行以下命令编译 rust 代码。

```
$ rustc 2g.rs
```

上面的命令将在同一目录中创建一个可执行的 Rust 程序。

```
$ ls -lh
total 3.9M
-rwxr-xr-x 1 daygeek daygeek 3.9M Dec 14 11:09 2g
-rw-r--r-- 1 daygeek daygeek 86 Dec 14 11:09 2g.rs
```

运行 Rust 可执行文件得到输出。

```
$ ./2g
Hello, It's 2DayGeek.com - Best Linux Practical Blog!
```

好了！正常工作了。

将 Rust 更新到最新版本。

```
$ rustup update
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: checking for self-updates

  stable-x86_64-unknown-linux-gnu unchanged - rustc 1.31.0 (abe02cefd 2018-12-04)
```

运行以下命令从系统中删除 Rust 包。

```
$ rustup self uninstall
```

卸载 Rust 包后，删除 Rust 项目目录。

```
$ rm -fr ~/projects
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
