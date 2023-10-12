[#]: subject: "Working with Btrfs – Snapshots"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-snapshots/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "A2ureStone"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Btrfs 详解：快照
======

![][1]

Photo by [Heliberto Arias][2] on [Unsplash][3]

这篇文章会探讨什么是 Btrfs 快照，它们如何工作的，你在日常生活中进行快照的好处。这篇文章是《Btrfs 详解》系列文章中的一篇。从 Fedora Linux 33 开始，Btrfs 就是 Fedora Workstation 和 Fedora Silverblue 的默认文件系统。

如果你错过了，这里是本系列的上一篇文章：<https://fedoramagazine.org/working-with-btrfs-subvolumes/>

### 简介

想象一下，你长时间处理一个文件，反复添加修改和撤销修改。然后，在某个时刻你意识到：两小时前你撤销的部分修改，现在会非常有用。而昨天在你毁掉那个设计之前，你也已经修改了这个特殊的部分。当然，由于你会定期保存文件，所以旧的改动会丢失。很多人可能都遇到过这样的情况。如果能恢复旧版本的文件，而无需定期手动复制，岂不美哉？

这是一个 Btrfs 快照可以帮助你的特别场景。当你使用正确的话，快照同时也为你的 PC 提供了很好的备份方案。

下面你会找到一些关于快照的例子。如果你想跟着操作，你必须拥有访问某些 Btrfs 文件系统的权限和 root 权限。你可以通过下面命令来验证一个目录的文件系统。


```

    $ findmnt -no FSTYPE /home
    btrfs

```

这个命令会输出你 _/home/_ 目录的文件系统名。如果它是 _btrfs_，那就可以了。让我们创建一个新的目录去做实验：

```

    $ mkdir ~/btrfs-snapshot-test
    $ cd ~/btrfs-snapshot-test

```

在下面的文本中，你会看到很多像上面显示的那样的命令输出框。请在阅读/比较命令输出时请记住，**框中的内容在行末会被换行**。这使得识别跨多行的长行变得困难，降低了可读性。如果有疑问，试着调整浏览器窗口的大小，看看文本的变化!


### Btrfs 快照

让我们从一个基本的问题开始：什么是 Btrfs 快照？如果你查看了文档 [[1]][4] 和 Wiki [[2]][4]，你不会立刻找到这个问题的答案。事实上，从“Features”一节里是找不到的。如果你搜索一下，你会发现快照和 Btrfs 子卷一起被大量地提及 [[3]][5]。所以现在做什么呢？

还记得快照在系列前面的文章里都被提到吗？是这样说的：

> CoW 的优势在哪里？简单的说：文件被修改和编辑的历史被保存了下来。Btrfs 保存文件旧版本的引用（inode）可以轻易地被访问。这个引用就是快照：文件系统在某个时间点的状态镜像。这将是这系列文章里的单独的一篇，所以暂时留到后面介绍。
>
> [Btrfs 详解：基础概念][6]

and also:

> 另外一个分离 `/` 和 `/home` 的优势是我们可以分别进行 _快照_ 。子卷是快照的边界，对一个子卷的快照永远不会包含该子卷下面的其他子卷的内容。快照的更多细节会在后续的文章中介绍。
>
> [Btrfs 详解：子卷][7]

看起来快照是和 Btrfs 子卷相关的。你可能之前在其他地方听到过快照，比如说 LVM ，逻辑卷管理器。虽然技术角度上它们都是为了同一个目的，但它们在实现方面有所不同。

每个 Btrfs 快照是一个子卷。但是，不是每个子卷都是一份快照。区别在于子卷里面包含的内容。一个快照是子卷加上一些内容：它包含对现在和过去版本的文件的引用（inodes）。让我们看看快照是从哪来的！

### 创建 Btrfs 快照

想使用快照功能，你需要一个 Btrfs 子卷来进行快照。让我们在测试目录（~/btrfs-snapshot-test）里创建一个：

```

    $ cd ~/btrfs-snapshot-test
    $ sudo btrfs subvolume create demo
    Create subvolume './demo'
    $ sudo chown -R $(id -u):$(id -g) demo/
    $ cd demo

```

因为Btrfs 子卷默认是被 root 所有的，你必须用 _chown_ 去修改子卷里的文件的所有权到普通用户上。现在我们在里面新加一些文件：

```

    $ touch foo bar baz
    $ echo "Lorem ipsum dolor sit amet, " > foo

```

你的目录现在看起来像这样：

```

    $ ls -l
    total 4
    -rw-r--r--. 1 hartan hartan  0 Dec 20 08:11 bar
    -rw-r--r--. 1 hartan hartan  0 Dec 20 08:11 baz
    -rw-r--r--. 1 hartan hartan 29 Dec 20 08:11 foo

```

让我们从这里创建第一次快照：

```

    $ cd ..
    $ sudo btrfs subvolume snapshot demo demo-1
    Create a snapshot of 'demo' in './demo-1'

```

这就好了。让我们看看发生了什么：

```

    $ ls -l
    total 0
    drwxr-xr-x. 1 hartan hartan 18 Dec 20 08:11 demo
    drwxr-xr-x. 1 hartan hartan 18 Dec 20 08:11 demo-1
    $ tree
    .
    ├── demo
    │   ├── bar
    │   ├── baz
    │   └── foo
    └── demo-1
        ├── bar
        ├── baz
        └── foo

    2 directories, 6 files

```

这看起来是一份拷贝！为了验证，我们从快照里读取 _foo_ 的内容：

```

    $ cat demo/foo
    Lorem ipsum dolor sit amet,
    $ cat demo-1/foo
    Lorem ipsum dolor sit amet,

```

当我们修改原始文件时，真正的效果变得明显：

```

    $ echo "consectetur adipiscing elit, " >> demo/foo
    $ cat demo/foo
    Lorem ipsum dolor sit amet,
    consectetur adipiscing elit,
    $ cat demo-1/foo
    Lorem ipsum dolor sit amet,

```

这表明快照仍然持有“旧”版本的数据： _foo_ 的内容没有改变。到目前为止，你可以通过一个简单的文件复制来实现完全相同的目标。现在你也可以继续处理旧文件了。

```

    $ echo "sed do eiusmod tempor incididunt" >> demo-1/foo
    $ cat demo-1/foo
    Lorem ipsum dolor sit amet,
    sed do eiusmod tempor incididunt

```

但是在底层，我们的快照实际上是一个新的 Btrfs 子卷。你可以通过下面的命令来验证这一点：

```

    $ sudo btrfs subvolume list -o .
    ID 259 gen 265 top level 256 path home/hartan/btrfs-snapshot-test/demo
    ID 260 gen 264 top level 256 path home/hartan/btrfs-snapshot-test/demo-1

```

### Btrfs 子卷 vs. 文件复制

这一切有什么意义呢？到目前为止快照看起来是一个更加复杂的方式去复制文件。事实上，快照不仅仅是表面上看起来那么简单。让我们来创建一个更大的文件：

```

    $ dd if=/dev/urandom of=demo/bigfile bs=1M count=512
    512+0 records in
    512+0 records out
    536870912 bytes (537 MB, 512 MiB) copied, 1.3454 s, 399 MB/s

```

现在有一个512 MB大小的新文件 _demo/bigfile_ 。让我们创建另一个快照，这样在你修改数据的时候就不会丢失：

```

    $ sudo btrfs subvolume snapshot demo demo-2
    Create a snapshot of 'demo' in './demo-2'

```

现在我们通过追加小字符串到文件来模拟变化：

```

    $ echo "small changes" >> demo/bigfile

```

这是生效后的文件结构：

```

    $ tree
    .
    ├── demo
    │   ├── bar
    │   ├── baz
    │   ├── bigfile
    │   └── foo
    ├── demo-1
    │   ├── bar
    │   ├── baz
    │   └── foo
    └── demo-2
        ├── bar
        ├── baz
        ├── bigfile
        └── foo

    3 directories, 11 files

```

但是真正的神奇的发生在其他地方。你已经复制了 _demo/bigfile_ ，你现在拥有了两个大约 512 MiB 的文件。但是，因为它们是不同的拷贝，它们应该会占据共 1 GiB 的空间。记住两个文件的差异不超过 10 Bytes —— 和原文件大小相比这几乎没什么差别。

Btrfs 快照工作原理与文件复制不同：而是它们保持对当前和过去的 inodes 的引用。当你在文件追加更新时，在底层 Btrfs 分配更多的空间去存储更新，同时在原来的 inode 增加对新数据的引用。之前的内容保持不变。如果这对你的心智模型有帮助，你可以认为这是仅仅“存储”原文件和修改版本的差异。

让我们看看这个效果：

```

    $ sudo compsize .
    Processed 11 files, 5 regular extents (9 refs), 3 inline.
    Type       Perc     Disk Usage   Uncompressed Referenced
    TOTAL      100%      512M         512M         1.0G
    none       100%      512M         512M         1.0G

```

这个有趣的数字出现在“TOTAL”一行：

  * “Referenced” 是当前目录下所有文件大小的总和
  * “Disk Usage” 是用于在磁盘上存储文件分配空间的大小



当你有一共 1 GiB 的文件，仅仅占据了 512 MiB去存储它们。

### Btrfs 快照和备份

目前为止，在这篇文章中，你已经看到如何创建 Btrfs 快照和它们的特别之处。有人可能会想：如果我在我的 PC 本地进行一系列的快照，我就有一个可靠的备份策略。 **其实不是这样的** 。如果 Btrfs 子卷共享的底层数据被偶然破坏了（被 Btrfs 之外的东西影响，比如宇宙射线），所有指向这些数据的子卷都会存在相同的错误。

为了让快照成为真正的备份，你应该将它们存储到一个不同的 Btrfs 系统上，例如在一个外部驱动器上。为了本文的目的，让我们在一个文件里创建一个新的 Btrfs 系统，并挂载它来模拟一个外部驱动。如果你有一个格式为 Btrfs 的外部驱动器，请随意替换以下命令中提到的所有路径来试试！让我们创建一个新的 Btrfs 文件系统：

**注意**：下面的命令会在你的文件系统上创建一个 8 GB 大小的新文件。如果你想跟着下面的步骤，请确保你的磁盘空间至少有 8 GB 剩余。请不要分配小于 8 GB 到这个文件，否则 Btrfs 可能在挂载时会遇到问题。

```

    $ truncate -s 8G btrfs_filesystem.img
    $ sudo mkfs.btrfs -L "backup-drive" btrfs_filesystem.img
    btrfs-progs v5.18
    See http://btrfs.wiki.kernel.org for more information.

    [ ... ]

    Devices:
       ID        SIZE  PATH
        1     8.00GiB  btrfs_filesystem.img

```

这些命令创建了名为 _btrfs_filesystem.img_ 的 8 GB 新文件，同时在上面格式化了一个 Btrfs 文件系统。现在你可以像外部驱动器一样挂载它：

```

    $ mkdir backup-drive
    $ sudo mount btrfs_filesystem.img backup-drive
    $ sudo chown -R $(id -u):$(id -g) backup-drive
    $ ls -lh
    total 4.7M
    drwxr-xr-x. 1 hartan hartan    0 Dec 20 08:35 backup-drive
    -rw-r--r--. 1 hartan hartan 8.0G Dec 20 08:37 btrfs_filesystem.img
    drwxr-xr-x. 1 hartan hartan   32 Dec 20 08:14 demo
    drwxr-xr-x. 1 hartan hartan   18 Dec 20 08:11 demo-1
    drwxr-xr-x. 1 hartan hartan   32 Dec 20 08:14 demo-2

```

妙，现在挂载在 _backup-drive_ 下面有一个独立的 Btrfs 文件系统！让我们尝试进行快照并且把快照放进去：

```

    $ sudo btrfs subvolume snapshot demo backup-drive/demo-3
    Create a snapshot of 'demo' in 'backup-drive/demo-3'
    ERROR: cannot snapshot 'demo': Invalid cross-device link

```

发生了什么？噢，你尝试对 _demo_ 进行一次快照并把它存在不同的 Btrfs 文件系统里（从 Btrfs 视角来看是一个不同的设备）。还记得一个 Btrfs 子卷仅持有对文件和内容的引用（inodes）？这正是问题所在：文件和内容存在于我们的 home 文件系统，但不在新创建的 _backup-drive_ 。你得找到一种方式去传输子卷和其内容到新的文件系统里。

#### 存储快照在不同的 Btrfs 文件系统

针对这个目的 Btrfs 工具有两个特殊的命令。让我们首先来看看它们是如何工作的：

```

    $ sudo btrfs send demo | sudo btrfs receive backup-drive/
    ERROR: subvolume /home/hartan/btrfs-snapshot-test/demo is not read-only
    ERROR: empty stream is not considered valid

```

另一个错误！这时它告诉你我们想要传输的子卷不是只读的。这是对的：你可以写入新内容到所有目前为止创建的快照/子卷。你可以像这样创建一个只读的快照：

```

    $ sudo btrfs subvolume snapshot -r demo demo-3-ro
    Create a readonly snapshot of 'demo' in './demo-3-ro'

```

不像之前那样，这里 _-r_ 选项被加到了 _snapshot_ 子命令里。这创建一个只读的快照，这很容易去验证：

```

    $ touch demo-3-ro/another-file
    touch: cannot touch 'demo-3-ro/another-file': Read-only file system

```

现在你可以重新尝试传输子卷：

```

    $ sudo btrfs send demo-3-ro | sudo btrfs receive backup-drive/
    At subvol demo-3-ro
    At subvol demo-3-ro
    $ tree

    ├── backup-drive
    │   └── demo-3-ro
    │       ├── bar
    │       ├── baz
    │       ├── bigfile
    │       └── foo
    ├── btrfs_filesystem.img
    ├── demo
    [ ... ]
    └── demo-3-ro
        ├── bar
        ├── baz
        ├── bigfile
        └── foo

    6 directories, 20 files

```

成功了！你成功传输原来子卷 _demo_ 的一个只读快照到一个外部的 Btrfs 文件系统。

#### 存储快照在非 Btrfs 文件系统

上面你已经看到你如何能存储 Btrfs 子卷/快照在其他的 Btrfs 文件系统。但如果你没有其他的 Btrfs 文件系统并且不能新创建一个，比如说外部驱动器需要一个和 Windows 或 MacOS 兼容的文件系统，你可以做什么呢？在这种情况下你可以存储子卷在文件里：

```

    $ sudo btrfs send -f demo-3-ro-subvolume.btrfs demo-3-ro
    At subvol demo-3-ro
    $ ls -lh demo-3-ro-subvolume.btrfs
    -rw-------. 1 root root 513M Dec 21 10:39 demo-3-ro-subvolume.btrfs

```

文件 _demo-3-ro-subvolume.btrfs_ 现在包含了随后重建 _demo-3-ro_ 子卷需要的所有东西。

#### 增量地发送快照

如果你重复执行这个操作对不同的子卷，你会发现在某些时间点不同的子卷不再共享它们的文件内容。这是因为像上面一样发送一个子卷，去重建这个单独的子卷的所有数据被传送到目标。但是，你可以引导 Btrfs 只向目标发送不同子卷的差异！所谓的增量发送将保证共享的引用在子卷中仍然共享。为了展示这一点，新增一些变动到我们原来的子卷：

```

    $ echo "a few more changes" >> demo/bigfile

```

然后创建另一个只读子卷：

```

    $ sudo btrfs subvolume snapshot -r demo demo-4-ro
    Create a readonly snapshot of 'demo' in './demo-4-ro'

```

然后现在发送它：

```

    $ sudo btrfs send -p demo-3-ro demo-4-ro | sudo btrfs receive backup-drive
    At subvol demo-4-ro
    At snapshot demo-4-ro

```

在上面的命令， _-p_ 选项指定了一个父子卷用来计算差异。重要的是记住原 Btrfs 文件系统和目标 Btrfs 文件系统都必须包含相同的，未被修改过的父子卷！确保新的子卷真的在那里：

```

    $ ls backup-drive/
    demo-3-ro  demo-4-ro
    $ ls -lR backup-drive/demo-4-ro/
    backup-drive/demo-4-ro/:
    total 524296
    -rw-r--r--. 1 hartan hartan         0 Dec 20 08:11 bar
    -rw-r--r--. 1 hartan hartan         0 Dec 20 08:11 baz
    -rw-r--r--. 1 hartan hartan 536870945 Dec 21 10:49 bigfile
    -rw-r--r--. 1 hartan hartan        59 Dec 20 08:13 foo

```

但你怎样知道增量发送只传输了子卷间的差异呢？让我们传输数据流到一个文件里然后看看它有多大：

```

    $ sudo btrfs send -f demo-4-ro-diff.btrfs -p demo-3-ro demo-4-ro
    At subvol demo-4-ro
    $ ls -l demo-4-ro-diff.btrfs
    -rw-------. 1 root root 315 Dec 21 10:55 demo-4-ro-diff.btrfs

```

根据 ls ，这个文件仅仅只有 315 bytes 大小！这意味着增量传输只传输子卷间的差异，和额外的 Btrfs 相关的元数据。

#### 从快照中恢复子卷

在继续之前，让我们清理掉这时候不再需要的东西：

```

    $ sudo rm -rf demo-4-ro-diff.btrfs demo-3-ro-subvolume.btrfs
    $ sudo btrfs subvolume delete demo-1 demo-2 demo-3-ro demo-4-ro
    $ ls -l
    total 531516
    drwxr-xr-x. 1 hartan hartan         36 Dec 21 10:50 backup-drive
    -rw-r--r--. 1 hartan hartan 8589934592 Dec 21 10:51 btrfs_filesystem.img
    drwxr-xr-x. 1 hartan hartan         32 Dec 20 08:14 demo

```

到目前为止你已经成功创建了读/写和只读的 Btrfs 子卷快照，并把它们发送到外部。但是，为了把这作为备份策略，还要有一种方式去发送子卷回原来的文件系统和让它们再次变为可写。出于这个目的，我们移动 demo 子卷到其他地方并且尝试从最近的快照中重建它。第一步：重命名为 “broken” 子卷。一旦恢复成功它会被删除：

```

    $ mv demo demo-broken

```

第二步: 传回最近的快照到这个文件系统：


```

    $ sudo btrfs send backup-drive/demo-4-ro | sudo btrfs receive .
    At subvol backup-drive/demo-4-ro
    At subvol demo-4-ro
    [hartan@fedora btrfs-snapshot-test]$ ls
    backup-drive  btrfs_filesystem.img  demo-4-ro  demo-broken

```

第三步: 从快照创建一个可读写的子卷：

```

    $ sudo btrfs subvolume snapshot demo-4-ro demo
    Create a snapshot of 'demo-4-ro' in './demo'
    $ ls
    backup-drive  btrfs_filesystem.img  demo  demo-4-ro  demo-broken

```

最后一步非常重要：你不能重命名 _demo-4-ro_ 为 _demo_ ，因为这仍然是一个只读子卷！最后你可以检查你所有你想要的东西是不是在那里：

```

    $ tree demo
    demo
    ├── bar
    ├── baz
    ├── bigfile
    └── foo

    0 directories, 4 files
    $ tail -c -19 demo/bigfile
    a few more changes

```

最后的命令告诉你 _bigfile_ 的最后 19 个字符实际上是上次变更执行的结果。这个时候，你可能想从 _demo-broken_ 复制最近的更新到新的 _demo_ 子卷。因为你没有执行任何更新，你可以过时的子卷：

```

    $ sudo btrfs subvolume delete demo-4-ro demo-broken
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo-4-ro'
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo-broken'

```

就是这样！你成功从一个之前存在不同 Btrfs 文件系统（外部介质）的快照中恢复 _demo_ 子卷。

### 子卷作为快照的边界

在系列的第二篇文章中我提到子卷作为快照的边界，但这到底是什么意思呢？简单来说，子卷的一份快照仅包含这个子卷的内容，而不是下面嵌套的子卷。让我们来看看这个：

```

    $ sudo btrfs subvolume create demo/nested
    Create subvolume 'demo/nested'
    $ sudo chown -R $(id -u):$(id -g) demo/nested
    $ touch demo/nested/another_file

```

让我们像以前一样进行一次快照：

```

    $ sudo btrfs subvolume snapshot demo demo-nested
    Create a snapshot of 'demo' in './demo-nested'

```

然后查看里面的内容：

```

    $ tree demo-nested
    demo-nested
    ├── bar
    ├── baz
    ├── bigfile
    ├── foo
    └── nested

    1 directory, 4 files

    $ tree demo
    demo
    ├── bar
    ├── baz
    ├── bigfile
    ├── foo
    └── nested
        └── another_file

    1 directory, 5 files

```

注意到 _another_file_ 不见了，仅仅是目录 _nested_ 还在。这是因为 _nested_ 是一个子卷：_demo_ 的快照包含嵌套子卷的目录（挂载点），但里面的内容是缺失的。目前没有方法递归地执行快照去包含嵌套子卷。但是，我们可以利用这个优势去从快照中排除一些目录！这通常对那些你容易再现的数据有用，或者它们很少变化。例子有虚拟机或者容器镜像，电影，游戏文件等等。

在总结之前，我们移除所有测试过程中创建的东西：

```

    $ sudo btrfs subvolume delete demo/nested demo demo-nested
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo/nested'
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo'
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo-nested'
    $ sudo umount backup-drive
    $ cd ..
    $ rm -rf btrfs-snapshot-test/

```

### 基于 Btrfs 备份最后思考

如果你决定使用 Btrfs 来执行数据的定期备份，那么你可能需要使用一个工具来自动完成这项任务。Btrfs wiki 有一个专门针对 Btrfs [[4]][4] 的备份工具列表。在那里，你还将看到另一个手动执行 Btrfs 备份步骤的摘要。就我个人而言，我对 _btrbk_ [[5]][4] 有很多很好的体验，我正在使用它来执行我自己的备份。除了备份之外，_btrbk_ 还可以在您的 PC 本地保存 Btrfs 快照列表。我使用它来防止意外的数据删除。

如果你想要了解更多有关使用 Btrfs 进行备份的内容，欢迎在下面评论，我会考虑写一篇专门讨论这个话题的后续文章。

### 总结

本文研究了 Btrfs 快照，它们本质上是 Btrfs 子卷。你了解了如何创建可读写和只读快照，以及这种机制如何有助于防止数据丢失。

本系列的后续文章将讨论:

- 压缩 - 透明地节省存储空间
- 配额组 - 限制文件系统大小
- RAID - 替代 mdadm 配置



如果您还想了解与 Btrfs 相关的其他主题，请查看 Btrfs Wiki [[2]][4] 和 Docs [[1]][4]。不要忘记查看本系列的前两篇文章！如果您认为本文缺少了一些内容，请在下面的评论中告诉我们。再会！

### 参考资料

[1]: <https://btrfs.readthedocs.io/en/latest/Introduction.html>
[2]: <https://btrfs.wiki.kernel.org/index.php/Main_Page>
[3]: <https://btrfs.readthedocs.io/en/latest/Subvolumes.html>
[4]: <https://btrfs.wiki.kernel.org/index.php/Incremental_Backup#Available_Backup_Tools>
[5]: <https://github.com/digint/btrbk>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-snapshots/

作者：[Andreas Hartmann][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/A2ureStone)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/working_w_btrfs_snapshots-816x345.jpg
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: tmp.9WKqfTWEhI#sources
[5]: https://btrfs.readthedocs.io/en/latest/Subvolumes.html
[6]: https://fedoramagazine.org/working-with-btrfs-general-concepts/
[7]: https://fedoramagazine.org/working-with-btrfs-subvolumes/
