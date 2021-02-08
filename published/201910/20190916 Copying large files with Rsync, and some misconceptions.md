[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11415-1.html)
[#]: subject: (Copying large files with Rsync, and some misconceptions)
[#]: via: (https://fedoramagazine.org/copying-large-files-with-rsync-and-some-misconceptions/)
[#]: author: (Daniel Leite de Abreu https://fedoramagazine.org/author/dabreu/)

使用 rsync 复制大文件的一些误解
======

![][1]

有一种观点认为，在 IT 行业工作的许多人经常从网络帖子里复制和粘贴。我们都干过，复制粘贴本身不是问题。问题是当我们在不理解它们的情况下这样干。

几年前，一个曾经在我团队中工作的朋友需要将虚拟机模板从站点 A 复制到站点 B。他们无法理解为什么复制的文件在站点 A 上为 10GB，但是在站点 B 上却变为 100GB。

这位朋友认为 `rsync` 是一个神奇的工具，应该仅“同步”文件本身。但是，我们大多数人所忘记的是了解 `rsync` 的真正含义、用法，以及我认为最重要的是它原本是用来做什么的。本文提供了有关 `rsync` 的更多信息，并解释了那件事中发生了什么。

### 关于 rsync

`rsync` 是由 Andrew Tridgell 和 Paul Mackerras 创建的工具，其动机是以下问题：

假设你有两个文件，`file_A` 和 `file_B`。你希望将 `file_B` 更新为与 `file_A` 相同。显而易见的方法是将 `file_A` 复制到 `file_B`。

现在，假设这两个文件位于通过慢速通信链接（例如，拨号 IP 链接）连接的两个不同的服务器上。如果`file_A` 大，将其复制到 `file_B` 将会很慢，有时甚至是不可能完成的。为了提高效率，你可以在发送前压缩 `file_A`，但这通常只会获得 2 到 4 倍的效率提升。

现在假设 `file_A` 和 `file_B` 非常相似，并且为了加快处理速度，你可以利用这种相似性。一种常见的方法是仅通过链接发送 `file_A` 和 `file_B` 之间的差异，然后使用这个差异列表在远程端重建文件。

问题在于，用于在两个文件之间创建一组差异的常规方法依赖于能够读取两个文件。因此，它们要求链接的一端预先提供两个文件。如果它们在同一台计算机上不是同时可用的，则无法使用这些算法。（一旦将文件复制过来，就不需要做对比差异了）。而这是 `rsync` 解决的问题。

`rsync` 算法有效地计算源文件的哪些部分与现有目标文件的部分匹配。这样，匹配的部分就不需要通过链接发送了；所需要的只是对目标文件部分的引用。只有源文件中不匹配的部分才需要发送。

然后，接收者可以使用对现有目标文件各个部分的引用和原始素材来构造源文件的副本。

另外，可以使用一系列常用压缩算法中的任何一种来压缩发送到接收器的数据，以进一步提高速度。

我们都知道，`rsync` 算法以一种漂亮的方式解决了这个问题。

在 `rsync` 的介绍之后，回到那件事！

### 问题 1：自动精简配置

有两件事可以帮助那个朋友了解正在发生的事情。

该文件在其他地方的大小变得越来越大的问题是由源系统上启用了<ruby>自动精简配置<rt>Thin Provisioning</rt></ruby>（TP）引起的，这是一种优化存储区域网络（SAN）或网络连接存储（NAS）中可用空间效率的方法。

由于启用了 TP，源文件只有 10GB，并且在不使用任何其他配置的情况下使用 `rsync` 进行传输时，目标位置将接收到全部 100GB 的大小。`rsync` 无法自动完成该（TP）操作，必须对其进行配置。

进行此工作的选项是 `-S`（或 `–sparse`），它告诉 `rsync` 有效地处理稀疏文件。它会按照它说的做！它只会发送该稀疏数据，因此源和目标将有一个 10GB 的文件。

### 问题 2：更新文件

当发送一个更新的文件时会出现第二个问题。现在目标仅接收 10GB 了，但始终传输的是整个文件（包含虚拟磁盘），即使只是在该虚拟磁盘上更改了一个配置文件。换句话说，只是该文件的一小部分发生了更改。

用于此传输的命令是：

```
rsync -avS vmdk_file syncuser@host1:/destination
```

同样，了解 `rsync` 的工作方式也将有助于解决此问题。

上面是关于 `rsync` 的最大误解。我们许多人认为 `rsync` 只会发送文件的增量更新，并且只会自动更新需要更新的内容。**但这不是 `rsync` 的默认行为**。

如手册页所述，`rsync` 的默认行为是在目标位置创建文件的新副本，并在传输完成后将其移动到正确的位置。

要更改 `rsync` 的默认行为，你必须设置以下标志，然后 `rsync` 将仅发送增量：

```
--inplace               原地更新目标文件
--partial               保留部分传输的文件
--append                附加数据到更短的文件
--progress              在传输时显示进度条
```

因此，可以确切地执行我那个朋友想要的功能的完整命令是：

```
rsync -av --partial --inplace --append --progress vmdk_file syncuser@host1:/destination
```

注意，出于两个原因，这里必须删除稀疏选项 `-S`。首先是通过网络发送文件时，不能同时使用 `–sparse` 和 `–inplace`。其次，当你以前使用过 `–sparse` 发送文件时，就无法再使用 `–inplace` 进行更新。请注意，低于 3.1.3 的 `rsync` 版本将拒绝 `–sparse` 和 `–inplace` 的组合。

因此，即使那个朋友最终通过网络复制了 100GB，那也只需发生一次。以下所有更新仅复制差异，从而使复制非常高效。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/copying-large-files-with-rsync-and-some-misconceptions/

作者：[Daniel Leite de Abreu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dabreu/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/rsync-816x345.jpg
