[#]: subject: "How to use BusyBox on Linux"
[#]: via: "https://opensource.com/article/21/8/what-busybox"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13840-1.html"

如何在 Linux 上使用 BusyBox
======

> BusyBox 是一个开源（GPL）项目，提供了近 400 个常用命令的简单实现。

![](https://img.linux.net.cn/data/attachment/album/202110/01/185208x6ckkmvi0silk3vk.jpg)

我们很容易认为 Linux 的命令是理所当然的。当你安装 Linux 时，它们与系统捆绑在一起，而我们常常不问为什么它们会在那里。一些基本的命令，如 [cd][2]、[kill][3] 和 echo，并不总是独立的应用程序，而是实际上内置于你的 shell 中。其他如 [ls][4]、[mv][5] 和 [cat][6] 是核心工具包（通常是 GNU `coreutils`）的一部分。但在开源的世界里，总是有一些替代品，其中最有趣的是 [BusyBox][7]。

### Linux 中的 BusyBox 简介

BusyBox 是一个开源（GPL）项目，提供近 400 个常用命令的简单实现，包括 `ls`、`mv`、`ln`、`mkdir`、`more`、`ps`、`gzip`、`bzip2`、`tar` 和 `grep`。它还包含了编程语言 `awk`、流编辑器 `sed`、文件系统检查工具 `fsck`、`rpm` 和 `dpkg` 软件包管理器，当然还有一个可以方便的访问所有这些命令的 shell（`sh`）。简而言之，它包含了所有 POSIX 系统需要的基本命令，以执行常见的系统维护任务以及许多用户和管理任务。

事实上，它甚至包含一个 `init` 命令，可以作为 PID 1 启动，以作为所有其它系统服务的父进程。换句话说，BusyBox 可以作为 [systemd][8]、OpenRC、sinit、init 和其他初始化系统的替代品。

BusyBox 非常小。作为一个可执行文件，它不到 1MB，所以它在 [嵌入式][9]、[边缘计算][10] 和 [物联网][11] 领域很受欢迎，因为这些场景的存储空间是很宝贵的。在容器和云计算的世界里，它作为精简的 Linux 容器镜像的基础镜像也很受欢迎。

### 极简主义

BusyBox 的部分魅力在于它的极简主义。它的所有命令都被编译到一个二进制文件里（`busybox`），它的手册只有 81 页（根据我对 `man` 送到 `pr` 管道的计算），但它涵盖了近 400 条命令。

作为一个例子的比较，这是 “原版” 的 `useradd —help` 的输出：

```
 -b, --base-dir BASE_DIR       base directory for home
 -c, --comment COMMENT         GECOS field of the new account
 -d, --home-dir HOME_DIR       home directory of the new account
 -D, --defaults                print or change the default config
 -e, --expiredate EXPIRE_DATE  expiration date of the new account
 -f, --inactive INACTIVE       password inactivity
 -g, --gid GROUP               name or ID of the primary group
 -G, --groups GROUPS           list of supplementary groups
 -h, --help                    display this help message and exit
 -k, --skel SKEL_DIR           alternative skeleton dir
 -K, --key KEY=VALUE           override /etc/login.defs
 -l, --no-log-init             do not add the user to the lastlog
 -m, --create-home             create the user's home directory
 -M, --no-create-home          do not create the user's home directory
 -N, --no-user-group           do not create a group with the user's name
 -o, --non-unique              allow users with non-unique UIDs
 -p, --password PASSWORD       encrypted password of the new account
 -r, --system                  create a system account
 -R, --root CHROOT_DIR         directory to chroot into
 -s, --shell SHELL             login shell of the new account
 -u, --uid UID                 user ID of the new account
 -U, --user-group              create a group with the same name as a user
```

而这是是同一命令的 BusyBox 版本：

```
 -h DIR    Home directory
 -g GECOS  GECOS field
 -s SHELL  Login shell
 -G GRP    Group
 -S            Create a system user
 -D            Don't assign a password
 -H            Don't create home directory
 -u UID    User id
 -k SKEL   Skeleton directory (/etc/skel)
```

这种差异是一种特性还是一种限制，取决于你是喜欢你的命令拥有 20 个选项还是 10 个选项。对于一些用户和某些用例来说，BusyBox 的极简主义刚刚满足所需。对于其他人来说，它是一个很好的最小化环境，可以作为一个后备工具，或者作为安装更强大的工具的基础，比如 [Bash][12]、[Zsh][13]、GNU [Awk][14] 等等。

### 安装 BusyBox

在 Linux 上，你可以使用你的软件包管理器安装 BusyBox。例如，在 Fedora 及类似发行版：

```
$ sudo dnf install busybox
```

在 Debian 及其衍生版：

```
$ sudo apt install busybox
```

在 MacOS 上，可以使用 [MacPorts][15] 或 [Homebrew][16]。在 Windows 上，可以使用 [Chocolatey][17]。

你可以将 BusyBox 设置为你的 shell，使用 `chsh —shell` 命令，然后再加上 BusyBox `sh` 应用程序的路径。我把 BusyBox 放在 `/lib64` 中，但它的位置取决于你的发行版的安装位置。

```
$ which busybox
/lib64/busybox/busybox
$ chsh --shell /lib64/busybox/sh
```

用 BusyBox 全盘替换所有常见的命令要复杂一些，因为大多数发行版都是“硬接线”，会在特定的软件包寻找特定的命令。换句话说，虽然技术上可以用 BusyBox 的 `init` 替换系统的 `init`，但你的软件包管理器可能会拒绝让你删除包含 `init` 的软件包，以免你担心删除会导致系统无法启动。有一些发行版是建立在 BusyBox 之上的，所以从新环境开始可能是体验 BusyBox 系统的最简单方法。

### 试试 BusyBox

你不必为了尝试 BusyBox 而将你的 shell 永久改为 BusyBox。你可以从你当前的 shell 中启动一个 BusyBox shell。

```
$ busybox sh
~ $
```

不过你的系统仍然有安装的非 BusyBox 版本的命令，所以要体验 BusyBox 的工具，你必须把命令作为参数发给 `busybox` 可执行文件：

```
~ $ busybox echo $0
sh
~ $ busybox ls --help
BusyBox vX.YY.Z (2021-08-25 07:31:48 NZST) multi-call binary.

Usage: ls [-1AaCxdLHRFplinshrSXvctu] [-w WIDTH] [FILE]...

List directory contents

 -1  One column output
 -a  Include entries that start with .
 -A  Like -a, but exclude . and ..
 -x  List by lines
[...]
```

为了获得“完整”的 BusyBox 体验，你可以为每个命令创建一个 `busybox` 的符号链接。这很容易，只要你使用 [for 循环][18] 就行：

```
$ mkdir bbx
$ for i in $(bbx --list); do \
    ln -s /path/to/busybox bbx/$i \
done
```

在你的 [路径][19] 的 _开头_ 添加这个符号链接目录，并启动 BusyBox：

```
$ PATH=$(pwd)/bbx:$PATH bbx/sh
```

### 用起来

BusyBox 是一个有趣的项目，也是一个可以实现 _极简_ 计算的例子。无论你是把 BusyBox 作为 [你唤醒的][21] [古老的计算机][20] 的轻量级环境，还是作为 [嵌入式设备][22] 的用户界面，抑或试用一个新的初始化系统，就算是为了好奇，让自己重新认识那些熟悉而又陌生的命令，都会很有意思。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/what-busybox

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/21/8/navigate-linux-directories
[3]: https://opensource.com/article/18/5/how-kill-process-stop-program-linux
[4]: https://opensource.com/article/19/7/master-ls-command
[5]: https://opensource.com/article/19/8/moving-files-linux-depth
[6]: https://opensource.com/article/19/2/getting-started-cat-command
[7]: https://www.busybox.net
[8]: https://opensource.com/article/20/4/systemd
[9]: https://opensource.com/article/21/3/rtos-embedded-development
[10]: https://opensource.com/article/17/9/what-edge-computing
[11]: https://opensource.com/article/21/3/iot-measure-raspberry-pi
[12]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[13]: https://opensource.com/article/19/9/getting-started-zsh
[14]: https://opensource.com/article/20/9/awk-ebook
[15]: https://opensource.com/article/20/11/macports
[16]: https://opensource.com/article/20/6/homebrew-mac
[17]: https://opensource.com/article/20/3/chocolatey
[18]: https://opensource.com/article/19/10/programming-bash-loops
[19]: https://opensource.com/article/17/6/set-path-linux
[20]: https://opensource.com/article/20/2/restore-old-computer-linux
[21]: https://opensource.com/article/19/7/how-make-old-computer-useful-again
[22]: https://opensource.com/article/20/6/open-source-rtos
