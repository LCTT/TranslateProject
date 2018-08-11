献给 Debian 和 Ubuntu 用户的一组实用程序
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/debian-goodies-720x340.png)

你使用的是基于 Debian 的系统吗？如果是，太好了！我今天在这里给你带来了一个好消息。先向 “Debian-goodies” 打个招呼，这是一组基于 Debian 系统（比如：Ubuntu、Linux Mint）的有用工具。这些实用工具提供了一些额外的有用的命令，这些命令在基于 Debian 的系统中默认不可用。通过使用这些工具，用户可以找到哪些程序占用更多磁盘空间，更新系统后需要重新启动哪些服务，在一个软件包中搜索与模式匹配的文件，根据搜索字符串列出已安装的包等等。在这个简短的指南中，我们将讨论一些有用的 Debian 的好东西。

### Debian-goodies – 给 Debian 和 Ubuntu 用户的实用程序

debian-goodies 包可以在 Debian 和其衍生的 Ubuntu 以及其它 Ubuntu 变体（如 Linux Mint）的官方仓库中找到。要安装 debian-goodies，只需简单运行：

```
$ sudo apt-get install debian-goodies
```

debian-goodies 安装完成后，让我们继续看一看一些有用的实用程序。

#### 1、 checkrestart

让我从我最喜欢的 `checkrestart` 实用程序开始。安装某些安全更新时，某些正在运行的应用程序可能仍然会使用旧库。要彻底应用安全更新，你需要查找并重新启动所有这些更新。这就是 `checkrestart` 派上用场的地方。该实用程序将查找哪些进程仍在使用旧版本的库，然后，你可以重新启动服务。

在进行库更新后，要检查哪些守护进程应该被重新启动，运行：

```
$ sudo checkrestart
[sudo] password for sk:
Found 0 processes using old versions of upgraded files
```

由于我最近没有执行任何安全更新，因此没有显示任何内容。

请注意，`checkrestart` 实用程序确实运行良好。但是，有一个名为 `needrestart` 的类似的新工具可用于最新的 Debian 系统。`needrestart` 的灵感来自 `checkrestart` 实用程序，它完成了同样的工作。 `needrestart` 得到了积极维护，并支持容器（LXC、 Docker）等新技术。

以下是 `needrestart` 的特点：
 
 * 支持（但不要求）systemd
 * 二进制程序的黑名单（例如：用于图形显示的显示管理器）
 * 尝试检测挂起的内核升级
 * 尝试检测基于解释器的守护进程所需的重启（支持 Perl、Python、Ruby）
 * 使用钩子完全集成到 apt/dpkg 中

它在默认仓库中也可以使用。所以，你可以使用如下命令安装它：

```
$ sudo apt-get install needrestart
```

现在，你可以使用以下命令检查更新系统后需要重新启动的守护程序列表：

```
$ sudo needrestart
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

Failed to check for processor microcode upgrades.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.
```

好消息是 Needrestart 同样也适用于其它 Linux 发行版。例如，你可以从 Arch Linux 及其衍生版的 AUR 或者其它任何 AUR 帮助程序来安装，就像下面这样：

```
$ yaourt -S needrestart
```

在 Fedora：

```
$ sudo dnf install needrestart
```

#### 2、 check-enhancements 

`check-enhancements` 实用程序用于查找那些用于增强已安装的包的软件包。此实用程序将列出增强其它包但不是必须运行它的包。你可以通过 `-ip` 或 `–installed-packages` 选项来查找增强单个包或所有已安装包的软件包。

例如，我将列出增强 gimp 包功能的包：

```
$ check-enhancements gimp
gimp => gimp-data: Installed: (none) Candidate: 2.8.22-1
gimp => gimp-gmic: Installed: (none) Candidate: 1.7.9+zart-4build3
gimp => gimp-gutenprint: Installed: (none) Candidate: 5.2.13-2
gimp => gimp-help-ca: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-de: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-el: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-en: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-es: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-fr: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-it: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-ja: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-ko: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-nl: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-nn: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-pt: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-ru: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-sl: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-sv: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-plugin-registry: Installed: (none) Candidate: 7.20140602ubuntu3
gimp => xcftools: Installed: (none) Candidate: 1.0.7-6
```

要列出增强所有已安装包的，请运行：

```
$ check-enhancements -ip
autoconf => autoconf-archive: Installed: (none) Candidate: 20170928-2
btrfs-progs => snapper: Installed: (none) Candidate: 0.5.4-3
ca-certificates => ca-cacert: Installed: (none) Candidate: 2011.0523-2
cryptsetup => mandos-client: Installed: (none) Candidate: 1.7.19-1
dpkg => debsig-verify: Installed: (none) Candidate: 0.18
[...]
```

#### 3、 dgrep

顾名思义，`dgrep` 用于根据给定的正则表达式搜索制指定包的所有文件。例如，我将在 Vim 包中搜索包含正则表达式 “text” 的文件。

```
$ sudo dgrep "text" vim
Binary file /usr/bin/vim.tiny matches
/usr/share/doc/vim-tiny/copyright: that they must include this license text. You can also distribute
/usr/share/doc/vim-tiny/copyright: include this license text. You are also allowed to include executables
/usr/share/doc/vim-tiny/copyright: 1) This license text must be included unmodified.
/usr/share/doc/vim-tiny/copyright: text under a) applies to those changes.
/usr/share/doc/vim-tiny/copyright: context diff. You can choose what license to use for new code you
/usr/share/doc/vim-tiny/copyright: context diff will do. The e-mail address to be used is
/usr/share/doc/vim-tiny/copyright: On Debian systems, the complete text of the GPL version 2 license can be
[...]
```

