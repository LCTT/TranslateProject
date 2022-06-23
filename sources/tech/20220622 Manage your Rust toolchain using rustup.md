[#]: subject: "Manage your Rust toolchain using rustup"
[#]: via: "https://opensource.com/article/22/6/rust-toolchain-rustup"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage your Rust toolchain using rustup
======
Rustup can be used to install Rust and keep it updated. It also allows you to seamlessly switch between the stable, beta, and nightly Rust compilers and tooling.

![Tools illustration][1]

Image by: Opensource.com

The [Rust programming language][2] is becoming increasingly popular these days, used and loved by hobbyists and corporations alike. One of the reasons for its popularity is the amazing tooling that Rust provides making it a joy to use for developers. [Rustup][3] is the official tool used to manage Rust tooling. Not only can it be used to install Rust and keep it updated, it also allows you to seamlessly switch between the stable, beta, and nightly Rust compilers and tooling. This article will introduce you to rustup and some common commands to use.

### Default Rust installation method

If you want to install Rust on Linux, you can use your package manager. On Fedora or CentOS Stream you can use this, for example:

```
$ sudo dnf install rust cargo
```

This provides a stable version of the Rust toolchain, and works great if you are a beginner to Rust and want to try compiling and running simple programs. However, because Rust is a new programming language it changes fast and a lot of new features are frequently added. These features are part of the nightly and later beta version of the Rust toolchain. To try out these features you need to install these newer versions of the toolchain, without affecting the stable version on the system. Unfortunately, your distro’s package manager can’t help you here.

### Installing Rust toolchain using rustup

To get around the above issues, you can download an install script:

```
$ curl --proto '=https' --tlsv1.2 \
-sSf https://sh.rustup.rs > sh.rustup.rs
```

Inspect it, and then run it. It doesn’t require root privileges and installs Rust accordingly to your local user privileges:

```
$ file sh.rustup.rs
sh.rustup.rs: POSIX shell script, ASCII text executable
$ less sh.rustup.rs
$ bash sh.rustup.rs
```

Select option 1 when prompted:

```
1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
> 1
```

After installation, you must source the environment variables to ensure that the `rustup` command is immediately available for you to use:

```
$ source $HOME/.cargo/env
```

Verify that the Rust compiler (rustc) and Rust package manager (cargo) are installed:

```
$ rustc --version
$ cargo --version
```

### See installed and active toolchains

You can view the different toolchains that were installed and which one is the active one using the following command:

```
$ rustup show
```

### Switch between toolchains

You can view the default toolchain and change it as required. If you’re currently on a stable toolchain and wish to try out a newly introduced feature that is available in the nightly version you can easily switch to the nightly toolchain:

```
$ rustup default
$ rustup default nightly
```

To see the exact path of the compiler and package manager of Rust:

```
$ rustup which rustc
$ rustup which cargo
```

### Checking and Updating the toolchain

To check whether a new Rust toolchain is available:

```
$ rustup check
```

Suppose a new version of Rust is released with some interesting features, and you want to get the latest version of Rust. You can do that with the `update` subcommand:

```
$ rustup update
```

### Help and documentation

The above commands are more than sufficient for day-to-day use. Nonetheless, rustup has a variety of commands and you can refer to the help section for additional details:

```
$ rustup --help
```

Rustup has an entire [book][4] on GitHub that you can use as a reference. All the Rust documentation is installed on your local system, which does not require you to be connected to the Internet. You can access the local documentation which includes the book, standard library, and so on:

```
$ rustup doc
$ rustup doc --book
$ rustup doc --std
$ rustup doc --cargo
```

Rust is an exciting language under active development. If you’re interested in where programming is headed, keep up with Rust!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/rust-toolchain-rustup

作者：[Gaurav Kamathe][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/tools_hardware_purple.png
[2]: https://www.rust-lang.org/
[3]: https://github.com/rust-lang/rustup
[4]: https://rust-lang.github.io/rustup/
