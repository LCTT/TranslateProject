Trash-Cli：Linux 上的命令行回收站工具
======

相信每个人都对<ruby>回收站<rt>trashcan</rt></ruby>很熟悉，因为无论是对 Linux 用户，还是 Windows 用户，或者 Mac 用户来说，它都很常见。当你删除一个文件或目录的时候，该文件或目录会被移动到回收站中。

需要注意的是，当把文件移动到回收站以后，文件系统空间并没有被释放，除非把回收站清空。

如果不想永久删除文件的话（清空回收站），可以利用回收站临时存储被删除了的文件，从而在必要的时候能够帮助我们恢复删除了的文件。

但是，如果在命令行使用 `rm` 命令进行删除操作，那么你是不可能在回收站中找到任何被删除了的文件或目录的。所以，在执行 `rm` 命令前请一定要三思。如果你犯了错误（执行了 `rm` 命令），那么文件就被永久删除了，无法再恢复回来，因为存储在磁盘上的元数据已经不在了。

根据 [freedesktop.org 规范][1]，<ruby>垃圾<rt>trash</rt></ruby>是由桌面管理器比如 GNOME、KDE 和 XFCE 等提供的一个特性。当通过文件管理器删除一个文件或目录的时候，该文件或目录将会成为<ruby>垃圾<rt>trash</rt></ruby>，然后被移动到回收站中，回收站对应的目录是 `$HOME/.local/share/Trash` 。

回收站目录包含两个子目录：`files` 和 `info` 。`files` 目录存储实际被删除了的文件和目录，`info` 目录包含被删除了的文件和目录的信息，比如文件路径、删除日期和时间，每个文件单独存储。

你可能会问，既然已经有了<ruby>图形用户界面<rt>GUI</rt></ruby>的回收站，为什么还需要命令行工具呢？因为对于大多数使用 *NIX 系统的家伙（包括我）来说，即使使用的是基于图形用户界面的系统，也更喜欢使用命令行而不是图形用户界面。所以，如果有人在寻找一个命令行回收站工具，那么这儿有一个不错的选择。

### Trash-Cli 是什么

[trash-cli][2] 是一个命令行回收站工具，并且符合 FreeDesktop.org 的<ruby>垃圾<rt>trash</rt></ruby>规范。它能够存储每一个垃圾文件的名字、原始路径、删除日期和权限。

### 如何在 Linux 上安装 Trash-Cli

绝大多数的 Linux 发行版官方仓库都提供了 Trash-Cli 的安装包，所以你可以运行下面这些命令来安装。

对于 Debian/Ubuntu 用户，使用 [apt-get][3] 或 [apt][4] 命令来安装 Trash-Cli：

```
$ sudo apt install trash-cli
```

对于 RHEL/CentOS 用户，使用 [yum][5] 命令来安装 Trash-Cli：

```
$ sudo yum install trash-cli
```

对于 Fedora 用户，使用 [dnf][6] 命令来安装 Trash-Cli： 

```
$ sudo dnf install trash-cli
```

对于 Arch Linux 用户，使用 [pacman][7] 命令来安装 Trash-Cli：

```
$ sudo pacman -S trash-cli
```

对于 openSUSE 用户，使用 [zypper][8] 命令来安装 Trash-Cli：

```
$ sudo zypper in trash-cli
```

如果你的发行版中没有提供 Trash-Cli 的安装包，那么你也可以使用 `pip` 来安装。为了能够安装 python 包，你的系统中应该会有 `pip` 包管理器。

```
$ sudo pip install trash-cli
Collecting trash-cli
 Downloading trash-cli-0.17.1.14.tar.gz
Installing collected packages: trash-cli
 Running setup.py bdist_wheel for trash-cli ... done
Successfully installed trash-cli-0.17.1.14
```

### 如何使用 Trash-Cli

Trash-Cli 的使用不难，因为它提供了一个很简单的语法。Trash-Cli 提供了下面这些命令：

  * `trash-put`： 删除文件和目录（仅放入回收站中）
  * `trash-list` ：列出被删除了的文件和目录
  * `trash-restore`：从回收站中恢复文件或目录 trash.
  * `trash-rm`：删除回收站中的文件
  * `trash-empty`：清空回收站

下面，让我们通过一些例子来试验一下。

1) 删除文件和目录：在这个例子中，我们通过运行下面这个命令，将 `2g.txt` 这一文件和 `magi` 这一文件夹移动到回收站中。

```
$ trash-put 2g.txt magi
```

和你在文件管理器中看到的一样。

2) 列出被删除了的文件和目录：为了查看被删除了的文件和目录，你需要运行下面这个命令。之后，你可以在输出中看到被删除文件和目录的详细信息，比如名字、删除日期和时间，以及文件路径。

```
$ trash-list
2017-10-01 01:40:50 /home/magi/magi/2g.txt
2017-10-01 01:40:50 /home/magi/magi/magi
```

3) 从回收站中恢复文件或目录：任何时候，你都可以通过运行下面这个命令来恢复文件和目录。它将会询问你来选择你想要恢复的文件或目录。在这个例子中，我打算恢复 `2g.txt` 文件，所以我的选择是 `0` 。

```
$ trash-restore
 0 2017-10-01 01:40:50 /home/magi/magi/2g.txt
 1 2017-10-01 01:40:50 /home/magi/magi/magi
What file to restore [0..1]: 0
```

4) 从回收站中删除文件：如果你想删除回收站中的特定文件，那么可以运行下面这个命令。在这个例子中，我将删除 `magi` 目录。

```
$ trash-rm magi
```

5)清空回收站：如果你想删除回收站中的所有文件和目录，可以运行下面这个命令。

```
$ trash-empty
```

6)删除超过 X 天的垃圾文件：或者，你可以通过运行下面这个命令来删除回收站中超过 X 天的文件。在这个例子中，我将删除回收站中超过 `10` 天的项目。

```
$ trash-empty 10
```

Trash-Cli 可以工作的很好，但是如果你想尝试它的一些替代品，那么你也可以试一试 [gvfs-trash][9] 和 [autotrash][10] 。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/trash-cli-command-line-trashcan-linux-system/

作者：[2daygeek][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://freedesktop.org/wiki/Specifications/trash-spec/
[2]:https://github.com/andreafrancia/trash-cli
[3]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[8]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]:http://manpages.ubuntu.com/manpages/trusty/man1/gvfs-trash.1.html
[10]:https://github.com/bneijt/autotrash