`dgrep` 支持大多数 `grep` 的选项。参阅以下指南以了解 `grep` 命令。
 
 * [献给初学者的 Grep 命令教程][2]

#### 4、 dglob

`dglob` 实用程序生成与给定模式匹配的包名称列表。例如，找到与字符串 “vim” 匹配的包列表。

```
$ sudo dglob vim
vim-tiny:amd64
vim:amd64
vim-common:all
vim-runtime:all
```

默认情况下，`dglob` 将仅显示已安装的软件包。如果要列出所有包（包括已安装的和未安装的），使用 `-a` 标志。

```
$ sudo dglob vim -a
```

#### 5、 debget

`debget` 实用程序将在 APT 的数据库中下载一个包的 .deb 文件。请注意，它只会下载给定的包，不包括依赖项。

```
$ debget nano
Get:1 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 nano amd64 2.9.3-2 [231 kB]
Fetched 231 kB in 2s (113 kB/s)
```

#### 6、 dpigs

这是此次集合中另一个有用的实用程序。`dpigs` 实用程序将查找并显示那些占用磁盘空间最多的已安装包。

```
$ dpigs
260644 linux-firmware
167195 linux-modules-extra-4.15.0-20-generic
75186 linux-headers-4.15.0-20
64217 linux-modules-4.15.0-20-generic
55620 snapd
31376 git
31070 libicu60
28420 vim-runtime
25971 gcc-7
24349 g++-7
```

如你所见，linux-firmware 包占用的磁盘空间最多。默认情况下，它将显示占用磁盘空间的 **前 10 个**包。如果要显示更多包，例如 20 个，运行以下命令：

```
$ dpigs -n 20
```

#### 7. debman

`debman` 实用程序允许你轻松查看二进制文件 .deb 中的手册页而不提取它。你甚至不需要安装 .deb 包。以下命令显示 nano 包的手册页。

```
$ debman -f nano_2.9.3-2_amd64.deb nano
```

如果你没有 .deb 软件包的本地副本，使用 `-p` 标志下载并查看包的手册页。

```
$ debman -p nano nano
```

**建议阅读：**

- [每个 Linux 用户都应该知道的 3 个 man 的替代品][3]

#### 8、 debmany

安装的 Debian 包不仅包含手册页，还包括其它文件，如确认、版权和自述文件等。`debmany` 实用程序允许你查看和读取那些文件。

```
$ debmany vim
```

![][1]

使用方向键选择要查看的文件，然后按回车键查看所选文件。按 `q` 返回主菜单。

如果未安装指定的软件包，`debmany` 将从 APT 数据库下载并显示手册页。应安装 `dialog` 包来阅读手册页。

#### 9、 popbugs

如果你是开发人员，`popbugs` 实用程序将非常有用。它将根据你使用的包显示一个定制的发布关键 bug 列表（使用 popularity-contest 数据）。对于那些不关心的人，popularity-contest 包设置了一个 cron （定时）任务，它将定期匿名向 Debian 开发人员提交有关该系统上最常用的 Debian 软件包的统计信息。这些信息有助于 Debian 做出决定，例如哪些软件包应该放在第一张 CD 上。它还允许 Debian 改进未来的发行版本，以便为新用户自动安装最流行的软件包。

要生成严重 bug 列表并在默认 Web 浏览器中显示结果，运行：

```
$ popbugs
```

此外，你可以将结果保存在文件中，如下所示。

```
$ popbugs --output=bugs.txt
```

#### 10、 which-pkg-broke

此命令将显示给定包的所有依赖项以及安装每个依赖项的时间。通过使用此信息，你可以在升级系统或软件包之后轻松找到哪个包可能会在什么时间损坏了另一个包。

```
$ which-pkg-broke vim
Package <debconf-2.0> has no install time info
debconf Wed Apr 25 08:08:40 2018
gcc-8-base:amd64 Wed Apr 25 08:08:41 2018
libacl1:amd64 Wed Apr 25 08:08:41 2018
libattr1:amd64 Wed Apr 25 08:08:41 2018
dpkg Wed Apr 25 08:08:41 2018
libbz2-1.0:amd64 Wed Apr 25 08:08:41 2018
libc6:amd64 Wed Apr 25 08:08:42 2018
libgcc1:amd64 Wed Apr 25 08:08:42 2018
liblzma5:amd64 Wed Apr 25 08:08:42 2018
libdb5.3:amd64 Wed Apr 25 08:08:42 2018
[...]
```

#### 11、 dhomepage

`dhomepage` 实用程序将在默认 Web 浏览器中显示给定包的官方网站。例如，以下命令将打开 Vim 编辑器的主页。

```
$ dhomepage vim
```

这就是全部了。Debian-goodies 是你武器库中必备的工具。即使我们不经常使用所有这些实用程序，但它们值得学习，我相信它们有时会非常有用。

我希望这很有用。更多好东西要来了。敬请关注！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/debian-goodies-a-set-of-useful-utilities-for-debian-and-ubuntu-users/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/wp-content/uploads/2018/05/debmany.png
[2]:
https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[3]:
https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
