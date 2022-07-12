[#]: subject: "How to Install yay AUR Helper in Arch Linux [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/install-yay-arch/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install yay AUR Helper in Arch Linux [Beginner’s Guide]
======
This beginner’s guide explains the steps to install the Yay AUR helper in Arch Linux.

The yay is an abbreviation of ‘Yet Another Yogurt’. It is technically a [pacman][1] wrapper and AUR helper written in [Go programming languages][2]. It is the most popular [Arch User Repository (AUR)][3] helper available today. With Yay, you can take advantage of a vast Arch User Repository of packages and easily compile and install any software.

It automates many package management tasks such as searching, resolving dependencies on the fly, compiling and building packages, and, of course, publishing your packages for AUR.

Let’s look at how you can install Yay in Arch Linux or any Arch-based distro such as Manjaro. Once you install Arch Linux, you can install packages via pacman package manager from three main Arch official repo. But Yay is not installed by default after a fresh Arch Linux installation. Hence you need to install it to take advantage of AUR manually.

This guide covers the below topics.

* Install yay in Arch Linux
* Install yay in Manjaro
* How to use yay to install packages in Arch Linux and Manjaro
* Some yay tips

### Install yay in Arch Linux

#### Pre-requisite

Open a terminal and run the below commands. Provide admin password when prompted. These steps require the [base-devel][4] package and git package for compilation and installation.

```
sudo pacman -S base-devel
```

```
sudo pacman -S git
```

![Install git][5]

#### Install yay

The yay package has two versions in the Arch repository, as follows.

[yay][6] – stable version[yay-git][7]– development version

For this guide, I have used the stable version. Now, go to “/opt” directory and clone the git repo.

```
cd /optsudo git clone https://aur.archlinux.org/yay.git
```

![clone the yay repo][8]

Change the owner of the source directory. Replace “debugpoint” with your user name.

```
sudo chown -R debugpoint:users ./yay
```

If you are unaware of the user or group, you can find the user and groups using the example below.

```
id debugpoint
```

Go to the directory and compile.

```
cd yay
```

```
makepkg -si
```

This completes the installation for yay in Arch Linux.

![Install yay in Arch Linux][9]

### Install in yay in Manjaro

If you are using Manjaro Linux, the yay package is available in the community repo. You can easily install using the following commands in Manjaro.

```
pacman -Syyupacman -S yay
```

Now, let’s look at how you can install any package using Yay and some basic yay usage.

### How to use yay to install packages

The first search on the AUR website to install any application to get the package name. For example, to install [featherpad][10] text editor, run the below command.

```
yay -S featherpad
```

After installation, you can find the application launcher in the application menu.

![Install a sample application (featherpad) using yay][11]

### Some yay tips

You can also do many tweaks and system operations using yay. Some of the examples are below.

**Refresh the system packages and upgrade:**

```
yay -Syu
```

**Use the development versions of packages and upgrade (be careful while running this command)**:

```
yay -Syu --devel --timeupdate
```

**Remove any packages (for example, featherpad)**:

```
yay -Rns featherpad
```

**Get a quick system stat:**

![system stat using yay][12]

```
yay -Ps
```

I hope this beginner’s guide helped you install yay in [Arch Linux][13], then use yay for installing packages, and perform different system actions.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-yay-arch/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://wiki.archlinux.org/index.php/pacman
[2]: https://golang.org/
[3]: https://wiki.archlinux.org/index.php/Arch_User_Repository
[4]: https://aur.archlinux.org/packages/meta-group-base-devel/
[5]: https://www.debugpoint.com/wp-content/uploads/2021/01/Install-git-1024x291.png
[6]: https://aur.archlinux.org/packages/yay/
[7]: https://aur.archlinux.org/packages/yay-git/
[8]: https://www.debugpoint.com/wp-content/uploads/2021/01/clone-the-yay-repo-1024x271.png
[9]: https://www.debugpoint.com/wp-content/uploads/2021/01/Install-yay-in-Arch-Linux-1024x460.png
[10]: https://aur.archlinux.org/packages/featherpad-git/
[11]: https://www.debugpoint.com/wp-content/uploads/2021/01/Install-a-sample-application-featherpad-using-yay-1024x620.png
[12]: https://www.debugpoint.com/wp-content/uploads/2021/01/system-stat-using-yay.png
[13]: https://www.debugpoint.com/tag/arch-linux/
