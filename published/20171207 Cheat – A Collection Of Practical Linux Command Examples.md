Cheat ： 一个实用 Linux 命令示例集合
======

我们中的许多人经常查看 [ man 页面][1] 来了解命令开关（选项），它会显示有关命令语法、说明、细节和可用的选项，但它没有任何实际的例子。因此，在组合成一个我们需要的完整命令时会遇到一些麻烦。

你确实遇到这个麻烦而想要一个更好的解决方案吗？我会建议你试一下 `cheat`。

### Cheat 是什么

[cheat][2] 允许你在命令行中创建和查看交互式的<ruby>速查表<rt>cheatsheet</rt></ruby>。它旨在帮助提醒 *nix 系统管理员他们经常使用但还没频繁到会记住的命令的选项。

### 如何安装 Cheat

`cheat` 是使用 python 开发的，所以可以用 `pip` 来在你的系统上安装 `cheat`。

`pip` 是一个与 `setuptools` 捆绑在一起的 Python 模块，它是在 Linux 中安装 Python 包推荐的工具之一。

对于 Debian/Ubuntu 用户，请使用 [apt-get 命令][3]或[apt 命令][4]来安装 `pip`。

```
[对于 Python2]
$ sudo apt install python-pip python-setuptools
[对于 Python3]
$ sudo apt install python3-pip
```

RHEL/CentOS 官方仓库中没有 pip，因此使用 [EPEL 仓库][5]，并使用 [YUM 命令][6]安装 `pip`。

```
$ sudo yum install python-pip python-devel python-setuptools
```

对于 Fedora 系统，使用 [dnf 命令][7]来安装 `pip`。

```
[对于 Python2]
$ sudo dnf install python-pip
[对于 Python3]
$ sudo dnf install python3
```

对于基于 Arch Linux 的系统，请使用 [Pacman 命令][8] 来安装 `pip`。

```
[对于 Python2]
$ sudo pacman -S python2-pip python-setuptools
[对于 Python3]
$ sudo pacman -S python-pip python3-setuptools
```

对于 openSUSE 系统，使用 [Zypper 命令][9]来安装 `pip`。

```
[对于 Python2]
$ sudo pacman -S python-pip
[对于 Python3]
$ sudo pacman -S python3-pip
```

用 `pip` 来在你的系统上安装 `cheat`。

```
$ sudo pip install cheat
```

### 如何使用 Cheat

运行 `cheat`，然后按相应的`命令`来查看速查表，作为例子，我们要来看下 `tar` 命令的例子。

```
$ cheat tar
# To extract an uncompressed archive:
tar -xvf /path/to/foo.tar

# To create an uncompressed archive:
tar -cvf /path/to/foo.tar /path/to/foo/

# To extract a .gz archive:
tar -xzvf /path/to/foo.tgz

# To create a .gz archive:
tar -czvf /path/to/foo.tgz /path/to/foo/

# To list the content of an .gz archive:
tar -ztvf /path/to/foo.tgz

# To extract a .bz2 archive:
tar -xjvf /path/to/foo.tgz

# To create a .bz2 archive:
tar -cjvf /path/to/foo.tgz /path/to/foo/

# To extract a .tar in specified Directory:
tar -xvf /path/to/foo.tar -C /path/to/destination/

# To list the content of an .bz2 archive:
tar -jtvf /path/to/foo.tgz

# To create a .gz archive and exclude all jpg,gif,... from the tgz
tar czvf /path/to/foo.tgz --exclude=\*.{jpg,gif,png,wmv,flv,tar.gz,zip} /path/to/foo/

# To use parallel (multi-threaded) implementation of compression algorithms:
tar -z ... -> tar -Ipigz ...
tar -j ... -> tar -Ipbzip2 ...
tar -J ... -> tar -Ipixz ...

```

运行下面的命令查看可用的速查表。

```
$ cheat -l
```

进入帮助页面获取更多详细信息。

```
$ cheat -h
```


--------------------------------------------------------------------------------

via: https://www.2daygeek.com/cheat-a-collection-of-practical-linux-command-examples/

作者：[Magesh Maruthamuthu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com
[1]:https://www.2daygeek.com/linux-color-man-pages-configuration-less-most-command/
[2]:https://github.com/chrisallenlane/cheat
[3]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
