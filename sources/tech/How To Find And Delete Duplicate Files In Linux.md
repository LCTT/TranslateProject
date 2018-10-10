如何在 Linux 中寻找和删除重复的文件
=====

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Find-And-Delete-Duplicate-Files-720x340.png)

我经常备份配置文件 ，或者当硬盘文件中旧文件需要修改时我也会备份他们 。当我遇到错误时 ，我能够通过备份文件恢复修改的文件 。当我忘记清除这些备份文件 ，一段时间过去后 ，硬盘中总会被重复文件装满 。可能是我比较懒 ，也可能是我害怕会删除一些重要的文件 。如果你有和我一样的难题 ，并且在不同的文件夹下对于同一个文件有许多备份文件 ，在 Unix-Like 系统下 ，你能够用下面提到的工具来寻找和删除这些重复的文件 。

**警告**

请谨慎删除重复文件 。如果你鲁莽的删除重复文件 ，回导致你的 [**数据丢失事故**][1] 。我建议你在用这些工具时 ，需要给与额外的注意 。

### 在 Linux 中寻找和删除重复文件

为了引导的目的 ，我将讨论三个实用的工具 。

1. Rdfind ，
2. Fdupes ,
3. FSlint 

这三个实用工具是免费的 ，开源 ，能够运行在大多数的 Unix-like 操作系统 。

#### 1. Rdfind

**Rdfind** ，用来寻找冗余的数据 ，是一个免费并且开源的工具来寻找重复的文件通过文件夹和子文件夹 。它比较的文件的内容 ，而不是文件的名字 。Rdfind 用 **ranking** 算法来分类原始数据和重复文件 。如果你有两个或者多个相同的文件 ，Rdfind 足够智能来分辨哪个文件是最初的 ，其他的相同文件被认为是重复的文件 。一旦发现了重复的文件 ，Rdfind 回向你报告 ，你可以决定删除重复的文件或者将这些文件替换成[**软连接** 或者 **硬连接**][2]

**Installing Rdfind**

Rdfind 在 [**AUR**][3] 中是有效的 ，你能在 ARCH 系列系统上用 AUR 助手程序来安装它 ，如下所示 。

```
$ yay -S rdfind

```

在 Debain ，Ubuntu ，Linux Mint 上 ：

```
$ sudo apt-get install rdfind

```

在 Fedora 上 :

```
$ sudo dnf install rdfind

```

在 RHEL ，CentOS ：

```
$ sudo yum install epel-release
$ sudo yum install rdfind
```

**用法**

当安装完成后 ，简单的运行 Rdfind 命令来操作文件夹来搜索重复的文件 。

```
$ rdfind ~/Download
```

![](https://www.ostechnix.com/wp-content/uploads/2018/09/rdfind-1.png)

上面的截图中 ，Rdfind 命令将搜索 ~/Download 文件夹并且将结果保存为 **result.txt** ，保存路径为当前工作路径 。在 results.txt 文件中 ，你能够查看重复的文件 。

```
$ cat results.txt
# Automatically generated
# duptype id depth size device inode priority name
DUPTYPE_FIRST_OCCURRENCE 1469 8 9 2050 15864884 1 /home/sk/Downloads/tor-browser_en-US/Browser/TorBrowser/Tor/PluggableTransports/fte/tests/dfas/test5.regex
DUPTYPE_WITHIN_SAME_TREE -1469 8 9 2050 15864886 1 /home/sk/Downloads/tor-browser_en-US/Browser/TorBrowser/Tor/PluggableTransports/fte/tests/dfas/test6.regex
[...]
DUPTYPE_FIRST_OCCURRENCE 13 0 403635 2050 15740257 1 /home/sk/Downloads/Hyperledger(1).pdf
DUPTYPE_WITHIN_SAME_TREE -13 0 403635 2050 15741071 1 /home/sk/Downloads/Hyperledger.pdf
# end of file

```
在 results.txt 文件中你能够很容易的发现重复的文件 ，你能够删除你想删除的重复文件 。

同样 ，你能执行 **-dryrun** 操作指定的文件夹下来发现所有的重复文件而不改变任何事情 ，并在终端输出一个总结 ：

```
$ rdfind -dryrun true ~/Download

```

一旦你发现了重复文件 ，你能够用软链接或者硬链接来替换它们 。

用硬链接来替换重复文件 ：

```
$ rdfind -makehardlink true ~/Download
```

用符号链接或者软链接来替换重复文件 ：

```
$ rdfind -makesymlink true ~/Download
```

如果你的文件夹里面有空文件 ，而且你想忽略他们 。可以用 **-ignoreempty** 操作 ：

```
$ rdfind -ignoreempty true ~/Download

```

如果你不在想在留下这些老文件 ，删除这些重复文件而不是用软链接或者硬链接来替换他们 。

删除所有的重复文件 ：
```
$ rdfind -deleteduplicates true ~/Download

```

如果你不想忽略这些空文件而要删除这些重复文件 ：

```
$ rdfind -deleteduplicates true -ingoreempty false ~/Download

```

更多的 rdfind 信息 ，参考帮助部分 ：

```
$ rdfind --help

```

```
$ man rdfind

```

#### 2. Fdupes

**Fdupes** 是另一个命令行工具在指定文件夹和对应子文件夹中鉴别和删除重复文件 。它是免费由 C 语言编写的开源工具 。Fdupes 鉴别重复文件依靠文件大小 ，局部的 MD5 特征 ，全局 MD5 特征 ，最后用逐个字节比较来确认重复文件 。

和 Rdfind 工具相同 ，Fdupes 只有很少的设置来执行操作 ，例如 :

    * 递归的在文件夹及其子文件夹下寻找重复文件 
    * 排除掉指定的空文件和隐藏文件 
    * 显示重复文件的大小
    * 当遇见重复文件 ，立即删除它们 
    * 不同的所有者 ，组 ，或不同的权限被认为是不同的文件 。
    * 还有更多的

**安装 Fdupes**

在大多数的 Linux 发行版中的默认仓库中都是有效的 。

在 Arch Linux 和 他的变异版本 ，例如 Antergos ，Manjaro Linux 。用 Pcmman 来安装 ，如下 ：

```
$ sudo pacman -S fdupes

```

在 Debain ，Ubuntu ，Linux Mint 上 ：

```
$ sudo apt-get install fdupes

```

在 Fedora 上 ：

```
$ duso dnf install fdupes

```

在 RHEL ，CentOS 上 ：

```
$ sudo yum install fdupes

```

**用法**

Fdupes 的用法十分简单 ，只要运行下面的命令在指定的文件夹下 （ ~/Download ） 来找出重复文件 。

```
$fdupes ~/Download

```

在我的系统上的简单输出 ：

```
/home/sk/Downloads/Hyperledger.pdf
/home/sk/Downloads/Hyperledger(1).pdf

```

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-and-delete-duplicate-files-in-linux/
作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[singledo][6]
校对：[校对者ID](校对)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/prevent-files-folders-accidental-deletion-modification-linux/
[2]: https://www.ostechnix.com/explaining-soft-link-and-hard-link-in-linux-with-examples/
[3]: https://aur.archlinux.org/packages/rdfind/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: https://aur.archlinux.org/packages/fslint/
[6]: https://github.com/singledo/TranslateProject-1.git