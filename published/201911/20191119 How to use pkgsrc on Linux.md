[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11613-1.html)
[#]: subject: (How to use pkgsrc on Linux)
[#]: via: (https://opensource.com/article/19/11/pkgsrc-netbsd-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Linux 上使用 pkgsrc
======

> NetBSD 的软件包管理器通用、灵活又容易。下面是如何使用它。

![](https://img.linux.net.cn/data/attachment/album/201911/26/064538fbktfzxba18wykde.jpg)

NetBSD 以能在几乎所有平台上运行而闻名，但你知道它*第二*有名的 [pkgsrc][2] 包管理器吗？像 NetBSD 一样，pkgsrc 基本上可以在任何系统上运行，或者至少在任意 Unix 和类 Unix 的系统上上运行。你可以在 BSD、Linux、Illumos、Solaris 和 Mac 上安装 pkgsrc。它总共支持 20 多种操作系统。

### 为什么使用 pkgsrc？

除了 MacOS 之外，所有 Unix 操作系统均自带包管理器。你不一定*需要* pkgsrc，但这可能是你想尝试的三个重要原因：

* **打包**。如果你对打包感到好奇，但尚未尝试自己创建一个软件包，那么 pkgsrc 是一个相对简单的系统，尤其是如果你已经熟悉 Makefile 和类似 [GNU Autotools][3] 之类的构建系统时。
* **通用**。如果你使用多个操作系统或发行版，那么可能会遇到每个系统的包管理器。你可以在不同的系统上使用 pkgsrc，以便你为一个系统打包了程序，就为所有系统打包了。
* **灵活**。在许多打包系统中，如何选择二进制包或源码包并不总是很明显。使用 pkgsrc，区别很明显，两种安装方法都一样容易，并且都可以为你解决依赖关系。

### 如何安装 pkgsrc

无论你使用的是 BSD、Linux、Illumos、Solaris 还是 MacOS，安装过程都基本相同：

1. 使用 CVS 检出 pkgsrc 树
2. 引导 pkgsrc 系统
3. 安装软件包

#### 使用 CVS 检出 pkgsrc 树

在 Git 和 Subversion 之前，就有了 [CVS][4]。要检出代码你无需了解 CVS 太多，如果你习惯 Git，那么可以将<ruby>检出<rt>checkout</rt></ruby>称为<ruby>克隆<rt>clone</rt></ruby>。当你用 CVS 检出 pkgsrc 时，你就下载了详细说明如何构建每个软件包的“<ruby>配方<rt>recipes</rt></ruby>”。它有很多文件，但是它们都很小，因为你实际上并没有拉取每个包的源码，而只有按需构建时需要的构建基础架构和 Makefile。使用 CVS，你可以轻松地在新版本发布时更新 pkgsrc 检出。

pkgsrc 文档建议将其源码树放在 `/usr` 目录下，因此你必须使用 `sudo`（或成为 root）运行此命令：

```
$ cd /usr
$ sudo cvs -q -z2 -d anoncvs@anoncvs.NetBSD.org:/cvsroot checkout -r pkgsrc-2019Q3 -P pkgsrc
```

在我撰写本文时，最新版本是 2019Q3。请检查 [pkgsrc.org][6] 主页的新闻部分或 [NetBSD文档][7]，以确定最新版本。

#### 引导 pkgsrc

pkgsrc 树复制到你的计算机后，你会看到一个充满构建脚本的 `/usr/pkgsrc` 目录。在使用之前，你必须引导 pkgsrc，以便你可以轻松地访问构建和安装软件所需的相关命令。

引导 pkgsrc 的方式取决于你所使用操作系统。

对于 NetBSD，你只需使用捆绑的引导器：

```
# cd pkgsrc/bootstrap
# ./bootstrap
```

在其他系统上，还有更好的方法，包括一些自定义功能，它是由 Joyent 提供的。要了解运行的确切命令，请访问 [pkgsrc.joyent.com][8]。比如，在 Linux（Fedora、Debian、Slackware 等）上：

```
$ curl -O https://pkgsrc.joyent.com/packages/Linux/el7/bootstrap/bootstrap-trunk-x86_64-20170127.tar.gz
$ BOOTSTRAP_SHA="eb0d6911489579ca893f67f8a528ecd02137d43a"
```

尽管路径暗示文件适用于 RHEL 7，但二进制文件往往与所有（最前沿的 Linux 发行版）兼容。如果你发现二进制文件与你的发行版不兼容，你可以选择从源码构建。

验证 SHA1 校验和：

```
$ echo "${BOOTSTRAP_SHA}" bootstrap-trunk*gz > check-shasum
sha1sum -c check-shasum
```

你还可以验证 PGP 签名：

```
$ curl -O https://pkgsrc.joyent.com/packages/Linux/el7/bootstrap/bootstrap-trunk-x86_64-20170127.tar.gz.asc
$ curl -sS https://pkgsrc.joyent.com/pgp/56AAACAF.asc | gpg --import
$ gpg --verify ${BOOTSTRAP_TAR}{.asc,}
```

当你确认你已有正确的引导套件，将其安装到 `/usr/pkg`：

```
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /
```

它为你提供了通常的 pkgsrc 命令。将这些位置添加到[你的 PATH 环境变量中][9]：

```
$ echo "PATH=/usr/pkg/sbin:/usr/pkg/bin:$PATH" >> ~/.bashrc
$ echo "MANPATH=/usr/pkg/man:$MANPATH" >> ~/.bashrc
```

如果你宁愿使用 pkgsrc 而不依赖于 Joyent 的构建，那么只需运行 pkgsrc 源码树的引导脚本即可。在运行特定于系统的脚本之前，请先阅读 `bootstrap` 目录中相关 `README` 文件。

![Bootstrapping pkgsrc on NetBSD][10]

### 如何使用 pkgsrc 安装软件

使用 pkgsrc 安装预编译的二进制文件（就像使用 DNF 或 Apt 一样）是很容易的。二进制安装的命令是 `pgkin`，它有自己的专门网站 [pkgin.net][11]。对于任何用过 Linux 的人来说，这个过程应该感觉相当熟悉。

要搜索 `tmux` 包：

```
$ pkgin search tmux
```

要安装 tmux 包：

```
$ sudo pkgin install tmux
```

`pkgin` 命令的目的是模仿典型的 Linux 包管理器的行为，因此有选项可以列出可用的包、查找包提供的特定可执行文件，等等。

### 如何使用 pkgsrc 从源码构建

然而，pkgsrc 真正强大的地方是方便地从源码构建包。你在第一步中检出了所有 20000 多个构建脚本，你可以直接进入 pkgsrc 源码树来访问这些脚本。

例如，要从源码构建 `tcsh`，首先找到构建脚本：

```
$ find /usr/pkgsrc -type d -name "tcsh"
/usr/pkgsrc/shells/tcsh
```

接下来，进入源码目录：

```
$ cd /usr/pgksrc/shells/tcsh
```

构建脚本目录包含许多文件来帮助在你的系统上构建应用，但值得注意的是，这里面有包含了软件说明的 `DESCR` 文件，以及触发构建的 `Makefile`。

```
$ ls
CVS    DESCR     Makefile
PLIST  distinfo  patches
$ cat DESCR
TCSH is an extended C-shell with many useful features like
filename completion, history editing, etc.
$
```

准备就绪后，构建并安装：

```
$ sudo bmake install
```

pkgsrc 系统使用 `bmake` 命令（在第一步检出 pkgsrc 后提供），因此请务必使用 `bmake`（而不是出于习惯使用 `make`）。

如果要为多个系统构建，那么你可以创建一个包，而不是立即安装：

```
$ cd /usr/pgksrc/shells/tcsh
$ sudo bmake package
[...]
=> Creating binary package in /usr/pkgsrc/packages/All/tcsh-X.Y.Z.tgz
```

pkgsrc 创建的包是标准的 tarball，但它可以方便地通过 `pkg_add` 安装：

```
$ sudo pkg_add /usr/pkgsrc/packages/All/tcsh-X.Y.Z.tgz
tcsh-X.Y.Z: adding /usr/pkg/bin/tcsh to /etc/shells
$ tcsh
localhost%
```

pkgsrc 的 pkgtools 集合提供 `pkg_add`、`pkg_info`、`pkg_admin`、`pkg_create` 和 `pkg_delete` 命令，来帮助管理你在系统上构建和维护软件包。

### pkgsrc，易于管理

pkgsrc 系统提供了直接，容易上手的软件包管理方法。如果你正在寻找一个不妨碍你并且可以定制的包管理器，请在任何运行 Unix 或类 Unix 的系统上试试 pkgsrc。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/pkgsrc-netbsd-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: http://pkgsrc.org
[3]: https://opensource.com/article/19/7/introduction-gnu-autotools
[4]: http://www.netbsd.org/developers/cvs-repos/cvs_intro.html#intro
[5]: mailto:anoncvs@anoncvs.NetBSD.org
[6]: http://pkgsrc.org/
[7]: http://www.netbsd.org/docs/pkgsrc/getting.html
[8]: http://pkgsrc.joyent.com/
[9]: https://opensource.com/article/17/6/set-path-linux
[10]: https://opensource.com/sites/default/files/uploads/pkgsrc-bootstrap.jpg (Bootstrapping pkgsrc on NetBSD)
[11]: http://pkgin.net
