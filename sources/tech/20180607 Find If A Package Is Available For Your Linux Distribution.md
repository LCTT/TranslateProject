Find If A Package Is Available For Your Linux Distribution
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/Whohas-720x340.png)

Some times, you might wonder how to find if a package is available for your Linux distribution. Or, you simply wanted to know what version of package is available for your distribution. If so, well, it’s your lucky day. I know a tool that can get you such information. Meet **“Whohas”** – a command line tool that allows querying several package lists at once. Currently, it supports Arch, Debian, Fedora, Gentoo, Mandriva, openSUSE, Slackware, Source Mage, Ubuntu, FreeBSD, NetBSD, OpenBSD, Fink, MacPorts and Cygwin. Using this little tool, the package maintainers can easily find ebuilds, pkgbuilds and similar package definitions from other distributions. Whohas is free, open source and written in Perl programming language.

### Find If A Package Is Available For Your Linux Distribution

**Installing Whohas**

Whohas is available in the default repositories of Debian, Ubuntu, Linux Mint. If you’re using any one of the DEB-based system, you can install it using command:
```
$ sudo apt-get install whohas

```

For Arch-based systems, it is available in [**AUR**][1]. You can use any AUR helper programs to install it.

Using [**Packer**][2]:
```
$ packer -S whohas

```

Using [**Trizen**][3]:
```
$ trizen -S whohas

```

Using [**Yay**][4]:
```
$ yay -S whohas

```

Using [**Yaourt**][5]:
```
$ yaourt -S whohas

```

In other Linux distributions, download Whohas utility source from [**here**][6] and manually compile and install it.

**Usage**

The main objective of Whohas tool is to let you know:

  * Which distribution provides packages on which the user depends.
  * What version of a given package is in use in each distribution, or in each release of a distribution.



Let us find which distributions contains a specific package, for example **vim**. To do so, run:
```
$ whohas vim

```

This command will show all distributions that contains the vim package with the available version of the given package, its size, repository and the download URL.

![][8]

You can even sort the results in alphabetical order by distribution using by piping the output to “sort” command like below.
```
$ whohas vim | sort

```

Please note that the above commands will display all packages that starts with name **vim** , for example vim-spell, vimcommander, vimpager etc. You can narrow down the search to the exact package by using grep command and space before or after or on both sides of your package like below.
```
$ whohas vim | sort | grep " vim"

$ whohas vim | sort | grep "vim "

$ whohas vim | sort | grep " vim "

```

The space before the package name will display all packages that ends with search term. The space after the package name will display all packages whose names begin with your search term. The space on both sides of the search will display the exact match.

Alternatively, you could simply use “–strict” option like below.
```
$ whohas --strict vim

```

Sometimes, you want to know if a package is available for a specific distribution only. For example, to find if vim package is available in Arch Linux, run:
```
$ whohas vim | grep "^Arch"

```

The distribution names are abbreviated as “archlinux”, “cygwin”, “debian”, “fedora”, “fink”, “freebsd”, “gentoo”, “mandriva”, “macports”, “netbsd”, “openbsd”, “opensuse”, “slackware”, “sourcemage”, and “ubuntu”.

You can also get the same results by using **-d** option like below.
```
$ whohas -d archlinux vim

```

This command will search vim packages for Arch Linux distribution only.

To search for multiple distributions, for example arch linux, ubuntu, use the following command instead.
```
$ whohas -d archlinux,ubuntu vim

```

You can even find which distributions have “whohas” package.
```
$ whohas whohas

```

For more details, refer the man pages.
```
$ man whohas

```

**Also read:**

All package managers can easily find the available package versions in the repositories.. However, Whohas can help you to get the comparison of available versions of packages across different distributions and which even has it available now. Give it a try, you won’t be disappointed.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-if-a-package-is-available-for-your-linux-distribution/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/whohas/
[2]:https://www.ostechnix.com/install-packer-arch-linux-2/
[3]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[4]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]:https://www.ostechnix.com/install-yaourt-arch-linux/
[6]:http://www.philippwesche.org/200811/whohas/intro.html
[7]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]:http://www.ostechnix.com/wp-content/uploads/2018/06/whohas-1.png
