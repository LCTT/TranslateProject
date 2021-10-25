[#]: subject: "How to Install Rust and Cargo on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/install-rust-cargo-ubuntu-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Rust and Cargo on Ubuntu and Other Linux Distributions
======

_**Brief: Learn various ways of installing Rust programming language on Linux along with its package manager Cargo.**_

Ever since Mozilla dumped [Rust][1], it has gained even more prominence and popularity. Don’t just take my words for it. [Rust is going to be included in the Linux kernel][2], only the second programming language after C.

Many developers have also started making awesome command line based tools in Rust. These tools are often available through the [Cargo package manager][3].

This is why it matters to install Rust support in Linux, both for the programmers and the end users.

Officially, Rust documents suggest installing Rust in Linux by downloading and executing the installer script in this manner:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

That could work. However, your distribution probably already packages Rust. Using your distribution’s [package manager][4] is also an option.

Let me walk you through the Rust installation steps for both official Rust way and package manager way.

### Method 1: Installing Rust on any Linux using the official method

There are a couple of advantages of this method:

  * You get the latest Rust and Cargo version
  * Rust is only installed for the current user, not system-wide
  * You do not need to be root or have sudo access to install Rust for yourself this way



A few people dislike downloading and [running shell scripts][5] off the internet, even if it is coming from the official sources. However, since it does not need root access and the script is coming from the official sources, it should be safe to install it this way.

First, make sure that you have Curl installed. Use your distribution’s package manager to install it, if it is not already installed. You can [install Curl on Ubuntu][6] and Debian using the apt command:

```
sudo apt install curl
```

Next, use this command to download the script and run it:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

![][7]

It will ask your input for the kind of installation you want. Go with option 1:

![][8]

Once the script finishes the installation process, you need to source the configuration file to make the changes available for your shell.

![][9]

Source the file:

```
source $HOME/.cargo/env
```

Once it is done, verify that rust is available for you by checking the installed version:

```
rustc --version
```

![Verifying Rust installation][10]

Super cool. If there is a new version of Rust released, you can update the installed one using:

```
rustup update
```

Let me quickly show how to remove rust installed this way before you see the other installation method.

#### Removing Rust installed the official way

In a terminal, use the following command to remove Rust from your system:

```
rustup self uninstall
```

Press Y when asked and you’ll have Rust removed from the system.

![Removing Rust from Linux][11]

That’s settled then. Let’s see how to use the apt command to install Rust on Ubuntu.

### Method 2: Installing Rust support on Ubuntu using apt

Why would you want to use the package manager?

  * It installs Rust system wide and thus makes it available for all the users on the system
  * It gets updated centrally with other system updates (if your distribution adds a new version of Rust)



There are two main Rust packages available in Ubuntu:

  * rustc: The rust compiler used for Rust programming language
  * cargo: Cargo is the Rust package manager and it automatically installs rustc



As a regular user, you would be using Cargo for installing Rust based applications. As a programmer, you’ll need Cargo for getting other Rust packages or create your own.

Since Cargo includes rustc, I would advise installing it so that all required packages are installed in one go.

```
sudo apt install cargo
```

You’ll be asked to enter your account’s password.

![][12]

You are, of course, free to use `apt install rustc` and install only Rust. That choice lies with you.

You may verify that Rust is installed for you and all the other users (if you want to):

![][13]

That’s good. Let me quickly show the uninstall step as well.

#### Removing Rust using apt remove

To remove Rust, you can remove Cargo first and then use the autoremove command to remove the dependencies installed with it.

```
sudo apt remove cargo
```

Now run the autoremove:

```
sudo apt autoremove
```

That’s it. You now know all the essentials about installing Rust on Ubuntu and other Linux distributions. Questions and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-rust-cargo-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
