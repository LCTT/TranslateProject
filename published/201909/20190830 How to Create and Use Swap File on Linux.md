[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11341-1.html)
[#]: subject: (How to Create and Use Swap File on Linux)
[#]: via: (https://itsfoss.com/create-swap-file-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 上创建和使用交换文件
======

本教程讨论了 Linux 中交换文件的概念，为什么使用它以及它相对于传统交换分区的优势。你将学习如何创建交换文件和调整其大小。

### 什么是 Linux 的交换文件？

交换文件允许 Linux 将磁盘空间模拟为内存。当你的系统开始耗尽内存时，它会使用交换空间将内存的一些内容交换到磁盘空间上。这样释放了内存，为更重要的进程服务。当内存再次空闲时，它会从磁盘交换回数据。我建议[阅读这篇文章，了解 Linux 上的交换空间的更多内容][1]。

传统上，交换空间是磁盘上的一个独立分区。安装 Linux 时，只需创建一个单独的分区进行交换。但是这种趋势在最近几年发生了变化。

使用交换文件，你不再需要单独的分区。你会根目录下创建一个文件，并告诉你的系统将其用作交换空间就行了。

使用专用的交换分区，在许多情况下，调整交换空间的大小是一个可怕而不可能的任务。但是有了交换文件，你可以随意调整它们的大小。

最新版本的 Ubuntu 和其他一些 Linux 发行版已经开始 [默认使用交换文件][2]。甚至如果你没有创建交换分区，Ubuntu 也会自己创建一个 1GB 左右的交换文件。

让我们看看交换文件的更多信息。

![](https://img.linux.net.cn/data/attachment/album/201909/14/190637uggjgsjoogxg3vh0.jpg)

### 检查 Linux 的交换空间

在你开始添加交换空间之前，最好检查一下你的系统中是否已经有了交换空间。

你可以用[Linux 上的 free 命令][4]检查它。就我而言，我的[戴尔 XPS][5]有 14GB 的交换容量。

```
free -h
              total        used        free      shared  buff/cache   available
Mem:           7.5G        4.1G        267M        971M        3.1G        2.2G
Swap:           14G          0B         14G
```

`free` 命令给出了交换空间的大小，但它并没有告诉你它是真实的交换分区还是交换文件。`swapon` 命令在这方面会更好。

```
swapon --show
NAME           TYPE       SIZE USED PRIO
/dev/nvme0n1p4 partition 14.9G   0B   -2
```

如你所见，我有 14.9GB 的交换空间，它在一个单独的分区上。如果是交换文件，类型应该是 `file` 而不是 `partition`。

```
swapon --show
NAME      TYPE SIZE USED PRIO
/swapfile file   2G   0B   -2
```

如果你的系统上没有交换空间，它应该显示如下内容：

```
free -h
              total        used        free      shared  buff/cache   available
Mem:           7.5G        4.1G        267M        971M        3.1G        2.2G
Swap:           0B          0B         0B
```

而 `swapon` 命令不会显示任何输出。


### 在 Linux 上创建交换文件

如果你的系统没有交换空间，或者你认为交换空间不足，你可以在 Linux 上创建交换文件。你也可以创建多个交换文件。

让我们看看如何在 Linux 上创建交换文件。我在本教程中使用 Ubuntu 18.04，但它也应该适用于其他 Linux 发行版本。

#### 步骤 1：创建一个新的交换文件

首先，创建一个具有所需交换空间大小的文件。假设我想给我的系统增加 1GB 的交换空间。使用`fallocate` 命令创建大小为 1GB 的文件。

```
sudo fallocate -l 1G /swapfile
```

建议只允许 `root` 用户读写该交换文件。当你尝试将此文件用于交换区域时，你甚至会看到类似“不安全权限 0644，建议 0600”的警告。

```
sudo chmod 600 /swapfile
```

请注意，交换文件的名称可以是任意的。如果你需要多个交换空间，你可以给它任何合适的名称，如 `swap_file_1`、`swap_file_2` 等。它们只是一个预定义大小的文件。

#### 步骤 2：将新文件标记为交换空间

你需要告诉 Linux 系统该文件将被用作交换空间。你可以用 [mkswap][7] 工具做到这一点。

```
sudo mkswap /swapfile
```

你应该会看到这样的输出：

```
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=7e1faacb-ea93-4c49-a53d-fb40f3ce016a
```

#### 步骤 3：启用交换文件

现在，你的系统知道文件 `swapfile` 可以用作交换空间。但是还没有完成。你需要启用该交换文件，以便系统可以开始使用该文件作为交换。

```
sudo swapon /swapfile
```

现在，如果你检查交换空间，你应该会看到你的 Linux 系统会识别并使用它作为交换空间：

```
swapon --show
NAME       TYPE   SIZE USED PRIO
/swapfile  file 1024M   0B   -2
```

#### 步骤 4：让改变持久化

迄今为止你所做的一切都是暂时的。重新启动系统，所有更改都将消失。

你可以通过将新创建的交换文件添加到 `/etc/fstab` 文件来使更改持久化。

对 `/etc/fstab` 文件进行任何更改之前，最好先进行备份。

```
sudo cp /etc/fstab /etc/fstab.back
```

现在将以下行添加到 `/etc/fstab` 文件的末尾：

```
/swapfile none swap sw 0 0
```

你可以使用[命令行文本编辑器][8]手动操作，或者使用以下命令：

```
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

现在一切都准备好了。即使在重新启动你的 Linux 系统后，你的交换文件也会被使用。

### 调整 swappiness 参数

`swappiness` 参数决定了交换空间的使用频率。`swappiness` 值的范围从 0 到 100。较高的值意味着交换空间将被更频繁地使用。

Ubuntu 桌面的默认的 `swappiness` 是 60，而服务器的默认 `swappiness` 是 1。你可以使用以下命令检查 `swappiness`：

```
cat /proc/sys/vm/swappiness
```

为什么服务器应该使用低的 `swappiness` 值？因为交换空间比内存慢，为了获得更好的性能，应该尽可能多地使用内存。在服务器上，性能因素至关重要，因此 `swappiness` 应该尽可能低。

你可以使用以下系统命令动态更改 `swappiness`：

```
sudo sysctl vm.swappiness=25
```

这种改变只是暂时的。如果要使其永久化，可以编辑 `/etc/sysctl.conf` 文件，并在文件末尾添加`swappiness` 值:

```
vm.swappiness=25
```

### 在 Linux 上调整交换空间的大小

在 Linux 上有几种方法可以调整交换空间的大小。但是在你看到这一点之前，你应该了解一些关于它的事情。

当你要求系统停止将交换文件用于交换空间时，它会将所有数据（确切地说是内存页）传输回内存。所以你应该有足够的空闲内存，然后再停止交换。

这就是为什么创建和启用另一个临时交换文件是一个好的做法的原因。这样，当你关闭原来的交换空间时，你的系统将使用临时交换文件。现在你可以调整原来的交换空间的大小。你可以手动删除临时交换文件或留在那里，下次启动时会自动删除（LCTT 译注：存疑？）。

如果你有足够的可用内存或者创建了临时交换空间，那就关闭你原来的交换文件。

```
sudo swapoff /swapfile
```

现在你可以使用 `fallocate` 命令来更改文件的大小。比方说，你将其大小更改为 2GB:

```
sudo fallocate -l 2G /swapfile
```

现在再次将文件标记为交换空间：

```
sudo mkswap /swapfile
```

并再次启用交换文件：

```
sudo swapon /swapfile
```

你也可以选择同时拥有多个交换文件。

### 删除 Linux 中的交换文件

你可能有不在 Linux 上使用交换文件的原因。如果你想删除它，该过程类似于你刚才看到的调整交换大小的过程。

首先，确保你有足够的空闲内存。现在关闭交换文件：

```
sudo swapoff /swapfile
```

下一步是从 `/etc/fstab` 文件中删除相应的条目。

最后，你可以删除该文件来释放空间：

```
sudo rm /swapfile
```

### 你用了交换空间了吗？

我想你现在已经很好地理解了 Linux 中的交换文件概念。现在，你可以根据需要轻松创建交换文件或调整它们的大小。

如果你对这个话题有什么要补充的或者有任何疑问，请在下面留下评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-swap-file-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/swap-size/
[2]: https://help.ubuntu.com/community/SwapFaq
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/swap-file-linux.png?resize=800%2C450&ssl=1
[4]: https://linuxhandbook.com/free-command/
[5]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[6]: https://itsfoss.com/fix-missing-system-settings-ubuntu-1404-quick-tip/
[7]: http://man7.org/linux/man-pages/man8/mkswap.8.html
[8]: https://itsfoss.com/command-line-text-editors-linux/
[9]: https://itsfoss.com/replace-linux-from-dual-boot/
