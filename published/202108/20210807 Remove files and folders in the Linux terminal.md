[#]: subject: "Remove files and folders in the Linux terminal"
[#]: via: "https://opensource.com/article/21/8/remove-files-linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13687-1.html"

基础：在 Linux 终端中删除文件和文件夹
======

> 本教程讲述了如何在 Linux 终端中安全地删除文件和文件夹。

![](https://img.linux.net.cn/data/attachment/album/202108/16/110943z9boolgobdlyoiyo.jpg)

要想使用图形化界面删除计算机上的文件，你可能会直接将文件或文件夹拖拽到 “垃圾箱” 或 “回收站”。或者你也可以选择要删除的文件或文件夹，右键单击并选择 **删除**。

而在终端中删除文件或文件夹时并没有垃圾箱一说（至少默认情况下没有）。在图形化桌面上，`Trash`（即垃圾箱文件夹）是一个受保护的目录，保护机制可以防止用户不小心将该目录删除，或将其从默认位置移动从而导致找不到它。Trash 本质不过是一个被高度管理的文件夹，因此你可以创建自己的 Trash 文件夹以在终端中使用。

### 为终端设置一个垃圾箱

在家目录中创建一个名为 `Trash` 的目录：

```
$ mkdir ~/Trash
```

### 删除文件

要删除文件或文件夹时，使用 `mv` 命令将文件或文件夹移至 `Trash` 中：

```
$ mv example.txt ~/Trash
```

### 永久删除文件或文件夹

当你准备从系统中永久删除某个文件或文件夹时，可以使用 `rm` 命令清除垃圾箱文件夹中的所有数据。通过将 `rm` 命令指向星号（`*`），可以删除 `Trash` 文件夹内的所有文件和文件夹，而不会删除 `Trash` 文件夹本身。因为用户可以方便且自由地创建目录，所以即使不小心删除了 `Trash` 文件夹，你也可以再次新建一个。

```
$ rm --recursive ~/Trash/*
```

### 删除空目录

删除空目录有一个专门的命令 `rmdir`，它只能用来删除空目录，从而保护你免受递归删除错误的影响。

```
$ mkdir full
$ touch full/file.txt
$ rmdir full
rmdir: failed to remove 'full/': Directory not empty

$ mkdir empty
$ rmdir empty
```

### 更好的删除方式

此外还有一些并没有默认安装在终端上的 [删除文件命令][2]，你可以从软件库安装它们。这些命令管理和使用的 `Trash` 文件夹与你在桌面模式使用的是同一个（而非你自己单独创建的），从而使删除文件变得更加方便。

```
$ trash ~/example.txt
$ trash --list
example.txt
$ trash --empty
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/remove-files-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s10.svg_.png?itok=p07au80e (Removing files)
[2]: https://www.redhat.com/sysadmin/recover-file-deletion-linux
