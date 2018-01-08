迁移到 Linux：磁盘、文件、和文件系统
============================================================

![Migrating to LInux ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/butterflies-807551_1920.jpg?itok=pxTxwvFO "Migrating to LInux ")

> 在你的主要桌面计算机上安装和使用 Linux 将帮你快速熟悉你需要的工具和方法。

这是我们的迁移到 Linux 系列文章的第二篇。如果你错过了第一篇，[你可以在这里找到它][4]。就如之前提到过的，为什么要迁移到 Linux 的有几个原因。你可以在你的工作中为 Linux 开发和使用代码，或者，你可能只是想去尝试一下新事物。

不论是什么原因，在你主要使用的桌面计算机上拥有一个 Linux，将帮助你快速熟悉你需要的工具和方法。在这篇文章中，我将介绍 Linux 的文件、文件系统和磁盘。

### 我的 C:\ 在哪里？

如果你是一个 Mac 用户，Linux 对你来说应该非常熟悉，Mac 使用的文件、文件系统、和磁盘与 Linux 是非常接近的。另一方面，如果你的使用经验主要是 Windows，访问 Linux 下的磁盘可能看上去有点困惑。一般，Windows 给每个磁盘分配一个盘符（像 C:\）。而 Linux 并不是这样。而在你的 Linux 系统中它是一个单一的文件和目录的层次结构。

让我们看一个示例。假设你的计算机使用了一个主硬盘、一个有 `Books` 和 `Videos` 目录的 CD-ROM 、和一个有 `Transfer` 目录的 U 盘，在你的 WIndows 下，你应该看到的是下面的样子：

```
C:\  [硬盘]
├ System
├ System32
├ Program Files
├ Program Files (x86)
└ <更多目录>

D:\ [CD-ROM]
├ Books
└ Videos

E:\ [U 盘]
└ Transfer
```

而一个典型的 Linux 系统却是这样：

```
/ (最顶级的目录，称为根目录) [硬盘]
├ bin
├ etc
├ lib
├ sbin
├ usr
├ <更多目录>
└ media
   └ <你的用户名>
       ├ cdrom  [CD-ROM]
       │  ├ Books
       │  └ Videos
       └ Kingme_USB [U 盘]
           └ Transfer
```

如果你使用一个图形化环境，通常，Linux 中的文件管理器将出现看起来像驱动器的图标的 CD-ROM 和 USB 便携式驱动器，因此，你根本就无需知道介质所在的目录。

### 文件系统

Linux 称这些东西为文件系统。文件系统是在介质（比如，硬盘）上保持跟踪所有的文件和目录的一组结构。如果没有用于存储数据的文件系统，我们所有的信息就会混乱，我们就不知道哪个块属于哪个文件。你可能听到过一些类似 ext4、XFS 和 Btrfs 之类的名字，这些都是 Linux 文件系统。

每种保存有文件和目录的介质都有一个文件系统在上面。不同的介质类型可能使用了为它优化过的特定的文件系统。比如，CD-ROM 使用 ISO9660 或者 UDF 文件系统类型。USB 便携式驱动器一般使用 FAT32，以便于它们可以很容易去与其它计算机系统共享。

Windows 也使用文件系统。不过，我们不会过多的讨论它。例如，当你插入一个 CD-ROM，Windows 将读取 ISO9660 文件系统结构，分配一个盘符给它，然后，在盘符（比如，D:\）下显示文件和目录。当然，如果你深究细节，从技术角度说，Windows 是分配一个盘符给一个文件系统，而不是整个驱动器。

使用同样的例子，Linux 也读取 ISO9660 文件系统结构，但它不分配盘符，它附加文件系统到一个目录（这个过程被称为<ruby>挂载<rt>mount</rt></ruby>）。Linux 将随后在所挂载的目录（比如是， `/media/<your user name>/cdrom` ）下显示 CD-ROM 上的文件和目录。

因此，在 Linux 上回答 “我的 C:\ 在哪里？” 这个问题，答案是，这里没有 C:\，它们工作方式不一样。

### 文件

Windows 将文件和目录（也被称为文件夹）存储在它的文件系统中。但是，Linux 也让你将其它的东西放到文件系统中。这些其它类型的东西是文件系统的原生的对象，并且，它们和普通文件实际上是不同的。除普通文件和目录之外，Linux 还允许你去创建和使用<ruby>硬链接<rt>hard link</rt></ruby>、<ruby>符号链接<rt>symbolic link</rt></ruby>、<ruby>命名管道<rt>named pipe</rt></ruby>、<ruby>设备节点<rt>device node</rt></ruby>、和<ruby>套接字<rt>socket</rt></ruby>。在这里，我们不展开讨论所有的文件系统对象的类型，但是，这里有几种经常使用到的需要知道。

