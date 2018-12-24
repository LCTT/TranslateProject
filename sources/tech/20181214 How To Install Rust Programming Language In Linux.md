[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install Rust Programming Language In Linux)
[#]: via: (https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

How To Install Rust Programming Language In Linux
======

Rust is often called rust-lang.

Rust is a general-purpose, multi-paradigm, modern, cross-platform, and open source systems programming language sponsored by Mozilla Research.

It was designed to be achieve a goals such as safety, speed, and concurrency.

Rust is syntactically similar to C++,[14] but its designers intend it to provide better memory safety while still maintaining performance.

Rust is currently used in many organization such as Firefox, Chef, Dropbox, Oracle, GNOME, etc,.

### How to Install Runs Language in Linux?

There are many ways we can install Rust but below is the officially recommended way to install it.

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
 77.7 MiB / 77.7 MiB (100 %) 1.2 MiB/s ETA: 0 s
info: downloading component 'rust-std'
 54.2 MiB / 54.2 MiB (100 %) 1.2 MiB/s ETA: 0 s
info: downloading component 'cargo'
 4.7 MiB / 4.7 MiB (100 %) 1.2 MiB/s ETA: 0 s
info: downloading component 'rust-docs'
 8.5 MiB / 8.5 MiB (100 %) 1.2 MiB/s ETA: 0 s
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

Run the following command to configure your current shell.

```
$ source $HOME/.cargo/env
```

Run the following command to verify the installed Rust version.

```
$ rustc --version
rustc 1.31.0 (abe02cefd 2018-12-04)
```

### How To Test Rust programming language?

Once you installed Rust follow the below steps to check whether Rust programe language is working fine or not.

```
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```

Create a file and add the below code and save the file. Make sure, Rust files always end in a .rs extension.

```
$ vi 2g.rs

fn main() {
 println!("Hello, It's 2DayGeek.com - Best Linux Practical Blog!");
}
```

Run the following command to compile the rust code.

```
$ rustc 2g.rs
```

The above command will create a executable Rust program file in the same directory.

```
$ ls -lh
total 3.9M
-rwxr-xr-x 1 daygeek daygeek 3.9M Dec 14 11:09 2g
-rw-r--r-- 1 daygeek daygeek 86 Dec 14 11:09 2g.rs
```

Run the Rust executable file to get the output.

```
$ ./2g
Hello, It's 2DayGeek.com - Best Linux Practical Blog!
```

Yup! that’s working fine.

To update Rust to latest version.

```
$ rustup update
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: checking for self-updates

 stable-x86_64-unknown-linux-gnu unchanged - rustc 1.31.0 (abe02cefd 2018-12-04)
```

Run the following command to remove the Rust package from your system.

```
$ rustup self uninstall
```

Once you uninstalled the Rust package, remove the Rust project directory.

```
$ rm -fr ~/projects
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
