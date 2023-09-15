[#]: subject: "How I use the attr command with my Linux filesystem"
[#]: via: "https://opensource.com/article/22/6/linux-attr-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "wznmickey"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16192-1.html"

在 Linux 文件系统中使用 attr 添加扩展属性
======

![][0]

> 我使用开源的 XFS 文件系统是为了其扩展属性带来的小小便利。扩展属性是一种为我的数据添加上下文的独特方式。

“文件系统” 是一个描述你的计算机怎样跟踪你创建的所有文件的完美词语。你的计算机存储有大量的数据，无论是文档、配置文件还是数以千计的照片。这需要一种对人和机器都友好的方式。诸如 Ext4、XFS、JFS、BtrFS 的文件系统是你的计算机用来跟踪文件的“语言”。

你的桌面或终端可以帮助你快速查找文件。例如，你的文件管理器可能有过滤功能，以便让你可以快速查看家目录内的图片，它也可能带有搜索功能以让你使用文件名定位文件。这些特性被称作*文件属性*，正如其名，它们是由文件头或者文件系统代码定义的文件对象的属性。大多数的文件系统记录了标准的文件属性，例如文件名、文件大小、文件类型、创建时间、上次访问时间等。

我在我的计算机上使用开源的 XFS 文件系统，不是为了其稳定性和高性能，而是为了其扩展属性带来的小小便利。

### 常见的文件属性

当你保存一个文件，文件相关的数据也会随同保存。常见的属性会告诉操作系统是否更新访问时间，什么时间同步数据到硬盘等逻辑细节。哪些属性被保存取决于底层文件系统的功能和特性。

在标准文件属性（如果有标准属性的话）之外，XFS、Ext4 和 BtrFS 文件系统都可以使用扩展属性。

### 扩展属性

XFS、Ext4 和 BtrFs 允许你创建自己的任意文件属性。由于是自己创建的，操作系统不会有内建支持，不过我以“标签”的方式使用它们，就像图片的 EXIF 数据一样。开发者们也许会选择使用扩展属性去开发应用内的自定义的功能。

XFS 中的属性有两个“命名空间”：用户（`user`）和根（`root`）。当创建属性时，你必须将其加入其中一个命名空间。要将属性添加到根命名空间，必须使用 `sudo` 命令或以 `root` 身份登录。

### 增加一个属性

你可以使用 `attr` 和 `setfattr` 命令在 XFS 文件系统中为文件增加属性。

`attr` 命令默认在 `user` 命名空间下进行，所以你只需要为属性设置一个名字（`-s`）和值（`-V`）。

```
$ attr -s flavor -V vanilla example.txt
Attribute "flavor" set to a 7 byte value for example.txt:
vanilla
```

`setfattr` 命令需要你指定目标命名空间：

```
$ setfattr --name user.flavor --value chocolate example.txt
```

### 列出扩展文件属性

使用 `attr` 或者 `getfattr` 命令可以看已添加到文件上的扩展属性。`attr` 命令默认使用 `user` 空间，使用 `-g` 以获取扩展属性：

```
$ attr -g flavor example.txt
Attribute "flavor" had a 9 byte value for example.txt:
chocolate
```

`getfattr` 命令需要属性的命名空间和名字：

```
$ getfattr --name user.flavor example.txt 
# file: example.txt
user.flavor="chocolate"
```

### 列出所有扩展属性

要看一个文件的所有扩展属性，你可以使用 `attr -l`：

```
$ attr -l example.txt
Attribute "md5sum" has a 32 byte value for example.txt
Attribute "flavor" has a 9 byte value for example.txt
```

或者，你也可以使用 `getfattr -d`：

```
$ getfattr -d example.txt
# file: example.txt
user.flavor="chocolate"
user.md5sum="969181e76237567018e14fe1448dfd11"
```

扩展文件属性可以使用 `attr` 和 `setfattr` 更新，就像你创建这些属性一样：

```
$ setfattr --name user.flavor --value strawberry example.txt

$ getfattr -d example.txt
# file: example.txt
user.flavor="strawberry"
user.md5sum="969181e76237567018e14fe1448dfd11"
```

### 其他文件系统上的属性

使用扩展属性最大的风险是忘记这些属性是特定于某个文件系统的。这意味着当你从一个磁盘或分区复制文件到另外一个磁盘或分区时，这些属性都会丢失，**即使**目标位置的文件系统也支持扩展属性。

为了避免丢失扩展属性，你需要使用支持保留这些属性的工具，例如 `rsync` 命令。

```
$ rsync --archive --xattrs ~/example.txt /tmp/
```

但无论你使用什么工具，如果你传输文件到一个不知道如何处理扩展属性的文件系统，这些属性都会被丢弃。

### 搜索属性

与扩展属性交互的机制并不多，所以使用这些添加的文件属性的方法也有限。我使用扩展属性作为标签机制，这让我可以将没有明显关系的文件联系起来。例如，假设我需要在一个项目中用“知识共享”的图形。假如我预见性地将 `license` 属性添加到了我的图形库中，我就可以使用 `find` 和 `getfattr` 在图形文件夹中寻找：

```
find ~/Graphics/ -type f \
    -exec getfattr \
    --name user.license \
    -m cc-by-sa {} \; 2>/dev/null

# file: /home/tux/Graphics/Linux/kde-eco-award.png
user.license="cc-by-sa"
user.md5sum="969181e76237567018e14fe1448dfd11"
```

### 文件系统的秘密

文件系统一般不会引起你的注意。它们实际是定义文件的系统。这不是计算机做的最让人兴奋的任务，也不是用户应该关心的东西。但是有些文件系统可以给你有趣、安全的特殊能力，扩展文件属性就是一个好例子。它的用途可能有限，但是扩展属性是你为数据增加上下文的独特方法。

*（题图：MJ/06c0c478-7af7-49e4-836b-a9923db9dc0c）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-attr-command

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[wznmickey](https://github.com/wznmickey)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/yearbook-haff-rx-linux-file-lead_0.png
[0]: https://img.linux.net.cn/data/attachment/album/202309/15/081240syst7uisttadnky6.jpg