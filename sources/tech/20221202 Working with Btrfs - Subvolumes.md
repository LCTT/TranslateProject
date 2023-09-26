[#]: subject: "Working with Btrfs – Subvolumes"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-subvolumes/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "A2ureStone"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Btrfs 详解：子卷
======

![][1]

Photo by [Heliberto Arias][2] on [Unsplash][3]

这篇文章是《Btrfs 详解》系列文章中的一篇。从 Fedora Linux 33 开始，Btrfs 就是 Fedora Workstation 和 Fedora Silverblue 的默认文件系统。

以防你忘记，这是系列文章中的前一篇： <https://fedoramagazine.org/working-with-btrfs-general-concepts/>

### 简介

子卷允许将一个 Btrfs 文件系统划分成多个子文件系统。这意味着你可以从 Btrfs 文件系统挂载子卷，就好像他们是独立的文件系统。除此之外，例如，你还可以通过 qgroups（我们将在系列的另一篇文章里介绍）定义子卷能够占据的最大空间，或者用子卷去包含或排除快照中的文件（我们会后面的文章中会讲到）。自 Fedora Linux 33 后每个 Fedora Workstation 和 Fedora Silverblue 默认安装过程中会利用子卷。在这篇文章中我们会介绍它是如何工作的。

下面你会找到很多关于子卷的例子。如果你想跟着操作，你必须拥有访问某些 Btrfs 文件系统的权限和 root 权限。你可以通过下面命令来验证你的 _/home/_ 目录是否是 Btrfs 。

```

    $ findmnt -no FSTYPE /home
    btrfs

```

这个命令会输出你 _/home/_ 目录的文件系统名。如果它是 _btrfs_，那就可以了。让我们创建一个新的目录去做实验：

```

    $ mkdir ~/btrfs-subvolume-test
    $ cd ~/btrfs-subvolume-test

```

在下面的内容，跟上面一样你会看到很多命令输出在框框里。请留意。这使认清为了可读性被分散在多行的一行变困难。
如果你有疑惑，尝试缩放你的浏览器窗口，观察文本的变化。
在下面的文本中，你会看到很多像上面显示的那样的命令输出框。请在阅读/比较命令输出时请记住，**框中的内容在行末会被换行**。这使得识别跨多行的长行变得困难，降低了可读性。如果有疑问，试着调整浏览器窗口的大小，看看文本的变化!

### 创建和使用子卷

我们可以通过以下命令创建一个 Btrfs 子卷：

```

    $ sudo btrfs subvolume create first
    Create subvolume './first'

```

当我们检查当前目录，我们可以看到现在有一个名为 _first_ 的新目录。注意到下面输出的第一个字符 _d_：

```

    $ ls -l
    total 0
    drwxr-xr-x. 1 root root 0 Oct 15 18:09 first

```

我们可以像常规目录一样操作它：我们可以重命名它，移动它，在里面创建新文件和目录，等等。注意到目录属于 root，所以我们必须以 root 身份去做这些事情。

如果它表现和看起来就像个目录，那我们如何知道这是不是一个 Btrfs 子卷呢？我们可以使用 _btrfs_ 工具去列出所有子卷：

```

    $ sudo btrfs subvolume list .
    ID 256 gen 30 top level 5 path home
    ID 257 gen 30 top level 5 path root
    ID 258 gen 25 top level 257 path root/var/lib/machines
    ID 259 gen 29 top level 256 path hartan/btrfs-subvolume-test/first

```

如果你是在最近未修改的 Fedora Linux 安装环境中，你很大概率会看到和上面一样的输出。我们会在之后检查 _home_ 和 _root_ ，还有全部数字的含义。暂时来说，我们看到在我们指定的路径有一个子卷。我们可以限制输出在我们当前位置下面的子卷：

```

    $ sudo btrfs subvolume list -o .
    ID 259 gen 29 top level 256 path home/hartan/btrfs-subvolume-test/first

```

让我们重命名子卷：

```

    $ sudo mv first second
    $ sudo btrfs subvolume list -o .
    ID 259 gen 29 top level 256 path home/hartan/btrfs-subvolume-test/second

```

我们还可以嵌套子卷：

```

    $ sudo btrfs subvolume create second/third
    Create subvolume 'second/third'
    $ sudo btrfs subvolume list .
    ID 256 gen 34 top level 5 path home
    ID 257 gen 37 top level 5 path root
    ID 258 gen 25 top level 257 path root/var/lib/machines
    ID 259 gen 37 top level 256 path hartan/btrfs-subvolume-test/second
    ID 260 gen 37 top level 259 path hartan/btrfs-subvolume-test/second/third

```

我们也可以移除子卷，就像移除目录一样：

```

    $ sudo rm -r second/third

```

或者通过特殊的 Btrfs 命令：

```

    $ sudo btrfs subvolume delete second
    Delete subvolume (no-commit): '/home/hartan/btrfs-subvolume-test/second'

```

### 像单独的文件系统一样操作子卷

简介里说 Btrfs 子卷就好像单独的文件系统。这意味着我们可以挂载子卷并且传递一些挂载选项给它。我们先创建一个小的目录结构去更好的理解发生了什么：

```

    $ mkdir -p a a/1 a/1/b
    $ sudo btrfs subvolume create a/2
    Create subvolume 'a/2'
    $ sudo touch a/1/c a/1/b/d a/2/e

```

这就是目录结构的样子：

```

    $ tree
    .
    └── a
        ├── 1
        │   ├── b
        │   │   └── d
        │   └── c
        └── 2
            └── e

    4 directories, 3 files

```

验证现在这里有一个新的 Btrfs 子卷：

```

    $ sudo btrfs subvolume list -o .
    ID 261 gen 41 top level 256 path home/hartan/btrfs-subvolume-test/a/2

```

为了挂载子卷，我们必须知道 Btrfs 子卷所在的块设备路径。下面的命令会告诉我们：

```

    $ findmnt -vno SOURCE /home/
    /dev/vda3

```

现在我们挂载子卷。确保你将参数替换成你 PC 上的：

```

    $ sudo mount -o subvol=home/hartan/btrfs-subvolume-test/a/2 /dev/vda3 a/1/b

```

观察到我们使用 _-o_ 参数去提供额外的选项去挂载程序。在这里我们告诉它挂载在设备 _/dev/vda3_ 上 btrfs 文件系统里名为 _home/hartan/btrfs-subvolume-test/a/2_ 的子卷。这是 Btrfs 特有的选项，在其他文件系统里没有的。

我们可以看到目录结构变化了：

```

    $ tree
    .
    └── a
        ├── 1
        │   ├── b
        │   │   └── e
        │   └── c
        └── 2
            └── e

    4 directories, 3 files

```

现在文件 _e_ 出现了两次， _d_ 不见了。我们现在可以用两个不同的路径访问相同的 Btrfs 子卷。在一个路径的所有变化会被立刻反应在其他的位置：

```

    $ sudo touch a/1/b/x
    $ ls -lA a/2
    total 0
    -rw-r--r--. 1 root root 0 Oct 15 18:14 e
    -rw-r--r--. 1 root root 0 Oct 15 18:16 x

```

让我们尝试更多的挂载选项。例如我们可以像这样以只读方式挂载子卷到 _a/1/b_（插入你 PC 的参数）：

```

    $ sudo umount a/1/b
    $ sudo mount -o subvol=home/hartan/btrfs-subvolume-test/a/2,ro /dev/vda3 a/1/b

```

我们和上面使用相同的命令，除了我们加上了 _ro_ 在末尾。现在我们不能在这个挂载点上创建文件：

```

    $ sudo touch a/1/b/y
    touch: cannot touch 'a/1/b/y': Read-only file system

```

但直接访问子卷仍然像之前一样：

```

    $ sudo touch a/2/y
    $ tree
    .
    └── a
        ├── 1
        │   ├── b
        │   │   ├── e
        │   │   ├── x
        │   │   └── y
        │   └── c
        └── 2
            ├── e
            ├── x
            └── y

    4 directories, 7 files

```

在下一步之前不要忘记进行清理：

```

    $ sudo rm -rf a
    rm: cannot remove 'a/1/b/e': Read-only file system
    rm: cannot remove 'a/1/b/x': Read-only file system
    rm: cannot remove 'a/1/b/y': Read-only file system

```

天啊，发生了什么？噢，自从我们在上面挂载只读子卷，我们不能删除它。一次删除从文件系统的角度来看是一次写入操作：为了删除 **_a/2/b/e_**，我们从父目录 _**a/1/b**_ 的内容中删除目录项 _**e**_。换句话来说，我们必须 _写入_ _**a/1/b**_ 去表面 _**e**_ 不复存在。所以我们先卸载子卷，然后移除目录：

```

    $ sudo umount a/1/b
    $ sudo rm -rf a
    $ tree
    .

    0 directories, 0 files

```

### 子卷 ID ：

还记得 _subvolume list_ 命令的第一次输出吗？那包含了很多数字，让我们看看这些究竟什么。我在这里复制了输出，以便再次查看:

```

    ID 256 gen 30 top level 5 path home
    ID 257 gen 30 top level 5 path root
    ID 258 gen 25 top level 257 path root/var/lib/machines
    ID 259 gen 29 top level 256 path hartan/btrfs-subvolume-test/first

```

我们看到有三列数字，每个前面有一些字母来描述它们的作用。第一列是子卷 ID 。子卷 ID 在 Btrfs 文件系统是唯一的，而且唯一地标识子卷。这意味着名为 _home_ 的子卷也可以用它的 ID **256** 来引用。之前的挂载命令是这样写的：

```

    $ sudo mount -o subvol=hartan/...

```

另外一个完全合法的选择是使用子卷 ID ：

```

    $ sudo mount -o subvolid=...

```

子卷 ID 从 **256** 开始对于每个创建的子卷依次递增 1 。但是在这里有一个例外：文件系统的根总是有一个名为 _/_ 的子卷，并且子卷 ID 是 5 。没错，即使文件系统的根技术上也是一个子卷。这是不言而喻的，因此不会出现在 _btrfs subvolume_ 的输出列表里。如果你没有用 _subvol_ 和 _subvolid_ 参数去挂载一个 Btrfs 文件系统，_subvolid=5_ 的顶级子卷就是默认的挂载对象。下面我们会看到一个想要显式挂载文件系统根的例子。

第二列的数字是生成号，并且在每次 Btrfs 事务中递增。这几乎是一个内部的计数器，我们不会在这里讨论。

最后，第三列数字是 _父_ 子卷的子卷 ID。在上面的输出我们可以看到子卷 _home_ 和 _root_ 都有 5 作为它们的父子卷 ID。记住 ID 5 的特殊含义：这是文件系统的根。所以我们知道 _home_ 和 _root_ 都是顶级子卷的孩子。另一方面 _hartan/btrfs-subvolume-test.first_ 是子卷 ID 256 ，也就是 _home_ 的孩子。

在下一节我们会看看子卷 _root_ 和 _home_ 是怎么来的。

### 检查 Fedora Linux 的默认子卷

当你从头创建一个新的 Btrfs 文件系统，里面是没有子卷的（当然是除了顶级子卷）。所以 Fedora Linux 里的 _home_ 和 _root_ 子卷是哪里来的？

它们是安装器在安装时创建的。传统安装经常包括 _/_ 和 _/home_ 目录单独的文件系统分区。在启动时，它们通过恰当的挂载组成一个完整的文件系统。但这个方法有一个问题：除非你使用像 _lvm_ 这样的技术，想在将来改变分区的大小是非常难的。因而你可能出现 _/_ 或 _/home_ 用完空间的情况，然而还有很多其他没被使用的分区和空间剩余。

因为 Btrfs 子卷全都是相同文件系统的一部分，它们共享底层文件系统提供的空间。还记得我们在上面创建的子卷吗？我们从来不会告诉 Btrfs 它们多大：一个子卷可以占据文件系统拥有的全部空间，默认是不会阻止这种行为的。但是，我们 _可以_ 通过 Btrfs qgroups 动态地约束其大小，同时也可以在运行时修改（我们将在后续的文章中了解如何做的）。

另外一个分离 _/_ 和 _/home_ 的优势是我们可以分开进行 _快照_ 。一个子卷是一个快照的边界，对一个子卷的快照永远不会包含该子卷下面的其他子卷的内容。快照的更多细节会在后续的文章中介绍。

理论已经足够了！我们来看看这是怎么回事。首先确保你的根文件系统类型是 Btrfs ：

```

    $ findmnt -no FSTYPE /
    btrfs

```

然后我们获取它所在的分区：

```

    $ findmnt -vno SOURCE /
    /dev/vda3

```

记住我们可以通过子卷 ID 5 挂载文件系统的根（适应文件系统分区！）：

```

    $ mkdir fedora-rootsubvol
    $ sudo mount -o subvolid=5 /dev/vda3 ./fedora-rootsubvol
    $ ls fedora-rootsubvol/
    home  root

```

而且还有 Fedora Linux 安装的子卷！但 Fedora Linux 是如何知道子卷 _root_ 属于 _/_ ，而 _home_ 属于 _/home_ 的呢？

文件 _/etc/fstab_ 包含了文件系统的所谓静态信息。简而言之，在你系统启动的时候会一行一行地读取这个文件，然后挂载那里列出的所有文件系统。在我的系统上，这个文件长这样：

```

    $ cat /etc/fstab
    # [ ... ]
    # /etc/fstab
    # Created by anaconda on Sat Oct 15 12:01:57 2022
    # [ ... ]
    #
    UUID=5e4e42bb-4f2f-4f0e-895f-d1a46ea47807 /                       btrfs   subvol=root,compress=zstd:1 0 0
    UUID=e3a798a8-b8f2-40ca-9da7-5e292a6412aa /boot                   ext4    defaults        1 2
    UUID=5e4e42bb-4f2f-4f0e-895f-d1a46ea47807 /home                   btrfs   subvol=home,compress=zstd:1 0 0

```

(注意 “UUID” 行上面的内容被浓缩成两行)

每行开头的 _UUID_ 用于标识你系统上的硬盘和文件系统分区（大概相当于我在上面使用的 _/dev/vda3_ ）。第二列是文件系统应该挂载在文件系统树上的路径。第三列是文件系统类型。我们可以看到 _/_ 和 _/home_ 都是 _btrfs_ 类型，正如我们期望的那样！最后，第四列是：这些是挂载选项，这里说通过 _subvol=root_ 选项去挂载 _/_ 。这正是我们一直在 _btrfs subvolume list /_ 里看到的输出！

有了这些信息，我们可以重新构建创建这个文件系统项的 _挂载_ 命令

```

    $ sudo mount -o subvol=root,compress=zstd:1 UUID=5e4e42bb-4f2f-4f0e-895f-d1a46ea47807 /

```

```

    (again, the line above has been wrapped into two)

```

这就是 Fedora Linux 如何使用 Btrfs 子卷！如果你对好奇 Fedora Linux 为什么选择 Btrfs 作为默认的文件系统，请参阅下面链接的更改提议 [[1]][4]。

### Btrfs 子卷的更多内容

Btrfs wiki 有关于子卷的信息，还有最重要的能够应用到 Btrfs 子卷的挂载选项。有些选项，比如 _compress_ 只能应用到文件系统的层面因而影响一个 Btrfs 文件系统的所有子卷。你可以通过下面的链接找到entry [[2]][4]。

如果你对哪些目录是普通目录和哪些是子卷有困惑，你可以对你的子卷采用特殊的命名约定。例如，你可以给子卷名加上 ”@“ 前缀去方便区分。

现在你知道子卷表现得就像文件系统，有人可能会问如何最佳地在一个位置中放置子卷。比如你想要一个 Btrfs 子卷在 _~/games_ 下面，然而你的 home 目录 （ _~_ ）本身就是一个子卷，你如何实现？鉴于上面的例子，你可以使用像 _sudo btrfs subvolume create ~/games_ 的命令。这样，你创建了所谓的 _嵌套_ 子卷：在你的子卷 _~_ 里，有一个子卷 _games_ 。这正是一种达成目的的方法。

其他有效的方法就是如同 Fedora 默认行为那样：创建所有的子卷在顶级子卷下（也就是它们的父子卷 ID 是 5 ），然后挂载它们到特定的位置。Btrfs wiki 有这些方法的概述和对于各自文件系统管理影响的简短讨论 [[5]][4]。

### 结论

在本文中，我们探索了 Btrfs 子卷，它们像是 Btrfs 文件系统内部的独立的 Btrfs 文件系统。我们学习了如何创建、挂载和删除子卷。最后，我们探索了 Fedora Linux 是如何使用子卷的 - 我们却完全没有发现。

本系列的下一篇文章将讨论：

- 快照 - 回到过去
- 压缩 - 透明地节省存储空间
- 配额组 - 限制文件系统大小
- RAID - 替代 mdadm 配置



如果您还想了解与 Btrfs 相关的其他主题，请查看 Btrfs Wiki [[3]][4] 和文档 [[4]][4]。不要忘记查看本系列的第一篇文章（如果您还没有看过的话）！如果您认为本系列文章缺少了一些内容，请在下面的评论中告诉我们。再会！

### 参考资料

[1]: <https://fedoraproject.org/wiki/Changes/BtrfsByDefault#Benefit_to_Fedora>
[2]: <https://btrfs.readthedocs.io/en/latest/Subvolumes.html>
[3]: <https://btrfs.wiki.kernel.org/index.php/Main_Page>
[4]: <https://btrfs.readthedocs.io/en/latest/Introduction.html>
[5]: <https://btrfs.wiki.kernel.org/index.php/SysadminGuide#Layout>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-subvolumes/

作者：[Andreas Hartmann][a]
选题：[lujun9972][b]
译者：[A2ureStone](https://github.com/A2ureStone)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/working_w_btrfs_subvolumes-816x345.jpg
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: tmp.YC93jxHuAw#sources
