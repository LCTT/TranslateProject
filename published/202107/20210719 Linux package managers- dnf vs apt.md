[#]: subject: (Linux package managers: dnf vs apt)
[#]: via: (https://opensource.com/article/21/7/dnf-vs-apt)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (perfiffer)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13620-1.html)

Linux 包管理器比较：dnf 和 apt
======

> 包管理器提供大致相同的功能：安装、管理和移除应用，但是它们还是有一些不一样的地方。

![](https://img.linux.net.cn/data/attachment/album/202107/27/083002sd5zzxu37yhiz6yc.jpg)

[在 Linux 系统上获取一个应用][2] 有多种方式。例如，有新的 Flatpak 和容器方式，也有 DEB 和 RPM 这样一直以来经过考验的方式。

并没有一种通用的可以用于所有的操作系统的应用安装程序。如今，因为有无数的开发者发布软件，这导致了大部分的操作系统使用了应用商店（包括第一方和第三方）、拖放式安装，还有安装向导。不同的开发者对于他们发布的代码有不同的需求，这直接导致了他们所选择的安装方式的不同。

Linux 开创了一种通过命令行安装、管理、移除应用的包管理器的概念。`apt` 和 `dnf` 就是两种较为常见的包管理器。`apt` 命令是用来管理 DEB 格式的包，`dnf` 命令是用来管理 RPM 格式的包。这两种包管理器在理论上并不是完全互斥的，尽管在实际的实践中，Linux 发行版通常只会使用到其中的一种。理论上，这两种命令可以运行在同一个系统上，但是会造成安装包的重叠，版本控制也会更加困难，命令也会是冗余的。然而，如果你是在一个混合的 Linux 环境下工作，比如你的工作站运行的是一个发行版，同时需要与运行另外一种发行版的服务器进行交互，那么你最好同时掌握这两种包管理器。

### 搜索应用

当你通过包管理器安装一个应用时，你需要先知道包的名称。通常，应用的名称和包的名称是一样的。`dnf` 和 `apt` 验证要安装的包名的过程是完全相同的。

```
$ sudo dnf search zsh
====== Name Exactly Matched: zsh ======
zsh.x86_64 : Powerful interactive shell
[...]
```

使用 `apt`:

```
$ sudo apt search zsh
Sorting... Done
Full Text Search... Done
csh/stable 20110502-4+deb10u1 amd64
  Shell with C-like syntax

ddgr/stable 1.6-1 all
  DuckDuckGo from the terminal

direnv/stable 2.18.2-2 amd64
  Utility to set directory specific environment variables

draai/stable 20180521-1 all
  Command-line music player for MPD
[...]
```

如果想通过 `apt` 更快的获取相关的搜索结果，你可以使用 [正则表达式][3]：

```
apt search ^zsh
Sorting... Done
Full Text Search... Done
zsh/stable 5.7.1-1 amd64
  shell with lots of features
[...]
```

### 查找应用程序包

有一些命令是与其它命令捆绑在一起的，都在一个包中。在这种情况下，你可以通过包管理器去了解哪个包提供了你需要的命令。`dnf` 和 `apt` 命令在如何搜索这类元数据上是有区别的。

使用 `dnf`：

```
$ sudo dnf provides pgrep
procps-ng-3.3.15-6.el8.x86_64 : System and process monitoring utilities
Repo        : baseos
Matched from:
Filename    : /usr/bin/pgrep
```

`apt` 命令使用子命令 `apt-file`。要使用 `apt-file`，你必须先安装它，然后提示它更新缓存：

```
$ sudo apt install apt-file
Reading package lists... Done
Building dependency tree      
Reading state information... Done
The following additional packages will be installed:
  libapt-pkg-perl libexporter-tiny-perl liblist-moreutils-perl libregexp-assemble-perl
The following NEW packages will be installed:
  apt-file libapt-pkg-perl libexporter-tiny-perl liblist-moreutils-perl libregexp-assemble-perl
0 upgraded, 5 newly installed, 0 to remove and 14 not upgraded.
Need to get 297 kB of archives.
After this operation, 825 kB of additional disk space will be used.
Do you want to continue? [Y/n] y

$ sudo apt-file update
[...]
```

你可以通过 `apt-file` 搜索命令。你可以使用此命令进行广泛的全局搜索，但假如你知道命令的执行路径，它会更准确：

```
$ sudo apt-file search /usr/bin/pgrep
pgreplay: /usr/bin/pgreplay              
procps: /usr/bin/pgrep
```

### 安装应用程序

使用`apt` 和 `dnf` 安装应用程序基本上是相同的：

```
$ sudo apt install zsh
```

使用 `dnf`，你可以使用同样的方式来安装一个包：

```
$ sudo dnf install zsh
```

许多基于 RPM 的发行版都具有组包安装的特性，它会将有时表面相关的应用程序收集到一个易于安装的目标中。例如，Fedora 中的 [Design Suite][4] 组包就包含流行的创意应用程序。那些想要某一个创意应用程序的艺术家可能也想要类似的应用程序，选择安装一整个组包一个简单而快速的方法，可以合理地开始建立一个数字工作室。你可以通过 `group list` 来查看可用的组包（使用 `-v` 来查看不带空格的组名）：

```
$ sudo dnf group list -v
[...]
Available Groups:
   Container Management (container-management)
   RPM Development Tools (rpm-development-tools)
   Design Suite (design-suite)
   Development Tools (development)
[...]
```

使用 `group install` 子命令安装 RPM 组包：

```
$ sudo dnf group install design-suite
```

你可以使用 `@` 符号来减少输入：

```
$ sudo dnf install @design-suite
```

### 更新应用程序

使用包管理器的一个优点是，它知道所有已经安装的应用。这样你不必去寻找应用程序的更新版本。相反，你可以通过包管理器去获取更新的版本。

`dnf` 和 `apt` 使用的子命令略有不同。因为 `apt` 保存了一个需要定期更新的缓存信息，它使用 `upgrade` 子命令来更新应用程序：

```
$ sudo apt upgrade
```

相比之下，`dnf` 命令在你每次使用时都会更新元信息，所以 `update` 和 `upgrade` 子命令是可以互换的： 

```
$ sudo dnf upgrade
```

这等同于：

```
$ sudo dnf update
```

### 移除应用程序

如果你曾经尝试在任何一个平台上手动删除一个应用程序，你就会知道，应用程序删除后，在硬盘上会残留各种文件，比如首选项文件、数据或图标。所以包管理器的另一个优点是，包管理器管理着包中安装的每一个文件，可以很方便的删除：

```
$ sudo dnf remove zsh
```

`remove` 子命令也适用于 `apt`：

```
$ sudo apt remove zsh
```

使用 `apt` 命令删除一个包并不会删除已修改的用户配置文件，以防你意外删除了包。如果你想通过 `apt` 命令删除一个应用及其配置文件，请在你之前删除过的应用程序上使用 `purge` 子命令：

```
$ sudo apt purge zsh
```

`apt` 和 `dnf` 都不会删除家目录中的数据和配置文件（即使使用 `purge` 子命令）。如果想要从家目录中删除数据，你必须手动操作（通常你可以在 `~/.config` 和 `~/.local` 文件中找到）。

### 了解包管理

无论你选择的发行版支持的是 `apt` 还是 `dnf`，这些命令的用途大致相同。它们可以帮助你安装、更新和移除包。这两种包管理器是目前最通用的包管理器。它们的语法元素在很大程度上是相同的，所以在两者之间切换非常容易。

`apt` 和 `dnf` 还有一些高级功能，例如仓库管理，但这些功能并不像你使用 `search` 和 `install` 那样频繁。

无论你更经常使用哪种包管理器，你都可以下载我们的 [apt 备忘单][5] 和 [dnf 备忘单][6]，以便你在最需要的时候可以查询使用语法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/dnf-vs-apt

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://opensource.com/article/18/1/how-install-apps-linux
[3]: https://opensource.com/article/18/5/getting-started-regular-expressions
[4]: https://labs.fedoraproject.org/en/design-suite/
[5]: https://opensource.com/downloads/apt-cheat-sheet
[6]: https://opensource.com/downloads/dnf-cheat-sheet
