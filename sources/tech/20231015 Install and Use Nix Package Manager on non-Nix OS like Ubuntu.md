[#]: subject: "Install and Use Nix Package Manager on non-Nix OS like Ubuntu"
[#]: via: "https://itsfoss.com/ubuntu-install-nix-package-manager/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install and Use Nix Package Manager on non-Nix OS like Ubuntu
======

One of the reasons [why people like using the immutable NixOS][1] is its Nix package manager.

It has over 80,000 packages, which might not be close to the number of Debian packages but pretty impressive nonetheless.

The good thing is that you don't have to [install NixOS][2] just for the package manager. Like [Homebrew][3] and Rust's [Cargo package manager][4], you can use Nix package manager in your present distribution.

Why would you do that? Because sometimes, you may find a new application that is only available in Nix packaging format. It's rare but possible.

In this tutorial, I will walk you through the following:

  * Installing Nix package manager
  * Searching and installing packages
  * Try/test packages without installing them
  * Update packages
  * Removing packages



### Install Nix package manager on other Linux distros

There are two ways to install the Nix package manager: global install and local install.

📋

The global install means the nix package manager will be accessible by every user available on the system, whereas the local installation is only for the current user. The [official Nix documentation][5] recommends you use the global install.

##### For global installation:

If you want to install the Nix package manager globally, then, you need to execute the following command:

```

    sh <(curl -L https://nixos.org/nix/install) --daemon

```

Once you execute the above command, you need to enter the `y` key and press the `Enter` key:

![][6]

Once done, close the current terminal as it won't work on the current terminal session.

##### For local installation:

If you prefer the local installation and don't want to use sudo every time, then execute the following command:

```

    sh <(curl -L https://nixos.org/nix/install) --no-daemon

```

Enter `y` and press the `Enter` key when asked for the confirmation.

Once done, close the current terminal session and start a new one to use the Nix package manager.

### Search and install packages

Once you have installed the Nix package manager, the next step is to search for packages.

First, [visit the official page of Nix search][7] and type the name of the package that you want to install.

From the given description, you can find the package which you were looking for and then, choose the `nix-env` to go with the permanent installation.

Here, you can add some extra keywords to have better search results. For example, here, I searched for "Firefox browser":

![][8]

The last step that I mentioned above (copy command) does nothing but gives you a command that you execute for the installation.

Now, all you have to do is execute that command in your terminal.

In my case, it gave me the following command to install Firefox:

```

    nix-env -iA nixpkgs.firefox

```

Once done, you can list the installed packages using the following command:

```

    nix-env -q

```

![][9]

### Use packages without installing them

By far this is the best feature of the Nix package manager as you get to use/test packages that are not even installed!

For this, you can use the nix shell which lets you use an interactive shell with the specified package, and once closed, you can no longer access that package.

Cool, right?

To use the nix-shell to access your favorite package, use the following command syntax:

```

    nix-shell -p <package_name>

```

For example, I wanted to use neofetch once, so I used the following:

```

    nix-shell -p neofetch

```

![][10]

To exit from the shell, all you have to do is execute the `exit` command:

```

    exit

```

### Update packages using the Nix package manager

Updating packages using the Nix package manager is pretty easy.

To update packages, first, you need to update channels using the following command:

```

    nix-channel --update

```

Next, you can list the outdated packages by dry-running the update command:

```

    nix-env --upgrade --dry-run

```

![][11]

In my case, the Firefox browser was outdated and needs to be updated!

To update a single package, use the following command:

```

    nix-env -u <Package_name>

```

And if you want to update all the packages at once, then use the following:

```

    nix-env -u

```

### Remove packages using the Nix package manager

To remove packages, all you have to do is execute the `nix-env` command in the following manner:

```

    nix-env --uninstall [package_name]

```

For example, if I want to remove the Firefox browser, then, I will use the following command:

```

    nix-env --uninstall firefox

```

![][12]

### Unlock its full potential with NixOS

If you liked the idea behind the Nix package manager, trust me, you're going to love the [NixOS][13].

Reproducing the entire system just by using one config file was enough to convince me to make a switch to NixOS but there are more reasons:

![][14]

I love NixOS. So much so that I wrote a whole series so you don't have to go through documentation (for basics):

![][14]

I hope you will enjoy using it as much as I do.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-install-nix-package-manager/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-nixos/
[2]: https://itsfoss.com/install-nixos-vm/
[3]: https://itsfoss.com/homebrew-linux/
[4]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[5]: https://nixos.org/learn
[6]: https://itsfoss.com/content/images/2023/10/Install-nix-package-manager-globally.png
[7]: https://search.nixos.org/packages
[8]: https://itsfoss.com/content/images/2023/10/Search-packages-to-install-using-the-Nix-package-manager.png
[9]: https://itsfoss.com/content/images/2023/10/List-installed-packages-using-the-nix-package-manager.png
[10]: https://itsfoss.com/content/images/2023/10/Use-packages-wihout-installing-them-using-the-nix-package-manager.png
[11]: https://itsfoss.com/content/images/2023/10/List-outdated-packages-using-the-nix-package-manager.png
[12]: https://itsfoss.com/content/images/2023/10/Remove-packages-using-the-nix-package-manager-1.png
[13]: https://nixos.org/
[14]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
