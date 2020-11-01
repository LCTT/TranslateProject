[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use apt-cache Command in Debian, Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/apt-cache-command/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Use apt-cache Command in Debian, Ubuntu and Other Linux Distributions
======

_**With apt-cache command, you can search for package details in the local APT cache. Learn to use apt-cache command in this tutorial.**_

### What is apt-cache command used for?

The [apt][1] [package manager][2] works on a local cache of package metadata. The metadata usually consists information like package name, version, description, dependencies, its repository and developers. With the apt-cache command, you can query this local APT cache and get relevant information.

You can search for the availability of a package, its version number, its dependencies among other things. I’ll show you how to use the apt-cache command with examples.

The **location of APT cache** is /var/lib/apt/lists/ directory. Which repository metadata to cache depends on the repositories added in your source list in the /etc/apt/sources.list file and additional repository files located in ls /etc/apt/sources.list.d directory.

Surprisingly, apt-cache doesn’t clear the APT cache. For that you’ll have to [use the apt-get clean command][3].

Needless to say, the APT packaging system is used on Debian and Debian-based Linux distributions like Ubuntu, Linux Mint, elementary OS etc. You cannot use it on Arch or Fedora.

### Using apt-cache command

![][4]

Like any other Linux command, there are several options available with apt-cache and you can always refer to its man page to read about them.

However, you probably won’t need to use all of them. This is why I am going to show you only the most common and useful examples of the apt-cache command in this tutorial.

Always update

It is always a good idea to update the local APT cache to sync it with the remote repositories. How do you do that? You use the command:

**sudo apt update**

#### Search for packages

The most common use of apt-cache command is for finding package. You can use a regex pattern to search for a package in the local APT cache.

```
apt-cache search package_name
```

By default, it looks for the search term in both the name and description of the package. It shows the matching package along with its short description in alphabetical order.

![][5]

You can narrow down your search to look for the search term in package names only.

```
apt-cache search --names-only package_name
```

![][6]

If you want complete details of all the matched packages, you may use the `--full` flag. It can also be used with `--names-only` flag.

![][7]

#### Get detailed package information

If you know the exact package name (or if you have manged to find it with the search), you can get the detailed metadata information on the package.

```
apt-cache show package_name
```

![][8]

You can see all kind of details in the package metadata like name, version, developer, maintainer, repository, short and long description, package size and even checksum.

There is another option showpkg that displays information about the package name, version and its forward and reverse dependencies.

```
apt-cache showpkg package_name
```

#### apt-cache policy

This is one of the rarely used option of apt-cache command. The policy options helps you debug the issue related to the [preference file][9].

If you specify the package name, it will show whether the package is installed, which version is available from which repository and its priority.

![][10]

By default, each installed package version has a priority of 100 and a non-installed package has a priority of 500. The same package may have more than one version with a different priority. APT installs the version with higher priority unless the installed version is newer.

If this doesn’t make sense, it’s okay. It will be extremely rare for a regular Linux user to dwell this deep into package management.

#### Check dependencies and reverse dependencies of a package

You can [check the dependencies of a package][11] before (or even after) installing it. It also shows all the possible packages that can fulfill the dependency.

```
apt-cache depends package
```

![][12]

You may also check which packages are dependent on a certain package by checking the reverse dependencies with apt-cahce.

![][13]

Frankly, I was also surprised to see that a DevOps tool like Ansible has a dependency on a [funny Linux command like Cowsay][14]. I think it’s perhaps because after [installing Ansible][15], it displays some message on the nodes.

#### Check unmet dependencies

You may get troubled with [unmet dependencies issue in Ubuntu][16] or other Linux. The apt-cache command provides option to check all the unmet dependencies of various available packages on your system.

```
apt-cache unmet
```

![][17]

**Conclusion**

You can list all available packages with the apt-cache command. The output would be huge, so I suggest combining it with [wc command][18] to get a total number of available packages like this:

```
apt-cache pkgnames | wc -l
```

Did you notice that you don’t need to be [root user][19] for using apt-cache command?

The newer [apt command][20] has a few options available to match the features of apt-cache command. Since apt is new, apt-get and its associated commands like apt-cache are still preferred to be used in scripts.

I hope you find this tutorial helpful. If you have questions about any point discussed above or suggestion to improve it, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-cache-command/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/Apt
[2]: https://itsfoss.com/package-manager/
[3]: https://itsfoss.com/clear-apt-cache/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-command.png?resize=800%2C450&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-search.png?resize=759%2C437&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-search-names-only.png?resize=759%2C209&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-show-full.png?resize=759%2C722&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-show-pkgname.png?resize=800%2C795&ssl=1
[9]: https://debian-handbook.info/browse/stable/sect.apt-get.html#sect.apt.priorities
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-policy.png?resize=795%2C456&ssl=1
[11]: https://itsfoss.com/check-dependencies-package-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-dependency-check.png?resize=768%2C304&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-reverse-dependency.png?resize=768%2C304&ssl=1
[14]: https://itsfoss.com/funny-linux-commands/
[15]: https://linuxhandbook.com/install-ansible-linux/
[16]: https://itsfoss.com/held-broken-packages-error/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-unmet.png?resize=759%2C399&ssl=1
[18]: https://linuxhandbook.com/wc-command/
[19]: https://itsfoss.com/root-user-ubuntu/
[20]: https://itsfoss.com/apt-command-guide/
