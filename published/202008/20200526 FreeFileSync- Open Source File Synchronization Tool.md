[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12543-1.html)
[#]: subject: (FreeFileSync: Open Source File Synchronization Tool)
[#]: via: (https://itsfoss.com/freefilesync/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

FreeFileSync：开源的文件同步工具
======

> FreeFileSync 是一个开源的文件夹比较和同步工具，你可以使用它将数据备份到外部磁盘、云服务（如 Google Drive）或任何其他存储路径。

### FreeFileSync：一个免费且开源的同步工具

![](https://img.linux.net.cn/data/attachment/album/202008/23/060523ubx28vyi8qf8sv9d.jpg)

[FreeFileSync][2] 是一个令人印象深刻的开源工具，可以帮助你将数据备份到其他位置。

它们可以是外部 USB 磁盘、Google Drive 或使用 **SFTP 或 FTP** 连接到任何云存储。

你可能之前读过我们的[如何在 Linux 上使用 Google Drive][3] 的教程。不幸的是，没有合适的在 Linux 上原生使用 Google Drive 的 FOSS 方案。有个 [Insync][4]，但它是收费软件而非开源软件。

FreeFileSync 可使用 Google Drive 帐户同步文件。事实上，我用它把我的文件同步到 Google Drive 和一个单独的硬盘上。

### FreeFileSync 的功能

![][1]

尽管 FreeFileSync 的 UI 看起来可能很老，但它为普通用户和高级用户提供了许多有用的功能。

我将在此处把所有能重点介绍的功能都介绍出来：

  * 跨平台支持（Windows、macOS 和 Linux）
  * 同步前比较文件夹
  * 支持 Google Drive、[SFTP][6] 和 FTP 连接
  * 提供在不同的存储路径（或外部存储设备）上同步文件的能力
  * 多个可用的同步选项（从源更新文件到目标或镜像目标和源之间的文件）
  * 支持双向同步（如果目标文件夹或源文件夹有任何修改，将同步更改）
  * 适用于高级用户的版本控制
  * 可进行实时同步
  * 能安排批处理作业
  * 同步完成时通过电子邮件收到通知（付费）
  * 便携式版（付费）
  * 并行文件复制（付费）

如果你看一下它提供的功能，它不仅是普通的同步工具，而且还免费提供了更多功能。

此外，为了让你了解，你还可以在同步文件之前先比较它们。例如，你可以比较文件内容/文件时间，或者简单地比较源文件夹和目标文件夹的文件大小。

![][7]

你还有许多同步选项来镜像或更新数据。如下所示：

![][8]

但是，它也为你提供了捐赠密钥的可选选项，它可解锁一些特殊功能，如在同步完成时通过电子邮件通知你等。

以下是免费版本和付费版本的不同：

![][9]

因此，大多数基本功能是免费的。高级功能主要是针对高级用户，当然，如果你想支持他们也可以。（如果你觉得它有用，请这么做）。

此外，请注意，捐赠版单用户最多可在 3 台设备上使用。所以，这绝对不差！

### 在 Linux 上安装 FreeFileSync

你可以前往它的[官方下载页面][10]，并下载 Linux 的 tar.gz 文件。如果你喜欢，你还可以下载源码。

![][11]

接下来，你只需解压并运行可执行文件就可以了（如上图所示）

- [下载 FreeFileSync][2]

### 如何开始使用 FreeFileSync？

虽然我还没有成功地尝试过创建自动同步作业，但它很容易使用。

[官方文档][12]应该足以让你获得想要的。

但是，为了让你初步了解，这里有一些事情，你应该记住。

![][13]

如上面的截图所示，你只需选择源文件夹和要同步的目标文件夹。你可以选择本地文件夹或云存储位置。

完成后，你需要选择在同步中文件夹比较的类型（通常是文件时间和大小），在右侧，你可以调整要执行的同步类型。

#### FreeFileSync 的同步类型

当你选择 “更新” 的方式进行同步时，它只需将新数据从源文件夹复制到目标文件夹。因此，即使你从源文件夹中删除了某些东西，它也不会在目标文件夹中被删除。

如果你希望目标文件夹有相同的文件副本，可以选择 “镜像”同步方式。这样，如果你从源文件夹中删除内容，它就会从目标文件夹中删除。

还有一个 “双向” 同步方式，它检测源文件夹和目标文件夹的更改（而不是只监视源文件夹）。因此，如果对源/目标文件夹进行了任何更改，都将同步修改。

有关更高级的用法，我建议你参考[文档][12]。

### 总结

还有一个[开源文件同步工具是 Syncthing][14]，你可能想要看看。

FreeFileSync 是一个相当被低估的文件夹比较和同步工具，适用于使用 Google Drive、SFTP 或 FTP 连接以及单独的存储位置进行备份的 Linux 用户。

而且，所有这些功能都免费提供对 Windows、macOS 和 Linux 的跨平台支持。

这难道不令人兴奋吗？请在下面的评论，让我知道你对 Freefilesync 的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/freefilesync/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/free-file-sync.jpg?ssl=1
[2]: https://freefilesync.org/
[3]: https://itsfoss.com/use-google-drive-linux/
[4]: https://itsfoss.com/recommends/insync/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/FreeFileSync.jpg?ssl=1
[6]: https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-comparison.png?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-synchronization.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/free-file-sync-donation-edition.jpg?ssl=1
[10]: https://freefilesync.org/download.php
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-run.jpg?ssl=1
[12]: https://freefilesync.org/manual.php
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/freefilesync-tips.jpg?ssl=1
[14]: https://itsfoss.com/syncthing/
