[#]: subject: "Install and Use Yay on Arch Linux"
[#]: via: "https://itsfoss.com/install-yay-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install and Use Yay on Arch Linux
======

You'll find a huge number of software packaged by the community members in [Arch User Repository][1] (AUR).

Since it is coming from third parties, purists suggest downloading and building each desired package from AUR manually.

But that's a tedious task and that's why AUR helpers were created to save the trouble.

Yay is one of the most popular AUR helpers and in this tutorial, I'll share how you can install Yay on Arch Linux. I'll also share a few tips on managing packages from AUR with Yay.

💡

Yay is available in Manjaro's repository. So, Manjaro users can simply use pacman -S yay to install

### Installing Yay on Arch Linux

Before you go on with Yay installation, you need some packages required to build it.

Let me divide it into steps.

#### Step 1: Install the prerequisite packages

It is always a good idea to refresh the package cache and update the system first:

```

    sudo pacman -Syu

```

Install the rerquired `base-devel` (contains tools such as `makepkg` etc) and git (required for cloning the yay git repository).

```

    sudo pacman -S --needed base-devel git

```

With the `--needed` flag, it will NOT reinstall the already installed packages.

Here's what it looks like:

![][2]

Now that you have the required packages, it's time to get [Yay][3] on your system.

#### Step 2: Clone the Yay git repo and switch to it

[Use the git command][4] to 'clone' the Yay repo. You can do it anywhere in the system, be it your home directory or otherwise.

```

    git clone https://aur.archlinux.org/yay.git

```

Once done, switch to the cloned directory:

```

    cd yay

```

![][5]

It's time to install yay (finally).

#### Step 3: Install yay

Actually, you are building it. You'll see a PKGBUILD file here. Use the following command to build the package from here:

```

    makepkg -si

```

Follow the on-screen instructions. Press Y when you are asked to confirm.

![][6]

Once the process finishes, verify that yay has been installed successfully by checking its version.

```

    yay --version

```

Now that you have successfully installed it, you may remove the cloned Yay git repository. It is not needed anymore.

### Using Yay for package management

The yay follows similar (but not identical) command structure as [pacman][7]. So it should not be difficult for you to manage AUR packages with Yay.

Search for packages with:

```

    yay search_term

```

Install the packages with:

```

    yay -S package_name

```

Remove packages with:

```

    yay -R package_name

```

To delete a package with its dependencies:

```

    yay -Rns package_name

```

Upgrading (only) the AUR packages:

```

    yay -Sua

```

Yay is also capable of upgrading non-AUR packages. The `a` flag above restricts it to AUR.

### Upgrading Yay to a new version

Now, you may wonder how you can upgrade Yay to a newer version when it's available.

The answer is that you don't have to do anything special. Yay can update itself when you run the command:

```

    yay -Sua

```

### Removing Yay from your Arch system

If you don't like Yay or no longer need it anymore, you can remove it like any other package with the pacman command:

```

    sudo pacman -Rs yay

```

### Conclusion

That was a quick introduction to Yay AUR helper. You can visit its GitHub repository for more details on its working.

![][8]

Arch User Repository (AUR) is one of the reasons [why some people love using Arch Linux][9].

While purists Arch users scoff at AUR in general and [AUR helpers][10] in particular, they remain popular for the ease of use they provide.

I hope you find this quick tutorial helpful in getting Yay on [Arch Linux][11]. Please let me know if you still have questions or if you notice any technical inaccuracies.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-yay-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/aur-arch-linux/
[2]: https://itsfoss.com/content/images/2023/10/install-prerequisite-yay.png
[3]: https://github.com/Jguer/yay
[4]: https://itsfoss.com/basic-git-commands-cheat-sheet/
[5]: https://itsfoss.com/content/images/2023/10/git-clone-yay.png
[6]: https://itsfoss.com/content/images/2023/10/building-yay-package.png
[7]: https://itsfoss.com/pacman-command/
[8]: https://github.githubassets.com/pinned-octocat.svg
[9]: https://itsfoss.com/why-arch-linux/
[10]: https://itsfoss.com/best-aur-helpers/
[11]: https://archlinux.org/
