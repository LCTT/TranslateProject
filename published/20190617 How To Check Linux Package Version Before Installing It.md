[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11243-1.html)
[#]: subject: (How To Check Linux Package Version Before Installing It)
[#]: via: (https://www.ostechnix.com/how-to-check-linux-package-version-before-installing-it/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在安装之前检查 Linux 软件包的版本？
======

![Check Linux Package Version][1]

大多数人都知道如何在 Linux 中[查找已安装软件包的版本][2]，但是，你会如何查找那些还没有安装的软件包的版本呢？很简单！本文将介绍在 Debian 及其衍生品（如 Ubuntu）中，如何在软件包安装之前检查它的版本。对于那些想在安装之前知道软件包版本的人来说，这个小技巧可能会有所帮助。

### 在安装之前检查 Linux 软件包版本

在基于 DEB 的系统中，即使软件包还没有安装，也有很多方法可以查看他的版本。接下来，我将一一介绍。

#### 方法 1 – 使用 Apt

检查软件包的版本的懒人方法：

```
$ apt show <package-name>
```

**示例：**

```
$ apt show vim
```

**示例输出：**

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

正如你在上面的输出中看到的，`apt show` 命令显示了软件包许多重要的细节，例如：

  1. 包名称，
  2. 版本，
  3. 来源（vim 来自哪里），
  4. 维护者，
  5. 包的主页，
  6. 依赖，
  7. 下载大小，
  8. 简介，
  9. 其他。

因此，Ubuntu 仓库中可用的 Vim 版本是 **8.0.1453**。如果我把它安装到我的 Ubuntu 系统上，就会得到这个版本。

或者，如果你不想看那么多的内容，那么可以使用 `apt policy` 这个命令：

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

甚至更短：

```
$ apt list vim
Listing... Done
vim/bionic-updates,bionic-security 2:8.0.1453-1ubuntu1.1 amd64
N: There is 1 additional version. Please use the '-a' switch to see it
```

`apt` 是 Ubuntu 最新版本的默认包管理器。因此，这个命令足以找到一个软件包的详细信息，给定的软件包是否安装并不重要。这个命令将简单地列出给定包的版本以及其他详细信息。

#### 方法 2 – 使用 Apt-get

要查看软件包的版本而不安装它，我们可以使用 `apt-get` 命令和 `-s` 选项。

```
$ apt-get -s install vim
```

**示例输出：**

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

这里，`-s` 选项代表 **模拟**。正如你在输出中看到的，它不执行任何操作。相反，它只是模拟执行，好让你知道在安装 Vim 时会发生什么。

你可以将 `install` 选项替换为 `upgrade`，以查看升级包时会发生什么。

```
$ apt-get -s upgrade vim
```

#### 方法 3 – 使用 Aptitude

在 Debian 及其衍生品中，`aptitude` 是一个基于 ncurses（LCTT 译注：ncurses 是终端基于文本的字符处理的库）和命令行的前端 APT 包管理器。

使用 aptitude 来查看软件包的版本，只需运行：

```
$ aptitude versions vim
p   2:8.0.1453-1ubuntu1                                                              bionic                                                        500
p   2:8.0.1453-1ubuntu1.1                                                            bionic-security,bionic-updates                                500
```

你还可以使用模拟选项（`-s`）来查看安装或升级包时会发生什么。

```
$ aptitude -V -s install vim
The following NEW packages will be installed:
  vim [2:8.0.1453-1ubuntu1.1]
0 packages upgraded, 1 newly installed, 0 to remove and 45 not upgraded.
Need to get 1,152 kB of archives. After unpacking 2,852 kB will be used.
Would download/install/remove packages.
```

这里，`-V` 标志用于显示软件包的详细信息。

```
$ aptitude -V -s upgrade vim
```

类似的，只需将 `install` 替换为 `upgrade` 选项，即可查看升级包会发生什么。

```
$ aptitude search vim -F "%c %p %d %V"
```

这里，

  * `-F` 用于指定应使用哪种格式来显示输出，
  * `%c` – 包的状态（已安装或未安装），
  * `%p` – 包的名称，
  * `%d` – 包的简介，
  * `%V` – 包的版本。

当你不知道完整的软件包名称时，这非常有用。这个命令将列出包含给定字符串（即 vim）的所有软件包。

以下是上述命令的示例输出：

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

#### 方法 4 – 使用 Apt-cache

`apt-cache` 命令用于查询基于 Debian 的系统中的 APT 缓存。对于要在 APT 的包缓存上执行很多操作时，它很有用。一个很好的例子是我们可以从[某个仓库或 ppa 中列出已安装的应用程序][3]。

不仅是已安装的应用程序，我们还可以找到软件包的版本，即使它没有被安装。例如，以下命令将找到 Vim 的版本：

```
$ apt-cache policy vim
```

示例输出：

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

正如你在上面的输出中所看到的，Vim 并没有安装。如果你想安装它，你会知道它的版本是 **8.0.1453**。它还显示 vim 包来自哪个仓库。

#### 方法 5 – 使用 Apt-show-versions

在 Debian 和基于 Debian 的系统中，`apt-show-versions` 命令用于列出已安装和可用软件包的版本。它还显示所有可升级软件包的列表。如果你有一个混合的稳定或测试环境，这是非常方便的。例如，如果你同时启用了稳定和测试仓库，那么你可以轻松地从测试库找到应用程序列表，还可以升级测试库中的所有软件包。

默认情况下系统没有安装 `apt-show-versions`，你需要使用以下命令来安装它：

```
$ sudo apt-get install apt-show-versions
```

安装后，运行以下命令查找软件包的版本，例如 Vim：

```
$ apt-show-versions -a vim
vim:amd64 2:8.0.1453-1ubuntu1   bionic          archive.ubuntu.com
vim:amd64 2:8.0.1453-1ubuntu1.1 bionic-security security.ubuntu.com
vim:amd64 2:8.0.1453-1ubuntu1.1 bionic-updates  archive.ubuntu.com
vim:amd64 not installed
```

这里，`-a` 选项打印给定软件包的所有可用版本。

如果已经安装了给定的软件包，那么就不需要使用 `-a` 选项。在这种情况下，只需运行：

```
$ apt-show-versions vim
```

差不多完了。如果你还了解其他方法，在下面的评论中分享，我将检查并更新本指南。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-check-linux-package-version-before-installing-it/

作者：[sk][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/Check-Linux-Package-Version-720x340.png
[2]: https://www.ostechnix.com/find-package-version-linux/
[3]: https://www.ostechnix.com/list-installed-packages-certain-repository-linux/
