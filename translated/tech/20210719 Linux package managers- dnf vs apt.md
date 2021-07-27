[#]: subject: (Linux package managers: dnf vs apt)
[#]: via: (https://opensource.com/article/21/7/dnf-vs-apt)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (perfiffer )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux 包管理器: dnf 和 apt
======
包管理器提供同样的功能-安装，管理和删除应用-但是它们还是有一些不一样的地方。
![Gift box opens with colors coming out][1]

有多种方式 [在Linux系统上获取一个应用][2]。例如，最新的Flatpak 和容器，另外，还有 DEB 和 RPM，是一直以来经受住了考验的方式。

对于所有的操作系统来说，目前并不存在一种通用的应用安装程序。今天，因为有无数的开发者发布软件，这导致了大部分的操作系统使用了应用商店（包括第一方和第三方），拖拽式的安装方式，还有安装向导。不同的开发者对于他们发布的代码有不同的需求，这直接导致了他们所选择的安装方式的不同。

Linux 开创了一种通过命令行安装，管理，卸载应用的包管理器理念。`apt` 和 `dnf` 就是两种较为常见的包管理器。`apt` 命令是用来管理 DEB 格式的包，`dnf` 命令是用来管理 RPM 格式的包。这两种包管理器在理论上并不是完全互斥的，尽管在实际的实践中，Linux 发行版通常只会使用到其中的一种。理论上，这两种命令可以运行在同一个系统上，但是会造成安装包的重叠，版本控制也会更加困难，命令彼此之间是冗余的。然而，如果您是在一个复杂的 Linux 环境下工作，比如您的工作站运行的是一个发行版，同时需要与运行另外一种发行版的服务器进行交互，那么您最好掌握这两种包管理器。

### 搜索应用

当您通过包管理器安装一个应用时，您需要先知道包的名称。通常，应用的名称和包的名称是一样的。`dnf` 和 `apt` 验证要安装的包名的过程是完全相同的。

```
$ sudo dnf search zsh
====== 名称 精准匹配：zsh ======
zsh.x86_64 : Powerful interactive shell
```

使用 `apt`:

```
$ sudo apt search zsh
正在排序... 完成
全文搜索... 完成
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

如果想通过 `apt` 更快的获取相关的搜索结果，您可以使用 [正则表达式][3]:

```
apt search ^zsh
正在排序... 完成
全文搜索... 完成
zsh/stable 5.7.1-1 amd64
  shell with lots of features
[...]
```

### 查找应用程序包
在一个包中，有一些命令是与其它命令捆绑在一起的。在这种情况下，您可以通过包管理器去了解哪个包提供了您需要的命令。`dnf` 和 `apt` 命令在如何搜索这类元数据上是有区别的。

使用 `dnf`:

```
$ sudo dnf provides pgrep
procps-ng-3.3.15-6.el8.x86_64 : System and process monitoring utilities
仓库        : baseos
匹配来源:
文件名    : /usr/bin/pgrep
```

`apt` 命令使用子命令，`apt-file`。要使用 `apt-file`，您必须先安装它，然后提示它更新缓存：

```
$ sudo apt install apt-file
正在读取软件包列表... 完成
正在分析软件包的依赖关系树      
正在读取状态信息... 完成
下列额外的软件包将要被安装：
  libapt-pkg-perl libexporter-tiny-perl liblist-moreutils-perl libregexp-assemble-perl
下列【新】软件包将被安装：
  apt-file libapt-pkg-perl libexporter-tiny-perl liblist-moreutils-perl libregexp-assemble-perl
升级了 0 个软件包，新安装了 5 个软件包，要卸载 0 个软件包，有 14 个软件包未被升级。
需要下载 297 kB 的归档。
解压缩后会消耗 825 kB 的额外空间。
您想要继续吗？ [Y/n] y

$ sudo apt-file update
[...]
```

您可以通过 `apt-file` 搜索命令。您可以使用此命令进行广泛的全局搜索，但假如您知道命令的执行路径，它会更准确：

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

使用 `dnf`，您可以使用同样的方式来安装一个包：

```
$ sudo dnf install zsh
```

许多基于RPM的发行版都具有组包安装的特性，这些特性会将具有相关性的应用程序收集到一个易于安装的目标中。例如，Fedora 中的 [Design Suite][4] 组包就包含流行的创造性应用程序。那些想要一个创造性应用程序的“艺术家”可能也想要一个类似的应用程序，选择安装一整个组包是建立一个数据工厂简单而快速的方法。您可以通过 `group list` 来查看可用的组（使用 `-v` 来过滤空格）：

```
$ sudo dnf group list -v
[...]
可用组:
   Container Management (container-management)
   RPM Development Tools (rpm-development-tools)
   Design Suite (design-suite)
   Development Tools (development)
[...]
```

使用 `group install` 子命令安装 RPM 组：

```
$ sudo dnf group install design-suite
```

您可以使用 `@` 符号来减少输入：

```
$ sudo dnf install @design-suite
```

### 更新应用程序

使用包管理器的一个优点是，它知道所有已经安装的应用。这样您不必去寻找应用程序的更新版本。相反，您可以通过包管理器去获取更新的版本。

`dnf` 和 `apt` 使用的子命令略有不同。因为 `apt` 保存了需要定期更新的缓存信息，它使用 `upgrade` 子命令来更新应用程序：

```
$ sudo apt upgrade
```

相比之下，`dnf` 命令在您每次使用时都会更新元信息，所以 `update` 和 `upgrade` 子命令是可以互换的： 

```
$ sudo dnf upgrade
```

这等同于：

```
$ sudo dnf update
```

### 删除应用程序

如果您曾经尝试在任何一个平台上手动删除一个应用程序，您就会知道，应用程序删除后，在硬盘上会残留各种文件，比如首选项文件、数据或图标。所以包管理器的另一个优点是，包管理器管理着包中安装的每一个文件，可以很方便的删除：

```
$ sudo dnf remove zsh
```

`remove` 子命令也适用于 `apt`：

```
$ sudo apt remove zsh
```

使用 `apt` 命令删除一个包并不会删除已修改的用户配置文件，以防您意外删除了包。如果您想通过 `apt` 命令删除一个应用及其配置文件，可以在删除包之前，使用 `purge` 子命令：

```
$ sudo apt purge zsh
```

`apt` 和 `dnf` 都不会删除家目录中的数据和配置文件（即使使用 `purge` 子命令）。如果想要从家目录中删除数据，您必须手动操作（通常您可以在 `~/.config` 和 `~/.local` 文件中找到）。

### 了解包管理

无论您选择的发行版支持的是 `apt` 还是 `dnf`，这些命令的用途大致相同。它们可以帮助您安装，更新和删除包。这两种包管理器是目前最通用的包管理器。它们的语法元素在很大程度上是相同的，所以在两者之间切换非常容易。

`apt` 和 `dnf` 还有一些高级功能，例如仓库管理，这些功能并不像您使用 `search` 和 `install` 那样频繁。

无论您更多的使用哪种包管理器，您都可以下载我们的 [apt 备忘单][5] 和 [dnf 备忘单][6]，以便您在最需要的时候可以查询使用语法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/dnf-vs-apt

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://opensource.com/article/18/1/how-install-apps-linux
[3]: https://opensource.com/article/18/5/getting-started-regular-expressions
[4]: https://labs.fedoraproject.org/en/design-suite/
[5]: https://opensource.com/downloads/apt-cheat-sheet
[6]: https://opensource.com/downloads/dnf-cheat-sheet
