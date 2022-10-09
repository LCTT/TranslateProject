[#]: subject: "Upgrade Various Kinds of Packages in Linux at Once With Topgrade"
[#]: via: "https://itsfoss.com/topgrade/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Upgrade Various Kinds of Packages in Linux at Once With Topgrade
======
Updating a Linux system is not that complicated, is it? After all, to update Ubuntu like distros, you just have to use apt update && apt upgrade.

That would have been the case if all the packages had been installed through a single package manager.

But that’s not the case anymore. You have the classic apt/dnf/pacman and then come snap, flatpak, appimages. It doesn’t end here. You may also install applications using PIP (for Python) and Cargo (for Rust).

Use node? The npm packages need to be updated separately. Oh My Zsh? Needs to be updated separately. [Plugins in Vim][1], Atom etc may also not be covered by apt/dnf/pacman.

Do you see the problem now? And this is the kind of problem a new tool called topgrade aims to solve.

### Topgrade: A single utility to take care of all kinds of updates

This [topgrade][2] is a CLI utility and it detects which tools you use and then runs the appropriate commands to update them.

![topgrade disable system][3]

Apart from the usual Linux package managers, it can detect and update brew, cargo, PIP, pihole, Vim and Emacs plugins, R packages etc. You can see the list of supported packages on [its wiki page][4].

##### Key Features of Topgrade:

* Ability to update packages from different package managers, including firmware!
* You do have control over how you want to update packages.
* Extremely customizable.
* Ability to have an overview even before updating packages.

So without wasting any time, let’s jump to the installation.

### Install Topgrade in Linux using Cargo

The installation process is quite straightforward as I’m going to use the cargo package manager.

We already have a [detailed guide with multiple methods for setting up a cargo package manager][5] So I’m going to make it quick by using Ubuntu in my example.

So let’s start with some dependencies and installation of cargo in the least extensive way:

```
sudo apt install cargo libssl-dev pkg-config
```

Once the cargo has been installed, utilize the given command to install topgrade:

```
cargo install topgrade
```

And it will throw a warning as given:

![cargo error][6]

Where you just have to add the path of cargo to run binaries. This can be done through given command where you’ve to change `sagar` with your username:

```
echo 'export PATH=$PATH:/home/sagar/.cargo/bin' >> /home/sagar/.bashrc
```

Now, reboot your system and topgrade is ready to use. But wait, we need to install another package that will update cargo to get the most recent packages.

```
cargo install cargo-update
```

And we’re done with installation.

### Using Topgrade

Using topgrade is extremely easy. Use a single command and that’s it:

```
topgrade
```

![][7]

But this won’t give you any control apart from system packages but as I mentioned, you can blacklist the repo that you don’t want to get updated.

#### Exclude package managers and repositories from Topgrade

Let’s suppose I want to exclude snaps and packages downloaded from the default package manager, so my command would be:

```
topgrade --disable snap system
```

![topgrade disable snap system][8]

For making a permanent change, you’d have to make a few changes in its config file which can be accessed through the given command:

```
topgrade --edit-config
```

For this example, I discluded snaps and default system repo:

![configuring topgrade][9]

#### Dry run topgrade

Having an estimation of outdated packages that will be updated is always a good idea and I find this most useful option from the entire catalog of topgrade.

You just have to use topgrade with `-n` option and it will generate a summary of outdated packages.

```
topgrade -n
```

![summery of topgrade][10]

A neat way of checking packages that need to be updated.

### Final Words

After using Topgrade for a few weeks, it became an integral part of my Linux arsenal. Like most other Linux users, I was only updating packages through my default package manager. Python and Rust packages were ignored completely. Thanks to topgrade, my system is updated completely now.

I understand that this is not a tool everyone would want to use. What about you? Willing to give it a try?

--------------------------------------------------------------------------------

via: https://itsfoss.com/topgrade/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://linuxhandbook.com/install-vim-plugins/
[2]: https://github.com/r-darwish/topgrade
[3]: https://itsfoss.com/wp-content/uploads/2022/09/topgrade-disable-system.png
[4]: https://github.com/r-darwish/topgrade/wiki/Step-list
[5]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[6]: https://itsfoss.com/wp-content/uploads/2022/09/cargo-error.png
[7]: https://itsfoss.com/wp-content/uploads/2022/10/topgrade.mp4
[8]: https://itsfoss.com/wp-content/uploads/2022/09/topgrade-disable-snap-system.png
[9]: https://itsfoss.com/wp-content/uploads/2022/09/configuring-topgrade-1.png
[10]: https://itsfoss.com/wp-content/uploads/2022/09/summery-of-topgrade.png
