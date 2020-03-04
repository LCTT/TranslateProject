[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with the Rust package manager, Cargo)
[#]: via: (https://opensource.com/article/20/3/rust-cargo)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Getting started with the Rust package manager, Cargo
======
Get to know Rust's package manager and build tool.
![Shipping containers stacked in a yard][1]

[Rust][2] is a modern programming language that provides performance, reliability, and productivity. It has consistently been voted as the [most-loved language][3] on StackOverflow surveys for a few years now.

In addition to being a great programming language, Rust also features a build system and package manager called Cargo. Cargo handles a lot of tasks, like building code, downloading libraries or dependencies, and so on. The two are bundled together, so you get Cargo when you install Rust.

### Installing Rust and Cargo

Before getting started, you need to install Rust and Cargo. The Rust project provides a downloadable script to handle the installation. To get the script, open a browser to [https://sh.rustup.rs][4] and save the file. Read the script to make sure you're happy with what it intends to do, and then run it:


```
`$ sh ./rustup.rs`
```

You can also refer to the [Install Rust][5] webpage for more information.

After installing Rust and Cargo, you must source the env file:


```
`$ source $HOME/.cargo/env`
```

Better yet, add the required directory to your PATH variable:


```
`$ source $HOME/.cargo/env`
```

If you prefer to use your package manager (such as DNF or Apt on Linux), look for Rust and Cargo packages in your distribution's repositories and install accordingly. For example:


```
`$ dnf install rust cargo`
```

Once they're installed and set up, verify which versions of Rust and Cargo you have:


```
$ rustc --version
rustc 1.41.0 (5e1a79984 2020-01-27)
$ cargo --version
cargo 1.41.0 (626f0f40e 2019-12-03)
```

### Building and running Rust by hand

Start with a simple program that prints "Hello, world!" on the screen. Open your favorite text editor and type the following program:


```
$ cat hello.rs
fn main() {
    println!("Hello, world!");
}
```

Save the file with an **.rs** extension to identify it as a Rust source code file.

Compile your program using the Rust compiler, **rustc**:


```
`$ rustc hello.rs`
```

After compilation, you will have a binary that has the same name as the source program:


```
$ ls -l
total 2592
-rwxr-xr-x. 1 user group 2647944 Feb 13 14:14 hello
-rw-r--r--. 1 user group      45 Feb 13 14:14 hello.rs
$
```

Execute your program to verify that it runs as expected:


```
$ ./hello
Hello, world!
```

These steps are sufficient for smaller programs or whenever you want to test out something quickly. However, when working on bigger programs involving multiple people, Cargo is the best way forward.

### Creating a new package using Cargo

Cargo is a build system and package manager for Rust. It helps developers download and manage dependencies and assists in creating Rust packages. Packages in Rust are often called "crates" in the Rust community, but in this article, the two words are interchangeable. Refer to the Cargo [FAQ][6] provided by the Rust community for clarification.

If you need any help with Cargo's command-line utility, use the **\--help** or **-h** command-line argument:


```
`$ cargo –help`
```

To create a new package, use the **new** keyword, followed by the package name. For this example, use **hello_opensource** as your new package name. After running the command, you will see a message confirming that Cargo has created a binary package with the given name:


```
$ cargo new hello_opensource
     Created binary (application) `hello_opensource` package
```

Running a **tree** command to see the directory structure reports that some files and directories were created. First, it creates a directory with the name of the package, and within that directory is an **src** directory for your source code files:


```
$ tree .
.
└── hello_opensource
    ├── Cargo.toml
    └── src
        └── main.rs

2 directories, 2 files
```

Cargo not only creates a package, but it also creates a simple **Hello, world!** program. Open the **main.rs** file and have a look:


```
$ cat hello_opensource/src/main.rs
fn main() {
    println!("Hello, world!");
}
```

The next file to work with is **Cargo.toml**, which is a configuration file for your package. It contains information about the package, such as its name, version, author information, and Rust edition information.

A program often depends on external libraries or dependencies to run, which enables you to write applications that perform tasks that you don't know how to code or you don't want to spend time coding. All your dependencies will be listed in this file. At this point, you do not have any dependencies for your new program. Open the **Cargo.toml** file and view its contents:


```
$ cat hello_opensource/Cargo.toml
[package]
name = "hello_opensource"
version = "0.1.0"
authors = ["user &lt;[user@mail.com][7]&gt;"]
edition = "2018"

# See more keys and their definitions at <https://doc.rust-lang.org/cargo/reference/manifest.html>

[dependencies]
```

### Building the program using Cargo

So far, so good. Now that you have a package in place, build a binary (also called an executable). Before doing that, move into the package directory:


```
`$ cd hello_opensource/`
```

You can use Cargo's **build** command to build the package. Notice the messages that say it is **Compiling** your program:


```
$ cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.38s
```

Check what happens to your project directory after you run the **build** command:


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

Wow! The compilations process produced a lot of intermediate files. Your binary, though, is saved in the **./target/debug** directory with the same name as your package.

### Running your application using Cargo

Now that your binary is built, run it using Cargo's **run** command. As expected, it prints **Hello, world!** on the screen.


```
$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.01s
     Running `target/debug/hello_opensource`
Hello, world!
```

Alternatively, you can run the binary directly, which is located at:


```
$ ls -l ./target/debug/hello_opensource
-rwxr-xr-x. 2 root root 2655552 Feb 13 14:19 ./target/debug/hello_opensource
```

As expected, it produces the same results:


```
$ ./target/debug/hello_opensource
Hello, world!
```

Say you need to rebuild your package and get rid of all the binaries and the intermediate files created by the earlier compilation process. Cargo provides a handy **clean** option to remove all intermediate files except the source code and other required files:


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

Make some changes to the program and run it again to see how it works. For example, this minor change adds **Opensource** to the **Hello, world!** string:


```
$ cat src/main.rs
fn main() {
    println!("Hello, Opensource world!");
}
```

Now, build the program and run it again. This time you see **Hello, Opensource world!** displayed on the screen:


```
$ cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.39s

$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.01s
     Running `target/debug/hello_opensource`
Hello, Opensource world!
```

### Adding dependencies using Cargo

Cargo allows you to add dependencies that your program needs to run. Adding a dependency is extremely easy with Cargo. Every Rust package includes a **Cargo.toml** file, which contains a list (empty by default) of dependencies. Open the file in your favorite text editor, find the **[dependencies]** section, and add the library you want to include in your package. For example, to add the **rand** library as your dependency:


```
$ cat Cargo.toml
[package]
name = "hello_opensource"
version = "0.1.0"
authors = ["test user &lt;[test@mail.com][8]&gt;"]
edition = "2018"

# See more keys and their definitions at <https://doc.rust-lang.org/cargo/reference/manifest.html>

[dependencies]
rand = "0.3.14"
```

Try building your package to see what happens.


```
$ cargo build
    Updating crates.io index
   Compiling libc v0.2.66
   Compiling rand v0.4.6
   Compiling rand v0.3.23
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 4.48s
```

Cargo is now reaching out to [Crates.io][9], which is Rust's central repository for crates (or packages) and downloading and compiling **rand**. But wait—what about the **libc** package? You did not ask for **libc** to be installed. Well, the **rand** package is dependent on the **libc** package; hence, Cargo downloads and compiles **libc** as well.

New versions of libraries keep coming, and Cargo provides an easy way to update all of their dependencies using the **update** command:


```
`cargo update`
```

You can also choose to update specific libraries using the **-p** flag followed by the package name:


```
`cargo update -p rand`
```

### Compiling and running with a single command

So far, you have used **build** followed by **run** whenever you make changes to your program. There is an easier way: you can simply use the **run** command, which internally compiles and runs the program. To see how it works, first clean up your package directory:


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

Now execute **run**. The output states that it compiled and then ran the program, and this means you don't need to explicitly run **build** each time:


```
$ cargo run
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.41s
     Running `target/debug/hello_opensource`
Hello, world!
```

### Checking your code in development

You often go through multiple iterations when developing a program. You need to ensure that your program has no coding errors and compiles fine. You don't need the overhead of generating the binary on each compilation. Cargo has you covered with a **check** option that compiles your code but skips the final step of generating an executable.

Start by running **cargo clean** within your package directory:


```
$ tree .
.
├── Cargo.lock
├── Cargo.toml
└── src
    └── main.rs

1 directory, 3 files
```

Now run the **check** command and see what changes were made to the directory:


```
$ cargo check
    Checking hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.18s
```

The output shows that, even though intermediate files were created as part of the compilation process, the final binary or executable was not created. This saves some time, which matters a lot if the package is huge with thousands of lines of code:


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

To see if you are really saving time, time the **build** and **check** commands and compare them.

First, the **build** command:


```
$ time cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.40s

real    0m0.416s
user    0m0.251s
sys     0m0.199s
```

Clean the directory before running the **check** command:


```
`$ cargo clean`
```

The **check** command:


```
$ time cargo check
    Checking hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.15s

real    0m0.166s
user    0m0.086s
sys     0m0.081s
```

Clearly, the **check** command is much faster.

### Building external Rust packages

Everything you've done so far will apply to any Rust crate you get from the internet. You simply need to download or clone the repository, move to the package folder, and run the **build** command, and you are good to go:


```
git clone &lt;github-like-url&gt;
cd &lt;package-folder&gt;
cargo build
```

### Building optimized Rust programs using Cargo

You've run **build** multiple times so far, but did you notice its output? No worries, build it again and watch closely:


```
$ cargo build
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished dev [unoptimized + debuginfo] target(s) in 0.36s
```

See the **[unoptimized + debuginfo]** text after each compilation? This means that the binary generated by Cargo includes a lot of debugging information and is not optimized for execution. Developers often go through multiple iterations of development and need this debugging information for analysis. Also, performance is not the immediate goal while developing software. Therefore, this is OK for now.

However, once the software is ready for release, it doesn't need to have the debugging information anymore. But it does need to be optimized for best performance. In the final stages of development, you can use the **\--release** flag with **build**. Watch closely; you should see the **[optimized]** text after compilation:


```
$ cargo build --release
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
    Finished release [optimized] target(s) in 0.29s
```

If you want to, you can go through the exercise to find out your time savings when running optimized vs. unoptimized software.

### Creating a library vs. a binary using Cargo

Any software program can be roughly categorized as either a standalone binary or a library. A standalone binary can be run as it is, even though it might make use of external libraries. A library, however, is utilized by another standalone binary. All the programs you've built so far in this tutorial are standalone binaries since that is Cargo's default. To create a **library**, add the **\--lib** option:


```
$ cargo new --lib libhello
     Created library `libhello` package
```

This time, Cargo does not create a **main.rs** file; instead, it creates a **lib.rs** file. The code for your library should go here:


```
$ tree .
.
└── libhello
    ├── Cargo.toml
    └── src
        └── lib.rs

2 directories, 2 files
```

Knowing Cargo, don't be surprised that it put some code in your new library file. Find out what it added by moving to the package directory and viewing the file. By default, Cargo puts a test function within library files.

### Running tests using Cargo

Rust provides first-class support for unit and integration testing, and Cargo allows you to execute any of these tests:


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

Cargo has a handy **test** option to run any test that is present in your code. Try running the tests that Cargo put in the library code by default:


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

### Looking under Cargo's hood

You may be interested in knowing what Cargo does under the hood when you run a command. After all, Cargo is, in many ways, a wrapper. To find out what it's doing, you can use the **-v** option with any Cargo command to output verbose information to the screen.

Here are a couple of examples that run **build** and **clean** using the **-v** option.

In the **build** command, you can see that the underlying **rustc** (Rust compiler) fired with the given command-line options:


```
$ cargo build -v
   Compiling hello_opensource v0.1.0 (/opensource/hello_opensource)
     Running `rustc --edition=2018 --crate-name hello_opensource src/main.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type bin --emit=dep-info,link -C debuginfo=2 -C metadata=147b8a0f466515dd -C extra-filename=-147b8a0f466515dd --out-dir /opensource/hello_opensource/target/debug/deps -C incremental=/opensource/hello_opensource/target/debug/incremental -L dependency=/opensource/hello_opensource/target/debug/deps`
    Finished dev [unoptimized + debuginfo] target(s) in 0.36s
```

Whereas the **clean** command shows that it is simply removing the directory that contains the intermediate files and the binary:


```
$ cargo clean -v
    Removing /opensource/hello_opensource/target
```

### Don't let your skills get rusty

To expand your skills, try writing and running a slightly more complex program using Rust and Cargo. Something simple will do: for instance, try listing all files in the current directory (it can be done in nine lines of code), or try echoing input back out at yourself. Small practice applications help you get comfortable with the syntax and the process of writing and testing code.

This article offers plenty of information for budding Rust programmers to get started with Cargo. However, as you begin working on larger and more complicated programs, you'll need a more advanced understanding of Cargo. When you're ready for more, download and read the open source [Cargo Book][10] written by the Rust team, and see what you can create!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/rust-cargo

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
