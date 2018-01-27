如何在执行一个命令或程序之前就了解它会做什么
======

有没有想过在执行一个 Unix 命令前就知道它干些什么呢？并不是每个人都会知道一个特定的命令或者程序将会做什么。当然，你可以用 [Explainshell][2] 来查看它。你可以在 Explainshell 网站中粘贴你的命令，然后它可以让你了解命令的每个部分做了什么。但是，这是没有必要的。现在，我们从终端就可以轻易地在执行一个命令或者程序前就知道它会做什么。 `maybe` ，一个简单的工具，它允许你运行一条命令并可以查看此命令对你的文件做了什么，而实际上这条命令却并未执行！在查看 `maybe` 的输出列表后，你可以决定是否真的想要运行这条命令。

![](https://www.ostechnix.com/wp-content/uploads/2017/12/maybe-2-720x340.png)

### `maybe` 是如何工作的

根据开发者的介绍：

> `maybe` 利用 `python-ptrace` 库在 `ptrace` 控制下运行了一个进程。当它截取到一个即将更改文件系统的系统调用时，它会记录该调用，然后修改 CPU 寄存器，将这个调用重定向到一个无效的系统调用 ID（效果上将其变成一个无效操作（no-op）），并将这个无效操作（no-op）的返回值设置为有效操作的返回值。结果，这个进程认为，它所做的一切都发生了，实际上什么都没有改变。

警告：在生产环境或者任何你所关心的系统里面使用这个工具时都应该小心。它仍然可能造成严重的损失，因为它只能阻止少数系统调用。

#### 安装 `maybe`

确保你已经在你的 Linux 系统中已经安装了 `pip` 。如果没有，可以根据您使用的发行版，按照如下指示进行安装。

在  Arch Linux  及其衍生产品（如 Antergos、Manjaro Linux）上，使用以下命令安装 `pip` ：

```
sudo pacman -S python-pip
```

在  RHEL，CentOS 上：

```
sudo yum install epel-release
sudo yum install python-pip
```

在  Fedora 上：

```
sudo dnf install epel-release
sudo dnf install python-pip
```

在  Debian，Ubuntu，Linux Mint 上：

```
sudo apt-get install python-pip
```

在 SUSE、 openSUSE 上：

```
sudo zypper install python-pip
```

安装 `pip` 后，运行以下命令安装 `maybe` ：

```
sudo pip install maybe
```

### 了解一个命令或程序在执行前会做什么

用法是非常简单的！只要在要执行的命令前加上 `maybe` 即可。

让我给你看一个例子：

```
$ maybe rm -r ostechnix/
```

如你所看到的，我从我的系统中删除一个名为 `ostechnix` 的文件夹。下面是示例输出：

```
maybe has prevented rm -r ostechnix/ from performing 5 file system operations:

 delete /home/sk/inboxer-0.4.0-x86_64.AppImage
 delete /home/sk/Docker.pdf
 delete /home/sk/Idhayathai Oru Nodi.mp3
 delete /home/sk/dThmLbB334_1398236878432.jpg
 delete /home/sk/ostechnix

Do you want to rerun rm -r ostechnix/ and permit these operations? [y/N] y
```

 [![](http://www.ostechnix.com/wp-content/uploads/2017/12/maybe-1.png)][3] 

 `maybe` 执行了 5 个文件系统操作，并向我显示该命令（`rm -r ostechnix/`）究竟会做什么。现在我可以决定是否应该执行这个操作。是不是很酷呢？确实很酷！

这是另一个例子。我要为 Gmail 安装 Inboxer 桌面客户端。这是我得到的输出：

```
$ maybe ./inboxer-0.4.0-x86_64.AppImage 
fuse: bad mount point `/tmp/.mount_inboxemDzuGV': No such file or directory
squashfuse 0.1.100 (c) 2012 Dave Vasilevsky

Usage: /home/sk/Downloads/inboxer-0.4.0-x86_64.AppImage [options] ARCHIVE MOUNTPOINT

FUSE options:
 -d -o debug enable debug output (implies -f)
 -f foreground operation
 -s disable multi-threaded operation

open dir error: No such file or directory
maybe has prevented ./inboxer-0.4.0-x86_64.AppImage from performing 1 file system operations:

create directory /tmp/.mount_inboxemDzuGV

Do you want to rerun ./inboxer-0.4.0-x86_64.AppImage and permit these operations? [y/N]
```

如果它没有检测到任何文件系统操作，那么它会只显示如下所示的结果。

例如，我运行下面这条命令来更新我的 Arch Linux。

```
$ maybe sudo pacman -Syu
sudo: effective uid is not 0, is /usr/bin/sudo on a file system with the 'nosuid' option set or an NFS file system without root privileges?
maybe has not detected any file system operations from sudo pacman -Syu.
```

看到没？它没有检测到任何文件系统操作，所以没有任何警告。这非常棒，而且正是我所预料到的结果。从现在开始，我甚至可以在执行之前知道一个命令或一个程序将执行什么操作。我希望这对你也会有帮助。

Cheers!

资源：

*   [`maybe` GitHub 主页][1]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/know-command-program-will-exactly-executing/

作者：[SK][a]
译者：[imquanquan](https://github.com/imquanquan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/p-e-w/maybe
[2]:https://www.ostechnix.com/explainshell-find-part-linux-command/
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/maybe-1.png
[4]:https://www.ostechnix.com/inboxer-unofficial-google-inbox-desktop-client/
