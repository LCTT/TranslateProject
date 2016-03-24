Linux 下四种安全删除文件的工具
===============

任何一个普通水平的计算机用户都知道，从计算机系统中删除的任意数据都可以稍后通过一些努力恢复出来。当你不小心删除了你的重要数据时，这是一个不错的方案。但是大多数情况，你不希望你的隐私数据被轻易地恢复。不论何时，我们删除的任意文件，操作系统删除的仅仅是对特定数据的索引。这就意味着，数据仍然保存在磁盘的某块地方，这种方法是不安全的，任何一个聪明的计算机黑客可以使用各种不错的数据恢复工具来恢复你删除的数据。Linux 用户利用我们都知晓的 "rm" 命令来从他们的操作系统中删除数据，但是 "rm" 命令也是像上面说的那样删除文件。从这个命令删除的数据也可以使用特殊的文件恢复工具恢复。

让我们看看怎样安全并完整地从你的 Linux 系统中删除文件或者文件夹。以下提到的工具可以完全地删除数据，因此那些恢复工具很难找到真实数据的痕迹然后恢复它。

### Secure-Delete ###

Secure-Delete 是一组为 Linux 操作系统而生的工具集合，他们为永久删除文件提供了先进的技术支持。一旦 Secure-Delete 安装在各种 Linux 系统上，就提供了如下的四个命令：

- srm
- smem
- sfill
- sswap

在 ubuntu 的终端中运行如下命令安装此工具：

    sudo apt-get install secure-delete

![secure delete](http://blog.linoxide.com/wp-content/uploads/2015/03/secure-delete.png)

在 RHEL，Fedora 或者 Centos 中运行如下命令安装此工具：

     sudo yum install secure-delete

“**srm**” 命令的工作方式和 "rm" 命令类似，但是它不仅仅是删除文件，它首先使用一些随机的数据重写数次文件，然后彻底地删除此文件。这个命令的语法是相当地简单，仅仅指定要删除的文件或者目录，然后它会负责此任务。

    sudo srm  /home/aun/Documents/xueo/1.png

"**sfill**" 检测在指定的分区或者目录被标记为空闲或者可用的空间，然后使用它自身的算法用一些随机数据填充。因此它保证了在此分区没有可以恢复的文件或者文件夹。

    sudo sfill /home

"**sswap**" 命令用来安全地清除你的交换分区。交换分区用来存放运行程序的数据。首先我们需要运行如下命令来找到你的交换分区。

    cat /proc/swaps

如下是上述命令的输出示例：

    aun@eagle:~$ cat /proc/swaps
    Filename                Type        Size    Used    Priority
    /dev/sda5                               partition    2084860    71216    -1

从现在起，你可以看到你的交换分区设置在哪个分区，然后使用如下命令安全地清除。替换 "/dev/sda5" 部分为你的交换分区名字。

    sudo sswap /dev/sda5

“**smem**” 用来清理在内存中的内容，虽然当系统重启或者关机时会清理随机存取存储器（RAM）中的内容，但是内存中仍然会保留一些数据的残留痕迹。这个命令提供安全的内存清理，简单地在终端中运行 smem 命令即可。

    smem

### Shred ###

"shred" 命令以一种不可恢复的方式来销毁文件或者文件夹的内容。它使用随机生成的数据模式来持续覆写文件，因此很难恢复任意的被销毁的数据，即使是那些黑客或者窃贼使用高水平的数据恢复工具或者设备。Shred 默认安装在所有 Linux 发行版中，如果你想，你可以运行如下命令来找到它的安装目录：

    aun@eagle:~$  whereis shred

    shred: /usr/bin/shred /usr/share/man/man1/shred.1.gz

使用 shred 工具运行如下命令来删除文件：

    shred /home/aun/Documents/xueo/1.png

使用 shred 运行如下命令来删除任意的分区，用你期望的分区来替换分区名字。

    shred /dev/sda5

Shred 默认情况下使用随机内容重写数据 25 次。如果你想它重写文件更多次数，可以使用 "shred -n" 选项来简单地指定你所期望的次数。

    shred -n 100 filename

如果你想在重写后截断或者删除文件，使用 "shred -u" 选项：

    shred -u filename

### dd ###

这个命令起初是用于磁盘克隆的。它用于将一个分区或者一个磁盘复制到另一个分区或者磁盘。但是它还可用于安全地清除硬盘或者分区的内容。运行如下命令使用随机数据来重写你的当前数据。你不需要安装 dd 命令，所有的 Linux 分发版都已经包含了此命令。

    sudo dd if=/dev/random of=/dev/sda

你也可以覆写磁盘或者分区中的内容，只需要简单地将所有替换为 “zero”。

    sudo dd if=/dev/zero of=/dev/sda

### Wipe ###

Wipe 起初开发的目的是从磁性介质中安全地擦除文件。这个命令行工具使用特殊的模式来重复地写文件。它使用 fsync() 调用和/或 O_SYNC 位来强制访问磁盘，并且使用 Gutmann 算法来重复地写。你可以使用此命令删除单个文件、文件夹或者整个磁盘的内容，但是使用 wipe 命令来删除整个磁盘的模式会耗费大量的时间。另外，安装和使用这个工具相当容易。

在 ubuntu 的终端中运行如下命令来安装 wipe。

    sudo aptitude install wipe

![Wipe Linux](http://blog.linoxide.com/wp-content/uploads/2015/03/wipe.png)

使用如下命令在 Redhat Linux，Centos 或者 Fedora 中安装 Wipe：

    sudo yum install wipe

一旦安装完成，在终端中运行如下命令来获得完整的可用选项列表：

    man wipe

删除任意文件或者目录：

    wipe filename

运行如下命令来安全地移除 tmp 分区：

    wipe -r /tmp

使用如下的命令来删除完整分区的内容（替换分区名字为你所期望的分区）。

      wipe /dev/sda1

### 小结 ###

我们期望这篇文章对你有帮助，你的数据隐私是有决定性意义的，在你的系统中安装这些安全的删除工具对你来说非常重要，因此你可以删除你的隐私数据而不用担心它们被轻易地恢复。上面提到的所有工具都是相当轻量的，它们只需要耗费最低的系统资源来运行，并且无论如何也不会影响你的系统性能。享受它们带来的便利吧！

--------------------------------------------------------------------------------

via: http://linoxide.com/security/delete-files-permanatly-linux/

作者：[Aun Raza][a]
译者：[dbarobin](https://github.com/dbarobin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/