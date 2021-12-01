[#]: subject: "Installing and Using Homebrew Package Manager on Linux"
[#]: via: "https://itsfoss.com/homebrew-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Installing and Using Homebrew Package Manager on Linux
======

Homebrew, also known as Brew, is a command line package manager primarily created for macOS.

[Homebrew][1] grew quite popular among macOS users as more developers created command line tools that could be easily installed with Homebrew.

This popularity resulted in the creation of Linuxbrew, a Linux port for Homebrew. Since it is primarily Git and Ruby, and Linux and macOS are both Unix-like systems, Brew works good on both kind of operating systems.

Linuxbrew project eventually merged with Homebrew project and now you just have one Brew project called Homebrew.

Why am I calling it brew, instead of Homebrew? Because the command starts with brew. You’ll see it in detail in a later section.

### Why use Homebrew package manager on Linux when you have got apt, dnf, snap etc?

I know the feeling. You already have a good [package manager][2] provided by your distribution. In addition to that, you have Snap, Flatpak and other universal package system.

Do you really need Homebrew package manager on your Linux system? The answer depends on your requirement, really.

See, apart from the distribution’s package manager and universal packages, you’ll come across situations where you need other package managers like [Pip][3] (for Python applications) and [Cargo][4] (for Rust packages).

Imagine you came across a good command line utility and want to try it. It’s repository mentions that it can be installed using brew or source code only. In such a case, having brew on your system could be helpful. After all, [installing from source code][5] in the 2020s is not fashionable (and comfortable).

In other words, you’ll have an additional option in case you come across some interesting CLI tool that provides only brew installation option.

### Install Homebrew on Ubuntu and other Linux distributions

The installation is quite easy. You just have to make sure that you have got all the dependencies.

#### Step 1: Install dependencies

You need to have relatively newer version of gcc and glibc. You can [install build-essential package on Ubuntu][6] to get them. Apart from that, you also need to [install Git][7], Curl and procps (used for monitoring system process).

You can install all of them together like this in Ubuntu and Debian based systems:

```

    sudo apt-get install build-essential procps curl file git

```

![Iinstall dependencies for Homebrew in Ubuntu/Debian][8]

For other distributions, please use your package manager and install these dependencies.

#### Step 2: Install Homebrew

You can see why you needed to [install Curl][9]. It allows you to [download the installation script file in the terminal][10].

Just enter this command:

```

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

When asked for RETURN key, press enter:

![Installing Homebrew on Ubuntu][11]

At the end of the script competition, it recommends to run a few commands to add it to the PATH variable. Homebrew is actually installed in your home directory and then soft linked to the /usr/local directory.

![Run the suggested command under Next steps to add Homebrew to PATh variable][12]

You can [copy and paste in terminal][13] easily. Just select the command it suggests and press Ctrl+Shift+C to copy and Ctrl+Shift+V to paste.

Alternatively, you can just copy paste this command:

```

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile

```

And then this:

```

    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

```

![Adding brew commands to the PATH][14]

#### Step 3: Verify brew installation

You are almost done. Just verify that brew command is ready to run by using the brew doctor command:

```

    brew doctor

```

The brew doctor command will tell you if there is any issue.

You may double verify by installing the sample hello project:

```

    brew install hello

```

If you see no errors, you can enjoy the Homebrew package manager on Linux.

### Using brew command for installing, removing and managing packages

Let me quickly tell you a few brew commands you can use for installing, removing and managing packages.

Since Homebrew is installed in your home directory, you do not need sudo to run it (just like Pip and Cargo).

To install a package with brew, use the install option:

```

    brew install package_name

```

There is no autocompletion for the package name here. You need to know the exact package name.

To remove a brew package, you can use either **remove** or **uninstall** option. Both works the same.

```

    brew remove package_name

```

You can also list the installed brew packages with this command:

```

    brew list

```

You can also remove the unneeded dependencies with the autoremove option:

```

    brew autoremove

```

In the next screenshot, I had only two packages installed with brew but it also shows the dependencies installed for those packages. Even after removing the package, dependencies remained. The autoremove finally removed them.

![Listing and removing brew apckages][15]

There are a lot more brew command options but that is out of scope for this tutorial. You can always [go through their documentation][16] and explore it further.

### Removing Homebrew from Linux

This tutorial won’t complete without adding the steps for removing Homebrew from your Linux system.

As per the [steps mentioned on its GitHub repository][17], you have to download and run the uninstall script using this command:

```

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

```

You’ll be asked to confirm the removal by entering the Y key.

![Removing Homebrew from Linux][18]

When the uninstallation of Homebrew completes, it lists the files and directories it has leftover:

![Remaining files after Homebrew removal][19]

I let you remove the files and directories on your own.

### Conclusion

As I explained earlier, Homebrew provides an extension to what you have already got. If you stumble upon an application that has only brew as installation method, having Homebrew installed on your Linux system will come handy.

Anything you want to add to this topic or share your question or opinion? Please use the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/homebrew-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://brew.sh/
[2]: https://itsfoss.com/package-manager/
[3]: https://itsfoss.com/install-pip-ubuntu/
[4]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[5]: https://itsfoss.com/install-software-from-source-code/
[6]: https://itsfoss.com/build-essential-ubuntu/
[7]: https://itsfoss.com/install-git-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-dependencies-for-homebrew-linux.png?resize=800%2C493&ssl=1
[9]: https://itsfoss.com/install-curl-ubuntu/
[10]: https://itsfoss.com/download-files-from-linux-terminal/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/installing-homebrew-ubuntu.png?resize=800%2C453&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/adding-homebrew-to-path-Linux.png?resize=800%2C442&ssl=1
[13]: https://itsfoss.com/copy-paste-linux-terminal/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/post-installation-steps-for-brew.png?resize=786%2C348&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/brew-remove-packages.png?resize=800%2C572&ssl=1
[16]: https://docs.brew.sh/Manpage
[17]: https://github.com/homebrew/install#uninstall-homebrew
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/removing-homebrew-from-Linux.png?resize=800%2C539&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/remaining-files-after-homebrew-removal.png?resize=800%2C464&ssl=1
