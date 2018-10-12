A Front-end For Popular Package Managers
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/sysget-720x340.png)

Are you a distro-hopper who likes to try new Linux OSs every few days? If so, I have something for you. Say hello to **Sysget** , a front-end for popular package managers in Unix-like operating systems. You don’t need to learn about every package managers to do basic stuffs like installing, updating, upgrading and removing packages. You just need to remember one syntax for every package manager on every Unix-like operating systems. Sysget is a wrapper script for package managers and it is written in C++. The source code is freely available on GitHub.

Using Sysget, you can do all sorts of basic package management operations including the following:

  * Install packages,
  * Update packages,
  * Upgrade packages,
  * Search for packages,
  * Remove packages,
  * Remove orphan packages,
  * Update database,
  * Upgrade system,
  * Clear package manager cache.



**An Important note to Linux learners:**

Sysget is not going to replace the package managers and definitely not suitable for everyone. If you’re a newbie who frequently switch to new Linux OS, Sysget may help. It is just wrapper script that helps the distro hoppers (or the new Linux users) who become frustrated when they have to learn new commands to install, update, upgrade, search and remove packages when using different package managers in different Linux distributions.

If you’re a Linux administrator or enthusiast who want to learn the internals of Linux, you should stick with your distribution’s package manager and learn to use it well.

### Installing Sysget

Installing sysget is trivial. Go to the [**releases page**][1] and download latest Sysget binary and install it as shown below. As of writing this guide, the latest version was 1.2.

```
$ sudo wget -O /usr/local/bin/sysget https://github.com/emilengler/sysget/releases/download/v1.2/sysget

$ sudo mkdir -p /usr/local/share/sysget

$ sudo chmod a+x /usr/local/bin/sysget

```

### Usage

Sysget commands are mostly same as APT package manager, so it should be easy to use for the newbies.

When you run Sysget for the first time, you will be asked to choose the package manager you want to use. Since I am on Ubuntu, I chose **apt-get**.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/sysget-1.png)

You must choose the right package manager depending upon the distribution you’re running. For instance, if you’re on Arch Linux, choose **pacman**. For CentOS, choose **yum**. For FreeBSD, choose **pkg**. The list of currently supported package managers are:

  1. apt-get (Debian)
  2. xbps (Void)
  3. dnf (Fedora)
  4. yum (Enterprise Linux/Legacy Fedora)
  5. zypper (OpenSUSE)
  6. eopkg (Solus)
  7. pacman (Arch)
  8. emerge (Gentoo)
  9. pkg (FreeBSD)
  10. chromebrew (ChromeOS)
  11. homebrew (Mac OS)
  12. nix (Nix OS)
  13. snap (Independent)
  14. npm (Javascript, Global)



Just in case you assigned a wrong package manager, you can set a new package manager using the following command:

```
$ sudo sysget set yum
Package manager changed to yum

```

Just make sure you have chosen your native package manager.

Now, you can perform the package management operations as the way you do using your native package manager.

To install a package, for example Emacs, simply run:

```
$ sudo sysget install emacs

```

The above command will invoke the native package manager (In my case it is “apt-get”) and install the given package.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Install-package-using-Sysget.png)

Similarly, to remove a package, simply run:

```
$ sudo sysget remove emacs

```

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Remove-package-using-Sysget.png)

Update software repository (database):

```
$ sudo sysget update

```

**Search for a specific package:**

```
$ sudo sysget search emacs

```

**Upgrade a single package:**

```
$ sudo sysget upgrade emacs

```

**Upgrade all packages:**

```
$ sudo sysget upgrade

```

**Remove all orphaned packages:**

```
$ sudo sysget autoremove

```

**Clear the package manager cache:**

```
$ sudo sysget clean

```

For more details, refer the help section:

```
$ sysget help
Help of sysget
sysget [OPTION] [ARGUMENT]

search [query] search for a package in the resporitories
install [package] install a package from the repos
remove [package] removes a package
autoremove removes not needed packages (orphans)
update update the database
upgrade do a system upgrade
upgrade [package] upgrade a specific package
clean clean the download cache
set [NEW MANAGER] set a new package manager

```

Please remember that the sysget syntax is same for all package managers in different Linux distributions. You don’t need to memorize the commands for each package manager.

Again, I must tell you Sysget isn’t a replacement for a package manager. It is just wrapper for popular package managers in Unix-like systems and it performs the basic package management operations only.

Sysget might be somewhat useful for newbies and distro-hoppers who are lazy to learn new commands for different package manager. Give it a try if you’re interested and see if it helps.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/sysget-a-front-end-for-popular-package-managers/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/emilengler/sysget/releases
