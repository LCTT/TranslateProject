如何在 Linux 中安装 Ncurses 库
======
![](https://www.ostechnix.com/wp-content/uploads/2018/05/install-ncurses-720x340.png)

**GNU Ncurses** 是一个允许用户编写基于文本的用户界面（TUI）的编程库。许多基于文本的游戏都是使用这个库创建的。一个受欢迎的例子是 [**PacVim**][1]，这是一款学习 VIM 命令的 CLI 游戏。在这篇简要的指南中，我将解释如何在类 Unix 操作系统中安装 Ncurses 库。

### 在 Linux 中安装 Ncurses 库

Ncurses 在大多数 Linux 发行版的默认仓库中都有。例如，你可以使用以下命令将其安装在基于 Arch 的系统上：
```
$ sudo pacman -S ncurses

```

在RHEL、CentOS 上：
```
$ sudo yum install ncurses-devel

```

在 Fedora 22 和更新版本上：
```
$ sudo dnf install ncurses-devel

```

在 Debian、Ubuntu、Linux Mint 上：
```
$ sudo apt-get install libncurses5-dev libncursesw5-dev

```

默认仓库中的 GNU ncureses 可能有点老了。如果你想要最新的稳定版本，可以从源代码进行编译和安装，如下所示。

从[**这里**][2]下载最新的 ncurses 版本。在写这篇文章时，最新版本是 6.1。
```
$ wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz

```

解压 tar 文件：
```
$ tar xzf ncurses-6.1.tar.gz

```

这将在当前目录中创建一个名为 ncurses-6.1 的文件夹。cd 到该目录：
```
$ cd ncurses-6.1

$ ./configure --prefix=/opt/ncurses

```

最后，使用以下命令进行编译和安装：
```
$ make

$ sudo make install

```

使用命令验证安装：
```
$ ls -la /opt/ncurses

```

就是这样。Ncurses 已经安装在 Linux 发行版上。继续使用 Ncurses 创建漂亮的 TUI。

还会有更多的好东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-install-ncurses-library-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/pacvim-a-cli-game-to-learn-vim-commands/
[2]:https://ftp.gnu.org/pub/gnu/ncurses/
