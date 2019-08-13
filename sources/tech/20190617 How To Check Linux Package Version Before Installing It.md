[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check Linux Package Version Before Installing It)
[#]: via: (https://www.ostechnix.com/how-to-check-linux-package-version-before-installing-it/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Check Linux Package Version Before Installing It
======

![Check Linux Package Version][1]

Most of you will know how to [**find the version of an installed package**][2] in Linux. But, what would you do to find the packages’ version which are not installed in the first place? No problem! This guide describes how to check Linux package version before installing it in Debian and its derivatives like Ubuntu. This small tip might be helpful for those wondering what version they would get before installing a package.

### Check Linux Package Version Before Installing It

There are many ways to find a package’s version even if it is not installed already in DEB-based systems. Here I have given a few methods.

##### Method 1 – Using Apt

The quick and dirty way to check a package version, simply run:

```
$ apt show <package-name>
```

**Example:**

```
$ apt show vim
```

**Sample output:**

```
Package: vim
Version: 2:8.0.1453-1ubuntu1.1
Priority: optional
Section: editors
Origin: Ubuntu
Maintainer: Ubuntu Developers <[email protected]>
Original-Maintainer: Debian Vim Maintainers <[email protected]>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 2,852 kB
Provides: editor
Depends: vim-common (= 2:8.0.1453-1ubuntu1.1), vim-runtime (= 2:8.0.1453-1ubuntu1.1), libacl1 (>= 2.2.51-8), libc6 (>= 2.15), libgpm2 (>= 1.20.7), libpython3.6 (>= 3.6.5), libselinux1 (>= 1.32), libtinfo5 (>= 6)
Suggests: ctags, vim-doc, vim-scripts
Homepage: https://vim.sourceforge.io/
Task: cloud-image, server
Supported: 5y
Download-Size: 1,152 kB
APT-Sources: http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages
Description: Vi IMproved - enhanced vi editor
 Vim is an almost compatible version of the UNIX editor Vi.
 .
 Many new features have been added: multi level undo, syntax
 highlighting, command line history, on-line help, filename
 completion, block operations, folding, Unicode support, etc.
 .
 This package contains a version of vim compiled with a rather
 standard set of features.  This package does not provide a GUI
 version of Vim.  See the other vim-* packages if you need more
 (or less).

N: There is 1 additional record. Please use the '-a' switch to see it
```

As you can see in the above output, “apt show” command displays, many important details of the package such as,

  1. package name,
  2. version,
  3. origin (from where the vim comes from),
  4. maintainer,
  5. home page of the package,
  6. dependencies,
  7. download size,
  8. description,
  9. and many.



So, the available version of Vim package in the Ubuntu repositories is **8.0.1453**. This is the version I get if I install it on my Ubuntu system.

Alternatively, use **“apt policy”** command if you prefer short output:

```
$ apt policy vim
vim:
  Installed: (none)
  Candidate: 2:8.0.1453-1ubuntu1.1
  Version table:
     2:8.0.1453-1ubuntu1.1 500
        500 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages
     2:8.0.1453-1ubuntu1 500
        500 http://archive.ubuntu.com/ubuntu bionic/main amd64 Packages
```

Or even shorter:

```
$ apt list vim
Listing... Done
vim/bionic-updates,bionic-security 2:8.0.1453-1ubuntu1.1 amd64
N: There is 1 additional version. Please use the '-a' switch to see it
```

**Apt** is the default package manager in recent Ubuntu versions. So, this command is just enough to find the detailed information of a package. It doesn’t matter whether given package is installed or not. This command will simply list the given package’s version along with all other details.

##### Method 2 – Using Apt-get

To find a package version without installing it, we can use **apt-get** command with **-s** option.

```
$ apt-get -s install vim
```

**Sample output:**

```
NOTE: This is only a simulation!
      apt-get needs root privileges for real execution.
      Keep also in mind that locking is deactivated,
      so don't depend on the relevance to the real current situation!
Reading package lists... Done
Building dependency tree
Reading state information... Done
Suggested packages:
  ctags vim-doc vim-scripts
The following NEW packages will be installed:
  vim
0 upgraded, 1 newly installed, 0 to remove and 45 not upgraded.
Inst vim (2:8.0.1453-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Conf vim (2:8.0.1453-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
```

Here, -s option indicates **simulation**. As you can see in the output, It performs no action. Instead, It simply performs a simulation to let you know what is going to happen when you install the Vim package.

You can substitute “install” option with “upgrade” option to see what will happen when you upgrade a package.

```
$ apt-get -s upgrade vim
```

##### Method 3 – Using Aptitude

**Aptitude** is an ncurses and commandline-based front-end to APT package manger in Debian and its derivatives.

To find the package version with Aptitude, simply run:

```
$ aptitude versions vim
p   2:8.0.1453-1ubuntu1                                                              bionic                                                        500
p   2:8.0.1453-1ubuntu1.1                                                            bionic-security,bionic-updates                                500
```

You can also use simulation option ( **-s** ) to see what would happen if you install or upgrade package.

```
$ aptitude -V -s install vim
The following NEW packages will be installed:
  vim [2:8.0.1453-1ubuntu1.1]
0 packages upgraded, 1 newly installed, 0 to remove and 45 not upgraded.
Need to get 1,152 kB of archives. After unpacking 2,852 kB will be used.
Would download/install/remove packages.
```

Here, **-V** flag is used to display detailed information of the package version.

Similarly, just substitute “install” with “upgrade” option to see what would happen if you upgrade a package.

```
$ aptitude -V -s upgrade vim
```

Another way to find the non-installed package’s version using Aptitude command is:

```
$ aptitude search vim -F "%c %p %d %V"
```

Here,

  * **-F** is used to specify which format should be used to display the output,
  * **%c** – status of the given package (installed or not installed),
  * **%p** – name of the package,
  * **%d** – description of the package,
  * **%V** – version of the package.



This is helpful when you don’t know the full package name. This command will list all packages that contains the given string (i.e vim).

Here is the sample output of the above command:

```
[...]
p vim                                                           Vi IMproved - enhanced vi editor                                         2:8.0.1453-1ub
p vim-tlib                                                      Some vim utility functions                                               1.23-1
p vim-ultisnips                                                 snippet solution for Vim                                                 3.1-3
p vim-vimerl                                                    Erlang plugin for Vim                                                    1.4.1+git20120
p vim-vimerl-syntax                                             Erlang syntax for Vim                                                    1.4.1+git20120
p vim-vimoutliner                                               script for building an outline editor on top of Vim                      0.3.4+pristine
p vim-voom                                                      Vim two-pane outliner                                                    5.2-1
p vim-youcompleteme                                             fast, as-you-type, fuzzy-search code completion engine for Vim           0+20161219+git
```

##### Method 4 – Using Apt-cache

**Apt-cache** command is used to query APT cache in Debian-based systems. It is useful for performing many operations on APT’s package cache. One fine example is we can [**list installed applications from a certain repository/ppa**][3].

Not just installed applications, we can also find the version of a package even if it is not installed. For instance, the following command will find the version of Vim package:

```
$ apt-cache policy vim
```

Sample output:

```
vim:
  Installed: (none)
  Candidate: 2:8.0.1453-1ubuntu1.1
  Version table:
     2:8.0.1453-1ubuntu1.1 500
        500 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages
     2:8.0.1453-1ubuntu1 500
        500 http://archive.ubuntu.com/ubuntu bionic/main amd64 Packages
```

As you can see in the above output, Vim is not installed. If you wanted to install it, you would get version **8.0.1453**. It also displays from which repository the vim package is coming from.

##### Method 5 – Using Apt-show-versions

**Apt-show-versions** command is used to list installed and available package versions in Debian and Debian-based systems. It also displays the list of all upgradeable packages. It is quite handy if you have a mixed stable/testing environment. For instance, if you have enabled both stable and testing repositories, you can easily find the list of applications from testing and also you can upgrade all packages in testing.

Apt-show-versions is not installed by default. You need to install it using command:

```
$ sudo apt-get install apt-show-versions
```

Once installed, run the following command to find the version of a package,for example Vim:

```
$ apt-show-versions -a vim
vim:amd64 2:8.0.1453-1ubuntu1   bionic          archive.ubuntu.com
vim:amd64 2:8.0.1453-1ubuntu1.1 bionic-security security.ubuntu.com
vim:amd64 2:8.0.1453-1ubuntu1.1 bionic-updates  archive.ubuntu.com
vim:amd64 not installed
```

Here, **-a** switch prints all available versions of the given package.

If the given package is already installed, you need not to use **-a** option. In that case, simply run:

```
$ apt-show-versions vim
```

And, that’s all. If you know any other methods, please share them in the comment section below. I will check and update this guide.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-check-linux-package-version-before-installing-it/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/Check-Linux-Package-Version-720x340.png
[2]: https://www.ostechnix.com/find-package-version-linux/
[3]: https://www.ostechnix.com/list-installed-packages-certain-repository-linux/
