如何从 Linux 命令行安装软件
======
> 学习一种不同的包管理器和怎么使用它。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/suitcase_container_bag.png?itok=q40lKCBY)

如果你在一直在使用 Linux，你很快就会发现做同样的事情有很多不同的方法。这包括通过命令行在 Linux 上安装应用。我已经是大约 25 年的 Linux 用户，我一次又一次地回到命令行来安装我的应用。

从命令行安装应用程序最常用的方法是使用称为包管理器通过软件库（存储软件的地方）安装。所有 Linux 应用都作为软件包分发，这些软件包只不过是与软件包管理系统相关的文件。每个 Linux 发行版都附带一个包管理系统，但它们并不完全相同。

### 什么是包管理系统？

包管理系统由一组工具和文件格式组成，它们一起用于安装、更新和卸载 Linux 应用。两种最常见的包管理系统来自 Red Hat 和 Debian。 Red Hat、CentOS 和 Fedora 都使用 `rpm` 系统（.rpm 文件），而 Debian、Ubuntu、Mint 和 Ubuntu 都使用 `dpkg`（.deb 文件）。Gentoo Linux 使用名为 Portage 的系统，Arch Linux 只使用 tarball（.tar 文件）。这些系统之间的主要区别在于它们如何安装和维护应用。

你可能想知道 `.rpm`、`.deb` 或 `.tar` 文件中的内容。你可能会惊讶地发现，所有这些都只是普通的老式归档文件（如 `.zip`），其中包含应用的代码，如何安装它的说明，依赖项（它可能依赖的其他应用），以及配置文件的位置。读取和执行所有这些指令的软件称为包管理器。

### Debian、Ubuntu、Mint 等

Debian、Ubuntu、Mint 和其它基于 Debian 的发行版都使用 `.deb` 文件和 `dpkg` 包管理系统。有两种方法可以通过此系统安装应用。你可以使用 `apt` 程序从仓库进行安装，也可以使用 `dpkg` 程序从 `.deb` 文件安装应用。我们来看看如何做到这两点。

使用 `apt` 安装应用非常简单：

```
$ sudo apt install app_name
```

通过 `apt` 卸载应用也非常简单：

```
$ sudo apt remove app_name
```

要升级已安装的应用，首先需要更新应用仓库：

```
$ sudo apt update
```

完成后，你可以使用以下命令更新任何程序：

```
$ sudo apt upgrade
```

如果你只想更新一个应用，该怎么办？没问题。

```
$ sudo apt update app_name
```

最后，假设你要安装的应用不存在于 Debian 仓库中，但有 `.deb` 下载。

```
$ sudo dpkg -i app_name.deb
```

###  Red Hat、CentOS 和 Fedora

默认情况下，Red Hat 使用多个包管理系统。这些系统在使用自己的命令时，互相仍然非常相似，而且与 Debian 中使用的也相似。例如，我们可以使用 `yum` 或 `dnf` 管理器来安装应用。

```
$ sudo yum install app_name
$ sudo dnf install app_name
```

`.rpm` 格式的应用也可以使用 `rpm` 命令安装。

```
$ sudo rpm -i app_name.rpm
```

删除不需要的应用同样容易。

```
$ sudo yum remove app_name
$ sudo dnf remove app_name
```

更新应用同样容易。

```
$ yum update
$ sudo dnf upgrade --refresh
```

如你所见，从命令行安装、卸载和更新 Linux 应用并不难。事实上，一旦你习惯它，你会发现它比使用基于桌面 GUI 的管理工具更快！

有关从命令行安装应用程序的更多信息，请访问 Debian [Apt wiki][1]、[Yum 速查表][2] 和 [DNF wiki][3]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/how-install-software-linux-command-line

作者：[Patrick H.Mullins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pmullins
[1]:https://wiki.debian.org/Apt
[2]:https://access.redhat.com/articles/yum-cheat-sheet
[3]:https://fedoraproject.org/wiki/DNF?rd=Dnf