硬链接用于为文件创建一个或者多个别名。指向磁盘上同样内容的每个别名的名字是不同的。如果在一个文件名下编辑文件，这个改变也同时出现在其它的文件名上。例如，你有一个 `MyResume_2017.doc`，它还有一个被称为 `JaneDoeResume.doc` 的硬链接。（注意，硬链接是从命令行下，使用 `ln` 的命令去创建的）。你可以找到并编辑 `MyResume_2017.doc`，然后，然后找到 `JaneDoeResume.doc`，你发现它保持了跟踪 —— 它包含了你所有的更新。

符号链接有点像 Windows 中的快捷方式。文件系统的入口包含一个到其它文件或者目录的路径。在很多方面，它们的工作方式和硬链接很相似，它们可以创建一个到其它文件的别名。但是，符号链接也可以像文件一样给目录创建一个别名，并且，符号链接可以指向到不同介质上的不同文件系统，而硬链接做不到这些。（注意，你可以使用带 `-s` 选项的 `ln` 命令去创建一个符号链接）

### 权限

 Windows 和 Linux  另一个很大的区别是涉及到文件系统对象（文件、目录、及其它）的权限。Windows 在文件和目录上实现了一套非常复杂的权限。例如，用户和用户组可以有权限去读取、写入、运行、修改等等。用户和用户组可以授权访问除例外以外的目录中的所有内容，也可以不允许访问除例外的目录中的所有内容。

然而，大多数使用 Windows 的人并不会去使用特定的权限；因此，当他们发现在 Linux 上是强制使用一套默认权限时，他们感到非常惊讶！Linux 通过使用 SELinux 或者 AppArmor 可以强制执行一套更复杂的权限。但是，大多数 Linux 安装版都只是使用了内置的默认权限。

在默认的权限中，文件系统中的每个条目都有一套为它的文件所有者、文件所在的组、和其它人的设置的权限。这些权限允许他们：读取、写入和运行。给它们的权限是有层次继承的。首先，它检查这个（登入的）用户是否为该文件所有者和拥有的权限。如果不是，然后检查这个用户是否在文件所在的组中和该组拥有的权限。如果不是，然后它再检查其它人拥有的权限。这里设置了其它人的权限。但是，这里设置的三套权限大多数情况下都会使用其中的一套。

如果你使用命令行，你输入 `ls -l`，你可以看到如下所表示的权限：

```
rwxrw-r-- 1 stan dndgrp 25 Oct 33rd 25:01 rolldice.sh
```

最前面的字母，`rwxrw-r--`，展示了权限。在这个例子中，所有者（stan）可以读取、写入和运行这个文件（前面的三个字母，`rwx`）；dndgrp 组的成员可以读取和写入这个文件，但是不能运行（第二组的三个字母，`rw-`）；其它人仅可以读取这个文件（最后的三个字母，`r--`）。

（注意，在 Windows 中去生成一个可运行的脚本，你生成的文件要有一个特定的扩展名，比如 `.bat`，而在 Linux 中，扩展名在操作系统中没有任何意义。而是需要去设置这个文件可运行的权限）

如果你收到一个 “permission denied” 错误，可能是你去尝试运行了一个要求管理员权限的程序或者命令，或者你去尝试访问一个你的帐户没有访问权限的文件。如果你尝试去做一些要求管理员权限的事，你必须切换登入到一个被称为 `root` 的用户帐户。或者通过在命令行使用一个被称为 `sudo` 的辅助程序。它可以临时允许你以 `root` 权限运行。当然，`sudo` 工具，也会要求你输入密码，以确保你真的有权限。

### 硬盘文件系统

Windows 主要使用一个被称为 NTFS 的硬盘文件系统。在 Linux 上，你也可以选一个你希望去使用的硬盘文件系统。不同的文件系统类型呈现不同的特性和不同的性能特征。现在主流的原生 Linux 的文件系统是 Ext4。但是，在安装 Linux 的时候，你也有丰富的文件系统类型可供选择，比如，Ext3（Ext4 的前任）、XFS、Btrfs、UBIFS（用于嵌入式系统）等等。如果你不确定要使用哪一个，Ext4 是一个很好的选择。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2017/11/migrating-linux-disks-files-and-filesystems

作者：[JOHN BONESIO][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[3]:https://www.linux.com/files/images/butterflies-8075511920jpg
[4]:https://linux.cn/article-9212-1.html
