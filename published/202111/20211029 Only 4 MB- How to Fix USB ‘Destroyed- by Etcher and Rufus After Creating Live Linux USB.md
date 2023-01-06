[#]: subject: "Only 4 MB? How to Fix USB ‘Destroyed’ by Etcher and Rufus After Creating Live Linux USB"
[#]: via: "https://itsfoss.com/format-live-linux-usb/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13961-1.html"

只有 4MB？如何修复 Etcher 和 Rufus 创建 Linux USB 后“破坏”的 USB
======

![](https://img.linux.net.cn/data/attachment/album/202111/07/165254zlhgz6an6vgpv2qd.jpg)

情况是这样的。你用 Etcher 或者 Rufus 工具在 Windows 或者 Linux 中创建了一个可启动的、Live Linux USB。

你用它来安装 Linux，USB 的目的已经达到了。现在你想格式化这个 USB，用它来进行常规的数据传输或存储。

你把它插入你的 Windows 系统，令你吃惊的是，这个 USB 的磁盘容量只有 4MB。

![][1]

你试图格式化它，但它可能不会让你这么做。即使你设法格式化它，USB 的大小现在也从通常的 8GB、16GB 或 32GB 缩减到只有 4MB。

你失去了你的 USB 吗？并非如此。你的 USB 并没有完全被破坏。你仍然可以用一个小技巧来格式化它，并舒适地使用它。

让我告诉你如何在 Windows 和 Linux 中把可启动的 USB 恢复到可用的状态。

### 格式化由 Rufus 或 Etcher 创建的 Live Linux USB （在 Windows 下）

你在 Windows 中看到只有 4MB 的磁盘空间。你知道为什么吗？因为在创建 Live Linux USB 时，该工具在 FAT32 文件系统中创建了一个 4MB 的 EFI 分区。其他的分区是在 Linux 的 Ext4 文件系统中，而这是不被 Windows 识别的。

这就是为什么你的 Windows 系统只看到 4MB 的 EFI 分区，并显示 USB 大小为 4MB。

![Windows only see the EFI partition on the USB][2]

总而言之，你需要做的是删除 USB 盘上的所有分区，用删除现有分区后得到的空闲空间创建一个新的 NTFS 或 FAT32 分区。这就行了。

让我展示一下详细的步骤。

#### 步骤 1：

进入 Windows 菜单，寻找“磁盘管理”工具。

![Start disk management tool][3]

启动这个工具，它将显示你电脑上存在的所有磁盘。当然，这包括插入的 USB。

**选择正确的磁盘是非常重要的**。从 U 盘的大小或“可移动”的标签中辨别出它是哪一个。

![][4]

#### 步骤 2：

我们的想法是删除 U 盘上的任何现有分区。未分配的空间不能被删除，但这也没关系。

在该分区上点击右键，然后点击“<ruby>删除卷<rt>Delete Volume</rt></ruby>”。

![Delete partitions on the USB disk][5]

当要求你确认时，按“<ruby>是<rt>Yes</rt></ruby>”。

![Confirm deletion of partition][6]

你的目标是只有一个未分配的空间块。当你看到它时，右击它并点击“<ruby>新建简单卷……<rt>New Simple Volume...</rt></ruby>”来创建一个分区。

![Create New Simple Volume \(partition\)][7]

接下来的步骤很简单。点击“<ruby>下一步<rt>Next &gt;</rt></ruby>”，选择整个可用空间，给它分配一个字母，选择文件系统（FAT32 或 NTFS），并将其格式化。

![Click Next][8]

![Use entire available space][9]

![Give it a drive letter][10]

![Use FAT 32 or NTFS, Name the USB if you want][11]

![Revise all the changes][12]

完成后，你会看到 USB 已经恢复到正常状态，你可以开始向它复制粘贴数据。

![USB is back to normal state][13]

你现在可以像以前一样使用你的 USB 了。

这些步骤是针对 Windows 的。如果你使用 Linux 呢？

### 在 Linux 上格式化 Live USB

我注意到，由 Etcher 和这类工具创建的 Live USB 经常拒绝被文件管理器中的右键格式化选项正确格式化。

除此之外，你可以像在 Windows 中那样做：删除现有的分区，用整个可用空间创建一个新的分区。

这里使用 GNOME “磁盘” 工具。它已经安装在 Ubuntu 和许多其他 Linux 发行版上。

![Start disk app][14]

**同样，确保你在这里选择了外部 USB 盘。**

你会看到 U 盘上的各种分区。试着从上面的菜单中格式化该磁盘。

![Format disk][15]

**如果这不起作用，逐个删除分区**，然后把整个 USB 作为自由空间。

当你创建了整个自由空间后，点击 “+” 号，在上面创建一个 NTFS 或 FAT32 文件系统的分区。

![][16]

用 NTFS（或 FAT32）创建分区，给它起个合适的名字，然后你就可以像以前一样使用这个 USB 了。

### 总结

像 Rufus 和 Etcher 这样的工具并没有真正破坏你的 USB。这就是它们的功能，通过在磁盘上创建一个不同的文件系统。但这样一来，Windows 操作系统就不能正确理解它。

好在只需付出一点努力就可以修复。我希望你也能够修复它。如果没有，请与我分享你的问题，我将尽力帮助你。

--------------------------------------------------------------------------------

via: https://itsfoss.com/format-live-linux-usb/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/usb-drive-4mb-space-only.webp?resize=800%2C324&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/mystery-behind-4-mb-linux-live-usb.webp?resize=800%2C400&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/start-disk-management-tool-windows.webp?resize=800%2C694&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/identify-usb-disk-in-windows.webp?resize=800%2C509&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/delete-partitions-on-usb-disk.webp?resize=800%2C464&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/confirm-deletion-of-partition.webp?resize=800%2C357&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/Create-New-Partition.webp?resize=800%2C471&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-1.png?resize=731%2C590&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-2.png?resize=735%2C589&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-3.png?resize=732%2C590&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-4.png?resize=669%2C527&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-5.png?resize=670%2C524&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/live-Linux-USB-formatted-successfully.webp?resize=800%2C571&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/start-disk-app.webp?resize=791%2C256&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/format-usb-in-disks-tool.webp?resize=800%2C434&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/create-partition-on-usb.webp?resize=800%2C418&ssl=1
